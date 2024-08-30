//■グラフィック関連の実行部群
#inc_start
	#define	@bup_prm_init	$bup_layer.init	$bup_stock.init		//バストアップのレイヤ値補正・ストックを初期化
#inc_end

#Z00

command	$$BG_disp(	//@BG	実行部分
	property $BGname	:str,
	property $wipe_no	:int,
	property $time		:int,
	property $bup_mode	:int
)
{
	$bup_layer.init		//バストアップのレイヤ値補正・ストックを初期化
	$bup_stock.init		
	$BG_FILE = $BGname

	//ウィンドウ制御ワンタイムフラグに値が入っていたらウインドウ閉じない
	IF($WC==0){	close	} $WC=0		//ウィンドウ制御ワンタイムフラグ初期化

	back.object[<O_BG>].create($BG_FILE,1)
	IF($wipe_no == <SET>){return}	//ワイプ番号が準備指定(999)の時はここで戻る。

	//裏に待機中の背景に一括でトーンカーブ効果をかける
	if($SEPIA == 1){	back.object[<O_BG>].tonecurve_no = <TC_SEPIA>		//セピア指定時はセピア優先でトーンカーブかける
	}else{				back.object[<O_BG>].tonecurve_no = $BG_TC		}

	back.object[<O_BG>].wipe_copy = 1
	$$wipe_prm_set($wipe_no,<WIPE_BG>,$time)	//表示フルパラメタセット
	$$wipe_copy_set(0)	//バストアップ類のワイプコピーフラグを全クリア
	$$WIPE_EXEC(1)
	$$wipe_prm_clr			//表示フルパラメタクリア
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$CG_disp(	//@CG @CUTIN 共用実行部分
	property $cg_name	:str,
	property $wipe_no	:int,
	property $obj_no	:int	//使用オブジェクトを引数にした
)
{
	$bup_layer.init		//バストアップのレイヤ値補正・ストックを初期化
	$bup_stock.init		
	$$wipe_copy_set(0)	//バストアップ類のワイプコピーフラグを全クリア
	$CG_FILE = $CG_name

	IF($WC==0){	close	} $WC=0		//ウィンドウ制御ワンタイムフラグ

	back.object[$obj_no].create($CG_FILE,1,0,0,0)
	$$wipe_prm_set($wipe_no,<WIPE_CG>,0)	//表示フルパラメタセット

	if($obj_no >= 50){	//@CUTIN のときは背景・バストアップ・ＣＧのワイプコピーをオン
		$$wipecopy_range(00,49)	
	}
	$$WIPE_EXEC(1)				//表示実行マクロ	１=ワイプ終了強制待ち
	$$wipe_prm_clr				//表示フルパラメタクリア

	//キー待ち制御ワンタイムフラグに値が入っていたらキー待ち
	//##キー待ち制御を一旦カットしました。初期値を待たない扱いにしたほうがよい…？ 2022_0714
	//IF($WR == 0){	close R	} $WR=0		//キー待ち制御ワンタイムフラグ初期化
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z09	//@TIME_FADEの時にはここにきて、#z10ラベル後のRETURNで戻る
	//@TIME_FADE(@WIPE(0),@close(0),@TIME(<TW_TIME>))
//	farcall(_00grp, 09, @WIPE, @close, @TIME,  000,  000,  000)
//				        L[00], L[01],  L[02], L[03],L[04],L[05]
	bgm.stop(1800)	//ＢＧＭをフェードアウト（経過時間で）
	pcmch[0].stop(500)		//500msecフェードで決め打ち
	pcmch[1].stop(500)		//500msecフェードで決め打ち
	pcmch[2].stop(500)		//500msecフェードで決め打ち

	pcmch[5].stop(500)		//500msecフェードで決め打ち	ループＳＥ用専用チャンネルも停止

	pcmch[1].wait_fade_key			// 決定キーでスキップできる
	pcm.stop
	close	//@time_fadeはメッセージウィンドウ強制クローズ
	L[10]=L[02]

#Z10	//各色フェード実行部分。引数に与えるＲＧＢ値で色を変える
//	farcall(_00grp, 10, @WIPE, @close, @TIME,  000,  000,  000)
//				        L[00], L[01],  L[02], L[03],L[04],L[05]

//	$BT_MODE=0	//@BUP_TIME用判別変数
//	@bup_prm_init	//バストアップのレイヤ値補正・ストックを初期化

	//##メッセージウインドウをどう扱うのかのコア部分
	IF($OT_WC != 0){L[01] = $OT_WC }	// $OT_WC がセットされていれば引数より優先。
	SWITCH(L[01]){					//ここで引数と $OT_WC が同期する。
		case(0)	$OT_WC=0	close	//※デフォルト値
		case(1)	$OT_WC=1			//ウインドウクローズの指定が0のときのみウインドウ閉じる
		case(2)	$OT_WC=2			//ウインドウを閉じない。＝何もしない
		case(3)	$OT_WC=3			//ウインドウごとワイプ。$OT_WC をワイプ時に参照するのでここでは何もしない。
	}	//##ココマデ
	
	$$wipe_copy_set(0)						//バストアップ類のワイプコピーフラグを全クリア
	back.object[<O_EFF>].create_rect(000,000,<SCREEN_WIDTH>,<SCREEN_HEIGHT>,L[03],L[04],L[05],255,1)	//画面サイズには留意すること。

	$$wipe_prm_set(L[00],<WIPE_BG>,L[02])	//表示フルパラメタセット	ワイプ番号・ワイプ速度(高速 とか)・ワイプ時間
	$W_prm[11]=500	//レイヤ値を上げて、メッセージウィンドウごとワイプさせる
	$$WIPE_EXEC(1)			//表示実行マクロ	１=ワイプ終了強制待ち
	$$wipe_prm_clr			//表示フルパラメタクリア

	wait_wipe		//ワイプ終了待ち
	IF(bgm.check == 2){	//ＢＧＭがフェード中ならフェードアウト待ち
		bgm.wait_fade_key
	}
	timewait(L[10])	// #Z09からの@TIME_FADE呼び出しであれば、L[10]に待ち時間が入っているはず
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##$$wipe_prm_set でセットされたフルパラメータを使ってワイプ実行。
command $$WIPE_EXEC( property $WIPE_wait_prm :int )
{
	IF($OT_WC==3){ $W_prm[11] = 300 }else{ $W_prm[11] = 0 }	//ワイプオーダーの上限を変更
	if($MASK_WIPE!=""){
		mask_wipe(
			$MASK_WIPE,
			wait=		$WIPE_wait_prm,			//ワイプ終了待ち指定
			type=		$W_prm[00],				//ワイプ番号
			time=		$W_prm[01],				//ワイプ時間指定
			speed_mode=	$W_prm[02],				//ワイプ速度指定
			start_order=0,						//ワイプのオーダー範囲（下限）
			end_order=	$W_prm[11],				//ワイプのオーダー範囲（上限）
			option=[$W_prm[03],$W_prm[04],$W_prm[05],$W_prm[06],$W_prm[07]]		//その他ワイプ別パラメタ
		)
	}else{
		wipe(
			wait=		$WIPE_wait_prm,			//ワイプ終了待ち指定
			type=		$W_prm[00],				//ワイプ番号
			time=		$W_prm[01],				//ワイプ時間指定
			speed_mode=	$W_prm[02],				//ワイプ速度指定
			start_order=0,						//ワイプのオーダー範囲（下限）
			end_order=	$W_prm[11],				//ワイプのオーダー範囲（上限）
			option=[$W_prm[03],$W_prm[04],$W_prm[05],$W_prm[06],$W_prm[07],$W_prm[08],$W_prm[09],$W_prm[10]]		//その他ワイプ別パラメタ
		)
	}
	$wipe_ready = 0		//ワイプ準備フラグを初期化
	$wipe_set_time = 0	//ワイプ時間強制指定フラグを初期化
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##オブジェクトの色を引数で一気に変えるコマンド
command $$obj_rgb(
	property $obj	:object,
	property $R		:int,
	property $G		:int,
	property $B		:int,
	property $rate	:int
	)
{
	$obj.color_r = $R
	$obj.color_g = $G
	$obj.color_b = $B
	$obj.color_rate = $rate
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$fullCG_LOAD(	//ＣＧ読み込み部を一元化したルーチン。
	property $obj	: object
)
{
	$obj.init				//■■表示用オブジェクト初期化
	$obj.disp = 1			//表示オン

	//ファイルネーム構築等せずに単体読み込みをする
	$obj.create($CG_FILE,1,0,0,0)	//単体画像読み込み
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$wipecopy_range(	//オブジェクト番号を範囲指定して、表に存在するもののみ裏にコピー
	property $o_start	:int,
	property $o_end		:int
)
{
	for($tmp[01] = $o_start , $tmp[01] <= $o_end , $tmp[01] += 1 ){
		$tmp[00] = front.object[$tmp[01]].exist_type
		if($tmp[00] == 1){
			front.object[$tmp[01]].wipe_copy = 1
		}
	}
	return
}

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##オブジェクトのロードと同時にボタンの設定も済ます画期的なマクロ
command	$$OBJBTN_SET(
	property $obj : object,
	property $filename : str,
	property $DISP,
	property $X,
	property $Y,
	property $TR,
	property $group,
	property $btn_no,
	property $action,
	property $se,
	property $Pushkeep,
	property $btn_mode,
	property $alpha
	)
	{
		$obj.create($filename,$DISP,$X,$Y)			//オブジェクト読み込み
		$obj.TR = $TR								//オブジェクト読み込み
		$obj.set_button($btn_no,$group,$action,$se)	//ボタン化
		$obj.set_button_pushkeep($Pushkeep)			//スライダ類などはここのキープスイッチをオンにすること
		switch($btn_mode){	//ボタン状態の設定
			case(0)	$obj.set_button_state_normal
			case(1)	$obj.set_button_state_select
			case(2)	$obj.set_button_state_disable
		}
		$obj.set_button_alpha_test($alpha)	// 1= 透過部分無視
	}
//			↓テンプレ
//	$$OBJBTN_SET(obj,filename,Disp,X,Y,Tr,group,btn_no,action,SE,PushKeep,Btn_mode)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//ＣＧモード用　連続表示コマンド　13枚まで対応
command $$CG_views(	//ＣＧ連速表示コマンド
	property $CG00 :str,
	property $CG01 :str,
	property $CG02 :str,
	property $CG03 :str,
	property $CG04 :str,
	property $CG05 :str,
	property $CG06 :str,
	property $CG07 :str,
	property $CG08 :str,
	property $CG09 :str,
	property $CG10 :str,
	property $CG11 :str,
	property $CG12 :str
	)
{
	property $ctmp :intlist[10]
	property $sctmp :strlist[20]
	property $file :str

	$sctmp[00] = $CG00
	$sctmp[01] = $CG01
	$sctmp[02] = $CG02
	$sctmp[03] = $CG03
	$sctmp[04] = $CG04
	$sctmp[05] = $CG05
	$sctmp[06] = $CG06
	$sctmp[07] = $CG07
	$sctmp[08] = $CG08
	$sctmp[09] = $CG09
	$sctmp[10] = $CG10
	$sctmp[11] = $CG11
	$sctmp[12] = $CG12

	while(1){//枚数カウントループ
		if( $sctmp[ $ctmp[00] ] == "" ){break}
		$ctmp[00] +=1
	}

	while($ctmp[01] < $ctmp[00]){	//ＣＧ表示ループ

		$file = $sctmp[$ctmp[01]]
		//差分の個別特殊処理
		if($file =="cg_ts88_01" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts88_02" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_01" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_02" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_03" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_04" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="bg02")			{$ctmp[03] = 01}
		if($file =="bg09")			{$ctmp[03] = 02}
		if($file =="bg09N")			{$ctmp[03] = 02}
		if($file =="bg43")			{$ctmp[03] = 03}
		if($file =="bg43_03")		{$ctmp[03] = 03}
		if($file =="bg44")			{$ctmp[03] = 03}
		if($file =="bg44_03")		{$ctmp[03] = 03}
		if($file =="bg53")			{$ctmp[03] = 04}
		if($file =="bg76")			{$ctmp[03] = 05}
		if($file =="bg78")			{$ctmp[03] = 06}

		switch($ctmp[03]){	//ファイル読み込み処理
			case(01)	$$obj_combine("bg02",0,0000,0000, 1,0000,1080)
			case(04)	$$obj_combine("bg53",0,0000,0000, 1,0000,1350)
			case(06)	$$obj_combine("bg78",0,0000,0000, 1,1440,0000)
			default		front.object[41].create($file,0,000,000)	//連結処理不要の場合
		}
		front.object[41].tr = 00
		front.object[41].disp = 01
		front.object[41].tr_eve.set(255, 300, 0, 1)
		front.object[41].tr_eve.wait
		front.object[40].init	//表示し終えたら前の画像をクリア

		switch($ctmp[03]){	//必要なものはスクロール演出
			case(01)		front.object[41].y_eve.set(-1080, 2200, 400, 0)	front.object[41].y_eve.wait	//BG02
			case(02)		front.object[41].y_eve.set( -627, 1500, 400, 0)	front.object[41].y_eve.wait	//BG09 BG09N
			case(03)		front.object[41].y_eve.set( -307, 1000, 400, 0)	front.object[41].y_eve.wait	//BG43 BG43_03 BG44 BG44_03
			case(04)		front.object[41].y_eve.set(-1620, 2500, 400, 0)	front.object[41].y_eve.wait	//BG53
			case(05)		front.object[41].y_eve.set( -540, 1000, 400, 0)	front.object[41].y_eve.wait	//BG76
			case(06)		front.object[41].x_eve.set( -960, 2000, 400, 0)	front.object[41].x_eve.wait	//BG78	//■横スクロール
		}
		$ctmp[03]=00

		while(1){	//選択用ループ
			if(input.decide.on_down_up == 1){ break }				//決定キーで次へ。
			if(input.cancel.on_down_up == 1){  $ctmp[02]=1 break }	//キャンセルキーで抜け
			input.next
			disp
		}
		front.object[40].create_copy_from(front.object[41])	//現行の画像を下にコピー
		if($ctmp[02] ==1 ){$ctmp[02]=0 break}	//キャンセルキーでの抜け動作
		$ctmp[01] +=1
	}
	//抜け処理
	front.object[41].init
	front.object[40].tr_eve.set(000, 200, 0, 2)
	front.object[40].tr_eve.wait
	front.object[40].init
	return
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//オブジェクトに子を作り、パターンをずらして配置するコマンド。いずれ汎用化させたい。
command	$$obj_combine(
	property $file	:str,
	property $pat0no:int,
	property $pat0x	:int,
	property $pat0y	:int,
	property $pat1no:int,
	property $pat1x	:int,
	property $pat1y	:int
	)
{
	$$create_child(front.object[41],0,2)	//子作り
	front.object[41].child[00].create($file,1,$pat0x,$pat0y,$pat0no)
	front.object[41].child[01].create($file,1,$pat1x,$pat1y,$pat1no)
	return
}




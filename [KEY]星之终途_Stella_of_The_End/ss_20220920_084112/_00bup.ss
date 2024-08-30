//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//	バストアップマクロ群	実行部
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#inc_start

	#property $chrlist : intlist[6]	// バストアップ同時表示・操作用の配列

#inc_end


//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z00	//@bup実行部	//コマンド化予定。

	$bup_com = L[01]							//呼び出し元コマンドのストック
	$bup_spec = $$filename_chk(K[00])		//省略状態からの展開・キャラ番号取得・バストアップ指定補正・単体存在確認

	IF($BG_FILE == ""){$BG_FILE="_black"}
	//##呼び出し元コマンドによるＸ座標自動代入
	SWITCH($bup_com){		//L[01]で判別→L[02]に表示先Ｘ座標を代入。
		CASE(00)	L[02] = <POS_C>	$CHR_C = $bup_spec	// 400	//表情切り替え or 中央表示
		CASE(01)	// $bup_px に表示Ｘ座標が入った状態で来る
		CASE(06)	L[02] = 000	 $bup_layer[$chr_num]=0	$bup_stock[$chr_num]="" goto #set_ok	//キャラ別消去時。指定処理とか跳ばす。
		CASE(50)	// 指定Ｘ座標表示(L[02]には既に値が入っているため何もしない)
		default		/*想定外のバストアップコマンドです R*/ close return
	}
	IF($bup_com != 50){
		L[03]=<POS_Y>	//座標直接指定コマンド系でなければ、Ｙ座標は基本値（200）
	}
	$bup_py = L[03]	
	IF((front.object[$chr_num].exist_type == 1)&&($bup_com == 0)){	//既に存在している＆BUPコマンド　だったら座標上書き
		$bup_px = front.object[$chr_num].x	
		$bup_py = front.object[$chr_num].y
	}	
	IF((front.object[$chr_num].child.get_size != 0)&&($bup_com) == 0){	//## @BUPで呼ばれて、キャラが既にいるとき。
		back.object[$chr_num].create_copy_from(front.object[$chr_num])	//オブジェクトを裏へコピー（座標引継ぎの為）
	}else{															//## @BUPで呼ばれて、キャラが居ないとき。
		$$create_child(back.object[$chr_num],1,6)					//子ブジェクト作成
		back.object[$chr_num].set_pos($bup_px,$bup_py)				// Ｘ座標は直前のcase文で与えられたものから。
	
	}

	$$bup_set(0,1)	//バストアップの読み込み
	#set_ok		//##■ファイルの準備ができたらここに来る
	
	back.object[$chr_num].wipe_copy = 1		// k-takahashi 裏画面時にセットされた時点でwipe_copy立てました
	
	front.object[$chr_num].wipe_copy = 0	//ワイプコピーフラグをオフ（何か変更加えたよ  の意）

	IF(L[00]!=999){		//ワイプ番号指定が999のとき以外はここで表示処理
		//##■■bg(xxx,999)のあと呼ばれたときに事前準備無視されない？フィルタとか。
		//##■■BGの表にオブジェクトが無かったらそのまま無視する動作？
		//##■■　逆に、BGの裏に何か構築されてたらお察ししてノータッチスルーのほうがシュっとしてるかも。
		front.object[<O_BG>].wipe_copy =1

//##表示時のキー待ちを一旦カット
//##		IF($WR==0){	close	}	//キー待ち制御ワンタイムフラグに値が入っていたら
		$$BUP_DISP(L[00])		//バストアップ表示処理。L[00]はワイプ番号　背景の引継ぎとかトーンカーブ化とか含む
		//キー待ち制御ワンタイムフラグに値が入っていたらキー待ち
//##		IF($WR==0){	R	} $WR=0		//キー待ち制御ワンタイムフラグ初期化

	}
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z01	//バストアップ消去

//準備作業の時は $wipe_ready != 0

	IF(k[00] == "all"){
		front.object[<O_BG>].wipe_copy = 1
	}else{
		$bup_spec = $$filename_chk(K[00])
		
		
	}



	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$bup_set(
	property $c_stage : int ,
	property $c_wipe : int 
	)
{
	$bup_load = $bup_spec
	$bup_load =  $$system_bs_file($bup_spec)	//服装指定対応のファイル名構築コマンド
	stage[$c_stage].object[$chr_num].create($bup_load,1,$bup_px,$bup_py)
//	IF($bup_layer[$chr_num]==0){	//レイヤ値の変更が既にされていた場合はスルーさせる仕組み  k-takahashi不都合出る部分あるのでコメントアウトしています
		$bup_layer[$chr_num] = $$set_layer($chr_num)
//	}
	stage[$c_stage].object[$chr_num].layer = $bup_layer[$chr_num]

	switch($bup_spec.mid( 0,2)){	//キャラの補正座標をセット
		case("BS")	FARCALL("_00bupSub",111)	//通常
		case("BU")	FARCALL("_00bupSub",112)	//近接
		case("BW")	FARCALL("_00bupSub",113)	//超接
	}

	return
}
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$system_bs_file(property $bup_name : str) : str
{
	property $distance : str
	property $chara : str
	property $face : str
	property $load : strlist[10]
	property $filename : str
	property $dress :int

	if( $bup_name.left(2) == "BS" ) {
		$distance = "bs1"
	}
	elseif( $bup_name.left(2) == "BU" ) {
		$distance = "bs2"
	}
	elseif( $bup_name.left(2) == "BW" ) {
		$distance = "bs3"
	}
	$chara = $bup_name.mid(3, 2)
	$face = $bup_name.right(2)
	$dress = $DR[$$chr2num($chara)]
	$dress = math.limit(01, $dress, 99)	//服装番号= 01～99

	$load[00] = $distance + "_" + $chara	//BU_PH
	$load[01] = $load[00] + math.tostr_zero($dress, 2) + "_base01"
	$load[02] = $load[00] + "_f01_" + $face
	$filename = $load[01] + " | " + $load[02]
	
	$load[03] = $$bup_ex($$chr2num($chara),$dress)	//キャラ番号・服装番号　→　追加パーツ指定
	if($load[03] != "" ){	//追加パーツがあるとき
		$filename = $filename + " | " +  $load[00] + $load[03]
	}

	$WR=1
	
	return ($filename)
}
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$bup_ex(	//バストアップ追加パーツ読み込み
	property $chr_no :int,
	property $dress  :int
) : str
{
	property $ctmp :intlist[10]
	property $ex_sp :str

	if($chr_no == 02){	//フィリア
		switch($dress){		//衣装番号
			case(03)	$ex_sp ="01_parts01"
			case(04)	$ex_sp ="01_parts01"
			case(05)	$ex_sp ="01_parts01"
			case(06)	$ex_sp ="01_parts02"	//わかめ
			default		$ex_sp =""
		}
	}

	return($ex_sp)
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//キャラの初期レイヤ値をセット
command $$set_layer(property $number :int ):int
{
	property $layer :int

	switch( $number ){
		case(<JD>)	$layer = 168	// 170		k-takahashi 順番入れ替えました。後 → デリラ → フィリア → ジュード → 前
		case(<PH>)	$layer = 170	// 169										後 → ジュード → デリラ → フィリア → 前
		case(<DE>)	$layer = 169	// 168
		case(<GA>)	$layer = 167
		case(<WI>)	$layer = 166
		case(<KW>)	$layer = 165
		case(<A1>)	$layer = 164
		case(<A7>)	$layer = 163
		case(<OT>)	$layer = 162
	}
	IF($bup_spec.mid(0,2)=="BU"){	$layer += 20	}//近接時
	IF($bup_spec.mid(0,2)=="BW"){	$layer += 40	}//超近接時

	return( $layer )	//戻り値：レイヤ値
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//ファイル指定のチェック
command $$filename_chk(property $file : str) :str
	{
		//■バストアップ指定＝ファイル名　が存在する→フラグ立てる→抜け
		//■２文字の指定→キャラ識別子と断定→ストックされているキャラ指定を代入→抜け
		//■頭２文字がBS・BUではない→直前の指定から拾って来る　無い→BS
		//■バストアップ指定からキャラ番号を算出

		$bup_exist = 0						//単体存在チェックフラグ初期化
//		K[00] = $file						//初期値としてK[00]にバストアップ指定を取り込み
//		L[10] = $file.cnt					//指定の文字数をチェック
//		K[10] = $file.mid(0,2)				//指定の先頭２文字をストック

		$chr_num = $$chr2num($file)	//キャラ番号取得

		$bup_exist = 1
		$bup_stock[$chr_num] = $file			//指定をストック

	return($bup_stock[$chr_num])
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##実際にバストアップを表示するコマンド。
command $$BUP_DISP(property $wipe_no : int)
{
	$$wipe_prm_set($wipe_no,<WIPE_CH>,0)	//表示フルパラメタセット

	$$WIPE_EXEC(0)							//##ワイプ待たずに実行させる。
	$wipe_set_nowait = 0
	$$wipe_prm_clr		//表示フルパラメタクリア
	$$wipe_copy_set(1)	//##バストアップキャラ全員のワイプコピーフラグを立てる
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##キャラ識別子からキャラ番号への変換コマンド
command $$chr2num(property $chr_dst : str) :int
{

	$stmp[00]=$chr_dst.mid(0,2)	//先頭の２文字を抽出
	//キャラ指定のチェック＆抽出
	IF(($stmp[00]=="BS")||($stmp[00]=="BU")||($stmp[00]=="BW")||($stmp[00]=="CG")){
			$stmp[01] = $chr_dst.mid(3,2)
	}ELSE{
			$stmp[01] = $chr_dst.mid(0,2)
	}

	switch($stmp[01]){
		case("BG")	$ret[00] = 00
		case("JD")	$ret[00] = 01
		case("PH")	$ret[00] = 02
		case("DE")	$ret[00] = 03
		case("GA")	$ret[00] = 04
		case("WI")	$ret[00] = 05
		case("KW")	$ret[00] = 06
		case("A1")	$ret[00] = 07
		case("A7")	$ret[00] = 08
		case("OT")	$ret[00] = 09
		default		$ret[00] = 99
	}

	return($ret[00])
}

//##キャラ番号からキャラ識別子への変換コマンド。
command $$num2chr(property $chr_num : int) :str
{
	switch($chr_num){
		case(00)	$sret[00]="BG"
		case(01)	$sret[00]="JD"
		case(02)	$sret[00]="PH"
		case(03)	$sret[00]="DE"
		case(04)	$sret[00]="GA"
		case(05)	$sret[00]="WI"
		case(06)	$sret[00]="KW"
		case(07)	$sret[00]="A1"
		case(08)	$sret[00]="A7"
		case(09)	$sret[00]="OT"
	}
	return($sret[00])
}


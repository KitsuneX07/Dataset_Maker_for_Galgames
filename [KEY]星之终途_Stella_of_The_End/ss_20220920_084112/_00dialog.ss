//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//ダイアログボックス作成
//・上位のオブジェクトに作成
//・通常で呼び出されたら通常で、EX上で呼ばれたらEX上で作成
//・ワイプはさせずに親のTR値でフェードさせる。
//・パーツは全て子供オブジェクトで作成
//・ダイアログボックス外で左クリックしたらキャンセル扱い

#inc_start
	
	#property	$DLG_ret	:int
	#define <DLG_obj> excall[excall.check_alloc].front.object[255]

#inc_end

//------------------------------------------------------------
#Z00
//	L[00] = $$dialog("ダイアログテスト",0)
//	system.debug_messagebox_ok(L[00])	//デバッグメッセージ
return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$dialog(
	property $mess :str,
	property $mode :int		//２ボタン、１ボタンの切替用
	):int
{
	property $DLG_mess :str
	property $DLG_mode :int
	property $ctmp :intlist[10]
	property $yes_btn :str

	$DLG_mess = $mess
	$ctmp[00] = $DLG_mess.len	//文字長さ取得 半角＝1　全角＝2
	$ctmp[00] = $ctmp[00] * -8	//全角で32pixと想定して補正座標値を求める。
	$DLG_mode = $mode

	switch(syscom.get_no_wipe_anime_onoff){	//暗転効果のオンオフ反映
		case(00) $ctmp[02] = 200
		case(01) $ctmp[02] = 0
	}

	switch($DLG_mode){	//ボタンモード切替
		case(00) $yes_btn = "_DLG_yes"	$ctmp[01] = 1	//ＹＥＳ／ＮＯ
		case(01) $yes_btn = "_DLG_ok"	$ctmp[01] = 0	//ＯＫ
	}

	<DLG_obj>.child.resize(8)
	<DLG_obj>.tr = 000
	<DLG_obj>.disp = 1
	<DLG_obj>.order = 2
	<DLG_obj>.child[00].create("_DLG_under",1,000,000)			//00	下地フィルタ
	<DLG_obj>.child[01].create("_DLG_base",1,000,000,$DLG_mode)	//01	ダイアログベース
	<DLG_obj>.child[02].create($yes_btn,1,000,000)				//02	YES or OK
	<DLG_obj>.child[03].create("_DLG_no",$ctmp[01],000,000)		//03	NO
//	<DLG_obj>.child[04].create("_DLG_chk",1,000,000)			//04	チェックボックス
	<DLG_obj>.child[05].create_string("", 1,960,598)			//05	チェックボックス文字列
	<DLG_obj>.child[06].create_string("", 1,960,464)			//06	ダイアログメッセージ１
	<DLG_obj>.child[07].create_string("", 1,960,464)			//07	ダイアログメッセージ２（長い場合に使用）
	//------------------------------------------------------------
	<DLG_obj>.child[00].set_button(-1,<SEL4>, 4, 0)		//下地（キャンセル扱い）
	<DLG_obj>.child[02].set_button(01,<SEL4>, 1, 0)		//Yes_OK
	<DLG_obj>.child[03].set_button(-1,<SEL4>, 1, 0)		//No

	//メッセージ表示処理
	<DLG_obj>.child[06].x_rep.resize(1) <DLG_obj>.child[06].x_rep[0] = $ctmp[00]
	<DLG_obj>.child[07].x_rep.resize(1)
	<DLG_obj>.child[06].set_string_param(32, 00, 00, 00, 000, 001, 0)
	<DLG_obj>.child[06].set_string($DLG_mess)

	//ダイアログ表示
	<DLG_obj>.tr_eve.set(255,$ctmp[02],0,2)
	<DLG_obj>.tr_eve.wait

	//------------------------------------------------------------
	while(1){	//選択ループ
		excall[excall.check_alloc].front.objbtngroup[<SEL4>].init
		$DLG_ret = excall[excall.check_alloc].front.objbtngroup[<SEL4>].sel_cancel
		switch($DLG_ret){
			case(-1)	$DLG_ret = 0 break	//右クリ or ＮＯ　戻り値の整形
			case(01)	break				//ＹＥＳ or ＯＫ
			case(02)	//チェックボックス
		}
		input.next
	}
	<DLG_obj>.child[02].tr_eve.wait	//ボタン消去待ち
	<DLG_obj>.child[03].tr_eve.wait	

	<DLG_obj>.tr_eve.set(000,$ctmp[02],0,0)	//ダイアログ消去
	<DLG_obj>.tr_eve.wait
	<DLG_obj>.init
	return($DLG_ret)	//戻り値は 0/1
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//文字入力ボックス（セーブデータコメント入力用）
command $$comment_box(
	property $str_max :int
	):str
{
	property $ctmp :intlist[10]
	property $sctmp :strlist[10]
//入力用ウィンドウ用意
//ボタン判定ループ
//使用不可文字チェック（オブジェクト文字列用コード）
//文字列整形

	return($sctmp[00])
}



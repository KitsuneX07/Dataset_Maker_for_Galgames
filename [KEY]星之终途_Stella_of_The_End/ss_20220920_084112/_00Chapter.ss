//チャプターメニュー
//　※このメニューはタイトルメニューからしか呼ばれません。
#inc_start

	#property $th_x	:intlist[22]
	#property $th_y	:intlist[22]

#inc_end

#Z00
	gosub #file_load

	//ワイプ
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

	front.objbtngroup[0].init
	$tmp[00] = front.objbtngroup[0].sel_cancel
	if($tmp[00] != -1){	//チャプターが選択されたらＢＧＭをフェードアウト
		bgm.stop(300) bgm.wait
	}
	switch($tmp[00]){	//選択されたチャプターへ
		case(-1)	syscom.return_to_menu(0,0,1)
		case(01)	farcall("00シナリオフロー",01)
		case(02)	farcall("00シナリオフロー",02)
		case(03)	farcall("00シナリオフロー",03)
		case(04)	farcall("00シナリオフロー",04)
		case(05)	farcall("00シナリオフロー",05)
		case(06)	farcall("00シナリオフロー",06)
		case(07)	farcall("00シナリオフロー",07)
		case(08)	farcall("00シナリオフロー",08)
		case(09)	farcall("00シナリオフロー",09)
		case(10)	C[200] = 1 farcall("00シナリオフロー",10)	//アイキャッチが
		case(11)	farcall("00シナリオフロー",11)
		case(12)	farcall("00シナリオフロー",12)
		case(13)	farcall("00シナリオフロー",13)
		case(14)	farcall("00シナリオフロー",14)
		case(15)	farcall("00シナリオフロー",15)
		case(16)	farcall("00シナリオフロー",16)
		case(17)	farcall("00シナリオフロー",17)
		case(18)	farcall("00シナリオフロー",18)
		case(19)	farcall("00シナリオフロー",19)
		case(20)	C[200] = 1 farcall("00シナリオフロー",20)	//スタッフロールだけ特殊
		case(21)	farcall("00シナリオフロー",21)
	}

return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//画像読み込み・ボタン類構築
#file_load
	$th_x.sets(1,0150,0150,0150,0150,0150,0150,0150,0708,0708,0708,0708,0708,0708,0708,1266,1266,1266,1266,1266,1266,1266)
	$th_y.sets(1,0164,0285,0406,0527,0648,0769,0890,0164,0285,0406,0527,0648,0769,0890,0164,0285,0406,0527,0648,0769,0890)

	$tmp[00] = $$chapter_chk		//チャプター開放数取得

	back.object[00].create("_CPT_base",1,000,000)
	back.object[70].create("_CPT_line",1,000,000,$tmp[00]-1)
	$$OBJBTN_SET(back.object[71],"_cpt_exit",1, 000,000,255,<SEL0>,-1,1,1,0,0,0)
	
	for($tmp[01] = 1 , $tmp[01] <= $tmp[00] , $tmp[01] += 1 ){
		$$CPT_btn_load($tmp[01])	//サムネイル＆タイトルロード
	}
	
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$chapter_chk:int	//チャプターいくつ開放されているかカウント
{
	property $ctmp :intlist[10]
	$ctmp[00] = 201
	while($ctmp[00] <= 222){	//チャプター管理フラグ G[201～222]
		$ctmp[01] = $ctmp[01] + G[$ctmp[00]]
		$ctmp[00] += 1
	}
	return($ctmp[01])
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$CPT_btn_load( property $CPT_no:int){	//サムネイルとチャプターを一緒にボタンとしてロードする
	property $ctmp :intlist[10]
	property $sctmp :strlist[10]

	$sctmp[00] = "_CPT_title_" + math.tostr_zero($CPT_no,2)
	$sctmp[01] = "_CPT_TH" +  math.tostr_zero($CPT_no,2)

	$$OBJBTN_SET(back.object[$CPT_no],$sctmp[00]	,1, 000,000,255,<SEL0>,$CPT_no,1,0,0,0,0)
	$$OBJBTN_SET(back.object[$CPT_no+30],$sctmp[01]	,1, $th_X[$CPT_no],$th_Y[$CPT_no],255,<SEL0>,$CPT_no,6,0,0,0,0)

	return
}






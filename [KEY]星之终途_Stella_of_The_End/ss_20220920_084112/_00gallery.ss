//鑑賞メニュー
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#inc_start

	#property $EV_page	:int
	#property $VE_page	:int
	#property $BG_page	:int
	#property $CG_class :int	// 0/1/2 : EV/VE/BG

	#property $th01_x	:intlist[20]
	#property $th01_y	:intlist[20]
	#property $th02_x	:intlist[20]
	#property $th02_y	:intlist[20]
	#property $page_no_rep	:intlist[03]

#inc_end

#Z00

	//サムネイル座標群をセット
	$th01_x.sets(1, 202, 720,1238, 202, 720,1238)	//ＥＶ用
	$th01_y.sets(1, 229, 229, 229, 541, 541, 541)
	$th02_x.sets(1, 202, 587, 973,1358, 202, 587, 973,1358, 202, 587, 973,1358)	//ＶＥ・ＢＧ用
	$th02_y.sets(1, 184, 184, 184, 184, 414, 414, 414, 414, 644, 644, 644, 644)
	$page_no_rep.sets(0, 156, 79 ,79)	//ページ選択ボタンの座標ずらし
	
	//ページ管理用変数を初期化
	$EV_page = 1
	$VE_page = 0
	$BG_page = 0
	$CG_class = 0
	<GR_MUS> = 1	//タイトルから来るときはBGM01が流れている。

#main

#page_chg	//ページ構築

	gosub #LOAD_common
	if($EV_page != 0){gosub #EVCG_load	}	//サムネイルロード
	if($VE_page != 0){gosub #VECG_load	}
	if($BG_page != 0){gosub #BGCG_load	}

	//ワイプ
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

	while(1){
		front.objbtngroup[0].init
		$tmp[00] = front.objbtngroup[0].sel_cancel
		switch($tmp[00]){
			case(-1)	syscom.return_to_menu(0,0,1)	//右クリで戻る
			case(01)	
			case(02)	farcall(_00music)	break	//<GR_MODE>
			case(03)	syscom.return_to_menu(0,0,1)
			case(04)	$EV_page = 1	$VE_page = 0	$BG_page = 0	$CG_class = 0	break
			case(05)	$EV_page = 0	$VE_page = 1	$BG_page = 0	$CG_class = 1	break
			case(06)	$EV_page = 0	$VE_page = 0	$BG_page = 1	$CG_class = 2	break
			case(07)	$$page_loop(00)	break
			case(08)	$$page_loop(01)	break

			case(11)	$$page_chg(01)	break
			case(12)	$$page_chg(02)	break
			case(13)	$$page_chg(03)	break
			case(14)	$$page_chg(04)	break
			case(15)	$$page_chg(05)	break
			case(16)	$$page_chg(06)	break
			case(17)	$$page_chg(07)	break

		}
		if(($tmp[00] >= 101 )&&($tmp[00] <= 200 )){	//101～200　EVCG・VECG
			farcall("_00gal_cg",$tmp[00]-100)
		}
		if(($tmp[00] >= 201 )&&($tmp[00] <= 300 )){	//201～300　BGCG
			farcall("_00gal_bg",$tmp[00]-200)
		}

	}
	goto #page_chg

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#LOAD_common
	back.object[00].create("_GAL_base",1,000,000)
	$$OBJBTN_SET(back.object[01],"_gal_mode_CG"		,1, 000,000,255,<SEL0>,01,1,1,0,1,0)	//下部ボタン
	$$OBJBTN_SET(back.object[02],"_gal_mode_MUS"	,1, 000,000,255,<SEL0>,02,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[03],"_gal_mode_title"	,1, 000,000,255,<SEL0>,03,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[04],"_gal_CG_EV"		,1, 000,000,255,<SEL0>,04,1,1,0,0,0)	//上部ボタン
	$$OBJBTN_SET(back.object[05],"_gal_CG_VE"		,1, 000,000,255,<SEL0>,05,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[06],"_gal_CG_BG"		,1, 000,000,255,<SEL0>,06,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[07],"_gal_CG_rep"		,1, 000,000,255,<SEL0>,07,1,1,0,0,0)	//左右ページ切替
	$$OBJBTN_SET(back.object[08],"_gal_CG_next"		,1, 000,000,255,<SEL0>,08,1,1,0,0,0)	
	switch($cg_class){
		case(00)	back.object[04].set_button_state_select
		case(01)	back.object[05].set_button_state_select
		case(02)	back.object[06].set_button_state_select
	}
	$$OBJBTN_SET(back.object[11],"_GAL_p01"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,11,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[12],"_GAL_p02"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,12,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[13],"_GAL_p03"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,13,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[14],"_GAL_p04"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,14,1,1,0,0,0)	
	if($cg_class != 0){	//５以降はVE・BGのみ
	$$OBJBTN_SET(back.object[15],"_GAL_p05"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,15,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[16],"_GAL_p06"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,16,1,1,0,0,0)	
	$$OBJBTN_SET(back.object[17],"_GAL_p07"		,1, $page_no_rep[$cg_class],000,255,<SEL0>,17,1,1,0,0,0)	
	}
	$tmp[00] = math.max(math.max($EV_page , $VE_page),$BG_page)
//	$tmp[00] = math.max($tmp[00] , $BG_page)
	back.object[ $tmp[00]+10 ].set_button_state_select	//現在ページのSELECT化

	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$page_chg(property $page :int){
	switch($CG_class){
		case(00)	$EV_page = $page
		case(01)	$VE_page = $page
		case(02)	$BG_page = $page
	}
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$page_loop(property $dir :int){		//＜＞ボタン動作
	property $ctmp :intlist[10]
	switch($cg_class){
		case(00)	 $ctmp[01]= $EV_page	$ctmp[02]= 4
		case(01)	 $ctmp[01]= $VE_page	$ctmp[02]= 7
		case(02)	 $ctmp[01]= $BG_page	$ctmp[02]= 7
	}
	switch($dir){
		case(00)	$ctmp[00] = $$loop_dec(1,$ctmp[01],$ctmp[02])	//＜
		case(01)	$ctmp[00] = $$loop_inc(1,$ctmp[01],$ctmp[02])	//＞
	}
	switch($cg_class){
		case(00)	$EV_page= $ctmp[00]
		case(01)	$VE_page= $ctmp[00]
		case(02)	$BG_page= $ctmp[00]
	}
	return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//サムネイル構築群。
//並べ替えたあとは、座標の配列番号をソートしておくこと。

/*
//ＥＶ用座標
202,229		720,229		1238,229
202,541		720,541		1238,541

//ＶＥ・ＢＧ用座標
202,184		587,184		973,184		1358,184
202,414		587,414		973,414		1358,414
202,644		587,644		973,644		1358,644
*/
#EVCG_load
	switch($EV_page){
	case(01)
		$$OBJBTN_SET(back.object[21],"_th_ev01"	,1,$th01_x[01],$th01_y[01],255,<SEL0>,101,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ev02"	,1,$th01_x[02],$th01_y[02],255,<SEL0>,102,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ev03"	,1,$th01_x[03],$th01_y[03],255,<SEL0>,103,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ev04"	,1,$th01_x[04],$th01_y[04],255,<SEL0>,104,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ev16"	,1,$th01_x[05],$th01_y[05],255,<SEL0>,116,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ev31"	,1,$th01_x[06],$th01_y[06],255,<SEL0>,131,0,1,0,0,0)

	case(02)
		$$OBJBTN_SET(back.object[21],"_th_ev05"	,1,$th01_x[01],$th01_y[01],255,<SEL0>,105,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ev06"	,1,$th01_x[02],$th01_y[02],255,<SEL0>,106,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ev07"	,1,$th01_x[03],$th01_y[03],255,<SEL0>,107,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ev08"	,1,$th01_x[04],$th01_y[04],255,<SEL0>,108,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ev09"	,1,$th01_x[05],$th01_y[05],255,<SEL0>,109,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ev10"	,1,$th01_x[06],$th01_y[06],255,<SEL0>,110,0,1,0,0,0)

	case(03)
		$$OBJBTN_SET(back.object[21],"_th_ev11"	,1,$th01_x[01],$th01_y[01],255,<SEL0>,111,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ev12"	,1,$th01_x[02],$th01_y[02],255,<SEL0>,112,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ev33"	,1,$th01_x[03],$th01_y[03],255,<SEL0>,133,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ev13"	,1,$th01_x[04],$th01_y[04],255,<SEL0>,113,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ev14"	,1,$th01_x[05],$th01_y[05],255,<SEL0>,114,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ev17"	,1,$th01_x[06],$th01_y[06],255,<SEL0>,117,0,1,0,0,0)

	case(04)
		$$OBJBTN_SET(back.object[21],"_th_ev15"	,1,$th01_x[01],$th01_y[01],255,<SEL0>,115,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ev32"	,1,$th01_x[02],$th01_y[02],255,<SEL0>,132,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ev98"	,1,$th01_x[03],$th01_y[03],255,<SEL0>,198,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ev99"	,1,$th01_x[04],$th01_y[04],255,<SEL0>,199,0,1,0,0,0)	//ＯＰＭＶ
	}
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#VECG_load
	switch($VE_page){
	case(01)
		$$OBJBTN_SET(back.object[21],"_th_ve65"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,165,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve19"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,119,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve61"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,161,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve58"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,158,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve34"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,134,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve41"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,141,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve39"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,139,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve71"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,171,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve67"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,167,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve64"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,164,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve57"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,157,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve76"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,176,0,1,0,0,0)

	case(02)
		$$OBJBTN_SET(back.object[21],"_th_ve73"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,173,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve43"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,143,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve84"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,184,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve70"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,170,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve96"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,196,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve80"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,180,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve51"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,151,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve90"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,190,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve42"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,142,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve35"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,135,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve69"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,169,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve56"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,156,0,1,0,0,0)

	case(03)
		$$OBJBTN_SET(back.object[21],"_th_ve40"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,140,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve59"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,159,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve54"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,154,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve63"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,163,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve46"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,146,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve52"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,152,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve45"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,145,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve79"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,179,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve86"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,186,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve72"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,172,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve30"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,130,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve85"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,185,0,1,0,0,0)

	case(04)
		$$OBJBTN_SET(back.object[21],"_th_ve55"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,155,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve68"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,168,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve53"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,153,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve92"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,192,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve49"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,149,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve38"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,138,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve88"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,188,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve93"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,193,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve36"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,136,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve44"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,144,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve37"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,137,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve95"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,195,0,1,0,0,0)

	case(05)
		$$OBJBTN_SET(back.object[21],"_th_ve21"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,121,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve60"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,160,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve78"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,178,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve62"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,162,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve66"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,166,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve91"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,191,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve94"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,194,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve74"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,174,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve83"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,183,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve20"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,120,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve87"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,187,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve22"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,122,0,1,0,0,0)

	case(06)
		$$OBJBTN_SET(back.object[21],"_th_ve89"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,189,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve24"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,124,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve25"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,125,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve50"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,150,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_ve26"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,126,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_ve27"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,127,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_ve28"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,128,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_ve29"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,129,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_ve23"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,123,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_ve48"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,148,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_ve47"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,147,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_ve97"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,197,0,1,0,0,0)

	case(07)
		$$OBJBTN_SET(back.object[21],"_th_ve18"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,118,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_ve75"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,175,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_ve82"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,182,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_ve81"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,181,0,1,0,0,0)
	}
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#BGCG_load
	switch($BG_page){
	case(01)
		$$OBJBTN_SET(back.object[21],"_th_bg01"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,201,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg02"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,202,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg03"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,203,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg04"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,204,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg05"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,205,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg06"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,206,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg07"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,207,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg08"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,208,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg09"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,209,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg10"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,210,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg11"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,211,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg13"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,213,0,1,0,0,0)

	case(02)
		$$OBJBTN_SET(back.object[21],"_th_bg14"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,214,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg15"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,215,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg16"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,216,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg17"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,217,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg18"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,218,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg19"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,219,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg20"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,220,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg21"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,221,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg22"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,222,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg23"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,223,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg24"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,224,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg25"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,225,0,1,0,0,0)

	case(03)
		$$OBJBTN_SET(back.object[21],"_th_bg26"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,226,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg27"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,227,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg28"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,228,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg29"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,229,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg30"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,230,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg31"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,231,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg32"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,232,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg33"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,233,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg34"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,234,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg35"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,235,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg36"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,236,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg37"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,237,0,1,0,0,0)

	case(04)
		$$OBJBTN_SET(back.object[21],"_th_bg38"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,238,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg39"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,239,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg40"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,240,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg41"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,241,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg42"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,242,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg43"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,243,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg44"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,244,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg45"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,245,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg46"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,246,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg47"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,247,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg48"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,248,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg49"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,249,0,1,0,0,0)

	case(05)
		$$OBJBTN_SET(back.object[21],"_th_bg50"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,250,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg51"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,251,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg52"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,252,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg53"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,253,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg54"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,254,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg55"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,255,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg56"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,256,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg57"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,257,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg58"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,258,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg59"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,259,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg60"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,260,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg61"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,261,0,1,0,0,0)

	case(06)
		$$OBJBTN_SET(back.object[21],"_th_bg62"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,262,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg63"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,263,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg64"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,264,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg65"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,265,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg66"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,266,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg67"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,267,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg68"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,268,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg69"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,269,0,1,0,0,0)
		$$OBJBTN_SET(back.object[29],"_th_bg70"	,1,$th02_x[09],$th02_y[09],255,<SEL0>,270,0,1,0,0,0)
		$$OBJBTN_SET(back.object[30],"_th_bg71"	,1,$th02_x[10],$th02_y[10],255,<SEL0>,271,0,1,0,0,0)
		$$OBJBTN_SET(back.object[31],"_th_bg72"	,1,$th02_x[11],$th02_y[11],255,<SEL0>,272,0,1,0,0,0)
		$$OBJBTN_SET(back.object[32],"_th_bg73"	,1,$th02_x[12],$th02_y[12],255,<SEL0>,273,0,1,0,0,0)

	case(07)
		$$OBJBTN_SET(back.object[21],"_th_bg74"	,1,$th02_x[01],$th02_y[01],255,<SEL0>,274,0,1,0,0,0)
		$$OBJBTN_SET(back.object[22],"_th_bg76"	,1,$th02_x[02],$th02_y[02],255,<SEL0>,276,0,1,0,0,0)
		$$OBJBTN_SET(back.object[23],"_th_bg77"	,1,$th02_x[03],$th02_y[03],255,<SEL0>,277,0,1,0,0,0)
		$$OBJBTN_SET(back.object[24],"_th_bg78"	,1,$th02_x[04],$th02_y[04],255,<SEL0>,278,0,1,0,0,0)
		$$OBJBTN_SET(back.object[25],"_th_bg79"	,1,$th02_x[05],$th02_y[05],255,<SEL0>,279,0,1,0,0,0)
		$$OBJBTN_SET(back.object[26],"_th_bg80"	,1,$th02_x[06],$th02_y[06],255,<SEL0>,280,0,1,0,0,0)
		$$OBJBTN_SET(back.object[27],"_th_bg81"	,1,$th02_x[07],$th02_y[07],255,<SEL0>,281,0,1,0,0,0)
		$$OBJBTN_SET(back.object[28],"_th_bg82"	,1,$th02_x[08],$th02_y[08],255,<SEL0>,282,0,1,0,0,0)
	}
	return




//環境設定
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z00

	capture					//##セーブサムネ用キャプチャ
	capture_for_tweet		//##ツイート用キャプチャ
	syscom.set_syscom_menu_disable	//システムメニュー禁止
	syscom.set_mwnd_btn_disable		//メッセージウィンドウボタンを使用不可に
	$$excall_ready(0)

	gosub #main

	$$excall_free

	koe_stop	//サンプル音声鳴ってたら停止
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//メッセージウィンドウボタンを使用可に
	syscom.set_syscom_menu_enable	//右クリ許可
	capture_free_for_tweet	//##ツイート用キャプチャ解放
	capture_free			//##セーブサムネ用キャプチャ解放
	return

#Z10	//外部からの呼び出し用ラベル
#main	//------------------------------------------------------------

#page_chg	//ページ構築
	$stage = 0

	if(<CFG_CHR> <=1 ){	//キャラ別音声の座標いじり
		$cfg_ch_x.sets(1,0991,1187,1383,1579,0000,0991,1187)	//ガブおらん
		$cfg_ch_y.sets(1,0237,0237,0237,0237,0558,0558,0558)
	}else{
		$cfg_ch_x.sets(1,0991,1187,1383,1579,0991,1187,1383)
		$cfg_ch_y.sets(1,0237,0237,0237,0237,0558,0558,0558)
	}

	gosub #LOAD_common
	switch(<CF_PAGE>){
		case(00)	$all_set= 1 gosub #LOAD_SYSTEM $all_set= 0
		case(01)	$all_set= 1 gosub #LOAD_SOUND  $all_set= 0
	}
	
	//ワイプ
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

#sel_loop
	$stage = 1
	$tmp[00]=0
	$$main_sel_ret
	while(1){	//##メインループ
		//##ホイールをまわしたかどうかのチェック
		$tmp[01]=excall.front.objbtngroup[<sel0>].get_hit_no
		if(mouse.wheel != 0){	//スライダの下地以外でホイール回ってても無視される　…ハズ
			switch($tmp[01]){	//実行分岐 
				case(126)	$$wh_set(<C_OBJ>[$stage].object[26].child[03].x_rep[0],0,0, <SL00_MAX>,500,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(127)	$$wh_set(<C_OBJ>[$stage].object[27].child[03].x_rep[0],0,0, <SL00_MAX>,100,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(128)	$$wh_set(<C_OBJ>[$stage].object[28].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])

				case(219)	$$wh_set(<C_OBJ>[$stage].object[19].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(220)	$$wh_set(<C_OBJ>[$stage].object[20].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(221)	$$wh_set(<C_OBJ>[$stage].object[21].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(222)	$$wh_set(<C_OBJ>[$stage].object[22].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(223)	$$wh_set(<C_OBJ>[$stage].object[23].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(224)	$$wh_set(<C_OBJ>[$stage].object[24].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(225)	$$wh_set(<C_OBJ>[$stage].object[25].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])

			}
		}
		//##スライダー＆スライダー下地部分チェック
		$tmp[00]=excall.front.objbtngroup[<sel0>].get_pushed_no	//##ボタンが押されただけで反応する子はこっち（押し離しではない）
		switch($tmp[00]){
			case(126)	$$SLD_LOOP(<C_OBJ>[$stage].object[26],$tmp[00],<SL00_MAX>)	//オートモード
			case(127)	$$SLD_LOOP(<C_OBJ>[$stage].object[27],$tmp[00],<SL00_MAX>)	//文字速度
			case(128)	$$SLD_LOOP(<C_OBJ>[$stage].object[28],$tmp[00],<SL00_MAX>)	//ウィンドウ背景
			//------------------------------------------------------------
			case(219)	$$SLD_LOOP(<C_OBJ>[$stage].object[19],$tmp[00],<SL00_MAX>)
			case(220)	$$SLD_LOOP(<C_OBJ>[$stage].object[20],$tmp[00],<SL00_MAX>)
			case(221)	$$SLD_LOOP(<C_OBJ>[$stage].object[21],$tmp[00],<SL00_MAX>)
			case(222)	$$SLD_LOOP(<C_OBJ>[$stage].object[22],$tmp[00],<SL00_MAX>)
			case(223)	$$SLD_LOOP(<C_OBJ>[$stage].object[23],$tmp[00],<SL00_MAX>)
			case(224)	$$SLD_LOOP(<C_OBJ>[$stage].object[24],$tmp[00],<SL00_MAX>)
			case(225)	$$SLD_LOOP(<C_OBJ>[$stage].object[25],$tmp[00],<SL00_MAX>)
			//------------------------------------------------------------
			case(241)	$$SLD_LOOP(<C_OBJ>[$stage].object[26],$tmp[00],<SL01_MAX>)	//キャラ別音声
			case(242)	$$SLD_LOOP(<C_OBJ>[$stage].object[27],$tmp[00],<SL01_MAX>)
			case(243)	$$SLD_LOOP(<C_OBJ>[$stage].object[28],$tmp[00],<SL01_MAX>)
			case(244)	$$SLD_LOOP(<C_OBJ>[$stage].object[29],$tmp[00],<SL01_MAX>)
			case(245)	$$SLD_LOOP(<C_OBJ>[$stage].object[30],$tmp[00],<SL01_MAX>)
			case(246)	$$SLD_LOOP(<C_OBJ>[$stage].object[31],$tmp[00],<SL01_MAX>)
			case(247)	$$SLD_LOOP(<C_OBJ>[$stage].object[32],$tmp[00],<SL01_MAX>)
		}
		//##ボタン系（押して離した時に実行）
		$tmp[00]=excall.front.objbtngroup[<sel0>].get_decided_no	//##ボタン・チェックボックス類の状態取得
		switch($tmp[00]){
			case(-1)	break				//右クリック・ＢＡＣＫ
			case(001)	<CF_PAGE> = 0 break	//システムページ
			case(002)	<CF_PAGE> = 1 break	//サウンドページ

			case(003)	<SL_mode> = 00 farcall("_00saveload",10)	break	//ＳＡＶＥ
			case(004)	<SL_mode> = 01 farcall("_00saveload",10)	break	//ＬＯＡＤ
			case(005)									//ＣＯＮＦＩＧ
			case(006)	$$cfg_title	//syscom.return_to_menu(0,0,1)	//ＴＩＴＬＥ
			case(007)	$$cfg_quit	//break							//ＱＵＩＴ
			case(008)	break							//ＢＡＣＫ
			//------------------------------------------------------------
			case(110)	syscom.call_config_window_mode_menu				//ウィンドウ設定
			case(111)	syscom.set_window_mode(1)	$$onoff_set(syscom.get_window_mode,12,11)	//フルスクリーン
			case(112)	syscom.set_window_mode(0)	$$onoff_set(syscom.get_window_mode,12,11)	//ウィンドウ
			case(113)	syscom.set_skip_unread_message_onoff(0)	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//メッセージスキップ既読のみ
			case(114)	syscom.set_skip_unread_message_onoff(1)	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//メッセージスキップ未読含む
			case(115)	<RC_CHK> = 0	$$rcm_set	//右クリック　クリックメニュー
			case(116)	<RC_CHK> = 1	$$rcm_set	//右クリック　ウィンドウ消去
			case(117)	<RC_CHK> = 2	$$rcm_set	//右クリック　コンフィグ
			case(118)	syscom.set_message_speed_default	$$PRM_SLD_SET(127) syscom.set_message_nowait_default $$cbox_set(syscom.get_message_nowait,25,0)	//文字速度リセット
			case(119)	syscom.call_config_font_menu		//フォント設定
			case(120)	syscom.set_filter_color_a_default	$$PRM_SLD_SET(128)	//ウィンドウ背景初期化
			case(121)	syscom.set_no_wipe_anime_onoff(0)	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)	//演出オン
			case(122)	syscom.set_no_wipe_anime_onoff(1)	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)	//演出オフ
			case(123)	syscom.call_config_movie_menu	//ムービー設定
			case(124)	syscom.call_config_system_menu 	//その他の設定
			case(125)	syscom.set_message_nowait($$toggle(syscom.get_message_nowait))	$$cbox_set(syscom.get_message_nowait,25,0)	//ノーウェイト設定
			case(130)	syscom.set_auto_mode_moji_wait_default	syscom.set_auto_mode_min_wait_default	$$PRM_SLD_SET(126)	//オートモード設定初期化
			case(131)	syscom.call_config_filter_color_menu	//フィルターカラーのダイアログを呼び出す

			//------------------------------------------------------------
			case(210)	$$sound_vol_reset	//音量初期化
			case(211)	syscom.set_all_onoff($$toggle(syscom.get_all_onoff))	$$cbox_set(syscom.get_all_onoff,11,0)	//チェック：全体
			case(212)	syscom.set_bgm_onoff($$toggle(syscom.get_bgm_onoff))	$$cbox_set(syscom.get_bgm_onoff,12,0)	//チェック：ＢＧＭ
			case(213)	syscom.set_bgmfade_onoff($$toggle(syscom.get_bgmfade_onoff))	$$cbox_set(syscom.get_bgmfade_onoff,13,0)	//チェック：ＢＧＭフェード
			case(214)	syscom.set_koe_onoff($$toggle(syscom.get_koe_onoff))	$$cbox_set(syscom.get_koe_onoff,14,0)	//チェック：音声
			case(215)	syscom.set_pcm_onoff($$toggle(syscom.get_pcm_onoff))	$$cbox_set(syscom.get_pcm_onoff,15,0)	//チェック：効果音
			case(216)	syscom.set_se_onoff($$toggle(syscom.get_se_onoff))		$$cbox_set(syscom.get_se_onoff,16,0)	//チェック：システム音
			case(217)	syscom.set_mov_onoff($$toggle(syscom.get_mov_onoff))	$$cbox_set(syscom.get_mov_onoff,17,0)	//チェック：ムービー音
			case(218)	syscom.set_koe_dont_stop_onoff($$toggle(syscom.get_koe_dont_stop_onoff))	$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)	//音声の再生中に次の文章に進んでも再生を続ける

			case(226)	$$CHR_vol_reset

			case(231)	syscom.set_charakoe_onoff(001,$$toggle(syscom.get_charakoe_onoff(001)))	$$cbox_set(syscom.get_charakoe_onoff(001),26,1)	//キャラ別音声オンオフ
			case(232)	syscom.set_charakoe_onoff(002,$$toggle(syscom.get_charakoe_onoff(002)))	$$cbox_set(syscom.get_charakoe_onoff(002),27,1)
			case(233)	syscom.set_charakoe_onoff(003,$$toggle(syscom.get_charakoe_onoff(003)))	$$cbox_set(syscom.get_charakoe_onoff(003),28,1)
			case(234)	syscom.set_charakoe_onoff(004,$$toggle(syscom.get_charakoe_onoff(004)))	$$cbox_set(syscom.get_charakoe_onoff(004),29,1)
			case(235)	syscom.set_charakoe_onoff(005,$$toggle(syscom.get_charakoe_onoff(005)))	$$cbox_set(syscom.get_charakoe_onoff(005),30,1)
			case(236)	syscom.set_charakoe_onoff(006,$$toggle(syscom.get_charakoe_onoff(006)))	$$cbox_set(syscom.get_charakoe_onoff(006),31,1)
			case(237)	syscom.set_charakoe_onoff(007,$$toggle(syscom.get_charakoe_onoff(007)))	$$cbox_set(syscom.get_charakoe_onoff(007),32,1)

			case(251)	$$sampleKOE("Z900000020",001)	//ジュード「終のステラ」
			case(252)	$$sampleKOE("Z900000015",002)	//フィリア「終のステラ」
			case(253)	$$sampleKOE("Z900000086",003)	//ウィレム「終のステラ」
			case(254)	$$sampleKOE("Z900000013",004)	//デリラ「終のステラ」
			case(255)	$$sampleKOE("Z900000113",005)	//ガブリエル「終のステラ」
			case(256)	$$sampleKOE("Z000300016",007)	//その他男「よう、ジュード」
			case(257)	$$sampleKOE("Z000700142",006)	//その他女「ダメ、口きいちゃ」

		}
		if($tmp[00]==-1){	//##キャンセルされたループアウト
			frame_action.end	//文字アニメを一旦停止
			se.play(02)		//キャンセル音の再生
			break
		}
		IF(excall.front.objbtngroup[<SEL0>].get_decided_no!= -2){
			$$main_sel_ret
		}
		input.next
		DISP
	}
	if(($tmp[00] == 1)||($tmp[00] == 2)){	//SYSTEM⇔SOUND
		goto #page_chg
	}
	frame_action.end
	se.play(02)
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#LOAD_common
	//共通
	$$OBJBTN_SET(<C_OBJ>[$stage].object[01],	"_cfg_system"		,1, 000,000,255,<SEL0>,01,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[02],	"_cfg_sound"		,1, 000,000,255,<SEL0>,02,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[03],	"_common_save"		,1, 000,000,255,<SEL0>,03,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[04],	"_common_load"		,1, 000,000,255,<SEL0>,04,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[05],	"_common_config"	,1, 000,000,255,<SEL0>,05,1,1,0,1,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[06],	"_common_title"		,1, 000,000,255,<SEL0>,06,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[07],	"_common_quit"		,1, 000,000,255,<SEL0>,07,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[08],	"_common_back"		,1, 000,000,255,<SEL0>,08,1,1,0,0,0)
	IF(<PURORO>==0 ){	<C_OBJ>[$stage].object[06].set_button_state_disable	}	//プロローグ未見時はタイトルに飛べない
	IF(check_savepoint == 0 ){ <C_OBJ>[$stage].object[03].set_button_state_disable	}	//セーブポイント立ってなかったらセーブページに行かせない。

	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#LOAD_SYSTEM	//ＳＹＳＴＥＭ
	<C_OBJ>[$stage].object[00].create("_cfg_system_base",1)
	//システム用ボタンは　オブジェクト10から。　ボタン判定番号はオブジェクト番号 +100
	$$OBJBTN_SET(<C_OBJ>[$stage].object[10],	"_cfg_system_disp_set"		,1, 000,000,255,<SEL0>,110,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[11],	"_cfg_system_disp_full"		,1, 000,000,255,<SEL0>,111,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[12],	"_cfg_system_disp_window"	,1, 000,000,255,<SEL0>,112,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[13],	"_cfg_system_skip_01"		,1, 000,000,255,<SEL0>,113,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[14],	"_cfg_system_skip_02"		,1, 000,000,255,<SEL0>,114,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[15],	"_cfg_system_rcm_00"		,1, 000,000,255,<SEL0>,115,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[16],	"_cfg_system_rcm_01"		,1, 000,000,255,<SEL0>,116,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[17],	"_cfg_system_rcm_02"		,1, 000,000,255,<SEL0>,117,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[18],	"_cfg_system_font_reset"	,1, 000,000,255,<SEL0>,118,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[19],	"_cfg_system_font_set"		,1, 000,000,255,<SEL0>,119,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[20],	"_cfg_system_messw_reset"	,1, 000,000,255,<SEL0>,120,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[21],	"_cfg_system_effect_on"		,1, 000,000,255,<SEL0>,121,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[22],	"_cfg_system_effect_off"	,1, 000,000,255,<SEL0>,122,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[23],	"_cfg_system_movie"			,1, 000,000,255,<SEL0>,123,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[24],	"_cfg_system_other"			,1, 000,000,255,<SEL0>,124,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[25],	"_cfg_system_nowait"		,1, 000,000,255,<SEL0>,125,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[30],	"_cfg_system_automode_reset",1, 000,000,255,<SEL0>,130,1,1,0,0,0)
//	$$OBJBTN_SET(<C_OBJ>[$stage].object[31],	"_cfg_system_disp_set"		,1,1074,000,255,<SEL0>,131,1,1,0,0,1)	//メッセージウィンドウ詳細設定ボタン

	<C_OBJ>[$stage].object[29].create("_cfg_system_preview",1)

	//スライダーパーツ読み込み・状態セット
	$$SLIDE_set_load(<C_OBJ>[$stage].object[26],	183,672,	126)	$$PRM_SLD_SET(126)
	$$SLIDE_set_load(<C_OBJ>[$stage].object[27],	183,895,	127)	$$PRM_SLD_SET(127)
	$$SLIDE_set_load(<C_OBJ>[$stage].object[28],	1078,292,	128)	$$PRM_SLD_SET(128)

	$$onoff_set(syscom.get_window_mode,12,11)				//画面モード
	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//未読スキップ
	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)		//エフェクトオンオフ
	$$cbox_set(syscom.get_message_nowait,25,0)				//ノーウェイトオンオフ
	$$rcm_set	//右クリック設定

	//モードボタン状態セット
	<C_OBJ>[$stage].object[01].set_button_state_select	//右上
	<C_OBJ>[$stage].object[02].set_button_state_normal

	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#LOAD_SOUND		//ＳＯＵＮＤ
		<C_OBJ>[$stage].object[00].create("_cfg_sound_base",1,000,000,<CFG_CHR>)
		//サウンド用ボタンは　オブジェクト10から。　ボタン判定番号はオブジェクト番号 +200
		$$OBJBTN_SET(<C_OBJ>[$stage].object[10],	"_cfg_sound_prm_reset"		,1, 000,000,255,<SEL0>,210,1,1,0,0,1)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[11],	"_cfg_sound_prm_all"		,1, 000,000,255,<SEL0>,211,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[12],	"_cfg_sound_prm_bgm"		,1, 000,000,255,<SEL0>,212,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[13],	"_cfg_sound_prm_bgmf"		,1, 000,000,255,<SEL0>,213,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[14],	"_cfg_sound_prm_voi"		,1, 000,000,255,<SEL0>,214,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[15],	"_cfg_sound_prm_se"			,1, 000,000,255,<SEL0>,215,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[16],	"_cfg_sound_prm_sys"		,1, 000,000,255,<SEL0>,216,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[17],	"_cfg_sound_prm_mov"		,1, 000,000,255,<SEL0>,217,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[18],	"_cfg_sound_prm_pbs"		,1, 000,000,255,<SEL0>,218,1,1,0,0,0)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[19],	108,256,	219)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[20],	108,346,	220)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[21],	108,436,	221)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[22],	108,526,	222)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[23],	108,616,	223)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[24],	108,706,	224)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[25],	108,796,	225)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[26],01,"_cfg_sound_chrbase_jd",231)	//キャラ別のオン／オフとスライダ、サンプル再生を一括ロード
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[27],02,"_cfg_sound_chrbase_ph",232)	//　231～　キャラ別オンオフ
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[28],03,"_cfg_sound_chrbase_wi",233)	//　241～　スライダー
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[29],04,"_cfg_sound_chrbase_de",234)	//　251～　サンプル再生
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[30],05,"_cfg_sound_chrbase_ga",235)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[31],06,"_cfg_sound_chrbase_o1",236)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[32],07,"_cfg_sound_chrbase_o2",237)

		$$OBJBTN_SET(<C_OBJ>[$stage].object[33],	"_cfg_sound_chr_reset"		,1, 000,000,255,<SEL0>,226,1,1,0,0,1)		//キャラ音声全てリセット
//		$$OBJBTN_SET(<C_OBJ>[$stage].object[34],	"_cfg_sound_chr_allon"		,1, 000,000,255,<SEL0>,227,1,1,0,0,1)		//キャラ音声全てオン
//		$$OBJBTN_SET(<C_OBJ>[$stage].object[35],	"_cfg_sound_chr_alloff"		,1, 000,000,255,<SEL0>,228,1,1,0,0,1)		//キャラ音声全てオフ

		$$PRM_SLD_SET(219)	//スライダ値の反映
		$$PRM_SLD_SET(220)
		$$PRM_SLD_SET(221)
		$$PRM_SLD_SET(222)
		$$PRM_SLD_SET(223)
		$$PRM_SLD_SET(224)
		$$PRM_SLD_SET(225)

		$$cbox_set(syscom.get_all_onoff,11,0)
		$$cbox_set(syscom.get_bgm_onoff,12,0)
		$$cbox_set(syscom.get_bgmfade_onoff,13,0)
		$$cbox_set(syscom.get_koe_onoff,14,0)
		$$cbox_set(syscom.get_pcm_onoff,15,0)
		$$cbox_set(syscom.get_se_onoff,16,0)
		$$cbox_set(syscom.get_mov_onoff,17,0)
		$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)

		//モードボタン状態セット
		<C_OBJ>[$stage].object[01].set_button_state_normal	//右上
		<C_OBJ>[$stage].object[02].set_button_state_select

return


//個別動作
command $$main_sel_ret	//環境設定の選択ループに戻すコマンド
{
	excall.stage[$stage].objbtngroup[<SEL0>].init
	excall.stage[$stage].objbtngroup[<SEL0>].start_cancel	//選択肢開始
	return
}

command	$$rcm_set	//右クリックメニュー設定
{
	switch(<RC_CHK>){
		case(00)	<C_OBJ>[$stage].object[15].patno=10	<C_OBJ>[$stage].object[16].patno=00	<C_OBJ>[$stage].object[17].patno=00
		case(01)	<C_OBJ>[$stage].object[15].patno=00	<C_OBJ>[$stage].object[16].patno=10	<C_OBJ>[$stage].object[17].patno=00
		case(02)	<C_OBJ>[$stage].object[15].patno=00	<C_OBJ>[$stage].object[16].patno=00	<C_OBJ>[$stage].object[17].patno=10
	}
	return
}

command $$onoff_set(	//チェックオンオフ共用版コマンド
	property $sys_prm,
	property $on_obj_no,
	property $off_obj_no
){
	switch($sys_prm){
		case(0)	<C_OBJ>[$stage].object[$on_obj_no].patno=10	<C_OBJ>[$stage].object[$off_obj_no].patno=00
		case(1)	<C_OBJ>[$stage].object[$on_obj_no].patno=00	<C_OBJ>[$stage].object[$off_obj_no].patno=10
	}
	return
}

command $$cbox_set(		//チェックボックス共用版コマンド
	property $sys_prm,
	property $obj_no,
	property $chr_vo
){
	switch($sys_prm + ($chr_vo * 10)){
		case(00)	<C_OBJ>[$stage].object[$obj_no].patno=00	//通常
		case(01)	<C_OBJ>[$stage].object[$obj_no].patno=10

		case(10)	<C_OBJ>[$stage].object[$obj_no].child[04].patno=00	//キャラ別音声のオンオフ
		case(11)	<C_OBJ>[$stage].object[$obj_no].child[04].patno=10
	}
	return
}

command	$$sound_vol_reset{	//音量一括初期化
	syscom.set_all_volume_default         // 全体の音量をデフォルトに設定する
	syscom.set_bgm_volume_default         // BGM の音量をデフォルトに設定する
	syscom.set_koe_volume_default         // 声の音量をデフォルトに設定する
	syscom.set_pcm_volume_default         // 効果音の音量をデフォルトに設定する
	syscom.set_se_volume_default          // システム音の音量をデフォルトに設定する
	syscom.set_mov_volume_default         // ムービーの音量をデフォルトに設定する
	syscom.set_bgmfade_volume_default     // ＢＧＭフェードの値をデフォルトに設定する

	syscom.set_all_onoff_default          // 全体の ON/OFF をデフォルトに設定する
	syscom.set_bgm_onoff_default          // BGM の ON/OFF をデフォルトに設定する
	syscom.set_koe_onoff_default          // 声の ON/OFF をデフォルトに設定する
	syscom.set_pcm_onoff_default          // 効果音の ON/OFF をデフォルトに設定する
	syscom.set_se_onoff_default           // システム音の ON/OFF をデフォルトに設定する
	syscom.set_mov_onoff_default          // ムービーの ON/OFF をデフォルトに設定する
	syscom.set_bgmfade_onoff_default      // ＢＧＭフェードの ON/OFF をデフォルトに設定する

	$$PRM_SLD_SET(219)
	$$PRM_SLD_SET(220)
	$$PRM_SLD_SET(221)
	$$PRM_SLD_SET(222)
	$$PRM_SLD_SET(223)
	$$PRM_SLD_SET(224)
	$$PRM_SLD_SET(225)

	$$cbox_set(syscom.get_all_onoff,11,0)
	$$cbox_set(syscom.get_bgm_onoff,12,0)
	$$cbox_set(syscom.get_bgmfade_onoff,13,0)
	$$cbox_set(syscom.get_koe_onoff,14,0)
	$$cbox_set(syscom.get_pcm_onoff,15,0)
	$$cbox_set(syscom.get_se_onoff,16,0)
	$$cbox_set(syscom.get_mov_onoff,17,0)
	$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)

	return
}

command $$CHR_vol_reset{	//キャラ別音声一括初期化
	syscom.set_charakoe_onoff_default(001)
	syscom.set_charakoe_onoff_default(002)
	syscom.set_charakoe_onoff_default(003)
	syscom.set_charakoe_onoff_default(004)
	syscom.set_charakoe_onoff_default(005)
	syscom.set_charakoe_onoff_default(006)
	syscom.set_charakoe_onoff_default(007)
	<C_OBJ>[$stage].object[26].child[04].patno = 10
	<C_OBJ>[$stage].object[27].child[04].patno = 10
	<C_OBJ>[$stage].object[28].child[04].patno = 10
	<C_OBJ>[$stage].object[29].child[04].patno = 10
	<C_OBJ>[$stage].object[30].child[04].patno = 10
	<C_OBJ>[$stage].object[31].child[04].patno = 10
	<C_OBJ>[$stage].object[32].child[04].patno = 10
	//------------------------------------------------------------
	syscom.set_charakoe_volume_default(001)
	syscom.set_charakoe_volume_default(002)
	syscom.set_charakoe_volume_default(003)
	syscom.set_charakoe_volume_default(004)
	syscom.set_charakoe_volume_default(005)
	syscom.set_charakoe_volume_default(006)
	syscom.set_charakoe_volume_default(007)
	$$sld_pos_set(<C_OBJ>[$stage].object[26],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[27],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[28],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[29],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[30],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[31],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[32],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	return
}


//■■■■■■■■■■■■■■■■■■■■■■■■■■■■

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//コマンド群

//スライダパーツ読み込み
//##スライダー・スライダー下地を一括でセットするコマンド
command $$SLIDE_set_load(
		property $obj		: object,	//ベースオブジェクト
		property $x			: int,		//基本Ｘ座標
		property $y			: int,		//基本Ｙ座標
		property $SLD_B_NO	: int		//■スライダ下地の判定番号
	){
		property $SLD_X		//スライダーの補正座標
		property $SLD_Y		//
		property $SLD_B_X	//スライダー下地の補正座標
		property $SLD_B_Y	//

		$SLD_X	= 00	//スライダーの補正座標
		$SLD_Y	= 00	//
		$obj.init
		$obj.set_pos($x, $y)
		$obj.disp=1
		$obj.child.resize(4)	//子ブジェクトを予約
	
		$obj.child[00].create("_cfg_bar",1,$SLD_X, $SLD_Y,00)															//00_スライダ
		$obj.child[01].create("_cfg_bar",1,$SLD_X, $SLD_Y,10)	$obj.child[01].set_src_clip(1,000,000, 000,12)			//01_スライダ
		$$OBJBTN_RECT($obj.child[02],1,$SLD_X-15, $SLD_Y-20, <SL00_MAX>+30, 40,<MES_TR>,<SEL0>,$SLD_B_NO,1,-1)			//02_スライダ下地(透過)
		$obj.child[03].create("_cfg_sld",1,$SLD_X, $SLD_Y,00)	$obj.child[03].x_rep.resize(1)							//03_スライダ(非ボタン)
		return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//指定されたオブジェクトのスライダーを指定座標にセットするコマンド。「のびのび」も制御
command $$sld_pos_set(
		property $obj:object,
		property $pos:int
		){
			$obj.child[03].x_rep[0] = $pos						//スライダの位置設定
			$obj.child[01].set_src_clip(1,000,000, $pos,12)		//スライダ下の「のびのび」
			return
		}

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//フラグ値→スライダ値コンバータ　　第二引数はスライダの横幅最大値
command $$S2F(property $sys_prm : int , property $SLD_MAX : int) :int
	{	return(math.timetable($sys_prm,0,0,[0,255,$SLD_MAX]))}	//戻り値はスライダのx_rep座標として使える。
//スライダ値→フラグ値コンバータ　　第二引数はスライダの横幅最大値
command $$F2S(property $x_rep : int , property $SLD_MAX : int) :int
	{	return(math.timetable($x_rep,0,0,[0,$SLD_MAX,255]))}	//戻り値はシステムフラグのボリューム値として使える。
//Ｘスライダ値整形用コマンド	現行Ｘ値・スライダ最大値
command $$SVX_FIX(property $x : int , property $MAX : int ) :int
	{	return(math.limit(00,mouse.pos_x + $x,$MAX))}			//スライダ座標を整形

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$PRM_SLD_SET(property $btn_no :int)	//各種パラメタ値をスライダに反映させるコマンド
	{
	property $obj_no :int
	property $sys_prm :int

	$obj_no = $btn_no % 100	//オブジェクト番号算出
	switch($btn_no){
		case(126)	$sys_prm = math.timetable(syscom.get_auto_mode_moji_wait,0,0,[0,500,<SL00_MAX>])
		case(127)	$sys_prm = math.timetable(syscom.get_message_speed,0,0,[0,100,<SL00_MAX>])
		case(128)	$sys_prm = math.timetable(syscom.get_filter_color_a,0,0,[0,255,<SL00_MAX>])	<C_OBJ>[$stage].object[29].tr = syscom.get_filter_color_a
		//------------------------------------------------------------
		case(219)	$sys_prm = math.timetable(syscom.get_all_volume,0,0,[0,255,<SL00_MAX>])
		case(220)	$sys_prm = math.timetable(syscom.get_BGM_volume,0,0,[0,255,<SL00_MAX>])
		case(221)	$sys_prm = math.timetable(syscom.get_bgmfade_volume,0,0,[0,255,<SL00_MAX>])
		case(222)	$sys_prm = math.timetable(syscom.get_KOE_volume,0,0,[0,255,<SL00_MAX>])
		case(223)	$sys_prm = math.timetable(syscom.get_PCM_volume,0,0,[0,255,<SL00_MAX>])
		case(224)	$sys_prm = math.timetable(syscom.get_SE_volume,0,0,[0,255,<SL00_MAX>])
		case(225)	$sys_prm = math.timetable(syscom.get_MOV_volume,0,0,[0,255,<SL00_MAX>])
	}
	$$sld_pos_set(<C_OBJ>[$stage].object[$obj_no] , $sys_prm)
	return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##タイトルに戻る
command $$cfg_title
	{
	property $ctmp :intlist[10]		//汎用変数
		$ctmp[00] = $$dialog("タイトルに戻りますか？",0)
		if($ctmp[00] == 1){	//
			syscom.return_to_menu(0,0,1)
			se.play(001)
		}
	return
	}

//##ゲーム終了
command $$cfg_quit
	{
	property $ctmp :intlist[10]		//汎用変数
		$ctmp[00] = $$dialog("ゲームを終了しますか？",0)
		if($ctmp[00] == 1){	//
			syscom.end_game(0,0,1)
		}
	return
	}

//##矩形のボタン領域を作成する
command	$$OBJBTN_RECT(
	property $obj : object,
	property $DISP,
	property $XS,
	property $YS,
	property $X_rect,
	property $Y_rect,
	property $tr,
	property $group,
	property $btn_no,
	property $action,
	property $se
	)
	{
		$obj.create_rect($XS, $YS, $XS+$X_rect, $YS+$Y_rect, 255, 255, 000,$tr)
		$obj.disp = $DISP
		$obj.set_button($btn_no,$group,$action,$se)	//ボタン化
	}

//##ホイール値をオブジェクトと、指定のシステムパラメタに渡すコマンド。
command $$wh_set(
	property $obj_rep	: int,	;使用オブジェクトの補正座標
	property $prm_min	: int,	;スライダの下限値
	property $v_min		: int,	;システムパラメタの下限値
	property $prm_max	: int,	;スライダの上限値
	property $v_max		: int,	;システムパラメタの上限値
	property $btn_no	: int	//ボタン判定番号
	)	;##戻り値を２つ必要とするため、$ret[00] $ret[01] の２つを使用する。
	{
		$obj_rep += mouse.wheel * -10
		$ret[00] = math.limit($prm_min, $obj_rep, $prm_max)					//戻り値０　スライダカーソルの補正座標値
		$ret[01] = math.linear($obj_rep,$prm_min,$v_min,$prm_max,$v_max)	//戻り値１　システムパラメタへの代入値
		$ret[01] = math.limit($v_min,$ret[01],$v_max)						//戻り値１にＬｉｍｉｔかける
		$$PRM_SET($btn_no,$obj_rep)
		return
	}

//##サンプルボイス再生をNWAファイルで行うコマンド
command $$sampleKOE(
	property $file_name	:str,	//再生するファイル名
	property $koe_no	:int	//参照する声番号
	){
		pcmch[0].play($file_name,  chara_no=$koe_no , volume_type = 1 , bgm_fade_source = 1 )
		return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//スライダーの押しっぱなしループ制御コマンド
command $$SLD_LOOP(
	property	$obj_base : object,	//ベースとするオブジェクトの指定
	property	$obj_base_no : int,	//判定に使うボタン番号
	property	$sld_max	: int	//スライダの最大値
	){
		property	$SLD_X : int		//スライダのＸ座標用変数を用意
		$SLD_X = mouse.pos_x - $obj_base.x - $obj_base.child[03].x	//この２行で、スライダ部をクリック→その場所にスライダを移動させる　を実現させている
		$$sld_pos_set($obj_base,math.limit(00,$SLD_X,$sld_max))		//オブジェクトの座標移動のみで、パラメタの変更はループ内に一任

		$m_diff_x=$obj_base.child[03].x_rep[0]-mouse.pos_x
		while(input.decide.is_down == 1){	//ボタン押してる間、ここのループを続ける
			$SLD_X=$$SVX_FIX($m_diff_x,$sld_max)
			$$sld_pos_set($obj_base,$SLD_X)
			$$PRM_SET($obj_base_no,$SLD_X)		//パラメタセット・スライダへの反映
			input.next disp
		}
		return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$PRM_SET(		//ホイールとスライダで共用するので一元化
	property $btn_no : int,
	property $SLD_X : int
	){
		switch($btn_no){
			case(126)	$$automode_wait($SLD_X)	$$PRM_SLD_SET(126)														//オートモード待ち時間
			case(127)	syscom.set_message_speed(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,100]))		$$PRM_SLD_SET(127)	//メッセージ速度
			case(128)	syscom.set_filter_color_a(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))	$$PRM_SLD_SET(128)	//ＭＷ透過度
			//------------------------------------------------------------
			case(219)	syscom.set_all_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(219)
			case(220)	syscom.set_BGM_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(220)
			case(221)	syscom.set_bgmfade_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))	$$PRM_SLD_SET(221)
			case(222)	syscom.set_KOE_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(222)
			case(223)	syscom.set_PCM_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(223)
			case(224)	syscom.set_SE_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))			$$PRM_SLD_SET(224)
			case(225)	syscom.set_MOV_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(225)
			//------------------------------------------------------------
			case(241)	syscom.set_charakoe_volume(001 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(242)	syscom.set_charakoe_volume(002 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(243)	syscom.set_charakoe_volume(003 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(244)	syscom.set_charakoe_volume(004 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(245)	syscom.set_charakoe_volume(005 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(246)	syscom.set_charakoe_volume(006 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(247)	syscom.set_charakoe_volume(007 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
//			case(<CCH>+$CV_NO[00])	syscom.set_Charakoe_volume($CV_NO[00],$$F2S($SLD_X,$sld_max))
			}
		return
	}
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$automode_wait(	//オートモードの文字速度と最小時間を同時制御する
	property $prm :int
	){
		syscom.set_auto_mode_moji_wait(math.timetable($prm,0,0,[0,<SL00_MAX>,500]))
		syscom.set_auto_mode_min_wait(math.timetable($prm,0,0,[0,<SL00_MAX>,5000,1]))	//加速タイプ
		return
	}
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//$$CFG_CHR_LOAD($$OBJBTN_SET(<C_OBJ>[$stage].object[26],00,"_cfg_sound_chrbase_jd",0991,0237)
command $$CFG_CHR_LOAD(	//キャラ別音量設定
	property $obj    : object,
	property $chr_no : int,
	property $file   : str,
	property $btn_no : int
	){
	property $ctmp :intlist[10]		//汎用変数
	property $sctmp :strlist[10]	//汎用文字列変数

	property $pos_X  : int
	property $pos_Y  : int

	property $SLD_X		//スライダーの補正座標
	property $SLD_Y		//
	property $SLD_B_X	//スライダー下地の補正座標
	property $SLD_B_Y	//

	$pos_X = $cfg_ch_x[$chr_no]
	$pos_Y = $cfg_ch_y[$chr_no]


	$obj.child.resize(6)
	$obj.disp = 1
	$obj.set_pos($pos_X,$pos_Y)

	//オン・オフは child[04]
	$$OBJBTN_SET($obj.child[04],$file,1, 000,000,255,<SEL0>, $chr_no + 230 ,1,1,0,0,0)
	$obj.child[04].patno = syscom.get_charakoe_onoff($chr_no)*10		//オンオフで基本パターン番号変更
	//------------------------------------------------------------
	$SLD_X	= 005	//スライダーの補正座標
	$SLD_Y	= 240	//
	$obj.child[00].create("_cfg_sound_chr_bar",1,$SLD_X, $SLD_Y,00)															//00_スライダ
	$obj.child[01].create("_cfg_sound_chr_bar",1,$SLD_X, $SLD_Y,10)	$obj.child[01].set_src_clip(1,000,000, 000,12)			//01_スライダ
	$$OBJBTN_RECT($obj.child[02],1,$SLD_X-15, $SLD_Y-20, <SL01_MAX>+30, 40,<MES_TR>,<SEL0>,$chr_no + 240 ,1,-1)				//02_スライダ下地(透過)
	$obj.child[03].create("_cfg_sound_chr_sld",1,$SLD_X, $SLD_Y,00)	$obj.child[03].x_rep.resize(1)							//03_スライダ(非ボタン)
	$$sld_pos_set($obj,math.timetable(syscom.get_charakoe_volume($chr_no),0,0,[0,255,<SL01_MAX>]))
	//------------------------------------------------------------
	$$OBJBTN_SET($obj.child[05],	"_cfg_sound_chr_preview"		,1, 102,004,255,<SEL0>,$chr_no + 250,1,1,0,0,1)				//サンプル音声再生

	//##シナリオ進度・キャラによって表示・非表示を切り替える部分
	if(($chr_no == 03)&&(<cfg_chr> < 1)){	$ctmp[00] = 1 }
	if(($chr_no == 05)&&(<cfg_chr> < 2)){	$ctmp[00] = 1 }
	if(($chr_no == 04)&&(<cfg_chr> < 3)){	$ctmp[00] = 1 }
	if($ctmp[00] ==1){	$obj.disp=0	}

	return
	}


#inc_start

	#property	$s_waip		: int		;画面切り替えの速度
	#property	$s_midoku	: int		;未読部分もスキップ可能にする
	#property	$s_mestr	: int		;メッセージ透過度
	#property	$s_mwanm	: int		;メッセージウィンドウの開閉時のアニメ
	//日付のオンオフ等、基本以外の項目は、グローバル汎用スイッチを使用のこと。(要使用宣言)
	#property	$b_posx		: int		;スライダで使用。ボタンの座標
	#property	$m_diff_x	: int		;スライダで使用。マウス位置とボタンの座標差（Ｘ）
	#property	$m_diff_y	: int		;スライダで使用。マウス位置とボタンの座標差（Ｙ）
	#property	$all_set	: int		;全ての設定をオブジェクトに一気に反映させる用のフラグ
//	#property	$CV_ORG_X	:intlist[<CHR_MAX>]	//キャラ別音声用座標ストック基本の座標が入る
//	#property	$CV_ORG_Y	:intlist[<CHR_MAX>]	//キャラ別音声用座標ストック基本の座標が入る
//	#property	$CV_X		:intlist[<CHR_MAX>]	//キャラそれぞれの実際に配置する座標が入る。非表示モノを画面外にトバすために、CV_ORG_Xの中身をストックする
//	#property	$CV_Y		:intlist[<CHR_MAX>]	//
//	#property	$CV_NO		:intlist[<CHR_MAX>]	//$CV_NO[キャラ音声オブジェクト番号] = 声制御番号　　-1が入ってたら不使用

	#property	$prv_txt	:strlist[50]	//プレビュー用文字列をストック
	#property	$prv_max	:int			//プレビュー用文字列の最大データ番号。この番号から０に向かって表示が進みます
	#property	$config		:int		//コンフィグメニューでの実行かどうか。外からの終了確認ダイアログ直接呼び出し等で使用。
	#property	$old_tab	:int		//直前まで居たタブの番号をストック。文字アニメの初期化等に使用。
	#property	$NUM_1MJ	:int		//オートモード　１文字の表示時間	０＝上２桁　１＝下２桁
	#property	$NUM_MIN	:int		//オートモード　最小待ち時間		０＝上２桁　１＝下２桁
	#property	$NUM_SMP	:int		//オートモード　１０文字の表示時	０＝上２桁　１＝下２桁
	#property	$CF_WIPE	:int		//呼び出しのワイプなのか、内部でのページ切り替えワイプなのかの判定。1=内部　$SL_WIPE と同じ使い方してる
	#property	$w_mode		:int		//ウィンドウモードのチェック用

	#property	$cfg_ch_x	:intlist[10]	//キャラ別音声のXY座標
	#property	$cfg_ch_y	:intlist[11]	

	//多用するパーツ用変数
	#property	$F_CHK		:str		//チェックボックス用ファイルネーム
	#property	$F_SLD		:str		//スライダー用ファイルネーム
	#macro	@return if($all_set != 1){ return	}	//初期読み込みで使用。 $all_set=１ でスルー。それ以外でリターン。

	#DEFINE		<C_OBJ>[		excall.stage[	//使用オブジェクトの短縮指定
	#DEFINE		<MES_TR>		000	//##チェックボックスの後ろの説明文用。マウス反応範囲を見るための物なので最終的には０にする
	#DEFINE		<SL00_MAX>		686
	#DEFINE		<SL01_MAX>		140	//キャラ別用

#inc_end


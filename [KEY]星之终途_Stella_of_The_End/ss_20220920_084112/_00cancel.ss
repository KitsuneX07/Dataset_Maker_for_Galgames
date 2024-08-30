//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//	システムメニュー部。
//右クリックされたときにここがよばれる

#inc_start	//ボタン類の番号をデファイン化
	#define	<b_bas>	00	//下地
	#define	<b_sav>	01	//セーブ
	#define	<b_lod>	02	//ロード
	#define	<b_cnf>	03	//環境設定
	#define	<b_log>	04	//バックログ
	#define	<b_aut>	05	//オートモード開始
	#define	<b_skp>	06	//スキップ開始
	#define	<b_twi> 07	//ツイート
	#define	<b_tit>	08	//タイトル画面に戻る
	#define	<b_bak>	09	//バック
	#define	<b_mov>	11	//ムービー

	#define	<b_dlg>	10	//確認ダイアログ用

	#property	$backlog	int		//バックログ判定用フラグ
	#define		<C_OBJ>[	excall.stage[	//使用オブジェクトの短縮指定

#inc_end

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z00

	switch(<RC_CHK>){
		case(00)	se.play(01) //
		case(01)	gosub #Z02	return	//ウィンドウ消去
		case(02)	syscom.call_config_menu	return//コンフィグ
	}

#Z01	//右クリックメニュー
	capture					//##セーブサムネ用キャプチャ
	capture_for_tweet		//##ツイート用キャプチャ
	syscom.set_syscom_menu_disable	//システムメニュー禁止
	syscom.set_mwnd_btn_disable		//メッセージウィンドウボタンを使用不可に

	syscom.set_auto_mode_onoff_flag(0)	//オートモードオフ
	syscom.set_read_skip_onoff_flag(0)	//スキップモードオフ

	$$excall_ready(0)

	$stage=0			//back
	<C_OBJ>[$stage].object[<b_bas>].create("ev_kuro",1,000,000)
	<C_OBJ>[$stage].object[<b_bas>].tr = 128
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_sav>],	"_cm01_SAVE"	,1, 000,000,255,0,01,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_lod>],	"_cm02_LOAD"	,1, 000,000,255,0,02,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_cnf>],	"_cm03_CONFIG"	,1, 000,000,255,0,03,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_log>],	"_cm04_BACKLOG"	,1, 000,000,255,0,04,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_aut>],	"_cm05_AUTO"	,1, 000,000,255,0,05,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_skp>],	"_cm06_SKIP"	,1, 000,000,255,0,06,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_twi>],	"_cm07_TWEET"	,1, 000,000,255,0,07,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_tit>],	"_cm08_TITLE"	,1, 000,000,255,0,08,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_bak>],	"_cm09_BACK"	,1, 000,000,255,0,09,1,1,0,0,1)
		//オートモードとスキップは状態に合わせてボタン状態変更

//	if(syscom.get_auto_mode_onoff_flag == 1){<C_OBJ>[$stage].object[<b_aut>].set_button_state_select}	//オートモード
//	if(syscom.get_read_skip_onoff_flag == 1){<C_OBJ>[$stage].object[<b_skp>].set_button_state_select}	//スキップモード
	if(<PURORO> == 0){<C_OBJ>[$stage].object[<b_tit>].set_button_state_disable}							//タイトル
	IF(check_savepoint == 0 ){ <C_OBJ>[$stage].object[<b_sav>].set_button_state_disable	}	//セーブポイント立ってなかったらセーブページに行かせない。

	$$show_animation($stage)	// 表示アニメーション
	
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

	$stage=1			//front
	while(1){
		<C_OBJ>[$stage].objbtngroup[0].init
		$tmp[00] = <C_OBJ>[$stage].objbtngroup[0].sel_cancel
		switch($tmp[00]){
			case(-1) se.play(02) break									//右クリック抜け
			case(01) $$system_page_init_effect(excall.stage[$stage].object[100])
					 <SL_mode> = 00	farcall("_00saveload",10) break	//セーブ
			case(02) $$system_page_init_effect(excall.stage[$stage].object[100])
					 <SL_mode> = 01	farcall("_00saveload",10) break	//ロード
			case(03) $$system_page_init_effect(excall.stage[$stage].object[100])
					 farcall("_00config",10) break					//コンフィグ
			case(04) break		//バックログ
			case(05) break		//オートモード
			case(06) break		//スキップ
			case(07) syscom.open_tweet_dialog	break		//ツイート
			case(08) $$cfg_title	//syscom.return_to_menu(0,0,1)		//タイトルに戻る
			case(09) se.play(02) break	//ＢＡＣＫ
		}
	}

	$$excall_free
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//メッセージウィンドウボタンを使用可に
	syscom.set_syscom_menu_enable	//右クリ許可
	capture_free_for_tweet	//##ツイート用キャプチャ解放
	capture_free			//##セーブサムネ用キャプチャ解放
	//ＥＸコール抜けてから色々実行する部分
	switch($tmp[00]){
		case(04)	syscom.open_msg_back	//バックログ表示
		case(05)	syscom.set_auto_mode_onoff_flag(1)	//オートモード
		case(06)	syscom.set_read_skip_onoff_flag(1)	//スキップ
//		case(07)	syscom.open_tweet_dialog	//ツイート
	}
return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z02	//右クリ＝ウィンドウ消去時の設定

	close
	while(1){	//選択用ループ
		if(input.decide.on_down_up == 1){ break }	//決定キーで次へ。
		if(input.cancel.on_down_up == 1){ break }	//キャンセルキーで抜け
		input.next
		disp
	}
	input.clear
	open
return

#Z10
//$$excall_ready(1)
syscom.call_syscom_menu
//$$excall_free
return

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

// 表示アニメーション
command $$show_animation(property $stage_no)
{
	property $i
	property $anim_time
	property $anim_start_time
	
	// ムービー
	<C_OBJ>[$stage_no].object[<b_mov>].create_movie(ef_noise3, 1, ready_only = 1)
	<C_OBJ>[$stage_no].object[<b_mov>].set_scale(2000, 2000)
	<C_OBJ>[$stage_no].object[<b_mov>].blend = 1
	<C_OBJ>[$stage_no].object[<b_mov>].layer = 1
	<C_OBJ>[$stage_no].object[<b_mov>].tr_eve.set(0, 500, 1000, 1)
	<C_OBJ>[$stage_no].object[<b_mov>].bright = 192
	<C_OBJ>[$stage_no].object[<b_mov>].bright_eve.set(0, 350, 0, 1)
	
	// 各ボタンアニメーション
	for( $i = <b_sav>, $i <= <b_bak>, $i += 1 )
	{
		<C_OBJ>[$stage_no].object[$i].x_rep.resize(1)
		<C_OBJ>[$stage_no].object[$i].y_rep.resize(1)
		<C_OBJ>[$stage_no].object[$i].x_rep[0] += <SCREEN_CENTER_X>
		<C_OBJ>[$stage_no].object[$i].y_rep[0] += <SCREEN_CENTER_Y>
		
		if( $i == <b_bak> )
		{
			$anim_time = 200
			$anim_start_time = 450
		}
		else
		{
			$anim_time = 150
			$anim_start_time = 480 + $i * 20
		}
		
		<C_OBJ>[$stage_no].object[$i].layer = 2
		
		<C_OBJ>[$stage_no].object[$i].tr = 0
		<C_OBJ>[$stage_no].object[$i].tr_eve.set(255, $anim_time, $anim_start_time, 1)
		
		<C_OBJ>[$stage_no].object[$i].set_scale(250, 250)
		<C_OBJ>[$stage_no].object[$i].scale_x_eve.set(1000, $anim_time, $anim_start_time, 2)
		<C_OBJ>[$stage_no].object[$i].scale_y_eve.set(1000, $anim_time, $anim_start_time, 2)
	}
	
	// 演出オフの場合はアニメーション終了
	if( syscom.get_no_wipe_anime_onoff == 1 )
	{
		for( $i = <b_bas>, $i <= <b_mov>, $i += 1 ) {
			<C_OBJ>[$stage_no].object[$i].all_eve.end
		}
	}
		
	<C_OBJ>[$stage_no].object[<b_mov>].resume_movie
}

//タイトルメニュー

#inc_start
	
	#property $hit_no
	#property $pushed_no
	#property $decided_no
	#property $i
	#property $index
	#property $time

#inc_end

#Z00


#init	//各種初期化
	syscom.set_syscom_menu_disable




#menu_disp	//メニュー表示

	//-------------------------------------------
	// オブジェジェクト作成
	if( <GAME_CLEAR> )
	{
		// クリア後
		back.object[10].create("_TM_base"	,1,000,000,1)		// 背景
		back.object[12].create("_TM_base"	,1,000,000,2)		// 鳥
		
		back.object[11].create_movie("ef_flare20",1)
		back.object[11].blend = 4
		back.object[11].tr_eve.set(0, 1000, 7000, 0)
	}
	else
	{
		// クリア前
		back.object[10].create("_TM_base"	,1,000,000,1)		// 背景
		back.object[12].create("_TM_base"	,1,000,000,0)		// キャラ
		
		back.object[11].create_movie_loop("ef_dust05",1)		// 塵
		back.object[11].blend = 4
	}
	
	back.object[20].create("_TM_title"	,1,000,000)			// タイトルロゴ
	back.object[21].create("_TM_credit"	,1,000,000)			// copyright

	// ボタン
	back.object[40].create("_TM_01start"	,1,139,459)
	back.object[41].create("_TM_02capter"	,1,137,539)
	back.object[42].create("_TM_03load"		,1,138,619)
	back.object[43].create("_TM_04config"	,1,137,699)
	back.object[44].create("_TM_05extra"	,1,138,779)
	back.object[45].create("_TM_06exit"		,1,138,859)
	
	$sel_g0 = 00
	back.object[40].set_button(00,$sel_g0, 1, 3)
	back.object[41].set_button(01,$sel_g0, 1, 0)
	back.object[42].set_button(02,$sel_g0, 1, 0)
	back.object[43].set_button(03,$sel_g0, 1, 0)
	back.object[44].set_button(04,$sel_g0, 1, 0)
	back.object[45].set_button(05,$sel_g0, 1, 0)
	
	// ボタン背景
	for( $i = 0, $i < 6, $i += 1 )
	{
		$index = 40 + $i
		back.object[30 + $i].create_rect(0, 0, back.object[$index].get_size_x, back.object[$index].get_size_y, 0, 0, 0, 255, 1)
		back.object[30 + $i].set_pos(back.object[$index].x, back.object[$index].y)
		back.object[30 + $i].scale_x = 0
	}
	
	if(<GAME_CLEAR> == 0){back.object[44].set_button_state_disable}
	if(G[201] == 0){back.object[41].set_button_state_disable}
	
	//-------------------------------------------
	// アニメーション作成
	
	// 背景
	back.object[10].y = -300
	back.object[10].y_eve.set(-(1927 - 1080), 7000, 0, 0)
	back.object[10].bright = 255
	back.object[10].bright_eve.set(0, 5000, 0, 2)
	
	// キャラ
	back.object[12].y = -300
	back.object[12].y_eve.set(-(1927 - 1080), 7000, 0, 0)
	back.object[12].tr = 0
	back.object[12].tr_eve.set(255, 1000, 7000, 1)
	
	// タイトルロゴ
	$$set_image_center(back.object[20])
	back.object[20].set_scale(1100, 1100)
	back.object[20].scale_x_eve.set(1000, 1000, 7000, 2)
	back.object[20].scale_y_eve.set(1000, 1000, 7000, 2)
	back.object[20].tr = 0
	back.object[20].tr_eve.set(255, 1000, 7000, 1)

	// copyright
	back.object[21].tr = 0
	back.object[21].tr_eve.set(255, 1000, 7000, 1)
	
	// ボタン
	for( $i = 0, $i < 6, $i += 1 )
	{
		$time = 8000 + $i * 150
		
		back.object[40 + $i].f.resize(1)
		
		back.object[40 + $i].tr = 0
		back.object[40 + $i].tr_eve.set(255, 1000, $time, 1)
		
		back.object[40 + $i].x_rep.resize(1)
		back.object[40 + $i].x_rep[0] = -200
		back.object[40 + $i].x_rep_eve[0].set(0, 1000, $time, 2)
	}
	
	wipe(0, 1000)

	@bgm(bgm01)

#btn_chk	//判定部

	front.objbtngroup[$sel_g0].init
	front.objbtngroup[$sel_g0].start
	
	while( 1 )
	{
		$hit_no = front.objbtngroup[$sel_g0].get_hit_no
		$pushed_no = front.objbtngroup[$sel_g0].get_pushed_no
		$decided_no = front.objbtngroup[$sel_g0].get_decided_no
		
		// アニメーションスキップ判定
		if( input.decide.on_down_up == 1 || input.cancel.on_down_up == 1 )
		{
			for( $i = 0, $i < 50, $i += 1 )
			{
				if( front.object[$i].disp )
				{
					front.object[$i].all_eve.end
				}
			}
		}
		
		// ボタンクリックチェック
		if( 0 <= $decided_no && $decided_no <= 5 )
		{
			break
		}
		
		// ボタンのマウスオーバーチェック
		if( 0 <= $hit_no && $hit_no <= 5 )
		{
			if( front.object[40 + $hit_no].f[0] == 0 )
			{
				front.object[40 + $hit_no].f[0] = 1
				
				// ボタン背景をアニメーション
				front.object[30 + $hit_no].scale_x = 0
				front.object[30 + $hit_no].scale_x_eve.set(1000, 200, 0, 2)
			}
		}
		
		// ボタンのマウスオーバー解除チェック
		for( $i = 0, $i < 6, $i += 1 )
		{
			if( $hit_no == $i || $pushed_no == $i )
			{
				continue
			}
			
			// ボタン背景のアニメーション解除
			if( front.object[40 + $i].f[0] == 1 )
			{
				front.object[40 + $i].f[0] = 0
				front.object[30 + $i].scale_x_eve.set(0, 200, 0, 2)
			}
		}
		
		input.next
		disp
	}

switch($decided_no){
	case(00)	gosub #start
	case(01)	gosub #chapter
	case(02)	gosub #load
	case(03)	gosub #config
	case(04)	gosub #extra
	case(05)	gosub #exit
}
syscom.set_syscom_menu_disable
goto #btn_chk

//------------------------------------------------------------
#start
	
	@bgm_stop(2000)
	
	// STARTボタン背景をアニメーション
	front.object[30].center_rep_y = front.object[40].get_size_y / 2
	front.object[30].scale_y_eve.set(0, 250, 500, 2)
	front.object[30].bright_eve.turn(0, 128, 250, 0, 2)
	
	// STARTボタンを点滅
	front.object[40].tr_eve.turn(0, 255, 250, 0, 0)
	
	timewait_key(1000)
	
	front.object[50].create_movie(ef_monitor02_off, 1, auto_free = 0)
	front.object[50].layer = <LAYER_SYS_EFFECT>
	
	timewait_key(2000)

	syscom.set_syscom_menu_enable
	

	// ゲームクリアしていない場合はchapter2から
	if(<GAME_CLEAR> == 1 || <TRIAL_CLEAR> == 1){
		farcall("00シナリオフロー")
	}else{
		farcall("00シナリオフロー", 2)
	}
	return

//-------------
#chapter
	farcall(_00Chapter)
	return

//-------------
#load	
	syscom.call_load_menu
	return

//-------------
#config
	syscom.call_config_menu
	return

//-------------
#extra
	farcall(_00gallery)
	return

//-------------
#exit
	$tmp[00] = $$dialog("ゲームを終了しますか？",0)
	if($tmp[00] == 1){	//
		syscom.end_game(0,0,1)
	}
	return



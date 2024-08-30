//===========================================================================
//!
//!    @file     _10effects_sys_macro.inc
//!    @brief    システム寄りの演出マクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     タイトルにとらわれず使い回しが可能そうな演出コマンド
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
// オブジェクト番号
#define		<OBJ_SYS_EFFECT>				(<O_EFF> + 1)

#define		<OBJ_SYS_EF_FLASH>				(<OBJ_SYS_EFFECT> + 0)		// フラッシュ
#define		<OBJ_SYS_EF_SCREEN_FILTER>		(<OBJ_SYS_EFFECT> + 1)		// スクリーンフィルター
#define		<OBJ_SYS_EF_CINEMASCOPE1>		(<OBJ_SYS_EFFECT> + 2)		// シネマスコープ上
#define		<OBJ_SYS_EF_CINEMASCOPE2>		(<OBJ_SYS_EFFECT> + 3)		// シネマスコープ下
#define		<OBJ_SYS_EF_FILM_NOISE>			(<OBJ_SYS_EFFECT> + 4)		// フィルムノイズ
#define		<OBJ_SYS_EF_DOT_NOISE>			(<OBJ_SYS_EFFECT> + 5)		// ドットノイズ
#define		<OBJ_SYS_EF_LINE>				(<OBJ_SYS_EFFECT> + 6)		// 集中線
#define		<OBJ_SYS_EF_RECOLLECT>			(<OBJ_SYS_EFFECT> + 7)		// 回想枠
#define		<OBJ_SYS_EF_END>				(<OBJ_SYS_EFFECT> + 8)

// オブジェクト
#define		$b_obj_bg						back.object[<O_BG>]
#define		$b_obj_cg						back.object[<O_CG>]
#define		$f_obj_bg						front.object[<O_BG>]
#define		$f_obj_cg						front.object[<O_CG>]

// レイヤー値
#define		<LAYER_SYS_FRONT_BG>			1			// 背景より前、立ち絵より後ろ
#define		<LAYER_SYS_EFFECT>				10000		// すべての上

// メッセージウィンドウ
#define		<WINDOW_MOJI_SIZE>				35			// Gameexe.ini #MWND.000.MOJI_SIZE
#define		<WINDOW_MOJI_SPACE_X>			0			// Gameexe.ini #MWND.000.MOJI_SPACE
#define		<WINDOW_MOJI_SPACE_Y>			25			// Gameexe.ini #MWND.000.MOJI_SPACE
#define		<WINDOW_MESSAGE_POS_X>			290			// Gameexe.ini #MWND.000.MESSAGE_POS
#define		<WINDOW_MESSAGE_POS_Y>			150			// Gameexe.ini #MWND.000.MESSAGE_POS
// 効果音
#define		<PCMCH_MAX>						16			// Gameexe.ini #PCMCH.CNT


//===========================================================================
// マクロ
//===========================================================================

//-----------------------------------------------------------------
// テキストセンタリング
//-----------------------------------------------------------------
#macro	@テキストセンタリング開始(@close(1))
	script.set_msg_back_off
	if( @close ) { close }
	set_waku(1)
	
#macro	@テキストセンタリング(@msg, @koe_no(-1), @chara_no(-1), @name(""), @rep_index(5), @print(1))
	$$add_msgback(@koe_no, @chara_no, @name, @msg)
	if( @koe_no != -1 ) {
		KOE(@koe_no, @chara_no)
	}
	
	L[0] = $$get_text_centering_rep_x(@msg, <WINDOW_MOJI_SIZE> + <WINDOW_MOJI_SPACE_X>, <WINDOW_MESSAGE_POS_X>)
	L[1] = (<WINDOW_MOJI_SIZE> + <WINDOW_MOJI_SPACE_Y>) * @rep_index
	
	rep_pos(L[0], L[1])
	if( @print ) {
		print(@msg)
	}

#macro	@テキストセンタリング終了(@close(1))
	rep_pos
	script.set_msg_back_on
	if( @close ) { close }
	set_waku(0)

//-----------------------------------------------------------------
// ウィンドウクローズを行わない
//-----------------------------------------------------------------
#macro	@no_close
	$WC = 1
	$WR = 1

//-----------------------------------------------------------------
// キー入力待ち
//-----------------------------------------------------------------
#macro	@timewaitkey(@time)
	if( <EFFECT_CUT> ) {
	} else {
		timewait_key(@time)
	}

//-----------------------------------------------------------------
// メッセージウィンドウをクリア状態で開く
//-----------------------------------------------------------------
#macro	@open_mw(@clear(1))
	script.set_msg_back_off		// メッセージバックに追加しない
	if( @clear ) {
		clear
		print("")					// 強制的にclearを発生させる
	}
	open
	script.set_msg_back_on		// メッセージバックに追加する

//-----------------------------------------------------------------
// ワイプを実行する
//-----------------------------------------------------------------
#macro	@wipe_effects_bg(@wipe_no, @wipe_wait(1), @wipe_time(0))
	$$wipe_effects_base(@wipe_no, <WIPE_BG>, @wipe_wait, @wipe_time)

#macro	@wipe_effects_cg(@wipe_no, @wipe_wait(1), @wipe_time(0))
	$$wipe_effects_base(@wipe_no, <WIPE_CG>, @wipe_wait, @wipe_time)
	
#macro	@wipe_effects_bup(@wipe_no(0), @wipe_wait(0), @wipe_time(0))
	$$wipe_effects_base(@wipe_no, <WIPE_CH>, @wipe_wait, @wipe_time)

//-----------------------------------------------------------------
// 背景＋立ち絵表示
//-----------------------------------------------------------------
#macro	@bgs(@bup_name, @bg_name(<DISP_BG>), @wipe_no(3))
	@BUP(@bup_name, <SET>)
	@BG(@bg_name, @wipe_no)

//-----------------------------------------------------------------
// 立ち絵の表情変更(ウェイト待ちを行う)
//-----------------------------------------------------------------
#macro	@bup_wait(@bup_name, @wipe_no(0))
	@BUP(@bup_name, <SET>)
	@wipe_effects_bup(@wipe_no, 1)

//-----------------------------------------------------------------
// 現在の立ち絵に追加で立ち絵を表示させる
//-----------------------------------------------------------------
#macro	@bup_al(@bup_name, @wipe_no(0))
	@bup_x(@bup_name, @wipe_no, $$add_bup_and_get_pos(@bup_name, 1))

#macro	@bup_ar(@bup_name, @wipe_no(0))
	@bup_x(@bup_name, @wipe_no, $$add_bup_and_get_pos(@bup_name, 0))

//-----------------------------------------------------------------
// 立ち絵の表情のみを変更
//-----------------------------------------------------------------
#macro	@bup_face(@bup_name, @wipe_no(0), @wipe_wait(0))
	$$change_bup_face_only(@bup_name)
	@wipe_effects_bup(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// 立ち絵の透明度を設定する
//-----------------------------------------------------------------
#macro	@bup_tr_set(@bup_name, @tr)
	@BUP(@bup_name, <SET>)
	back.object[$$chr2num(@bup_name)].tr = @tr

//-----------------------------------------------------------------
// 立ち絵を移動させる
//-----------------------------------------------------------------
#macro	@bup_move_x(@bup_name, @src_x, @dst_x, @time, @speed_mode)
	$$move_bup_x(@bup_name, @src_x, @dst_x, @time, @speed_mode)

//-----------------------------------------------------------------
// 立ち絵スライドイン
//-----------------------------------------------------------------
#macro	@bup_in_x(@bup_name, @distance(300), @time(500), @speed_mode(2), @wipe_no(0))
	@BUP(@bup_name, <SET>)
	$$move_bup_x(@bup_name, @distance, 0, @time, @speed_mode)
	@wipe_effects_bup(@wipe_no)

#macro	@bup_in_y(@bup_name, @distance(300), @time(500), @speed_mode(2), @wipe_no(0))
	@BUP(@bup_name, <SET>)
	$$move_bup_y(@bup_name, @distance, 0, @time, @speed_mode)
	@wipe_effects_bup(@wipe_no)

//-----------------------------------------------------------------
// 立ち絵スライドアウト
//-----------------------------------------------------------------
#macro	@bup_out_x(@bup_name, @distance(300), @time(500), @speed_mode(2), @wipe_no(0))
	front.object[$$chr2num(@bup_name)].wipe_copy = 0
	$$move_bup_x(@bup_name, 0, @distance, @time, @speed_mode)
	@wipe_effects_bup(@wipe_no)

#macro	@bup_out_y(@bup_name, @distance(300), @time(500), @speed_mode(2), @wipe_no(0))
	front.object[$$chr2num(@bup_name)].wipe_copy = 0
	$$move_bup_y(@bup_name, 0, @distance, @time, @speed_mode)
	@wipe_effects_bup(@wipe_no)

//-----------------------------------------------------------------
// 背景ファイル名のブラーオン／オフ
//-----------------------------------------------------------------
#macro	@blur_on(@filename)		$$on_bgfile_blur(@filename)
#macro	@blur_off(@filename)	$$off_bgfile_blur(@filename)

//-----------------------------------------------------------------
// 背景＋立ち絵表示(中距離フォーカス)
//-----------------------------------------------------------------
#macro	@bgs_mf(@bup_name, @bg_name(<DISP_BG>), @wipe_no(3))
	@bs_next
	@BUP_C(@bup_name, <SET>)
	@bg_set($$on_bgfile_blur(@bg_name), 1250)
	@wipe_effects_bg(@wipe_no)

//-----------------------------------------------------------------
// 背景＋立ち絵表示(近距離フォーカス)
//-----------------------------------------------------------------
#macro	@bgs_nf(@bup_name, @bg_name(<DISP_BG>), @wipe_no(3))
	@bs_next
	@BUP_C(@bup_name, <SET>)
	@bg_set($$on_bgfile_blur(@bg_name), 1500)
	@wipe_effects_bg(@wipe_no)

//-----------------------------------------------------------------
// 背景＋立ち絵表示(フォーカス解除)
//-----------------------------------------------------------------
#macro	@bgs_rf(@bup_name, @bg_name(<DISP_BG>), @wipe_no(3))
	@BUP(@bup_name, <SET>)
	@bg_set($$off_bgfile_blur(@bg_name), 1000)
	@wipe_effects_bg(@wipe_no)

//-----------------------------------------------------------------
// 立ち絵ドラマスクロール
//-----------------------------------------------------------------
#macro	@drama_scroll(@bup_name, @bg_name(<DISP_BG>), @wipe_no(3), @move_distance(150), @move_time(2500), @speed_mode(2), @bup_pos_reset(0), @bup_extension(1))
	// 背景
	@bg_set($$on_bgfile_blur(@bg_name), 1500, 0, 0)
	$$set_pos_eve($b_obj_bg, @move_distance, 0, 0, 0, @move_time, 0, @speed_mode)
	// 立ち絵
	if( @bup_pos_reset ) { 
		@BUP_C(@bup_name, <SET>)
	} else {
		@BUP(@bup_name, <SET>)
	}
	$$set_pos_rep_eve(back.object[$$chr2num(@bup_name)], <BUP_MOVE_REP>, -@move_distance, 0, 0, 0, @move_time, 0, @speed_mode)
	if( @bup_extension ) {
		$$bup_extension(back.object[$$chr2num(@bup_name)], @bup_name)
	}
	
	@wipe_effects_bg(@wipe_no)

//-----------------------------------------------------------------
// 拡張背景設定（座標、拡縮設定）
//-----------------------------------------------------------------
#macro	@bg_set(@filename, @scale(1000), @pos_x(0), @pos_y(0))
	$$create_effects_bg_object($b_obj_bg, @filename)
	$b_obj_bg.set_scale(@scale, @scale)
	$$set_pos($b_obj_bg, @pos_x, @pos_y)

//-----------------------------------------------------------------
// 拡張ＣＧ設定（座標、拡縮設定）
//-----------------------------------------------------------------
#macro	@cg_set(@filename, @scale(1000), @pos_x(0), @pos_y(0))
	$$create_effects_cg_object($b_obj_cg, @filename)
	$b_obj_cg.set_scale(@scale, @scale)
	$$set_pos($b_obj_cg, @pos_x, @pos_y)

//-----------------------------------------------------------------
// ＣＧ表示(ワイプ待ちなし)
//-----------------------------------------------------------------
#macro	@cg_nowait(@filename, @wipe_no(0), @wipe_time(0))
	$$create_effects_cg_object($b_obj_cg, @filename)
	@wipe_effects_cg(@wipe_no, 0, @wipe_time)

//-----------------------------------------------------------------
// 背景パン
//-----------------------------------------------------------------
#macro	@bg_pan_lr(@filename(<DISP_BG>), @wipe_no(3), @time(35000), @speed_mode(0), @pos_y(0), @wipe_wait(1))
	@bg_move(@filename, @wipe_no, 480, @pos_y, -480, @pos_y, @time, @speed_mode, 1500, @wipe_wait)

#macro	@bg_pan_rl(@filename(<DISP_BG>), @wipe_no(3), @time(35000), @speed_mode(0), @pos_y(0), @wipe_wait(1))
	@bg_move(@filename, @wipe_no, -480, @pos_y, 480, @pos_y, @time, @speed_mode, 1500, @wipe_wait)

#macro	@bg_pan_ud(@filename(<DISP_BG>), @wipe_no(3), @time(25000), @speed_mode(0), @pos_x(0), @wipe_wait(1))
	@bg_move(@filename, @wipe_no, @pos_x, 270, @pos_x, -270, @time, @speed_mode, 1500, @wipe_wait)

#macro	@bg_pan_du(@filename(<DISP_BG>), @wipe_no(3), @time(25000), @speed_mode(0), @pos_x(0), @wipe_wait(1))
	@bg_move(@filename, @wipe_no, @pos_x, -270, @pos_x, 270, @time, @speed_mode, 1500, @wipe_wait)

#macro	@bg_move(@filename(<DISP_BG>), @wipe_no(3), @src_x(0), @src_y(0), @dst_x(0), @dst_y(0), @move_time(30000), @speed_mode(0), @scale(1500), @wipe_wait(1))
	$$create_effects_bg_object($b_obj_bg, @filename)
	$b_obj_bg.set_scale(@scale, @scale)
	$$set_pos_eve($b_obj_bg, @src_x, @src_y, @dst_x, @dst_y, @move_time, 0, @speed_mode)
	@wipe_effects_bg(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// 背景ズーム
//-----------------------------------------------------------------
#macro	@bg_zoom_up(@filename(<DISP_BG>), @wipe_no(3), @dst_zoom(1500), @time(35000), @speed_mode(0), @wipe_wait(1))
	@bg_zoom(@filename, @wipe_no, 1000, @dst_zoom, @time, @speed_mode, @wipe_wait)

#macro	@bg_zoom_down(@filename(<DISP_BG>), @wipe_no(3), @src_zoom(1500), @time(35000), @speed_mode(0), @wipe_wait(1))
	@bg_zoom(@filename, @wipe_no, @src_zoom, 1000, @time, @speed_mode, @wipe_wait)

#macro	@bg_zoom(@filename(<DISP_BG>), @wipe_no(3), @src_zoom(1500), @dst_zoom(1000), @zoom_time(35000), @speed_mode(0), @wipe_wait(1))
	$$create_effects_bg_object($b_obj_bg, @filename)
	$$set_scale_eve($b_obj_bg, @src_zoom, @dst_zoom, @zoom_time, 0, @speed_mode)
	@wipe_effects_bg(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// イベントＣＧ移動
//-----------------------------------------------------------------
#macro	@cg_move(@filename, @wipe_no(3), @src_x(0), @src_y(0), @dst_x(0), @dst_y(0), @move_time(30000), @speed_mode(0), @scale(1500), @wipe_wait(1))
	// 分割ＣＧ指定がされているか、ファイルが存在している場合は分割ＣＧを読み込む
	if( $$check_div_cgfile(@filename) || $$exist_div_cgfile(@filename) )
	{
		K[0] = @filename
		if( $$exist_div_cgfile(@filename) ) {
			K[0] = K[0] + "_EX"
		}
		
		$$create_effects_div_cg_object(<O_CG>, K[0], @scale)
		for( L[0] = 0, L[0] < 4, L[0] += 1 ) {
			$$set_pos_rep_eve(back.object[<O_CG> + L[0]], 1, @src_x, @src_y, @dst_x, @dst_y, @move_time, 0, @speed_mode)
		}
	}
	else
	{
		// 通常ＣＧ
		$$create_effects_cg_object($b_obj_cg, @filename)
		$b_obj_cg.set_scale(@scale, @scale)
		$$set_pos_eve($b_obj_cg, @src_x, @src_y, @dst_x, @dst_y, @move_time, 0, @speed_mode)
	}
	@wipe_effects_cg(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// イベントＣＧズーム
//-----------------------------------------------------------------
#macro	@cg_zoom_up(@filename, @wipe_no(3), @dst_zoom(1500), @time(35000), @speed_mode(0), @wipe_wait(1))
	@cg_zoom(@filename, @wipe_no, 1000, @dst_zoom, @time, @speed_mode, @wipe_wait)

#macro	@cg_zoom_down(@filename, @wipe_no(3), @src_zoom(1500), @time(35000), @speed_mode(0), @wipe_wait(1))
	@cg_zoom(@filename, @wipe_no, @src_zoom, 1000, @time, @speed_mode, @wipe_wait)

#macro	@cg_zoom(@filename, @wipe_no(3), @src_zoom(1500), @dst_zoom(1000), @zoom_time(35000), @speed_mode(0), @wipe_wait(1))
	$$create_effects_cg_object($b_obj_cg, @filename)
	$$set_scale_eve($b_obj_cg, @src_zoom, @dst_zoom, @zoom_time, 0, @speed_mode)
	@wipe_effects_cg(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// ＢＧ/ＣＧの明るさ変更でのホワイトイン/アウト
//-----------------------------------------------------------------
#macro	@ev_bright_in(@time(2000), @speed_mode(0), @wait(1), @src(255), @wipe_no(99))
	if( $b_obj_bg.disp ) {
		$$set_bright_eve($b_obj_bg, @src, 0, @time, 0, @speed_mode)
		@wipe_effects_bg(@wipe_no, 0, 0)
	}
	if( $b_obj_cg.disp ) {
		$$set_bright_eve($b_obj_cg, @src, 0, @time, 0, @speed_mode)
		
		if( $$check_div_cgfile($b_obj_cg.get_file_name) )
		{
			for( L[0] = 1, L[0] < 4, L[0] += 1 )
			{
				$$set_bright_eve(back.object[<O_CG> + L[0]], @src, 0, @time, 0, @speed_mode)
			}
		}
		@wipe_effects_cg(@wipe_no, 0, 0)
	}
	if( @wait ) { @timewaitkey(@time) }

#macro	@ev_bright_out(@time(2000), @speed_mode(0), @wait(1))
	if( $f_obj_bg.disp ) {
		$$set_bright_eve($f_obj_bg, 0, 255, @time, 0, @speed_mode)
	}
	if( $f_obj_cg.disp ) {
		$$set_bright_eve($f_obj_cg, 0, 255, @time, 0, @speed_mode)
	}
	if( @wait ) { @timewaitkey(@time) }

//-----------------------------------------------------------------
// 時間経過フェードアウト
//-----------------------------------------------------------------
#macro	@時間経過(@wipe_no(3), @wait_time(1000))
	@KURO_FADE(@wipe_no)
	@timewaitkey(@wait_time)

//-----------------------------------------------------------------
// 実行時と同じ背景表示の時間経過フェードアウト
//-----------------------------------------------------------------
#macro	@その場で時間経過(@wipe_no(3), @wait_time(1000))
	L[0] = $f_obj_cg.disp
	L[1] = $f_obj_bg.disp
	@時間経過(@wipe_no, @wait_time)
	if    ( L[0] ) { @CG($CG_FILE, @wipe_no) }
	elseif( L[1] ) { @BG($BG_FILE, @wipe_no) }

//-----------------------------------------------------------------
// 移動フェードアウト
//-----------------------------------------------------------------
#macro	@移動(@wait_time(0))
	@KURO_FADE(10)
	@timewaitkey(@wait_time)

//-----------------------------------------------------------------
// 場所移動フェードアウト
//-----------------------------------------------------------------
#macro	@場所移動(@bg_name, @wait_time(0))
	@KURO_FADE(10)
	@timewaitkey(@wait_time)
	@BG(@bg_name, 10)

//-----------------------------------------------------------------
// シーン終了フェードアウト
//-----------------------------------------------------------------
#macro	@シーン終了(@wipe_time(2000), @wait_time(1000))
	@all_sound_stop(@wipe_time + @wait_time / 2)
	@KURO_FADE(0, 0, @wipe_time)
	@timewaitkey(@wait_time)
	@all_sound_stop(0)

//-----------------------------------------------------------------
// 揺れ
//-----------------------------------------------------------------
#macro	@揺れ弱(@wait(0), @time(120), @end_order(0))		@shake_round(@wait, @time, 2, 10, @end_order)
#macro	@揺れ中(@wait(0), @time(120), @end_order(0))		@shake_round(@wait, @time, 3, 20, @end_order)
#macro	@揺れ強(@wait(0), @time(120), @end_order(0))		@shake_round(@wait, @time, 4, 30, @end_order)

#macro	@揺れ弱ループ(@wait(0), @time(120), @end_order(0))	@shake_round(@wait, @time, 0, 5, @end_order)

#macro	@shake_round(@wait(0), @time(100), @count(2), @power(10), @end_order(0), @start_order(0))
	screen.quake[0].start(1, @time, @count, 0, @start_order, @end_order, [$$pos_convert_y(@power), 0])
	screen.quake[1].start(1, @time - 50, @count, 0, @start_order, @end_order, [$$pos_convert_x(@power), 6])
	if( @wait ) { screen.quake[0].wait screen.quake[1].wait }

#macro	@縦揺れ弱(@wait(0), @time(120), @end_order(0))		@shake_ud(@wait, @time, 2, 10, @end_order)
#macro	@縦揺れ中(@wait(0), @time(120), @end_order(0))		@shake_ud(@wait, @time, 3, 20, @end_order)
#macro	@縦揺れ強(@wait(0), @time(120), @end_order(0))		@shake_ud(@wait, @time, 4, 30, @end_order)

#macro	@shake_ud(@wait(0), @time(100), @count(2), @power(10), @end_order(0), @start_order(0))
	screen.quake[0].start(1, @time, @count, 0, @start_order, @end_order, [$$pos_convert_y(@power), 0])
	if( @wait ) { screen.quake[0].wait }

#macro	@横揺れ弱(@wait(0), @time(120), @end_order(0))		@shake_lr(@wait, @time, 2, 10, @end_order)
#macro	@横揺れ中(@wait(0), @time(120), @end_order(0))		@shake_lr(@wait, @time, 3, 20, @end_order)
#macro	@横揺れ強(@wait(0), @time(120), @end_order(0))		@shake_lr(@wait, @time, 4, 30, @end_order)

#macro	@shake_lr(@wait(0), @time(100), @count(2), @power(10), @end_order(0), @start_order(0))
	screen.quake[1].start(1, @time, @count, 0, @start_order, @end_order, [$$pos_convert_x(@power), 6])
	if( @wait ) { screen.quake[1].wait }

#macro	@揺れループ停止
	screen.quake[0].end
	screen.quake[1].end


//-----------------------------------------------------------------
// フラッシュ
//-----------------------------------------------------------------
#macro	@フラッシュ白(@time(350), @count(1), @tr(224))
	$$create_flash_object(front.object[<OBJ_SYS_EF_FLASH>], @time, @count, 255, 255, 255, @tr)

#macro	@フラッシュ(@time(350), @count(1), @red(255), @green(255), @blue(255), @tr(224))
	$$create_flash_object(front.object[<OBJ_SYS_EF_FLASH>], @time, @count, @red, @green, @blue, @tr)

//-----------------------------------------------------------------
// セピア
//-----------------------------------------------------------------
#macro	@セピア
	back.effect[0].color_add_r = 42
	back.effect[0].color_add_g = 16
	back.effect[0].color_add_b = 5
	back.effect[0].mono = 255
	back.effect[0].dark = 40
	back.effect[0].wipe_copy = 1

#macro	@セピア終了
	@色補正終了

//-----------------------------------------------------------------
// モノクロ
//-----------------------------------------------------------------
#macro	@モノクロ
	back.effect[0].mono = 255
	back.effect[0].wipe_copy = 1

#macro	@モノクロ終了
	@色補正終了

//-----------------------------------------------------------------
// ネガポジ
//-----------------------------------------------------------------
#macro	@ネガポジ
	back.effect[0].reverse = 255
	back.effect[0].wipe_copy = 1

#macro	@ネガポジ終了
	@色補正終了

//-----------------------------------------------------------------
// 色補正（共通）
//-----------------------------------------------------------------
#macro	@色補正終了
	front.effect[0].wipe_copy = 0

//-----------------------------------------------------------------
// スクリーンフィルター
//-----------------------------------------------------------------
#macro	@フィルター白(@tr(128))
	@フィルター前面(255, 255, 255, @tr)

#macro	@フィルター黒(@tr(128))
	@フィルター前面(0, 0, 0, @tr)

#macro	@フィルター(@red(0), @green(0), @blue(0), @tr(128))
	$$create_screen_filter_object(back.object[<OBJ_SYS_EF_SCREEN_FILTER>], @red, @green, @blue, @tr)
	back.object[<OBJ_SYS_EF_SCREEN_FILTER>].layer = <LAYER_SYS_FRONT_BG>

#macro	@フィルター前面(@red(0), @green(0), @blue(0), @tr(128))
	$$create_screen_filter_object(back.object[<OBJ_SYS_EF_SCREEN_FILTER>], @red, @green, @blue, @tr)
	back.object[<OBJ_SYS_EF_SCREEN_FILTER>].layer = <LAYER_SYS_EFFECT>

#macro	@フィルター終了
	front.object[<OBJ_SYS_EF_SCREEN_FILTER>].wipe_copy = 0

//-----------------------------------------------------------------
// シネマスコープ
//-----------------------------------------------------------------
#macro	@シネスコ(@length(200), @red(0), @green(0), @blue(0), @tr(255))
	$$create_cinemascope_object(back.object[<OBJ_SYS_EF_CINEMASCOPE1>], back.object[<OBJ_SYS_EF_CINEMASCOPE2>], @length, @red, @green, @blue, @tr)
	back.object[<OBJ_SYS_EF_CINEMASCOPE1>].layer = <LAYER_SYS_FRONT_BG>
	back.object[<OBJ_SYS_EF_CINEMASCOPE2>].layer = <LAYER_SYS_FRONT_BG>

#macro	@シネスコ前面(@length(200), @red(0), @green(0), @blue(0), @tr(255))
	$$create_cinemascope_object(back.object[<OBJ_SYS_EF_CINEMASCOPE1>], back.object[<OBJ_SYS_EF_CINEMASCOPE2>], @length, @red, @green, @blue, @tr)
	back.object[<OBJ_SYS_EF_CINEMASCOPE1>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_SYS_EF_CINEMASCOPE2>].layer = <LAYER_SYS_EFFECT>

#macro	@シネスコ終了
	front.object[<OBJ_SYS_EF_CINEMASCOPE1>].wipe_copy = 0
	front.object[<OBJ_SYS_EF_CINEMASCOPE2>].wipe_copy = 0

//-----------------------------------------------------------------
// フィルムノイズ
//-----------------------------------------------------------------
#macro	@フィルムノイズ(@tr(160))
	$$create_film_noise_object(back.object[<OBJ_SYS_EF_FILM_NOISE>])
	back.object[<OBJ_SYS_EF_FILM_NOISE>].tr = @tr

#macro	@フィルムノイズ終了
	front.object[<OBJ_SYS_EF_FILM_NOISE>].wipe_copy = 0

//-----------------------------------------------------------------
// ドットノイズ
//-----------------------------------------------------------------
#macro	@ドットノイズ少
	$$create_dot_noise_object(back.object[<OBJ_SYS_EF_DOT_NOISE>], ef_noise01)

#macro	@ドットノイズ中
	$$create_dot_noise_object(back.object[<OBJ_SYS_EF_DOT_NOISE>], ef_noise02)

#macro	@ドットノイズ多
	$$create_dot_noise_object(back.object[<OBJ_SYS_EF_DOT_NOISE>], ef_noise03)

#macro	@ドットノイズ終了
	front.object[<OBJ_SYS_EF_DOT_NOISE>].wipe_copy = 0

//-----------------------------------------------------------------
// 回想枠
//-----------------------------------------------------------------
#macro	@回想枠
	$$create_recollect_object(back.object[<OBJ_SYS_EF_RECOLLECT>], ef_rec_white00)

#macro	@回想枠黒
	$$create_recollect_object(back.object[<OBJ_SYS_EF_RECOLLECT>], ef_rec_black00)

#macro	@回想枠終了
	front.object[<OBJ_SYS_EF_RECOLLECT>].wipe_copy = 0

//-----------------------------------------------------------------
// 回想シーン（マクロ複合）
//-----------------------------------------------------------------
#macro	@回想シーン(@frame(1), @film_noise(0), @dot_noise(0), @color_type(1))
	switch( @frame ) {
		case(1)		@回想枠
		case(2)		@回想枠黒
	}
	
	switch( @film_noise ) {
		case(1)		@フィルムノイズ
	}

	switch( @dot_noise ) {
		case(1)		@ドットノイズ少
		case(2)		@ドットノイズ中
		case(3)		@ドットノイズ多
	}
	
	switch( @color_type ) {
		case(1)		@セピア
		case(2)		@モノクロ
	}

#macro	@回想シーン終了
	@回想枠終了
	@フィルムノイズ終了
	@ドットノイズ終了
	@色補正終了

//-----------------------------------------------------------------
// 集中線
//-----------------------------------------------------------------
#macro	@集中線
	$$create_line_object(back.object[<OBJ_SYS_EF_LINE>], ef_line01)

#macro	@集中線黒
	$$create_line_object(back.object[<OBJ_SYS_EF_LINE>], ef_line02)

#macro	@集中線終了
	front.object[<OBJ_SYS_EF_LINE>].wipe_copy = 0

//-----------------------------------------------------------------
// すべてのサウンドを停止させる
//-----------------------------------------------------------------
#macro	@all_sound_stop(@time(1000))
	bgm.stop(@time)
	for( L[0] = 0, L[0] < <PCMCH_MAX>, L[0] += 1 )
	{
		pcmch[L[0]].stop(@time)
	}


//===========================================================================
// 関数
//===========================================================================
#command $$create_flash_object(object, int, int, int, int, int, int)				// フラッシュオブジェクトを作成する
#command $$create_screen_filter_object(object, int, int, int, int)					// スクリーンフィルターオブジェクトを作成する
#command $$create_cinemascope_object(object, object, int, int, int, int, int)		// シネマスコープオブジェクトを作成する
#command $$create_recollect_object(object, str)										// 回想枠オブジェクトを作成する
#command $$create_film_noise_object(object)											// フィルムノイズオブジェクトを作成する
#command $$create_dot_noise_object(object, str)										// ドットノイズオブジェクトを作成する
#command $$create_line_object(object, str)											// 集中線オブジェクトを作成する

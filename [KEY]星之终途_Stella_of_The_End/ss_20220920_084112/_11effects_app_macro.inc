//===========================================================================
//!
//!    @file     _11effects_app_macro.inc
//!    @brief    アプリケーション固有のマクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     タイトル固有の演出コマンド
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
// オブジェクト番号
#define		<OBJ_APP_EFFECT>				(<OBJ_SYS_EF_END>)

#define		<OBJ_APP_EF_TEXT_BG>			(<OBJ_APP_EFFECT> + 0)
#define		<OBJ_APP_EF_TEXT>				(<OBJ_APP_EFFECT> + 1)
#define		<OBJ_APP_EF_UTIL1>				(<OBJ_APP_EFFECT> + 2)
#define		<OBJ_APP_EF_UTIL2>				(<OBJ_APP_EFFECT> + 3)
#define		<OBJ_APP_EF_SCOPE>				(<OBJ_APP_EFFECT> + 4)
#define		<OBJ_APP_EF_MOVIE>				(<OBJ_APP_EFFECT> + 5)
#define		<OBJ_APP_EF_OVERLAY_MOVIE>		(<OBJ_APP_EFFECT> + 6)
#define		<OBJ_APP_EF_OVERLAY_IMAGE>		(<OBJ_APP_EFFECT> + 7)

#define		<OBJ_APP_EF_EYECATCH>			(<OBJ_APP_EFFECT> + 0)

#define		<OBJ_APP_CUTIN_CG>				(<OBJ_APP_EFFECT> + 0)
#define		<OBJ_APP_CUTIN_BG>				(<OBJ_APP_EFFECT> + 10)
#define		<OBJ_APP_CUTIN_BUP>				(<OBJ_APP_EFFECT> + 20)

#define		<OBJ_BUP_EXTENSION>				(<OBJ_APP_EFFECT> + 1)

#define		<OBJ_APP_DIZZY_START>			(<OBJ_APP_EFFECT> + 0)
#define		<OBJ_APP_RUN_BG_START>			(<OBJ_APP_EFFECT> + 0)

#define		<OBJ_APP_EF_END>				(<OBJ_APP_EFFECT> + 10)


//===========================================================================
// マクロ
//===========================================================================

//-----------------------------------------------------------------
// 服装
//-----------------------------------------------------------------
#macro	@ジュードデフォ			$DR[<JD>] = 1
#macro	@ジュード装備オフ		$DR[<JD>] = 2
#macro	@ジュードインナー		$DR[<JD>] = 3

#macro	@フィリアデフォ			$DR[<PH>] = 1
#macro	@フィリアインナー		$DR[<PH>] = 2
#macro	@フィリアコート銃あり	$DR[<PH>] = 3
#macro	@フィリアコート装備あり	$DR[<PH>] = 4
#macro	@フィリアコート			$DR[<PH>] = 5
#macro	@フィリアわかめ			$DR[<PH>] = 6

#macro	@デリラデフォ			$DR[<DE>] = 1
#macro	@デリラ銃				$DR[<DE>] = 2
#macro	@デリラ破壊				$DR[<DE>] = 3


//-----------------------------------------------------------------
// アバン
//-----------------------------------------------------------------
#macro	@アバン惑星(@wipe_no(6))
	back.object[<OBJ_APP_EF_TEXT_BG>].create(bg82, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_TEXT_BG>])
	$$set_scale_eve(back.object[<OBJ_APP_EF_TEXT_BG>], 1000, 1500, 35000, 0, 0)
	@wipe_effects_bg(@wipe_no, 0)

//-----------------------------------------------------------------
// ＥＤタイトルロゴ
//-----------------------------------------------------------------
#macro	@ＥＤタイトルロゴ
	front.object[<OBJ_APP_EF_TEXT_BG>].create(bg82, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_TEXT_BG>])
	$$set_scale_eve(front.object[<OBJ_APP_EF_TEXT_BG>], 1500, 1000, 35000, 0, 0)
	$$set_bright_eve(front.object[<OBJ_APP_EF_TEXT_BG>], 255, 0, 5000, 0, 0)

	front.object[<OBJ_APP_EF_TEXT>].create(ef_title_logo, 1, 0, 0, 1)
	front.object[<OBJ_APP_EF_TEXT>].blend = 4
	$$set_image_center(front.object[<OBJ_APP_EF_TEXT>])
	$$set_scale_eve(front.object[<OBJ_APP_EF_TEXT>], 1050, 1000, 2500, 6500, 2)
	$$set_tr_eve(front.object[<OBJ_APP_EF_TEXT>], 0, 255, 2500, 6500, 0)

	front.object[<OBJ_APP_EF_UTIL1>].create(ef_title_logo, 1)
	front.object[<OBJ_APP_EF_UTIL1>].tr = 0

#macro	@ＥＤタイトルロゴフェード
	$$set_bright_eve(front.object[<OBJ_APP_EF_TEXT_BG>], 0, 255, 5000, 0, 0)
	$$set_tr_eve(front.object[<OBJ_APP_EF_UTIL1>], 0, 255, 5000, 2000, 0)

#macro	@ＥＤタイトルロゴ終了
	$$set_tr_eve(front.object[<OBJ_APP_EF_UTIL1>], 255, 0, 3000, 0, 0)


//-----------------------------------------------------------------
// 画像文字
//-----------------------------------------------------------------
#macro	@声待ち画像文字表示(@file_name, @pat_no, @koe_no, @chara_no, @name, @msg, @wait_time(0), @end_wait_time(350))
	
	// ファイルネームは = デフォルトネーム + 末尾数字２桁(言語バージョン)にしています
	front.object[<OBJ_APP_EF_TEXT>].create(@file_name + math.tostr_zero(@check_lang, 2), 1, 0, 0, @pat_no)
	front.object[<OBJ_APP_EF_TEXT>].layer = <LAYER_SYS_EFFECT>
	front.object[<OBJ_APP_EF_TEXT>].tr_rep.resize(1)
	$$set_tr_eve(front.object[<OBJ_APP_EF_TEXT>], 0, 255, 1000, 0, 0)
	
	$$add_msgback(@koe_no, @chara_no, @name, @msg)
	
	exkoe_play_wait_key(@koe_no, @chara_no)
	
	@timewaitkey(@wait_time)
	
	$$set_tr_rep_eve(front.object[<OBJ_APP_EF_TEXT>], 0, 255, 0, 1000, 0, 0)
	front.object[<OBJ_APP_EF_TEXT>].tr_rep_eve[0].wait
	
	@timewaitkey(@end_wait_time)

#macro	@画像文字表示(@file_name, @pat_no, @koe_no, @chara_no, @name, @msg, @time(1000))
	
	// ファイルネームは = デフォルトネーム + 末尾数字２桁(言語バージョン)にしています
	front.object[<OBJ_APP_EF_TEXT>].create(@file_name + math.tostr_zero(@check_lang, 2), 1, 0, 0, @pat_no)
	front.object[<OBJ_APP_EF_TEXT>].layer = <LAYER_SYS_EFFECT>
	front.object[<OBJ_APP_EF_TEXT>].tr_rep.resize(1)
	$$set_tr_eve(front.object[<OBJ_APP_EF_TEXT>], 0, 255, @time, 0, 0)
	
	$$add_msgback(@koe_no, @chara_no, @name, @msg)

#macro	@画像文字消去(@time(1000))
	$$set_tr_rep_eve(front.object[<OBJ_APP_EF_TEXT>], 0, 255, 0, @time, 0, 0)
	front.object[<OBJ_APP_EF_TEXT>].tr_rep_eve[0].wait


//-----------------------------------------------------------------
// キー待ちアイコン
//-----------------------------------------------------------------
#macro	@キー待ちアイコン表示(@x, @y)
	front.object[<OBJ_APP_EF_UTIL1>].create(_key_wait, 1, @x, @y)
	front.object[<OBJ_APP_EF_UTIL1>].patno_eve.loop(0, 47, 50 * 48, 0, 0)
	
	/*
	// x = #MWND.000.MESSAGE_POS + #MWND.000.MOJI_SIZE * 文字数
	// y = #MWND.000.MESSAGE_POS + #MWND.000.MOJI_SIZE + #MWND.000.MOJI_SPACE * 行数
	L[0] = <WINDOW_MESSAGE_POS_X> + (<WINDOW_MOJI_SIZE> + <WINDOW_MOJI_SPACE_X>) * @x
	L[1] = <WINDOW_MESSAGE_POS_Y> + (<WINDOW_MOJI_SIZE> + <WINDOW_MOJI_SPACE_Y>) * @y
	front.object[<OBJ_APP_EF_UTIL1>].create(_key_wait, 1, L[0], L[1])
	front.object[<OBJ_APP_EF_UTIL1>].patno_eve.loop(0, 47, 50 * 48, 0, 0)
	*/

#macro	@キー待ちアイコン消去
	front.object[<OBJ_APP_EF_UTIL1>].init

//-----------------------------------------------------------------
// アイキャッチ
//-----------------------------------------------------------------
#macro	@アイキャッチ(@no)

	//チャプター管理フラグ便乗（木本）
	if(@no > 1 ){
		G[200 + @no -1 ] = 1	//アイキャッチの前のチャプターのフラグを立てる
	}
	//チャプター管理フラグ便乗ココマデ

	syscom.set_syscom_menu_disable			// システムコマンドを禁止する
	syscom.set_hide_mwnd_enable_flag(0)		// ウィンドウを消すを禁止する
	script.set_msg_back_disable				// メッセージバックを禁止する
	
	set_title("")
	
	// フェードイン
	@siro_fade(3)
	
	// 1、14、18、19以外はSE再生
	if( @no != 1 && @no != 14 && @no != 18 && @no != 19 ) {
		@se(se_eyecatch00)
	} elseif( @no == 14 ) {
		@se(se_eyecatch01)
	} elseif( @no == 18 ) {
		@se(se_eyecatch02)
	}

	set_title($$get_chapter_title(@no))	//##2022 0825 木本
	savepoint							//##2022 0825 木本
	
	front.object[<OBJ_APP_EF_EYECATCH>].init
	front.object[<OBJ_APP_EF_EYECATCH>].create_movie("eyecatch_" + math.tostr_zero(@no, 2), 1)
	front.object[<OBJ_APP_EF_EYECATCH>].layer = <LAYER_SYS_EFFECT>
	
	@timewaitkey(4000)
	$$auto_save(0)			// オートセーブ
	@timewaitkey(4500)
	
	@se_stop(1000, 0)
	@siro_fade(4)
	@timewaitkey(500)
	
	syscom.set_syscom_menu_enable			// システムコマンドを許可する
	syscom.set_hide_mwnd_enable_flag(1)		// ウィンドウを消すを許可する
	script.set_msg_back_enable				// メッセージバックを許可する


//-----------------------------------------------------------------
// 背景／ＣＧの色値設定
//-----------------------------------------------------------------
#macro	@bg_set_bright(@value)
	$b_obj_bg.bright = @value

#macro	@bg_set_dark(@value)
	$b_obj_bg.dark = @value

#macro	@cg_set_bright(@value, @stage(0))
	for( L[0] = 0, L[0] < 4, L[0] += 1 )
	{
		if( stage[@stage].object[<O_CG> + L[0]].disp ) {
			stage[@stage].object[<O_CG> + L[0]].bright = @value
		}
	}

#macro	@cg_set_dark(@value, @stage(0))
	for( L[0] = 0, L[0] < 4, L[0] += 1 )
	{
		if( stage[@stage].object[<O_CG> + L[0]].disp ) {
			stage[@stage].object[<O_CG> + L[0]].dark = @value
		}
	}

//-----------------------------------------------------------------
// ＣＧのワイプコピー設定
//-----------------------------------------------------------------
#macro	@cg_set_wipe_copy(@wipe_copy, @stage(1))
	for( L[0] = 0, L[0] < 4, L[0] += 1 )
	{
		if( stage[@stage].object[<O_CG> + L[0]].disp ) {
			stage[@stage].object[<O_CG> + L[0]].wipe_copy = @wipe_copy
		}
	}

//-----------------------------------------------------------------
// イベントＣＧ移動中の切り替え
//-----------------------------------------------------------------
#macro	@cg_move_change(@filename, @wipe_no(3), @wipe_wait(0))
	$b_obj_cg.create_copy_from($f_obj_cg)
	$b_obj_cg.change_file(@filename)
	@wipe_effects_cg(@wipe_no, @wipe_wait)

//-----------------------------------------------------------------
// 立ち絵スライドイン／アウト
//-----------------------------------------------------------------
#macro	@bup_in_r(@filename)
	@bup_in_x(@filename, 250, 500, 2)

#macro	@bup_in_l(@filename)
	@bup_in_x(@filename, -250, 500, 2)

#macro	@bup_out_r(@filename)
	@bup_out_x(@filename, 250, 500, 2)

#macro	@bup_out_l(@filename)
	@bup_out_x(@filename, -250, 500, 2)


//-----------------------------------------------------------------
// 立ち絵カットイン
//-----------------------------------------------------------------
#macro	@bup_cutin(@bup_name, @offset_x(0))
	@bg(@blur_on(<DISP_BG>), <SET>)
	$$bs_cutin(@bup_name, cutin_mask01, @offset_x)

#macro	@bup_cutin_change(@bup_name, @offset_x(0))
	$f_obj_bg.wipe_copy = 1
	$$bs_cutin(@bup_name, cutin_mask01, @offset_x)

#macro	@bup_cutin_end(@bup_name)
	@bg(@blur_off(<DISP_BG>), <SET>)
	$$bup_cutin_del(@bup_name, 1)
	@wipe_effects_bup(0, 1)

#macro	@bup_cutin_end_noanim(@bup_name)
	@bg(@blur_off(<DISP_BG>), <SET>)
	$$bup_cutin_del(@bup_name, 0)

#command $$bs_cutin(str, str, int)
#command $$bup_cutin_del(str, int)


//-----------------------------------------------------------------
// 立ち絵画像拡張
//-----------------------------------------------------------------
#command $$bup_extension(object, str)


//-----------------------------------------------------------------
// 立ち絵系演出
//-----------------------------------------------------------------
#macro	@立ち絵拡縮(@bup_name, @tr(96), @mono(0), @src_scale(1500), @dst_scale(1000), @time(50000))
	@BUP(@bup_name, <SET>)
	L[0] = $$chr2num(@bup_name)
	back.object[L[0]].tr = @tr
	back.object[L[0]].mono = @mono
	$$set_scale_eve(back.object[L[0]], @src_scale, @dst_scale, @time, 0, 0)

#macro	@立ち絵モノクロ(@bup_name, @mono(255), @time(3000))
	$$set_move_eve(back.object[$$chr2num(@bup_name)], 0, @mono, @time, 0, 0)


//-----------------------------------------------------------------
// カットイン表示／非表示
//-----------------------------------------------------------------
#macro	@ev_cutin(@filename, @wipe_no(2))
	back.object[<OBJ_APP_CUTIN_CG>].create(@filename, 1)
	$$set_pos_eve(back.object[<OBJ_APP_CUTIN_CG>], 0, 100, 0, 0, 500, 0, 2)
	@wipe_effects_cg(@wipe_no)

#macro	@ev_cutin_end(@wipe_no(2))
	$$set_pos_eve(front.object[<OBJ_APP_CUTIN_CG>], 0, 0, 0, 100, 500, 0, 2)
	@wipe_effects_cg(@wipe_no)


//-----------------------------------------------------------------
// 画面効果系
//-----------------------------------------------------------------
#macro	@スコープを覗く
	back.object[<OBJ_APP_EF_SCOPE>].create(ef_scope, 1)
	back.object[<OBJ_APP_EF_SCOPE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_SCOPE>].layer = <LAYER_SYS_EFFECT>
	
	$$set_screen_scale(back.object[<OBJ_APP_EF_SCOPE>])

#macro	@スコープを覗く終了
	front.object[<OBJ_APP_EF_SCOPE>].wipe_copy = 0

#macro	@警報
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].create(bg_red, 1)
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].blend = 1
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].layer = <LAYER_SYS_EFFECT>
	
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].tr_eve.turn(0, 128, 700, 250, 2)

#macro	@警報終了
	front.object[<OBJ_APP_EF_OVERLAY_IMAGE>].wipe_copy = 0

#macro	@めまい開始
	$$dizzy

#macro	@めまい更新(@bup_name, @wipe_no(2))
	@BUP(@bup_name, <SET>)
	$$dizzy_update(@bup_name)
	@wipe_effects_bup(@wipe_no)

#macro	@めまい終了
	$$dizzy_end

#command $$dizzy
#command $$dizzy_update(str)
#command $$dizzy_end

#macro	@目を閉じる(@time(15000))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_awake_filter, 1, 0, 0, 0)
	back.object[<OBJ_APP_EF_UTIL2>].create(ef_awake_filter, 1, 0, 0, 1)
	
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, -780, 0, -300, @time, 0, 0)
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0,  780, 0,  300, @time, 0, 0)

#macro	@ＥＤ前モノローグワイプ(@index, @wipe_no(4), @wait_time(2250))
	switch( @index ) {
		case(0)		front.object[<OBJ_APP_EF_UTIL1> + 1].wipe_copy = 0
		case(1)		$f_obj_bg.wipe_copy = 0
					front.object[<OBJ_APP_EF_UTIL1> + 2].wipe_copy = 0
		case(2)		front.object[<OBJ_APP_EF_UTIL1> + 0].wipe_copy = 0
	}
	
	front.object[<OBJ_APP_EF_UTIL1> + @index].create_copy_from($b_obj_bg)
	$b_obj_bg.init
	$$set_bright_eve(front.object[<OBJ_APP_EF_UTIL1> + @index], 255, 0, 4000, 1000, 1)
	$$set_tr_eve(front.object[<OBJ_APP_EF_UTIL1> + @index], 0, 255, 1500, 250, 0)
	
	switch( @index ) {
		case(0)		front.object[<OBJ_APP_EF_UTIL1> + @index].layer = front.object[<OBJ_APP_EF_UTIL1> + 2].layer + 1
		case(1)		front.object[<OBJ_APP_EF_UTIL1> + @index].layer = front.object[<OBJ_APP_EF_UTIL1> + 0].layer + 1
		case(2)		front.object[<OBJ_APP_EF_UTIL1> + @index].layer = front.object[<OBJ_APP_EF_UTIL1> + 1].layer + 1
	}
	
	$OT_WC = 3
	@wipe_effects_bg(@wipe_no, 0)
	@timewaitkey(@wait_time)

#macro	@ＥＤ前モノローグワイプ終了
	front.object[<OBJ_APP_EF_UTIL1> + 0].wipe_copy = 0
	front.object[<OBJ_APP_EF_UTIL1> + 1].wipe_copy = 0
	front.object[<OBJ_APP_EF_UTIL1> + 2].wipe_copy = 0

#macro	@ＥＤ前モノローグフィルター
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].create(ef_awake_filter, 1)
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].color_add_r = 255
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].color_add_g = 255
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].color_add_b = 255
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_OVERLAY_MOVIE>].layer = <LAYER_SYS_EFFECT>
	$$set_pos(back.object[<OBJ_APP_EF_OVERLAY_MOVIE>], 0, -650)

	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].create(ef_awake_filter, 1, 0, 0, 1)
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].color_add_r = 255
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].color_add_g = 255
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].color_add_b = 255
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_OVERLAY_IMAGE>].layer = <LAYER_SYS_EFFECT>
	$$set_pos(back.object[<OBJ_APP_EF_OVERLAY_IMAGE>], 0, 650)

#macro	@ＥＤ前モノローグフィルター終了
	front.object[<OBJ_APP_EF_OVERLAY_MOVIE>].wipe_copy = 0
	front.object[<OBJ_APP_EF_OVERLAY_IMAGE>].wipe_copy = 0

//-----------------------------------------------------------------
// 固有背景演出
//-----------------------------------------------------------------
#macro	@都市遺跡スクロール(@wipe_no(3), @sy(0), @ey(-1080), @move_time(50000), @speed_mode(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(bg02, 1, 0, 0, 0)
	back.object[<OBJ_APP_EF_UTIL2>].create(bg02, 1, 0, back.object[<OBJ_APP_EF_UTIL1>].get_size_y, 1)
	
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, 0, @sy, 0, @ey, @move_time, 0, @speed_mode)
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, 0, @sy, 0, @ey, @move_time, 0, @speed_mode)
	
	@wipe_effects_bg(@wipe_no)

#macro	@都市・商業エリアスクロール(@wipe_no(3), @sy(0), @ey(-1350), @move_time(50000), @speed_mode(0), @wipe_wait(1))
	back.object[<OBJ_APP_EF_UTIL1>].create(bg53, 1, 0, 0, 0)
	back.object[<OBJ_APP_EF_UTIL2>].create(bg53, 1, 0, back.object[<OBJ_APP_EF_UTIL1>].get_size_y, 1)
	
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, 0, @sy, 0, @ey, @move_time, 0, @speed_mode)
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, 0, @sy, 0, @ey, @move_time, 0, @speed_mode)
	
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@山々スクロール(@wipe_no(3), @sx(0), @ex(-960), @move_time(50000), @speed_mode(0), @wipe_wait(1))
	back.object[<OBJ_APP_EF_UTIL1>].create(bg78, 1, 0, 0, 0)
	back.object[<OBJ_APP_EF_UTIL2>].create(bg78, 1, back.object[<OBJ_APP_EF_UTIL1>].get_size_x, 0, 1)
	
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, @sx, 0, @ex, 0, @move_time, 0, @speed_mode)
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, @sx, 0, @ex, 0, @move_time, 0, @speed_mode)
	
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@都市・商業エリア２階(@wipe_no(3))
	back.object[<OBJ_APP_EF_UTIL1>].create(bg53, 1, 0, 0, 0)
	back.object[<OBJ_APP_EF_UTIL2>].create(bg53, 1, 0, back.object[<OBJ_APP_EF_UTIL1>].get_size_y, 1)
	
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 1
	back.object[<OBJ_APP_EF_UTIL2>].wipe_copy = 1
	
	$$set_pos_rep(back.object[<OBJ_APP_EF_UTIL1>], 0, 0, -900)
	$$set_pos_rep(back.object[<OBJ_APP_EF_UTIL2>], 0, 0, -900)
	
	@wipe_effects_bg(@wipe_no)

#macro	@都市・商業エリア２階終了
	front.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 0
	front.object[<OBJ_APP_EF_UTIL2>].wipe_copy = 0

#macro	@走る背景(@bg_name, @wipe_no(3))
	// 多分、flixで通りません…。背景をg00パターンに落とし込む必要があるかもしれません
	$$create_run_bg(@bg_name)
	@wipe_effects_bg(@wipe_no)

#command $$create_run_bg(str)

#macro	@走る背景終了
	front.object[<OBJ_APP_RUN_BG_START> + 0].wipe_copy = 0
	front.object[<OBJ_APP_RUN_BG_START> + 1].wipe_copy = 0
	front.object[<OBJ_APP_RUN_BG_START> + 2].wipe_copy = 0

#macro	@縦揺れ背景(@power(3), @time(100), @tr(160))
	back.object[<OBJ_APP_EF_UTIL1>].create_copy_from($b_obj_bg)
	back.object[<OBJ_APP_EF_UTIL1>].y_rep.resize(1)
	back.object[<OBJ_APP_EF_UTIL1>].y_rep_eve[0].turn(0, @power, @time, 0, 0)
	back.object[<OBJ_APP_EF_UTIL1>].tr = @tr
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 0

//-----------------------------------------------------------------
// 固有立ち絵演出
//-----------------------------------------------------------------
#macro	@ジュード口元アップ(@bup_name, @wipe_no(3))
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 3500, 0, 0)
	// キャラ
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(2500, 2500)
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, -50, -630, -50, -630, 0, 0, 0)
	@wipe_effects_bg(@wipe_no)

#macro	@フィリア髪飾りアップ(@bup_name, @wipe_no(3), @time(3000))
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 3500, 0, 0)
	$$set_pos_eve($b_obj_bg, 0, 850, 0, 900, @time, 0, 2)
	
	// キャラ
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(1900, 1900)
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, -500, 100, -500, 200, @time, 0, 2)
	@wipe_effects_bg(@wipe_no)

#macro	@フィリア新服装スクロール(@bup_name, @wipe_no(3), @time(10000))
	// todo 余力あれば背景がキラキラしている感じの演出入れます
	
	@フィルター(255, 255, 255, 96)
	
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 2000, 0, 0)
	$$set_pos_eve($b_obj_bg, 0, -200, 0, 0, @time, 0, 2)
	
	// キャラ
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, 0, -400, 0, 0, @time, 0, 2)
	@wipe_effects_bg(@wipe_no)

#macro	@ガブリエル登場スクロール(@bup_name, @wipe_no(3), @time(10000))
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 2000, 0, 0)
	$$set_pos_eve($b_obj_bg, 0, -200, 0, 0, @time, 0, 2)
	
	// キャラ
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	$$set_pos_rep_eve(back.object[L[0]], 0, 0, -400, 0, 0, @time, 0, 2)
	@wipe_effects_bg(@wipe_no)

#macro	@デリラ目元アップ(@bup_name1, @bup_name2, @wipe_no(3), @move_pos(-150), @move_mod(0))
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 3500, 0, 0)
	// キャラ
	L[0] = $$chr2num(@bup_name1)
	@bup(@bup_name1, <SET>)
	back.object[L[0]].set_scale(2500, 2500)
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, -150, -400, -50, -400, 1000, 0, @move_mod)
	@wipe_effects_bg(@wipe_no)
	
	@se(se238)
	
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_light01, 1)
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1000
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	
	back.object[L[0]].create_copy_from(front.object[L[0]])
	back.object[L[0]].change_file($$system_bs_file(@bup_name2))
	@wipe_effects_bg(0)

#macro	@ジュードシルエット(@bup_name, @wipe_no(3))
	K[0] = @bup_name
	L[0] = $$chr2num(K[0])
	
	@bg(bg_kuro, <SET>)
	@bup(K[0], <SET>)
	back.object[L[0]].color_add_r = 255
	back.object[L[0]].color_add_g = 255
	back.object[L[0]].color_add_b = 255
	back.object[L[0]].set_scale(1500, 1500)
	back.object[L[0]].scale_x_eve.set(1000, 35000, 0, 0)
	back.object[L[0]].scale_y_eve.set(1000, 35000, 0, 0)
	
	@wipe_effects_bg(@wipe_no)

#macro	@ウィレム目元アップ(@bup_name, @wipe_no(3))
	// 背景
	@bg_set(@blur_on(<DISP_BG>), 3500, 0, 0)
	$$set_pos_eve($b_obj_bg, 0, -100, 0, 0, 5000, 0, 0)
	
	// キャラ
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(2500, 2500)
	back.object[L[0]].rotate_z = 80
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, 370, -530, 370, -430, 5000, 0, 0)
	@wipe_effects_bg(@wipe_no)

#macro	@フィリア縦スクロール(@bup_name, @wipe_no(4))
	$f_obj_cg.wipe_copy = 1
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	@bup_tr_set(@bup_name, 160)
	back.object[L[0]].set_scale(1900, 1900)
	$$set_pos_rep_eve(back.object[L[0]], <BUP_MOVE_REP>, 0, -400, 0, -300, 5000, 0, 2)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@ウィレム口元カットイン(@bup_name, @wipe_no(3))
	$$cutin_wi01(back, @bup_name)
	@wipe_effects_bg(@wipe_no)

#command $$cutin_wi01(stage, str)

#macro	@ウィレム口元カットイン終了
	front.object[<OBJ_APP_EF_UTIL1> + 0].wipe_copy = 0
	front.object[<OBJ_APP_EF_UTIL1> + 2].wipe_copy = 0
	front.object[<OBJ_APP_EF_UTIL1> + 3].wipe_copy = 0

#macro	@ジュードズームイン(@bup_name, @wipe_no(250))
	@bg_set(@blur_on(<DISP_BG>), 2000)
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(1250, 1250)
	@wipe_effects_bg(214)

#macro	@ジュードアップ(@bup_name, @scale(1500), @wipe_no(3))
	@bg_set(@blur_on(<DISP_BG>), 2000)
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(@scale, @scale)
	@wipe_effects_bg(@wipe_no)

#macro	@フィリアアップ(@bup_name, @scale(1500), @wipe_no(3))
	@bg_set(@blur_on(<DISP_BG>), 2000)
	L[0] = $$chr2num(@bup_name)
	@bup(@bup_name, <SET>)
	back.object[L[0]].set_scale(@scale, @scale)
	$$set_pos_rep(back.object[L[0]], <BUP_MOVE_REP>, 0, -50)
	@wipe_effects_bg(@wipe_no)

#macro	@網膜モニタウィレムズームダウン(@bg_name, @bs_name, @scale, @time)
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_monitor_bg06, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_UTIL1>])
	$$set_scale_eve(back.object[<OBJ_APP_EF_UTIL1>], @scale, 1000, @time, 0, 0)
	
	back.object[<OBJ_APP_EF_UTIL2>].create(ef_monitor_wi02, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_UTIL2>])
	$$set_scale_eve(back.object[<OBJ_APP_EF_UTIL2>], @scale, 1000, @time, 0, 0)

#macro	@フィリア特殊立ち絵ぼかし(@tr(128))
	@bg(bg_siro, <SET>)
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_ph01, 1)
	back.object[<OBJ_APP_EF_UTIL1>].tr = @tr
	@wipe_effects_bg(3)
	
	@bg(bg_siro, <SET>)
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_ph01, 1, 0, 0, 1)
	back.object[<OBJ_APP_EF_UTIL1>].tr = @tr
	@wipe_effects_bg(6)

//-----------------------------------------------------------------
// 固有ＣＧ演出
//-----------------------------------------------------------------
#macro	@警備員銃撃(@wipe_no(3), @wait_time(1000))
	@cg(cg_ts30_11, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se201)
	@cg_set(cg_ts30_12)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(250, 0, 50)
	@shake_lr(1, 150, 1, 50)

#macro	@ジュード銃撃(@wipe_no(0), @wait_time(150))
	@cg(cg_ts30_04, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se031)
	@cg_set(cg_ts30_05)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)

#macro	@ジュード銃撃複数(@wipe_no(0), @wait_time(250))
	@cg(cg_ts30_04, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se029)
	@cg_set(cg_ts30_05)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)
	@timewaitkey(50)
	@cg_set(cg_ts30_04)
	@wipe_effects_cg(240, 1, 250)
	
	@timewaitkey(300)

	@cg_set(cg_ts30_05)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)
	@timewaitkey(50)
	@cg_set(cg_ts30_04)
	@wipe_effects_cg(240, 1, 250)

	@timewaitkey(50)
	
	@cg_set(cg_ts30_05)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)
	@timewaitkey(50)

#macro	@ジュード都市ＣＧ銃撃
	@cg_set(CG_TS04_02)
	@ev_bright_in(350, 2, 0)
	@shake_round(1, 100, 2, 10)

#macro	@ジュード都市ＣＧ銃撃複数
	@se(se029)
	@cg_set(CG_TS04_02)
	@ev_bright_in(350, 2, 0)
	@shake_round(1, 100, 2, 10)
	@timewaitkey(450)
	
	@cg_set(CG_TS04_02)
	@ev_bright_in(350, 2, 0)
	@shake_round(1, 100, 2, 10)
	@timewaitkey(220)
	
	@cg_set(CG_TS04_02)
	@ev_bright_in(350, 2, 0)
	@shake_round(1, 100, 2, 10)

#macro	@デリラ銃撃(@wipe_no(0), @wait_time(150))
	@cg(cg_ts30_06, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se046)
	@cg_set(cg_ts30_07)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)

#macro	@デリラ銃撃２(@wipe_no(0), @wait_time(150))
	@cg(cg_ts30_08, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se060)
	@cg_set(cg_ts30_09)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)

#macro	@ならず者銃撃(@wipe_no(0), @wait_time(150))
	@cg(cg_ts30_11, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se047)
	@cg_set(cg_ts30_12)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(240, 0, 50)
	@shake_lr(1, 150, 1, 50)

#macro	@おもちゃの銃で銃撃(@wipe_no(3), @wait_time(1000))
	@cg(cg_ts30_01, @wipe_no)
	@timewaitkey(@wait_time)
	@se(se201)
	@cg_set(cg_ts30_02)
	$$set_scale_eve($b_obj_cg, 3000, 1000, 300, 0, 2)
	$$set_bright_eve($b_obj_cg, 255, 0, 500, 0, 1)
	@wipe_effects_cg(250, 0, 50)
	@shake_lr(1, 150, 1, 50)
	@timewaitkey(500)
	@cg(cg_ts30_03, 4)

//-----------------------------------------------------------------
// シンギュラリティマシン演出
//-----------------------------------------------------------------
#macro	@風車型マシン登場準備(@type)
	back.object[<OBJ_APP_EF_UTIL2>].create(ef_machine01, 1, 0, 0, @type)

#macro	@風車型マシン登場
	@bg_move(<DISP_BG>, <SET>, 0, 290, 0, 540, 20000, 0, 2000)

	back.object[<OBJ_APP_EF_UTIL1>].create_movie_loop(ef_dust04, 1)
	back.object[<OBJ_APP_EF_UTIL1>].blend = 2
	back.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_UTIL1>].tr = 160

	@風車型マシン登場準備(0)
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, -500, 0, 0, 20000, 0, 0)

	@wipe_effects_cg(3)

#macro	@風車型マシン登場２(@bg_name)
	@bg_move(@bg_name, <SET>, 0, -120, 0, 130, 25000, 0, 1250)

	back.object[<OBJ_APP_EF_UTIL1>].create_movie_loop(ef_dust04, 1)
	back.object[<OBJ_APP_EF_UTIL1>].blend = 2
	back.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_UTIL1>].tr = 192

	@風車型マシン登場準備(0)
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, -500, 0, 0, 25000, 0, 0)

	@wipe_effects_cg(3)

#macro	@風車型マシン登場３(@wipe_no)
	@風車型マシン登場準備(1)
	back.object[<OBJ_APP_EF_UTIL2>].layer = 1
	@wipe_effects_bg(@wipe_no)

#macro	@風車型マシン消える
	front.object[<OBJ_APP_EF_UTIL2>].tr_eve.set(0, 500, 500, 0)
	
	front.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_machine_hide01, 1)
	front.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	front.object[<OBJ_APP_EF_UTIL1>].tr = 0
	front.object[<OBJ_APP_EF_UTIL1>].tr_eve.set(255, 200, 0, 0)

#macro	@警備ロボ(@type(2), @index(0), @pos_x(0))
	back.object[<OBJ_APP_EF_UTIL1> + @index].create(ef_machine02, 1, $$pos_convert_x(@pos_x), 0, @type)
	back.object[<OBJ_APP_EF_UTIL1> + @index].layer = 10

#macro	@軍用ロボ(@type(2), @index(0), @pos_x(0))
	back.object[<OBJ_APP_EF_UTIL1> + @index].create(ef_machine04, 1, $$pos_convert_x(@pos_x), 0)
	back.object[<OBJ_APP_EF_UTIL1> + @index].layer = 10

#macro	@クリムゾンアイ攻撃(@wipe_no(250), @wait_time(950), @se_type(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(b_cg_ts28_01, 1)
	back.object[<OBJ_APP_EF_UTIL1>].set_scale(2000, 2000)
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, -50, 0, 0, 1000, 0, 2)

	back.object[<OBJ_APP_EF_UTIL2>].create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, 0, 0, 0, 96, 1)

	back.object[<OBJ_APP_EF_SCOPE>].create(ef_machine22, 1)
	$$set_pos_eve(back.object[<OBJ_APP_EF_SCOPE>], 0, -100, 0, 0, 1000, 0, 2)

	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_attack02, 1)
	back.object[<OBJ_APP_EF_MOVIE>].blend = 1
	$$set_pos_eve(back.object[<OBJ_APP_EF_MOVIE>], 0, -100, 0, 0, 1000, 0, 2)
	
	disp
	
	switch( @se_type ) {
	case(0)		@se(se051)
	case(1)		@se(se062)
	}
	@wipe_effects_cg(2)
	@timewaitkey(@wait_time)

	@siro_fade(@wipe_no)

#macro	@クリムゾンアイ目アップ(@wipe_no(3), @move_time(3000), @black_tr(192), @wipe_wait(1))
	back.object[<OBJ_APP_EF_UTIL1>].create(b_cg_ts28_01, 1)
	back.object[<OBJ_APP_EF_UTIL1>].set_scale(2000, 2000)
	$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, -50, 0, 0, @move_time, 0, 0)

	back.object[<OBJ_APP_EF_UTIL2>].create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, 0, 0, 0, @black_tr, 1)

	back.object[<OBJ_APP_EF_SCOPE>].create(ef_machine22, 1)
	back.object[<OBJ_APP_EF_SCOPE>].layer = 1
	$$set_pos_eve(back.object[<OBJ_APP_EF_SCOPE>], 0, -100, 0, 0, @move_time, 0, 0)
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@砲台爆発
	// todo 余力あれば砲台爆発ムービー
	@cg(cg_ts26, 241)
	@siro_fade(250)

#macro	@無人小型機登場(@offset_x(0), @wipe_no(0), @animation(0))
	@se(se056)
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine10, 1)
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1
	switch( @animation ) {
	case(1)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], -200 + @offset_x, 0, 0 + @offset_x, 0, 2000, 0, 2)
		$$set_tr_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, 255, 1000, 0, 0)
	case(2)
		$$set_bright_eve(back.object[<OBJ_APP_EF_UTIL1>], 192, 0, 1000, 0, 0)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], @offset_x, 100, 0, 0, 2000, 0, 2)
		$$set_tr_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, 255, 1000, 0, 0)
	}
	@wipe_effects_bg(@wipe_no)

#macro	@無人小型機破壊
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine10, 1)
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1
	@wipe_effects_bg(0)
	@se(se057)
	@揺れ中
	$$set_bright_eve(front.object[<OBJ_APP_EF_UTIL1>], 128, 0, 250, 0, 2)
	@フラッシュ白(250, 1, 96)
	$$set_tr_eve(front.object[<OBJ_APP_EF_UTIL1>], 255, 0, 250, 0, 2)

#macro	@六脚ロボット(@type(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine11, 1, 0, 0, @type)
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1

#macro	@クリムゾンアイアップ(@type(0), @wipe_no(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine22, 1)

#macro	@クリムゾンアイ背景(@wipe_no(3))
	back.object[<OBJ_APP_EF_UTIL1>].create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, 207, 47, 54, 255, 1)
	@wipe_effects_bg(@wipe_no)

#macro	@クリムゾンアイ頭部(@type(0), @wipe_no(0), @animation(0), @wipe_wait(1))
	back.object[<OBJ_APP_EF_UTIL2>].create(ef_machine20, 1, 0, 0, @type)
	back.object[<OBJ_APP_EF_UTIL2>].layer = 1
	switch( @animation ) {
	case(1)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, 0, 0, -100, 3000, 0, 0)
	case(2)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], -100, -100, 0, -100, 3000, 0, 0)
	case(3)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, -50, 0, -100, 1000, 0, 0)
	case(4)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], 0, -200, 0, -100, 3000, 0, 0)
	}
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@Ｖｅｒ(@type(0), @pos_x(0), @animation(0), @wipe_copy(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine21, 1, $$pos_convert_x(@pos_x), 0, @type)
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1000
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = @wipe_copy
	switch( @animation ) {
	case(1)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], @pos_x, 100, @pos_x, 0, 500, 0, 2)
	case(2)		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], @pos_x - 100, 0, @pos_x, 0, 1000, 0, 2)
	}

#macro	@Ｖｅｒ消去
	front.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 0

#macro	@ドローン子機つき(@type(0), @animation(0), @wipe_copy(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine03, 1, 0, 0, @type)
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = @wipe_copy
	if( @animation == 1 ) {
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], 0, -100, 0, 0, 2000, 0, 0)
	}

#macro	@ドローン子機つき消去
	front.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 0

#macro	@バガー２７９８(@type(0))
	back.object[<OBJ_APP_EF_UTIL1>].create(ef_machine30, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_UTIL1>])
	back.object[<OBJ_APP_EF_UTIL1>].layer = 1
	switch( @type ) {
	case(0)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], -100, 0, 0, 0, 3000, 2, 0)
	case(1)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL1>], -100, 0, 100, 0, 1500, 2, 0)
	}

#macro	@パンタグリュエル(@type(0))
	back.object[<OBJ_APP_EF_UTIL2>].create(ef_machine31, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_UTIL2>])
	back.object[<OBJ_APP_EF_UTIL2>].layer = 1
	switch( @type ) {
	case(0)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], -300, 0, -400, 0, 3000, 2, 0)
	case(1)
		$$set_pos_eve(back.object[<OBJ_APP_EF_UTIL2>], -200, 0, 0, 0, 1500, 2, 0)
	}


//-----------------------------------------------------------------
// ムービー演出
//-----------------------------------------------------------------
#macro	@砂埃(@tr(255))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 3
	back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

	$$set_screen_scale(back.object[<OBJ_APP_EF_MOVIE>])

#macro	@砂埃逆(@tr(255))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].scale_x = -1000
	back.object[<OBJ_APP_EF_MOVIE>].x = <SCREEN_WIDTH>
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 3
	back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

#macro	@キラキラ埃(@tr(255), @blend(1))
	if( <EFFECT_CUT>  ) {
	} else {
		back.object[<OBJ_APP_EF_MOVIE>].init
		back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust02, 1, auto_free = 0)
		back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
		back.object[<OBJ_APP_EF_MOVIE>].blend = @blend
		back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

		$$set_screen_scale(back.object[<OBJ_APP_EF_MOVIE>])
	}
	
#macro	@キラキラ埃下方向
	if( <EFFECT_CUT>  ) {
	} else {
		back.object[<OBJ_APP_EF_MOVIE>].init
		back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust03, 1, auto_free = 0)
		back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
		back.object[<OBJ_APP_EF_MOVIE>].blend = 1
	}

#macro	@煙(@tr(192), @scale(2000))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_smoke01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(@scale, @scale)
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1
	back.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

#macro	@煙逆向き(@tr(192))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_smoke01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(-2000, 2000)
	back.object[<OBJ_APP_EF_MOVIE>].x = <SCREEN_WIDTH>
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1
	back.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 1
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

#macro	@煙終了
	front.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 0

#macro	@土煙
	back.object[<OBJ_APP_EF_UTIL1>].init
	back.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_dust01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_UTIL1>].blend = 3
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 1
	
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_smoke01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(-2000, 2000)
	back.object[<OBJ_APP_EF_MOVIE>].x = <SCREEN_WIDTH>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	back.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 1

#macro	@土煙逆向き
	back.object[<OBJ_APP_EF_UTIL1>].init
	back.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_dust01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_UTIL1>].scale_x = -1000
	back.object[<OBJ_APP_EF_UTIL1>].x = <SCREEN_WIDTH>
	back.object[<OBJ_APP_EF_UTIL1>].blend = 3
	back.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 1
	
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_smoke01, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(2000, 2000)
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	back.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 1

#macro	@土煙終了
	front.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 0
	front.object[<OBJ_APP_EF_MOVIE>].wipe_copy = 0

#macro	@白塵
	back.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_dust04, 1)
	back.object[<OBJ_APP_EF_UTIL1>].blend = 4

#macro	@レンズフレア夕空
	if( <EFFECT_CUT>  ) {
	} else {
		back.object[<OBJ_APP_EF_MOVIE>].init
		back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_flare01, 1, auto_free = 0)
		back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
		back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	}

#macro	@レンズフレア夕海
	if( <EFFECT_CUT>  ) {
	} else {
		back.object[<OBJ_APP_EF_MOVIE>].init
		back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_flare02, 1, auto_free = 0)
		back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
		back.object[<OBJ_APP_EF_MOVIE>].blend = 1
	}

#macro	@レンズフレア雄大な景色
	if( <EFFECT_CUT>  ) {
	} else {
		back.object[<OBJ_APP_EF_MOVIE>].init
		back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_flare03, 1, auto_free = 0)
		back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
		back.object[<OBJ_APP_EF_MOVIE>].blend = 4
	}

#macro	@レンズフレア夕丘
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_flare21, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 1

#macro	@レンズフレア丘
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_flare20, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4

#macro	@矢の軌道
	front.object[<OBJ_APP_EF_UTIL1>].init
	front.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_slash01, 0, 0, 0, ready_only = 1)
	front.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	front.object[<OBJ_APP_EF_UTIL1>].blend = 1
	front.object[<OBJ_APP_EF_UTIL1>].wipe_copy = 1
	
	@se(se025)
	
	front.object[<OBJ_APP_EF_UTIL1>].disp = 1
	front.object[<OBJ_APP_EF_UTIL1>].resume_movie


#macro	@矢複数の軌道
	front.object[<OBJ_APP_EF_UTIL1>].init
	front.object[<OBJ_APP_EF_UTIL1>].create_movie(ef_slash02, 0, 0, 0, ready_only = 1)
	front.object[<OBJ_APP_EF_UTIL1>].layer = <LAYER_SYS_EFFECT>
	front.object[<OBJ_APP_EF_UTIL1>].blend = 1
	
	@se(se100)
	
	front.object[<OBJ_APP_EF_UTIL1>].disp = 1
	front.object[<OBJ_APP_EF_UTIL1>].resume_movie

#macro	@抽象的な光
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust06, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = 1

#macro	@画面ノイズ(@type(1), @blend(1))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie_loop("ef_noise" + math.tostr(@type), 1)
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(2000, 2000)
	back.object[<OBJ_APP_EF_MOVIE>].layer = <LAYER_SYS_EFFECT>
	back.object[<OBJ_APP_EF_MOVIE>].blend = @blend

#macro	@黒塵(@tr(64))
	back.object[<OBJ_APP_EF_MOVIE>].init
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_dust05, 1, auto_free = 0)
	back.object[<OBJ_APP_EF_MOVIE>].set_scale(2000, 2000)
	back.object[<OBJ_APP_EF_MOVIE>].layer = 1
	back.object[<OBJ_APP_EF_MOVIE>].blend = 2
	back.object[<OBJ_APP_EF_MOVIE>].tr = @tr

#macro	@軌道エレベータノイズ
	back.object[<OBJ_APP_EF_MOVIE>].create_movie(ef_monitor02_off, 1)
	back.object[<OBJ_APP_EF_MOVIE>].blend = 4

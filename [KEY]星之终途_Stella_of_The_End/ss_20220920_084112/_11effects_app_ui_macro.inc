//===========================================================================
//!
//!    @file     _11effects_app_ui_macro.inc
//!    @brief    アプリケーション固有のマクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     演出ＵＩ系
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
// オブジェクト番号
#define		<OBJ_APP_MONITOR_EFFECT>				(<OBJ_APP_EF_END>)

#define		<OBJ_APP_EF_MONITOR_BG>					(<OBJ_APP_MONITOR_EFFECT> + 0)
#define		<OBJ_APP_EF_MONITOR_BUP>				(<OBJ_APP_MONITOR_EFFECT> + 1)
#define		<OBJ_APP_EF_MONITOR_PANEL>				(<OBJ_APP_MONITOR_EFFECT> + 2)


//-----------------------------------------------------------------
// 汎用
//-----------------------------------------------------------------
#command $$show_monitor_animation(object)		// モニター表示アニメーション
#command $$hide_monitor_animation(object)		// モニター非表示アニメーション

#macro	@UI網膜モニタ_表示アニメーション(@se_play(1), @blend(4), @tr(255))
	if( @se_play ) {
		@se(se054)
	}
	$$create_monitor_on_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	if( <EFFECT_CUT> ) {
	} else {
		$$wait_omv_key(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	}
	$$create_monitor_loop_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>], @blend, @tr)

#macro	@UI網膜モニタ_非表示アニメーション(@se_play(1))
	if( @se_play ) {
		@se(se011)
	}
	$$create_monitor_off_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	if( <EFFECT_CUT> ) {
	} else {
		@timewaitkey(500)
		@wipe_effects_bg(81)
	}

#macro	@UI網膜モニタ_表示(@blend(4), @tr(255))
	$$create_monitor_loop_movie(back.object[<OBJ_APP_EF_OVERLAY_MOVIE>], @blend, @tr)

#macro	@UI網膜モニタ_非表示
	front.object[<OBJ_APP_EF_OVERLAY_MOVIE>].wipe_copy = 0

#command $$create_monitor_on_movie(object)				// 網膜モニタＯＮ
#command $$create_monitor_loop_movie(object, int, int)	// 網膜モニタＯＮ中
#command $$create_monitor_off_movie(object)				// 網膜モニタＯＦＦ


#macro	@UI思考_表示アニメーション(@blend(0), @tr(255))
	$$create_mind_on_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	if( <EFFECT_CUT> ) {
	} else {
		$$wait_omv_key(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	}
	$$create_mind_loop_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>], @blend, @tr)

#macro	@UI思考_非表示アニメーション
	$$create_mind_off_movie(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	if( <EFFECT_CUT> ) {
	} else {
		$$wait_omv_key(front.object[<OBJ_APP_EF_OVERLAY_MOVIE>])
	}

#macro	@UI思考_表示(@blend(0), @tr(255))
	$$create_mind_loop_movie(back.object[<OBJ_APP_EF_OVERLAY_MOVIE>], @blend, @tr)

#macro	@UI思考_非表示
	front.object[<OBJ_APP_EF_OVERLAY_MOVIE>].wipe_copy = 0

#command $$create_mind_on_movie(object)					// 思考ＯＮ
#command $$create_mind_loop_movie(object, int, int)		// 思考ＯＮ中
#command $$create_mind_off_movie(object)				// 思考ＯＦＦ


//-----------------------------------------------------------------
// 個別
//-----------------------------------------------------------------
#macro	@UI00_汎用_表示(@filename)
	@se(se054)
	$$show_effect_ui00(@filename)
	@timewaitkey(500)

#macro	@UI00_汎用_非表示
	@se(se011)
	$$hide_effect_ui00
	@timewaitkey(500)

#command $$show_effect_ui00(str)		// 汎用モニター表示
#command $$hide_effect_ui00				// 汎用モニター非表示


#macro	@UI01_危険な方向をしめす矢印_表示
	$$show_effect_ui01
	@UI網膜モニタ_表示アニメーション

#macro	@UI01_危険な方向をしめす矢印_非表示
	$$hide_effect_ui01
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui01
#command $$hide_effect_ui01


#macro	@UI02_簡易的な周辺地図_表示
	$$show_effect_ui02
	@UI網膜モニタ_表示アニメーション

#macro	@UI02_簡易的な周辺地図_非表示
	$$hide_effect_ui02

#command $$show_effect_ui02
#command $$hide_effect_ui02


#macro	@UI03_震動波形図_表示
	@se(se008)
	$$show_effect_ui03
	@timewaitkey(350)

#macro	@UI03_震動波形図_非表示
	$$hide_effect_ui03
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui03
#command $$hide_effect_ui03


#macro	@UI04_解析画面_表示
	$$show_effect_ui04
	@UI網膜モニタ_表示アニメーション

#macro	@UI04_解析画面_スライド表示(@type)
	$$slide_effectui04(@type)

#macro	@UI04_解析画面_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui04
#command $$slide_effectui04(int)


#macro	@UI05_高度_表示
	$$show_effect_ui05(front)
	$$slide_effect_ui05(front)
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(1250)
	@se(se106)
	@timewaitkey(1000)
	$$show_effect_ui05(back)
	@wipe_effects_bg(3)

#macro	@UI05_高度_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui05(stage)
#command $$slide_effect_ui05(stage)


#macro	@UI06_ドローンの解析画像_表示
	$$show_effect_ui06
	@UI網膜モニタ_表示アニメーション

#macro	@UI06_ドローンの解析画像_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui06


#macro	@UI07_地図_表示
	$$show_effect_ui07
	@UI網膜モニタ_表示
	@wipe_effects_bg(3)

#macro	@UI07_地図_スライド表示(@type, @wipe_no(3))
	$$slide_effectui07(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI07_地図_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui07
#command $$slide_effectui07(int)


#macro	@UI08_レーダー_表示(@animation(1))
	if( @animation ) {
		$$show_effect_ui08(front)
		@UI網膜モニタ_表示アニメーション
		@timewaitkey(500)
	} else {
		$$show_effect_ui08(back)
		@UI網膜モニタ_表示
		@wipe_effects_bg(2)
	}

#macro	@UI08_レーダー_非表示(@animation(1))
	if( @animation ) {
		@UI網膜モニタ_非表示アニメーション
	} else {
		@UI網膜モニタ_非表示
	}

#command $$show_effect_ui08(stage)


#macro	@UI09_網膜モニター上に地図_表示
	$$show_effect_ui09
	@UI網膜モニタ_表示アニメーション

#macro	@UI09_網膜モニター上に地図_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui09


#macro	@UI10_フィリアのスキャン画面_表示(@wipe_no(3))
	$$show_effect_ui10
	@wipe_effects_bg(@wipe_no)

#macro	@UI10_フィリアのスキャン画面_スライド表示(@type, @wipe_no(3))
	$$slide_effectui10(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI10_フィリアのスキャン画面_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui10
#command $$slide_effectui10(int)

#macro	@UI11_たくさんの警告表示_表示
	$$show_effect_ui11
	@UI網膜モニタ_表示アニメーション(1, 1, 160)
	@timewaitkey(200)
	$$warning_effect_ui11
	@timewaitkey(180)
	@se(se014, 1)
	@timewaitkey(540)
	$$warning_end_effect_ui11

#macro	@UI11_たくさんの警告表示_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui11
#command $$warning_effect_ui11
#command $$warning_end_effect_ui11


#macro	@UI12_地図を表示/次の目的地にピン_表示
	$$show_effect_ui12
	@UI網膜モニタ_表示
	@wipe_effects_bg(3)

#macro	@UI12_地図を表示/次の目的地にピン_スライド表示(@type, @wipe_no(3))
	$$slide_effectui12(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI12_地図を表示/次の目的地にピン_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui12
#command $$slide_effectui12(int)


#macro	@UI13_網膜モニタ上に通知ログ_表示(@animation(1))
	if( @animation ) {
		$$show_effect_ui13(front)
		@UI網膜モニタ_表示アニメーション
	} else {
		$$show_effect_ui13(back)
		@se(se106)
		@UI網膜モニタ_表示
		@wipe_effects_bg(3)
	}

#macro	@UI13_網膜モニタ上に通知ログ_スライド表示(@type, @wipe_no(3))
	$$slide_effectui13(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI13_網膜モニタ上に通知ログ_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui13(stage)
#command $$slide_effectui13(int)


#macro	@UI14_黒背景とフィリアの白いシルエット_表示
	$$show_effect_ui14
	@UI思考_表示
	@wipe_effects_bg(3)

#macro	@UI14_黒背景とフィリアの白いシルエット_非表示
	@UI思考_非表示アニメーション

#command $$show_effect_ui14
#command $$hide_effect_ui14


#macro	@UI15_網膜モニタに写された地図_表示
	$$show_effect_ui15
	@UI網膜モニタ_表示アニメーション

#macro	@UI15_網膜モニタに写された地図_スライド表示(@type, @wipe_no(3))
	$$slide_effectui15(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI15_網膜モニタに写された地図_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui15
#command $$slide_effectui15(int)


#macro	@UI16_レーダーと地図が網膜モニタに映る_表示(@animation)
	if( @animation ) {
		$$show_effect_ui16(front)
		@UI網膜モニタ_表示アニメーション
	} else {
		$$show_effect_ui16(back)
		@wipe_effects_bg(3)
	}

#macro	@UI16_レーダーと地図が網膜モニタに映る_スライド表示(@type, @wipe_no(3))
	$$slide_effectui16(@type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI16_レーダーと地図が網膜モニタに映る_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui16(stage)
#command $$slide_effectui16(int)


#macro	@UI17_地図_表示(@animation)
	if( @animation ) {
		$$show_effect_ui17(front)
		@UI網膜モニタ_表示アニメーション
	} else {
		$$show_effect_ui17(back)
		@UI網膜モニタ_表示
		$$slide_effectui17(2)
		@wipe_effects_bg(2, 0)
	}

#macro	@UI17_地図_スライド表示(@type, @wipe_no(3), @wipe_wait(0))
	$$slide_effectui17(@type)
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@UI17_地図_非表示(@animation)
	if( @animation ) {
		@UI網膜モニタ_非表示アニメーション
	} else {
		@UI網膜モニタ_非表示
	}

#command $$show_effect_ui17(stage)
#command $$slide_effectui17(int)


#macro	@UI18_網膜モニタの表示/被弾箇所_表示
	$$show_effect_ui18(front, 2)
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(250)
	@se(se023)
	$$show_effect_ui18(back, 2)
	@wipe_effects_bg(0)

#macro	@UI18_網膜モニタの表示/被弾箇所_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui18(stage, int)


#macro	@UI19_解析画面_表示
	$$show_effect_ui19(front)
	@UI網膜モニタ_表示アニメーション

#macro	@UI19_解析画面_スライド表示(@type, @wipe_no(3))
	$$show_effect_ui19(back)
	$$slide_effectui19(back, @type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI19_解析画面_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui19(stage)
#command $$slide_effectui19(stage, int)


#macro	@UI20_ロケーターのUI_表示(@type(0))
	$$show_effect_ui20(@type)
	@UI網膜モニタ_表示アニメーション

#macro	@UI20_ロケーターのUI_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui20(int)


#macro	@UI21_AI派閥図/ユーレイジアとカフカ―ス_表示(@wipe_no(3), @wipe_wait(1))
	$$show_effect_ui21(back)
	$$slide_effectui21(back, 1)
	@UI思考_表示
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@UI21_AI派閥図/ユーレイジアとカフカ―ス_スライド表示(@type, @wipe_no(4))
	$$show_effect_ui21(back)
	$$slide_effectui21(back, @type)
	@wipe_effects_bg(@wipe_no, 0)

#macro	@UI21_AI派閥図/ユーレイジアとカフカ―ス_非表示
	@UI思考_非表示

#command $$show_effect_ui21(stage)
#command $$slide_effectui21(stage, int)


#macro	@UI23_網膜モニタに次々と通知_表示
	$$show_effect_ui23(front, 1)
	@UI網膜モニタ_表示アニメーション

#macro	@UI23_網膜モニタに次々と通知_更新
	$$show_effect_ui23(back, 0)
	@wipe_effects_bg(90, 0, 500)

#macro	@UI23_網膜モニタに次々と通知_非表示
	$$hide_effect_ui23
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui23(stage, int)
#command $$hide_effect_ui23


#macro	@UI25_網膜モニタへの被弾通知_表示
	$$show_effect_ui25(front, 1)
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(250)
	@se(se014)

#macro	@UI25_網膜モニタへの被弾通知_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui25(stage, int)


#macro	@UI26_網膜モニタにレーダー/背景に敵の位置_表示
	$$show_effect_ui26(front, 0)
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(500)
	@se(se077)
	$$show_effect_ui26(back, 1)
	@wipe_effects_bg(3)

#macro	@UI26_網膜モニタにレーダー/背景に敵の位置_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui26(stage, int)


#macro	@UI27_網膜モニタに通知_表示(@type(0))
	if( @type == 0 ) {
		$$show_effect_ui27(front, @type)
		@UI網膜モニタ_表示アニメーション
	} else {
		$$show_effect_ui27(back, @type)
		@wipe_effects_bg(3)
	}

#macro	@UI27_網膜モニタに通知_非表示
	$$hide_effect_ui27
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui27(stage, int)
#command $$hide_effect_ui27


#macro	@UI28_遺伝子の絵、ホログラムで立ち絵の後ろに_表示(@wipe_no(3))
	$$show_effect_ui28
	@wipe_effects_bg(@wipe_no)

#command $$show_effect_ui28


#macro	@UI29_人間とサイボーグと機械_表示
	$$show_effect_ui29(front)
	$$slide_effectui29(front, 1)
	@UI思考_表示アニメーション

#macro	@UI29_人間とサイボーグと機械_スライド表示(@wipe_no(3))
	$$show_effect_ui29(back)
	$$slide_effectui29(back, 2)
	@wipe_effects_bg(@wipe_no)

#macro	@UI29_人間とサイボーグと機械_非表示
	@UI思考_非表示アニメーション

#command $$show_effect_ui29(stage)
#command $$slide_effectui29(stage, int)


#macro	@UI30_網膜モニタに表示されるウィレム_表示(@bup_name, @bg_name(<DISP_BG>))
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie(ef_monitor02_off, 1)
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
	$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, 96, 150, 0, 0)
	@se(se010)
	@timewaitkey(500)
	$$show_effect_ui30(@bg_name, @bup_name)
	$$show_effect_ui30_animation
	@UI網膜モニタ_表示
	@wipe_effects_bg(81)

#macro	@UI30_網膜モニタに表示されるウィレム_裏表示(@bup_name, @bg_name(<DISP_BG>))
	$$show_effect_ui30(@bg_name, @bup_name)
	@UI網膜モニタ_表示

#macro	@UI30_網膜モニタに表示されるウィレム_非表示(@animation(1))
	$$hide_effect_ui30
	@UI網膜モニタ_非表示
	if( @animation )
	{
		$$hide_effect_ui30_animation
		@se(se011)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie(ef_monitor02_off, 1)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
		$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 96, 0, 150, 0, 0)
		@timewaitkey(500)
		@wipe_effects_bg(81)
	}

#macro	@UI30_口元アップ(@bup_name, @wipe_no(3), @bg_name(<DISP_BG>))
	$$show_effect_ui30(@bg_name, @bup_name)
	back.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(2600, 2600)
	back.object[<OBJ_APP_EF_MONITOR_BUP>].set_scale(2500, 2500)
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_BG>], 0, -150, 0, -100, 1500, 0, 2)
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_BUP>], 0, -150, 0, -100, 1500, 0, 2)
	@wipe_effects_bg(@wipe_no)

#macro	@ui30(@bup_name, @wipe_no(0))
	$$update_effect_ui30(@bup_name)
	@wipe_effects_bup(@wipe_no)

#command $$show_effect_ui30(str, str)
#command $$show_effect_ui30_animation
#command $$update_effect_ui30(str)
#command $$hide_effect_ui30
#command $$hide_effect_ui30_animation


#macro	@UI32_レーダー照射線_表示
	$$show_effect_ui32
	@se(se077)
	@UI網膜モニタ_表示アニメーション(0)

#macro	@UI32_レーダー照射線_非表示
	$$hide_effect_ui32
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui32
#command $$hide_effect_ui32


#macro	@UI33_網膜モニタ・ログ確認_表示
	$$show_effect_ui33
	@UI網膜モニタ_表示アニメーション

#macro	@UI33_網膜モニタ・ログ確認_非表示
	$$hide_effect_ui33
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui33
#command $$hide_effect_ui33


#macro	@UI34_網膜モニタに警告_表示
	$$show_effect_ui34
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(500)
	@se(se023, 1)

#macro	@UI34_網膜モニタに警告_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui34


#macro	@UI35_監視システムに侵入し、網膜に映像_表示(@filename1)
	$$show_effect_ui35(front, @filename1)
	@UI網膜モニタ_表示アニメーション

#macro	@UI35_監視システムに侵入し、網膜に映像_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui35(stage, str)


#macro	@UI36_取得データから補正をかけた映像を、モニターに出力_表示
	$$show_effect_ui36
	@UI網膜モニタ_表示アニメーション

#macro	@UI36_取得データから補正をかけた映像を、モニターに出力_非表示
	$$hide_effect_ui36
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui36
#command $$hide_effect_ui36

#macro	@UI37_矢とその解析画面_表示
	$$show_effect_ui37
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(500)
	@se(se014)

#macro	@UI37_矢とその解析画面_非表示
	@UI網膜モニタ_非表示アニメーション

#command $$show_effect_ui37


#macro	@UI38_空に浮かぶレティクル_表示
	$$show_effect_ui38(front, 0)
	@UI網膜モニタ_表示アニメーション(0)

#macro	@UI38_空に浮かぶレティクル_変更(@wipe_no(2))
	$$show_effect_ui38(back, 1)
	@wipe_effects_bg(@wipe_no)

#macro	@UI38_空に浮かぶレティクル_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui38(stage, int)


#macro	@UI39_鹿にレティクル_表示(@type)
	if( @type == 0 ) {
		$$show_effect_ui39(front, @type)
		@UI網膜モニタ_表示アニメーション
	} else {
		@UI網膜モニタ_非表示
		@cg_set(cg_ts40_01)
		$$set_scale_eve($b_obj_cg, 1800, 1900, 1000, 0, 2)
		$$set_pos_eve($b_obj_cg, 340, 350, 340, 350, 1000, 0, 2)
		$$show_effect_ui39(back, @type)
		@se(se077)
		@wipe_effects_bg(3, 0)
	}

#command $$show_effect_ui39(stage, int)


#macro	@UI40_パンタグリュエルワイヤーフレーム_表示
	@se(se054)
	$$show_effect_ui_wireframe_center(cg_ts89_04)
	@timewaitkey(350)
	@se(se008, 1)
	$$show_effect_ui_wireframe_right(cg_ts89_02)

#macro	@UI40_パンタグリュエルワイヤーフレーム_非表示
	@se(se112)
	$$hide_effect_ui_wireframe_right
	@timewaitkey(250)
	@se(se011, 1)
	$$hide_effect_ui_wireframe_center

#macro	@UI41_バガー２７９８ワイヤーフレーム_表示
	$$show_effect_ui41
	@UI網膜モニタ_表示アニメーション
	$$show_effect_ui_wireframe_center(cg_ts89_03)
	@timewaitkey(350)
	@se(se008, 1)
	$$show_effect_ui_wireframe_right(cg_ts89_01)

#macro	@UI41_バガー２７９８ワイヤーフレーム_非表示
	@se(se112)
	$$hide_effect_ui_wireframe_right
	@timewaitkey(250)
	@se(se011, 1)
	$$hide_effect_ui_wireframe_center

#command $$show_effect_ui41
#command $$show_effect_ui_wireframe_center(str)
#command $$show_effect_ui_wireframe_right(str)
#command $$hide_effect_ui_wireframe_center
#command $$hide_effect_ui_wireframe_right

#macro	@UI42_網膜モニタへの被弾通知_表示
	$$show_effect_ui42(front, 1)
	@UI網膜モニタ_表示アニメーション
	@timewaitkey(350)
	@se(se014)

#macro	@UI42_網膜モニタへの被弾通知_スライド表示(@wipe_no(3), @wipe_wait(0))
	$$show_effect_ui42(back, 1)
	$$slide_effect_ui42(back, 1)
	@wipe_effects_bg(@wipe_no, @wipe_wait)

#macro	@UI42_網膜モニタへの被弾通知_非表示
	@UI網膜モニタ_非表示

#command $$show_effect_ui42(stage, int)
#command $$slide_effect_ui42(stage, int)

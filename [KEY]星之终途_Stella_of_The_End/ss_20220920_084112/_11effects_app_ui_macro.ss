//===========================================================================
//!
//!    @file     _11effects_app_ui_macro.ss
//!    @brief    アプリケーション固有のマクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     演出ＵＩ系
//!
//===========================================================================
#z00

//---------------------------------------------------------------------------
// モニター表示／非表示アニメーション
//---------------------------------------------------------------------------
command $$show_monitor_animation(property $obj : object)
{
	$$set_image_center($obj)
	
	$obj.wipe_copy = 1
	$obj.layer = <LAYER_SYS_EFFECT>
	
	$$set_scale_x_eve($obj, 1500, 1000, 150, 0, 2)
	$$set_scale_y_eve($obj, 0, 1000, 150, 0, 1)
	$$set_bright_eve($obj, 255, 0, 150, 0, 1)
}

command $$hide_monitor_animation(property $obj : object)
{
	$obj.wipe_copy = 0
	
	$$set_scale_y_eve($obj, 1000, 0, 150, 0, 1)
	$$set_bright_eve($obj, 0, 255, 150, 0, 1)
}

//---------------------------------------------------------------------------
// 網膜モニタＯＮ
//---------------------------------------------------------------------------
command $$create_monitor_on_movie(property $obj : object)
{
	$obj.init
	$obj.create_movie(ef_monitor01_on, 1, auto_free=0)
	$obj.layer = <LAYER_SYS_EFFECT>
}

//---------------------------------------------------------------------------
// 網膜モニタＯＮ中
//---------------------------------------------------------------------------
command $$create_monitor_loop_movie(property $obj : object, property $blend, property $tr)
{
	$obj.init
	$obj.create_movie_loop(ef_monitor01, 1)
	$obj.set_scale(2000, 2000)
	$obj.layer = <LAYER_SYS_EFFECT>
	$obj.tr = $tr
	$obj.blend = $blend
	$obj.wipe_copy = 1
}

//---------------------------------------------------------------------------
// 網膜モニタＯＦＦ
//---------------------------------------------------------------------------
command $$create_monitor_off_movie(property $obj : object)
{
	$obj.init
	$obj.create_movie(ef_monitor02_off, 1, auto_free=0)
	$obj.blend = 1
	$obj.layer = <LAYER_SYS_EFFECT>
	
	$$set_bright_eve($obj, 96, 0, 150, 0, 0)
}

//---------------------------------------------------------------------------
// 思考ＯＮ
//---------------------------------------------------------------------------
command $$create_mind_on_movie(property $obj : object)
{
	$obj.init
	$obj.create_movie(ef_monitor02_on, 1, auto_free=0)
	$obj.layer = <LAYER_SYS_EFFECT>
}

//---------------------------------------------------------------------------
// 思考ＯＮ中
//---------------------------------------------------------------------------
command $$create_mind_loop_movie(property $obj : object, property $blend, property $tr)
{
	$obj.init
	$obj.create_movie_loop(ef_monitor02, 1)
	$obj.set_scale(2000, 2000)
	$obj.layer = <LAYER_SYS_EFFECT>
	$obj.tr = $tr
	$obj.blend = $blend
	$obj.wipe_copy = 1
}

//---------------------------------------------------------------------------
// 思考ＯＦＦ
//---------------------------------------------------------------------------
command $$create_mind_off_movie(property $obj : object)
{
	$obj.init
	$obj.create_movie(ef_monitor02_off, 1, auto_free=0)
	$obj.layer = <LAYER_SYS_EFFECT>
}


//---------------------------------------------------------------------------
// UI00_汎用モニター
//---------------------------------------------------------------------------
command $$show_effect_ui00(property $filename : str)
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].create($filename, 1)
	front.object[<OBJ_APP_EF_MONITOR_BG>].set_pos(<SCREEN_CENTER_X> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_x / 2, <SCREEN_CENTER_Y> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_y / 2)
	
	$$show_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BG>])
}

command $$hide_effect_ui00
{
	$$hide_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BG>])
}


//---------------------------------------------------------------------------
// UI01_危険な方向をしめす矢印
//---------------------------------------------------------------------------
command $$show_effect_ui01
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui01, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

command $$hide_effect_ui01
{
}

//---------------------------------------------------------------------------
// UI02_簡易的な周辺地図
//---------------------------------------------------------------------------
command $$show_effect_ui02
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui02, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$hide_effect_ui02
{
	$$hide_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

//---------------------------------------------------------------------------
// UI03_震動波形図
//---------------------------------------------------------------------------
command $$show_effect_ui03
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui03, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	
	$$show_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = 0
}

command $$hide_effect_ui03
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].wipe_copy = 0
}

//---------------------------------------------------------------------------
// UI04_解析画面
//---------------------------------------------------------------------------
command $$show_effect_ui04
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 160
}

command $$slide_effectui04(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 128
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	switch( $type ) {
	case(1)
		$sx = 0		$sy = -50
		$ex = 0		$ey = 0
		$time = 2000
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI05_高度
//---------------------------------------------------------------------------
command $$show_effect_ui05(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui05, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

command $$slide_effect_ui05(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, 0, 0, 270, 2000, 350, 2)
}

//---------------------------------------------------------------------------
// UI06_ドローンの解析画像
//---------------------------------------------------------------------------
command $$show_effect_ui06
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui06, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

//---------------------------------------------------------------------------
// UI07_地図
//---------------------------------------------------------------------------
command $$show_effect_ui07
{
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui07, 1)
	$$set_pos_center_from_image(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$slide_effectui07(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui07, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	switch( $type ) {
	case(1)
		$sx = -200		$sy = -50
		$ex = -200		$ey = 50
		$time = 6000
	case(2)
		$sx = -50		$sy = -50
		$ex = 50		$ey = -50
		$time = 6000
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}


//---------------------------------------------------------------------------
// UI08_レーダー
//---------------------------------------------------------------------------
command $$show_effect_ui08(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui08, 1)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

//---------------------------------------------------------------------------
// UI09_網膜モニター上に地図
//---------------------------------------------------------------------------
command $$show_effect_ui09
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui09, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

//---------------------------------------------------------------------------
// UI10_フィリアのスキャン画面
//---------------------------------------------------------------------------
command $$show_effect_ui10
{
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui10, 1)
	$$set_pos_center_from_image(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 160
}

command $$slide_effectui10(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui10, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	if( $type == 1 ) {
		$sx = -400		$sy = 150
		$ex = -200		$ey = 150
	} else {
		$sx = 100		$sy = -100
		$ex = 100		$ey = 100
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, 12000, 0, 0)
}

//---------------------------------------------------------------------------
// UI11_たくさんの警告表示
//---------------------------------------------------------------------------
command $$show_effect_ui11
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui11, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

command $$warning_effect_ui11
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].color_r = 192
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.turn(0, 128, 180, 0, 0)
}

command $$warning_end_effect_ui11
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.end
}

//---------------------------------------------------------------------------
// UI12_地図を表示/次の目的地にピン
//---------------------------------------------------------------------------
command $$show_effect_ui12
{
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui15, 1)
	$$set_pos_center_from_image(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$slide_effectui12(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	property $scale
	
	switch( $type ) {
	case(1)
		$sx = -200		$sy = 120
		$ex = -200		$ey = -50
		$scale = 1500
		$time = 3000
	case(2)
		$sx = 0		$sy = 0
		$ex = 0		$ey = 0
		$scale = 1000
		$time = 0
	}
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui15, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale($scale, $scale)
	
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI13_網膜モニタ上に通知ログ
//---------------------------------------------------------------------------
command $$show_effect_ui13(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui13, 1)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

command $$slide_effectui13(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	property $scale
	
	switch( $type ) {
	case(0)
		$sx = 0		$sy = -100
		$ex = 0		$ey = 0
		$scale = 1500
		$time = 5000
	case(1)
		$sx = 0		$sy = 100
		$ex = 0		$ey = -100
		$scale = 1500
		$time = 13000
	case(2)
		$sx = 0		$sy = 0
		$ex = 0		$ey = 0
		$scale = 1000
		$time = 0
	case(3)
		$sx = 100		$sy = 100
		$ex = 100		$ey = -100
		$scale = 1500
		$time = 13000
	case(4)
		$sx = 150		$sy = 100
		$ex = 150		$ey = -100
		$scale = 1500
		$time = 13000
	case(5)
		$sx = 200		$sy = 100
		$ex = 200		$ey = -100
		$scale = 1500
		$time = 13000
	case(6)
		$sx = 250		$sy = 100
		$ex = 250		$ey = -100
		$scale = 1500
		$time = 13000
	case(7)
		$sx = 300		$sy = 100
		$ex = 300		$ey = -100
		$scale = 1500
		$time = 13000
	}
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui13, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale($scale, $scale)
	
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI14_黒背景とフィリアの白いシルエット
//---------------------------------------------------------------------------
command $$show_effect_ui14
{
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui14, 1)
	
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$$set_pos_center_from_image(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	
	$$set_pos_rep_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, 0, 200, 0, 0, 35000, 0, 0)
	$$set_scale_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], 1500, 1000, 35000, 0, 0)
}

command $$hide_effect_ui14
{
}

//---------------------------------------------------------------------------
// UI15_網膜モニタに写された地図
//---------------------------------------------------------------------------
command $$show_effect_ui15
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui15, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$slide_effectui15(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui15, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	switch( $type ) {
	case(1)
		$sx = -200		$sy = 50
		$ex = -100		$ey = 50
		$time = 6000
	case(2)
		$sx = -100		$sy = 0
		$ex = -200		$ey = -50
		$time = 6000
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI16_レーダーと地図が網膜モニタに映る
//---------------------------------------------------------------------------
command $$show_effect_ui16(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui16, 1)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

command $$slide_effectui16(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui16, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	switch( $type ) {
	case(1)
		$sx = -200		$sy = -100
		$ex = -200		$ey = -50
		$time = 1000
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI17_地図
//---------------------------------------------------------------------------
command $$show_effect_ui17(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui17, 1)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

command $$slide_effectui17(property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui17, 1)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
	
	switch( $type ) {
	case(1)
		$sx = 0		$sy = -50
		$ex = 0		$ey = 0
		$time = 2000
	case(2)
		$sx = -50	$sy = 0
		$ex = -100	$ey = 0
		$time = 1000
	}
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], $sx, $sy, $ex, $ey, $time, 0, 0)
}

//---------------------------------------------------------------------------
// UI18_網膜モニタの表示/被弾箇所
//---------------------------------------------------------------------------
command $$show_effect_ui18(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui18, 1, 0, 0, $type)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	
	if( $type == 2 ) {
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_r = 255
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.turn(0, 64, 500, 0, 0)
	}
}

//---------------------------------------------------------------------------
// UI19_解析画面
//---------------------------------------------------------------------------
command $$show_effect_ui19(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui03, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 210
}

command $$slide_effectui19(property $stage : stage, property $type)
{
	switch( $type ) {
	case(0)
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
		$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], -300, 270, -400, 270, 3000, 0, 0)
	}
}

//---------------------------------------------------------------------------
// UI20_ロケーターのUI
//---------------------------------------------------------------------------
command $$show_effect_ui20(property $type)
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui20, 1)
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].patno = $type
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

//---------------------------------------------------------------------------
// UI21_AI派閥図/ユーレイジアとカフカ―ス
//---------------------------------------------------------------------------
command $$show_effect_ui21(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui21, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

command $$slide_effectui21(property $stage : stage, property $type)
{
	property $sx
	property $sy
	property $ex
	property $ey
	property $time
	
	switch( $type ) {
	case(1)
		$$set_scale_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 1250, 1000, 20000, 0, 0)
	case(2)
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1250, 1250)
		$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 200, 0, -200, 0, 25000, 0, 0)
	}
}

//---------------------------------------------------------------------------
// UI23_網膜モニタに次々と通知
//---------------------------------------------------------------------------
command $$show_effect_ui23(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1, 0, 0, $type)
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$hide_effect_ui23
{
}

//---------------------------------------------------------------------------
// UI25_網膜モニタへの被弾通知
//---------------------------------------------------------------------------
command $$show_effect_ui25(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui18, 1, 0, 0, 0)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_r = 255
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.turn(0, 96, 500, 0, 0)
}

//---------------------------------------------------------------------------
// UI26_網膜モニタにレーダー/背景に敵の位置
//---------------------------------------------------------------------------
command $$show_effect_ui26(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui27, 1, 0, 0, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	
	if( $type == 1 ) {
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
		$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 200, 0, 200, 100, 1000, 0, 2)
	}
}

//---------------------------------------------------------------------------
// UI27_網膜モニタに通知
//---------------------------------------------------------------------------
command $$show_effect_ui27(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui27, 1)
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].patno = $type
	$$set_pos_center_from_image($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$hide_effect_ui27
{
}

//---------------------------------------------------------------------------
// UI28_遺伝子の絵、ホログラムで立ち絵の後ろに
//---------------------------------------------------------------------------
command $$show_effect_ui28
{
	back.object[<OBJ_APP_EF_MONITOR_BG>].create(ef_ui28, 1, 0, 0, 1)
	back.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(1500, 1500)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_BG>])
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_BG>], 0, -50, 0, 50, 12000, 0, 0)
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui28, 1)
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 4
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1250, 1250)
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$$set_pos_eve(back.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, -100, 0, 100, 12000, 0, 0)
}


//---------------------------------------------------------------------------
// UI29_人間とサイボーグと機械
//---------------------------------------------------------------------------
command $$show_effect_ui29(property $stage : stage)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui29, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
}

command $$slide_effectui29(property $stage : stage, property $type)
{
	switch( $type ) {
	case(1)
		$$set_scale_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 1150, 1000, 18000, 0, 0)
	case(2)
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1750, 1750)
		$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, -370, 0, -320, 3000, 0, 0)
	}
}

//---------------------------------------------------------------------------
// UI30_網膜モニタに表示されるウィレム
//---------------------------------------------------------------------------
command $$show_effect_ui30(property $bg_name : str, property $bup_name : str)
{
	$bg_name = "ef_monitor_" + $$off_bgfile_blur($bg_name)
	$bup_name = "ef_monitor_wi" + $bup_name.right(2)
	
	back.object[<OBJ_APP_EF_MONITOR_BG>].init
	back.object[<OBJ_APP_EF_MONITOR_BG>].create($bg_name, 1)
	back.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(1100, 1100)
	back.object[<OBJ_APP_EF_MONITOR_BG>].wipe_copy = 1
	back.object[<OBJ_APP_EF_MONITOR_BG>].layer = <LAYER_SYS_EFFECT> - 1
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_BG>])
	
	back.object[<OBJ_APP_EF_MONITOR_BUP>].init
	back.object[<OBJ_APP_EF_MONITOR_BUP>].create($bup_name, 1)
	back.object[<OBJ_APP_EF_MONITOR_BUP>].wipe_copy = 1
	back.object[<OBJ_APP_EF_MONITOR_BUP>].layer = <LAYER_SYS_EFFECT> - 1
	$$set_image_center(back.object[<OBJ_APP_EF_MONITOR_BUP>])
}

command $$show_effect_ui30_animation
{
	$$set_bright_eve(back.object[<OBJ_APP_EF_MONITOR_BG>], 255, 0, 150, 150, 2)
	$$set_tr_eve(back.object[<OBJ_APP_EF_MONITOR_BG>], 0, 255, 250, 0, 2)
	
	$$set_bright_eve(back.object[<OBJ_APP_EF_MONITOR_BUP>], 255, 0, 150, 150, 2)
	$$set_tr_eve(back.object[<OBJ_APP_EF_MONITOR_BG>], 0, 255, 250, 0, 2)
}

command $$update_effect_ui30(property $bup_name : str)
{
	$bup_name = "ef_monitor_wi" + $bup_name.right(2)
	
	back.object[<OBJ_APP_EF_MONITOR_BUP>].create_copy_from(front.object[<OBJ_APP_EF_MONITOR_BUP>])
	back.object[<OBJ_APP_EF_MONITOR_BUP>].change_file($bup_name)
}

command $$hide_effect_ui30
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].wipe_copy = 0
	front.object[<OBJ_APP_EF_MONITOR_BUP>].wipe_copy = 0
}

command $$hide_effect_ui30_animation
{
	$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_BG>], 0, 96, 250, 0, 2)
	$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_BUP>], 0, 96, 250, 0, 2)
}

//---------------------------------------------------------------------------
// UI32_レーダー照射線
//---------------------------------------------------------------------------
command $$show_effect_ui32
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1, 0, 0, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$hide_effect_ui32
{
}

//---------------------------------------------------------------------------
// UI33_網膜モニタ・ログ確認
//---------------------------------------------------------------------------
command $$show_effect_ui33
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(<DISP_BG>, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(2000, 2000)
	$$set_pos(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 960, -740)
	
	$$create_cinemascope_object(front.object[<OBJ_SYS_EF_CINEMASCOPE1>], front.object[<OBJ_SYS_EF_CINEMASCOPE2>], 200, 0, 0, 0, 255)
	front.object[<OBJ_SYS_EF_CINEMASCOPE1>].layer = <LAYER_SYS_FRONT_BG>
	front.object[<OBJ_SYS_EF_CINEMASCOPE2>].layer = <LAYER_SYS_FRONT_BG>
}

command $$hide_effect_ui33
{
}

//---------------------------------------------------------------------------
// UI34_網膜モニタに警告
//---------------------------------------------------------------------------
command $$show_effect_ui34
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1, 0, 0, 1)
	$$set_pos_center_from_image(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
	
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].color_r = 255
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.turn(128, 160, 500, 500, 0)
}

//---------------------------------------------------------------------------
// UI35_監視システムに侵入し、網膜に映像
//---------------------------------------------------------------------------
command $$show_effect_ui35(property $stage : stage, property $filename1 : str)
{
	$stage.object[<OBJ_APP_EF_MONITOR_BG>].create($filename1, 1)
	$stage.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(1500, 1500)
	$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_BG>], 100, -100, -100, -100, 10000, 350, 0)
	
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui27, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
}

//---------------------------------------------------------------------------
// UI36_取得データから補正をかけた映像を、モニターに出力
//---------------------------------------------------------------------------
command $$show_effect_ui36
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].create(cg_ts89, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_BG>])
	front.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(1250, 1250)
	$$set_pos_eve(front.object[<OBJ_APP_EF_MONITOR_BG>], 50, -0, 50, 100, 8000, 350, 0)

	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui27, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

command $$hide_effect_ui36
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].wipe_copy = 0
}

//---------------------------------------------------------------------------
// UI37_矢とその解析画面
//---------------------------------------------------------------------------
command $$show_effect_ui37
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].create(cg_ts79, 1)
	front.object[<OBJ_APP_EF_MONITOR_BG>].set_scale(1500, 1500)
	
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_BG>])
	$$set_pos_eve(front.object[<OBJ_APP_EF_MONITOR_BG>], 480, -170, 480, -270, 2000, 350, 2)

	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui27, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 192
}

//---------------------------------------------------------------------------
// UI38_空に浮かぶレティクル
//---------------------------------------------------------------------------
command $$show_effect_ui38(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_reticle, 1, 0, 0, $type)
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1000, 1000)
}

//---------------------------------------------------------------------------
// UI39_鹿にレティクル_表示
//---------------------------------------------------------------------------
command $$show_effect_ui39(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_reticle, 1, 0, 0, $type)
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1000, 1000)
}

//---------------------------------------------------------------------------
// UI40_パンタグリュエルワイヤーフレーム
// UI41_バガー２７９８ワイヤーフレーム
//---------------------------------------------------------------------------
command $$show_effect_ui41
{
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui04, 1, 0, 0, 1)
	$$set_image_center(front.object[<OBJ_APP_EF_MONITOR_PANEL>])
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 128
}

command $$show_effect_ui_wireframe_center(property $filename : str)
{
	front.object[<OBJ_APP_EF_MONITOR_BG>].create($filename, 1)
	front.object[<OBJ_APP_EF_MONITOR_BG>].set_pos(<SCREEN_CENTER_X> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_x / 2, <SCREEN_CENTER_Y> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_y / 2)
	
	$$show_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BG>])
	front.object[<OBJ_APP_EF_MONITOR_BG>].layer = 0
}

command $$show_effect_ui_wireframe_right(property $filename : str)
{
	front.object[<OBJ_APP_EF_MONITOR_BUP>].create($filename, 1)
	front.object[<OBJ_APP_EF_MONITOR_BUP>].set_pos(<SCREEN_CENTER_X> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_x / 2, <SCREEN_CENTER_Y> - front.object[<OBJ_APP_EF_MONITOR_BG>].get_size_y / 2)
	
	$$show_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BUP>])
	front.object[<OBJ_APP_EF_MONITOR_BUP>].layer = 0
}

command $$hide_effect_ui_wireframe_center
{
	$$hide_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BG>])
}

command $$hide_effect_ui_wireframe_right
{
	$$hide_monitor_animation(front.object[<OBJ_APP_EF_MONITOR_BUP>])
}

//---------------------------------------------------------------------------
// UI42_網膜モニタへの被弾通知
//---------------------------------------------------------------------------
command $$show_effect_ui42(property $stage : stage, property $type)
{
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].create(ef_ui18, 1, 0, 0, 1)
	$$set_image_center($stage.object[<OBJ_APP_EF_MONITOR_PANEL>])
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].tr = 224
	
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_r = 255
	$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].color_rate_eve.turn(0, 96, 500, 0, 0)
}

command $$slide_effect_ui42(property $stage : stage, property $type)
{
	switch( $type ) {
	case(1)
		$stage.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(1500, 1500)
		$$set_pos_eve($stage.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, -50, 0, 50, 3000, 0, 0)
	}
}

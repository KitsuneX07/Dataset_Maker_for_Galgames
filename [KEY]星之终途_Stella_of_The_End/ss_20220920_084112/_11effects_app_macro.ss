//===========================================================================
//!
//!    @file     _11effects_app_macro.ss
//!    @brief    アプリケーション固有のマクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     タイトル固有の演出コマンド
//!
//===========================================================================

#z00

//---------------------------------------------------------------------------
// 立ち絵カットイン表示
//---------------------------------------------------------------------------
command $$bs_cutin(property $bup_name : str, property $cutin_name : str, property $offset_x)
{
	property $chara_no
	property $obj_bg_no
	property $obj_bup_no
	
	$chara_no = $$chr2num($bup_name)
	$obj_bg_no  = <OBJ_APP_CUTIN_BG>  + $chara_no
	$obj_bup_no = <OBJ_APP_CUTIN_BUP> + $chara_no
	
	// カットイン表示済みの場合は表情変更
	if( front.object[$obj_bup_no].disp )
	{
		$$bs_cutin_change(front.object[$obj_bup_no], back.object[$obj_bup_no], $bup_name)
		$$wipe_effects_base(0, <WIPE_CH>, 0, 0)
	}
	else
	{
		$$bs_cutin_create(back.object[$obj_bg_no], back.object[$obj_bup_no], $bup_name, $cutin_name, $offset_x)
		$$wipe_effects_base(0, <WIPE_CH>, 1, 0)
	}
}

// 立ち絵カットイン作成
command $$bs_cutin_create(property $obj_bg : object, property $obj_bup : object, property $bup_name : str, property $cutin_name : str, property $offset_x)
{
	property $mask_index
	property $move_time
	property $move_x
	property $mask_offset_x
	
	$mask_index = 0 + $$chr2num($bup_name)
	$move_time = 350
	$move_x = 400
	$offset_x = $$pos_convert_x($offset_x)
	
	// マスクの補正座標を取得
	$obj_bg.init
	$obj_bg.create($cutin_name)		// マスクのサイズを取得するため一時的に読み込み
	$mask_offset_x = <SCREEN_CENTER_X> - $obj_bg.get_size_x / 2 + $offset_x
	
	// マスク作成
	mask[$mask_index].init
	mask[$mask_index].create($cutin_name)
	
	// 背景作成
	$obj_bg.init
	$obj_bg.create(bg_kuro, 1)
	$obj_bg.set_scale(2000, 2000)
	$obj_bg.layer = 1
	$obj_bg.wipe_copy = 1
	$obj_bg.x += $offset_x - <SCREEN_CENTER_X>
	$obj_bg.tr = 128
	$obj_bg.mask_no = $mask_index
	
	// 立ち絵作成
	$$create_effects_bup_object($obj_bup, $bup_name)
	$obj_bup.set_scale(1500, 1500)
	$obj_bup.x += $offset_x
	$obj_bup.layer = 1
	$obj_bup.wipe_copy = 1
	$obj_bup.mask_no = $mask_index
	
	// キャラごとの座標補正
	if( $bup_name.mid(3, 2) == "PH" ) {
		$obj_bup.y += $$pos_convert_y(-180)
	}
	
	// アニメーション作成
	if( <EFFECT_CUT> ) {
		$move_time = 0
	}
	$$set_pos_rep_eve($obj_bg,  0, -$move_x, 0, 0, 0, $move_time, 0, 2)
	$$set_pos_rep_eve($obj_bup, 0, -$move_x, 0, 0, 0, $move_time, 0, 2)
	$$set_tr_rep_eve($obj_bg,  0, 0, 255, $move_time, 0, 2)
	$$set_tr_rep_eve($obj_bup, 0, 0, 255, $move_time, 0, 2)
	
	mask[$mask_index].x = $mask_offset_x - $$pos_convert_x($move_x)
	mask[$mask_index].x_eve.set($mask_offset_x, $move_time, 0, 2)
}

// 立ち絵カットイン変更
command $$bs_cutin_change(property $front_obj_bup : object, property $back_obj_bup : object, property $bup_name : str)
{
	$back_obj_bup.create_copy_from($front_obj_bup)
	$back_obj_bup.change_file($$system_bs_file($bup_name))
}

//---------------------------------------------------------------------------
// 立ち絵カットイン非表示
//---------------------------------------------------------------------------
command $$bup_cutin_del(property $bup_name : str, property $animation)
{
	property $chara_no
	property $obj_bg_no
	property $obj_bup_no
	property $mask_index
	property $move_time
	property $move_x
	
	$chara_no = $$chr2num($bup_name)
	$obj_bg_no  = <OBJ_APP_CUTIN_BG>  + $chara_no
	$obj_bup_no = <OBJ_APP_CUTIN_BUP> + $chara_no
	
	$mask_index = 0 + $$chr2num($bup_name)
	$move_time = 350
	$move_x = 400
	
	if( $animation )
	{
		if( <EFFECT_CUT> ) {
			$move_time = 0
		}
		$$set_pos_rep_eve(front.object[$obj_bg_no],  0, 0, 0, $move_x, 0, $move_time, 0, 2)
		$$set_pos_rep_eve(front.object[$obj_bup_no], 0, 0, 0, $move_x, 0, $move_time, 0, 2)
		
		$$set_tr_eve(front.object[$obj_bg_no],  255, 0, $move_time, 0, 2)
		$$set_tr_eve(front.object[$obj_bup_no], 255, 0, $move_time, 0, 2)
		
		mask[$mask_index].x_eve.set(mask[$mask_index].x + $$pos_convert_x($move_x), $move_time, 0, 2)
	}
	
	front.object[$obj_bg_no].wipe_copy = 0
	front.object[$obj_bup_no].wipe_copy = 0
}

//---------------------------------------------------------------------------
// 立ち絵画像拡張
//---------------------------------------------------------------------------
command $$bup_extension(property $obj : object, property $bup_name : str)
{
	property $chara : str
	
	$chara = $bup_name.mid(3, 2)
	
	// フィリア、デリラ以外は作成しない
	if( $chara != "PH" && $chara != "DE") {
		return
	}
	
	back.object[<OBJ_BUP_EXTENSION>].create_copy_from($obj)
	
	switch( $chara ) {
	case("PH")		back.object[<OBJ_BUP_EXTENSION>].change_file(ef_bs3_ph_ext)
					back.object[<OBJ_BUP_EXTENSION>].x = $obj.get_size_x + 52				// bs3_PH02_base01<size_x> - (<CENTER_X> - bs3_PH02_base01<CENTERPOS_X>)
	case("DE")		back.object[<OBJ_BUP_EXTENSION>].change_file(ef_bs3_de_ext)
					back.object[<OBJ_BUP_EXTENSION>].x = $obj.get_size_x - 6				// bs3_DE01_base01<size_x> - (<CENTER_X> - bs3_DE01_base01<CENTERPOS_X>)
	}
}

//---------------------------------------------------------------------------
// ウィレム口元カットイン
//---------------------------------------------------------------------------
command $$cutin_wi01(property $stage : stage, property $bup_name : str)
{
	property $obj_no
	property $rect_top
	property $rect_bottom
	property $border_size
	property $move_time
	
	$rect_top = 350
	$rect_bottom = 730
	$border_size = 3
	$move_time = 1000
	
	// 背景
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, 0, 0, 0, 224, 1)
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].layer = <LAYER_SYS_EFFECT> - 1
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].wipe_copy = 1
	
	// キャラ
	$obj_no = $$chr2num($bup_name)
	$stage.object[$obj_no].create($$system_bs_file($bup_name), 1)
	$stage.object[$obj_no].layer = <LAYER_SYS_EFFECT>
	$stage.object[$obj_no].set_scale(2000, 2000)
	$$set_pos($stage.object[$obj_no], 1060, -450)
	
	// ボーダー
	$stage.object[<OBJ_APP_EF_UTIL1> + 2].create_rect(0, 0, <SCREEN_WIDTH>, $border_size, 255, 255, 255, 192, 1)
	$stage.object[<OBJ_APP_EF_UTIL1> + 2].layer = <LAYER_SYS_EFFECT>
	$stage.object[<OBJ_APP_EF_UTIL1> + 2].wipe_copy = 1
	
	$stage.object[<OBJ_APP_EF_UTIL1> + 3].create_rect(0, 0, <SCREEN_WIDTH>, $border_size, 255, 255, 255, 192, 1)
	$stage.object[<OBJ_APP_EF_UTIL1> + 3].layer = <LAYER_SYS_EFFECT>
	$stage.object[<OBJ_APP_EF_UTIL1> + 3].wipe_copy = 1
	
	// 矩形設定
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].set_clip(1, 0, <SCREEN_CENTER_Y>, <SCREEN_WIDTH>, <SCREEN_CENTER_Y>)
	$stage.object[$obj_no].set_clip(1, 0, <SCREEN_CENTER_Y>, <SCREEN_WIDTH>, <SCREEN_CENTER_Y>)
	
	// アニメーション
	if( <EFFECT_CUT> ) {
		$move_time = 0
	}
	$$set_pos_eve($stage.object[<OBJ_APP_EF_UTIL1> + 2], 0, <SCREEN_CENTER_Y>, 0, $rect_top - $border_size, $move_time, 0, 2)
	$$set_pos_eve($stage.object[<OBJ_APP_EF_UTIL1> + 3], 0, <SCREEN_CENTER_Y>, 0, $rect_bottom, $move_time, 0, 2)
		
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].clip_top_eve.set($$pos_convert_y($rect_top), $move_time, 0, 2)
	$stage.object[$obj_no].clip_top_eve.set($$pos_convert_y($rect_top), $move_time, 0, 2)
		
	$stage.object[<OBJ_APP_EF_UTIL1> + 0].clip_bottom_eve.set($$pos_convert_y($rect_bottom), $move_time, 0, 2)
	$stage.object[$obj_no].clip_bottom_eve.set($$pos_convert_y($rect_bottom), $move_time, 0, 2)
	
	$$set_tr_eve($stage.object[<OBJ_APP_EF_UTIL1> + 0], 0, 255, $move_time, 0, 2)
	$$set_tr_eve($stage.object[$obj_no], 0, 255, $move_time, 0, 2)
	$$set_tr_eve($stage.object[<OBJ_APP_EF_UTIL1> + 2], 0, 255, $move_time, 0, 2)
	$$set_tr_eve($stage.object[<OBJ_APP_EF_UTIL1> + 3], 0, 255, $move_time, 0, 2)
}


//---------------------------------------------------------------------------
// めまい
//---------------------------------------------------------------------------
command $$dizzy
{
	property $i
	property $obj_index
	
	$obj_index = <OBJ_APP_DIZZY_START>
	
	// 背景
	if( back.object[<O_BG>].disp )
	{
		back.object[$obj_index].create_copy_from(back.object[<O_BG>])
		back.object[$obj_index].tr = 64
		back.object[$obj_index].x_rep.resize(1)
		back.object[$obj_index].x_rep_eve[0].turn(0, $$pos_convert_x(20), 1000, 0, 2)
		
		back.object[$obj_index + 1].create_copy_from(back.object[<O_BG>])
		back.object[$obj_index + 1].tr = 64
		back.object[$obj_index + 1].y_rep.resize(1)
		back.object[$obj_index + 1].y_rep_eve[0].turn(0, $$pos_convert_y(20), 800, 0, 2)
		
		back.object[$obj_index + 2].create_copy_from(back.object[<O_BG>])
		back.object[$obj_index + 2].tr = 128
		back.object[$obj_index + 2].x_rep.resize(1)
		back.object[$obj_index + 2].x_rep_eve[0].turn(0, $$pos_convert_x(-20), 1500, 0, 2)
		
		$obj_index += 3
	}
	
	// キャラ
	for( $i = <BUP_MIN>, $i < <BUP_MAX>, $i += 1 )
	{
		if( back.object[$i].disp )
		{
			back.object[$obj_index].create_copy_from(back.object[$i])
			back.object[$obj_index].tr = 64
			back.object[$obj_index].dark = 128
			back.object[$obj_index].x_rep.resize(2)
			back.object[$obj_index].x_rep_eve[1].turn($$pos_convert_x(5), $$pos_convert_x(20), 1000, 0, 2)
			
			back.object[$obj_index + 1].create_copy_from(back.object[$i])
			back.object[$obj_index + 1].tr = 64
			back.object[$obj_index + 1].dark = 128
			back.object[$obj_index + 1].y_rep.resize(2)
			back.object[$obj_index + 1].y_rep_eve[1].turn($$pos_convert_y(5), $$pos_convert_y(20), 800, 0, 2)
			
			back.object[$obj_index + 2].create_copy_from(back.object[$i])
			back.object[$obj_index + 2].tr = 96
			back.object[$obj_index + 2].dark = 128
			back.object[$obj_index + 2].x_rep.resize(2)
			back.object[$obj_index + 2].x_rep_eve[1].turn(0, $$pos_convert_x(-20), 1500, 0, 2)
			
			$obj_index += 3
		}
	}
}

command $$dizzy_update(property $bup_name : str)
{
	property $obj_index
	
	$obj_index = <OBJ_APP_DIZZY_START> + 3
	
	back.object[$obj_index].create_copy_from(front.object[$obj_index])
	back.object[$obj_index].change_file($$system_bs_file($bup_name))

	back.object[$obj_index + 1].create_copy_from(front.object[$obj_index + 1])
	back.object[$obj_index + 1].change_file($$system_bs_file($bup_name))
	
	back.object[$obj_index + 2].create_copy_from(front.object[$obj_index + 2])
	back.object[$obj_index + 2].change_file($$system_bs_file($bup_name))
}

command $$dizzy_end
{
	property $i
	property $obj_index
	
	$obj_index = <OBJ_APP_DIZZY_START>
	
	front.object[$obj_index].wipe_copy = 0
	front.object[$obj_index + 1].wipe_copy = 0
	front.object[$obj_index + 2].wipe_copy = 0
	
	$obj_index += 3
	
	for( $i = <BUP_MIN>, $i < <BUP_MAX>, $i += 1 )
	{
		if( front.object[$i].disp )
		{
			front.object[$obj_index].wipe_copy = 0
			front.object[$obj_index + 1].wipe_copy = 0
			front.object[$obj_index + 2].wipe_copy = 0
		}
	}
}

//---------------------------------------------------------------------------
// 走る背景
//---------------------------------------------------------------------------
command $$create_run_bg(property $filename : str)
{
	$$create_effects_bg_object(back.object[<OBJ_APP_RUN_BG_START> + 0], $filename)
	$$create_effects_bg_object(back.object[<OBJ_APP_RUN_BG_START> + 1], $filename)
	$$create_effects_bg_object(back.object[<OBJ_APP_RUN_BG_START> + 2], $filename)
	
	back.object[<OBJ_APP_RUN_BG_START> + 1].set_scale(1500, 1500)
	back.object[<OBJ_APP_RUN_BG_START> + 2].set_scale(1500, 1500)
	$$set_pos(back.object[<OBJ_APP_RUN_BG_START> + 2], -480, -270)
	
	back.object[<OBJ_APP_RUN_BG_START> + 1].frame_action.start(-1, "$$fa_run_bg", 0)
	back.object[<OBJ_APP_RUN_BG_START> + 2].frame_action.start(-1, "$$fa_run_bg", 1000)
}

command $$fa_run_bg(property $fa : frameaction, property $obj : object, property $start_time)
{
	L[0] = $fa.counter.get % 3000
	$obj.tr = math.timetable(L[0], $start_time, 0, [0, 1000, 255], [1000, 2000, 0])
}


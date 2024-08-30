//===========================================================================
//!
//!    @file     _10effects_sys_macro.ss
//!    @brief    システム寄りの演出マクロ群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     タイトルにとらわれず使い回しが可能そうな演出コマンド
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// フラッシュオブジェクトを作成する
//-----------------------------------------------------------------
command $$create_flash_object(property $obj : object, property $time, property $count, property $red, property $green, property $blue, property $tr)
{
	property $i
	
	$obj.init
	$obj.create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, $red, $green, $blue, $tr, 1)
	$obj.tr = 0
	$obj.layer = <LAYER_SYS_EFFECT>
	
	for( $i = 0, $i < $count, $i += 1 )
	{
		$obj.tr_eve.set($tr, $time / 2, 0, 1)
		$obj.tr_eve.wait_key
		
		$obj.tr_eve.set(  0, $time / 2, 0, 1)
		$obj.tr_eve.wait_key
	}
}

//-----------------------------------------------------------------
// スクリーンフィルターオブジェクトを作成する
//-----------------------------------------------------------------
command $$create_screen_filter_object(property $obj : object, property $red, property $green, property $blue, property $tr)
{
	$obj.init
	$obj.create_rect(0, 0, <SCREEN_WIDTH>, <SCREEN_HEIGHT>, $red, $green, $blue, $tr, 1)
	$obj.wipe_copy = 1
}

//-----------------------------------------------------------------
// シネマスコープオブジェクトを作成する
//-----------------------------------------------------------------
command $$create_cinemascope_object(property $obj1 : object, property $obj2 : object, property $length, property $red, property $green, property $blue, property $tr)
{
	$length = $$pos_convert_y($length)
	
	$obj1.init
	$obj1.create_rect(0, 0, <SCREEN_WIDTH>, $length, $red, $green, $blue, $tr, 1)
	$obj1.wipe_copy = 1
	
	$obj2.init
	$obj2.create_rect(0, 0, <SCREEN_WIDTH>, $length, $red, $green, $blue, $tr, 1)
	$obj2.y = <SCREEN_HEIGHT> - $length
	$obj2.wipe_copy = 1
}

//-----------------------------------------------------------------
// フィルムノイズオブジェクトを作成する
//-----------------------------------------------------------------
command $$create_film_noise_object(property $obj : object)
{
	$obj.init
	$obj.create_movie_loop(ef_fnoise00, 1)
	$obj.wipe_copy = 1
	$obj.layer = <LAYER_SYS_EFFECT>
	
	$$set_screen_scale($obj)
}

//-----------------------------------------------------------------
// ドットノイズオブジェクトを作成する
//-----------------------------------------------------------------
command $$create_dot_noise_object(property $obj : object, property $filename : str)
{
	$obj.init
	$obj.create($filename, @On)
	$obj.load_gan($filename)
	$obj.start_gan(0, 1)
	$obj.wipe_copy = 1
	$obj.layer = <LAYER_SYS_EFFECT>
	$obj.blend = 4
	
	$$set_screen_scale($obj)
}

//-----------------------------------------------------------------
// 回想枠オブジェクトを作成する
//-----------------------------------------------------------------
command $$create_recollect_object(property $obj : object, property $filename : str)
{
	$obj.init
	$obj.create_movie_loop($filename, 1)
	$obj.wipe_copy = 1
	$obj.layer = <LAYER_SYS_EFFECT>
	
	$$set_screen_scale($obj)
}

//-----------------------------------------------------------------
// 集中線オブジェクトを作成する
//-----------------------------------------------------------------
command $$create_line_object(property $obj : object, property $filename : str)
{
	// ゲーム解像度：1920x1080
	// 集中線解像度：2048 x 1200
	
	$obj.init
	$obj.create($filename, @On)
	$obj.set_pos(-($obj.get_size_x - <SCREEN_WIDTH>) / 2, -($obj.get_size_y - <SCREEN_HEIGHT>) / 2)
	$obj.load_gan($filename)
	$obj.start_gan(0, 1)
	$obj.wipe_copy = 1
	$obj.layer = <LAYER_SYS_EFFECT>
}


//===========================================================================
//!
//!    @file     _10effects_core.ss
//!    @brief    演出汎用関数群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     siglus寄りの関数群
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// g00の存在を判定する
//-----------------------------------------------------------------
command $$is_exist_g00(property $filename : str) : int
{
	return (system.check_file_exist("g00\\" + $filename + ".g00"))
}

//---------------------------------------------------------------------------
// フラグを反転する
//---------------------------------------------------------------------------
command $$reverse_flag(property $flag) : int
{
	return (math.abs($flag - 1))
}

//---------------------------------------------------------------------------
// 半角から全角に変換する
//---------------------------------------------------------------------------
command $$zen_to_han(property $str : str) : str
{
	property $i
	property $code
	property $tmp : str
	
	for( $i = 0, $i < $str.cnt, $i += 1 ) {
		if( $str.get_code($i) == 32 ) {
			$tmp += math.tostr_by_code($str.get_code($i))
		} else {
			$tmp += math.tostr_by_code($str.get_code($i) + 65248)
		}
	}
	
	return ($tmp)
}

//---------------------------------------------------------------------------
// 文字列をセンタリングする際のx補正座標
//---------------------------------------------------------------------------
command $$get_text_centering_rep_x(property $msg : str, property $moji_size, property $message_pos) : int
{
	property $messgae_size
	property $text_pos
	
	$messgae_size = $msg.cnt * $moji_size
	$text_pos = (<SCREEN_WIDTH> - $messgae_size) / 2 - $message_pos
	
	return ($text_pos)
}

//---------------------------------------------------------------------------
// 解像度によるx座標補正
//---------------------------------------------------------------------------
command $$pos_convert_x(property $x) : int
{
	return (((<SCREEN_WIDTH>  * 1000 / 1920) * $x) / 1000)
}

//---------------------------------------------------------------------------
// 解像度によるy座標補正
//---------------------------------------------------------------------------
command $$pos_convert_y(property $y) : int
{
	return (((<SCREEN_HEIGHT> * 1000 / 1080) * $y) / 1000)
}

//---------------------------------------------------------------------------
// 読み込んだ画像の中心を補正座標にする
//---------------------------------------------------------------------------
command $$set_image_center(property $obj : object)
{
	$obj.set_center_rep($obj.get_size_x / 2, $obj.get_size_y / 2)
}

//---------------------------------------------------------------------------
// 読み込んだ画像を元に画面中心に設定する
//---------------------------------------------------------------------------
command $$set_pos_center_from_image(property $obj : object)
{
	$obj.set_pos(<SCREEN_CENTER_X> - $obj.get_size_x / 2, <SCREEN_CENTER_Y> - $obj.get_size_y / 2)
}

//---------------------------------------------------------------------------
// オブジェクトをウインドウサイズサイズに拡縮する
//---------------------------------------------------------------------------
command $$set_screen_scale(property $obj : object)
{
	$obj.set_scale(<SCREEN_WIDTH> * 1000 / $obj.get_size_x, <SCREEN_HEIGHT> * 1000 / $obj.get_size_y)
}

//-----------------------------------------------------------------
// オブジェクトに座標を設定する
//-----------------------------------------------------------------
command $$set_pos(property $obj : object, property $x, property $y)
{
	$obj.set_pos($$pos_convert_x($x), $$pos_convert_y($y))
}

//-----------------------------------------------------------------
// オブジェクトに座標イベントを設定する
//-----------------------------------------------------------------
command $$set_pos_eve(property $obj : object, property $src_x, property $src_y, property $dst_x, property $dst_y, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$$set_pos($obj, $src_x, $src_y)
	
	if( $src_x != $dst_x ) {
		$obj.x_eve.set($$pos_convert_x($dst_x), $time, $start_time, $speed_mode)
	}
	if( $src_y != $dst_y ) {
		$obj.y_eve.set($$pos_convert_y($dst_y), $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに補正座標を設定する
//-----------------------------------------------------------------
command $$set_pos_rep(property $obj : object, property $rep_index, property $x, property $y)
{
	$obj.x_rep.resize($rep_index + 1)
	$obj.y_rep.resize($rep_index + 1)
	
	$obj.x_rep[$rep_index] = $$pos_convert_x($x)
	$obj.y_rep[$rep_index] = $$pos_convert_y($y)
}

//-----------------------------------------------------------------
// オブジェクトに補正座標イベントを設定する
//-----------------------------------------------------------------
command $$set_pos_rep_eve(property $obj : object, property $rep_index, property $src_x, property $src_y, property $dst_x, property $dst_y, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$$set_pos_rep($obj, $rep_index, $src_x, $src_y)
	
	if( $src_x != $dst_x ) {
		$obj.x_rep_eve[$rep_index].set($$pos_convert_x($dst_x), $time, $start_time, $speed_mode)
	}
	if( $src_y != $dst_y ) {
		$obj.y_rep_eve[$rep_index].set($$pos_convert_y($dst_y), $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに拡縮イベントを設定する
//-----------------------------------------------------------------
command $$set_scale_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.set_scale($src, $src)
	
	if( $src != $dst ) {
		$obj.scale_x_eve.set($dst, $time, $start_time, $speed_mode)
		$obj.scale_y_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに拡縮(x)イベントを設定する
//-----------------------------------------------------------------
command $$set_scale_x_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.scale_x = $src
	
	if( $src != $dst ) {
		$obj.scale_x_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに拡縮(y)イベントを設定する
//-----------------------------------------------------------------
command $$set_scale_y_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.scale_y = $src
	
	if( $src != $dst ) {
		$obj.scale_y_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに不透明度イベントを設定する
//-----------------------------------------------------------------
command $$set_tr_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.tr = $src
	
	if( $src != $dst ) {
		$obj.tr_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに補正不透明度イベントを設定する
//-----------------------------------------------------------------
command $$set_tr_rep_eve(property $obj : object, property $rep_index, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.tr_rep.resize($rep_index + 1)
	$obj.tr_rep[$rep_index] = $src
	
	if( $src != $dst ) {
		$obj.tr_rep_eve[$rep_index].set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに明るさイベントを設定する
//-----------------------------------------------------------------
command $$set_bright_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.bright = $src
	
	if( $src != $dst ) {
		$obj.bright_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトに暗さイベントを設定する
//-----------------------------------------------------------------
command $$set_dark_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.dark = $src
	
	if( $src != $dst ) {
		$obj.dark_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// オブジェクトにモノクロイベントを設定する
//-----------------------------------------------------------------
command $$set_move_eve(property $obj : object, property $src, property $dst, property $time, property $start_time, property $speed_mode)
{
	if( <EFFECT_CUT> ) {
		$time = 0
	}
	
	$obj.mono = $src
	
	if( $src != $dst ) {
		$obj.mono_eve.set($dst, $time, $start_time, $speed_mode)
	}
}

//-----------------------------------------------------------------
// omvオブジェクトのムービー再生を待つ
//-----------------------------------------------------------------
command $$wait_omv_key(property $obj : object)
{
	if( script.check_skip == 0 ) {
		$obj.wait_movie_key
	}
}

//---------------------------------------------------------------------------
// メッセージバックに追加する
//---------------------------------------------------------------------------
command $$add_msgback(property $koe_no, property $chara_no, property $name : str, property $msg : str)
{
	msgbk.go_next_msg			// メッセージを１つ進める
	
	if( $koe_no != -1 )
	{
		msgbk.add_koe($koe_no, $chara_no)	// 声を設定
	}
	
	if( $name != "" )
	{
		msgbk.add_namae($name)				// 名前を設定
	}
	
	msgbk.add_msg($msg)			// メッセージを設定
}

//---------------------------------------------------------------------------
// メッセージウィンドウボタンの表示をオンにする
//---------------------------------------------------------------------------
command $$mwnd_btn_disp_on
{
	property $i
	
	for( $i = 0, $i < front.mwnd[get_mwnd].button.get_size, $i += 1 )
	{
		front.mwnd[get_mwnd].button[$i].disp = 1
	}
}

//---------------------------------------------------------------------------
// メッセージウィンドウボタンの表示をオフにする
//---------------------------------------------------------------------------
command $$mwnd_btn_disp_off
{
	property $i
	
	for( $i = 0, $i < front.mwnd[get_mwnd].button.get_size, $i += 1 )
	{
		front.mwnd[get_mwnd].button[$i].disp = 0
	}
}

//---------------------------------------------------------------------------
// ユーザー制御を可能にする
//---------------------------------------------------------------------------
command $$user_control_enabled
{
	syscom.set_syscom_menu_enable			// システムコマンドを許可する
	syscom.set_hide_mwnd_enable_flag(1)		// ウィンドウを消すを許可する
	script.set_mouse_disp_on				// マウスカーソルを表示する
	script.set_msg_back_enable				// メッセージバックを許可する
	script.set_shortcut_enable				// ショートカットを許可する
	script.set_ctrl_skip_enable				// 早送りを許可する
}

//---------------------------------------------------------------------------
// ユーザー制御を不可能にする
//---------------------------------------------------------------------------
command $$user_control_disabled
{
	syscom.set_syscom_menu_disable			// システムコマンドを禁止する
	syscom.set_hide_mwnd_enable_flag(0)		// ウィンドウを消すを禁止する
	script.set_mouse_disp_off				// マウスカーソルを非表示にする
	script.set_msg_back_disable				// メッセージバックを禁止する
	script.set_shortcut_disable				// ショートカットを禁止する
	script.set_ctrl_skip_disable			// 早送りを禁止する
}

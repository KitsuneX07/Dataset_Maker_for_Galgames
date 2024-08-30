//===========================================================================
//!
//!    @file     _99debug.ss
//!    @brief    デバッグ機能群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     flixではエラーになると思うので、移植時にこのファイルは削除してください
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// デバッグキーボードショートカット(フレームアクション)
//-----------------------------------------------------------------
command $$debug_key_shortcut(property $fa : frameaction)
{
	if( system.check_debug_flag == 0 )
	{
		return
	}
	
	if( key['Q'].on_down )
	{
		// クィックセーブ
		capture
		syscom.quick_save(0, 0, 0)
		capture_free
	}
	elseif( key['W'].on_down )
	{
		// クィックロード
		syscom.quick_load(0, 0, 0, 0)
	}
	elseif( key['C'].on_down )
	{
		// ナビゲートの表示切り替え
		front.object[<OBJ_DEBUG_SC_KEY>].disp = $$reverse_flag(front.object[<OBJ_DEBUG_SC_KEY>].disp)
	}
	elseif( key['L'].on_down )
	{
		// ファイルログ出力
		$$filename_sort_log_list
		$$write_log_list
		@dm("work/__DEBUG_LOG/debug_log.txtにログを出力しました")
	}
}

//-----------------------------------------------------------------
// キーボートショートカットメッセージ表示
//-----------------------------------------------------------------
command $$show_debug_key_shortcut_msg
{
	if( system.check_debug_flag == 0 )
	{
		return
	}
	
	property $i
	property $str : strlist[6]
	
	front.object[<OBJ_DEBUG_SC_KEY>].init
	front.object[<OBJ_DEBUG_SC_KEY>].disp = 1
	front.object[<OBJ_DEBUG_SC_KEY>].order= 3
	front.object[<OBJ_DEBUG_SC_KEY>].wipe_copy = 1
	front.object[<OBJ_DEBUG_SC_KEY>].child.resize(6)
	
	$str[0] = "■デバッグモードのみ"
	$str[1] = "キーボードショートカット"
	$str[2] = "[Ｑ]：クイックセーブ"
	$str[3] = "[Ｗ]：クイックロード"
	$str[4] = "[Ｃ]：↑表示／非表示"
	$str[5] = "[Ｌ]：ファイルログの出力"
	
	for( $i = 0, $i < 6, $i += 1 )
	{
		front.object[<OBJ_DEBUG_SC_KEY>].child[$i].create_string($str[$i], 1, 1720, 10 + $i * 20)
		front.object[<OBJ_DEBUG_SC_KEY>].child[$i].set_string_param(15, 1, 5, 30, 0, 1, 2, 1)
	}
}

//-----------------------------------------------------------------
// デバッグ用メッセージ表示
//-----------------------------------------------------------------
command $$show_debug_msg(property $obj : object, property $msg : str, property $pos_x, property $pos_y, property $bg_red, property $bg_green, property $bg_blue)
{
	if( system.check_debug_flag == 0 )
	{
		return
	}
	
	property $moji_size
	property $moji_margin_x
	property $moji_margin_y
	property $moji_cnt_max
	property $rect_w
	property $rect_h
	
	$moji_size = 34
	$moji_margin_x = 5
	$moji_margin_y = 5
	$moji_cnt_max = 30
	if( $msg.cnt >= $moji_cnt_max ) {
		$rect_w = $moji_size * $moji_cnt_max + $moji_margin_x * 2
	} else {
		$rect_w = $moji_size * ($msg.cnt % $moji_cnt_max) + $moji_margin_x * 2
	}
	$rect_h = $moji_size * ($msg.cnt / $moji_cnt_max + 1) + $moji_margin_y * 2
	
	$obj.init
	$obj.disp = 1
	$obj.order= 3
	$obj.wipe_copy = 1
	$obj.set_pos($pos_x, $pos_y)
	$obj.child.resize(2)
	
	$obj.child[0].create_rect(0, 0, $rect_w, $rect_h, $bg_red, $bg_green, $bg_blue, 100, 1)
	
	$obj.child[1].create_string($msg, 1, $moji_margin_x, $moji_margin_y)
	$obj.child[1].set_string_param($moji_size, 0, 0, $moji_cnt_max, 0, 1, 2, 1)
	
	$obj.x_rep.resize(1)
	$obj.x_rep[0] = -100
	$obj.x_rep_eve[0].set_real(0, 500, 0, 2)
	$obj.tr_eve.set_real(0, 500, 10000, 0)
}

//---------------------------------------------------------------------------
// ログリストに文字列を追加する
//---------------------------------------------------------------------------
#inc_start
	
	#property $log_list : strlist
	
#inc_end

command $$add_log_list(property $str : str)
{
	if( system.check_debug_flag == 0 )
	{
		return
	}
	
	property $i
	
	for( $i = 0, $i < $log_list.get_size, $i += 1 )
	{
		if( $log_list[$i] == $str )
		{
			return
		}
	}
	
	$log_list.resize($log_list.get_size + 1)
	$log_list[$log_list.get_size - 1] = $str
}

//---------------------------------------------------------------------------
// ログリストを出力する
//---------------------------------------------------------------------------
command $$write_log_list
{
	if( system.check_debug_flag == 0 )
	{
		return
	}
	
	property $i
	
	for( $i = 0, $i < $log_list.get_size, $i += 1 )
	{
		@dw($log_list[$i])
	}
}

//---------------------------------------------------------------------------
// ログリストをファイル名でソートする
//---------------------------------------------------------------------------
command $$filename_sort_log_list
{
	property $i
	property $j
	property $len
	property $tmp : str
	
	$len = $log_list.get_size
	for( $i = 0, $i < $len - 1, $i += 1 )
	{
		for( $j = $len - 1, $j > $i, $j -= 1 )
		{
			if( $log_list[$j] < $log_list[$j - 1] )
			{
				$tmp = $log_list[$j]
				$log_list[$j] = $log_list[$j - 1]
				$log_list[$j - 1] = $tmp
			}
		}
	}
}


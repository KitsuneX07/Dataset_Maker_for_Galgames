//===========================================================================
//!
//!    @file     _99debug.inc
//!    @brief    デバッグ機能群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     flixではエラーになると思うので、移植時にこのファイルは削除してください
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
// オブジェクト番号
#replace	<OBJ_DEBUG_SC_KEY>			200
#replace	<OBJ_DEBUG_MSG1>			201
#replace	<OBJ_DEBUG_MSG2>			202

// フレームアクション番号
#replace	<DEBUG_FRAMEACTION_CH>		8


//===========================================================================
// マクロ
//===========================================================================
#macro	@デバッグキーボードショートカット開始
	if( system.check_debug_flag )
	{
		$$show_debug_key_shortcut_msg
		frame_action_ch[<DEBUG_FRAMEACTION_CH>].start(-1, "$$debug_key_shortcut")
	}

// デバッグ用メッセージ（背景色：黒）
#macro	@todo_disp(@msg)
	$$show_debug_msg(front.object[<OBJ_DEBUG_MSG1>], @msg, 40, 840, 0, 0, 0)

// デバッグ用メッセージ（背景色：黄）
#macro	@todo_disp2(@msg)
	$$show_debug_msg(front.object[<OBJ_DEBUG_MSG2>], @msg, 40, 940, 128, 128, 0)


//===========================================================================
// 関数
//===========================================================================
#command $$debug_key_shortcut(frameaction)			// デバッグキーボードショートカット(フレームアクション)

#command $$show_debug_key_shortcut_msg								// キーボートショートカットメッセージ表示
#command $$show_debug_msg(object, str, int, int, int, int, int)		// デバッグ用メッセージ表示

// ログ出力
#command $$add_log_list(str)								// ログリストに文字列を追加する
#command $$write_log_list									// ログリストを出力する
#command $$filename_sort_log_list							// ログリストをファイル名でソートする

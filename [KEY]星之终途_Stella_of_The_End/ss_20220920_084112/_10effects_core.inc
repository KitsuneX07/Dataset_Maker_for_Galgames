//===========================================================================
//!
//!    @file     _10effects_core.inc
//!    @brief    演出汎用関数群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     siglus寄りの関数群
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
#define		@dm							system.debug_messagebox_ok		// デバッグメッセージ表示
#define		@dw							system.debug_write_log			// デバッグログ出力


//===========================================================================
// 関数
//===========================================================================
// ファイル関連
#command $$is_exist_g00(str) : int							// g00ファイルの存在を判定する

// 数値関連
#command $$reverse_flag(int) : int							// フラグを反転する

// 文字列関連
#command $$zen_to_han(str) : str							// 半角から全角に変換する
#command $$get_text_centering_rep_x(str, int, int) : int	// 文字列をセンタリングする際のx補正座標

// 解像度座標補正
#command $$pos_convert_x(int) : int							// 解像度によるx座標補正
#command $$pos_convert_y(int) : int							// 解像度によるy座標補正

// オブジェクト関連
#command $$set_image_center(object)											// 読み込んだ画像の中心を補正座標にする
#command $$set_pos_center_from_image(object)								// 読み込んだ画像を元に画面中心に設定する
#command $$set_screen_scale(object)											// オブジェクトをウインドウサイズサイズに拡縮する
#command $$set_pos(object, int, int)										// オブジェクトに座標を設定する
#command $$set_pos_eve(object, int, int, int, int, int, int, int)			// オブジェクトに座標イベントを設定する
#command $$set_pos_rep(object, int, int, int)								// オブジェクトに補正座標を設定する
#command $$set_pos_rep_eve(object, int, int, int, int, int, int, int, int)	// オブジェクトに補正座標イベントを設定する
#command $$set_scale_eve(object, int, int, int, int, int)					// オブジェクトに拡縮イベントを設定する
#command $$set_scale_x_eve(object, int, int, int, int, int)					// オブジェクトに拡縮(x)イベントを設定する
#command $$set_scale_y_eve(object, int, int, int, int, int)					// オブジェクトに拡縮(y)イベントを設定する
#command $$set_tr_eve(object, int, int, int, int, int)						// オブジェクトに不透明度イベントを設定する
#command $$set_tr_rep_eve(object, int, int, int, int, int, int)				// オブジェクトに補正不透明度イベントを設定する
#command $$set_bright_eve(object, int, int, int, int, int)					// オブジェクトに明るさイベントを設定する
#command $$set_dark_eve(object, int, int, int, int, int)					// オブジェクトに暗さイベントを設定する
#command $$set_move_eve(object, int, int, int, int, int)					// オブジェクトにモノクロイベントを設定する
#command $$wait_omv_key(object)												// omvオブジェクトのムービー再生を待つ

// メッセージバック関連
#command $$add_msgback(int, int, str, str)					// メッセージバックに追加する

// メッセージウィンドウ関連
#command $$mwnd_btn_disp_on									// メッセージウィンドウボタンの表示をオンにする
#command $$mwnd_btn_disp_off								// メッセージウィンドウボタンの表示をオフにする

// ユーザー制御
#command $$user_control_enabled								// ユーザー制御を可能にする
#command $$user_control_disabled							// ユーザー制御を不可能にする

//===========================================================================
//!
//!    @file     _10effects_base.inc
//!    @brief    演出基礎関数群
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     基礎システム寄りの関数群
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================
#define		<DISP_BG>				($BG_FILE)		// 現在表示されているＣＧ
#define		<EFFECT_CUT>			(syscom.get_no_wipe_anime_onoff == 1)		// 演出オフ

#replace	<BUP_MOVE_REP>			2				// 立ち絵スライドイン／アウトに使用するrep番号


//===========================================================================
// 関数
//===========================================================================
// ファイル関連
#command $$check_bgfile(str) : int							// ファイル名が背景か判定する
#command $$check_cgfile(str) : int							// ファイル名がＣＧか判定する
#command $$check_div_cgfile(str) : int						// ファイル名が分割ＣＧか判定する
#command $$exist_div_cgfile(str) : int						// 分割ＣＧファイルが存在しているか判定する

// オブジェクト関連
#command $$create_effects_bg_object(object, str)			// 背景オブジェクトを作成する
#command $$create_effects_cg_object(object, str)			// ＣＧオブジェクトを作成する
#command $$create_effects_div_cg_object(int, str, int)		// 分割ＣＧオブジェクトを作成する（２倍サイズの画像を複数オブジェクトに分割）
#command $$create_effects_bup_object(object, str)			// バストアップオブジェクトを作成する

// 背景関連
#command $$on_bgfile_blur(str) : str						// 背景ファイル名にブラー拡張子をつける
#command $$off_bgfile_blur(str) : str						// 背景ファイル名からブラー拡張子をはずす

// 立ち絵関連
#command $$move_bup_x(str, int, int, int, int)				// 立ち絵のx座標を移動させる
#command $$move_bup_y(str, int, int, int, int)				// 立ち絵のy座標を移動させる

#command $$change_bup_face_only(str)						// バストアップの表情のみを変更する
#command $$add_bup_and_get_pos(str, int)					// バストアップ追加処理＆追加するバストアップの座標を取得する

// ワイプ関連
#command $$wipe_effects_base(int, int, int, int)			// 演出用基礎ワイプを実行する

// システム関連
#command $$system_page_init_effect(object)					// システムページ開始用エフェクト

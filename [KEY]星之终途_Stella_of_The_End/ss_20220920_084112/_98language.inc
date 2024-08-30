//===========================================================================
//!
//!    @file     _98language.inc
//!    @brief    言語設定
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     一部「___for_language.inc」に定義されているものを定義しています
//!
//===========================================================================

//===========================================================================
// 定義
//===========================================================================

//↓↓↓___for_language.inc
//#define		@check_lang			$check_language()
#define		@check_lang			$lang_jp

#define		$lang_jp			0	//日本語
#define		$lang_en			1	//英語
#define		$lang_ch			2	//?体中文
#define		$lang_de			3	//ドイツ語
#define		$lang_es			4	//スペイン語
#define		$lang_zhtw			5	//繁体中文
//↑↑↑___for_language.inc


#command $$get_chapter_title(int) : str				// チャプタータイトルを取得する

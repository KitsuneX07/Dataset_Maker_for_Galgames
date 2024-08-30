//===========================================================================
//!
//!    @file     _98language.ss
//!    @brief    言語設定
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     none
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// チャプタータイトルを取得する
//-----------------------------------------------------------------
command $$get_chapter_title(property $chapter_no) : str
{
	property $title : str
	
	switch( @check_lang ) {
		case($lang_jp)
			switch( $chapter_no ) {
				case(1)		$title = "遭遇と覚醒"
				case(2)		$title = "疑わしき依頼"
				case(3)		$title = "旅の始まり"
				case(4)		$title = "歪な機能"
				case(5)		$title = "認識不能な空間"
				case(6)		$title = "生き残るための教育"
				case(7)		$title = "フラッシュバック"
				case(8)		$title = "廃墟都市"
				case(9)		$title = "歓迎された侵入者"
				case(10)	$title = "生きる廃墟"
				case(11)	$title = "否定"
				case(12)	$title = "束の間の休息"
				case(13)	$title = "到着"
				case(14)	$title = "救難信号"
				case(15)	$title = "囚われの運び屋"
				case(16)	$title = "揺れ動く心"
				case(17)	$title = "対峙"
				case(18)	$title = "人類の選択"
				case(19)	$title = "本当の旅"
				case(20)	$title = "エピローグ"
			}
	}
	
	return ($title)
}

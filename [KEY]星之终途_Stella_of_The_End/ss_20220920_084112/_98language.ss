//===========================================================================
//!
//!    @file     _98language.ss
//!    @brief    ����ݒ�
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     none
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// �`���v�^�[�^�C�g�����擾����
//-----------------------------------------------------------------
command $$get_chapter_title(property $chapter_no) : str
{
	property $title : str
	
	switch( @check_lang ) {
		case($lang_jp)
			switch( $chapter_no ) {
				case(1)		$title = "�����Ɗo��"
				case(2)		$title = "�^�킵���˗�"
				case(3)		$title = "���̎n�܂�"
				case(4)		$title = "�c�ȋ@�\"
				case(5)		$title = "�F���s�\�ȋ��"
				case(6)		$title = "�����c�邽�߂̋���"
				case(7)		$title = "�t���b�V���o�b�N"
				case(8)		$title = "�p�Гs�s"
				case(9)		$title = "���}���ꂽ�N����"
				case(10)	$title = "������p��"
				case(11)	$title = "�ے�"
				case(12)	$title = "���̊Ԃ̋x��"
				case(13)	$title = "����"
				case(14)	$title = "�~��M��"
				case(15)	$title = "�����̉^�щ�"
				case(16)	$title = "�h�ꓮ���S"
				case(17)	$title = "�Λ�"
				case(18)	$title = "�l�ނ̑I��"
				case(19)	$title = "�{���̗�"
				case(20)	$title = "�G�s���[�O"
			}
	}
	
	return ($title)
}

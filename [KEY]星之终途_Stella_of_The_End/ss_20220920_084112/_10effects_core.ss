//===========================================================================
//!
//!    @file     _10effects_core.ss
//!    @brief    ���o�ėp�֐��Q
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     siglus���̊֐��Q
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// g00�̑��݂𔻒肷��
//-----------------------------------------------------------------
command $$is_exist_g00(property $filename : str) : int
{
	return (system.check_file_exist("g00\\" + $filename + ".g00"))
}

//---------------------------------------------------------------------------
// �t���O�𔽓]����
//---------------------------------------------------------------------------
command $$reverse_flag(property $flag) : int
{
	return (math.abs($flag - 1))
}

//---------------------------------------------------------------------------
// ���p����S�p�ɕϊ�����
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
// ��������Z���^�����O����ۂ�x�␳���W
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
// �𑜓x�ɂ��x���W�␳
//---------------------------------------------------------------------------
command $$pos_convert_x(property $x) : int
{
	return (((<SCREEN_WIDTH>  * 1000 / 1920) * $x) / 1000)
}

//---------------------------------------------------------------------------
// �𑜓x�ɂ��y���W�␳
//---------------------------------------------------------------------------
command $$pos_convert_y(property $y) : int
{
	return (((<SCREEN_HEIGHT> * 1000 / 1080) * $y) / 1000)
}

//---------------------------------------------------------------------------
// �ǂݍ��񂾉摜�̒��S��␳���W�ɂ���
//---------------------------------------------------------------------------
command $$set_image_center(property $obj : object)
{
	$obj.set_center_rep($obj.get_size_x / 2, $obj.get_size_y / 2)
}

//---------------------------------------------------------------------------
// �ǂݍ��񂾉摜�����ɉ�ʒ��S�ɐݒ肷��
//---------------------------------------------------------------------------
command $$set_pos_center_from_image(property $obj : object)
{
	$obj.set_pos(<SCREEN_CENTER_X> - $obj.get_size_x / 2, <SCREEN_CENTER_Y> - $obj.get_size_y / 2)
}

//---------------------------------------------------------------------------
// �I�u�W�F�N�g���E�C���h�E�T�C�Y�T�C�Y�Ɋg�k����
//---------------------------------------------------------------------------
command $$set_screen_scale(property $obj : object)
{
	$obj.set_scale(<SCREEN_WIDTH> * 1000 / $obj.get_size_x, <SCREEN_HEIGHT> * 1000 / $obj.get_size_y)
}

//-----------------------------------------------------------------
// �I�u�W�F�N�g�ɍ��W��ݒ肷��
//-----------------------------------------------------------------
command $$set_pos(property $obj : object, property $x, property $y)
{
	$obj.set_pos($$pos_convert_x($x), $$pos_convert_y($y))
}

//-----------------------------------------------------------------
// �I�u�W�F�N�g�ɍ��W�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�ɕ␳���W��ݒ肷��
//-----------------------------------------------------------------
command $$set_pos_rep(property $obj : object, property $rep_index, property $x, property $y)
{
	$obj.x_rep.resize($rep_index + 1)
	$obj.y_rep.resize($rep_index + 1)
	
	$obj.x_rep[$rep_index] = $$pos_convert_x($x)
	$obj.y_rep[$rep_index] = $$pos_convert_y($y)
}

//-----------------------------------------------------------------
// �I�u�W�F�N�g�ɕ␳���W�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�Ɋg�k�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�Ɋg�k(x)�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�Ɋg�k(y)�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�ɕs�����x�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�ɕ␳�s�����x�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�ɖ��邳�C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�ɈÂ��C�x���g��ݒ肷��
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
// �I�u�W�F�N�g�Ƀ��m�N���C�x���g��ݒ肷��
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
// omv�I�u�W�F�N�g�̃��[�r�[�Đ���҂�
//-----------------------------------------------------------------
command $$wait_omv_key(property $obj : object)
{
	if( script.check_skip == 0 ) {
		$obj.wait_movie_key
	}
}

//---------------------------------------------------------------------------
// ���b�Z�[�W�o�b�N�ɒǉ�����
//---------------------------------------------------------------------------
command $$add_msgback(property $koe_no, property $chara_no, property $name : str, property $msg : str)
{
	msgbk.go_next_msg			// ���b�Z�[�W���P�i�߂�
	
	if( $koe_no != -1 )
	{
		msgbk.add_koe($koe_no, $chara_no)	// ����ݒ�
	}
	
	if( $name != "" )
	{
		msgbk.add_namae($name)				// ���O��ݒ�
	}
	
	msgbk.add_msg($msg)			// ���b�Z�[�W��ݒ�
}

//---------------------------------------------------------------------------
// ���b�Z�[�W�E�B���h�E�{�^���̕\�����I���ɂ���
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
// ���b�Z�[�W�E�B���h�E�{�^���̕\�����I�t�ɂ���
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
// ���[�U�[������\�ɂ���
//---------------------------------------------------------------------------
command $$user_control_enabled
{
	syscom.set_syscom_menu_enable			// �V�X�e���R�}���h��������
	syscom.set_hide_mwnd_enable_flag(1)		// �E�B���h�E��������������
	script.set_mouse_disp_on				// �}�E�X�J�[�\����\������
	script.set_msg_back_enable				// ���b�Z�[�W�o�b�N��������
	script.set_shortcut_enable				// �V���[�g�J�b�g��������
	script.set_ctrl_skip_enable				// �������������
}

//---------------------------------------------------------------------------
// ���[�U�[�����s�\�ɂ���
//---------------------------------------------------------------------------
command $$user_control_disabled
{
	syscom.set_syscom_menu_disable			// �V�X�e���R�}���h���֎~����
	syscom.set_hide_mwnd_enable_flag(0)		// �E�B���h�E���������֎~����
	script.set_mouse_disp_off				// �}�E�X�J�[�\�����\���ɂ���
	script.set_msg_back_disable				// ���b�Z�[�W�o�b�N���֎~����
	script.set_shortcut_disable				// �V���[�g�J�b�g���֎~����
	script.set_ctrl_skip_disable			// ��������֎~����
}

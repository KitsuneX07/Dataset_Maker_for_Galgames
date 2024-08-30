//===========================================================================
//!
//!    @file     _10effects_base.ss
//!    @brief    ���o��b�֐��Q
//!
//!    @author   Copyright (C)2022- Visual Art's/Key. All rights reserved.
//!    @author   Kazuya Takahashi
//!    @note     ��b�V�X�e�����̊֐��Q
//!
//===========================================================================

#z00

//-----------------------------------------------------------------
// �t�@�C�������w�i�����肷��
//-----------------------------------------------------------------
command $$check_bgfile(property $filename : str) : int
{
	if( $filename.left(2) == "BG" ) {
		return (1)
	}
	
	return (0)
}

//-----------------------------------------------------------------
// �t�@�C�������b�f�����肷��
//-----------------------------------------------------------------
command $$check_cgfile(property $filename : str) : int
{
	if( $filename.left(2) == "CG" ) {
		return (1)
	}
	
	return (0)
}

//-----------------------------------------------------------------
// �t�@�C�����������b�f�����肷��
//-----------------------------------------------------------------
command $$check_div_cgfile(property $filename : str) : int
{
	if( $filename.right(2) == "EX" ) {
		return (1)
	}
	
	return (0)
}

//-----------------------------------------------------------------
// �t�@�C�����������b�f�����肷��
//-----------------------------------------------------------------
command $$exist_div_cgfile(property $filename : str) : int
{
	if( $$is_exist_g00($filename + "_EX") ) {
		return (1)
	}
	
	return (0)
}

//-----------------------------------------------------------------
// �w�i�I�u�W�F�N�g���쐬����
//-----------------------------------------------------------------
command $$create_effects_bg_object(property $obj : object, property $filename : str)
{
	/*
	if( system.check_debug_flag == 1 )
	{
		if( $$check_bgfile($$off_bgfile_blur($filename)) == 0 )
		{
			@dm("���x����\n'" + $filename + "'���w�i�t�@�C���ł͂���܂���B\n�w�i�R�}���h�ɂ͔w�i�t�@�C����ݒ肷��K�v������܂��B")
		}
	}
	*/
	
	$$wipe_copy_set(0)
	
	$BG_FILE = $filename
	
	$obj.init
	$obj.create($filename, 1)
	$obj.wipe_copy = 1
	
	$$set_image_center($obj)
}

//-----------------------------------------------------------------
// �b�f�I�u�W�F�N�g���쐬����
//-----------------------------------------------------------------
command $$create_effects_cg_object(property $obj : object, property $filename : str)
{
	/*
	if( system.check_debug_flag == 1 )
	{
		if( $$check_cgfile($filename) == 0 )
		{
			@dm("���x����\n'" + $filename + "'���b�f�t�@�C���ł͂���܂���B\n�b�f�R�}���h�ɂ͂b�f�t�@�C����ݒ肷��K�v������܂��B")
		}
	}
	*/
	
	$$wipe_copy_set(0)
	
	$obj.init
	$obj.create($filename, 1)
	
	$$set_image_center($obj)
}

//-----------------------------------------------------------------
// �b�f�I�u�W�F�N�g���쐬����i�Q�{�T�C�Y�̉摜�𕡐��I�u�W�F�N�g�ɕ����j
//-----------------------------------------------------------------
command $$create_effects_div_cg_object(property $obj_index, property $filename : str, property $scale)
{
	property $i
	property $size_x
	property $size_y
	property $rep_scale
	property $rep_x
	property $rep_y
	
	$rep_scale = $scale * 1000 / 2000
	
	for( $i = 0, $i < 4, $i += 1 )
	{
		back.object[$obj_index + $i].create($filename, 1)
		back.object[$obj_index + $i].set_scale($rep_scale, $rep_scale)
		
		if( $i == 0 )
		{
			$size_x = back.object[$obj_index + $i].get_size_x * $rep_scale / 1000
			$size_y = back.object[$obj_index + $i].get_size_y * $rep_scale / 1000
		}
		
		back.object[$obj_index + $i].patno = $i
		back.object[$obj_index + $i].x = $size_x * ($i % 2)
		back.object[$obj_index + $i].y = $size_y * ($i / 2)
		
		$rep_x = ($size_x * 2 - <SCREEN_WIDTH> ) / 2
		$rep_y = ($size_y * 2 - <SCREEN_HEIGHT>) / 2
		$$set_pos_rep(back.object[$obj_index + $i], 0, -$rep_x, -$rep_y)
	}
	
	if( system.check_debug_flag == 1 )
	{
		$$add_log_list($filename)
	}
}

//-----------------------------------------------------------------
// �o�X�g�A�b�v�I�u�W�F�N�g���쐬����
//-----------------------------------------------------------------
command $$create_effects_bup_object(property $obj : object, property $filename : str)
{
	$obj.init
	$obj.create($$system_bs_file($filename), 1, <SCREEN_CENTER_X>, <POS_Y>)
}

//-----------------------------------------------------------------
// �w�i�t�@�C�����Ƀu���[�g���q������
//-----------------------------------------------------------------
command $$on_bgfile_blur(property $filename : str) : str
{
	if( $filename.left(2) != "b_" )
	{
		$filename = "b_" + $filename
	}
	
	if( system.check_debug_flag == 1 )
	{
		$$add_log_list($filename)
	}
	
	return ($filename)
}

//-----------------------------------------------------------------
// �w�i�t�@�C��������u���[�g���q���͂���
//-----------------------------------------------------------------
command $$off_bgfile_blur(property $filename : str) : str
{
	if( $filename.left(2) == "b_" )
	{
		$filename = $filename.mid(2)
	}
	
	return ($filename)
}

//-----------------------------------------------------------------
// �����G��x���W���ړ�������
//-----------------------------------------------------------------
command $$move_bup_x(property $bup_name : str, property $src_x, property $dst_x, property $move_time, property $speed_mode)
{
	property $i
	property $obj_no
	
	$obj_no = $$chr2num($bup_name)
	
	// back, front�I�u�W�F�N�g�ɓK�p
	for( $i = 0, $i < 2, $i += 1 )
	{
		if( stage[$i].object[$obj_no].disp )
		{
			$$set_pos_rep_eve(stage[$i].object[$obj_no], <BUP_MOVE_REP>, $src_x, 0, $dst_x, 0, $move_time, 0, $speed_mode)
		}
	}
}

//-----------------------------------------------------------------
// �����G��y���W���ړ�������
//-----------------------------------------------------------------
command $$move_bup_y(property $bup_name : str, property $src_y, property $dst_y, property $move_time, property $speed_mode)
{
	property $i
	property $obj_no
	
	$obj_no = $$chr2num($bup_name)
	
	// back, front�I�u�W�F�N�g�ɓK�p
	for( $i = 0, $i < 2, $i += 1 )
	{
		if( stage[$i].object[$obj_no].disp )
		{
			$$set_pos_rep_eve(stage[$i].object[$obj_no], <BUP_MOVE_REP>, 0, $src_y, 0, $dst_y, $move_time, 0, $speed_mode)
		}
	}
}

//-----------------------------------------------------------------
// �o�X�g�A�b�v�̕\��݂̂�ύX����
//-----------------------------------------------------------------
command $$change_bup_face_only(property $bup_name : str)
{
	property $obj_no
	
	$obj_no = $$chr2num($bup_name)
	
	back.object[$obj_no].create_copy_from(front.object[$obj_no])
	back.object[$obj_no].change_file($$system_bs_file($bup_name))
}

//-----------------------------------------------------------------
// �o�X�g�A�b�v�ǉ��������ǉ�����o�X�g�A�b�v�̍��W���擾����
//-----------------------------------------------------------------
command $$add_bup_and_get_pos(property $bup_name : str, property $direction)
{
	property $i
	property $j
	property $len
	property $bup_list : intlist
	property $obj_no
	property $bup_pos
	property $tmp
	
	$obj_no = $$chr2num($bup_name)
	$bup_pos = <POS_C>
	
	// ���݂̗����L�����̐l���𒲂ׂ�
	for( $i = <BUP_MIN>, $i < <BUP_MAX>, $i += 1 )
	{
		if( front.object[$i].disp )
		{
			// �w�肵���L���������łɑ��݂��Ă���ꍇ�͏������Ȃ�
			if( $obj_no == $i )
			{
				@dm("���x����\n'" + $bup_name + "'�����łɗ����G�Ƃ��ĕ\������Ă��܂��B\n�����G�̒ǉ��\���������I�����܂��B")
				
				return
			}
			
			back.object[$i].create_copy_from(front.object[$i])
			
			$bup_list.resize($bup_list.get_size + 1)
			$bup_list[$bup_list.get_size - 1] = $i
		}
	}
	
	$len = $bup_list.get_size
	
	// �O�l�̏ꍇ�͏����I��
	if( $len <= 0 )
	{
		return ($bup_pos)
	}
	
	// �T�l�ȏ�̓T�|�[�g���Ȃ�
	if( $len >= 5 )
	{
		@dm("���x����\n'" + $bup_name + "'\n�����G���T�l�ȏ㗧���Ă���ꍇ�͏������܂���B\n�����G�̒ǉ��\���������I�����܂��B")
		
		return ($bup_pos)
	}
	
	// �����G���X�g����x���W�Ń\�[�g
	for( $i = 0, $i < $len - 1, $i += 1 )
	{
		for( $j = $len - 1, $j > $i, $j -= 1 )
		{
			if( front.object[$bup_list[$j]].x < front.object[$bup_list[$j - 1]].x )
			{
				$tmp = $bup_list[$j]
				$bup_list[$j] = $bup_list[$j - 1]
				$bup_list[$j - 1] = $tmp
			}
		}
	}
	
	// add L
	if( $direction )
	{
		switch( $len ) {
			case(1)
				$bup_pos = <POS_L>
				back.object[$bup_list[0]].x = <POS_R>
			case(2)
				$bup_pos = <POS_3L>
				back.object[$bup_list[0]].x = <POS_C>
				back.object[$bup_list[1]].x = <POS_3R>
			case(3)
				$bup_pos = <POS_4L>
				back.object[$bup_list[0]].x = <POS_4L_in>
				back.object[$bup_list[1]].x = <POS_4R_in>
				back.object[$bup_list[2]].x = <POS_4R>
			case(4)
				$bup_pos = <POS_5L>
				back.object[$bup_list[0]].x = <POS_5L_in>
				back.object[$bup_list[1]].x = <POS_C>
				back.object[$bup_list[2]].x = <POS_5R_in>
				back.object[$bup_list[3]].x = <POS_5R>
		}
	}
	// add R
	else
	{
		switch( $len ) {
			case(1)
				back.object[$bup_list[0]].x = <POS_L>
				$bup_pos = <POS_R>
			case(2)
				back.object[$bup_list[0]].x = <POS_3L>
				back.object[$bup_list[1]].x = <POS_C>
				$bup_pos = <POS_3R>
			case(3)
				back.object[$bup_list[0]].x = <POS_4L>
				back.object[$bup_list[1]].x = <POS_4L_in>
				back.object[$bup_list[2]].x = <POS_4R_in>
				$bup_pos = <POS_4R>
			case(4)
				back.object[$bup_list[0]].x = <POS_5L>
				back.object[$bup_list[1]].x = <POS_5L_in>
				back.object[$bup_list[2]].x = <POS_C>
				back.object[$bup_list[3]].x = <POS_5R_in>
				$bup_pos = <POS_5R>
		}
	}
	
	return ($bup_pos)
}

//-----------------------------------------------------------------
// ���o�p��b���C�v�����s����
//-----------------------------------------------------------------
command $$wipe_effects_base(property $wipe_no, property $wipe_mode, property $wipe_wait, property $wipe_time)
{
	if( $wipe_no == <SET> ) {
		return
	}
	
	$$wipe_prm_set($wipe_no, $wipe_mode, $wipe_time)
	$$WIPE_EXEC($wipe_wait)
	$$wipe_prm_clr
}

//-----------------------------------------------------------------
// �V�X�e���y�[�W�J�n�p�G�t�F�N�g
//-----------------------------------------------------------------
command $$system_page_init_effect(property $obj : object)
{
	$$wipe_prm_set(0, <WIPE_BG>, 50)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr
	
	$obj.create_movie(ef_noise3, 1, ready_only = 1)
	$obj.set_scale(2000, 2000)
	$obj.blend = 4
	$obj.layer = 1
	$obj.tr_eve.set(0, 500, 1000, 1)
	$obj.bright = 128
	$obj.bright_eve.set(0, 350, 0, 1)
	
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr
}
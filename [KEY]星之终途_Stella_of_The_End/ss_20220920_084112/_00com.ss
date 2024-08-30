#z00

//##��������������������������������������������������������
//�������P�̂O����R�}���h�@���̐��l�������Ă����Ƃ��͕������]
command $$toggle(property $a :int) : int
{
	if(($a==1)||($a==0)){	//�P���O�������Ă����ꍇ
		return(math.abs($a-1))		// �P�̂O �̌��ʂ�߂�l�Ƃ��đ��
	}else{					//����ȊO�������Ă����ꍇ
		return($a * -1)				//�����𔽓]���������ʂ�߂�l�Ƃ���
	}
}

//##��������������������������������������������������������
//�ő�l�E�ŏ��l���w�肵�āA���̒��ŃC���N�������g�𑱂���}�N��
//�ő�l���z����ƍŏ��l�Ƀ��[�v����
//���̃}�N�����Ăяo�������_�ŃC���N�������g����܂��B
//	�߂�l��$$loop_inc(�ŏ��l,�Ώۃt���O,�ő�l)
command	$$loop_inc(property $min : int, property $flag : int, property $max : int):int
{
	$flag+=1
	if(($flag > $max)||($flag < $min)){ $flag=$min }
	return($flag)	//�߂�l���n��
}

//##��������������������������������������������������������
//�ő�l�E�ŏ��l���w�肵�āA���̒��Ńf�N�������g�𑱂���}�N��
//�ŏ��l�������ƍő�l�Ƀ��[�v����B
//���̃}�N�������[�h�������_�Ńf�N�������g����܂��B
//  �߂�l��$$loop_dec(�ŏ��l,�Ώۃt���O,�ő�l)
command	$$loop_dec(property $min : int ,property $flag : int, property $max : int):int
{
	$flag-=1
	if(($flag < $min)||($flag > $max)){ $flag=$max }
	return($flag)	//�߂�l���n��
}


//##��������������������������������������������������������
//�w�肳�ꂽ�I�u�W�F�N�g�� �\���� �ŃR�s�[���邾���̃R�}���h
command $$objcopy(property $obj :int)
{
	back.object[$obj].create_copy_from(front.object[$obj])
}

//## *************************************************************
//## �V�X�e���R�[���̏����Ɖ���p�R�}���h
//## =============================================================
command $$excall_ready(property $w_close :int )	//�V�X�e���R�[������
{
	$excall = excall.check_alloc	//���d���R�[����Ԃ̎擾
	IF($excall==1){return}			//�����ɂd���R�[�����������甲��
	excall.alloc								// �V�X�e���R�[������������
	excall.f[0] = script.get_mwnd_disp_off_flag	// �u���b�Z�[�W�E�B���h�E�������v�̏�Ԃ��擾
	excall.f[1] = script.get_quake_stop_flag	// �u�N�G�C�N���~�߂�v�̏�Ԃ��擾
	script.set_mwnd_disp_off_flag($w_close)		// ���b�Z�[�W�E�B���h�E���������ǂ����@�P������
	script.set_quake_stop_flag(1)				// �N�G�C�N���~�߂�
	script.set_time_stop_flag(1)				// �S�Ă̓�����~�߂�
	return
}

command $$excall_free	//�V�X�e���R�[���J��
{
	$excall = excall.check_alloc	//���d���R�[����Ԃ̎擾
	IF($excall==0){return}			//�����ɂd���R�[�������ς������甲��
	script.set_quake_stop_flag(excall.f[1])		// �u�N�G�C�N���~�߂�v�̏�Ԃ����ɖ߂�
	script.set_mwnd_disp_off_flag(excall.f[0])	// �u���b�Z�[�W�E�B���h�E�������v�̏�Ԃ����ɖ߂�
	script.set_time_stop_flag(0)				// �S�Ă̓�����ĊJ����
	excall.free									// �V�X�e���R�[�����������
}

//##��������������������������������������������������������
//�o�X�g�A�b�v�Ƃ��Ďg�p���Ă��� [1]�`[<BUP_MAX>] �ɑ΂��Ĉꊇ�Ń��C�v�R�s�[�t���O���I���E�I�t����
command $$wipe_copy_set(property $wipe_copy_flag :int)
{
	FOR($tmp[00] = <BUP_MIN>, $tmp[00] <= <BUP_MAX> , $tmp[00]+=1){		//�L�����p�I�u�W�F�N�g�̗\��ԍ���<BUP_MIN>�`<BUP_MAX>
		front.object[$tmp[00]].wipe_copy = $wipe_copy_flag
	}
}

//��������������������������������������������������������
//##�w��I�u�W�F�N�g�̉��Ɏq�I�u�W�F�N�g���w�萔���R�}���h�B�e�͏����������B
command $$create_child(
	property $obj :object,		//�e�ƂȂ�I�u�W�F�N�g
	property $disp,				//�\�����
	property $cnt				//�q�̐�
)
{
		$obj.init				//�����q���I�u�W�F�N�g�\��J�n
		$obj.disp = $disp		//�\���w��
		$obj.child.resize($cnt)	//�q��萔�錾
}

//��������������������������������������������������������
command $$mw_btn_00
{
	farcall("_00cancel",01)
}

//��������������������������������������������������������
//�I�u�W�F�N�g�̏C�����W���w�x�����ɗ\�񂷂�R�}���h
command $$obj_rep_xy(
	property $obj :object,	//�ΏۃI�u�W�F�N�g
	property $x_cnt :int,	//�w�C�����W�̍쐬��
	property $y_cnt	:int	//�x�C�����W�̍쐬��
	)
{
	$obj.x_rep.resize($x_cnt)
	$obj.y_rep.resize($y_cnt)
}

//��������������������������������������������������������
command $$AUTO_SAVE(
	property $disp :int	//��Autosave���܂����@�̕\�L�̕\���E��\���B���g�p
)
{
	property $ctmp :intlist[10]
	$ctmp[00] = syscom.get_quick_save_new_no
	$ctmp[00] = $$loop_inc(1,$ctmp[00],8)
	capture					//##�Z�[�u�T���l�p�L���v�`��
	syscom.quick_save($ctmp[00] , 0, 0)	//���[�j���O�E�r�d�Ȃ��B
}

//��������������������������������������������������������
command $$CFG_CHR(property $CFG_CHR :int)		//�R���t�B�O�E�T�E���h�̃L�����ʉ����J���p
{
	if(<CFG_CHR> < $CFG_CHR){	//�w��l�ȉ��̂Ƃ��̒ʂ����ꍇ�̂ݎw��l�ɁB
		<CFG_CHR> = $CFG_CHR
	}
	return
}



//��������������������������������������������������������
//�_�C�A���O�{�b�N�X�쐬
//�E��ʂ̃I�u�W�F�N�g�ɍ쐬
//�E�ʏ�ŌĂяo���ꂽ��ʏ�ŁAEX��ŌĂ΂ꂽ��EX��ō쐬
//�E���C�v�͂������ɐe��TR�l�Ńt�F�[�h������B
//�E�p�[�c�͑S�Ďq���I�u�W�F�N�g�ō쐬
//�E�_�C�A���O�{�b�N�X�O�ō��N���b�N������L�����Z������

#inc_start
	
	#property	$DLG_ret	:int
	#define <DLG_obj> excall[excall.check_alloc].front.object[255]

#inc_end

//------------------------------------------------------------
#Z00
//	L[00] = $$dialog("�_�C�A���O�e�X�g",0)
//	system.debug_messagebox_ok(L[00])	//�f�o�b�O���b�Z�[�W
return

//��������������������������������������������������������
command $$dialog(
	property $mess :str,
	property $mode :int		//�Q�{�^���A�P�{�^���̐ؑ֗p
	):int
{
	property $DLG_mess :str
	property $DLG_mode :int
	property $ctmp :intlist[10]
	property $yes_btn :str

	$DLG_mess = $mess
	$ctmp[00] = $DLG_mess.len	//���������擾 ���p��1�@�S�p��2
	$ctmp[00] = $ctmp[00] * -8	//�S�p��32pix�Ƒz�肵�ĕ␳���W�l�����߂�B
	$DLG_mode = $mode

	switch(syscom.get_no_wipe_anime_onoff){	//�Ó]���ʂ̃I���I�t���f
		case(00) $ctmp[02] = 200
		case(01) $ctmp[02] = 0
	}

	switch($DLG_mode){	//�{�^�����[�h�ؑ�
		case(00) $yes_btn = "_DLG_yes"	$ctmp[01] = 1	//�x�d�r�^�m�n
		case(01) $yes_btn = "_DLG_ok"	$ctmp[01] = 0	//�n�j
	}

	<DLG_obj>.child.resize(8)
	<DLG_obj>.tr = 000
	<DLG_obj>.disp = 1
	<DLG_obj>.order = 2
	<DLG_obj>.child[00].create("_DLG_under",1,000,000)			//00	���n�t�B���^
	<DLG_obj>.child[01].create("_DLG_base",1,000,000,$DLG_mode)	//01	�_�C�A���O�x�[�X
	<DLG_obj>.child[02].create($yes_btn,1,000,000)				//02	YES or OK
	<DLG_obj>.child[03].create("_DLG_no",$ctmp[01],000,000)		//03	NO
//	<DLG_obj>.child[04].create("_DLG_chk",1,000,000)			//04	�`�F�b�N�{�b�N�X
	<DLG_obj>.child[05].create_string("", 1,960,598)			//05	�`�F�b�N�{�b�N�X������
	<DLG_obj>.child[06].create_string("", 1,960,464)			//06	�_�C�A���O���b�Z�[�W�P
	<DLG_obj>.child[07].create_string("", 1,960,464)			//07	�_�C�A���O���b�Z�[�W�Q�i�����ꍇ�Ɏg�p�j
	//------------------------------------------------------------
	<DLG_obj>.child[00].set_button(-1,<SEL4>, 4, 0)		//���n�i�L�����Z�������j
	<DLG_obj>.child[02].set_button(01,<SEL4>, 1, 0)		//Yes_OK
	<DLG_obj>.child[03].set_button(-1,<SEL4>, 1, 0)		//No

	//���b�Z�[�W�\������
	<DLG_obj>.child[06].x_rep.resize(1) <DLG_obj>.child[06].x_rep[0] = $ctmp[00]
	<DLG_obj>.child[07].x_rep.resize(1)
	<DLG_obj>.child[06].set_string_param(32, 00, 00, 00, 000, 001, 0)
	<DLG_obj>.child[06].set_string($DLG_mess)

	//�_�C�A���O�\��
	<DLG_obj>.tr_eve.set(255,$ctmp[02],0,2)
	<DLG_obj>.tr_eve.wait

	//------------------------------------------------------------
	while(1){	//�I�����[�v
		excall[excall.check_alloc].front.objbtngroup[<SEL4>].init
		$DLG_ret = excall[excall.check_alloc].front.objbtngroup[<SEL4>].sel_cancel
		switch($DLG_ret){
			case(-1)	$DLG_ret = 0 break	//�E�N�� or �m�n�@�߂�l�̐��`
			case(01)	break				//�x�d�r or �n�j
			case(02)	//�`�F�b�N�{�b�N�X
		}
		input.next
	}
	<DLG_obj>.child[02].tr_eve.wait	//�{�^�������҂�
	<DLG_obj>.child[03].tr_eve.wait	

	<DLG_obj>.tr_eve.set(000,$ctmp[02],0,0)	//�_�C�A���O����
	<DLG_obj>.tr_eve.wait
	<DLG_obj>.init
	return($DLG_ret)	//�߂�l�� 0/1
}

//��������������������������������������������������������
//�������̓{�b�N�X�i�Z�[�u�f�[�^�R�����g���͗p�j
command $$comment_box(
	property $str_max :int
	):str
{
	property $ctmp :intlist[10]
	property $sctmp :strlist[10]
//���͗p�E�B���h�E�p��
//�{�^�����胋�[�v
//�g�p�s�����`�F�b�N�i�I�u�W�F�N�g������p�R�[�h�j
//�����񐮌`

	return($sctmp[00])
}



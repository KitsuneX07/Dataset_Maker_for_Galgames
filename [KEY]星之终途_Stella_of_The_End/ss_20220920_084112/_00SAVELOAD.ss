#inc_start

	#property	$SL_swap_mode	:int

	#property	$SL_head	:str

	#property	$SL_base	:str
	#property	$SL_comment	:str
	#property	$SL_data	:str
	#property	$SL_del		:str
	#property	$SL_lock	:str
	#property	$SL_nodata	:str
	#property	$SL_now		:str
	#property	$SL_num		:str
	#property	$SL_num2	:str
	#property	$SL_swap	:str

	#property	$page_chk :intlist[23]	//���݂̃y�[�W�ɂP������z��

	#DEFINE		<C_OBJ>[		excall.stage[	//�g�p�I�u�W�F�N�g�̒Z�k�w��

#inc_end
//��������������������������������������������������������
#Z00	//�Z�[�u��------------------------------------------------------------
	capture					//##�Z�[�u�T���l�p�L���v�`��
	capture_for_tweet		//##�c�C�[�g�p�L���v�`��
	syscom.set_syscom_menu_disable	//�V�X�e�����j���[�֎~
	syscom.set_mwnd_btn_disable		//���b�Z�[�W�E�B���h�E�{�^�����g�p�s��
	$$excall_ready(0)

	<SL_mode> = 0	//SAVE-LOAD ���[�h����
	gosub #Z10	//���C�����[�`��

	$$excall_free
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//���b�Z�[�W�E�B���h�E�{�^�����g�p��
	syscom.set_syscom_menu_enable	//�E�N������
	capture_free_for_tweet	//##�c�C�[�g�p�L���v�`�����
	capture_free			//##�Z�[�u�T���l�p�L���v�`�����
	return

#Z01	//���[�h��------------------------------------------------------------
	capture					//##�Z�[�u�T���l�p�L���v�`��
	capture_for_tweet		//##�c�C�[�g�p�L���v�`��
	syscom.set_syscom_menu_disable	//�V�X�e�����j���[�֎~
	syscom.set_mwnd_btn_disable		//���b�Z�[�W�E�B���h�E�{�^�����g�p�s��
	$$excall_ready(0)

	<SL_mode> = 1	//SAVE-LOAD ���[�h����
	gosub #Z10	//���C�����[�`��

	$$excall_free
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//���b�Z�[�W�E�B���h�E�{�^�����g�p��
	syscom.set_syscom_menu_enable	//�E�N������
	capture_free_for_tweet	//##�c�C�[�g�p�L���v�`�����
	capture_free			//##�Z�[�u�T���l�p�L���v�`�����
	return


//��������������������������������������������������������
#Z10	//���C�����[�`��

while(1){

	if(<SL_mode> == 0){	//�Z�[�u
		$SL_base	="_save_base"
		$SL_comment	="_save_comment"
		$SL_data	="_save_data"
		$SL_del		="_save_del"
		$SL_lock	="_save_lock"
		$SL_nodata	="_save_nodata"
		$SL_now		="_save_now"
		$SL_num		="_save_num"
		$SL_num2	="_save_num2"
		$SL_swap	="_save_swap"
	}else{				//���[�h
		$SL_base	="_loas_base"
		$SL_comment	="_load_comment"
		$SL_data	="_load_data"
		$SL_del		="_load_del"
		$SL_lock	="_load_lock"
		$SL_nodata	="_load_nodata"
		$SL_now		="_load_now"
		$SL_num		="_load_num"
		$SL_num2	="_load_num2"
		$SL_swap	="_load_swap"
	}
	$stage=0
	<C_OBJ>[$stage].object[00].create($SL_base ,1)
	if(<SL_PAGE>==0){<SL_PAGE> = 1}		//�ŏ����̃y�[�W���𐮌`
	$$OBJBTN_SET(<C_OBJ>[$stage].object[03],	"_common_save"		,1, 000,000,255,<SEL0>,03,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[04],	"_common_load"		,1, 000,000,255,<SEL0>,04,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[05],	"_common_config"	,1, 000,000,255,<SEL0>,05,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[06],	"_common_title"		,1, 000,000,255,<SEL0>,06,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[07],	"_common_quit"		,1, 000,000,255,<SEL0>,07,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[08],	"_common_back"		,1, 000,000,255,<SEL0>,08,1,1,0,0,0)
	IF(<SL_mode> ==0 ){	<C_OBJ>[$stage].object[03].set_button_state_select	}
	IF(<SL_mode> ==1 ){	<C_OBJ>[$stage].object[04].set_button_state_select	}
	IF(<PURORO> ==0 ){	<C_OBJ>[$stage].object[06].set_button_state_disable	}	//�v�����[�O�������̓^�C�g���ɔ�ׂȂ�
	IF(check_savepoint == 0 ){ <C_OBJ>[$stage].object[03].set_button_state_disable	}	//�Z�[�u�|�C���g�����ĂȂ�������Z�[�u�y�[�W�ɍs�����Ȃ��B

	$page_chk.init
	$page_chk[<SL_PAGE>] = 1
	<C_OBJ>[$stage].object[09].create($SL_now ,1,708 + ((<SL_PAGE> -1 ) * 52 ) ,026)	//���݃y�[�W�̕\��
	$$OBJBTN_SET(<C_OBJ>[$stage].object[10],	_SL_NEW		,1, 000,000,255,<SEL0>,100,1,1,0,0,0)	//�m�d�v
	$$OBJBTN_SET(<C_OBJ>[$stage].object[11],	_SL_p01		,1, 000,000,255,<SEL0>,101,1,1,0,$page_chk[01],0)	
	$$OBJBTN_SET(<C_OBJ>[$stage].object[12],	_SL_p02		,1, 000,000,255,<SEL0>,102,1,1,0,$page_chk[02],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[13],	_SL_p03		,1, 000,000,255,<SEL0>,103,1,1,0,$page_chk[03],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[14],	_SL_p04		,1, 000,000,255,<SEL0>,104,1,1,0,$page_chk[04],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[15],	_SL_p05		,1, 000,000,255,<SEL0>,105,1,1,0,$page_chk[05],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[16],	_SL_p06		,1, 000,000,255,<SEL0>,106,1,1,0,$page_chk[06],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[17],	_SL_p07		,1, 000,000,255,<SEL0>,107,1,1,0,$page_chk[07],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[18],	_SL_p08		,1, 000,000,255,<SEL0>,108,1,1,0,$page_chk[08],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[19],	_SL_p09		,1, 000,000,255,<SEL0>,109,1,1,0,$page_chk[09],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[20],	_SL_p10		,1, 000,000,255,<SEL0>,110,1,1,0,$page_chk[10],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[21],	_SL_p11		,1, 000,000,255,<SEL0>,111,1,1,0,$page_chk[11],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[22],	_SL_p12		,1, 000,000,255,<SEL0>,112,1,1,0,$page_chk[12],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[23],	_SL_p13		,1, 000,000,255,<SEL0>,113,1,1,0,$page_chk[13],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[24],	_SL_p14		,1, 000,000,255,<SEL0>,114,1,1,0,$page_chk[14],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[25],	_SL_p15		,1, 000,000,255,<SEL0>,115,1,1,0,$page_chk[15],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[26],	_SL_p16		,1, 000,000,255,<SEL0>,116,1,1,0,$page_chk[16],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[27],	_SL_p17		,1, 000,000,255,<SEL0>,117,1,1,0,$page_chk[17],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[28],	_SL_p18		,1, 000,000,255,<SEL0>,118,1,1,0,$page_chk[18],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[29],	_SL_p19		,1, 000,000,255,<SEL0>,119,1,1,0,$page_chk[19],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[30],	_SL_p20		,1, 000,000,255,<SEL0>,120,1,1,0,$page_chk[20],0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[31],	_SL_p_A		,1, 000,000,255,<SEL0>,121,1,1,0,$page_chk[21],0)
//	$$OBJBTN_SET(<C_OBJ>[$stage].object[32],	_SL_p_q		,1, 000,000,255,<SEL0>,122,1,1,0,$page_chk[22],0)
	if(syscom.get_save_new_no == -1){<C_OBJ>[$stage].object[10].set_button_state_disable}	//�Z�[�u�f�[�^����������NEW����
	
	//�T���l�C���f�[�^�\�z
	if(<SL_PAGE> != 21){	//�I�[�g�Z�[�u�ȊO
		$$th_load(01,0187,0144)	$$th_load(02,0580,0144)	$$th_load(03,0973,0144)	$$th_load(04,1366,0144)
		$$th_load(05,0187,0563)	$$th_load(06,0580,0563)	$$th_load(07,0973,0563)	$$th_load(08,1366,0563)
	}else{
		$$th_load_A(01,0187,0144)	$$th_load_A(02,0580,0144)	$$th_load_A(03,0973,0144)	$$th_load_A(04,1366,0144)
		$$th_load_A(05,0187,0563)	$$th_load_A(06,0580,0563)	$$th_load_A(07,0973,0563)	$$th_load_A(08,1366,0563)
	}
	
	//���C�v
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr
	
	$stage = 1

	//�{�^������J�n

//#sel_loop
//���s����	------------------------------------------------------------
	<C_OBJ>[$stage].objbtngroup[0].init
	$tmp[00] = <C_OBJ>[$stage].objbtngroup[0].sel_cancel

	switch($tmp[00]){
		case(-1) se.play(02) break				//�E�N���b�N����
		case(003)	<SL_mode> = 00				//�r�`�u�d
		case(004)	<SL_mode> = 01				//�k�n�`�c
		case(005)	farcall("_00config",10)	break	//�b�n�m�e�h�f
		case(006)	//syscom.return_to_menu(0,0,1)	//�s�h�s�k�d
		case(007)	//break							//�p�t�h�s
		case(008)	se.play(02) break			//�a�`�b�j
		case(100)	<SL_PAGE> = ((syscom.get_save_new_no -1) / 8) +1	//�f�o�b�O���b�Z�[�W	//�m�d�v�{�^��
		default		
	}

	//�^�C�g���ɖ߂�
	if($tmp[00] == 006){
		$tmp[02] = $$dialog("�^�C�g���ɖ߂�܂����H",0)
		if($tmp[02] == 1){	//
			syscom.return_to_menu(0,0,1)
			se.play(001)
		}
	}
	//�Q�[���I��
	if($tmp[00] == 007){
		$tmp[02] = $$dialog("�Q�[�����I�����܂����H",0)
		if($tmp[02] == 1){	//
			syscom.end_game(0,0,1)
		}
	}

	//�y�[�W�{�^���N���b�N
	if(($tmp[00] >= 101)&&($tmp[00] <= 121)){	//�y�[�W�؂�ւ�
		<SL_PAGE> = $tmp[00] - 100
	}
	//�T���l�C���N���b�N
	if(($tmp[00] >= 201)&&($tmp[00] <= 208)){	
		if(<SL_mode>==0){
			$$save_exec($tmp[00] - 200 ) 
		}else{
			$tmp[02] = 00
			if(<SL_PAGE> == 21 ){$tmp[02] = 1}	//�I�[�g�Z�[�u�p�␳�l
			syscom.load( (((<SL_PAGE> -1) * 8) + ($tmp[00] - 200)) + $tmp[02] , 0, 0,1) 
		}
	}
	//�R�����g�{�^��
	if(($tmp[00] >= 211)&&($tmp[00] <= 218)){

	}
	//���b�N�{�^��
	if(($tmp[00] >= 221)&&($tmp[00] <= 228)){
		$$save_rock_toggle( ($tmp[00] - 220) )
	}
	//�X���b�v�{�^��
	if(($tmp[00] >= 231)&&($tmp[00] <= 238)){
		//##�_�C�A���O�\���e�X�g
//			L[00] = $$dialog("�_�C�A���O�e�X�g",0)
//			system.debug_messagebox_ok(L[00])	//�f�o�b�O���b�Z�[�W
	}
	//�폜�{�^��
	if(($tmp[00] >= 241)&&($tmp[00] <= 248)){
		$$del_exec($tmp[00] - 240 )
	}
}
return


//�T���l�C���\�z�p
command $$th_load(
	property $th_no :int,
	property $th_x :int,
	property $th_y :int
	){	

	property $obj_no :int
	property $save_no :int
	property $save_date :int

	property $ctmp :intlist[10]		//�ėp�ϐ�
	property $sctmp :strlist[10]	//�ėp������ϐ�
	property $save_comment :str
	property $save_title :str
	property $save_mess :str

	property $save_lock :intlist[1]	//�Z�[�u�ėp�t���O��0�����b�N��ԃt���O�Ƃ��Ďg�p�B

	$obj_no = 40 + $th_no

	$save_no = ((<SL_PAGE> -1) * 8) + $th_no	//�Z�[�u�ԍ��擾

	//�Z�[�u�f�[�^���[�@����Ƃ��[
	if(syscom.get_save_exist($save_no)==1){

		$save_comment = syscom.get_save_comment($save_no)	//�R�����g
		$save_title = syscom.get_save_title($save_no)		//�^�C�g��
		$save_mess = syscom.get_save_message($save_no)		//���b�Z�[�W

		syscom.get_save_value($save_no, $save_lock, 0, 1)	// �Z�[�u�f�[�^�̃t���O���擾����

		<C_OBJ>[$stage].object[$obj_no].init
		<C_OBJ>[$stage].object[$obj_no].create($SL_data,1, $th_x,$th_y)
		<C_OBJ>[$stage].object[$obj_no].child.resize(15)

		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[00],$SL_num, 25, 16,$save_no,3,1,0,0)	//�f�[�^�ԍ�

		<C_OBJ>[$stage].object[$obj_no].child[01].create_save_thumb($save_no, 1, 15, 44)	//�T���l�C��
		<C_OBJ>[$stage].object[$obj_no].child[01].set_button(200 + $th_no, 0, 0, -1)

		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[02],$SL_num2,141, 14,syscom.get_save_year($save_no),4,1,0,0)	//�Z�[�u���t�E�N
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[03],$SL_num2,206, 14,syscom.get_save_month($save_no),2,1,0,0)	//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[04],$SL_num2,244, 14,syscom.get_save_day($save_no),2,1,0,0)		//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[13],$SL_num2,281, 14,syscom.get_save_hour($save_no),2,1,0,0)	//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[14],$SL_num2,316, 14,syscom.get_save_minute($save_no),2,1,0,0)	//�Z�[�u���t�E��

//		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[05],	$SL_comment,1, 026,308,255,0,210 + $th_no,1,-1,0,0,1)	//�R�����g���n
		//�R�����g���e
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[07],	$SL_lock,1, 026,348,255,0,220 + $th_no,1,-1,0,0,1)	//���b�N�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[08],	$SL_swap,1, 133,348,255,0,230 + $th_no,1,-1,0,0,1)	//�X���b�v�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[09],	$SL_del ,1, 240,348,255,0,240 + $th_no,1,-1,0,0,1)	//�c�d�k�{�^��
		if($save_no == syscom.get_save_new_no){	<C_OBJ>[$stage].object[$obj_no].child[10].create("_SL_th_new",1,15,44)}	//�m�d�v�}�[�N

		//�R�����g���n�g�X���b�v����U�g�p�s��
//		<C_OBJ>[$stage].object[$obj_no].child[05].set_button_state_disable
		<C_OBJ>[$stage].object[$obj_no].child[08].set_button_state_disable
		<C_OBJ>[$stage].object[$obj_no].child[08].disp=0

		//�̓^�C�g��-------------
		$sctmp[01] = syscom.get_save_title($save_no)
		$ctmp[00] = $sctmp[01].len
		$ctmp[00] = ($ctmp[00] * 10 ) / 2 
		$$obj_txt(<C_OBJ>[$stage].object[$obj_no].child[11],$sctmp[01],183 - $ctmp[00] ,239)

		//���b�Z�[�W���e-------------
		$sctmp[01] = syscom.get_save_message($save_no)
		if($sctmp[01].cnt >= 16 ){	//16�����ȏ�̂Ƃ��́c�ŏȗ�
			$sctmp[01] = $sctmp[01].left(15) 
			$sctmp[01] = $sctmp[01] + "�c"
		}
		// �G�����̂Ƃ� k-takahashi
		if( $sctmp[01].mid(1, 1) == "��") {
			$sctmp[01] = syscom.get_save_message($save_no)
			if($sctmp[01].cnt >= 34 ){
				$sctmp[01] = $sctmp[01].left(34) 
				$sctmp[01] = $sctmp[01] + "�c"
			}
		}
		$$obj_txt(<C_OBJ>[$stage].object[$obj_no].child[12],$sctmp[01],020,277)
	
		<C_OBJ>[$stage].object[$obj_no].child[07].patno = $save_lock[0] * 10	//���b�N��ԃZ�b�g

	}else{	//�Z�[�u�f�[�^���[�@�Ȃ��Ƃ��[
		<C_OBJ>[$stage].object[$obj_no].init
		<C_OBJ>[$stage].object[$obj_no].create($SL_data,1, $th_x,$th_y)
		<C_OBJ>[$stage].object[$obj_no].child.resize(13)
	
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[00],$SL_num, 25, 16,$save_no,3,1,0,0)	//�f�[�^�ԍ�

		<C_OBJ>[$stage].object[$obj_no].child[01].create("_SL_th_nodata", 1, 000, 000)	//�T���l�C��
		IF(<SL_mode>==0){<C_OBJ>[$stage].object[$obj_no].child[01].set_button(200 + $th_no, 0, 0, -1)}	//�Z�[�u���̂݃{�^����

		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[07],	$SL_lock,1, 026,348,255,0,220 + $th_no,1,-1,0,2,1)	//���b�N�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[08],	$SL_swap,1, 133,348,255,0,230 + $th_no,1,-1,0,2,1)	//�X���b�v�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[09],	$SL_del ,1, 240,348,255,0,240 + $th_no,1,-1,0,2,1)	//�c�d�k�{�^��
		<C_OBJ>[$stage].object[$obj_no].child[08].disp=0

	}
	return
}

//�I�[�g�Z�[�u�y�[�W�@�T���l�C���\�z�p
command $$th_load_A(
	property $th_no :int,
	property $th_x :int,
	property $th_y :int
	){	

	property $obj_no :int
	property $save_no :int
	property $save_date :int

	property $ctmp :intlist[10]		//�ėp�ϐ�
	property $sctmp :strlist[10]	//�ėp������ϐ�
	property $save_comment :str
	property $save_title :str
	property $save_mess :str

	property $save_lock :intlist[1]	//�Z�[�u�ėp�t���O��0�����b�N��ԃt���O�Ƃ��Ďg�p�B

	switch(<SL_mode>){	//�u�`�v
		case(00)	$sctmp[00] = "_save_A"
		case(01)	$sctmp[00] = "_load_A"
	}
	$obj_no = 40 + $th_no
	$save_no = $th_no	//�Z�[�u�ԍ��擾
	//�Z�[�u�f�[�^���[�@����Ƃ��[
	if(syscom.get_quick_save_exist($save_no)==1){

		$save_comment = syscom.get_quick_save_comment($save_no)	//�R�����g
		$save_title = syscom.get_quick_save_title($save_no)		//�^�C�g��
		$save_mess = syscom.get_quick_save_message($save_no)		//���b�Z�[�W

		syscom.get_quick_save_value($save_no, $save_lock, 0, 1)	// �Z�[�u�f�[�^�̃t���O���擾����

		<C_OBJ>[$stage].object[$obj_no].init
		<C_OBJ>[$stage].object[$obj_no].create($SL_data,1, $th_x,$th_y)
		<C_OBJ>[$stage].object[$obj_no].child.resize(15)

		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[00],$SL_num, 25+15, 16,$save_no,2,1,0,0)	//�f�[�^�ԍ�

//		<C_OBJ>[$stage].object[$obj_no].child[01].create_save_thumb($save_no + 161 , 1, 15, 44)	//�T���l�C��
		$sctmp[02] = "_ASth_" + math.tostr_zero($$savetitle2no($save_title),2)
		<C_OBJ>[$stage].object[$obj_no].child[01].create($sctmp[02],1,15,44)
		<C_OBJ>[$stage].object[$obj_no].child[01].set_button(200 + $th_no, 0, 0, -1)

		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[02],$SL_num2,141, 14,syscom.get_quick_save_year($save_no),4,1,0,0)		//�Z�[�u���t�E�N
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[03],$SL_num2,206, 14,syscom.get_quick_save_month($save_no),2,1,0,0)		//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[04],$SL_num2,244, 14,syscom.get_quick_save_day($save_no),2,1,0,0)		//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[13],$SL_num2,281, 14,syscom.get_quick_save_hour($save_no),2,1,0,0)		//�Z�[�u���t�E��
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[14],$SL_num2,316, 14,syscom.get_quick_save_minute($save_no),2,1,0,0)	//�Z�[�u���t�E��

		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[07],	$SL_lock,1, 026,348,255,0,220 + $th_no,1,-1,0,2,1)	//���b�N�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[08],	$SL_swap,1, 133,348,255,0,230 + $th_no,1,-1,0,2,1)	//�X���b�v�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[09],	$SL_del ,1, 240,348,255,0,240 + $th_no,1,-1,0,2,1)	//�c�d�k�{�^��
		<C_OBJ>[$stage].object[$obj_no].child[08].disp=0

		//�̓^�C�g��-------------
		$sctmp[01] =  $save_title	//syscom.get_save_title($save_no)
		$ctmp[00] = $sctmp[01].len
		$ctmp[00] = ($ctmp[00] * 10 ) / 2 
		$$obj_txt(<C_OBJ>[$stage].object[$obj_no].child[11],$sctmp[01],183 - $ctmp[00] ,239)

		//���b�Z�[�W���e-------------
		$sctmp[01] = syscom.get_save_message($save_no)
		if($sctmp[01].cnt >= 16 ){	//16�����ȏ�̂Ƃ��́c�ŏȗ�
			$sctmp[01] = $sctmp[01].left(15) 
			$sctmp[01] = $sctmp[01] + "�c"
		}
		$$obj_txt(<C_OBJ>[$stage].object[$obj_no].child[12],$sctmp[01],020,277)

		<C_OBJ>[$stage].object[$obj_no].child[12].create( $sctmp[00],1,000,000)	//�Z�[�u�ԍ��̓��̂`
		
		if($save_no == syscom.get_quick_save_new_no){	<C_OBJ>[$stage].object[$obj_no].child[10].create("_SL_th_new",1,15,44)}	//�m�d�v�}�[�N
		<C_OBJ>[$stage].object[$obj_no].child[07].patno = $save_lock[0] * 10	//���b�N��ԃZ�b�g

	}else{	//�Z�[�u�f�[�^���[�@�Ȃ��Ƃ��[
		<C_OBJ>[$stage].object[$obj_no].init
		<C_OBJ>[$stage].object[$obj_no].create($SL_data,1, $th_x,$th_y)
		<C_OBJ>[$stage].object[$obj_no].child.resize(13)
	
		$$obj_num_set(<C_OBJ>[$stage].object[$obj_no].child[00],$SL_num, 25+15, 16,$save_no,2,1,0,0)	//�f�[�^�ԍ�

		<C_OBJ>[$stage].object[$obj_no].child[01].create("_SL_th_nodata", 1, 000, 000)	//�T���l�C��
		IF(<SL_mode>==0){<C_OBJ>[$stage].object[$obj_no].child[01].set_button(200 + $th_no, 0, 0, -1)}	//�Z�[�u���̂݃{�^����

		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[07],	$SL_lock,1, 026,348,255,0,220 + $th_no,1,-1,0,2,1)	//���b�N�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[08],	$SL_swap,1, 133,348,255,0,230 + $th_no,1,-1,0,2,1)	//�X���b�v�{�^��
		$$OBJBTN_SET(<C_OBJ>[$stage].object[$obj_no].child[09],	$SL_del ,1, 240,348,255,0,240 + $th_no,1,-1,0,2,1)	//�c�d�k�{�^��
		<C_OBJ>[$stage].object[$obj_no].child[08].disp=0

		<C_OBJ>[$stage].object[$obj_no].child[12].create( $sctmp[00],1,000,000)	//�Z�[�u�ԍ��̓��̂`
	}
	return
}

//��������������������������������������������������������
command $$obj_num_set(	//���l�I�u�W�F�N�g�̍쐬���P�s�ōς܂���
	property	$obj	:object,
	property	$file	:str,
	property	$x_pos	:int,
	property	$y_pos	:int,
	property	$num	:int,
	property	$keta	:int,
	property	$zero_mode		:int,
	property	$x_offset_mode	:int,
	property	$x_offset		:int
){
	$obj.create_number($file, 1, $x_pos, $y_pos)
	$obj.set_number($num)
	$obj.set_number_param($keta,$zero_mode, 0, 0, $x_offset_mode, $x_offset)
	return
}

//��������������������������������������������������������
command $$save_rock_toggle( property $data_no:int){	//���b�N�{�^��
	property $ctmp :intlist[10]
	property $save_lock :intlist[1]							//�Z�[�u�ėp�t���O��0�����b�N��ԃt���O�Ƃ��Ďg�p�B
	$ctmp[00] = ((<SL_PAGE> -1) * 8) + $data_no

	syscom.get_save_value($ctmp[00], $save_lock, 0, 1)		// �Z�[�u�f�[�^�̃t���O���擾����
	$save_lock[0] = $$toggle($save_lock[0])
	syscom.set_save_value($ctmp[00], $save_lock, 0, 1)
	return
}

//��������������������������������������������������������
command $$save_exec(property $data_no :int){	//�Z�[�u���s
	property $ctmp :intlist[10]

	$ctmp[00] = ((<SL_PAGE> -1) * 8) + $data_no 	//�Z�[�u�ԍ��Z�o
	$ctmp[01] = <C_OBJ>[$stage].object[$data_no + 40].child[07].patno	//�A�����b�N/���b�N��0/10

	if(<SL_PAGE> == 21 ){	//�I�[�g�Z�[�u�y�[�W�̃f�[�^�͏������ݕs��
		$$dialog("�����s�@�I�[�g�Z�[�u�p�f�[�^�ł��B",1)
		return
	}
	if($ctmp[01]==10){	//�f�[�^���b�N��
		$$dialog("�f�[�^�����b�N����Ă��܂�",1)
		return
	}
	//�㏑���Z�[�u��
	$ctmp[02] = 1
	if(syscom.get_save_exist($ctmp[00]) == 1){
		$ctmp[02] = $$dialog("�㏑���Z�[�u���܂����H",0)
	}
	if($ctmp[02] == 1){	//�Z�[�u���s����
		syscom.save($ctmp[00],0,0)
		se.play(001)
	}
	return
}

//��������������������������������������������������������
command $$del_exec(property $data_no:int){	//�폜���s
	property $ctmp :intlist[10]

	$ctmp[00] = ((<SL_PAGE> -1) * 8) + $data_no 	//�Z�[�u�ԍ��Z�o
	$ctmp[01] = <C_OBJ>[$stage].object[$data_no + 40].child[07].patno	//�A�����b�N/���b�N��0/10
	if($ctmp[01]==10){	//�f�[�^���b�N��
		$$dialog("�f�[�^�����b�N����Ă��܂�",1)
		return
	}
	$ctmp[02] = 1
	$ctmp[02] = $$dialog("�f�[�^���폜���܂����H",0)
	if($ctmp[02] == 1){	//�폜���s����
		//�폜�O�ɃT���l�C����NODATA�ɍ����ւ��Ȃ��ƃG���[�o��B
		<C_OBJ>[$stage].object[ $data_no + 40 ].child[01].create("_SL_th_nodata", 1, 000, 000)
		syscom.delete_save($ctmp[00])
		se.play(001)
	}
	return
}

//��������������������������������������������������������
command $$obj_txt(	//���b�Z�[�W�\��
	property $obj :object,
	property $mess :str,
	property $X_pos :int,
	property $Y_pos :int
){
	$obj.create_string("", 1,$X_pos,$Y_pos)
	$obj.set_string_param(20, 00, 00, 00, 001, 001, 0)
	$obj.set_string($mess)
	return
}

//��������������������������������������������������������
command $$savetitle2no(property $title :str):int{	//�Z�[�u�^�C�g��������ƃ`���v�^�[�ԍ���f���o��
	property $cpt_no :int
		if($title == "�����Ɗo��"			){$cpt_no = 01}
	elseif($title == "�^�킵���˗�"			){$cpt_no = 02}
	elseif($title == "���̎n�܂�"			){$cpt_no = 03}
	elseif($title == "�c�ȋ@�\"				){$cpt_no = 04}
	elseif($title == "�F���s�\�ȋ��"		){$cpt_no = 05}
	elseif($title == "�����c�邽�߂̋���"	){$cpt_no = 06}
	elseif($title == "�t���b�V���o�b�N"		){$cpt_no = 07}
	elseif($title == "�p�Гs�s"				){$cpt_no = 08}
	elseif($title == "���}���ꂽ�N����"		){$cpt_no = 09}
	elseif($title == "������p��"			){$cpt_no = 10}
	elseif($title == "�ے�"					){$cpt_no = 11}
	elseif($title == "���̊Ԃ̋x��"			){$cpt_no = 12}
	elseif($title == "����"					){$cpt_no = 13}
	elseif($title == "�~��M��"				){$cpt_no = 14}
	elseif($title == "�����̉^�щ�"		){$cpt_no = 15}
	elseif($title == "�h�ꓮ���S"			){$cpt_no = 16}
	elseif($title == "�Λ�"					){$cpt_no = 17}
	elseif($title == "�l�ނ̑I��"			){$cpt_no = 18}
	elseif($title == "�{���̗�"				){$cpt_no = 19}
	elseif($title == "�G�s���[�O"			){$cpt_no = 20}
	else{$cpt_no = 01}	//�󂯎M
	return($cpt_no)
}







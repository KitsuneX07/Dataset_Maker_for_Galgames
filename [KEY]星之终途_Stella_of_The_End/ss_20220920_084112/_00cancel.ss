//��������������������������������������������������������
//	�V�X�e�����j���[���B
//�E�N���b�N���ꂽ�Ƃ��ɂ�������΂��

#inc_start	//�{�^���ނ̔ԍ����f�t�@�C����
	#define	<b_bas>	00	//���n
	#define	<b_sav>	01	//�Z�[�u
	#define	<b_lod>	02	//���[�h
	#define	<b_cnf>	03	//���ݒ�
	#define	<b_log>	04	//�o�b�N���O
	#define	<b_aut>	05	//�I�[�g���[�h�J�n
	#define	<b_skp>	06	//�X�L�b�v�J�n
	#define	<b_twi> 07	//�c�C�[�g
	#define	<b_tit>	08	//�^�C�g����ʂɖ߂�
	#define	<b_bak>	09	//�o�b�N
	#define	<b_mov>	11	//���[�r�[

	#define	<b_dlg>	10	//�m�F�_�C�A���O�p

	#property	$backlog	int		//�o�b�N���O����p�t���O
	#define		<C_OBJ>[	excall.stage[	//�g�p�I�u�W�F�N�g�̒Z�k�w��

#inc_end

//��������������������������������������������������������
#Z00

	switch(<RC_CHK>){
		case(00)	se.play(01) //
		case(01)	gosub #Z02	return	//�E�B���h�E����
		case(02)	syscom.call_config_menu	return//�R���t�B�O
	}

#Z01	//�E�N���b�N���j���[
	capture					//##�Z�[�u�T���l�p�L���v�`��
	capture_for_tweet		//##�c�C�[�g�p�L���v�`��
	syscom.set_syscom_menu_disable	//�V�X�e�����j���[�֎~
	syscom.set_mwnd_btn_disable		//���b�Z�[�W�E�B���h�E�{�^�����g�p�s��

	syscom.set_auto_mode_onoff_flag(0)	//�I�[�g���[�h�I�t
	syscom.set_read_skip_onoff_flag(0)	//�X�L�b�v���[�h�I�t

	$$excall_ready(0)

	$stage=0			//back
	<C_OBJ>[$stage].object[<b_bas>].create("ev_kuro",1,000,000)
	<C_OBJ>[$stage].object[<b_bas>].tr = 128
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_sav>],	"_cm01_SAVE"	,1, 000,000,255,0,01,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_lod>],	"_cm02_LOAD"	,1, 000,000,255,0,02,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_cnf>],	"_cm03_CONFIG"	,1, 000,000,255,0,03,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_log>],	"_cm04_BACKLOG"	,1, 000,000,255,0,04,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_aut>],	"_cm05_AUTO"	,1, 000,000,255,0,05,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_skp>],	"_cm06_SKIP"	,1, 000,000,255,0,06,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_twi>],	"_cm07_TWEET"	,1, 000,000,255,0,07,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_tit>],	"_cm08_TITLE"	,1, 000,000,255,0,08,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[<b_bak>],	"_cm09_BACK"	,1, 000,000,255,0,09,1,1,0,0,1)
		//�I�[�g���[�h�ƃX�L�b�v�͏�Ԃɍ��킹�ă{�^����ԕύX

//	if(syscom.get_auto_mode_onoff_flag == 1){<C_OBJ>[$stage].object[<b_aut>].set_button_state_select}	//�I�[�g���[�h
//	if(syscom.get_read_skip_onoff_flag == 1){<C_OBJ>[$stage].object[<b_skp>].set_button_state_select}	//�X�L�b�v���[�h
	if(<PURORO> == 0){<C_OBJ>[$stage].object[<b_tit>].set_button_state_disable}							//�^�C�g��
	IF(check_savepoint == 0 ){ <C_OBJ>[$stage].object[<b_sav>].set_button_state_disable	}	//�Z�[�u�|�C���g�����ĂȂ�������Z�[�u�y�[�W�ɍs�����Ȃ��B

	$$show_animation($stage)	// �\���A�j���[�V����
	
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

	$stage=1			//front
	while(1){
		<C_OBJ>[$stage].objbtngroup[0].init
		$tmp[00] = <C_OBJ>[$stage].objbtngroup[0].sel_cancel
		switch($tmp[00]){
			case(-1) se.play(02) break									//�E�N���b�N����
			case(01) $$system_page_init_effect(excall.stage[$stage].object[100])
					 <SL_mode> = 00	farcall("_00saveload",10) break	//�Z�[�u
			case(02) $$system_page_init_effect(excall.stage[$stage].object[100])
					 <SL_mode> = 01	farcall("_00saveload",10) break	//���[�h
			case(03) $$system_page_init_effect(excall.stage[$stage].object[100])
					 farcall("_00config",10) break					//�R���t�B�O
			case(04) break		//�o�b�N���O
			case(05) break		//�I�[�g���[�h
			case(06) break		//�X�L�b�v
			case(07) syscom.open_tweet_dialog	break		//�c�C�[�g
			case(08) $$cfg_title	//syscom.return_to_menu(0,0,1)		//�^�C�g���ɖ߂�
			case(09) se.play(02) break	//�a�`�b�j
		}
	}

	$$excall_free
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//���b�Z�[�W�E�B���h�E�{�^�����g�p��
	syscom.set_syscom_menu_enable	//�E�N������
	capture_free_for_tweet	//##�c�C�[�g�p�L���v�`�����
	capture_free			//##�Z�[�u�T���l�p�L���v�`�����
	//�d�w�R�[�������Ă���F�X���s���镔��
	switch($tmp[00]){
		case(04)	syscom.open_msg_back	//�o�b�N���O�\��
		case(05)	syscom.set_auto_mode_onoff_flag(1)	//�I�[�g���[�h
		case(06)	syscom.set_read_skip_onoff_flag(1)	//�X�L�b�v
//		case(07)	syscom.open_tweet_dialog	//�c�C�[�g
	}
return

//��������������������������������������������������������
#Z02	//�E�N�����E�B���h�E�������̐ݒ�

	close
	while(1){	//�I��p���[�v
		if(input.decide.on_down_up == 1){ break }	//����L�[�Ŏ��ցB
		if(input.cancel.on_down_up == 1){ break }	//�L�����Z���L�[�Ŕ���
		input.next
		disp
	}
	input.clear
	open
return

#Z10
//$$excall_ready(1)
syscom.call_syscom_menu
//$$excall_free
return

//##�^�C�g���ɖ߂�
command $$cfg_title
	{
	property $ctmp :intlist[10]		//�ėp�ϐ�
		$ctmp[00] = $$dialog("�^�C�g���ɖ߂�܂����H",0)
		if($ctmp[00] == 1){	//
			syscom.return_to_menu(0,0,1)
			se.play(001)
		}
	return
	}

// �\���A�j���[�V����
command $$show_animation(property $stage_no)
{
	property $i
	property $anim_time
	property $anim_start_time
	
	// ���[�r�[
	<C_OBJ>[$stage_no].object[<b_mov>].create_movie(ef_noise3, 1, ready_only = 1)
	<C_OBJ>[$stage_no].object[<b_mov>].set_scale(2000, 2000)
	<C_OBJ>[$stage_no].object[<b_mov>].blend = 1
	<C_OBJ>[$stage_no].object[<b_mov>].layer = 1
	<C_OBJ>[$stage_no].object[<b_mov>].tr_eve.set(0, 500, 1000, 1)
	<C_OBJ>[$stage_no].object[<b_mov>].bright = 192
	<C_OBJ>[$stage_no].object[<b_mov>].bright_eve.set(0, 350, 0, 1)
	
	// �e�{�^���A�j���[�V����
	for( $i = <b_sav>, $i <= <b_bak>, $i += 1 )
	{
		<C_OBJ>[$stage_no].object[$i].x_rep.resize(1)
		<C_OBJ>[$stage_no].object[$i].y_rep.resize(1)
		<C_OBJ>[$stage_no].object[$i].x_rep[0] += <SCREEN_CENTER_X>
		<C_OBJ>[$stage_no].object[$i].y_rep[0] += <SCREEN_CENTER_Y>
		
		if( $i == <b_bak> )
		{
			$anim_time = 200
			$anim_start_time = 450
		}
		else
		{
			$anim_time = 150
			$anim_start_time = 480 + $i * 20
		}
		
		<C_OBJ>[$stage_no].object[$i].layer = 2
		
		<C_OBJ>[$stage_no].object[$i].tr = 0
		<C_OBJ>[$stage_no].object[$i].tr_eve.set(255, $anim_time, $anim_start_time, 1)
		
		<C_OBJ>[$stage_no].object[$i].set_scale(250, 250)
		<C_OBJ>[$stage_no].object[$i].scale_x_eve.set(1000, $anim_time, $anim_start_time, 2)
		<C_OBJ>[$stage_no].object[$i].scale_y_eve.set(1000, $anim_time, $anim_start_time, 2)
	}
	
	// ���o�I�t�̏ꍇ�̓A�j���[�V�����I��
	if( syscom.get_no_wipe_anime_onoff == 1 )
	{
		for( $i = <b_bas>, $i <= <b_mov>, $i += 1 ) {
			<C_OBJ>[$stage_no].object[$i].all_eve.end
		}
	}
		
	<C_OBJ>[$stage_no].object[<b_mov>].resume_movie
}

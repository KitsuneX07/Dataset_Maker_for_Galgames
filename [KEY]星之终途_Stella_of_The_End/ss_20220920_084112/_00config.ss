//���ݒ�
//��������������������������������������������������������
#Z00

	capture					//##�Z�[�u�T���l�p�L���v�`��
	capture_for_tweet		//##�c�C�[�g�p�L���v�`��
	syscom.set_syscom_menu_disable	//�V�X�e�����j���[�֎~
	syscom.set_mwnd_btn_disable		//���b�Z�[�W�E�B���h�E�{�^�����g�p�s��
	$$excall_ready(0)

	gosub #main

	$$excall_free

	koe_stop	//�T���v���������Ă����~
	syscom.set_syscom_menu_enable
	syscom.set_mwnd_btn_enable		//���b�Z�[�W�E�B���h�E�{�^�����g�p��
	syscom.set_syscom_menu_enable	//�E�N������
	capture_free_for_tweet	//##�c�C�[�g�p�L���v�`�����
	capture_free			//##�Z�[�u�T���l�p�L���v�`�����
	return

#Z10	//�O������̌Ăяo���p���x��
#main	//------------------------------------------------------------

#page_chg	//�y�[�W�\�z
	$stage = 0

	if(<CFG_CHR> <=1 ){	//�L�����ʉ����̍��W������
		$cfg_ch_x.sets(1,0991,1187,1383,1579,0000,0991,1187)	//�K�u�����
		$cfg_ch_y.sets(1,0237,0237,0237,0237,0558,0558,0558)
	}else{
		$cfg_ch_x.sets(1,0991,1187,1383,1579,0991,1187,1383)
		$cfg_ch_y.sets(1,0237,0237,0237,0237,0558,0558,0558)
	}

	gosub #LOAD_common
	switch(<CF_PAGE>){
		case(00)	$all_set= 1 gosub #LOAD_SYSTEM $all_set= 0
		case(01)	$all_set= 1 gosub #LOAD_SOUND  $all_set= 0
	}
	
	//���C�v
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

#sel_loop
	$stage = 1
	$tmp[00]=0
	$$main_sel_ret
	while(1){	//##���C�����[�v
		//##�z�C�[�����܂킵�����ǂ����̃`�F�b�N
		$tmp[01]=excall.front.objbtngroup[<sel0>].get_hit_no
		if(mouse.wheel != 0){	//�X���C�_�̉��n�ȊO�Ńz�C�[������ĂĂ����������@�c�n�Y
			switch($tmp[01]){	//���s���� 
				case(126)	$$wh_set(<C_OBJ>[$stage].object[26].child[03].x_rep[0],0,0, <SL00_MAX>,500,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(127)	$$wh_set(<C_OBJ>[$stage].object[27].child[03].x_rep[0],0,0, <SL00_MAX>,100,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(128)	$$wh_set(<C_OBJ>[$stage].object[28].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])

				case(219)	$$wh_set(<C_OBJ>[$stage].object[19].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(220)	$$wh_set(<C_OBJ>[$stage].object[20].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(221)	$$wh_set(<C_OBJ>[$stage].object[21].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(222)	$$wh_set(<C_OBJ>[$stage].object[22].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(223)	$$wh_set(<C_OBJ>[$stage].object[23].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(224)	$$wh_set(<C_OBJ>[$stage].object[24].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
				case(225)	$$wh_set(<C_OBJ>[$stage].object[25].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])

			}
		}
		//##�X���C�_�[���X���C�_�[���n�����`�F�b�N
		$tmp[00]=excall.front.objbtngroup[<sel0>].get_pushed_no	//##�{�^���������ꂽ�����Ŕ�������q�͂������i���������ł͂Ȃ��j
		switch($tmp[00]){
			case(126)	$$SLD_LOOP(<C_OBJ>[$stage].object[26],$tmp[00],<SL00_MAX>)	//�I�[�g���[�h
			case(127)	$$SLD_LOOP(<C_OBJ>[$stage].object[27],$tmp[00],<SL00_MAX>)	//�������x
			case(128)	$$SLD_LOOP(<C_OBJ>[$stage].object[28],$tmp[00],<SL00_MAX>)	//�E�B���h�E�w�i
			//------------------------------------------------------------
			case(219)	$$SLD_LOOP(<C_OBJ>[$stage].object[19],$tmp[00],<SL00_MAX>)
			case(220)	$$SLD_LOOP(<C_OBJ>[$stage].object[20],$tmp[00],<SL00_MAX>)
			case(221)	$$SLD_LOOP(<C_OBJ>[$stage].object[21],$tmp[00],<SL00_MAX>)
			case(222)	$$SLD_LOOP(<C_OBJ>[$stage].object[22],$tmp[00],<SL00_MAX>)
			case(223)	$$SLD_LOOP(<C_OBJ>[$stage].object[23],$tmp[00],<SL00_MAX>)
			case(224)	$$SLD_LOOP(<C_OBJ>[$stage].object[24],$tmp[00],<SL00_MAX>)
			case(225)	$$SLD_LOOP(<C_OBJ>[$stage].object[25],$tmp[00],<SL00_MAX>)
			//------------------------------------------------------------
			case(241)	$$SLD_LOOP(<C_OBJ>[$stage].object[26],$tmp[00],<SL01_MAX>)	//�L�����ʉ���
			case(242)	$$SLD_LOOP(<C_OBJ>[$stage].object[27],$tmp[00],<SL01_MAX>)
			case(243)	$$SLD_LOOP(<C_OBJ>[$stage].object[28],$tmp[00],<SL01_MAX>)
			case(244)	$$SLD_LOOP(<C_OBJ>[$stage].object[29],$tmp[00],<SL01_MAX>)
			case(245)	$$SLD_LOOP(<C_OBJ>[$stage].object[30],$tmp[00],<SL01_MAX>)
			case(246)	$$SLD_LOOP(<C_OBJ>[$stage].object[31],$tmp[00],<SL01_MAX>)
			case(247)	$$SLD_LOOP(<C_OBJ>[$stage].object[32],$tmp[00],<SL01_MAX>)
		}
		//##�{�^���n�i�����ė��������Ɏ��s�j
		$tmp[00]=excall.front.objbtngroup[<sel0>].get_decided_no	//##�{�^���E�`�F�b�N�{�b�N�X�ނ̏�Ԏ擾
		switch($tmp[00]){
			case(-1)	break				//�E�N���b�N�E�a�`�b�j
			case(001)	<CF_PAGE> = 0 break	//�V�X�e���y�[�W
			case(002)	<CF_PAGE> = 1 break	//�T�E���h�y�[�W

			case(003)	<SL_mode> = 00 farcall("_00saveload",10)	break	//�r�`�u�d
			case(004)	<SL_mode> = 01 farcall("_00saveload",10)	break	//�k�n�`�c
			case(005)									//�b�n�m�e�h�f
			case(006)	$$cfg_title	//syscom.return_to_menu(0,0,1)	//�s�h�s�k�d
			case(007)	$$cfg_quit	//break							//�p�t�h�s
			case(008)	break							//�a�`�b�j
			//------------------------------------------------------------
			case(110)	syscom.call_config_window_mode_menu				//�E�B���h�E�ݒ�
			case(111)	syscom.set_window_mode(1)	$$onoff_set(syscom.get_window_mode,12,11)	//�t���X�N���[��
			case(112)	syscom.set_window_mode(0)	$$onoff_set(syscom.get_window_mode,12,11)	//�E�B���h�E
			case(113)	syscom.set_skip_unread_message_onoff(0)	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//���b�Z�[�W�X�L�b�v���ǂ̂�
			case(114)	syscom.set_skip_unread_message_onoff(1)	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//���b�Z�[�W�X�L�b�v���Ǌ܂�
			case(115)	<RC_CHK> = 0	$$rcm_set	//�E�N���b�N�@�N���b�N���j���[
			case(116)	<RC_CHK> = 1	$$rcm_set	//�E�N���b�N�@�E�B���h�E����
			case(117)	<RC_CHK> = 2	$$rcm_set	//�E�N���b�N�@�R���t�B�O
			case(118)	syscom.set_message_speed_default	$$PRM_SLD_SET(127) syscom.set_message_nowait_default $$cbox_set(syscom.get_message_nowait,25,0)	//�������x���Z�b�g
			case(119)	syscom.call_config_font_menu		//�t�H���g�ݒ�
			case(120)	syscom.set_filter_color_a_default	$$PRM_SLD_SET(128)	//�E�B���h�E�w�i������
			case(121)	syscom.set_no_wipe_anime_onoff(0)	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)	//���o�I��
			case(122)	syscom.set_no_wipe_anime_onoff(1)	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)	//���o�I�t
			case(123)	syscom.call_config_movie_menu	//���[�r�[�ݒ�
			case(124)	syscom.call_config_system_menu 	//���̑��̐ݒ�
			case(125)	syscom.set_message_nowait($$toggle(syscom.get_message_nowait))	$$cbox_set(syscom.get_message_nowait,25,0)	//�m�[�E�F�C�g�ݒ�
			case(130)	syscom.set_auto_mode_moji_wait_default	syscom.set_auto_mode_min_wait_default	$$PRM_SLD_SET(126)	//�I�[�g���[�h�ݒ菉����
			case(131)	syscom.call_config_filter_color_menu	//�t�B���^�[�J���[�̃_�C�A���O���Ăяo��

			//------------------------------------------------------------
			case(210)	$$sound_vol_reset	//���ʏ�����
			case(211)	syscom.set_all_onoff($$toggle(syscom.get_all_onoff))	$$cbox_set(syscom.get_all_onoff,11,0)	//�`�F�b�N�F�S��
			case(212)	syscom.set_bgm_onoff($$toggle(syscom.get_bgm_onoff))	$$cbox_set(syscom.get_bgm_onoff,12,0)	//�`�F�b�N�F�a�f�l
			case(213)	syscom.set_bgmfade_onoff($$toggle(syscom.get_bgmfade_onoff))	$$cbox_set(syscom.get_bgmfade_onoff,13,0)	//�`�F�b�N�F�a�f�l�t�F�[�h
			case(214)	syscom.set_koe_onoff($$toggle(syscom.get_koe_onoff))	$$cbox_set(syscom.get_koe_onoff,14,0)	//�`�F�b�N�F����
			case(215)	syscom.set_pcm_onoff($$toggle(syscom.get_pcm_onoff))	$$cbox_set(syscom.get_pcm_onoff,15,0)	//�`�F�b�N�F���ʉ�
			case(216)	syscom.set_se_onoff($$toggle(syscom.get_se_onoff))		$$cbox_set(syscom.get_se_onoff,16,0)	//�`�F�b�N�F�V�X�e����
			case(217)	syscom.set_mov_onoff($$toggle(syscom.get_mov_onoff))	$$cbox_set(syscom.get_mov_onoff,17,0)	//�`�F�b�N�F���[�r�[��
			case(218)	syscom.set_koe_dont_stop_onoff($$toggle(syscom.get_koe_dont_stop_onoff))	$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)	//�����̍Đ����Ɏ��̕��͂ɐi��ł��Đ��𑱂���

			case(226)	$$CHR_vol_reset

			case(231)	syscom.set_charakoe_onoff(001,$$toggle(syscom.get_charakoe_onoff(001)))	$$cbox_set(syscom.get_charakoe_onoff(001),26,1)	//�L�����ʉ����I���I�t
			case(232)	syscom.set_charakoe_onoff(002,$$toggle(syscom.get_charakoe_onoff(002)))	$$cbox_set(syscom.get_charakoe_onoff(002),27,1)
			case(233)	syscom.set_charakoe_onoff(003,$$toggle(syscom.get_charakoe_onoff(003)))	$$cbox_set(syscom.get_charakoe_onoff(003),28,1)
			case(234)	syscom.set_charakoe_onoff(004,$$toggle(syscom.get_charakoe_onoff(004)))	$$cbox_set(syscom.get_charakoe_onoff(004),29,1)
			case(235)	syscom.set_charakoe_onoff(005,$$toggle(syscom.get_charakoe_onoff(005)))	$$cbox_set(syscom.get_charakoe_onoff(005),30,1)
			case(236)	syscom.set_charakoe_onoff(006,$$toggle(syscom.get_charakoe_onoff(006)))	$$cbox_set(syscom.get_charakoe_onoff(006),31,1)
			case(237)	syscom.set_charakoe_onoff(007,$$toggle(syscom.get_charakoe_onoff(007)))	$$cbox_set(syscom.get_charakoe_onoff(007),32,1)

			case(251)	$$sampleKOE("Z900000020",001)	//�W���[�h�u�I�̃X�e���v
			case(252)	$$sampleKOE("Z900000015",002)	//�t�B���A�u�I�̃X�e���v
			case(253)	$$sampleKOE("Z900000086",003)	//�E�B�����u�I�̃X�e���v
			case(254)	$$sampleKOE("Z900000013",004)	//�f�����u�I�̃X�e���v
			case(255)	$$sampleKOE("Z900000113",005)	//�K�u���G���u�I�̃X�e���v
			case(256)	$$sampleKOE("Z000300016",007)	//���̑��j�u�悤�A�W���[�h�v
			case(257)	$$sampleKOE("Z000700142",006)	//���̑����u�_���A����������v

		}
		if($tmp[00]==-1){	//##�L�����Z�����ꂽ���[�v�A�E�g
			frame_action.end	//�����A�j������U��~
			se.play(02)		//�L�����Z�����̍Đ�
			break
		}
		IF(excall.front.objbtngroup[<SEL0>].get_decided_no!= -2){
			$$main_sel_ret
		}
		input.next
		DISP
	}
	if(($tmp[00] == 1)||($tmp[00] == 2)){	//SYSTEM��SOUND
		goto #page_chg
	}
	frame_action.end
	se.play(02)
	return

//��������������������������������������������������������
#LOAD_common
	//����
	$$OBJBTN_SET(<C_OBJ>[$stage].object[01],	"_cfg_system"		,1, 000,000,255,<SEL0>,01,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[02],	"_cfg_sound"		,1, 000,000,255,<SEL0>,02,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[03],	"_common_save"		,1, 000,000,255,<SEL0>,03,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[04],	"_common_load"		,1, 000,000,255,<SEL0>,04,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[05],	"_common_config"	,1, 000,000,255,<SEL0>,05,1,1,0,1,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[06],	"_common_title"		,1, 000,000,255,<SEL0>,06,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[07],	"_common_quit"		,1, 000,000,255,<SEL0>,07,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[08],	"_common_back"		,1, 000,000,255,<SEL0>,08,1,1,0,0,0)
	IF(<PURORO>==0 ){	<C_OBJ>[$stage].object[06].set_button_state_disable	}	//�v�����[�O�������̓^�C�g���ɔ�ׂȂ�
	IF(check_savepoint == 0 ){ <C_OBJ>[$stage].object[03].set_button_state_disable	}	//�Z�[�u�|�C���g�����ĂȂ�������Z�[�u�y�[�W�ɍs�����Ȃ��B

	return

//��������������������������������������������������������
#LOAD_SYSTEM	//�r�x�r�s�d�l
	<C_OBJ>[$stage].object[00].create("_cfg_system_base",1)
	//�V�X�e���p�{�^���́@�I�u�W�F�N�g10����B�@�{�^������ԍ��̓I�u�W�F�N�g�ԍ� +100
	$$OBJBTN_SET(<C_OBJ>[$stage].object[10],	"_cfg_system_disp_set"		,1, 000,000,255,<SEL0>,110,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[11],	"_cfg_system_disp_full"		,1, 000,000,255,<SEL0>,111,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[12],	"_cfg_system_disp_window"	,1, 000,000,255,<SEL0>,112,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[13],	"_cfg_system_skip_01"		,1, 000,000,255,<SEL0>,113,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[14],	"_cfg_system_skip_02"		,1, 000,000,255,<SEL0>,114,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[15],	"_cfg_system_rcm_00"		,1, 000,000,255,<SEL0>,115,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[16],	"_cfg_system_rcm_01"		,1, 000,000,255,<SEL0>,116,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[17],	"_cfg_system_rcm_02"		,1, 000,000,255,<SEL0>,117,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[18],	"_cfg_system_font_reset"	,1, 000,000,255,<SEL0>,118,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[19],	"_cfg_system_font_set"		,1, 000,000,255,<SEL0>,119,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[20],	"_cfg_system_messw_reset"	,1, 000,000,255,<SEL0>,120,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[21],	"_cfg_system_effect_on"		,1, 000,000,255,<SEL0>,121,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[22],	"_cfg_system_effect_off"	,1, 000,000,255,<SEL0>,122,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[23],	"_cfg_system_movie"			,1, 000,000,255,<SEL0>,123,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[24],	"_cfg_system_other"			,1, 000,000,255,<SEL0>,124,1,1,0,0,1)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[25],	"_cfg_system_nowait"		,1, 000,000,255,<SEL0>,125,1,1,0,0,0)
	$$OBJBTN_SET(<C_OBJ>[$stage].object[30],	"_cfg_system_automode_reset",1, 000,000,255,<SEL0>,130,1,1,0,0,0)
//	$$OBJBTN_SET(<C_OBJ>[$stage].object[31],	"_cfg_system_disp_set"		,1,1074,000,255,<SEL0>,131,1,1,0,0,1)	//���b�Z�[�W�E�B���h�E�ڍאݒ�{�^��

	<C_OBJ>[$stage].object[29].create("_cfg_system_preview",1)

	//�X���C�_�[�p�[�c�ǂݍ��݁E��ԃZ�b�g
	$$SLIDE_set_load(<C_OBJ>[$stage].object[26],	183,672,	126)	$$PRM_SLD_SET(126)
	$$SLIDE_set_load(<C_OBJ>[$stage].object[27],	183,895,	127)	$$PRM_SLD_SET(127)
	$$SLIDE_set_load(<C_OBJ>[$stage].object[28],	1078,292,	128)	$$PRM_SLD_SET(128)

	$$onoff_set(syscom.get_window_mode,12,11)				//��ʃ��[�h
	$$onoff_set(syscom.get_skip_unread_message_onoff,13,14)	//���ǃX�L�b�v
	$$onoff_set(syscom.get_no_wipe_anime_onoff,21,22)		//�G�t�F�N�g�I���I�t
	$$cbox_set(syscom.get_message_nowait,25,0)				//�m�[�E�F�C�g�I���I�t
	$$rcm_set	//�E�N���b�N�ݒ�

	//���[�h�{�^����ԃZ�b�g
	<C_OBJ>[$stage].object[01].set_button_state_select	//�E��
	<C_OBJ>[$stage].object[02].set_button_state_normal

	return

//��������������������������������������������������������
#LOAD_SOUND		//�r�n�t�m�c
		<C_OBJ>[$stage].object[00].create("_cfg_sound_base",1,000,000,<CFG_CHR>)
		//�T�E���h�p�{�^���́@�I�u�W�F�N�g10����B�@�{�^������ԍ��̓I�u�W�F�N�g�ԍ� +200
		$$OBJBTN_SET(<C_OBJ>[$stage].object[10],	"_cfg_sound_prm_reset"		,1, 000,000,255,<SEL0>,210,1,1,0,0,1)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[11],	"_cfg_sound_prm_all"		,1, 000,000,255,<SEL0>,211,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[12],	"_cfg_sound_prm_bgm"		,1, 000,000,255,<SEL0>,212,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[13],	"_cfg_sound_prm_bgmf"		,1, 000,000,255,<SEL0>,213,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[14],	"_cfg_sound_prm_voi"		,1, 000,000,255,<SEL0>,214,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[15],	"_cfg_sound_prm_se"			,1, 000,000,255,<SEL0>,215,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[16],	"_cfg_sound_prm_sys"		,1, 000,000,255,<SEL0>,216,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[17],	"_cfg_sound_prm_mov"		,1, 000,000,255,<SEL0>,217,1,1,0,0,0)
		$$OBJBTN_SET(<C_OBJ>[$stage].object[18],	"_cfg_sound_prm_pbs"		,1, 000,000,255,<SEL0>,218,1,1,0,0,0)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[19],	108,256,	219)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[20],	108,346,	220)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[21],	108,436,	221)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[22],	108,526,	222)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[23],	108,616,	223)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[24],	108,706,	224)
		$$SLIDE_set_load(<C_OBJ>[$stage].object[25],	108,796,	225)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[26],01,"_cfg_sound_chrbase_jd",231)	//�L�����ʂ̃I���^�I�t�ƃX���C�_�A�T���v���Đ����ꊇ���[�h
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[27],02,"_cfg_sound_chrbase_ph",232)	//�@231�`�@�L�����ʃI���I�t
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[28],03,"_cfg_sound_chrbase_wi",233)	//�@241�`�@�X���C�_�[
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[29],04,"_cfg_sound_chrbase_de",234)	//�@251�`�@�T���v���Đ�
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[30],05,"_cfg_sound_chrbase_ga",235)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[31],06,"_cfg_sound_chrbase_o1",236)
		$$CFG_CHR_LOAD(<C_OBJ>[$stage].object[32],07,"_cfg_sound_chrbase_o2",237)

		$$OBJBTN_SET(<C_OBJ>[$stage].object[33],	"_cfg_sound_chr_reset"		,1, 000,000,255,<SEL0>,226,1,1,0,0,1)		//�L���������S�ă��Z�b�g
//		$$OBJBTN_SET(<C_OBJ>[$stage].object[34],	"_cfg_sound_chr_allon"		,1, 000,000,255,<SEL0>,227,1,1,0,0,1)		//�L���������S�ăI��
//		$$OBJBTN_SET(<C_OBJ>[$stage].object[35],	"_cfg_sound_chr_alloff"		,1, 000,000,255,<SEL0>,228,1,1,0,0,1)		//�L���������S�ăI�t

		$$PRM_SLD_SET(219)	//�X���C�_�l�̔��f
		$$PRM_SLD_SET(220)
		$$PRM_SLD_SET(221)
		$$PRM_SLD_SET(222)
		$$PRM_SLD_SET(223)
		$$PRM_SLD_SET(224)
		$$PRM_SLD_SET(225)

		$$cbox_set(syscom.get_all_onoff,11,0)
		$$cbox_set(syscom.get_bgm_onoff,12,0)
		$$cbox_set(syscom.get_bgmfade_onoff,13,0)
		$$cbox_set(syscom.get_koe_onoff,14,0)
		$$cbox_set(syscom.get_pcm_onoff,15,0)
		$$cbox_set(syscom.get_se_onoff,16,0)
		$$cbox_set(syscom.get_mov_onoff,17,0)
		$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)

		//���[�h�{�^����ԃZ�b�g
		<C_OBJ>[$stage].object[01].set_button_state_normal	//�E��
		<C_OBJ>[$stage].object[02].set_button_state_select

return


//�ʓ���
command $$main_sel_ret	//���ݒ�̑I�����[�v�ɖ߂��R�}���h
{
	excall.stage[$stage].objbtngroup[<SEL0>].init
	excall.stage[$stage].objbtngroup[<SEL0>].start_cancel	//�I�����J�n
	return
}

command	$$rcm_set	//�E�N���b�N���j���[�ݒ�
{
	switch(<RC_CHK>){
		case(00)	<C_OBJ>[$stage].object[15].patno=10	<C_OBJ>[$stage].object[16].patno=00	<C_OBJ>[$stage].object[17].patno=00
		case(01)	<C_OBJ>[$stage].object[15].patno=00	<C_OBJ>[$stage].object[16].patno=10	<C_OBJ>[$stage].object[17].patno=00
		case(02)	<C_OBJ>[$stage].object[15].patno=00	<C_OBJ>[$stage].object[16].patno=00	<C_OBJ>[$stage].object[17].patno=10
	}
	return
}

command $$onoff_set(	//�`�F�b�N�I���I�t���p�ŃR�}���h
	property $sys_prm,
	property $on_obj_no,
	property $off_obj_no
){
	switch($sys_prm){
		case(0)	<C_OBJ>[$stage].object[$on_obj_no].patno=10	<C_OBJ>[$stage].object[$off_obj_no].patno=00
		case(1)	<C_OBJ>[$stage].object[$on_obj_no].patno=00	<C_OBJ>[$stage].object[$off_obj_no].patno=10
	}
	return
}

command $$cbox_set(		//�`�F�b�N�{�b�N�X���p�ŃR�}���h
	property $sys_prm,
	property $obj_no,
	property $chr_vo
){
	switch($sys_prm + ($chr_vo * 10)){
		case(00)	<C_OBJ>[$stage].object[$obj_no].patno=00	//�ʏ�
		case(01)	<C_OBJ>[$stage].object[$obj_no].patno=10

		case(10)	<C_OBJ>[$stage].object[$obj_no].child[04].patno=00	//�L�����ʉ����̃I���I�t
		case(11)	<C_OBJ>[$stage].object[$obj_no].child[04].patno=10
	}
	return
}

command	$$sound_vol_reset{	//���ʈꊇ������
	syscom.set_all_volume_default         // �S�̂̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_bgm_volume_default         // BGM �̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_koe_volume_default         // ���̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_pcm_volume_default         // ���ʉ��̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_se_volume_default          // �V�X�e�����̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_mov_volume_default         // ���[�r�[�̉��ʂ��f�t�H���g�ɐݒ肷��
	syscom.set_bgmfade_volume_default     // �a�f�l�t�F�[�h�̒l���f�t�H���g�ɐݒ肷��

	syscom.set_all_onoff_default          // �S�̂� ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_bgm_onoff_default          // BGM �� ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_koe_onoff_default          // ���� ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_pcm_onoff_default          // ���ʉ��� ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_se_onoff_default           // �V�X�e������ ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_mov_onoff_default          // ���[�r�[�� ON/OFF ���f�t�H���g�ɐݒ肷��
	syscom.set_bgmfade_onoff_default      // �a�f�l�t�F�[�h�� ON/OFF ���f�t�H���g�ɐݒ肷��

	$$PRM_SLD_SET(219)
	$$PRM_SLD_SET(220)
	$$PRM_SLD_SET(221)
	$$PRM_SLD_SET(222)
	$$PRM_SLD_SET(223)
	$$PRM_SLD_SET(224)
	$$PRM_SLD_SET(225)

	$$cbox_set(syscom.get_all_onoff,11,0)
	$$cbox_set(syscom.get_bgm_onoff,12,0)
	$$cbox_set(syscom.get_bgmfade_onoff,13,0)
	$$cbox_set(syscom.get_koe_onoff,14,0)
	$$cbox_set(syscom.get_pcm_onoff,15,0)
	$$cbox_set(syscom.get_se_onoff,16,0)
	$$cbox_set(syscom.get_mov_onoff,17,0)
	$$cbox_set(syscom.get_koe_dont_stop_onoff,18,0)

	return
}

command $$CHR_vol_reset{	//�L�����ʉ����ꊇ������
	syscom.set_charakoe_onoff_default(001)
	syscom.set_charakoe_onoff_default(002)
	syscom.set_charakoe_onoff_default(003)
	syscom.set_charakoe_onoff_default(004)
	syscom.set_charakoe_onoff_default(005)
	syscom.set_charakoe_onoff_default(006)
	syscom.set_charakoe_onoff_default(007)
	<C_OBJ>[$stage].object[26].child[04].patno = 10
	<C_OBJ>[$stage].object[27].child[04].patno = 10
	<C_OBJ>[$stage].object[28].child[04].patno = 10
	<C_OBJ>[$stage].object[29].child[04].patno = 10
	<C_OBJ>[$stage].object[30].child[04].patno = 10
	<C_OBJ>[$stage].object[31].child[04].patno = 10
	<C_OBJ>[$stage].object[32].child[04].patno = 10
	//------------------------------------------------------------
	syscom.set_charakoe_volume_default(001)
	syscom.set_charakoe_volume_default(002)
	syscom.set_charakoe_volume_default(003)
	syscom.set_charakoe_volume_default(004)
	syscom.set_charakoe_volume_default(005)
	syscom.set_charakoe_volume_default(006)
	syscom.set_charakoe_volume_default(007)
	$$sld_pos_set(<C_OBJ>[$stage].object[26],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[27],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[28],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[29],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[30],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[31],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	$$sld_pos_set(<C_OBJ>[$stage].object[32],math.timetable(syscom.get_charakoe_volume(001),0,0,[0,255,<SL01_MAX>]))
	return
}


//��������������������������������������������������������

//��������������������������������������������������������

//��������������������������������������������������������
//�R�}���h�Q

//�X���C�_�p�[�c�ǂݍ���
//##�X���C�_�[�E�X���C�_�[���n���ꊇ�ŃZ�b�g����R�}���h
command $$SLIDE_set_load(
		property $obj		: object,	//�x�[�X�I�u�W�F�N�g
		property $x			: int,		//��{�w���W
		property $y			: int,		//��{�x���W
		property $SLD_B_NO	: int		//���X���C�_���n�̔���ԍ�
	){
		property $SLD_X		//�X���C�_�[�̕␳���W
		property $SLD_Y		//
		property $SLD_B_X	//�X���C�_�[���n�̕␳���W
		property $SLD_B_Y	//

		$SLD_X	= 00	//�X���C�_�[�̕␳���W
		$SLD_Y	= 00	//
		$obj.init
		$obj.set_pos($x, $y)
		$obj.disp=1
		$obj.child.resize(4)	//�q�u�W�F�N�g��\��
	
		$obj.child[00].create("_cfg_bar",1,$SLD_X, $SLD_Y,00)															//00_�X���C�_
		$obj.child[01].create("_cfg_bar",1,$SLD_X, $SLD_Y,10)	$obj.child[01].set_src_clip(1,000,000, 000,12)			//01_�X���C�_
		$$OBJBTN_RECT($obj.child[02],1,$SLD_X-15, $SLD_Y-20, <SL00_MAX>+30, 40,<MES_TR>,<SEL0>,$SLD_B_NO,1,-1)			//02_�X���C�_���n(����)
		$obj.child[03].create("_cfg_sld",1,$SLD_X, $SLD_Y,00)	$obj.child[03].x_rep.resize(1)							//03_�X���C�_(��{�^��)
		return
	}

//��������������������������������������������������������
//�w�肳�ꂽ�I�u�W�F�N�g�̃X���C�_�[���w����W�ɃZ�b�g����R�}���h�B�u�̂т̂сv������
command $$sld_pos_set(
		property $obj:object,
		property $pos:int
		){
			$obj.child[03].x_rep[0] = $pos						//�X���C�_�̈ʒu�ݒ�
			$obj.child[01].set_src_clip(1,000,000, $pos,12)		//�X���C�_���́u�̂т̂сv
			return
		}

//##��������������������������������������������������������
//�t���O�l���X���C�_�l�R���o�[�^�@�@�������̓X���C�_�̉����ő�l
command $$S2F(property $sys_prm : int , property $SLD_MAX : int) :int
	{	return(math.timetable($sys_prm,0,0,[0,255,$SLD_MAX]))}	//�߂�l�̓X���C�_��x_rep���W�Ƃ��Ďg����B
//�X���C�_�l���t���O�l�R���o�[�^�@�@�������̓X���C�_�̉����ő�l
command $$F2S(property $x_rep : int , property $SLD_MAX : int) :int
	{	return(math.timetable($x_rep,0,0,[0,$SLD_MAX,255]))}	//�߂�l�̓V�X�e���t���O�̃{�����[���l�Ƃ��Ďg����B
//�w�X���C�_�l���`�p�R�}���h	���s�w�l�E�X���C�_�ő�l
command $$SVX_FIX(property $x : int , property $MAX : int ) :int
	{	return(math.limit(00,mouse.pos_x + $x,$MAX))}			//�X���C�_���W�𐮌`

//��������������������������������������������������������
command $$PRM_SLD_SET(property $btn_no :int)	//�e��p�����^�l���X���C�_�ɔ��f������R�}���h
	{
	property $obj_no :int
	property $sys_prm :int

	$obj_no = $btn_no % 100	//�I�u�W�F�N�g�ԍ��Z�o
	switch($btn_no){
		case(126)	$sys_prm = math.timetable(syscom.get_auto_mode_moji_wait,0,0,[0,500,<SL00_MAX>])
		case(127)	$sys_prm = math.timetable(syscom.get_message_speed,0,0,[0,100,<SL00_MAX>])
		case(128)	$sys_prm = math.timetable(syscom.get_filter_color_a,0,0,[0,255,<SL00_MAX>])	<C_OBJ>[$stage].object[29].tr = syscom.get_filter_color_a
		//------------------------------------------------------------
		case(219)	$sys_prm = math.timetable(syscom.get_all_volume,0,0,[0,255,<SL00_MAX>])
		case(220)	$sys_prm = math.timetable(syscom.get_BGM_volume,0,0,[0,255,<SL00_MAX>])
		case(221)	$sys_prm = math.timetable(syscom.get_bgmfade_volume,0,0,[0,255,<SL00_MAX>])
		case(222)	$sys_prm = math.timetable(syscom.get_KOE_volume,0,0,[0,255,<SL00_MAX>])
		case(223)	$sys_prm = math.timetable(syscom.get_PCM_volume,0,0,[0,255,<SL00_MAX>])
		case(224)	$sys_prm = math.timetable(syscom.get_SE_volume,0,0,[0,255,<SL00_MAX>])
		case(225)	$sys_prm = math.timetable(syscom.get_MOV_volume,0,0,[0,255,<SL00_MAX>])
	}
	$$sld_pos_set(<C_OBJ>[$stage].object[$obj_no] , $sys_prm)
	return
	}

//��������������������������������������������������������
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

//##�Q�[���I��
command $$cfg_quit
	{
	property $ctmp :intlist[10]		//�ėp�ϐ�
		$ctmp[00] = $$dialog("�Q�[�����I�����܂����H",0)
		if($ctmp[00] == 1){	//
			syscom.end_game(0,0,1)
		}
	return
	}

//##��`�̃{�^���̈���쐬����
command	$$OBJBTN_RECT(
	property $obj : object,
	property $DISP,
	property $XS,
	property $YS,
	property $X_rect,
	property $Y_rect,
	property $tr,
	property $group,
	property $btn_no,
	property $action,
	property $se
	)
	{
		$obj.create_rect($XS, $YS, $XS+$X_rect, $YS+$Y_rect, 255, 255, 000,$tr)
		$obj.disp = $DISP
		$obj.set_button($btn_no,$group,$action,$se)	//�{�^����
	}

//##�z�C�[���l���I�u�W�F�N�g�ƁA�w��̃V�X�e���p�����^�ɓn���R�}���h�B
command $$wh_set(
	property $obj_rep	: int,	;�g�p�I�u�W�F�N�g�̕␳���W
	property $prm_min	: int,	;�X���C�_�̉����l
	property $v_min		: int,	;�V�X�e���p�����^�̉����l
	property $prm_max	: int,	;�X���C�_�̏���l
	property $v_max		: int,	;�V�X�e���p�����^�̏���l
	property $btn_no	: int	//�{�^������ԍ�
	)	;##�߂�l���Q�K�v�Ƃ��邽�߁A$ret[00] $ret[01] �̂Q���g�p����B
	{
		$obj_rep += mouse.wheel * -10
		$ret[00] = math.limit($prm_min, $obj_rep, $prm_max)					//�߂�l�O�@�X���C�_�J�[�\���̕␳���W�l
		$ret[01] = math.linear($obj_rep,$prm_min,$v_min,$prm_max,$v_max)	//�߂�l�P�@�V�X�e���p�����^�ւ̑���l
		$ret[01] = math.limit($v_min,$ret[01],$v_max)						//�߂�l�P�ɂk��������������
		$$PRM_SET($btn_no,$obj_rep)
		return
	}

//##�T���v���{�C�X�Đ���NWA�t�@�C���ōs���R�}���h
command $$sampleKOE(
	property $file_name	:str,	//�Đ�����t�@�C����
	property $koe_no	:int	//�Q�Ƃ��鐺�ԍ�
	){
		pcmch[0].play($file_name,  chara_no=$koe_no , volume_type = 1 , bgm_fade_source = 1 )
		return
	}

//��������������������������������������������������������
//�X���C�_�[�̉������ςȂ����[�v����R�}���h
command $$SLD_LOOP(
	property	$obj_base : object,	//�x�[�X�Ƃ���I�u�W�F�N�g�̎w��
	property	$obj_base_no : int,	//����Ɏg���{�^���ԍ�
	property	$sld_max	: int	//�X���C�_�̍ő�l
	){
		property	$SLD_X : int		//�X���C�_�̂w���W�p�ϐ���p��
		$SLD_X = mouse.pos_x - $obj_base.x - $obj_base.child[03].x	//���̂Q�s�ŁA�X���C�_�����N���b�N�����̏ꏊ�ɃX���C�_���ړ�������@�����������Ă���
		$$sld_pos_set($obj_base,math.limit(00,$SLD_X,$sld_max))		//�I�u�W�F�N�g�̍��W�ړ��݂̂ŁA�p�����^�̕ύX�̓��[�v���Ɉ�C

		$m_diff_x=$obj_base.child[03].x_rep[0]-mouse.pos_x
		while(input.decide.is_down == 1){	//�{�^�������Ă�ԁA�����̃��[�v�𑱂���
			$SLD_X=$$SVX_FIX($m_diff_x,$sld_max)
			$$sld_pos_set($obj_base,$SLD_X)
			$$PRM_SET($obj_base_no,$SLD_X)		//�p�����^�Z�b�g�E�X���C�_�ւ̔��f
			input.next disp
		}
		return
	}

//��������������������������������������������������������
command	$$PRM_SET(		//�z�C�[���ƃX���C�_�ŋ��p����̂ňꌳ��
	property $btn_no : int,
	property $SLD_X : int
	){
		switch($btn_no){
			case(126)	$$automode_wait($SLD_X)	$$PRM_SLD_SET(126)														//�I�[�g���[�h�҂�����
			case(127)	syscom.set_message_speed(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,100]))		$$PRM_SLD_SET(127)	//���b�Z�[�W���x
			case(128)	syscom.set_filter_color_a(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))	$$PRM_SLD_SET(128)	//�l�v���ߓx
			//------------------------------------------------------------
			case(219)	syscom.set_all_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(219)
			case(220)	syscom.set_BGM_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(220)
			case(221)	syscom.set_bgmfade_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))	$$PRM_SLD_SET(221)
			case(222)	syscom.set_KOE_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(222)
			case(223)	syscom.set_PCM_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(223)
			case(224)	syscom.set_SE_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))			$$PRM_SLD_SET(224)
			case(225)	syscom.set_MOV_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))		$$PRM_SLD_SET(225)
			//------------------------------------------------------------
			case(241)	syscom.set_charakoe_volume(001 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(242)	syscom.set_charakoe_volume(002 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(243)	syscom.set_charakoe_volume(003 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(244)	syscom.set_charakoe_volume(004 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(245)	syscom.set_charakoe_volume(005 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(246)	syscom.set_charakoe_volume(006 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
			case(247)	syscom.set_charakoe_volume(007 , math.timetable($SLD_X,0,0,[0,<SL01_MAX>,255]))
//			case(<CCH>+$CV_NO[00])	syscom.set_Charakoe_volume($CV_NO[00],$$F2S($SLD_X,$sld_max))
			}
		return
	}
//��������������������������������������������������������
command $$automode_wait(	//�I�[�g���[�h�̕������x�ƍŏ����Ԃ𓯎����䂷��
	property $prm :int
	){
		syscom.set_auto_mode_moji_wait(math.timetable($prm,0,0,[0,<SL00_MAX>,500]))
		syscom.set_auto_mode_min_wait(math.timetable($prm,0,0,[0,<SL00_MAX>,5000,1]))	//�����^�C�v
		return
	}
//��������������������������������������������������������
//$$CFG_CHR_LOAD($$OBJBTN_SET(<C_OBJ>[$stage].object[26],00,"_cfg_sound_chrbase_jd",0991,0237)
command $$CFG_CHR_LOAD(	//�L�����ʉ��ʐݒ�
	property $obj    : object,
	property $chr_no : int,
	property $file   : str,
	property $btn_no : int
	){
	property $ctmp :intlist[10]		//�ėp�ϐ�
	property $sctmp :strlist[10]	//�ėp������ϐ�

	property $pos_X  : int
	property $pos_Y  : int

	property $SLD_X		//�X���C�_�[�̕␳���W
	property $SLD_Y		//
	property $SLD_B_X	//�X���C�_�[���n�̕␳���W
	property $SLD_B_Y	//

	$pos_X = $cfg_ch_x[$chr_no]
	$pos_Y = $cfg_ch_y[$chr_no]


	$obj.child.resize(6)
	$obj.disp = 1
	$obj.set_pos($pos_X,$pos_Y)

	//�I���E�I�t�� child[04]
	$$OBJBTN_SET($obj.child[04],$file,1, 000,000,255,<SEL0>, $chr_no + 230 ,1,1,0,0,0)
	$obj.child[04].patno = syscom.get_charakoe_onoff($chr_no)*10		//�I���I�t�Ŋ�{�p�^�[���ԍ��ύX
	//------------------------------------------------------------
	$SLD_X	= 005	//�X���C�_�[�̕␳���W
	$SLD_Y	= 240	//
	$obj.child[00].create("_cfg_sound_chr_bar",1,$SLD_X, $SLD_Y,00)															//00_�X���C�_
	$obj.child[01].create("_cfg_sound_chr_bar",1,$SLD_X, $SLD_Y,10)	$obj.child[01].set_src_clip(1,000,000, 000,12)			//01_�X���C�_
	$$OBJBTN_RECT($obj.child[02],1,$SLD_X-15, $SLD_Y-20, <SL01_MAX>+30, 40,<MES_TR>,<SEL0>,$chr_no + 240 ,1,-1)				//02_�X���C�_���n(����)
	$obj.child[03].create("_cfg_sound_chr_sld",1,$SLD_X, $SLD_Y,00)	$obj.child[03].x_rep.resize(1)							//03_�X���C�_(��{�^��)
	$$sld_pos_set($obj,math.timetable(syscom.get_charakoe_volume($chr_no),0,0,[0,255,<SL01_MAX>]))
	//------------------------------------------------------------
	$$OBJBTN_SET($obj.child[05],	"_cfg_sound_chr_preview"		,1, 102,004,255,<SEL0>,$chr_no + 250,1,1,0,0,1)				//�T���v�������Đ�

	//##�V�i���I�i�x�E�L�����ɂ���ĕ\���E��\����؂�ւ��镔��
	if(($chr_no == 03)&&(<cfg_chr> < 1)){	$ctmp[00] = 1 }
	if(($chr_no == 05)&&(<cfg_chr> < 2)){	$ctmp[00] = 1 }
	if(($chr_no == 04)&&(<cfg_chr> < 3)){	$ctmp[00] = 1 }
	if($ctmp[00] ==1){	$obj.disp=0	}

	return
	}


#inc_start

	#property	$s_waip		: int		;��ʐ؂�ւ��̑��x
	#property	$s_midoku	: int		;���Ǖ������X�L�b�v�\�ɂ���
	#property	$s_mestr	: int		;���b�Z�[�W���ߓx
	#property	$s_mwanm	: int		;���b�Z�[�W�E�B���h�E�̊J���̃A�j��
	//���t�̃I���I�t���A��{�ȊO�̍��ڂ́A�O���[�o���ėp�X�C�b�`���g�p�̂��ƁB(�v�g�p�錾)
	#property	$b_posx		: int		;�X���C�_�Ŏg�p�B�{�^���̍��W
	#property	$m_diff_x	: int		;�X���C�_�Ŏg�p�B�}�E�X�ʒu�ƃ{�^���̍��W���i�w�j
	#property	$m_diff_y	: int		;�X���C�_�Ŏg�p�B�}�E�X�ʒu�ƃ{�^���̍��W���i�x�j
	#property	$all_set	: int		;�S�Ă̐ݒ���I�u�W�F�N�g�Ɉ�C�ɔ��f������p�̃t���O
//	#property	$CV_ORG_X	:intlist[<CHR_MAX>]	//�L�����ʉ����p���W�X�g�b�N��{�̍��W������
//	#property	$CV_ORG_Y	:intlist[<CHR_MAX>]	//�L�����ʉ����p���W�X�g�b�N��{�̍��W������
//	#property	$CV_X		:intlist[<CHR_MAX>]	//�L�������ꂼ��̎��ۂɔz�u������W������B��\�����m����ʊO�Ƀg�o�����߂ɁACV_ORG_X�̒��g���X�g�b�N����
//	#property	$CV_Y		:intlist[<CHR_MAX>]	//
//	#property	$CV_NO		:intlist[<CHR_MAX>]	//$CV_NO[�L���������I�u�W�F�N�g�ԍ�] = ������ԍ��@�@-1�������Ă���s�g�p

	#property	$prv_txt	:strlist[50]	//�v���r���[�p��������X�g�b�N
	#property	$prv_max	:int			//�v���r���[�p������̍ő�f�[�^�ԍ��B���̔ԍ�����O�Ɍ������ĕ\�����i�݂܂�
	#property	$config		:int		//�R���t�B�O���j���[�ł̎��s���ǂ����B�O����̏I���m�F�_�C�A���O���ڌĂяo�����Ŏg�p�B
	#property	$old_tab	:int		//���O�܂ŋ����^�u�̔ԍ����X�g�b�N�B�����A�j���̏��������Ɏg�p�B
	#property	$NUM_1MJ	:int		//�I�[�g���[�h�@�P�����̕\������	�O����Q���@�P�����Q��
	#property	$NUM_MIN	:int		//�I�[�g���[�h�@�ŏ��҂�����		�O����Q���@�P�����Q��
	#property	$NUM_SMP	:int		//�I�[�g���[�h�@�P�O�����̕\����	�O����Q���@�P�����Q��
	#property	$CF_WIPE	:int		//�Ăяo���̃��C�v�Ȃ̂��A�����ł̃y�[�W�؂�ւ����C�v�Ȃ̂��̔���B1=�����@$SL_WIPE �Ɠ����g�������Ă�
	#property	$w_mode		:int		//�E�B���h�E���[�h�̃`�F�b�N�p

	#property	$cfg_ch_x	:intlist[10]	//�L�����ʉ�����XY���W
	#property	$cfg_ch_y	:intlist[11]	

	//���p����p�[�c�p�ϐ�
	#property	$F_CHK		:str		//�`�F�b�N�{�b�N�X�p�t�@�C���l�[��
	#property	$F_SLD		:str		//�X���C�_�[�p�t�@�C���l�[��
	#macro	@return if($all_set != 1){ return	}	//�����ǂݍ��݂Ŏg�p�B $all_set=�P �ŃX���[�B����ȊO�Ń��^�[���B

	#DEFINE		<C_OBJ>[		excall.stage[	//�g�p�I�u�W�F�N�g�̒Z�k�w��
	#DEFINE		<MES_TR>		000	//##�`�F�b�N�{�b�N�X�̌��̐������p�B�}�E�X�����͈͂����邽�߂̕��Ȃ̂ōŏI�I�ɂ͂O�ɂ���
	#DEFINE		<SL00_MAX>		686
	#DEFINE		<SL01_MAX>		140	//�L�����ʗp

#inc_end


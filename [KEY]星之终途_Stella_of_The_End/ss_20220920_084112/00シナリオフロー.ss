#Z00

//-----------------------------------------------------------------
// ������
//-----------------------------------------------------------------
@�f�o�b�O�L�[�{�[�h�V���[�g�J�b�g�J�n

// �̌��Ńt���O
<TRIAL> = 0

//-----------------------------------------------------------------
// �{��
//-----------------------------------------------------------------

#z01	set_title("")
farcall("01_STELLA_01_1",00)
farcall("01_STELLA_01_2",00)

// �n�o���[�r�[
$$play_movie(0)

// �v�����[�O���Ō�܂Ō��Ă��Ȃ��ꍇ�̓^�C�g�����j���[��
if( <PURORO> ==  0 )
{
	<PURORO> = 1
	syscom.return_to_menu(@Off, @Off, @Off) 
}

#Z02
farcall("01_STELLA_02_1",00)
farcall("01_STELLA_02_2",00)

#Z03
farcall("01_STELLA_03_1",00)
farcall("01_STELLA_03_2",00)
farcall("01_STELLA_03_3",00)
farcall("01_STELLA_03_4",00)
farcall("01_STELLA_04_1",00)
farcall("01_STELLA_04_2",00)
farcall("01_STELLA_04_3",00)

#Z04	//if( get_title == "" ) { set_title($$get_chapter_title(03)) }		// �`���v�^�[�W�����v�Ń^�C�g���\�L���Ȃ��ꍇ�͐ݒ肷��
farcall("01_STELLA_05_1",00)

#Z05
farcall("01_STELLA_05_2",00)

#Z06
farcall("01_STELLA_05_3",00)

#Z07
farcall("01_STELLA_05_4",00)

#Z08
farcall("01_STELLA_06_1",00)
farcall("01_STELLA_06_2",00)
farcall("01_STELLA_06_3",00)

#Z09
farcall("01_STELLA_06_4",00)
farcall("01_STELLA_06_5",00)
farcall("01_STELLA_06_6",00)
farcall("01_STELLA_06_7",00)
farcall("01_STELLA_07_1",00)

#Z10	//�V�[���̓����Ȃ̂Ńt���O���Ăă��x���֔�΂�
farcall("01_STELLA_07_2",00)
farcall("01_STELLA_07_3",00)
farcall("01_STELLA_07_4",00)
farcall("01_STELLA_07_5",00)

#Z11
farcall("01_STELLA_08_1",00)

#Z12
farcall("01_STELLA_08_2",00)

#Z13
farcall("01_STELLA_08_3",00)
farcall("01_STELLA_08_4",00)
farcall("01_STELLA_08_5",00)

#Z14
farcall("01_STELLA_09_1",00)
farcall("01_STELLA_09_2",00)

#Z15
farcall("01_STELLA_09_3",00)
farcall("01_STELLA_10_1",00)
farcall("01_STELLA_10_2",00)
farcall("01_STELLA_10_3",00)

#Z16
farcall("01_STELLA_11_1",00)
farcall("01_STELLA_11_2",00)

#Z17
farcall("01_STELLA_11_3",00)
farcall("01_STELLA_12_1",00)
farcall("01_STELLA_12_2",00)
farcall("01_STELLA_12_3",00)

#Z18
farcall("01_STELLA_13_1",00)
farcall("01_STELLA_13_2",00)
farcall("01_STELLA_13_3",00)

farcall("01_STELLA_14_1",00)

#Z19	//if( get_title == "" ) { set_title($$get_chapter_title(18)) }		// �`���v�^�[�W�����v�Ń^�C�g���\�L���Ȃ��ꍇ�͐ݒ肷��
farcall("01_STELLA_15_1",00)

#Z20	//�X�^�b�t���[���̓V�[���̓����Ȃ̂Ńt���O���Ăă��x���֔�΂�
farcall("01_STELLA_15_2",00)	// �X�^�b�t���[��
G[220] = 1

#Z21	set_title($$get_chapter_title(20))
farcall("01_STELLA_16_1",00)
G[221] = 1

// �Q�[�����A�t���O
<GAME_CLEAR> = 1

// �^�C�g�����j���[��
syscom.return_to_menu(@Off, @Off, @Off) 


//-----------------------------------------------------------------
// ���[�r�[�Đ�����
//-----------------------------------------------------------------
command $$play_movie(property $movie_no)
{
	// �^�C�g�����󕶎��ɂ���
	set_title("")
	
	// ���[�U�[�����s�\�ɂ���
	$$user_control_disabled
	
	switch( $movie_no ) {
		
		// �n�o���[�r�[
		case(0)
			
			// �n�o���[�r�[�����Ă��Ȃ��ꍇ�̓X�L�b�v�ł��Ȃ�
			if( <OP_MITA> == 0 )
			{
			    mov.play_wait("OP01")
				<OP_MITA> = 1
			}
			else
			{
			    mov.play_wait_key("OP01")
			}
			
			// �n�o��o�^����
			bgmtable.set_listen_by_name(song01, 1)
	}
	
	// ���[�U�[������\�ɂ���
	$$user_control_enabled
}


//-----------------------------------------------------------------
// �̌��ŏI������
//-----------------------------------------------------------------
#z50
#trial_end

// �^�C�g�����󕶎��ɂ���
set_title("")

syscom.set_syscom_menu_disable			// �V�X�e���R�}���h���֎~����
syscom.set_hide_mwnd_enable_flag(0)		// �E�B���h�E���������֎~����
script.set_msg_back_disable				// ���b�Z�[�W�o�b�N���֎~����
script.set_ctrl_skip_disable			// �ꎞ�I�ɑ�������֎~����iCtrl �L�[���܂ށj

syscom.set_auto_mode_onoff_flag(0)			// �I�[�g���[�h����������

@siro_fade(4)

@bgm(bgm02)

// ���i���m�摜

// �I�u�W�F�N�g�쐬
back.object[0].create(_trial_end, 1, 0, 0, 4)	// �w�i
back.object[1].create(_trial_end, 1, 0, 0, 3)	// �L���b�`
back.object[2].create(_trial_end, 1, 0, 0, 2)	// ���S
back.object[3].create(_trial_end, 1, 0, 0, 1)	// ������
back.object[4].create(_trial_end, 1, 0, 0, 0)	// �ڍ�
back.object[5].create(_trial_shop_btn, 1, 452, 980, 0)	// shop�{�^��
back.object[6].create(_trial_title_btn, 1, 988, 980, 0)	// �^�C�g���{�^��

back.object[5].set_button(1, 0, 5, 0)
back.object[6].set_button(2, 0, 5, 0)

// �A�j���[�V����
$$set_image_center(back.object[0])
back.object[0].set_scale(1150, 1150)
back.object[0].scale_x_eve.set(1000, 3000, 0, 2)
back.object[0].scale_y_eve.set(1000, 3000, 0, 2)

back.object[1].x = -100
back.object[1].x_eve.set(0, 1000, 2500, 2)
back.object[1].tr = 0
back.object[1].tr_eve.set(255, 1000, 2500, 1)

back.object[2].tr = 0
back.object[2].tr_eve.set(255, 1000, 3500, 1)

back.object[3].tr = 0
back.object[3].tr_eve.set(255, 1000, 4250, 1)

back.object[4].tr = 0
back.object[4].tr_eve.set(255, 1000, 5500, 0)

back.object[5].y_rep.resize(1)
back.object[5].y_rep[0] = 25
back.object[5].y_rep_eve[0].set(0, 1000, 6500, 2)
back.object[5].tr = 0
back.object[5].tr_eve.set(255, 1000, 6500, 0)

back.object[6].y_rep.resize(1)
back.object[6].y_rep[0] = 25
back.object[6].y_rep_eve[0].set(0, 1000, 6500, 2)
back.object[6].tr = 0
back.object[6].tr_eve.set(255, 1000, 6500, 0)

wipe(0, 2000)

#trial_loop

front.objbtngroup[0].init
front.objbtngroup[0].start

while( 1 )
{
	// �A�j���[�V�����X�L�b�v����
	if( input.decide.on_down_up == 1 || input.cancel.on_down_up == 1 )
	{
		for( L[0] = 0, L[0] < 7, L[0] += 1 )
		{
			if( front.object[L[0]].disp )
			{
				front.object[L[0]].all_eve.end
			}
		}
	}
	
	// �{�^���N���b�N�`�F�b�N
	switch( front.objbtngroup[0].get_decided_no ) {
	case(1)		system.shell_open_web("https://key.visualarts.gr.jp/kinetic/stella/#shopping")
				goto #trial_loop
	case(2)		break
	}
	
	input.next
	disp
}

@bgm_stop(4000)
wipe(0, 2500)

@timewaitkey(2000)

// �̌��ŃN���A�t���O
<TRIAL_CLEAR> = 1

syscom.set_syscom_menu_enable			// �V�X�e���R�}���h��������
syscom.set_hide_mwnd_enable_flag(1)		// �E�B���h�E��������������
script.set_msg_back_enable				// ���b�Z�[�W�o�b�N��������
script.set_ctrl_skip_enable				// �ꎞ�I�ȑ�����̋֎~����������iCtrl �L�[���܂ށj

// �^�C�g�����j���[��
syscom.return_to_menu(@Off, @Off, @Off) 



//-----------------------------------------------------------------
// �f�o�b�O�p�i����N����Ԃɖ߂��j
//-----------------------------------------------------------------
#Z98

<PURORO> = 0
<OP_MITA> = 0
<GAME_CLEAR> = 0
<TRIAL_CLEAR> = 0

@dm("�t���O������N����Ԃɖ߂��܂���")

jump("_00start")


//-----------------------------------------------------------------
// �f�o�b�O�p�i�N���A��Ԃɂ���j
//-----------------------------------------------------------------
#Z99

<PURORO> = 1
<OP_MITA> = 1
<GAME_CLEAR> = 1
<TRIAL_CLEAR> = 1

@dm("�t���O���N���A��Ԃɂ��܂���")

syscom.return_to_menu(@Off, @Off, @Off) 

#Z00

//�_�~�[�t�@�C���F��
//system.check_dummy_file_once("dummy", 168, "xrsvmztcghmw")


//-----------------------------------------------------------------
// �V�X�e���ݒ�
//-----------------------------------------------------------------
syscom.set_hide_mwnd_enable_flag(0)			// �E�B���h�E���������֎~����
syscom.set_syscom_menu_disable				// �V�X�e���R�}���h���֎~����
syscom.set_auto_mode_onoff_flag(0)			// �I�[�g���[�h����������



//-----------------------------------------------------------------
// �f�o�b�O�ݒ�
//-----------------------------------------------------------------
@�f�o�b�O�L�[�{�[�h�V���[�g�J�b�g�J�n



//-----------------------------------------------------------------
// �x�����̕\��
//-----------------------------------------------------------------
pcmch[0].play(se010)

back.object[0].create(_warning, 1)					// �摜
back.object[1].create_movie_loop(ef_warning, 1)		// ���[�r�[
back.object[1].blend = 4
back.object[1].set_scale(2000, 2000)
back.object[1].tr = 180

back.object[0].tr = 0
back.object[0].tr_eve.set(255, 350, 250, 1)
back.object[1].bright = 128
back.object[1].bright_eve.set(0, 350, 0, 1)

back.object[2].create_movie(ef_monitor01_on, 1)

wipe(0, 0)

timewait_key(8000)

front.object[2].create_movie(ef_monitor02_off, 1, auto_free = 0)
pcmch[0].play(se011)
if( script.check_skip == 0 ) {
	front.object[2].wait_movie_key
}

wipe(0, 1500)

pcmch[0].stop(1000)
timewait_key(1000)



//-----------------------------------------------------------------
// ������
//-----------------------------------------------------------------

// �v�����[�O���Ō�܂Ō��Ă��Ȃ��ꍇ�̓^�C�g����ʂł͂Ȃ��{�҂����̂܂܎n�܂�
if( <PURORO> == 0 )
{
	syscom.set_hide_mwnd_enable_flag(1)		// �E�B���h�E��������������
	syscom.set_syscom_menu_enable			// �V�X�e���R�}���h��������
	
	jump("00�V�i���I�t���[")
}



//-----------------------------------------------------------------
// �^�C�g�����j���[��
//-----------------------------------------------------------------
jump("_00menu")

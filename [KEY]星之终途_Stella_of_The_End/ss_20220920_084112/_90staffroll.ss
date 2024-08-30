#inc_start
	
	#replace	<ED_MOVIE_OBJ>		10		// �d�c�Ŏg�p���郀�[�r�[�I�u�W�F�N�g
	#replace	<ED_MOVIE_IMAGE>	11		// �d�c�Ŏg�p����摜�I�u�W�F�N�g
	#replace	<ED_COUNTER>		1		// �d�c�Ŏg�p����J�E���^�[

#inc_end

#z00

command $$staffroll()
{
	property $i
	property $cut_num
	property $scroll_start_time
	property $scroll_end_wait
	property $bgm_end_time
	property $scroll_size_y
	
	$cut_num = 10				// �X�^�b�t���[���摜�̃J�b�g��
	$scroll_start_time = 5200	// �X�^�b�t���[���̃X�N���[���J�n����
	$scroll_end_wait = 11500	// �X�N���[���I�����̑҂�����
	$bgm_end_time = 288000		// �a�f�l�̍Đ�����(bgm 4:48 �� 288000)
	
	// �^�C�g�����󕶎��ɂ���
	set_title("")
	
	// �S�T�E���h��~
	@all_sound_stop(1000)
	
	// ���[�U�[�����s�\�ɂ���
	$$user_control_disabled
	
	// �x����}���邽�߁A�I�u�W�F�N�g�Ƃa�f�l���ǂ�
	for( $i = 0, $i < $cut_num, $i += 1 ) {
		// �t�@�C���l�[���� = �f�t�H���g�l�[�� + ���������Q��(����o�[�W����)�ɂ��Ă��܂�
		back.object[<ED_MOVIE_IMAGE> + $i].create(_staffroll + math.tostr_zero(@check_lang, 2), 1)
		back.object[<ED_MOVIE_IMAGE> + $i].patno = $i
		back.object[<ED_MOVIE_IMAGE> + $i].y = back.object[<ED_MOVIE_IMAGE>].get_size_y * ($i + 1)
		back.object[<ED_MOVIE_IMAGE> + $i].y_rep.resize(1)
	}
	back.object[<ED_MOVIE_OBJ>].create_movie(ED00, 0, 0, 0, ready_only = 1)
	bgm.ready_oneshot(song02)
	
	// �X�N���[���T�C�Y�̌v�Z
	$scroll_size_y = back.object[<ED_MOVIE_IMAGE>].get_size_y * ($cut_num) + (back.object[<ED_MOVIE_IMAGE>].get_size_y - <SCREEN_HEIGHT>)
	
	// �X�^�b�t���[���J�n
	counter[<ED_COUNTER>].start_real
	
	// ���[�r�[�A�a�f�l�Đ��J�n
	for( $i = 0, $i < $cut_num, $i += 1 ) {
		back.object[<ED_MOVIE_IMAGE> + $i].y_rep_eve[0].set(-$scroll_size_y, $bgm_end_time - $scroll_start_time - $scroll_end_wait, $scroll_start_time, 0)
	}
	bgm.resume
	back.object[<ED_MOVIE_OBJ>].disp = 1
	back.object[<ED_MOVIE_OBJ>].resume_movie
	
	wipe(0, 1500)
	
	input.clear
	while(1)
	{
		// �d�c���������Ƃ�����{�Q�b�ȉ��̏ꍇ�̓X�L�b�v�𖳌��ɂ���
		if( <ED_MITA> == 1 && counter[<ED_COUNTER>].get >= 2000 )
		{
			if( input.decide.on_down_up == 1 || input.cancel.on_down_up == 1 )
			{
				break
			}
		}
		
		// (bgm 4:48)288000 - (start_wait + start_wipe)1500 - (end_wait + end_wipe)8000
		if( counter[<ED_COUNTER>].get >= $bgm_end_time - 1500 - 8000)
		{
			break
		}
		
		input.next
		disp
	}
	
	<ED_MITA> = 1
	
	// ���t�F�[�h
	$b_obj_bg.create(bg_siro, 1)
	$b_obj_bg.layer = <LAYER_SYS_EFFECT>
	wipe(0, 8000)
	
	@all_sound_stop(500)
	
	// ���[�U�[������\�ɂ���
	$$user_control_enabled
}

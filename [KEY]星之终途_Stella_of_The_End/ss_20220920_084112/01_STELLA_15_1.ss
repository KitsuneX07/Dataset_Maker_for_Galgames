// #SCENE_SCRIPT_ID = 0049 �i�X�N���v�g�h�c�F���̍s�͍폜������A�ύX�����肵�Ȃ��ŉ������j
#Z00
@STARTSEEN

@�t�B���A�R�[�g�e����

//�����������������������P�T:���̍ĊJR
@bgm(bgm17)
@�A�C�L���b�`(19)


@bg_pan_rl(bg40_01, 4, 35000, 0, -100)	//�����a�f�S�O�F�`�p�{�݁E����R

�����ĊJ�����BR
�܂��͍`�ɍs���A�D�𒲒B���邽�߂ɁBR
����ƃN�����]���A�C�̎c�[�������ǂ��ł����BPAGE

@bg(<DISP_BG>, 3)

KOE(004900009,001)�y�W���[�h�z�u�|��Ă��Ă��ł����ȁvR
@bup(bu_ph10_05)
KOE(004900010,002)�y�t�B���A�z�u�ŋ��������˂��̎q�vPAGE
KOE(004900011,001)�y�W���[�h�z�u�c�c�����������`������@�́A�������т����vR
@bup(bu_ph10_01)
KOE(004900012,002)�y�t�B���A�z�u�S���n��ɖ߂����񂾂낤�ˁvR
KOE(004900013,001)�y�W���[�h�z�u�����������̂Ƃ͒��ǂ������B���܂��ɂ����ł��Ȃ����Ƃ��vR
@bup(bu_ph10_20)
KOE(004900014,002)�y�t�B���A�z�u����B���̃E��������ˁvPAGE

@bs

�ȂǂƂ̂񂫂Ȃ��Ƃ�b���Ă���ƁBPAGE

@bgm_stop(2000)

close
@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@wipe_effects_bg(3)

@�u����(10, 0, 1)
@wipe_effects_bg(0)

KOE(004900018,007)�y�u�����z�u�o���I�@�o���I�vPAGE

�������ĐԂ��̂��o�Ă����BR
����͂ǂ����Ă��N�����]���A�C�֌W�@�������BPAGE

@se(se147)

�ْ�������A�}���Ń��C�t����������BR
�����̏����ȏ����a���A�ʂ����Ēʂ��邩�ǂ����BPAGE

@�V�l�X�R�I��
@bg_set(@blur_off(<DISP_BG>), 1000)
@bup_in_r(bw_ph10_11)
KOE(004900029,002)�y�t�B���A�z�u�҂��đ҂��āA�񕐑������̎q�vR
KOE(004900030,001)�y�W���[�h�z�u�c�c���������A�̓�����Ƃ����Ă��邩�����낤�vPAGE

@bgm(bgm02)

@bup(bu_ph10_20)
KOE(004900031,002)�y�t�B���A�z�u�����������A�����ł����ŁvR
KOE(004900032,001)�y�W���[�h�z�u�����vPAGE

close
@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@wipe_effects_bg(3)

@�u����(11, 0, 2)
@wipe_effects_bg(0)

���^�N�����]���A�C�́A�c�[�̉A�ɉB��Ă��΂炭�x�����Ă������A�₪�Ă��������Ƌߊ���Ă����BR
�c�c�Ȃ�ŁHPAGE

close
@�V�l�X�R�I��
@bg_set(@blur_off(<DISP_BG>), 1000)
@bup(bu_ph10_20, <SET>)
@wipe_effects_bg(3)

KOE(004900037,002)�y�t�B���A�z�u�����q�����q�vPAGE

���肷�肵�Ă���BR
�c�c�Ȃ�ŁHPAGE

close
@se(se106)

@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@�u����(10, 0, 0)
@wipe_effects_bg(3)

KOE(004900042,001)�y�W���[�h�z�u�c�c��͖W�Q���₪��B�����A�Ȃ�͏����������Ȃ荂���\���ȁvR
KOE(004900043,002)�y�t�B���A�z�u���̕��͖W�Q����ĂȂ��񂾂��ǁvPAGE

close
@�V�l�X�R�I��
@bgs_rf(bu_ph10_02)

KOE(004900044,001)�y�W���[�h�z�u�����������B�����͂Ȃ�Ƃ��h�ŁA���܂���_���Ă�͂�����vR
@bup(bu_ph10_05)
KOE(004900045,002)�y�t�B���A�z�u���[���C�W�A�`�h�Q�ˁB�N�����]���A�C�𑢂����BR
@bup(bu_ph10_11)
KOE(004900046,002)�y�t�B���A�z�@indent ����͌��݂ƓG�΂��Ă��킯������A���񂶂�������͓G�Ή������ꂽ�񂶂�Ȃ��H�vR
KOE(004900047,001)�y�W���[�h�z�u�c�c�`�h�Ɉ⍦�̊T�O�͂Ȃ��̂��H�@�c�c�܂��A�Ȃ����vPAGE
@bup(bu_ph10_14)
KOE(004900048,002)�y�t�B���A�z�u�ł��ǂ�����Ēm�����񂾂�vR
KOE(004900049,001)�y�W���[�h�z�u�`�h�Q����i�I�ȑ��݂Ȃ�A�n����̂������b�ƒʐM���ЂƂ܂��͖T�󂵂Ă�̂����ȁB�Â��C���t���x�z���z�[�_�C���낤���ȁBR
KOE(004900050,001)�y�W���[�h�z�@indent ������������L�ӏ���􂢏o���͉̂��߂��K�v�œ�����Ęb���B�l�Ԃ̓��ӕ���ŁA�`�h�̋�蕪�삾�vR
@bup(bu_ph10_05)
KOE(004900051,002)�y�t�B���A�z�u�ł����񂾎��񂾘A�Ă�����������A�������ɂ킩�����񂾂�A�����ƁvR
KOE(004900052,001)�y�W���[�h�z�u�c�c����������b���ł���ȁvR
@bup(bu_ph10_20)
KOE(004900053,002)�y�t�B���A�z�u����������C�ɂ��Ȃ��ł�����vPAGE

close
@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@�u����(10, 0, 1)
@wipe_effects_bg(2)

�t�B���A�̓v�`�N�����]���A�C������グ��BPAGE

close
@�V�l�X�R�I��
@bgs_rf(bu_ph10_20)

KOE(004900057,001)�y�W���[�h�z�u�����A�ǂ�����񂾂����vR
@bup(bu_ph10_01)
KOE(004900058,002)�y�t�B���A�z�u�č\�����ꂽ�΂����ŋ����Ă�B�A��Ă��Ă����悤���ȂƁvR
KOE(004900059,001)�y�W���[�h�z�u�c�c�c�c�{�C�ł��H�vR
@bup(bu_ph10_02)
KOE(004900060,002)�y�t�B���A�z�u�{�C�����ǁH�vR
KOE(004900061,001)�y�W���[�h�z�u�c�c���v�Ȃ̂��H�vR
@bup(bu_ph10_01)
KOE(004900062,002)�y�t�B���A�z�u���̊��o���ƁA���̎q�͂��񂺂���v�����ǁB�ǂ����ȁB�ǂ��v���H�vR
KOE(004900063,001)�y�W���[�h�z�u���ɂ́c�c�Ȃ�Ƃ��c�c�킩���vPAGE

close
@�u��������
@bgs_nf(bw_ph10_01)

���̎q�BR
�����t�B���A�͋@�B�̂��Ƃ�����ȕ��ɌĂԁBR
�{�\�I�ɂ���炪�����ł��邱�Ƃ������Ƃ��Ă����񂾂낤�BR
�t�B���A�̊��o�Ȃ�M���ł���BR
���������C�Ǝv���Ȃ畽�C�Ȃ񂾁BPAGE

close
@bgs_rf(bu_ph10_01)

@bup_wait(bu_ph10_05)
KOE(004900071,002)�y�t�B���A�z�u���Č��ăW���[�h�IR
@bup(bu_ph10_20)
KOE(004900072,002)�y�t�B���A�z�@indent ���C�t���e�H�ׂĂ�B����䂢�vPAGE

@bs_next
close

@se(se067)
@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@�u����(13, 0, 0)
@wipe_effects_bg(3)

�V�����V��������Ă����BPAGE

KOE(004900076,001)�y�W���[�h�z�u�ǂ��������Ƃ��I�C�vPAGE

close
@�V�l�X�R�I��
@bgs_rf(bu_ph10_01)

@bup_wait(bu_ph10_02)
KOE(004900077,002)�y�t�B���A�z�u�������M���c�c�����ɏ����ȘF������񂾂ˁB�ݑ܁vR
KOE(004900078,001)�y�W���[�h�z�u�c�c��������A�̂��H�@�����vR
@bup(bu_ph10_20)
KOE(004900079,002)�y�t�B���A�z�u�V���M�������e�B�}�V��������ˁB���̂��炢�ł��Ȃ��ƂˁvPAGE

���܂ł̏펯���A���𗧂Ăĕ���Ă����C�������BPAGE

KOE(004900083,001)�y�W���[�h�z�u�c�c�n�n�vPAGE

close
@�u��������
@bgs_nf(bw_ph10_20)

�t�B���A�͂������v�Ȃ̂�������Ȃ��BR
�܂Ƃ��ɌP�������Ă��ĂȂ��̂ɁA����Ȃ��Ƃ�������͉̂��������BR
�����͎��ɂ����܂����A���������ɂȂ����BPAGE

close
@bgs_rf(bu_ph10_20)

@bup(bu_ph10_03)
KOE(004900089,002)�y�t�B���A�z�u���O�͂ǂ����悤���ȁB�`�r�ł������vR
KOE(004900090,001)�y�W���[�h�z�u��������񂶂�Ȃ��̂��H�vR
@bup(bu_ph10_11)
KOE(004900091,002)�y�t�B���A�z�u���[�A���Ⴀ�c�c�ǂ�����vR
KOE(004900092,001)�y�W���[�h�z�u�F���Ƃ��Ă̓��@�[�~���I�����߂��ȁvR
@bup(bu_ph10_05)
KOE(004900093,002)�y�t�B���A�z�u�������B�ł������܂ł̊ј\�͂܂��Ȃ��ˁBR
@bup(bu_ph10_01)
KOE(004900094,002)�y�t�B���A�z�@indent ���@�[�~���I���A�C���������̂Ƃ��āA���̂Ƃ��Ău�����N�͂ǂ��H�vR
KOE(004900095,001)�y�W���[�h�z�u�D���ɂ��Ă���vPAGE
@bup(bu_ph10_20)
KOE(004900096,002)�y�t�B���A�z�u�u�����N�A�������Ɨ���H�vR

@�V�l�X�R
@bg_set(@blur_on(<DISP_BG>), 1500)
@�u����(12, 0, 1)
@wipe_effects_bg(2)

KOE(004900097,007)�y�u�����z�u�o���I�vPAGE

@�V�l�X�R�I��

@all_sound_stop(5000)
close
@siro_fade(6)

return

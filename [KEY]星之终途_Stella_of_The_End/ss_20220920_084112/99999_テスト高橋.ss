//===================================================================================
// �N�C�b�N���[�h
//===================================================================================
#z00

syscom.quick_load(0, 0, 0, 0)


//===================================================================================
// �e�X�g
//===================================================================================
#z01

@�f�o�b�O�L�[�{�[�h�V���[�g�J�b�g�J�n

@cg_move(cg_ts01_04, 3, -100, 440, -500, 440, 10000, 0, 2000)

���摜�i�P�X�Q�O���Q�{�jNLI
���d�w�摜������ꍇ�́A�����œǂݍ��ނ悤�ɂ������߁A���̃T���v���X�N���v�g�̉摜�͍r���Ȃ��Ă��܂���R

@cg_move(cg_ts01_04_ex, 3, -100, 440, -500, 440, 10000, 0, 2000)

���摜�i�R�W�S�O�𓙔{�jR

@cg_nowait(CG_TS01_01, 3)

�Ă���R

goto #z01


//-------------------
#z02


�Ă���R

goto #z02

@UI�Ԗ����j�^_��\���A�j���[�V����

�Ă���R

goto #z02

@UI30_�Ԗ����j�^�ɕ\�������E�B����_�\��(bu_wi10_01)

�Ă���R

@UI30_�Ԗ����j�^�ɕ\�������E�B����_��\��

�Ă���R


	front.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie(ef_monitor02_off, 1)
	front.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
	$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 0, 64, 150, 0, 0)
		@se(se054)
	@timewaitkey(250)
	back.object[<OBJ_APP_EF_MONITOR_BG>].create(ef_ui02, 1)
	back.object[<OBJ_APP_EF_MONITOR_BG>].tr = 192
	
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie_loop(ef_monitor01, 1)
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].set_scale(2000, 2000)
	back.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
	@wipe_effects_bg(81)

�Ă���R

		@se(se011)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie(ef_monitor02_off, 1)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
		$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 96, 0, 150, 0, 0)
		@timewaitkey(500)
	@wipe_effects_bg(81)

�Ă���R

goto #z02



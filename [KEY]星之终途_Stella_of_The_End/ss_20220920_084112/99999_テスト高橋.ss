//===================================================================================
// クイックロード
//===================================================================================
#z00

syscom.quick_load(0, 0, 0, 0)


//===================================================================================
// テスト
//===================================================================================
#z01

@デバッグキーボードショートカット開始

@cg_move(cg_ts01_04, 3, -100, 440, -500, 440, 10000, 0, 2000)

元画像（１９２０を２倍）NLI
※ＥＸ画像がある場合は、自動で読み込むようにしたため、このサンプルスクリプトの画像は荒くなっていませんR

@cg_move(cg_ts01_04_ex, 3, -100, 440, -500, 440, 10000, 0, 2000)

元画像（３８４０を等倍）R

@cg_nowait(CG_TS01_01, 3)

てすとR

goto #z01


//-------------------
#z02


てすとR

goto #z02

@UI網膜モニタ_非表示アニメーション

てすとR

goto #z02

@UI30_網膜モニタに表示されるウィレム_表示(bu_wi10_01)

てすとR

@UI30_網膜モニタに表示されるウィレム_非表示

てすとR


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

てすとR

		@se(se011)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].create_movie(ef_monitor02_off, 1)
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].blend = 1
		front.object[<OBJ_APP_EF_MONITOR_PANEL>].layer = <LAYER_SYS_EFFECT> - 1
		$$set_bright_eve(front.object[<OBJ_APP_EF_MONITOR_PANEL>], 96, 0, 150, 0, 0)
		@timewaitkey(500)
	@wipe_effects_bg(81)

てすとR

goto #z02



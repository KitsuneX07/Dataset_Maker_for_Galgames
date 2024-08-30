#Z00

//ダミーファイル認証
//system.check_dummy_file_once("dummy", 168, "xrsvmztcghmw")


//-----------------------------------------------------------------
// システム設定
//-----------------------------------------------------------------
syscom.set_hide_mwnd_enable_flag(0)			// ウィンドウを消すを禁止する
syscom.set_syscom_menu_disable				// システムコマンドを禁止する
syscom.set_auto_mode_onoff_flag(0)			// オートモードを解除する



//-----------------------------------------------------------------
// デバッグ設定
//-----------------------------------------------------------------
@デバッグキーボードショートカット開始



//-----------------------------------------------------------------
// 警告文の表示
//-----------------------------------------------------------------
pcmch[0].play(se010)

back.object[0].create(_warning, 1)					// 画像
back.object[1].create_movie_loop(ef_warning, 1)		// ムービー
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
// 初期化
//-----------------------------------------------------------------

// プロローグを最後まで見ていない場合はタイトル画面ではなく本編がそのまま始まる
if( <PURORO> == 0 )
{
	syscom.set_hide_mwnd_enable_flag(1)		// ウィンドウを消すを許可する
	syscom.set_syscom_menu_enable			// システムコマンドを許可する
	
	jump("00シナリオフロー")
}



//-----------------------------------------------------------------
// タイトルメニューへ
//-----------------------------------------------------------------
jump("_00menu")

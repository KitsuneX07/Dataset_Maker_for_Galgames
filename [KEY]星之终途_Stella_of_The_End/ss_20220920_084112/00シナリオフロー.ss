#Z00

//-----------------------------------------------------------------
// 初期化
//-----------------------------------------------------------------
@デバッグキーボードショートカット開始

// 体験版フラグ
<TRIAL> = 0

//-----------------------------------------------------------------
// 本編
//-----------------------------------------------------------------

#z01	set_title("")
farcall("01_STELLA_01_1",00)
farcall("01_STELLA_01_2",00)

// ＯＰムービー
$$play_movie(0)

// プロローグを最後まで見ていない場合はタイトルメニューへ
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

#Z04	//if( get_title == "" ) { set_title($$get_chapter_title(03)) }		// チャプタージャンプでタイトル表記がない場合は設定する
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

#Z10	//シーンの内部なのでフラグ立ててラベルへ飛ばす
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

#Z19	//if( get_title == "" ) { set_title($$get_chapter_title(18)) }		// チャプタージャンプでタイトル表記がない場合は設定する
farcall("01_STELLA_15_1",00)

#Z20	//スタッフロールはシーンの内部なのでフラグ立ててラベルへ飛ばす
farcall("01_STELLA_15_2",00)	// スタッフロール
G[220] = 1

#Z21	set_title($$get_chapter_title(20))
farcall("01_STELLA_16_1",00)
G[221] = 1

// ゲームリアフラグ
<GAME_CLEAR> = 1

// タイトルメニューへ
syscom.return_to_menu(@Off, @Off, @Off) 


//-----------------------------------------------------------------
// ムービー再生処理
//-----------------------------------------------------------------
command $$play_movie(property $movie_no)
{
	// タイトルを空文字にする
	set_title("")
	
	// ユーザー制御を不可能にする
	$$user_control_disabled
	
	switch( $movie_no ) {
		
		// ＯＰムービー
		case(0)
			
			// ＯＰムービーを見ていない場合はスキップできない
			if( <OP_MITA> == 0 )
			{
			    mov.play_wait("OP01")
				<OP_MITA> = 1
			}
			else
			{
			    mov.play_wait_key("OP01")
			}
			
			// ＯＰを登録する
			bgmtable.set_listen_by_name(song01, 1)
	}
	
	// ユーザー制御を可能にする
	$$user_control_enabled
}


//-----------------------------------------------------------------
// 体験版終了処理
//-----------------------------------------------------------------
#z50
#trial_end

// タイトルを空文字にする
set_title("")

syscom.set_syscom_menu_disable			// システムコマンドを禁止する
syscom.set_hide_mwnd_enable_flag(0)		// ウィンドウを消すを禁止する
script.set_msg_back_disable				// メッセージバックを禁止する
script.set_ctrl_skip_disable			// 一時的に早送りを禁止する（Ctrl キーを含む）

syscom.set_auto_mode_onoff_flag(0)			// オートモードを解除する

@siro_fade(4)

@bgm(bgm02)

// 製品告知画像

// オブジェクト作成
back.object[0].create(_trial_end, 1, 0, 0, 4)	// 背景
back.object[1].create(_trial_end, 1, 0, 0, 3)	// キャッチ
back.object[2].create(_trial_end, 1, 0, 0, 2)	// ロゴ
back.object[3].create(_trial_end, 1, 0, 0, 1)	// 発売日
back.object[4].create(_trial_end, 1, 0, 0, 0)	// 詳細
back.object[5].create(_trial_shop_btn, 1, 452, 980, 0)	// shopボタン
back.object[6].create(_trial_title_btn, 1, 988, 980, 0)	// タイトルボタン

back.object[5].set_button(1, 0, 5, 0)
back.object[6].set_button(2, 0, 5, 0)

// アニメーション
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
	// アニメーションスキップ判定
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
	
	// ボタンクリックチェック
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

// 体験版クリアフラグ
<TRIAL_CLEAR> = 1

syscom.set_syscom_menu_enable			// システムコマンドを許可する
syscom.set_hide_mwnd_enable_flag(1)		// ウィンドウを消すを許可する
script.set_msg_back_enable				// メッセージバックを許可する
script.set_ctrl_skip_enable				// 一時的な早送りの禁止を解除する（Ctrl キーを含む）

// タイトルメニューへ
syscom.return_to_menu(@Off, @Off, @Off) 



//-----------------------------------------------------------------
// デバッグ用（初回起動状態に戻す）
//-----------------------------------------------------------------
#Z98

<PURORO> = 0
<OP_MITA> = 0
<GAME_CLEAR> = 0
<TRIAL_CLEAR> = 0

@dm("フラグを初回起動状態に戻しました")

jump("_00start")


//-----------------------------------------------------------------
// デバッグ用（クリア状態にする）
//-----------------------------------------------------------------
#Z99

<PURORO> = 1
<OP_MITA> = 1
<GAME_CLEAR> = 1
<TRIAL_CLEAR> = 1

@dm("フラグをクリア状態にしました")

syscom.return_to_menu(@Off, @Off, @Off) 

#inc_start
	
	#replace	<ED_MOVIE_OBJ>		10		// ＥＤで使用するムービーオブジェクト
	#replace	<ED_MOVIE_IMAGE>	11		// ＥＤで使用する画像オブジェクト
	#replace	<ED_COUNTER>		1		// ＥＤで使用するカウンター

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
	
	$cut_num = 10				// スタッフロール画像のカット数
	$scroll_start_time = 5200	// スタッフロールのスクロール開始時間
	$scroll_end_wait = 11500	// スクロール終了時の待ち時間
	$bgm_end_time = 288000		// ＢＧＭの再生時間(bgm 4:48 → 288000)
	
	// タイトルを空文字にする
	set_title("")
	
	// 全サウンド停止
	@all_sound_stop(1000)
	
	// ユーザー制御を不可能にする
	$$user_control_disabled
	
	// 遅延を抑えるため、オブジェクトとＢＧＭを先読み
	for( $i = 0, $i < $cut_num, $i += 1 ) {
		// ファイルネームは = デフォルトネーム + 末尾数字２桁(言語バージョン)にしています
		back.object[<ED_MOVIE_IMAGE> + $i].create(_staffroll + math.tostr_zero(@check_lang, 2), 1)
		back.object[<ED_MOVIE_IMAGE> + $i].patno = $i
		back.object[<ED_MOVIE_IMAGE> + $i].y = back.object[<ED_MOVIE_IMAGE>].get_size_y * ($i + 1)
		back.object[<ED_MOVIE_IMAGE> + $i].y_rep.resize(1)
	}
	back.object[<ED_MOVIE_OBJ>].create_movie(ED00, 0, 0, 0, ready_only = 1)
	bgm.ready_oneshot(song02)
	
	// スクロールサイズの計算
	$scroll_size_y = back.object[<ED_MOVIE_IMAGE>].get_size_y * ($cut_num) + (back.object[<ED_MOVIE_IMAGE>].get_size_y - <SCREEN_HEIGHT>)
	
	// スタッフロール開始
	counter[<ED_COUNTER>].start_real
	
	// ムービー、ＢＧＭ再生開始
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
		// ＥＤを見たことがある＋２秒以下の場合はスキップを無効にする
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
	
	// 白フェード
	$b_obj_bg.create(bg_siro, 1)
	$b_obj_bg.layer = <LAYER_SYS_EFFECT>
	wipe(0, 8000)
	
	@all_sound_stop(500)
	
	// ユーザー制御を可能にする
	$$user_control_enabled
}

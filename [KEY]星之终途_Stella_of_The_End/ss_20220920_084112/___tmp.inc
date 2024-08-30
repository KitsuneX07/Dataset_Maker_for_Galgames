
// とりあえず、コンパイルに必要そうなマクロを一時的においてます。
// とりあえず、簡単な命令しか書いていないので調整して別ファイルに実装していただければ…。

#macro	@STARTSEEN
	@デバッグキーボードショートカット開始
	// 服装初期化
	@ジュードデフォ
	@フィリアデフォ
	@デリラデフォ

// 立ち絵消去 @bup_del? 
// 本編中はgrepしやすいように@bsのまま残してます
#macro	@bs(@wipe_no(0))
	$$wipe_copy_set(0)
	$$wipe_prm_set(@wipe_no,<WIPE_CH>,0)
	$$WIPE_EXEC(0)

#macro	@bs_next
	$$wipe_copy_set(0)
	//@bs
	
#macro	@bup_x(@filename, @wipe(0), @pos_x(<POS_C>))
	$bup_px = $$pos_convert_x(@pos_x)
	farcall("_00bup",0,@filename,@wipe,1)

// サウンド
#macro	@bgm(@filename, @fade_in_time(0), @fade_out_time(0))
	bgm.play(@filename, @fade_in_time, @fade_out_time)

#macro	@bgm_stop(@time(-1))
	bgm.stop(@time)

#macro	@bgm_pause(@time(1000))
	bgm.pause(@time)

#macro	@bgm_resume(@time(1000))
	bgm.resume(@time)

#macro	@bgm_set_volume(@volume, @time(-1))
	bgm.set_volume(@volume, @time)

#macro	@bgm_set_volume_max(@time(-1))
	bgm.set_volume_max(@time)

#macro	@se(@filename, @ch(0), @time(0))
	pcmch[@ch].play(@filename, @time)

#macro	@se_wait_key(@filename, @ch(0), @time(0))
	pcmch[@ch].play(@filename, @time)
	pcmch[@ch].wait_key

#macro	@se_stop(@time(0), @ch(0))
	pcmch[@ch].stop(@time)

#macro	@se_loop(@filename, @ch(1), @time(0))
	pcmch[@ch].play(@filename, @time, loop = 1)

#macro	@se_set_volume(@volume, @ch(0), @time(-1))
	pcmch[@ch].set_volume(@volume, @time)

#macro	@se_set_volume_max(@ch(0), @time(-1))
	pcmch[@ch].set_volume_max(@time)

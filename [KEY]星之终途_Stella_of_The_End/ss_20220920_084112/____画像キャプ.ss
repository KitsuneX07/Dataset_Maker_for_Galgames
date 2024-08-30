#inc_start

	//↓キャプチャ用
	#define	@CAP	set_title($CG_FILE)	syscom.capture_and_save_buffer_to_png(000, 000,$CG_FILE)	timewait(500)

#inc_end

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z00

return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z200	//画面キャプ作業場
		//セーブ用のファイルネーム構築
		//system.get_calendar($year, $month, $day, $weekday, $hour, $minute, $second, $millsecond)
//		system.get_calendar(L[01],L[02],L[03],L[00],L[04],L[05],L[06],L[07])
//		K[00]= math.tostr(L[01])+math.tostr(L[02])+math.tostr(L[03])+math.tostr(L[04])+math.tostr(L[05])+math.tostr(L[06])+math.tostr(L[07])
		syscom.create_capture_buffer(1920, 1080)	//キャプチャバッファ確保
//##ここでキャプチャしたいものを表示→キャプ→キー待ち
//@CG(CG_MR09_0111	)	@CAP
@CG(BG02)	@CAP
//@CG(BG16)	@CAP
//@CG(BG17)	@CAP
//@CG(BG64)	@CAP
//@CG(BG65)	@CAP
//@CG(BG66)	@CAP
//@CG(CG_TS31)	@CAP

/*
@CG(CG_TS86)	@CAP
@CG(CG_TS01_01)	@CAP
@CG(CG_TS02)	@CAP
@CG(CG_TS03_01)	@CAP
@CG(CG_TS04_01)	@CAP
@CG(CG_TS05)	@CAP
@CG(CG_TS06_01)	@CAP
@CG(CG_TS07)	@CAP
@CG(CG_TS08)	@CAP
@CG(CG_TS09_01)	@CAP
@CG(CG_TS10)	@CAP
@CG(CG_TS11)	@CAP
@CG(CG_TS12)	@CAP
@CG(CG_TS13)	@CAP
@CG(CG_TS14)	@CAP
@CG(CG_TS15)	@CAP
@CG(CG_TS16)	@CAP
@CG(CG_TS17)	@CAP
@CG(CG_TS18)	@CAP
@CG(CG_TS19)	@CAP
@CG(CG_TS20)	@CAP
@CG(CG_TS21)	@CAP
@CG(CG_TS22)	@CAP
@CG(CG_TS23)	@CAP
@CG(CG_TS24)	@CAP
@CG(CG_TS25)	@CAP
@CG(CG_TS26)	@CAP
@CG(CG_TS27)	@CAP
@CG(CG_TS28_01)	@CAP
@CG(CG_TS29)	@CAP
@CG(CG_TS30_01)	@CAP
@CG(CG_TS31)	@CAP
@CG(CG_TS32)	@CAP
@CG(cg_ts33)	@CAP
@CG(CG_TS34)	@CAP
@CG(CG_TS35)	@CAP
@CG(CG_TS36)	@CAP
@CG(CG_TS37)	@CAP
@CG(CG_TS38)	@CAP
@CG(CG_TS39)	@CAP
@CG(CG_TS40_01)	@CAP
@CG(CG_TS41)	@CAP
@CG(CG_TS42)	@CAP
@CG(CG_TS43)	@CAP
@CG(CG_TS44)	@CAP
@CG(CG_TS45)	@CAP
@CG(CG_TS46)	@CAP
@CG(CG_TS47)	@CAP
@CG(CG_TS48)	@CAP
@CG(CG_TS49)	@CAP
@CG(CG_TS50)	@CAP
@CG(CG_TS51)	@CAP
@CG(CG_TS52)	@CAP
@CG(CG_TS53)	@CAP
@CG(CG_TS54)	@CAP
@CG(CG_TS55)	@CAP
@CG(CG_TS56)	@CAP
@CG(CG_TS57)	@CAP
@CG(CG_TS58)	@CAP
@CG(CG_TS59)	@CAP
@CG(CG_TS60)	@CAP
@CG(CG_TS61)	@CAP
@CG(CG_TS62)	@CAP
@CG(CG_TS63)	@CAP
@CG(CG_TS64_01)	@CAP
@CG(CG_TS65)	@CAP
@CG(CG_TS66)	@CAP
@CG(CG_TS67)	@CAP
@CG(CG_TS68)	@CAP
@CG(CG_TS69)	@CAP
@CG(CG_TS70)	@CAP
@CG(CG_TS71)	@CAP
@CG(CG_TS72)	@CAP
@CG(CG_TS73)	@CAP
@CG(CG_TS74)	@CAP
@CG(CG_TS75)	@CAP
@CG(CG_TS76)	@CAP
@CG(CG_TS78)	@CAP
@CG(CG_TS79)	@CAP
@CG(CG_TS80)	@CAP
@CG(CG_TS81)	@CAP
@CG(CG_TS82)	@CAP
@CG(CG_TS83)	@CAP
@CG(CG_TS84)	@CAP
@CG(CG_TS85)	@CAP
@CG(CG_TS87)	@CAP
@CG(CG_TS88)	@CAP
@CG(CG_TS89)	@CAP
@CG(CG_TS90)	@CAP
@CG(CG_TS91)	@CAP
@CG(CG_TS92)	@CAP
@CG(CG_TS93)	@CAP
@CG(CG_TS94)	@CAP
@CG(CG_TS95)	@CAP
@CG(CG_TS96)	@CAP
@CG(CG_TS97)	@CAP
*/
	timewait(4000)
	キャプチャ終了。r
goto #Z200


		
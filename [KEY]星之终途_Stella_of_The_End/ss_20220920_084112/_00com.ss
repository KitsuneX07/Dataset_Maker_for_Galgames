#z00

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//引数を１⇔０するコマンド　他の数値が入ってきたときは符号反転
command $$toggle(property $a :int) : int
{
	if(($a==1)||($a==0)){	//１か０が入っていた場合
		return(math.abs($a-1))		// １⇔０ の結果を戻り値として代入
	}else{					//それ以外が入っていた場合
		return($a * -1)				//符号を反転させた結果を戻り値とする
	}
}

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//最大値・最小値を指定して、その中でインクリメントを続けるマクロ
//最大値を越えると最小値にループする
//このマクロを呼び出した時点でインクリメントされます。
//	戻り値＝$$loop_inc(最小値,対象フラグ,最大値)
command	$$loop_inc(property $min : int, property $flag : int, property $max : int):int
{
	$flag+=1
	if(($flag > $max)||($flag < $min)){ $flag=$min }
	return($flag)	//戻り値引渡し
}

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//最大値・最小値を指定して、その中でデクリメントを続けるマクロ
//最小値を下回ると最大値にループする。
//このマクロをロードした時点でデクリメントされます。
//  戻り値＝$$loop_dec(最小値,対象フラグ,最大値)
command	$$loop_dec(property $min : int ,property $flag : int, property $max : int):int
{
	$flag-=1
	if(($flag < $min)||($flag > $max)){ $flag=$max }
	return($flag)	//戻り値引渡し
}


//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//指定されたオブジェクトを 表→裏 でコピーするだけのコマンド
command $$objcopy(property $obj :int)
{
	back.object[$obj].create_copy_from(front.object[$obj])
}

//## *************************************************************
//## システムコールの準備と解放用コマンド
//## =============================================================
command $$excall_ready(property $w_close :int )	//システムコール準備
{
	$excall = excall.check_alloc	//■Ｅｘコール状態の取得
	IF($excall==1){return}			//■既にＥｘコール中だったら抜け
	excall.alloc								// システムコールを準備する
	excall.f[0] = script.get_mwnd_disp_off_flag	// 「メッセージウィンドウを消す」の状態を取得
	excall.f[1] = script.get_quake_stop_flag	// 「クエイクを止める」の状態を取得
	script.set_mwnd_disp_off_flag($w_close)		// メッセージウィンドウを消すかどうか　１＝消す
	script.set_quake_stop_flag(1)				// クエイクを止める
	script.set_time_stop_flag(1)				// 全ての動作を止める
	return
}

command $$excall_free	//システムコール開放
{
	$excall = excall.check_alloc	//■Ｅｘコール状態の取得
	IF($excall==0){return}			//■既にＥｘコール解除済だったら抜け
	script.set_quake_stop_flag(excall.f[1])		// 「クエイクを止める」の状態を元に戻す
	script.set_mwnd_disp_off_flag(excall.f[0])	// 「メッセージウィンドウを消す」の状態を元に戻す
	script.set_time_stop_flag(0)				// 全ての動作を再開する
	excall.free									// システムコールを解放する
}

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//バストアップとして使用している [1]～[<BUP_MAX>] に対して一括でワイプコピーフラグをオン・オフする
command $$wipe_copy_set(property $wipe_copy_flag :int)
{
	FOR($tmp[00] = <BUP_MIN>, $tmp[00] <= <BUP_MAX> , $tmp[00]+=1){		//キャラ用オブジェクトの予約番号は<BUP_MIN>～<BUP_MAX>
		front.object[$tmp[00]].wipe_copy = $wipe_copy_flag
	}
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//##指定オブジェクトの下に子オブジェクトを指定数作るコマンド。親は初期化される。
command $$create_child(
	property $obj :object,		//親となるオブジェクト
	property $disp,				//表示状態
	property $cnt				//子の数
)
{
		$obj.init				//■■子供オブジェクト予約開始
		$obj.disp = $disp		//表示指定
		$obj.child.resize($cnt)	//子作り数宣言
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$mw_btn_00
{
	farcall("_00cancel",01)
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//オブジェクトの修正座標をＸＹ同時に予約するコマンド
command $$obj_rep_xy(
	property $obj :object,	//対象オブジェクト
	property $x_cnt :int,	//Ｘ修正座標の作成数
	property $y_cnt	:int	//Ｙ修正座標の作成数
	)
{
	$obj.x_rep.resize($x_cnt)
	$obj.y_rep.resize($y_cnt)
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$AUTO_SAVE(
	property $disp :int	//■Autosaveしました　の表記の表示・非表示。未使用
)
{
	property $ctmp :intlist[10]
	$ctmp[00] = syscom.get_quick_save_new_no
	$ctmp[00] = $$loop_inc(1,$ctmp[00],8)
	capture					//##セーブサムネ用キャプチャ
	syscom.quick_save($ctmp[00] , 0, 0)	//ワーニング・ＳＥなし。
}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command $$CFG_CHR(property $CFG_CHR :int)		//コンフィグ・サウンドのキャラ別音声開放用
{
	if(<CFG_CHR> < $CFG_CHR){	//指定値以下のときの通った場合のみ指定値に。
		<CFG_CHR> = $CFG_CHR
	}
	return
}



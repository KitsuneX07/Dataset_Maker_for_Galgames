//エクステンションデータチェック・バストアップ修正座標セット
#inc_start
	#property	$bupEX	:strlist[5]		//指定の必要部を別々にストックする為の変数

	//$$Bup_Rep_set で引数省略をさせる為のラッパーマクロ
	#macro @Bup_Rep_Set(@1dir,@1X,@1Y,@2dir(-1),@2X(000),@2Y(000),@3dir(-1),@3X(000),@3Y(000),@4dir(-1),@4X(000),@4Y(000),@5dir(-1),@5X(000),@5Y(000),@6dir(-1),@6X(000),@6Y(000))
			$$Bup_Rep_Set(	@1dir,@1X,@1Y,
							@2dir,@2X,@2Y,
							@3dir,@3X,@3Y,
							@4dir,@4X,@4Y,
							@5dir,@5X,@5Y,
							@6dir,@6X,@6Y)

	//$$Fup_Rep_set で引数省略をさせる為のラッパーマクロ
	#macro @Fup_Rep_Set(@1dir,@1X,@1Y,@1S,@2dir(-1),@2X(000),@2Y(000),@2S(1000),@3dir(-1),@3X(000),@3Y(000),@3S(1000),@4dir(-1),@4X(000),@4Y(000),@4S(1000),@5dir(-1),@5X(000),@5Y(000),@5S(1000),@6dir(-1),@6X(000),@6Y(000),@6S(1000))
			$$Fup_Rep_Set(	@1dir,@1X,@1Y,@1S,
							@2dir,@2X,@2Y,@2S,
							@3dir,@3X,@3Y,@3S,
							@4dir,@4X,@4Y,@4S,
							@5dir,@5X,@5Y,@5S,
							@6dir,@6X,@6Y,@6S)

#inc_end
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■

#Z00	////エクステンション用ファイル指定チェックと読み込み・パターン番号も。
	$bup_exte =""		//変数初期化
	$bup_exte_num =0	//変数初期化
	// $bup_spec に入ってくる「BS_BT01_0203」のような指定の必要分を拾っておく。判定に使ったり代入のベースにしたり
	$bupEX[00] = $bup_spec.left(3)			//BS_BT01_0203 → BS_
	$bupEX[02] = $bup_spec.mid(3,4)			//BS_BT01_0203 → BT01
	$bupEX[03] = $bup_spec.left(7)			//BS_BT01_0203 → BS_BT01
	$bupEX[04] = $bup_spec.mid(8,2)			//BS_BT01_0203 → 02

	farcall("_00bupsub",$chr_num)	//キャラ番号のＺラベルに飛ばす

	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	IF($bup_exte != ""){	//追加指定にファイル名が入っていたら座標（固定値）とパターン番号を追加する
		$bup_exte = "|"+$bup_exte+"("+math.tostr(<BUP_set_X>)+","+math.tostr(<BUP_set_Y>)+","+math.tostr($bup_exte_num)+")"
	}
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//バストアップ追加読み込み指定部
//Ｚラベル＝キャラ番号
#Z01	//真鈴
	return

#Z02	//友加里
	return

#Z03	//真子	記述例としてコメントアウトしておきます。
//	IF(<MG_PK>==1){		//眼鏡アリのとき
//		$bup_exte = $bupEX[00] + "PK10_megane"	$bup_exte_num = 0	//←眼鏡のみ。指があれば↓で上書きされる
//		IF($bupEX[02]=="PK31"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}	//顔にかかる手＋メガネ
//		IF($bupEX[02]=="PK41"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}
//		IF($bupEX[02]=="PK51"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}
//	}ELSE{				//眼鏡ナシのとき
//		IF($bupEX[02]=="PK31"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}	//顔にかかる手
//		IF($bupEX[02]=="PK41"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}
//		IF($bupEX[02]=="PK51"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}
//	}
	return

#Z04	//レオン
	return

#Z05	//国丸
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z110	//顔ＣＧ
	gosub #Z120	//補正値セット部
	return	//

#Z111	//通常バストアップ
	gosub #Z121	//補正値セット部
	gosub #Z119	//セット実行部
	return

#Z112	//近接バストアップ
	gosub #Z122	//補正値セット部
	gosub #Z119	//セット実行部
	return

#Z113	//近接バストアップ
	gosub #Z123	//補正値セット部
	gosub #Z119	//セット実行部
	return


#Z119	//修正座標代入部
	//##キャラ別の座標修正部分
	//修正座標０番は基本修正に使用。
	//修正座標１番はバストアップエフェクト用（ピョンピョンとかビクンとか）
	//修正座標２番シナリオ上での位置修正用。スクロールもこれで行う。
	//修正座標３番は移動表示をするときに使用。終了時に数値が０になるようにすること。
		//※ここでは０番と２番の設定を行う。
	$$obj_rep_xy(stage[0].object[$chr_num],4,4)	//揺らし用として y_rep と x_rep を４つずつ確保
	stage[0].object[$chr_num].x_rep[0]=$bup_Xrep			//０番　基本修正用
	stage[0].object[$chr_num].y_rep[0]=$bup_Yrep			

//system.debug_messagebox_ok($bup_Xrep)	//デバッグメッセージ

//	stage[$stage].object[$chr_num].x_rep[2]=$reppos_x[$chr_num]	//２番　シナリオ上位置修正用
//	stage[$stage].object[$chr_num].y_rep[2]=$reppos_y[$chr_num]	
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z120	//##顔ＣＧのＸ補正・Ｙ補正・縮小率をセット
/*
	switch($bup_spec.mid( 3,2)){
//	1,150,-160,900 = 向き番号 , Ｘ補正値 , Ｙ補正値 , 縮小率
//	↑データ書式
//									1中学正面			2中学ななめ			5学園正面			6学園ななめ
		case("BT")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		3,150,-160,900,		4,150,-160,900,	5,150,-160,900,		6,150,-160,900)		//ベスリー
		case("HN")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//雛多
		case("NS")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//椛
		case("MZ")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//瑞羽
		case("MU")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//雪月
	}
*/
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z121	//##補正値セット（ＢＳ）
	switch($bup_spec.mid( 3,2)){
	//データ書式：					1,000,000 = ポーズ番号 , Ｘ補正値 , Ｙ補正値
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//ジュード
		case("PH")	@Bup_Rep_Set(	1,-050, 000		)		//フィリア
		default		@Bup_Rep_Set(	1, 000, 000		)		//指定なし
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//雪月
	}

	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z122	//##補正値セット（ＢＵ）
	switch($bup_spec.mid( 3,2)){
	//データ書式：					1,000,000 = ポーズ番号 , Ｘ補正値 , Ｙ補正値
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//ジュード
		case("PH")	@Bup_Rep_Set(	1,-100, 000		)		//フィリア
		default		@Bup_Rep_Set(	1, 000, 000		)		//指定なし
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//雪月
	}
	return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z123	//##補正値セット（ＢＷ）
	switch($bup_spec.mid( 3,2)){
	//データ書式：					1,000,000 = ポーズ番号 , Ｘ補正値 , Ｙ補正値
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//ジュード
		case("PH")	@Bup_Rep_Set(	1,-100, 000		)		//フィリア
		default		@Bup_Rep_Set(	1, 000, 000		)		//指定なし
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//雪月
	}
	return


//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z30	//@bup_area_set	ＴＶ電話用バストアップ範囲制限マクロ数値セット部
	//表示基点座標	2x3（キャラのセンター・Ｌ・Ｒ位置）
	//表示範囲		4
	//縮小率		1
	//基本レイヤ値	1		計12フラグが必要
/*
	IF(L[00]==-1){	//ユーザーモードでのスマホのオープン可否をセット
		IF(<SMH_USER_STOCK> ==1 ){$SMH_USER=1 <SMH_USER_STOCK>=0 }	//解禁
	}ELSE{
		<SMH_USER_STOCK> = $SMH_USER | <SMH_USER_STOCK>		//スマホ不可
		$SMH_USER=0
	}


switch(L[00]){
	case(-1)	$bup_area_set.init	$bup_area.init	
				stage[1].object[<O_CGB>].wipe_copy=0 stage[1].object[<O_CGM>].wipe_copy=0	//引数が-1の場合はキャラ用フラグ共々初期化
				stage[0].object[<O_CGB>].wipe_copy=0 stage[0].object[<O_CGM>].wipe_copy=0	//引数が-1の場合はキャラ用フラグ共々初期化
//										Cx,Cy,		Lx,Ly,		Rx,Ry,		ALx,ALy,ARx,ARy,	zoom,	rep_Layer
	case(00)	$bup_area_set.sets(0,	1084,290,	985,290,	1182,290,	925,108,1242,584,	800,	100)		//スマホ内表示用
}
*/
return

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z31	//@BUP_AREA_parts		//ＴＶ電話用パーツ群一括セット部
	//K[00]	ファイルネーム
	//L[00]	stage指定
	//L[01] 使用オブジェクト
	//L[02] レイヤ値
	//L[03]	x座標
	//L[04]	y座標
	//L[05]	パターン番号

	stage[L[00]].object[L[01]].create(K[00],1,L[03],L[04],L[05])
	stage[L[00]].object[L[01]].Layer = L[02]
	stage[L[00]].object[L[01]].wipe_copy = 1

return
/*
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#Z32	//@BUP_AREA_COVER(@cover_name,@stage)	//ＴＶ電話用カバー（スマホのフレーム）
	//K[00]	ファイルネーム
	//L[00]	stage指定
	//L[01]	x座標
	//L[02]	y座標
	//本編では使用しないＣＧモード用のオブジェクトを利用
	//XY座標が省略値だったら、表示領域の基点を使う

	stage[L[00]].object[<O_CGM>].create(K[00],1,$bup_area_set[06],$bup_area_set[07])
	stage[L[00]].object[<O_CGM>].Layer = $bup_area_set[13]
	stage[L[00]].object[<O_CGM>].wipe_copy = 1
return
*/
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$Bup_Rep_Set(	//バストアップ補正座標を一括セットするコマンド
	property $1dir :int, property $1X :int, property $1Y :int,
	property $2dir :int, property $2X :int, property $2Y :int,
	property $3dir :int, property $3X :int, property $3Y :int,
	property $4dir :int, property $4X :int, property $4Y :int,
	property $5dir :int, property $5X :int, property $5Y :int,
	property $6dir :int, property $6X :int, property $6Y :int
	){
		K[00]=$bup_spec.mid(5,1)	//bs_PH10_02 ←これの1
		L[00]=K[00].tonum			//キャラの向き指定を数値化
		switch(L[00]){
			case($1dir)		$bup_Xrep = $1X		$bup_Yrep = $1Y
			case($2dir)		$bup_Xrep = $2X		$bup_Yrep = $2Y
			case($3dir)		$bup_Xrep = $3X		$bup_Yrep = $3Y
			case($4dir)		$bup_Xrep = $4X		$bup_Yrep = $4Y
			case($5dir)		$bup_Xrep = $5X		$bup_Yrep = $5Y
			case($6dir)		$bup_Xrep = $6X		$bup_Yrep = $6Y
		}
	return
	}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
command	$$Fup_Rep_Set(//顔ＣＧ補正座標を一括セットするコマンド
	property $1dir :int, property $1X :int, property $1Y :int, property $1S :int,
	property $2dir :int, property $2X :int, property $2Y :int, property $2S :int,
	property $3dir :int, property $3X :int, property $3Y :int, property $3S :int,
	property $4dir :int, property $4X :int, property $4Y :int, property $4S :int,
	property $5dir :int, property $5X :int, property $5Y :int, property $5S :int,
	property $6dir :int, property $6X :int, property $6Y :int, property $6S :int
	){
//		K[00]=$bup_spec.mid(6,1)
//		L[00]=K[00].tonum			//キャラの向き指定を数値化
//		switch(L[00]){
//			case($1dir)		$fup_repX = $1X		$fup_repY = $1Y		$fup_zoom = $1S
//			case($2dir)		$fup_repX = $2X		$fup_repY = $2Y		$fup_zoom = $2S
//			case($3dir)		$fup_repX = $3X		$fup_repY = $3Y		$fup_zoom = $3S
//			case($4dir)		$fup_repX = $4X		$fup_repY = $4Y		$fup_zoom = $4S
//			case($5dir)		$fup_repX = $5X		$fup_repY = $5Y		$fup_zoom = $5S
//			case($6dir)		$fup_repX = $6X		$fup_repY = $6Y		$fup_zoom = $6S
//		}
	return
	}



//バストアップの表示座標に関する記述	
#define	<POS_Y>		 200	//Ｙ位置は統一
#define	<POS_C>		 960	//中央

#define	<POS_L>		 620		//２人出し用左
#define	<POS_R>		1300		//２人出し用右

#define	<POS_3L>	 420		//３人出し用左
#define	<POS_3R>	1500		//３人出し用右

#define	<POS_4L>	 300		//４人出し用左
#define	<POS_4L_in>	 720		//４人出し用左(内側)
#define	<POS_4R_in>	1200		//４人出し用右(内側)
#define	<POS_4R>	1620		//４人出し用右

#define	<POS_5L>	 195		//５人出し用左
#define	<POS_5L_in>	 585		//５人出し用左(内側)
#define	<POS_5R_in>	1350		//５人出し用右(内側)
#define	<POS_5R>	1725		//５人出し用右

//#define	<BUP__X>	1504	//バストアップ統合読み込みの為の下地確保サイズ	口
#define	<BUP__X>	1504	//バストアップ統合読み込みの為の下地確保サイズ	口
#define	<BUP__Y>	1504	//
//#define	<BUP_SET_X>	 752	//バストアップ統合読み込みの為の配置座標		田
#define	<BUP_SET_X>	 800	//バストアップ統合読み込みの為の配置座標		田
#define	<BUP_SET_Y>	 300	//


// バストアップ移動表示時間
#define	<MOV_FAST>			100
#define	<MOV_MIDDLE>		300
#define	<MOV_SLOW>			800

// バストアップ移動表示距離
#define	<MOV_NEAR>			50
#define	<MOV_NORMAL>		200
#define	<MOV_FAR>			500

#property	$chr_num 		: int	//キャラ判別番号（＝オブジェクト番号）が入る。０は該当無し
#property	$bup_spec		: str	//@bupで使用　バストアップの指定そのものが入る
#property	$bup_base		: str	//バストアップ生成時に基本部分が入る
#property	$bup_body		: str	//バストアップ生成時に胴体用ファイル名が入る
#property	$bup_face		: str	//バストアップ生成時に表情用ファイル名のベース
#property	$bup_face1		: str	//バストアップ生成時に表情用ファイル名
#property	$bup_face2		: str	//バストアップ生成時に表情用ファイル名（口用ファイル）
#property	$bup_exte		: str	//バストアップ生成時にエクステンション用ファイル名が入る
#property	$bup_hoho		: str	//バストアップ生成時にほほ染め用ファイル名が入る

#property	$bup_load		: str	//バストアップ統合読み込み用。ロード用のファイルネーム（統合指定）が入る
//#property	$bup_load		: strlist[2]	//バストアップ統合読み込み用。ロード用のファイルネーム（統合指定）が入る
//#property	$fup_chk		: int	//バストアップ：顔ＣＧ＝０：１

#property	$bup_face_num	: int	//表情指定番号の輸送用
#property	$bup_face_num2	: int	//表情指定番号の輸送用（拡張バストアップ時の口）
#property	$bup_pause_num	: int	//ポーズ指定番号の輸送用
#property	$bup_exte_num	: int	//エクステンション用画像のパターン番号輸送用
#property	$bup_layer		: intlist[<BUP_MAX>]	//レイヤ値の変更をしたかどうか。

#property	$bup_exist		: int	//バストアップ指定されたファイルが単体で存在するかどうか
#property	$bup_stock		: strlist[<BUP_MAX>]	//最終のバストアップ指定をキャラ毎にストック

#property	$bup_px			:int	//バストアップ座標セット用
#property	$bup_py			:int	//バストアップ座標セット用

#property	$bup_Xrep		: int	//バストアップの補正座標用
#property	$bup_Yrep		: int

#property	$bup_com 		: int	//@bupで使用　どの表示コマンドで呼ばれたのか。の判別が入る
#property	$bupp_scene 	: str	//@bupで使用　キャラ別準備用シーンの呼び出しに使用する

#command	$$chr2num(str) : int	//キャラ識別子（半角２文字）を与えるとキャラ番号を吐く。００は背景。９９は識別不能。
#command	$$num2chr(int) : str	//キャラ番号を与えるとキャラ識別子（半角２文字）を吐く。
#command	$$system_bs_file(str):str	//バストアップ指定からバストアップ呼び出し用ファイル名を構築して返す。


#macro	@BUP(@filename,@wipe(0))
	$bup_px=<POS_C>		//##コマンド化の際には座標の指定も引数に取り込みたい
	farcall("_00bup",0,@filename,@wipe,0)

#macro	@BUP_L(@filename,@wipe(0))
	$bup_px=<POS_L>
	farcall(_00bup,0,@filename,@wipe,1)	//左に表示

#macro	@BUP_R(@filename,@wipe(0))
	$bup_px=<POS_R>
	farcall(_00bup,0,@filename,@wipe,1)	//右に表示

#macro	@BUP_C(@filename,@wipe(0))
	$bup_px=<POS_C>
	farcall(_00bup,0,@filename,@wipe,1)	// 5 中央（強制）表示

#macro	@BUP_DEL(@filename(all),@wipe(0))	//バストアップ消去
	farcall(_00bup,1,@filename,@wipe)






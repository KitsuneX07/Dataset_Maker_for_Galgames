//■グラフィック関連の登録群

#define		<SET>		999		//直値：表示系の引数用の登録。

#define		<TC_OFF>	-1		//直値：トーンカーブ初期化
#define		<TC_E>		10		//直値：トーンカーブ夕方
#define		<TC_N>		20		//直値：トーンカーブ夜
#define		<TC_SEPIA>	30		//直値：セピア化するときのトーンカーブ番号

#property	$TX  : intlist[31]	//サムネＸ座標ストック用	1～29を使用する
#property	$TY  : intlist[31]	//サムネＹ座標ストック用	1～29を使用する

#property	$CG_NUM : intlist[200]	//使用可能なファイルナンバーをストックする器

#property	$BG_FILE : str		//フラグ：背景ＣＧのファイルネーム
#property	$BS_TC   : int		//フラグ：バストアップのトーンカーブ指定。
#property	$BG_TC   : int		//フラグ：背景ＣＧのトーンカーブ指定。
#property	$BG_DARK : int		//フラグ：背景ＣＧのダーク値指定
#property	$MG_MODE : int		//フラグ：@mcg類 で使用。　ミニＣＧの表示方法
#property	$BUP_SET : int		//フラグ：@BUP_SET で使用。
#property	$SEPIA   : int		//フラグ：セピア回想中判定。顔グラのセピア化とかセピア後のトーンカーブ設定無視とかで使用

//##フルＣＧの表示で使用
#property	$CG_MODE  : int		//@CGマクロが呼ばれた際の動作選択。0/1/2＝本編/鑑賞/差分計上
#property	$CG_RET   : int		//ＣＧのＺフラグを立てた後、即座に戻るためのフラグ。
#property	$CG_CNT   : int		//ＣＧ差分計上時の計上結果が入るフラグ番号。
#property	$CG_FILE  : str		//フルＣＧのファイルネーム（指定名称）
#property	$CGname_B : str		//フルＣＧのベース画像ファイルネーム

//ＣＧ表示の色調整類　　表示前に数値を入れて設定します。
#property	$CG_Dark :		int	//フラグ：フルＣＧ画像を一時的に暗くするための設定。0～255　0＝無効果
#property	$CG_bright :	int	//フラグ：フルＣＧ画像を一時的に明るくするための設定。0～255　0＝無効果
#property	$CG_mono :		int	//フラグ：フルＣＧ画像を一時的にモノクロっぽくする設定。0～255　0＝無効果

#property	$CGM_EXIT : int		//ＣＧモード時にＣＧ閲覧中に右クリックしたときに１が入る。それ以降の差分無視用

#property	$CGM_NUM : int	//今扱っているＣＧの管理番号（親番号）を出す。

#property	$CGM_SET	:int	//ＣＧの管理番号・差分最大数がセットされたかどうか。セットされていれば、総差分枚数がストックされる
#property	$CGM_FLG	:int	//ＣＧの管理Ｚフラグの開始番号が入る。
#property	$CGM_MAX	:int	//ＣＧの差分最大数を代入してオブジェクト構築等に使用
#property	$CGM_DSP	:int	//↑と連動。表示可能な差分枚数
#property	$CGCMD_EX	:int	//フルＣＧの表情２桁対応版コマンドの判定に使用

#property	$CGname_1 : str		//フルＣＧのパターン用ファイルネーム（主に表情用として使用）		目
#property	$CGname_2 : str		//フルＣＧのパターン用ファイルネーム（主に表情用として使用）		口
#property	$CGname_3 : str		//フルＣＧのパターン用ファイルネーム（主に優先表情用として使用）	目
#property	$CGname_4 : str		//フルＣＧのパターン用ファイルネーム（主に優先表情用として使用）	口
#property	$CGname_5 : str		//フルＣＧのベース連動ＣＧ用ファイルネーム

#property	$CGpat_B  : int		//フルＣＧベースのカットパターン番号
#property	$CGpat_1  : int		//フルＣＧ表情のカットパターン番号（目）
#property	$CGpat_2  : int		//フルＣＧ表情のカットパターン番号（口）

#property	$CG_EX : intlist[3]	//イベントＣＧのベース・表情　の上に重なるＣＧのカットパターン番号

#property	$CGEX_NAME : strlist[5]	//イベントＣＧに重なるＣＧのファイルネーム　↓と呼応
#property	$CGEX_PAT  : intlist[5]	//イベントＣＧに重なるＣＧのカットパターン番号

//ワンタイムフラグ系。直後のワイプ終わったら即座にゼロクリアされる
#property	$OT_WC		: int	//次のワイプ時のメッセージウインドウ制御フラグ。0/1/2/3 = デフォ/閉じる/閉じない/ウインドウごとワイプ
#property	$OT_WAIT	: int	//次のワイプ時の待ち状態を指定フラグ。0/1/2/3 = デフォ/キー待ち/強制待ち/クリックで倍速

#property	$OT_STR		: strlist[10]	//ファイル指定等で色々利用できそうな文字列ワンタイムフラグ。

#property	$wipe_set_time		: int	//ワイプ時間の強制指定
#property	$wipe_set_nowait	: int	//ワイプウエイトの強制オフ

#property	$wipe_ready	:int	//ワイプ準備中（999指定）に０以外が入る

#command	$$BG_disp(str,int,int,int)
#command	$$CG_disp(str,int,int)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//背景表示用
#MACRO	@BG(@FILENAME,@WIPE(2),@TIME(0),@BUP_MODE(0))		//ファイルネームとワイプ番号の指定
	$$BG_disp(@FILENAME,@WIPE,@TIME,@BUP_MODE)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//フルＣＧ表示用
#MACRO	@CG(@FILENAME,@WIPE(0),@OBJ_NO(<O_CG>))
	$$CG_disp(@FILENAME,@WIPE,@OBJ_NO)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#MACRO	@CUTIN(@FILENAME,@WIPE(0),@OBJ_NO(<O_CUTIN>))
	$$CG_disp(@FILENAME,@WIPE,@OBJ_NO)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//時間経過用黒フェードマクロ
#MACRO	@TIME_FADE(@WIPE(0),@close(0),@TIME(1500))			//ワイプ種と時間の指定
	farcall(_00grp,09,@WIPE,@close,@TIME,000,000,000)	//通常フェードの手前のラベルに飛ばして下準備をする

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//時間経過用白フェードマクロ
#MACRO	@TIME_FADE_W(@WIPE(0),@close(0),@TIME(1500))			//ワイプ種と時間の指定
	farcall(_00grp,09,@WIPE,@close,@TIME,255,255,255)	//通常フェードの手前のラベルに飛ばして下準備をする

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//黒フェードマクロ
#MACRO	@KURO_FADE(@WIPE(02),@close(0),@TIME(000))	//ワイプ種とウインドウクローズと時間の指定
	//ウインドウクローズ → 0/1/2/3 = 閉じる/閉じない/他所からの指定に準拠/ウインドウごと
	//ワイプ種・ウインドウクローズ・時間・Ｒ・Ｇ・Ｂ
	farcall(_00grp,10,@WIPE,@close,@TIME,000,000,000)

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//白フェードマクロ
#MACRO	@SIRO_FADE(@WIPE(02),@close(0),@TIME(000))	//ワイプ種とウインドウクローズと時間の指定
	//ウインドウクローズ → 0/1/2/3 = 閉じる/閉じない/他所からの指定に準拠/ウインドウごと
	//ワイプ種・ウインドウクローズ・時間・Ｒ・Ｇ・Ｂ
	farcall(_00grp,10,@WIPE,@close,@TIME,255,255,255)

#command	$$OBJ_RGB(object,int,int,int,int)	//オブジェクトの色をベタで塗り替える

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//$$wipe_prm_set でセットされたフルパラメータを使ってワイプ実行。
#command	$$WIPE_EXEC(int)

//	$$OBJBTN_SET(obj,filename,Disp,X,Y,Tr,group,btn_no,action,SE,PushKeep,Btn_mode,alpha)
#command	$$OBJBTN_SET(object,str,int,int,int,int,int,int,int,int,int,int,int)	//オブジェクトのロード＆ボタンセット 拡張版


//ＣＧモード用　複数ＣＧの連続表示コマンドとラッパーマクロ
#macro	@CG_views(@CG00,@CG01(""),@CG02(""),@CG03(""),@CG04(""),@CG05(""),@CG06(""),@CG07(""),@CG08(""),@CG09(""),@CG10(""),@CG11(""),@CG12(""))
		$$CG_views(@CG00,@CG01,@CG02,@CG03,@CG04,@CG05,@CG06,@CG07,@CG08,@CG09,@CG10,@CG11,@CG12)

#command	$$CG_views(str,str,str,str,str,str,str,str,str,str,str,str,str)



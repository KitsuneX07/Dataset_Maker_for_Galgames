//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//定数・変数のデファイン化とユーザ変数の予約を行う

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//超汎用定数
#define		@Off		0
#define		@On			1

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■

//##オブジェクト類
#define	<O_BG>		000	//##背景用オブジェクト番号
#define	<O_CG>		010	//##イベントＣＧのオブジェクト番号	必要なら49まで使用可能
#define	<O_CUTIN>	050	//##カットイン用
#define	<O_EFF>		100	//##「フィルタ」用


//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//テンポラリ的変数予約リスト
#property $ret		: intlist[10]	//ユーザコマンド用汎用戻り値。	00～09 まで利用可能。
#property $sret		: strlist[10]	//ユーザコマンド用汎用文字変数	00～09 まで利用可能。
#property $tmp		: intlist[30]	//テンポラリ用変数。			00～29 まで利用可能。
#property $stmp		: strlist[70]	//テンポラリ用文字変数。		00～19 まで利用可能。20以降は<STMP00>系で使用
#property $p_tmp	: intlist[10]	//桁分解時の展開用配列変数　	00～09 まで利用可能。

#property $sel_g0		//選択肢グループ用変数	リストではなく個別変数にしてみる。
#property $sel_g1
#property $sel_g2
#property $sel_g3
#property $sel_g4
#property $sel_g5
#property $sel_g6
#property $sel_g7
#property $sel_g8
#property $sel_g9

#DEFINE <SEL0>	00	//選択肢制御番号をデファイン化。視認性の向上が主目的
#DEFINE <SEL1>	01	
#DEFINE <SEL2>	02	
#DEFINE <SEL3>	03	
#DEFINE <SEL4>	04	

// 画面サイズ(定数バージョン)
#define   <SCREEN_WIDTH>		1920					// 画面Ｘサイズ
#define   <SCREEN_HEIGHT>		1080					// 画面Ｙサイズ
#define   <SCREEN_CENTER_X>		(<SCREEN_WIDTH>  / 2)	// 中央座標Ｘ
#define   <SCREEN_CENTER_Y>		(<SCREEN_HEIGHT> / 2)	// 中央座標Ｙ
#define   <SCREEN_OUT_L>		0 - <SCREEN_CENTER_X>					// 画面外左の待機座標
#define   <SCREEN_OUT_R>		<SCREEN_WIDTH> + <SCREEN_CENTER_X>		// 画面外右の待機座標
#define   <SCREEN_OUT_U>		0 - <SCREEN_CENTER_Y>					// 画面外上の待機座標
#define   <SCREEN_OUT_B>		<SCREEN_HEIGHT> + <SCREEN_CENTER_Y>		// 画面外下の待機座標

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//バストアップ表示に使用する、立ち位置用キャラ指定ストック
#property $CHR_C			: str		//現在センターに表示指定されているキャラファイルネームが丸々入っている


;##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;##ゲーム全体に関わりそうなグローバル変数
#DEFINE <KIDOU>			G[0000]			;ゲームの初回起動かどうか
#DEFINE <GAME_CLEAR>	G[0001]			;一つでもエンディングを見ていたら立つフラグ(スタッフロールで立たせる)
#DEFINE <SL_PAGE>		G[0002]			;最後に開いていたセーブ・ロードメニューのページ
#DEFINE <PRT_CHK>		G[0003]			;## 起動時のプロテクトチェックで使用
#DEFINE <GR_MUS>		G[0004]			;音楽モードで鳴らした曲の番号　０＝停止　（ギャラリー内のみ・音楽メニュー復帰用）
#DEFINE <GR_MODE>		G[0005]			;最後に開いていたギャラリー（音楽／ＣＧ／回想）
#DEFINE <KS_PAGE>		G[0006]			;最後に開いていた回想モードのページ
#DEFINE <KS_CHR>		G[0007]			;最後に開いていた回想モードのキャラ
#DEFINE <KAISOU>		G[0008]			;回想モードで徘徊中だよ。ロゴ出し部分で初期化の事
#DEFINE <PURORO>		G[0009]			;プロローグを一度見たフラグ
#DEFINE	<OP_MITA>		G[0010]			;ＯＰを見たかどうか
#DEFINE	<OMAKE>			G[0011]			;ＣＧ・回想・音楽モードからの戻りかどうか（メインメニューで判断）

#DEFINE	<LD_CHK>		G[0012]			;ロード時に確認ダイアログを出すかどうか				１＝出す
#DEFINE	<SV_CHK>		G[0013]			;上書きセーブ時に確認ダイアログを出すかどうか		１＝出す
#DEFINE	<QL_CHK>		G[0014]			;クイックロード時に確認ダイアログを出すかどうか		１＝出す
#DEFINE	<QS_CHK>		G[0015]			;クイックセーブ時に確認ダイアログを出すかどうか		１＝出す
#DEFINE	<SL_CHK>		G[0016]			;前の選択肢に戻る時に確認ダイアログを出すかどうか	１＝出す
#DEFINE	<TM_CHK>		G[0017]			;タイトルに戻る時に確認ダイアログを出すかどうか		１＝出す
#define	<ED_CHK>		G[0018]			;ゲーム終了時に確認ダイアログを出すかどうか			１＝出す
#DEFINE	<CF_PAGE>		G[0019]			//コンフィグメニューで最後に開いていたページ。

//各種ワイプの実行秒数用フラグもここで定義しておく必要がある。
//##	初回起動直後に初期値設定する事 →　_00game_init.ss
#DEFINE	<BS_TIME>		G[0020]			;バストアップ表示のワイプ時間	
#DEFINE	<BG_TIME>		G[0021]			;背景ＣＧ表示のワイプ時間
#DEFINE	<CG_TIME>		G[0022]			;フルＣＧ表示のワイプ時間
#DEFINE	<MW_TIME>		G[0023]			;メッセージウィンドウ開閉のワイプ時間
#DEFINE	<RC_TIME>		G[0024]			;右クリメニューのワイプ時間
#DEFINE	<FD_TIME>		G[0025]			;黒・白フェードのワイプ時間
#DEFINE	<TW_TIME>		G[0026]			;時間経過フェードのワイプ時間
#DEFINE	<SC_TIME>		G[0027]			;シーン切り替え時のＢＧＭフェード待ち

#DEFINE	<SL_mode>		G[0028]			;セーブ・ロードの切替え用	0/1＝セーブ/ロード


//表示速度の状態	0,1,2＝通常,高速,瞬間
#define	<WIPE_CH>		G[0041]			;バストアップＣＧ
#define	<WIPE_BG>		G[0042]			;背景ＣＧ
#define	<WIPE_CG>		G[0043]			;イベントＣＧ
#define	<WIPE_MS>		G[0044]			;メッセージウィンドウ
#define	<WIPE_BK>		G[0045]			;表示速度バックアップしてあるよフラグ
#define	<RC_CHK>		G[0046]			;##右クリの動作設定　0/1/2/3＝環境設定/メッセージ閉/セーブ/ロード
#define	<CFG_CHR>		G[0047]			//##環境設定のキャラ別開放度	00～04

//ワイプパラメータ引渡し用変数。下で登録されている $$wipe_prm_setコマンドと併用のこと。
#property $W_prm	: intlist[12]	//ワイプパラメータ引渡し用変数。
#property $MASK_WIPE : str			//マスクワイプする際の変数。通常ワイプの際には空文字("")が入っている　00grp.ssで使用
#property $EF_normal : int			//強制的に演出を見せる部分で１を代入。演出速度の設定を一時的に「通常」にする。

#property	$excall		:int	//ＥＸコールされてきたかどうか

#property	$WC			: int		//ワイプ等でメッセージウィンドウの制御をするときに使うワンタイムフラグ。0＝ウィンドウ閉じる＝初期値
#property	$WR			: int		//【ノベル特化】ＣＧ表示後にR待ちをするかどうか。0＝待つ＝初期値
#property	$stage		: int		//ステージ指定 0 / 1 / 2 = back / front / next

;##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;##環境変数取得用テンポラリ変数
#DEFINE	<COMMAND_SET>		0200			;変数指定開始値　Ｃ［ＸＸＸＸ］から開始するよ。
#DEFINE	<S_SCREEN>	C[<COMMAND_SET>]		;スクリーンモード取得
#DEFINE	<S_DAY>		C[<COMMAND_SET>+01]		;日付ウィンドウの表示・非表示
#DEFINE	<S_WAIP>	C[<COMMAND_SET>+02]		;画面切り替えの速度
#DEFINE	<S_MOJI>	C[<COMMAND_SET>+03]		;メッセージ表示速度
#DEFINE	<S_MOJI_SW>	C[<COMMAND_SET>+04]		;メッセージ表示がノーウェイトかどうか
#DEFINE	<S_BGM>		C[<COMMAND_SET>+05]		;音量：ＢＧＭ
#DEFINE	<S_PCM>		C[<COMMAND_SET>+06]		;音量：効果音
#DEFINE	<S_SSE>		C[<COMMAND_SET>+07]		;音量：システムＳＥ
#DEFINE	<S_KOE>		C[<COMMAND_SET>+08]		;音量：声
#DEFINE	<S_BGM_SW>	C[<COMMAND_SET>+09]		;音量使用：ＢＧＭ
#DEFINE	<S_PCM_SW>	C[<COMMAND_SET>+10]		;音量使用：効果音
#DEFINE	<S_SSE_SW>	C[<COMMAND_SET>+11]		;音量使用：システムＳＥ
#DEFINE	<S_KOE_SW>	C[<COMMAND_SET>+12]		;音量使用：声
#DEFINE	<S_KHz>		C[<COMMAND_SET>+13]		;サウンド周波数
#DEFINE	<S_MOUSE>	C[<COMMAND_SET>+14]		;カーソルをモノクロに
#DEFINE	<S_SLOW>	C[<COMMAND_SET>+15]		;動作を遅くして(ry
#DEFINE	<S_NOISE>	C[<COMMAND_SET>+16]		;ノイズが出るときに
#DEFINE	<S_WHEEL>	C[<COMMAND_SET>+17]		;マウスホイールで(ry
#DEFINE	<S_CLFD>	C[<COMMAND_SET>+18]		;マウスクリックで暗転飛ばし
#DEFINE	<S_KOEST>	C[<COMMAND_SET>+19]		;声の再生中に次の文章に進んでも再生を続ける。
#DEFINE <S_BGMFADE>	C[<COMMAND_SET>+20]		;BGMフェード状態
#DEFINE <S_VO_SET>	C[<COMMAND_SET>+21]		;音声設定
#DEFINE	<S_SLCHK>	C[<COMMAND_SET>+22]		;セーブロードの確認有無
#DEFINE	<S_MESTR>	C[<COMMAND_SET>+23]		;メッセージ透過度

#DEFINE	<S_CHR01>	C[<COMMAND_SET>+24]		;キャラクタ音声０１
#DEFINE	<S_CHR02>	C[<COMMAND_SET>+25]		;キャラクタ音声０２
#DEFINE	<S_CHR03>	C[<COMMAND_SET>+26]		;キャラクタ音声０３
#DEFINE	<S_CHR04>	C[<COMMAND_SET>+27]		;キャラクタ音声０４
#DEFINE	<S_CHR05>	C[<COMMAND_SET>+28]		;キャラクタ音声０５
#DEFINE	<S_CHR06>	C[<COMMAND_SET>+29]		;キャラクタ音声０６
#DEFINE	<S_CHR07>	C[<COMMAND_SET>+30]		;キャラクタ音声０７
#DEFINE	<S_CHR08>	C[<COMMAND_SET>+31]		;キャラクタ音声０８
#DEFINE	<S_CHR09>	C[<COMMAND_SET>+32]		;キャラクタ音声０９
#DEFINE	<S_CHR10>	C[<COMMAND_SET>+33]		;キャラクタ音声１０

;##テンポラリ文字変数
#DEFINE	<STMP_SET>	0000				;変数指定開始値　Ｓ［ＸＸＸＸ］から開始するよ。
#DEFINE	<STMP00>	S[<STMP_SET>]		;テンポラリ用として各所で使用。
#DEFINE	<STMP01>	S[<STMP_SET>+01]	;足りなかったら増やす。
#DEFINE	<STMP02>	S[<STMP_SET>+02]
#DEFINE	<STMP03>	S[<STMP_SET>+03]
#DEFINE	<STMP04>	S[<STMP_SET>+04]
#DEFINE	<STMP05>	S[<STMP_SET>+05]
#DEFINE	<STMP06>	S[<STMP_SET>+06]
#DEFINE	<STMP07>	S[<STMP_SET>+07]
#DEFINE	<STMP08>	S[<STMP_SET>+08]
#DEFINE	<STMP09>	S[<STMP_SET>+09]

#DEFINE	<SMTMP00>	S[<STMP_SET>+10]	;マクロ専用として分けて予約。
#DEFINE	<SMTMP01>	S[<STMP_SET>+11]
#DEFINE	<SMTMP02>	S[<STMP_SET>+12]
#DEFINE	<SMTMP03>	S[<STMP_SET>+13]
#DEFINE	<SMTMP04>	S[<STMP_SET>+14]
#DEFINE	<SMTMP05>	S[<STMP_SET>+15]
#DEFINE	<SMTMP06>	S[<STMP_SET>+16]
#DEFINE	<SMTMP07>	S[<STMP_SET>+17]
#DEFINE	<SMTMP08>	S[<STMP_SET>+18]
#DEFINE	<SMTMP09>	S[<STMP_SET>+19]

#DEFINE	<MFN00>		S[<STMP_SET>+20]	;マクロへのファイルネーム引き渡し用
#DEFINE	<MFN01>		S[<STMP_SET>+21]
#DEFINE	<MFN02>		S[<STMP_SET>+22]
#DEFINE	<MFN03>		S[<STMP_SET>+23]
#DEFINE	<MFN04>		S[<STMP_SET>+24]

;##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;##選択肢用テンポラリ変数
#DEFINE	<SELECT_SET>	0090				;変数指定開始値　Ｃ［ＸＸＸＸ］から開始するよ。
#DEFINE	<SELECT00>	C[<SELECT_SET>]			;選択結果の代入にのみ使う予定だったけどシナリオ用にも使えそう。
#DEFINE	<SELECT01>	C[<SELECT_SET>+01]		
#DEFINE	<SELECT02>	C[<SELECT_SET>+02]
#DEFINE	<SELECT03>	C[<SELECT_SET>+03]
#DEFINE	<SELECT04>	C[<SELECT_SET>+04]
#DEFINE	<SELECT05>	C[<SELECT_SET>+05]
#DEFINE	<SELECT06>	C[<SELECT_SET>+06]
#DEFINE	<SELECT07>	C[<SELECT_SET>+07]
#DEFINE	<SELECT08>	C[<SELECT_SET>+08]
#DEFINE	<SELECT09>	C[<SELECT_SET>+09]		;99まで予約

//##チャプター管理用フラグ
#DEFINE	<CHAPTER_PLAYING>	G[0200]
#DEFINE	<CHAPTER_01>		G[0201]
#DEFINE	<CHAPTER_02>		G[0202]
#DEFINE	<CHAPTER_03>		G[0203]
#DEFINE	<CHAPTER_04>		G[0204]
#DEFINE	<CHAPTER_05>		G[0205]
#DEFINE	<CHAPTER_06>		G[0206]
#DEFINE	<CHAPTER_07>		G[0207]
#DEFINE	<CHAPTER_08>		G[0208]
#DEFINE	<CHAPTER_09>		G[0209]
#DEFINE	<CHAPTER_10>		G[0210]
#DEFINE	<CHAPTER_11>		G[0211]
#DEFINE	<CHAPTER_12>		G[0212]
#DEFINE	<CHAPTER_13>		G[0213]
#DEFINE	<CHAPTER_14>		G[0214]
#DEFINE	<CHAPTER_15>		G[0215]
#DEFINE	<CHAPTER_16>		G[0216]
#DEFINE	<CHAPTER_17>		G[0217]
#DEFINE	<CHAPTER_18>		G[0218]
#DEFINE	<CHAPTER_19>		G[0219]
#DEFINE	<CHAPTER_20>		G[0220]
#DEFINE	<CHAPTER_21>		G[0221]

//##体験版管理用フラグ
#DEFINE	<TRIAL>				G[0250]
#DEFINE	<TRIAL_CLEAR>		G[0251]

//##追加フラグ
#DEFINE	<ED_MITA>			G[0252]			;ＥＤを見たかどうか




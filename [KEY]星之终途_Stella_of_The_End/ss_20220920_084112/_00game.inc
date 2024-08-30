//ゲーム別の登録要素などをこちらに

//##０１～１９　をキャラ別バストアップ識別番号として登録
//番号が若いほど奥の表示になることに留意。
//			フルＣＧにしかない識別子も入れる事
#define	<JD>		01		//ジュード
#define	<PH>		02		//フィリア
#define	<DE>		03		//デリラ
#define	<GA>		04		//ガブリエル
#define	<WI>		05		//ウィレム
#define	<KW>		06		//港湾管理人
#define	<A1>		07		//Ａｅ１１９
#define	<A7>		08		//Ａｅ７８
#define	<OT>		09		//その他
//#define	<>		14		//そのた男	//環境設定で使用
//#define	<>		15		//そのた女	//環境設定で使用

//#define	<xx>	16		//
//#define	<xx>	17		//

#define		<BUP_MIN>	01		//直値：バストアップオブジェクトの予約開始番号
#define		<BUP_MAX>	10		//直値：バストアップオブジェクトの予約最終番号
	//##	バストアップを増やしたらこのMAX値を確認すること。@BUP_DELで消せないキャラが出てくる。

//服装変数。内部では $DR[<CH>] として呼ぶと思う。
#define	<DR_JD>	$DR[<JD>]		//ジュード
#define	<DR_PH>	$DR[<PH>]		//フィリア
#define	<DR_DE>	$DR[<DE>]		//デリラ
#define	<DR_GA>	$DR[<GA>]		//ガブリエル
#define	<DR_WI>	$DR[<WI>]		//ウィレム
#define	<DR_KW>	$DR[<KW>]		//港湾管理人
#define	<DR_A1>	$DR[<A1>]		//Ａｅ１１９
#define	<DR_A7>	$DR[<A7>]		//Ａｅ７８
#define	<DR_OT>	$DR[<OT>]		//その他
//#define	<DR_xx>	$DR[<xx>]		//

//バストアップ表示修正位置Ｘ		//#define	<Px_xx>	$reppos_x[<xx>]
#define	<Px_JD>	$reppos_x[<JD>]
#define	<Px_PH>	$reppos_x[<PH>]
#define	<Px_DE>	$reppos_x[<DE>]
#define	<Px_GA>	$reppos_x[<GA>]
#define	<Px_WI>	$reppos_x[<WI>]
#define	<Px_KW>	$reppos_x[<KW>]
#define	<Px_A1>	$reppos_x[<A1>]
#define	<Px_A7>	$reppos_x[<A7>]
#define	<Px_OT>	$reppos_x[<OT>]

//バストアップ表示修正位置Ｙ		//#define	<Py_xx>	$reppos_y[<xx>]
#define	<Py_JD>	$reppos_y[<JD>]
#define	<Py_PH>	$reppos_y[<PH>]
#define	<Py_DE>	$reppos_y[<DE>]
#define	<Py_GA>	$reppos_y[<GA>]
#define	<Py_WI>	$reppos_y[<WI>]
#define	<Py_KW>	$reppos_y[<KW>]
#define	<Py_A1>	$reppos_y[<A1>]
#define	<Py_A7>	$reppos_y[<A7>]
#define	<Py_OT>	$reppos_y[<OT>]

//バストアップ表示修正位置Ｘ(リアルタイム)	//#define	<RPx_xx>	front.object[<xx>].x_rep[2]
#define	<RPx_JD>	front.object[<JD>].x_rep[2]
#define	<RPx_PH>	front.object[<PH>].x_rep[2]
#define	<RPx_DE>	front.object[<DE>].x_rep[2]
#define	<RPx_GA>	front.object[<GA>].x_rep[2]
#define	<RPx_WI>	front.object[<WI>].x_rep[2]
#define	<RPx_KW>	front.object[<KW>].x_rep[2]
#define	<RPx_A1>	front.object[<A1>].x_rep[2]
#define	<RPx_A7>	front.object[<A7>].x_rep[2]
#define	<RPx_OT>	front.object[<OT>].x_rep[2]

//バストアップ表示修正位置Ｙ(リアルタイム)	//#define	<RPy_xx>	front.object[<xx>].y_rep[2]
#define	<RPy_JD>	front.object[<JD>].y_rep[2]
#define	<RPy_PH>	front.object[<PH>].y_rep[2]
#define	<RPy_DE>	front.object[<DE>].y_rep[2]
#define	<RPy_GA>	front.object[<GA>].y_rep[2]
#define	<RPy_WI>	front.object[<WI>].y_rep[2]
#define	<RPy_KW>	front.object[<KW>].y_rep[2]
#define	<RPy_A1>	front.object[<A1>].y_rep[2]
#define	<RPy_A7>	front.object[<A7>].y_rep[2]
#define	<RPy_OT>	front.object[<OT>].y_rep[2]

//##■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//ココから先はシナリオ用フラグ。
//シナリオ用進行状態フラグ群
//#DEFINE <FLG_SK>	B[<MR>]		//
//#DEFINE <FLG_YR>	B[<YR>]		//
//#DEFINE <FLG_PK>	B[<PK>]		//

#define <SIDE>		B[0043]		//視点切り替え用　0：1＝主人公／ヒロイン

#define <AS_PAGE>	B[0046]		//オートセーブ履歴で開かれるページ（1～12）

#DEFINE	<FKDS_MODE>	B[0100]		//フキダシモードかどうかの設定。　1=フキダシモード
#DEFINE	<EVENT>		B[0101]		//イベントシーン中かどうか→フキダシ切り替えのフラグ保護に使用

#property $NAME_CHG		:int	//キャラの名前が　0=デフォ　1=変更アリ

//バストアップ関係
#property $DR			:intlist[20]	//服装指定変数

#property $MAX_01		:intlist[20]	//正面表情最大数（配列はキャラ番号）
#property $MAX_02		:intlist[20]
#property $MAX_03		:intlist[20]

#property $P_MAX_01		:intlist[20]	//ポーズ最大数（配列はキャラ番号）
#property $P_MAX_02		:intlist[20]
#property $P_MAX_03		:intlist[20]

#property $SC_JUMP		:int	//「プロローグを飛ばす」を選んだ時に１

#property $THm_x	:intlist[50]	//サムネイル用配置座標Ｘ
#property $THm_y	:intlist[50]	//サムネイル用配置座標Ｙ



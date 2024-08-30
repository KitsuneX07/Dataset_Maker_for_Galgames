


//##コマンド登録
#command $$toggle(int) : int			//１⇔０　数値トグル 1/0以外の数値の時は符号反転
#command $$loop_inc(int,int,int) :int	//定値内加算ループ(min,flag,max)
#command $$loop_dec(int,int,int) :int	//定値内減算ループ(min,flag,max)

#command $$wipe_copy_set(int)			//バストアップ群のワイプコピーフラグ一括制御
//#command $$wipe_copy_Fullset(int)		//バストアップ群・背景・効果のワイプコピーフラグ一括制御
#command $$objcopy(int)					//指定されたオブジェクトを 表→裏 でコピーする

#command $$excall_ready(int)	//システムコール準備	1=ウィンドウ閉じる
#command $$excall_free			//システムコール開放

#command $$wipe_prm_set(int,int,int)	//ワイプ登録番号・表示速度・ワイプ時間指定　→ワイプパラメータへの引渡しコマンド
#command $$wipe_prm_clr					//ワイプパラメタ変数群の初期化

#command $$create_child(object,int,int)		//子オブジェクトの作成支援 親オブジェクト,disp,cnt

#command $$dialog(str,int) :int		//ダイアログ　メッセージ,モード　戻り値は0/1　０＝キャンセル
#command $$comment_box(int) :str	//テキスト入力ボックス　引数は最大文字数　戻り値は入力された文字列

#command $$obj_rep_xy(object, int, int)		//指定オブジェクトにＸＹの修正座標を同時に作成するコマンド

#command $$AUTO_SAVE(int)	//オートセーブ実行　引数は「AutoSaveしました」表示の有無（未実装）

#command $$CFG_CHR(int)		//コンフィグ・サウンドのキャラ別音声開放用



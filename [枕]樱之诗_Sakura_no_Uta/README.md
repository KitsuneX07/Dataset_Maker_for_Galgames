# 1.解包
观察文件名和后缀，``[枕]樱之诗_Sakura_no_Uta``可以判断是BGI引擎制作的。我使用的工具为``fxckBGI`` <https://github.com/regomne/chinesize/tree/master/BGI/fxckBGI> <br>
使用方法为运行``fxckBGI.exe``，然后选择对应的``BGI.exe``。之后，把``.arc``格式的封包拖进去解包即可。 <br>
其中，解出来的``data01099``......``data01999``文件夹中包含了所有的剧本文件。 <br>
使用``ScriptDecoder``进行对剧本文件的转换，转换为``.txt``文件。<https://github.com/Inori/FuckGalEngine/tree/master/BGI/BGIKit/ScriptDecoder> <br>
转换后的所有``.txt``文件见本目录下的``scripts``文件夹。<br>
其中，解出来的``data04100``......``data04999``文件夹中包含了所有的对话的音频文件。 <br>
# 2.处理
使用``Text_Extractor_for_Sakura_no_Uta.py``进行操作整理成按说话人分好的``.json``文件。<br>
其中，说话人的对应是: <br>
>
>aid 夏目蓝 Natsume Ai<br>
frd 麦提弗里曼<br>
had 伯奇<br>
hrd 氷川里奈 Hikawa Rina<br>
htd 校長<br>
ked 夏目圭 Natsume Kei<br>
kid 草薙健一郎 Kusanagi Ken'ichirō<br>
kmd 明石小牧 Akashi Komaki<br>
ksd 明石小沙智 Akashi Kosachi<br>
ktd 片貝<br>
ktkd 夏目琴子 Natsume Kotoko<br>
kzd 夏目雫（草薙葛）Kusanagi Kuzu<br>
mkd 鳥谷真琴 Toritani Makoto<br>
mmd 御桜母親<br>
mzd 中村水菜 Nakamura Mizuna<br>
nid 恩田寧 Onda Nei<br>
nnd 柊乃乃未 Hiragi Nonomi<br>
ntd 栗山奈津子 Kuriyama Natsuko<br>
rld 冰川露莉莴 Hikawa Ruling<br>
rnd 御桜稟 Misakura Rin<br>
skd 鳥谷紗希 Toritani Saki<br>
skrd 咲崎桜子 Sakisaki Sakurako<br>
snd 川内野鈴菜 Kawachino Suzuna<br>
sud 吹 Sui<br>
szd 夏目雫 Natsume Shizuku<br>
tkd 弘濑琢磨 Hirose Takuma<br>
tmd 泷泽·托马斯·尼格尔·顺平<br>
wkd 若田清二郎<br>
wtd 明石亘 Akashi Wataru<br>
ymd 川内野優美 Kawachino Yūmi<br>
yod 中村義貞 Nakamura Yoshisada<br>

之后就可以按照操作指示制作数据集了。<br>
处理好的文件可以在本目录下的``scripts_json``文件夹中找到。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Sakura_no_Uta/tree/main>

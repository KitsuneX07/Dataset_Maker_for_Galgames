# 1.解包
柚子社的基本所有作品，如``[yuzusoft]星光咖啡馆与死神之蝶_Cafe_Stella``等都可以使用工具为``GARbro`` <https://github.com/regomne/chinesize/tree/master/BGI/fxckBGI> 或者 ``krkrextract`` <https://github.com/xmoezzz/KrkrExtract>，要是还不行，可以试试 ``krkrzExtract`` 进行动态解包。<https://github.com/xmoezzz/KrkrzExtract><br>
其中，解出来的``scn``文件夹中包含了所有的剧本文件。 <br>
使用``FreeMoteToolkit``中的``PsbDecompile.exe``进行对剧本文件的转换，转换为``.json``文件。后缀为``.resx.json``和``.scn``的文件可以直接丢弃。<br>
转换后的所有``.json``文件见本目录下的``scripts``文件夹。<br>
其中，解出来的``voice``文件夹中包含了所有的对话的音频文件。 <br>
# 2.处理
使用``Text_Extractor_for_Cafe_Stella.py``进行操作整理成按说话人分好的``.json``文件。<br>
其中，说话人的对应是: <br>
>
>akaiwa 赤磐様 <br>
ats 篤紀 <br>
aya あやせ <br>
ayashige 怪しげな男 <br>
cake ケーキ屋店員 <br>
camera カメラマン <br>
chi 千咲 <br>
chikan 痴漢 <br>
classa クラスメイトＡ <br>
classb クラスメイトＢ <br>
classc クラスメイトＣ <br>
dakyaku 男性客 <br>
dakyakua 男性客Ａ <br>
dakyakud 男性客Ｄ <br>
dansei 男性お客 <br>
danshia 男子学生Ａ <br>
danshib 男子学生Ｂ <br>
dkanjaa 入院男子Ａ <br>
dkanjab 入院男子Ｂ <br>
gaikokua 外国人Ａ <br>
gaikokub 外国人Ｂ <br>
hannninna 犯人Ａ <br>
hannninnb 犯人Ｂ <br>
haz 羽月 <br>
hazuchichi 羽月の父 <br>
hazuhaha 羽月の母 <br>
hir 宏人 <br>
jga 女子学生Ａ <br>
jgb 女子学生Ｂ <br>
jgc 女子学生Ｃ <br>
jkanjaa 入院女子Ａ <br>
jkanjab 入院女子Ｂ <br>
jkanjac 入院女子Ｃ <br>
jkyakub 女性客Ｂ <br>
jokyaku 女性お客 <br>
joshid 女子Ｄ <br>
jukujo 熟女看護師 <br>
kamonn 嘉門 <br>
kan 栞那 <br>
kanja 入院患者 <br>
kao 香里 <br>
kaz 和史 <br>
keibia 警備員Ａ <br>
keibib 警備員Ｂ <br>
keisatsua 警察Ａ <br>
keisatsub 警察Ｂ <br>
kido 優等生 <br>
kodomoa 子供Ａ <br>
kodomob 子供Ｂ <br>
kodomoc 子供Ｃ <br>
kogara 小柄な女の子 <br>
kooyaa 子供の親Ａ <br>
kooyab 子供の親Ｂ <br>
kotori 琴里 <br>
kyo 恭平 <br>
mac マクレガー <br>
madama マダムＡ <br>
madamb マダムＢ <br>
madamc マダムＣ <br>
mafiaa マフィアＡ <br>
mafiab マフィアＢ <br>
mafiac マフィアＣ <br>
mafiad マフィアＤ <br>
mafiae マフィアＥ <br>
mafiaf マフィアＦ <br>
maid メイド <br>
may 茉優 <br>
mei 愛衣 <br>
meifirend 愛衣の友人 <br>
mik ミカド <br>
miyama 蝶の客 <br>
miyu 充優 <br>
naj 七海（幼女） <br>
nan 七海 <br>
nat ナツメ <br>
natmama ナツメの母 <br>
natpapa ナツメの父 <br>
neko 猫 <br>
nonaka 野中 <br>
noz 希 <br>
nozmama 希の母 <br>
okyaku お客さん <br>
okyakua お客さんＡ <br>
okyakub お客さんＢ <br>
okyakuc お客さんＣ <br>
ooe 大江 <br>
ooya 大家 <br>
otoko 男 <br>
otokoa 男Ａ <br>
otokob 男Ｂ <br>
otokoc 男Ｃ <br>
piza ピザ屋 <br>
rokurou 緑郎 <br>
ryu 隆之介 <br>
sanpaia 参拝客Ａ <br>
sanpaib 参拝客Ｂ <br>
sanpaic 参拝客Ｃ <br>
sanpaid 参拝客Ｄ <br>
sanpaie 参拝客Ｅ <br>
sanpaif 参拝客Ｆ <br>
sanpaig 参拝客Ｇ <br>
sanpaih 参拝客Ｈ <br>
satoru 暁（幼少） <br>
senseia 先生Ａ <br>
shioyama 汐山家母 <br>
siria 知り合いＡ <br>
sirib 知り合いＢ <br>
suga 菅英人 <br>
suugaku 数学教師 <br>
suz 涼音 <br>
syokudou 食堂のおばちゃん <br>
syounenna 少年Ａ <br>
syounennb 少年Ｂ <br>
syufua 主婦Ａ <br>
syufub 主婦Ｂ <br>
syuugekia 襲撃者Ａ <br>
syuugekib 襲撃者Ｂ <br>
syuugekic 襲撃者Ｃ <br>
syuugekid 襲撃者Ｄ <br>
taiiku 体育教師 <br>
tenin 店員 <br>
tenninn 店員 <br>
tsukoua 通行人Ａ <br>
tsukoub 通行人Ｂ <br>
watarai 渡会 <br>
yajiumaa 野次馬Ａ <br>
yajiumab 野次馬Ｂ <br>
yajiumac 野次馬Ｃ <br>
yuina 結菜 <br>
yuinamama 結菜の母 <br>
zassi 雑誌記者 <br>

之后就可以按照操作指示制作数据集了。<br>
处理好的文件可以在本目录下的``scripts_json``文件夹中找到。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Riddle_Joker/tree/main>

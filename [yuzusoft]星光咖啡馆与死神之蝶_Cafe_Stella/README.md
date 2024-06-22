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
cake 蛋糕屋店員 <br>
classa 同学Ａ <br>
classb 同学Ｂ <br>
classc 同学Ｃ <br>
dakyaku 男性客 <br>
dakyakua 男性客Ａ <br>
dakyakuc 男性客Ｃ <br>
dakyakud 男性客Ｄ <br>
dkanjaa 入院男子Ａ <br>
dkanjab 入院男子Ｂ <br>
hir 宏人 <br>
jga 女子学生Ａ <br>
jgb 女子学生Ｂ <br>
jgc 女子学生Ｃ <br>
jkanjaa 入院女子Ａ <br>
jkanjab 入院女子Ｂ <br>
jkanjac 入院女子Ｃ <br>
jkyakub 女性客Ｂ <br>
jukujo 熟女看護師 <br>
kan 明月栞那 Akizuki Kanna<br>
kanja 入院患者 <br>
kaz 和史 <br>
madama 女士Ａ <br>
madamb 女士Ｂ <br>
madamc 女士Ｃ <br>
maid 女仆 <br>
mei 火打谷愛衣 Hiuchidani Mei <br>
meifirend 愛衣の友人 <br>
mik ミカド <br>
miyama 蝶の客 <br>
miyu 充優 <br>
nat 四季ナツメ Shiki Natsume <br>
natmama ナツメの母 <br>
natpapa ナツメの父 <br>
nonaka 野中 <br>
noz 墨染希 Sumizome Nozomi <br>
nozmama 希の母 <br>
okyaku お客 <br>
okyakua お客さんＡ <br>
okyakub お客さんＢ <br>
okyakuc お客さんＣ <br>
ooya 大家 <br>
rokurou 緑郎 <br>
sanpaia 参拝客Ａ <br>
sanpaib 参拝客Ｂ <br>
sanpaic 参拝客Ｃ <br>
sanpaid 参拝客Ｄ <br>
sanpaie 参拝客Ｅ <br>
sanpaif 参拝客Ｆ <br>
sanpaig 参拝客Ｇ <br>
sanpaih 参拝客Ｈ <br>
shioyama 汐山家母 <br>
siria 知り合いＡ <br>
sirib 知り合いＢ <br>
suz 汐山涼音 Shioyama Suzune <br>
syufua 主婦Ａ <br>
syufub 主婦Ｂ <br>
tenin 店員 <br>
yuina 結菜 <br>
yuinamama 結菜の母 <br>

之后就可以按照操作指示制作数据集了。<br>
处理好的文件可以在本目录下的``scripts_json``文件夹中找到。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Cafe_Stella/tree/main>

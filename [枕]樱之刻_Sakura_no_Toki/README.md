# 1.解包
``[枕]樱之刻_Sakura_no_Toki``可以使用工具``GARbro``进行解包。 <https://github.com/morkt/GARbro> <br>
剧本文件位于``scripts``文件夹。说话语音文件位于``/sound/vo``文件夹。 <br>
# 2.处理
使用``Text_Extractor_for_Sakura_no_Toki.py``进行操作整理成按说话人分好的``.json``文件。<br>
其中，说话人的对应是: <br>
>
>aix 夏目蓝 Natsume Ai<br>
aka 明石亘 Akashi Wataru<br>
eru 夏目依瑠 Natsume Eru<br>
fri 麦提弗里曼<br>
gay 稟<br>
hak 宫崎破戒 Miyazaki Hakai<br>
hos 恩田放哉 Onda Hosai<br>
kan 长山香奈 Nagayama Kana<br>
kat 片贝巧实 Katagai Kozumi<br>
kei 夏目圭 Natsume Kei<br>
ken 草薙健一郎 Kusanagi Ken'ichirō<br>
kir 恩田霧乃 Onda Kirino<br>
mak 鳥谷真琴 Toritani Makoto<br>
mis 本間心鈴 Honma Misuzu<br>
mur 村田清彦 Murata Kiyohiko<br>
nao 草薙直哉 Kusanagi Naoya<br>
nat 栗山奈津子 Kuriyama Natsuko<br>
nei 恩田寧 Onda Nei<br> 
non 柊乃乃未 Hiragi Nonomi<br>
rei 中村麗華 Nakamura Reika<br>
rej 本间礼次郎 Honma Reijirō<br>
rin 御桜稟 Misakura Rin<br>
rna 氷川里奈 Hikawa Rina<br>
rur 冰川露莉莴 Hikawa Ruling<br>
sak 鳥谷紗希 Toritani Saki<br>
ser 员工
shi 鳥谷静流 Toritani Shizuru<br>
shz 夏目雫 Natsume Shizuku<br>
skm 坂本彰三 Sakamoto Akimasa<br>
sku 咲崎桜子 Sakisaki Sakurako<br>
suz 川内野鈴菜 Kawachino Suzuna<br>
syo 中村章一 Nakamura Shōichi<br>
tho 泷泽·托马斯·尼格尔·顺平<br>
yum 川内野優美 Kawachino Yūmi<br>

之后就可以按照操作指示制作数据集了。<br>
处理好的文件可以在本目录下的``scripts_json``文件夹中找到。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Sakura_no_Toki/tree/main>
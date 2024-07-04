# 1.解包
``[craftegg]世界计划_Project_Sekai``使用的仍是经典``criware``，具体的操作过程基本就是.acb -> .hca -> .wav。具体的操作可以参考 <https://www.bilibili.com/read/cv13495331/> 。<br>
做一些小小的提醒：
1. 由于常用的提取unity游戏文件的``AssetStudio``在几年前就停止了更新，推荐使用fork的 <https://github.com/RazTools/Studio>。注意选择unity版本为2022.3.21f1。 <br>
2. 建议将选择最新版的``VGMToolbox``。 <br>
3. ``HCA Decoder``在解码时的密钥和邦邦是一样的，可以在文件中找到。 <br>
# 2.处理
可以再解出来的Monobehaviour中找到对话的脚本，然后使用``Text_Extractor_for_Project_Sekai.py``进行操作整理成按说话人分好的``.json``文件。<br>
>(当然还是靠瞪眼法瞪出json文件的结构)

实际上说话人已经写进文件名了，不过由于文件名格式不统一，所以干脆直接暴力读取吧。 <br>
>1: "一歌",星乃一歌 <br> 
2: "咲希",天马咲希<br>
3: "穂波",望月穂波<br>
4: "志歩",日夜森志步<br>
5: "みのり",花里实乃理<br>
6: "遥",桐谷遥<br>
7: "愛莉",桃井爱莉<br>
8: "雫",日夜森雫<br>
9: "こはね",小豆泽心羽<br>
10: "杏",白石杏<br>
11: "彰人",东云彰人<br>
12: "冬弥",青柳冬弥<br>
13: "司",天马司<br>
14: "えむ",凤笑梦<br>
15: "寧々",草薙宁宁<br>
16: "類",神代类<br>
17: "奏",宵崎奏<br>
18: "まふゆ",朝比奈真冬<br>
19: "絵名",东云绘名<br>
20: "瑞希",晓山瑞希<br>

之后就可以按照操作指示制作数据集了。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Project_Sekai/tree/main>

# 3.提醒
由于版本问题，该份数据集并不是当前版本的所有数据，而且由于使用脚本对数据集进行了一个筛选，所以可能会有一些数据集的缺失。如果你想要去全部数据，可以去<sekai.best>自行寻找。 <br>

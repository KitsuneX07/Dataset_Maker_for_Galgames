# 1.解包
``[Sphere]缘之空_Yosuga_no_Sora``可以使用crass进行解包。指定插件``EntisGLS``即可。<br>
提示：对话语音文件位于``voice.noa``。<br>
对话文本位置在``yosuga.csx``。正好github上已经有不少大佬研究过了，感兴趣的话可以去看一下<https://github.com/TheRealMrWicked/CSXtoXP3> 和 <https://github.com/Murlors/Yosuga-no-Sora-Speech-Text-Extract>。我这里直接拿来用了（绝对不是因为懒）。<br>
# 2.处理
可以在txt中找到对话的脚本，然后使用``Text_Extractor_for_Yosuga_no_Sora.py``进行操作整理成按说话人分好的``.json``文件。<br>

>1: "Amatsume_Akira", 天女目 瑛 <br> 
2: "Ifukube_Yahiro",伊福部 八寻<br>
3: "Kasugano_Sora",春日野 穹<br>
4: "Kuranaga_Kozue",仓永 梢<br>
5: "Migiwa_Kazuha",渚 一叶<br>
6: "Nogisaka_Motoka",乃木坂 初佳<br>
7: "Yorihime_Nao",依媛 奈绪<br>


之后就可以按照操作指示制作数据集了。<br>
数据集已经上传至huggingface仓库。<https://huggingface.co/datasets/KitsuneX07/Datasets_for_Yosuga_no_Sora>


# 解包

``[零创游戏]饿殍：明末千里行_The_Hungry_Lamb``使用的是Unity引擎，可以使用``AssetStudio``进行解包。<br>
<https://github.com/Perfare/AssetStudio> <br>
剧本文件为单个json文件，属于MonoBehaviour类型。``Starveling.book.json``<br>
[NOTE]由于游戏使用 IL2CPP
构建，导出MonoBehaviour类型时需要先选择对应的反编译文件。推荐使用项目[Il2CppDumper](https://github.com/Perfare/Il2CppDumper)
。反编译后的文件夹在本目录也可以找到并直接使用。 <br>
对话语音文件属于AudioClip类型。注意由于有重名的文件，因此选择导出时设置AssetStudio -> Options -> Export options -> Group
exported assets by -> container path，以保留正确的文件结构。 <br>

#### 处理部分详见代码。

数据集已经上传至huggingface仓库。<https://hf-mirror.com/datasets/KitsuneX07/Datasets_for_The_Hungry_Lamb>
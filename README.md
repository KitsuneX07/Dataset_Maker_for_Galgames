# Dataset_Maker_for_Galgames
从Galgame中提取人物语音和对应文本用于制作**SVC**/**TTS**项目的数据集。<br>
Extract character voice and corresponding text from Galgame to create a dataset for **SVC**/**TTS** projects.<br>

# 1. 项目简介
本仓库用于提供从**Galgame**中提取人物语音和对应文本用于制作**SVC**/**TTS**项目的数据集的经验分享与一些辅助脚本。同时也作为个人的解包记录。不过虽说名为**Galgame**，但可能包含的游戏实际上并不属于Galgame。<br>
本文档为大致的介绍与使用说明。与此同时，每个脚本内也会含有对应的注释。一个成熟的创作者应该学会自己看代码了（逃）<br>
本仓库不会提供任何游戏的解包工具的可执行文件（但会尽量给出源码的链接）或者游戏本体。请利用搜索引擎自行寻找途径。<br>
<br>
![图片](https://github.com/KitsuneX07/Dataset_Maker_for_Galgames/blob/main/pictures/6bd238950a7b0208a6450fb175d9f2d3562cc822.jpg)
<br>
由于文件体积的原因，本仓库也不会提供解包后的音频文件。请自行解包。但是，本仓库会提供解包方法和用于制作TTS项目数据集所需要的标注文件。具体请在对应文件夹下的`README.md`中查看。<br>
<br>
# 2. 项目结构
由于游戏引擎不同，封包方式也不同。因此，本仓库会根据不同的游戏引擎进行分类，请进入对应的文件夹进行查看。<br>
与此同时，有一些通用的脚本会放在根目录下。<br>
<br>
>
>`Text_Cleaner.py` 
>> 用于清理文本中的特殊字符，比如`~` `♪` `　` `（` `）` `\n`等。这些字符会影响TTS的处理。<br>
>> 与此同时，该脚本还会筛选去除一些不适合作为数据集的文本。比如含有奇怪叫声（毕竟是Galgame）的语音以及包含其它语言的文本。<br>
>> 你可以根据自己的需要修改这个脚本来适配不同游戏。<br>
>> 输入：
>>> `绝对路径`：包含所有待处理`.json`文件的文件夹的路径。<br>
>>> 其中，所有json文件是由对应游戏的解包工具生成的，格式为`{"File": "xxx", "Text": "xxx"}`。你可以进入任何一个子文件夹进行查看。对于每个游戏，我会尽量提供制作好的json文件。<br>
>>
>> 输出：
>>> 将直接对原文件进行操作。调试时请**注意备份！**<br>
> 
> `Dataset_Maker_for_Bert_VITS2.py`
>> 用于Bert_VITS2项目的数据集制作。<https://github.com/fishaudio/Bert-VITS2><br>
>>
>> 这个脚本的主要功能是从指定的目录中读取JSON文件，并根据这些JSON文件中的信息，从另一个指定的目录中复制音频文件，然后将这些音频文件转换为.wav格式并重采样到44100hz。同时，它还会创建一个列表文件，用于作为Bert_Vits2项目的标注文件。 <br>
>> 以下是这个脚本的详细步骤：
>> 1. `copy_files` 函数接收两个参数：一个是包含JSON文件的路径，另一个是包含音频文件的路径。
>> 2. 在当前工作目录下创建两个新的文件夹：`datasets_for_bert_vits2` 和 `list_files_for_bert_vits2`。
>> 3. 判断给定的路径是文件还是文件夹。如果是单个JSON文件，那么只处理这个文件；如果是文件夹，那么处理文件夹中的所有JSON文件。
>> 4. `process_file` 函数接收四个参数：JSON文件的路径，音频文件的路径，输出文件夹的路径，和列表文件夹的路径。
>> 5. 读取JSON文件，并获取其中所有的文件名。
>> 6. 为每个JSON文件创建一个子文件夹和一个列表文件。
>> 7. 遍历搜索目录中的所有文件。如果文件名在JSON文件中，那么将这个文件复制到输出文件夹，并使用ffmpeg将其转换为.wav格式并重采样到44100hz。
>> 8. 在列表文件中添加一行，包含了音频文件的路径，文件名，语言（这里是JP），以及在JSON文件中对应的文本。<br>
>>
>> 输入：
>>> 输入参数：<br>
> 1.包含JSON文件的路径 / 单个JSON文件的路径 <br>
> 2.包含所有音频文件的路径。<br>
>>> 推荐使用Text_Cleaner.py脚本先对JSON文件进行处理。<br>
>>
>> 输出：
>>> 输出的文件夹位于当前工作目录下。<br>
>>> 1.`list_files_for_bert_vits2`文件夹。里面按说话人分类放置了对应的标注文件（`.list文件`）<br>
>>> 2.`datasets_for_bert_vits2`文件夹。里面按说话人分类放置了对应的音频文件（`.wav文件`）<br>
> 
> `Dataset_Maker_for_GPT_Sovits.py`
>> 用于GPT_Sovits项目的数据集制作。<https://github.com/RVC-Boss/GPT-SoVITS> <br>
>>
>> 这个脚本的主要功能和具体介绍和`Dataset_Maker_for_Bert_VITS2.py`一致，仅仅是输出的标注文件（`.list文件`）结构有一些变化。在此不再过多赘述。 <br>
>
> `Dataset_Maker_for_Fish_Speech.py`
>> 用于Fish_Speech项目的数据集制作。<https://github.com/fishaudio/fish-speech> <br>
>> 1. copy_files 函数接收两个参数：一个是包含JSON文件的路径，另一个是包含音频文件的路径。
>> 2. 在当前工作目录下创建一个新的文件夹：datasets_for_Fish_Speech，用于存放输出的数据集文件夹。  
>> 3. 判断给定的路径是文件还是文件夹。如果是文件，那么只处理这个文件；如果是文件夹，那么处理文件夹中的所有JSON文件。  
>> 4. process_file 函数接收三个参数：JSON文件的路径，音频文件的路径，和输出文件夹的路径。  
>> 5. 读取JSON文件，并获取其中所有的文件名。  
>> 6. 为每个JSON文件创建一个子文件夹。  
>> 7. 遍历搜索目录中的所有文件。如果文件名在JSON文件中，那么将这个文件复制到输出文件夹，并使用ffmpeg将其转换为.wav格式并重采样到44100hz。  
>> 8. 在子文件夹中创建一个与音频文件同名的标注文件（`.lab文件`），包含了该音频文件对应的文本。<br>
>>
>> 输入：
>>> 输入参数：<br>
> 1.包含JSON文件的路径 / 单个JSON文件的路径 <br>
> 2.包含所有音频文件的路径。<br>
>>> 推荐使用Text_Cleaner.py脚本先对JSON文件进行处理。<br>
>>
>> 输出：
>>> 输出的文件夹位于当前工作目录下。<br>
>>> 1. `datasets_for_Fish_Speech`文件夹。里面按说话人分类放置了对应的音频文件（`.wav文件`）和标注文件（`.lab文件`）<br>


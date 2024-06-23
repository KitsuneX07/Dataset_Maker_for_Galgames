import os
import glob
import re
import json

# 获取scripts文件夹的路径
scripts_dir = r'E:\gal\workspace\Sabbat of the Witch\scn'
if scripts_dir == '':
    # 如果没有指定路径，使用当前工作目录下的scripts文件夹
    scripts_dir = os.path.join(os.getcwd(), 'scripts')

# 获取scripts文件夹下所有txt文件的路径
json_files = glob.glob(os.path.join(scripts_dir, '*.json'))

# 创建一个新的文件夹用于存放输出文件
os.makedirs('scripts_json', exist_ok=True)

# 初始化一个空的字典来存储数据
data = {}

# 遍历所有txt文件
for json_file in json_files:
    # 使用UTF-8编码打开并读取文件
    with open(json_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # 遍历每一行
    for i in range(len(lines)):
        # 查找匹配的字符串
        # 匹配文件名形如 abc(d)(e)_123456
        match = re.search(r'"voice": "(([a-zA-Z]+)\d{3}_\d{3})"', lines[i])
        if match:
            text_match = re.search(r'「(.*?)」', lines[i-4])
            if text_match:
                # 获取匹配到的文本
                text = text_match.group(1)

                name_match = re.search(r'"name": "(.*?)"', lines[i-3])
                if name_match:
                    name = name_match.group(1)

                prefix = match.group(2)

                if prefix not in data:
                    data[prefix] = []
                # 将数据添加到列表
                data[prefix].append({'File': match.group(1), 'Text': text, 'Name': name})

# 遍历数据字典，为每个说话人创建一个JSON文件
for prefix, prefix_data in data.items():
    # 将数据写入JSON文件
    with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding='utf-8') as f:
        json.dump(prefix_data, f, ensure_ascii=False, indent=4)
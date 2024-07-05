import os
import glob
import re
import json

# 获取scripts文件夹的路径
scripts_dir = r"E:\gal\解包\scripts"
if scripts_dir == '':
    # 如果没有指定路径，使用当前工作目录下的scripts文件夹
    scripts_dir = os.path.join(os.getcwd(), 'scripts')

# 获取scripts文件夹下所有txt文件的路径
txt_files = glob.glob(os.path.join(scripts_dir, '*.txt'))

# 创建一个新的文件夹用于存放输出文件
os.makedirs('scripts_json', exist_ok=True)

# 初始化一个空的字典来存储数据
data = {}

# 遍历所有txt文件
for txt_file in txt_files:
    # 使用UTF-8编码打开并读取文件
    with open(txt_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # 遍历每一行
    for i in range(len(lines)):
        # 查找匹配的字符串
        # 匹配文件名形如 abc(d)(e)_123456
        match = re.search(r'([a-zA-Z]+)_(\d{6})', lines[i])
        if match and i+2 < len(lines):
            text_match = re.search(r'「(.*?)」', lines[i+2])
            if text_match:
                # 获取匹配到的文本
                text = text_match.group(1)

                # 获取文件名前缀 abc(d)(e)，即为说话人
                prefix = match.group(1)
                # 如果数据键不存在，创建一个新的
                if prefix not in data:
                    data[prefix] = []
                # 将数据添加到列表
                name_match = re.search(r'>([^<]+?)\n?$', lines[i+1])
                if name_match:
                    name = name_match.group(1)
                    data[prefix].append({'File': match.group(0), 'Text': text, 'Name': name})

# 遍历数据字典，为每个说话人创建一个JSON文件
for prefix, prefix_data in data.items():
    # 将数据写入JSON文件
    with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding='utf-8') as f:
        json.dump(prefix_data, f, ensure_ascii=False, indent=4)
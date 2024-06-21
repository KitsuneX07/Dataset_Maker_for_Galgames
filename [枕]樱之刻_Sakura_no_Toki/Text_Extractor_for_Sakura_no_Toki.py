import os
import glob
import re
import json

# 创建一个新的文件夹用于存放输出文件
os.makedirs('scripts_json', exist_ok=True)

# 初始化一个空的字典来存储数据
data = {}

# 获取scripts文件夹的路径
scripts_dir = r'E:\gal\解包\script'
if scripts_dir == '':
    # 如果没有指定路径，使用当前工作目录下的scripts文件夹
    scripts_dir = os.path.join(os.getcwd(), 'scripts')

# 获取scripts文件夹下所有ast文件的路径
ast_files = glob.glob(os.path.join(scripts_dir, '*.ast'))

# 遍历所有ast文件
for ast_file in ast_files:
    # 使用UTF-8编码打开并读取文件
    with open(ast_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # 遍历每一行
    for i in range(len(lines)):
        # 匹配
        match = re.search(r'([a-zA-Z]{3})_([a-zA-Z]{3})_(\d{5})', lines[i])
        if match:
            # 匹配行中的文本
            text_match = re.search(r'「(.*?)」', lines[i+5])
            if text_match:
                # 获取匹配到的文本
                text = text_match.group(1)

                name_match = re.search(r'"(.*?)"', lines[i+4])
                if name_match:
                    name = name_match.group(1)
                # 获取文件名前缀，即为说话人

                prefix = match.group(2)
                if prefix not in data:
                    data[prefix] = []

                data[prefix].append({'File': match.group(0), 'Text': text, 'Name': name})


for prefix, prefix_data in data.items():
    # 将数据写入JSON文件
    with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding='utf-8') as f:
        json.dump(prefix_data, f, ensure_ascii=False, indent=4)
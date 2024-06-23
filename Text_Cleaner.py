import json
import re
import glob
import os

def clean_text(text):
    # 筛选文本
    if re.fullmatch(r'…+', text.strip()) or \
            re.fullmatch(r'あ+', text.strip()) or \
            re.fullmatch(r'(は)?！？', text.strip()) or \
            len(re.findall(r'ぁ', text)) >= 3 or \
            len(re.findall(r'ー', text)) >= 3 or \
            len(re.findall(r'ん', text)) >= 3 or \
            len(re.findall(r'ゅ', text)) >= 3 or \
            len(re.findall(r'ゃ', text)) >= 3 or \
            re.search(r'[a-zA-Z]', text):  # 包含英文字母的文本
        print(f'Deleting text: {text}')
        return None

    # 清理文本
    text = re.sub(r' ', '', text)
    text = re.sub(r'　', '', text)
    text = re.sub(r'\\\\n', '', text)
    text = re.sub(r'\[.+?\]', '', text)
    text = re.sub(r'「|」', '', text)
    text = re.sub(r'（|）', '', text)
    text = re.sub(r'%.+;+', '', text)
    text = re.sub(r'♪', '', text)
    text = re.sub(r'●', '', text)
    text = re.sub(r'。\\n', '。', text)
    text = re.sub(r'\\n', '。', text)
    text = re.sub(r'～', '。', text)

    return text

def clean_json_file(file_path):
    # 读取JSON文件
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # 清理文本
    for item in data:
        cleaned_text = clean_text(item['Text'])
        if cleaned_text is not None:
            item['Text'] = cleaned_text
        else:
            data.remove(item)

    # 将清理后的数据写回文件
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

def clean_json_files(dir_path):
    # 获取文件夹下所有的json文件
    json_files = []

    for dirpath, dirnames, filenames in os.walk(dir_path):
        for filename in filenames:
            if filename.endswith('.json'):
                json_files.append(os.path.join(dirpath, filename))

    # 遍历并清理所有的json文件
    for json_file in json_files:
        print(f'Cleaning {json_file}')
        clean_json_file(json_file)
        print('Done!')

clean_json_files(r'E:\gal\workspace\Dataset_Maker_for_Galgames\[yuzusoft]谜语小丑_Riidle_Joker\scripts_json')
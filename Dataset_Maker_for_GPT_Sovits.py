import json
import os
import shutil
import subprocess


def copy_files(json_file_path, search_dir, output_dir_name, list_file_name):
    # 读取JSON文件
    with open(json_file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # 获取JSON文件中所有的文件名
    file_names = [item['File'] for item in data]

    # 创建输出文件夹
    output_dir_path = os.path.join(os.getcwd(), output_dir_name)
    os.makedirs(output_dir_path, exist_ok=True)

    # 创建列表文件
    list_file_path = os.path.join(os.getcwd(), list_file_name)
    with open(list_file_path, 'w', encoding='utf-8') as list_file:
        # 遍历搜索目录中的所有文件
        for file_name in os.listdir(search_dir):
            # 如果文件名在JSON文件中，则复制文件到输出文件夹
            if os.path.splitext(file_name)[0] in file_names:
                # 使用ffmpeg将音频文件转换为.wav格式并重采样到44100hz
                input_file_path = os.path.join(search_dir, file_name)
                output_file_path = os.path.join(output_dir_path, os.path.splitext(file_name)[0] + '.wav')
                subprocess.run(['ffmpeg', '-i', input_file_path, '-ar', '44100', output_file_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print(f'processing file: {file_name}')
                # 在列表文件中添加一行
                list_file.write(f'{output_file_path}|{output_dir_name}|JA|{next(item["Text"] for item in data if item["File"] == os.path.splitext(file_name)[0])}\n')

# 使用示例
copy_files(r'E:\gal\workspace\output\aid.json', r'E:\gal\workspace\voice', 'aid', 'output.list')

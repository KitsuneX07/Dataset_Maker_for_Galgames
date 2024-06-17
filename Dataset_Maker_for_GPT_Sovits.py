import json
import os
import shutil
import subprocess
import glob

def copy_files(path, search_dir):
    # 创建输出文件夹
    output_dir_path = os.path.join(os.getcwd(), 'datasets_for_GPT_Sovits')
    os.makedirs(output_dir_path, exist_ok=True)

    # 创建列表文件夹
    list_dir_path = os.path.join(os.getcwd(), 'list_files_for_GPT_Sovits')
    os.makedirs(list_dir_path, exist_ok=True)

    # 判断路径是文件还是文件夹
    if os.path.isfile(path):
        # 如果是文件，只处理这个文件
        print(f'processing single file: {path}')
        process_file(path, search_dir, output_dir_path, list_dir_path)
    elif os.path.isdir(path):
        # 如果是文件夹，处理文件夹中的所有文件
        print(f'processing directory: {path}')
        json_files = glob.glob(os.path.join(path, '*.json'))
        for json_file in json_files:
            print(f'processing json file: {json_file}')
            process_file(json_file, search_dir, output_dir_path, list_dir_path)
    else:
        print(f'Invalid path: {path}')

def process_file(json_file_path, search_dir, output_dir_path, list_dir_path):
    # 读取JSON文件
    with open(json_file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # 获取JSON文件中所有的文件名
    file_names = [item['File'] for item in data]

    name = os.path.basename(json_file_path).split('.')[0]
    # 创建子文件夹
    sub_output_dir_path = os.path.join(output_dir_path, name)
    os.makedirs(sub_output_dir_path, exist_ok=True)

    # 创建列表文件
    list_file_path = os.path.join(list_dir_path, name, 'output.list')
    os.makedirs(os.path.dirname(list_file_path), exist_ok=True)

    with open(list_file_path, 'w', encoding='utf-8') as list_file:
        # 遍历搜索目录中的所有文件
        for file_name in os.listdir(search_dir):
            # 如果文件名在JSON文件中，则复制文件到输出文件夹
            if os.path.splitext(file_name)[0] in file_names:
                # 使用ffmpeg将音频文件转换为.wav格式并重采样到44100hz
                input_file_path = os.path.join(search_dir, file_name)
                output_file_path = os.path.join(sub_output_dir_path, os.path.splitext(file_name)[0] + '.wav')
                os.makedirs(os.path.dirname(output_file_path), exist_ok=True)
                subprocess.run(['ffmpeg', '-i', input_file_path, '-ar', '44100', output_file_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print(f'\rprocessing file: {file_name}', end='')

                # 在列表文件中添加一行
                list_file.write(f'{sub_output_dir_path}|{name}|JA|{next(item["Text"] for item in data if item["File"] == os.path.splitext(file_name)[0])}\n')
        print('\nDone!')

# 使用示例
copy_files(r'E:\gal\workspace\output', r'E:\gal\workspace\voice')
import json
import os
import shutil
import subprocess
import glob

def copy_files(path, search_dir):
    # 创建输出文件夹
    output_dir_path = os.path.join(os.getcwd(), 'datasets_for_Fish_Speech')
    os.makedirs(output_dir_path, exist_ok=True)

    # 判断路径是文件还是文件夹
    if os.path.isfile(path):
        # 如果是文件，只处理这个文件
        print(f'processing single file: {path}')
        process_file(path, search_dir, output_dir_path)
    elif os.path.isdir(path):
        # 如果是文件夹，处理文件夹中的所有文件
        print(f'processing directory: {path}')
        all_files = os.listdir(path)
        json_files = [file for file in all_files if file.endswith('.json')]
        for json_file in json_files:
            print(f'processing json file: {json_file}')
            json_file = os.path.join(path, json_file)
            process_file(json_file, search_dir, output_dir_path)
    else:
        print(f'Invalid path: {path}')

def process_file(json_file_path, search_dir, output_dir_path, convert_to_wav=False): # convert_to_wav=False 则仅仅复制，不进行重采样和转换
    # 读取JSON文件
    with open(json_file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # 获取JSON文件中所有的文件名
    file_names = [item['File'] for item in data]

    name = os.path.basename(json_file_path).split('.')[0]
    # 创建子文件夹
    sub_output_dir_path = os.path.join(output_dir_path, name)
    os.makedirs(sub_output_dir_path, exist_ok=True)

    # 遍历搜索目录及其所有子目录中的所有文件
    for dirpath, dirnames, filenames in os.walk(search_dir):
        for file_name in filenames:

            if os.path.splitext(file_name)[0] in file_names:
                input_file_path = os.path.join(dirpath, file_name)
                if convert_to_wav:
                    # 使用ffmpeg将音频文件转换为.wav格式并重采样到44100hz
                    output_file_path = os.path.join(sub_output_dir_path, os.path.splitext(file_name)[0] + '.wav')
                    subprocess.run(['ffmpeg', '-i', input_file_path, '-ar', '44100', output_file_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                else:
                    # 保留原格式
                    output_file_path = os.path.join(sub_output_dir_path, file_name)
                    shutil.copy(input_file_path, output_file_path)
                print(f'\rprocessing file: {file_name}', end='')

                # 创建对应的lab文件
                lab_file_path = os.path.join(sub_output_dir_path, os.path.splitext(file_name)[0] + '.lab')
                with open(lab_file_path, 'w', encoding='utf-8') as lab_file:
                    lab_file.write(next(item["Text"] for item in data if item["File"] == os.path.splitext(file_name)[0]))

    print('\nDone!')

# 使用示例
copy_files(r"E:\gal\workspace\Dataset_Maker_for_Galgames\[craftegg]少女乐团派对_BanG_Dream\scripts_json", r"D:\ghast\downloads\bestdori-voice-extractor-main\mp3")
import json
import os
import shutil
import subprocess
import glob
from pydub import AudioSegment

def check_audio_file(file_path):
    try:
        audio = AudioSegment.from_wav(file_path)
        return True
    except:
        return False

def process(json_path, search_dir):

    # 创建输出文件夹
    output_dir_path = os.path.join(os.getcwd(), 'datasets')
    os.makedirs(output_dir_path, exist_ok=True)

    if os.path.isdir(json_path):
        process_folder(json_path, search_dir, output_dir_path)

    elif os.path.isfile(json_path):
        process_file(json_path, search_dir, output_dir_path)

    else:
        print(f'{json_path} is not a valid path')

def process_folder(path, search_dir, output_dir_path):
    if os.path.isdir(path):
        files = os.listdir(path)
        json_files = [file for file in files if file.endswith('.json')]
        for json_file in json_files:
            process_file(os.path.join(path, json_file), search_dir, output_dir_path)
            print(f'processed {json_file}')
    else:
        print(f'{path} is not a directory')

def process_file(path, search_dir, output_dir_path):

    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
        proceesed = []
        for i in data:

            # 获取名字作为输出文件夹的文件名
            output_dir_name = i['Name']
            output_path = os.path.join(output_dir_path, output_dir_name)
            os.makedirs(output_path, exist_ok=True)

            # 获取搜索的文件名
            searching_file_name = i['File']
            if searching_file_name in proceesed:
                continue

            for dirpath, dirnames, filenames in os.walk(search_dir):
                for file_name in filenames:
                    if os.path.splitext(file_name)[0] == searching_file_name:
                        input_file_path = os.path.join(dirpath, file_name)

                        output_file_path = os.path.join(output_path, file_name)
                        # output_file_path = os.path.join(output_path, os.path.splitext(file_name)[0] + '.wav')

                        # subprocess.run(['ffmpeg', '-i', input_file_path, '-ar', '44100', output_file_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                        shutil.copy(input_file_path, output_file_path) # 保留原格式

                        # 创建对应的lab文件
                        lab_file_path = os.path.join(output_path, os.path.splitext(file_name)[0] + '.lab')
                        with open(lab_file_path, 'w', encoding='utf-8') as lab_file:
                            text = i['Text']
                            text = text.replace('\n', '')
                            lab_file.write(text)

                        print(f'copied {file_name} to {output_dir_name}')
                        proceesed.append(searching_file_name)


process(r"E:\gal\workspace\Dataset_Maker_for_Galgames\[ANIPLEX.EXE]亚托莉_ATRI\scripts_json", r"E:\gal\解包\ATRI")
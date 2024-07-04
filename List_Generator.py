import glob
import os

# project = "GPT_SoVITS"
project = "Bert_VITS2"
audio_folder = r"E:\gal\workspace\Dataset_Maker_for_Galgames\datasets"
output_folder = os.path.join(os.getcwd(), f'list_for_{project}')
os.makedirs(output_folder, exist_ok=True)

def process_folder(audio_folder, output_folder):
    if os.path.isdir(audio_folder):
        subfolders = [f.path for f in os.scandir(audio_folder) if f.is_dir()]
        for subfolder in subfolders:
            process(subfolder, output_folder)
    else:
        print(f'{audio_folder} is not a directory')

def process(subfolder, output_folder):
    # 获取子文件夹的名字作为list文件的名字
    list_file_name = os.path.basename(subfolder) + '.list'
    list_file_path = os.path.join(output_folder, list_file_name)

    # 获取子文件夹中的所有.wav和.lab文件
    wav_files = glob.glob(os.path.join(subfolder, '*.wav'))
    lab_files = glob.glob(os.path.join(subfolder, '*.lab'))

    with open(list_file_path, 'w', encoding='utf-8') as list_file:
        for wav_file in wav_files:
            lab_file = next((f for f in lab_files if os.path.splitext(f)[0] == os.path.splitext(wav_file)[0]), None)

            if lab_file is not None:
                with open(lab_file, 'r', encoding='utf-8') as f:
                    text = f.read().replace('\n', ' ')

                # 写入到list文件中
                if project == "GPT_SoVITS":
                    file_path = f'D:\\GPT-SoVITS\\Data\\{os.path.basename(subfolder)}\\{os.path.basename(wav_file)}'
                    name = os.path.basename(subfolder)
                    language = 'JA'
                    list_file.write(f'{file_path}|{name}|{language}|{text}\n')
                elif project == "Bert_VITS2":
                    name = os.path.splitext(list_file_name)[0]
                    list_file.write(f'./Data/{name}/wavs/{os.path.basename(wav_file)}|{name}|JP|{text}\n')


process_folder(audio_folder, output_folder)
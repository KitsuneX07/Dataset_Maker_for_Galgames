import os
import subprocess
import glob

def convert_mp3_to_wav(folder_path):
    # 获取文件夹及其所有子文件夹中的所有MP3文件
    mp3_files = glob.glob(os.path.join(folder_path, "**", "*.mp3"), recursive=True)

    for mp3_file in mp3_files:
        # 创建.wav文件的路径
        wav_file = os.path.splitext(mp3_file)[0] + '.wav'

        # 使用ffmpeg将MP3文件转换为.wav格式并重采样到44100hz
        subprocess.run(['ffmpeg', '-i', mp3_file, '-ar', '44100', wav_file], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # 删除原始的MP3文件
        os.remove(mp3_file)

        print(f'Converted {mp3_file} to {wav_file}')

# 使用示例
convert_mp3_to_wav(r"E:\gal\workspace\Dataset_Maker_for_Galgames\datasets_for_BanG_Dream")
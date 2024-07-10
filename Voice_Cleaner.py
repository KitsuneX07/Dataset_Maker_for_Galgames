# 清理时长短于2s大于15s的音频文件
import os
import wave

def clean_voice_files(dir_path):
    voice_files = []
    delete_files = []

    for dirpath, dirnames, filenames in os.walk(dir_path):
        for filename in filenames:
            if filename.endswith('.wav'):
                voice_files.append(os.path.join(dirpath, filename))

    # 清理时长短于2s大于15s的音频文件
    for file_path in voice_files:
        with wave.open(file_path, 'r') as wf:
            duration = wf.getnframes() / float(wf.getframerate())
            if duration < 2 or duration > 15:
                print(f'Deleting file: {file_path}')
                delete_files.append(file_path)

    for file_path in delete_files:
        os.remove(file_path)


if __name__ == '__main__':
    dir_path = r'D:\download\BanG_Dream'
    clean_voice_files(dir_path)
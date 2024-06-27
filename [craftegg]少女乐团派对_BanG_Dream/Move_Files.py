import os
import glob
import shutil
import json

folder_path = r"D:\ghast\downloads\bestdori-voice-extractor-main\voices"
output_folder_path = r"D:\ghast\downloads\bestdori-voice-extractor-main\mp3"

mp3_path = glob.glob(os.path.join(folder_path, "**", "*.mp3"), recursive=True)

for file in mp3_path:
    shutil.copy2(file, output_folder_path)
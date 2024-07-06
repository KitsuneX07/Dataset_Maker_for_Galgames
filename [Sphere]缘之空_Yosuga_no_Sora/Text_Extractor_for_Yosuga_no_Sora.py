import os
import glob
import re
import json

def extract_text_from_file(file_path):

    os.makedirs('scripts_json', exist_ok=True)
    data = {}


    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        # example line: "yosuga_wav/Kasugano_Sora/SR000152.wav|0|え...町まで出るの？"
        for line in lines:
            parts = line.split("|")
            part1 = parts[0].split("/")
            name = part1[1]
            text = parts[2]
            if text.endswith('\n'):
                text = text[:-1]
            file = part1[2]
            if file.endswith('.wav'):
                file = file[:-4]
            if name and text and file:
                if name not in data:
                    data[name] = []
                data[name].append({'File': file, 'Text': text, 'Name': name})

    for name, name_data in data.items():
        with open(os.path.join('scripts_json', f'{name}.json'), 'w', encoding='utf-8') as f:
            json.dump(name_data, f, ensure_ascii=False, indent=4)

file_path = r"E:\gal\workspace\yosuga.txt"
extract_text_from_file(file_path)
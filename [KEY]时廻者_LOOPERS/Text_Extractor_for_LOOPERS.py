import re
import os
import json


def select_ss_files(folder_path):
    ss_files = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith(".ss"):
                ss_files.append(os.path.join(root, file))
    return ss_files


def read_ss_file(file_path):
    with open(file_path, 'r', encoding = 'Shift_JIS') as f:
        return f.readlines()


def extract_line(line, data):
    if re.search(r"KOE\(\d+,\d+\)【.*?】「.*?」", line):
        # print(line)
        file_name = re.search(r"KOE\(\d+,\d+\)", line).group(0)[4:13]
        file_path = "z" + file_name[:4] + "#" + file_name[4:] + ".ogg"
        # print(file_path)
        text = re.search(r"「.*?」", line).group(0)[1:-1]
        # print(text)
        name = re.search(r"【.*?】", line).group(0)[1:-1]
        # print(name)

        if name not in data:
            data[name] = []
        data[name].append({'File': file_path, 'Text': text, 'Name': name})


if __name__ == "__main__":
    folder_path = r"D:\projects\python\Dataset_Maker_for_Galgames\[KEY]时廻者_LOOPERS\ss_20210517_084828"
    ss_files = select_ss_files(folder_path)
    data = {}
    for ss_file in ss_files:
        print("Extracting from", ss_file)
        lines = read_ss_file(ss_file)
        for line in lines:
            extract_line(line, data)
    for prefix, prefix_data in data.items():
        os.makedirs('scripts_json', exist_ok = True)
        with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding = 'utf-8') as f:
            json.dump(prefix_data, f, ensure_ascii = False, indent = 4)

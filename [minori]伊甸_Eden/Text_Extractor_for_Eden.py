import os, glob, re, json, sys

sys.path.append(".")

data = {}


def process_folder(folder_path):
    print("Processing folder: " + folder_path)
    for file_path in glob.glob(os.path.join(folder_path, "*.sc")):
        read_file(file_path)


def read_file(file_path):
    print("Reading file: " + file_path)
    with open(file_path, 'r', encoding = 'Shift_JIS') as f:
        return extract_text(f.readlines())


def extract_text(lines):
    for i in range(len(lines)):
        print(i, lines[i])
        lines[i] = lines[i].replace("#", "").replace("@", "")
        if ".message" in lines[i] and "「" in lines[i]:
            split_line = (lines[i].split('「'))[0].split()
            if len(split_line) == 4:
                file_path = split_line[2] + ".ogg"
                name = split_line[3]
                text = re.search(r'「(.*)」', lines[i]).group(1)
            elif len(split_line) == 5:
                file_path = split_line[2] + ".ogg"
                name = split_line[3] + split_line[4]
                text = re.search(r'「(.*)」', lines[i]).group(1)
            if file_path and name and text:
                if name not in data:
                    data[name] = []
                data[name].append({'File': file_path, 'Text': text, 'Name': name})


if __name__ == "__main__":
    folder_path1 = "E:\\unpacked\\eden\\PMscr"
    folder_path2 = "E:\\unpacked\\eden\\scr"
    process_folder(folder_path1)
    process_folder(folder_path2)
    for prefix, prefix_data in data.items():
        os.makedirs('scripts_json', exist_ok = True)
        with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding = 'utf-8') as f:
            json.dump(prefix_data, f, ensure_ascii = False, indent = 4)

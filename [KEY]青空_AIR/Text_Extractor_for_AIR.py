import os
import glob
import re
import json

# 获取scripts文件夹的路径
# 使用当前工作目录下的‘seens’文件夹
scripts_dir = os.path.join(os.getcwd(), 'seens')

def extract_file_pairs(scripts_dir):
    files = os.listdir(scripts_dir)
    pairs = {}

    for file in files:
        if file.endswith('.utf'):
            base_name = os.path.splitext(file)[0]

            ke_file = base_name + '.ke'
            utf_file = base_name + '.utf'

            ke_path = os.path.join(scripts_dir, ke_file)
            utf_path = os.path.join(scripts_dir, utf_file)

            if os.path.exists(ke_path) and os.path.exists(utf_path):
                pairs[base_name] = {'ke': ke_path, 'utf': utf_path}

    return pairs

def extract_text(pairs):
    os.makedirs('scripts_json', exist_ok=True)
    data = {}

    for base_name, paths in pairs.items():
        ke_path = paths['ke']
        utf_path = paths['utf']

        with open(ke_path, 'r', encoding='utf-8') as ke_f, open(utf_path, 'r', encoding='utf-8') as utf_f:
            ke_lines = ke_f.readlines()
            utf_lines = utf_f.readlines()

            for i in range(len(ke_lines)):
                ke_line = ke_lines[i]
                if ke_line.startswith('koePlay'):
                    match = re.search(r'\((\d{6,7})\)', ke_line)
                    if match:
                        if len(match.group(1)) == 6:
                            folder_number = '000' + match.group(1)[0:1]
                            path = os.path.join(r'D:\ghast\downloads\AIR\AIR\KOE', folder_number, 'Z000' + match.group(1) + '.ogg')
                        else:
                            folder_number = '00' + match.group(1)[0:2]
                            path = os.path.join(r'D:\ghast\downloads\AIR\AIR\KOE', folder_number, 'Z00' + match.group(1) + '.ogg')

                        raw_pos = ke_lines[i + 1]
                        pos = re.search(r'#res<(\d{4})>', raw_pos)
                        if pos:
                            pos = f"<{pos.group(1)}>"
                            for utf_line in utf_lines:
                                if utf_line.startswith(pos):
                                    if "\\m{A}" in utf_line:
                                        utf_line = utf_line.replace("\\m{A}", "ゆきと")
                                    speaker, text = extract_speaker_and_text_from_utf_line(utf_line)
                                    if speaker and text:
                                        if speaker not in data:
                                            data[speaker] = []
                                        data[speaker].append({'File': path, 'Text': text, 'Name': speaker})
                                    break

    for name, name_data in data.items():
        with open(os.path.join('scripts_json', f'{name}.json'), 'w', encoding='utf-8') as f:
            json.dump(name_data, f, ensure_ascii=False, indent=4)




def extract_speaker_and_text_from_utf_line(utf_line):
    """
    Extracts the speaker and text from a utf line.
    """
    match = re.search(r'\\{([^}]+)}「([^」]+)」', utf_line)
    if match:
        return match.group(1), match.group(2)   # Speaker, Text
    return None, None



scripts_dir = os.path.join(os.getcwd(), 'seens')
pairs = extract_file_pairs(scripts_dir)
extract_text(pairs)



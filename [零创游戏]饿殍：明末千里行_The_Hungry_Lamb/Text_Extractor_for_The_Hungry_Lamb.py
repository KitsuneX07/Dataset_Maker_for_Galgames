import os, glob, re, json, sys

sys.path.append(".")

data = {}


def read_file(file_path):
    with open(file_path, 'r', encoding = 'utf-8') as f:
        return f.readlines()


def extract_text(lines):
    data = {}
    for i in range(len(lines)):
        if "穗篇" in lines[i] or "良篇" in lines[i]:
            path = re.search(r'\"(.*?)\"', lines[i]).group(1)
            print(path)
            name = re.search(r'\/(.*?)\/', path).group(1)
            print(name)
            text = re.search(r'\[(.*?)\]', lines[i + 2]).group(1)
            print(text)

            if path and name and text:
                if name not in data:
                    data[name] = []
                data[name].append({'File': path, 'Text': text, 'Name': name})

    return data


if __name__ == "__main__":
    data = extract_text(read_file("Starveling.book.json"))
    for prefix, prefix_data in data.items():
        os.makedirs('scripts_json', exist_ok = True)
        with open(os.path.join('scripts_json', f'{prefix}.json'), 'w', encoding = 'utf-8') as f:
            json.dump(prefix_data, f, ensure_ascii = False, indent = 4)

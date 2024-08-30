import os, glob, re, json, sys, shutil

sys.path.append(".")


def process_folder(path, output_dir_path, searching_folder):
    if os.path.isdir(path):
        files = os.listdir(path)
        json_files = [file for file in files if file.endswith('.json')]
        for json_file in json_files:
            process_file(os.path.join(path, json_file), output_dir_path, searching_folder)
            print(f'processed {json_file}')
    else:
        print(f'{path} is not a directory')


def process_file(path, output_dir_path, searching_folder):
    with open(path, 'r', encoding = 'utf-8') as f:
        data = json.load(f)
        for item in data:
            output_dir_name = item['Name']
            output_path = os.path.join(output_dir_path, output_dir_name)
            os.makedirs(output_path, exist_ok = True)

            searching_file_path = searching_folder + '\\' + item['File'].replace('/', '\\')
            print(searching_file_path)
            if os.path.exists(searching_file_path):
                output_path = os.path.join(output_dir_path, item['Name'], item['File'].replace('/', '_'))
                shutil.copy(searching_file_path, output_path)
                lab_file_path = output_path.split('.')[0] + ".lab"
                with open(lab_file_path, 'w', encoding = 'utf-8') as lab_file:
                    text = item['Text']
                    lab_file.write(text)


if __name__ == "__main__":
    script_folder = "D:\\projects\\python\\Dataset_Maker_for_Galgames\\[KEY]星之终途_Stella_of_The_End\\scripts_json"
    search_folder = "E:\\gal\\星之终途\\unpack\\voice1"
    output_folder = "datasets"
    process_folder(script_folder, output_folder, search_folder)

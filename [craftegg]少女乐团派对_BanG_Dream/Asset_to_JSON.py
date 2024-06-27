import os
import glob
import json

def get_unique_filename(filename):
    counter = 1
    new_filename = filename
    while os.path.exists(new_filename):
        name, extension = os.path.splitext(filename)
        new_filename = f"{name}_{counter}{extension}"
        counter += 1
    return new_filename

folder_path = r"D:\ghast\downloads\bestdori-voice-extractor-main\assets\scenario"
assets_path = glob.glob(os.path.join(folder_path, "**", "*.asset"), recursive=True)

current_path = os.path.dirname(os.path.realpath(__file__))
new_folder = os.path.join(current_path, 'scripts')
os.makedirs(new_folder, exist_ok=True)

for asset_path in assets_path:
    try:
        with open(asset_path, 'r', encoding='utf-8') as file:
            data = json.load(file)

        filename = os.path.basename(asset_path)
        filename = os.path.splitext(filename)[0] + '.json'
        output_path = os.path.join(new_folder, filename)
        output_path = get_unique_filename(output_path)

        with open(output_path, 'w', encoding='utf-8') as file:
            json.dump(data, file, ensure_ascii=False, indent=4)
    except Exception as e:
        print(f"Error processing file {asset_path}: {e}")
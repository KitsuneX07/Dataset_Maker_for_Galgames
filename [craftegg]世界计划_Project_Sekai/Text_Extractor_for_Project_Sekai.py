import os
import glob
import re
import json

enum = {
    1: "一歌",
    2: "咲希",
    3: "穂波",
    4: "志歩",
    5: "みのり",
    6: "遥",
    7: "愛莉",
    8: "雫",
    9: "こはね",
    10: "杏",
    11: "彰人",
    12: "冬弥",
    13: "司",
    14: "えむ",
    15: "寧々",
    16: "類",
    17: "奏",
    18: "まふゆ",
    19: "絵名",
    20: "瑞希",
}

# 获取当前脚本的路径
current_path = os.path.dirname(os.path.realpath(__file__))

# 创建新的文件夹
new_folder = os.path.join(current_path, 'scripts_json')
os.makedirs(new_folder, exist_ok=True)

folder_path = r"E:\gal\workspace\pjsk\sssekai\export\scenerio\MonoBehaviour"

json_path = glob.glob(os.path.join(folder_path, '*.json'))

count = 0
useful_count = 0
output = {}

for json_path in json_path:
    with open(json_path, 'r', encoding='utf-8') as f:
        print("Processing: " + json_path)
        data = json.load(f)
        if "TalkData" in data:
            for talk in data["TalkData"]:
                if "Body" in talk:
                    text = talk["Body"]
                if "Voices" in talk:
                    if len(talk["Voices"]) > 0 and 0 < talk["Voices"][0]["Character2dId"] <= 20 and enum[talk["Voices"][0]["Character2dId"]] == talk["WindowDisplayName"]:
                        file = talk["Voices"][0]["VoiceId"]
                        name = talk["WindowDisplayName"]
                        # print("Found: " + name + " " + file + " " + text)
                        if name not in output:
                            output[name] = []
                        output[name].append({'File': file, 'Text': text, 'Name': name})
                        # print(output[name])
                        useful_count += 1
        count += 1
        print("Processed: " + str(count) + " /3696 files, " + str(useful_count) + " useful audio files")

for name, name_data in output.items():
    with open(os.path.join(new_folder, f'{name}.json'), 'w', encoding='utf-8') as f:
        json.dump(name_data, f, ensure_ascii=False, indent=4)
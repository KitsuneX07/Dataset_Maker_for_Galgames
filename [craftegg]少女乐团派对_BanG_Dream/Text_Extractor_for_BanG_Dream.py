import os
import glob
import re
import json

enum = {
    1: "香澄",
    2: "たえ",
    3: "りみ",
    4: "沙綾",
    5: "有咲",
    6: "蘭",
    7: "モカ",
    8: "ひまり",
    9: "巴",
    10: "つぐみ",
    11: "こころ",
    12: "薫",
    13: "はぐみ",
    14: "花音",
    15: "美咲",
    16: "彩",
    17: "日菜",
    18: "千聖",
    19: "麻弥",
    20: "イヴ",
    21: "友希那",
    22: "紗夜",
    23: "リサ",
    24: "あこ",
    25: "燐子",
    26: "ましろ",
    27: "透子",
    28: "七深",
    29: "つくし",
    30: "瑠唯",
    31: "レイヤ",
    32: "ロック",
    33: "マスキング",
    34: "パレオ",
    35: "チュチュ",
    36: "燈",
    37: "愛音",
    38: "楽奈",
    39: "そよ",
    40: "立希"
}

# 获取当前脚本的路径
current_path = os.path.dirname(os.path.realpath(__file__))

# 创建新的文件夹
new_folder = os.path.join(current_path, 'scripts_json')
os.makedirs(new_folder, exist_ok=True)

folder_path = r"D:\ghast\downloads\bestdori-voice-extractor-main\scripts"

json_path = glob.glob(os.path.join(folder_path, '*.json'))

count = 0
useful_count = 0
output = {}

for json_path in json_path:
    with open(json_path, 'r', encoding='utf-8') as f:
        print("Processing: " + json_path)
        data = json.load(f)
        if "Base" in data:
            if "talkData" in data["Base"]:
                for talk in data["Base"]["talkData"]:
                    if "body" in talk:
                        text = talk["body"]
                    if "voices" in talk and "windowDisplayName" in talk:
                        if len(talk["voices"]) > 0 and 0 < talk["voices"][0]["characterId"] <= 40 and enum[talk["voices"][0]["characterId"]] == talk["windowDisplayName"]:
                            file = talk["voices"][0]["voiceId"]
                            name = talk["windowDisplayName"]
                            # print("Found: " + name + " " + file + " " + text)
                            if name not in output:
                                output[name] = []
                            output[name].append({'File': file, 'Text': text, 'Name': name})
                            # print(output[name])
                            useful_count += 1
        count += 1
        print("Processed: " + str(count) + " / 7560 files, " + str(useful_count) + " useful audio files")

for name, name_data in output.items():
    with open(os.path.join(new_folder, f'{name}.json'), 'w', encoding='utf-8') as f:
        json.dump(name_data, f, ensure_ascii=False, indent=4)
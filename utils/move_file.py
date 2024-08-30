"""
将目录内所有目标格式文件复制/剪切到指定目录。
"""

import os
import shutil

target_formats = ['.wav', '.ogg', '.opus']  # change to satisfy your needs


def move_files(src_dir, dst_dir, is_copy = False):
    for root, dirs, files in os.walk(src_dir):
        for file in files:
            if os.path.splitext(file)[1] in target_formats:
                file_path = os.path.join(root, file)
                if is_copy:
                    shutil.copy(file_path, dst_dir)
                else:
                    shutil.move(file_path, dst_dir)


if __name__ == "__main__":
    src_dir = "E:\\gal\\星之终途\\unpack\\voice"
    dst_dir = "E:\\gal\\星之终途\\unpack\\voice1"
    move_files(src_dir, dst_dir, is_copy = True)

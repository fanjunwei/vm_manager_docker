#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import shutil
import subprocess


def create_init_file():
    init_base_dir = '/init_file'
    for root, dirs, files in os.walk(init_base_dir):
        dist_dir_path = root.replace(init_base_dir, '')
        if not dist_dir_path.startswith('/'):
            dist_dir_path = '/' + dist_dir_path
        if not os.path.exists(dist_dir_path):
            os.makedirs(dist_dir_path)
        for file_name in files:
            src_file_path = os.path.join(root, file_name)
            dist_file_path = os.path.join(dist_dir_path, file_name)
            if not os.path.exists(dist_file_path):
                shutil.copyfile(src_file_path, dist_file_path)


def run_cmd(cmd):
    p = subprocess.Popen(cmd, shell=True)
    p.wait()
    return p.returncode


def main():
    create_init_file()
    # exit(run_cmd("/usr/sbin/init"))


if __name__ == '__main__':
    main()

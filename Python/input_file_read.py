# -*- coding:utf-8 -*-
'''
テキストファイルの読み込み
テキストファイルに記載されているパスを1行ずつ読み込んでリストに追加する
'''

import os
path_list = []

f = open("path.txt", 'r')
for path in f:
    path_list.append(os.path.dirname(path))

print(path_list)

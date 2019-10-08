# -*- coding:utf-8 -*-
'''
ファイルの行数を数える
外部ファイルの行数を表示
'''

num_lines = sum(1 for line in open('line.txt'))

print(num_lines)

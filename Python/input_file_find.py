# -*- coding:utf-8 -*-
'''
ファイルの中身を検索
ファイルから文字列を検索しヒットした行を表示
'''

file = open('find.txt')
lines = file.readlines()
file.close()

for line in lines:
    if line.find('Python') >= 0:
        print(line[:-1])

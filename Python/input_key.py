# -*- coding:utf-8 -*-
'''
標準入力から値を取得し変数に格納する
入力判定で処理を制御する
'''

import sys

print('処理番号を入力してください')
print('1:処理1')
print('2:処理2')
print('3:処理3')

# キーボードから入力した値を変数に格納する
# input1 = sys.stdin.readline()

# 改行を除去し値を文字列として格納する
# input1 = str(sys.stdin.readline().strip())

input1 = str(sys.stdin.readline().strip())

if input1 == '1':
  print('処理1が選択されました')
elif input1 == '2':
  print('処理2が選択されました')
elif input1 == "3":
  print('処理3が選択されました')
else:
  print('該当する処理がありません')

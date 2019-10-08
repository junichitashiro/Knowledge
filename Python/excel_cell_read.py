# -*- coding:utf-8 -*-
'''
address.txtファイルに記載した特定のセルを読み込む
外部ファイルにはカンマ区切りで(行,列)を記載する
'''

import xlrd

address_txt = 'address.txt'
cell_address = []
value_list = []
workbook = 'test.xlsx'
book = xlrd.open_workbook(workbook)
sheet = book.sheet_by_name('Sheet1')

# address.txtからセル情報を読み込む
f =open(address_txt, 'r')
for cell in f:
  # 参照するセルのアドレス情報をcell_addressに格納する
  cell_address = cell.strip().split(',')
  # cell_addressをもとに参照した値をvalue_listに格納する
  value_list.append(sheet.cell(int(cell_address[0]), int(cell_address[1])).value)
f.close()

print(str(value_list))

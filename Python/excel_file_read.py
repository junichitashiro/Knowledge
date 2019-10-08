# -*- coding:utf-8 -*-
'''
エクセルファイルを読み込む
'''

import xlrd

workbook = xlrd.open_workbook('test.xlsx')
sheet1 = workbook.sheet_by_index(0)

for col in range(sheet1.ncols):
  for row in range(sheet1.nrows):
    cell_value = sheet1.cell(row, col).value
    print(cell_value)

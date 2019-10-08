# -*- coding:utf-8 -*-
'''
平日か休日かの判定
weekday関数(月曜～日曜を0～6で返す)から曜日を調べて平日か休日かを判定する
'''

from datetime import date
import datetime

def check_date(input_ymd):
  check_date = datetime.datetime.strptime(input_ymd, '%Y%m%d')

  yy = int(check_date.strftime('%Y'))
  mm = int(check_date.strftime('%m'))
  dd = int(check_date.strftime('%d'))

  if date(yy, mm, dd).weekday() < 5:
    date_result = '平日'
  else:
    date_result = '休日'

  return date_result
# --------------------
# メイン処理
# --------------------
input_ymd = '20201020' # yyyymmdd で指定する
print(check_date(input_ymd))

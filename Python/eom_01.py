# -*- coding:utf-8 -*-
'''
先月末日の取得
今日の年月日（yyyymmdd）から今日の日数(dd)を引いて先月末日を求める
'''

import datetime

today = datetime.datetime.today()
last_month = today - datetime.timedelta(days=today.day)

print(today)
print(last_month.strftime('%Y%m%d'))

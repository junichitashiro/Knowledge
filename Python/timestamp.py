# -*- coding:utf-8 -*-
'''
最終更新日の取得
os.statで最終更新日を取得し、エポックタイム⇒ローカルタイム⇒文字列型に変換する
'''

import datetime
import os

modified = os.stat('test.txt').st_mtime
print(modified)

date_modified = datetime.datetime.fromtimestamp(modified)
print(date_modified)

date_modified_ymd = date_modified.strftime('%Y/%m/%d')
print(date_modified_ymd)

# -*- coding:utf-8 -*-
'''
先月同日、翌月同日の取得
relativedeltaを使用すると容易に求められる
'''

import datetime
from dateutil import relativedelta

today = datetime.datetime.today()
last_month = today - relativedelta.relativedelta(months=1)
next_month = today + relativedelta.relativedelta(months=1)

print(today)
print(last_month)
print(next_month)

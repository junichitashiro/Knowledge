# -*- coding:utf-8 -*-
'''
先月末日の取得
calender関数を使用した先月末日の取得
'''

import calendar
import datetime
from dateutil import relativedelta

today = datetime.datetime.today()
last_month = today - relativedelta.relativedelta(months=1)
days = calendar.monthrange(last_month.year, last_month.month)[1]
last_month_day = datetime.date(last_month.year, last_month.month, days)

print(last_month_day)

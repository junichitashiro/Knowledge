import streamlit as st
import numpy as np
import pandas as pd
from PIL import Image
import time

'--------------------------------------------------'
st.write('データフレームの表示')
'--------------------------------------------------'
df = pd.DataFrame({
  '1列目': [1, 2, 3, 4],
  '2列目': [10, 20, 30, 40]
})

st.write('st.write')
st.write(df)

st.write('dataframe')
st.dataframe(df, width=100, height=100)
st.dataframe(df.style.highlight_max(axis=0))
st.dataframe(df.style.highlight_max(axis=1))

st.write('table')
st.table(df.style.highlight_max(axis=0))


'--------------------------------------------------'
st.write('グラフの表示')
'--------------------------------------------------'
df = pd.DataFrame(
  np.random.rand(20, 3),
  columns=['a', 'b', 'c']
)

st.write('折れ線グラフ')
st.line_chart(df)

st.write('エリアチャート')
st.area_chart(df)

st.write('棒グラフ')
st.bar_chart(df)


'--------------------------------------------------'
st.write('マップの表示')
'--------------------------------------------------'
df = pd.DataFrame(
  np.random.rand(100, 2)/[50, 50] + [35.69, 139.70],
  columns=['lat', 'lon']
)
st.map(df)


'--------------------------------------------------'
st.write('画像の表示')
'--------------------------------------------------'
img = Image.open('sandbag.png')
st.image(img, caption='sandbag', use_column_width=False)


'--------------------------------------------------'
st.write('チェックボックスの表示')
'--------------------------------------------------'
if st.checkbox('チェックを入れて画像を表示'):
  img = Image.open('sandbag.png')
  st.image(img, caption='sandbag', use_column_width=False)


'--------------------------------------------------'
st.write('セレクトボックスの表示')
'--------------------------------------------------'
option = st.selectbox(
  '数字を選択',
  list(range(1,11))
)
option


'--------------------------------------------------'
st.write('テキストボックスの表示')
'--------------------------------------------------'
text = st.text_input('')
'入力値：', text


'--------------------------------------------------'
st.write('スライダーの表示')
'--------------------------------------------------'
condition = st.slider('あなたの今の調子は？', 0, 100, 50)
'コンディション：', condition


'--------------------------------------------------'
st.write('プログレスバーの表示')
'--------------------------------------------------'
'Start!!'

latest_iteration = st.empty()
bar = st.progress(0)

for i in range(100):
  latest_iteration.text(f'Iteration {i+1}')
  bar.progress(i + 1)
  time.sleep(0.001)

'Done!!'

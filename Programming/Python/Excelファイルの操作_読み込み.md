# Excelファイルの操作_読み込み

---

## openpyxlを使用したExcelファイルの読み込み

### テストデータの内容

  | 行＼列 |   A    |   B    |   C    |
  | :----: | :----: | :----: | :----: |
  |   1    | HEAD_A | HEAD_B | HEAD_C |
  |   2    |   AA   |   BB   |   CC   |
  |   3    |  AAA   |  BBB   |  CCC   |

---

## 基本的な読み込み処理

```python
import openpyxl

# Excelファイルを読み込む
workbook = openpyxl.load_workbook('test.xlsx')

# シートを取得する
sheet = workbook['Sheet1']

# セルの値を取得する
cell_value = sheet['A1'].value

# 行を取得する
row = sheet[1]

# 列を取得する
column = sheet['A']

# 範囲を指定してセルを取得する
cells = sheet['A1:C3']

# 全てのセルを取得する
all_cells = sheet.values

# ファイルを閉じる
workbook.close()
```

---

## 行ごと、列ごとの処理

### 行ごと、列ごとに値を読み込む

```python
import openpyxl

workbook = openpyxl.load_workbook('test.xlsx')
sheet = workbook['Sheet1']
cell_value = sheet['A1'].value
row = sheet[1]
column = sheet['A']

# １行ずつ読み込んで表示する
for row in sheet.rows:
    print('----------')
    for cell in row:
        print(cell.value)

# １列ずつ読み込んで表示する
for column in sheet.columns:
    print('----------')
    for cell in column:
        print(cell.value)

workbook.close()

```

### 実行結果

> \----------  
  HEAD_A  
  HEAD_B  
  HEAD_C  
  \----------  
  AA  
  BB  
  CC  
  \----------  
  AAA  
  BBB  
  CCC  

> \----------  
HEAD_A  
AA  
AAA  
\----------  
HEAD_B  
BB  
BBB  
\----------  
HEAD_C  
CC  
CCC

### 特定の列の値を読み込む

```python
import openpyxl

workbook = openpyxl.load_workbook('test.xlsx')
sheet = workbook['Sheet1']

# 列の値を格納するリスト
column_values = []
# 取得したい列の番号
column_number = 1

for row in sheet.iter_rows(values_only=True):
    column_values.append(row[column_number - 1])

# 結果の表示
for value in column_values:
    print(value)

workbook.close()
```

### 実行結果

> HEAD_A  
AA  
AAA  

### ヘッダを読み飛ばす場合

* enumerate()関数を使用してrow_indexを取得する

```python
import openpyxl

workbook = openpyxl.load_workbook('test.xlsx')
sheet = workbook['Sheet1']

column_values = []
column_number = 1

for row_index, row in enumerate(sheet.iter_rows(values_only=True), start=1):
    if row_index == 1:
        continue
    column_values.append(row[column_number - 1])

# 結果の表示
for value in column_values:
    print(value)

workbook.close()
```

### 実行結果

> AA  
AAA  

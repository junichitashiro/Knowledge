# エクセルファイルを読み込む

---

## エクセルファイルの内容をページ内に表示する

### 概要

* ボタンをクリックしてエクセルファイルの選択ダイアログを表示する
* 選択したエクセルファイルの内容をページ内に表示する

```python
import flet as ft
import pandas as pd


def main(page: ft.Page):
    # ボタンがクリックされたときに実行される関数
    def pick_file(e):
        file_picker.pick_files(allow_multiple=False, allowed_extensions=['xlsx'])

    # エクセルファイルが選択されたときに実行される関数
    def on_file_picked(e: ft.FilePickerResultEvent):
        if e.files:
            file_path = e.files[0].path
            df = pd.read_excel(file_path)

            # データテーブルの作成
            columns = [ft.DataColumn(ft.Text(col)) for col in df.columns]
            rows = [
                ft.DataRow(cells=[ft.DataCell(ft.Text(str(cell))) for cell in row])
                for row in df.values
            ]

            data_table.columns = columns
            data_table.rows = rows
            page.update()

    file_picker = ft.FilePicker(on_result=on_file_picked)
    page.overlay.append(file_picker)

  # ボタンとデータテーブルを作成
    pick_button = ft.ElevatedButton('エクセルファイルを選択', on_click=pick_file)
    data_table = ft.DataTable()

    # ページにボタンとデータテーブルを追加
    page.add(pick_button, data_table)


# Fletアプリケーションを実行
ft.app(target=main)
```

---

## エクセルのアプリケーションからエクセルを開く

### 概要

* ボタンをクリックしてエクセルファイルの選択ダイアログを表示する
* 選択したエクセルファイルをエクセルのアプリケーションから開く

```python
import flet as ft
import os
import platform


def main(page: ft.Page):
    # ボタンがクリックされたときに実行される関数
    def pick_file(e):
        file_picker.pick_files(allow_multiple=False, allowed_extensions=['xlsx'])

    # エクセルファイルが選択されたときに実行される関数
    def open_file(e):
        if file_picker.result.files:
            file_path = file_picker.result.files[0].path
            print(f'Selected file path: {file_path}')

            try:
                if platform.system() == 'Windows':
                    os.startfile(file_path)
                elif platform.system() == 'Darwin':  # macOS
                    os.system(f'open {file_path}')
                else:  # Linux and other
                    os.system(f'xdg-open {file_path}')
            except Exception as ex:
                print(f'Error opening file: {ex}')

        else:
            print('No file selected')

    # エクセル選択ボタンを作成
    file_picker = ft.FilePicker(on_result=open_file)
    pick_file_button = ft.ElevatedButton('ファイルを選択', on_click=pick_file)

    # ページにボタンを追加
    page.add(file_picker, pick_file_button)


# Fletアプリケーションを実行
ft.app(target=main)
```

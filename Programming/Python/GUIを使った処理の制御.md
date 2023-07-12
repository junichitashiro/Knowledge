# GUIを使った処理の制御

## ラジオボタン

### ラジオボタンの選択状態で処理を分岐させる

#### ラジオボタンに設定した数値で処理を分岐させる

```python
import tkinter as tk

def check_selection():
    selected_value = radio_var.get()
    if selected_value == 1:
        print('ラジオボタン1が選択されました')
    elif selected_value == 2:
        print('ラジオボタン2が選択されました')
    elif selected_value == 3:
        print('ラジオボタン3が選択されました')
    else:
        print('選択肢以外の値です')

# GUIの作成
window = tk.Tk()
window.title('ラジオボタンの選択による条件分岐')

# ラジオボタンの選択状態を格納する変数
radio_var = tk.IntVar()

# ラジオボタンの作成
radio_button1 = tk.Radiobutton(window, text='ラジオボタン1', variable=radio_var, value=1)
radio_button1.pack()

radio_button2 = tk.Radiobutton(window, text='ラジオボタン2', variable=radio_var, value=2)
radio_button2.pack()

radio_button3 = tk.Radiobutton(window, text='ラジオボタン3', variable=radio_var, value=3)
radio_button3.pack()

# ボタンを作成して選択状態を確認する
check_button = tk.Button(window, text='選択を確認', command=check_selection)
check_button.pack()

window.mainloop()
```

#### ラジオボタンに設定した文字列で処理を分岐させる

* radio_button1.select() でラジオボタン1を選択状態にしておく


```python
import tkinter as tk

def get_selected_value():
    selected_value = radio_var.get()
    print(f'{selected_value}が選択されました')

# GUIの作成
window = tk.Tk()
window.title('ラジオボタンの選択値を取得する関数')

# ラジオボタンの選択状態を格納する変数
radio_var = tk.StringVar()

# ラジオボタンの作成
radio_button1 = tk.Radiobutton(window, text='ラジオボタン1', variable=radio_var, value='選択肢1')
radio_button1.pack()
radio_button1.select()

radio_button2 = tk.Radiobutton(window, text='ラジオボタン2', variable=radio_var, value='選択肢2')
radio_button2.pack()

radio_button3 = tk.Radiobutton(window, text='ラジオボタン3', variable=radio_var, value='選択肢3')
radio_button3.pack()

# ボタンを作成して選択値を取得する
get_value_button = tk.Button(window, text='選択値を取得', command=get_selected_value)
get_value_button.pack()

window.mainloop()
```

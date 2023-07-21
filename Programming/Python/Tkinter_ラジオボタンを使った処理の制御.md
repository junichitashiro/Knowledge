# Tkinter_ラジオボタンを使った処理の制御

## 値を取得する

### ラジオボタンの初期値

* 最初のラジオボタン生成直後に __select()__ で選択し初期値にしている
* これはラジオボタンがいずれも未選択、もしくは選択状態になるのを防ぐために実施している

### ウィジェット変数

#### ウィジェット変数とは

 * ウィジェットの状態を制御するために使用されるオブジェクト
 * ウィジェットが表示される際に、ウィジェット変数に格納された値がウィジェットに反映される
 * ユーザーがウィジェットを操作した場合、その変更がウィジェット変数にも反映される

#### よく使われるウィジェット変数

 * StringVar：文字列を保持
 * IntVar：整数を保持
 * DoubleVar：浮動小数点を保持
 * BooleanVar：真偽値を保持

### 選択したラジオボタンから設定した値を取得する

```python
import tkinter as tk

# 値を取得する関数
def get_selected_value():
    selected_value = radio_var.get()
    print(f'取得値：{selected_value}')

window = tk.Tk()

# ラジオボタンの値を保持する変数
radio_var = tk.StringVar()

# ラジオボタンのオプションを作成
options = [
    ('ラジオボタン1', '1'),
    ('ラジオボタン2', '2'),
    ('ラジオボタン3', '3')
]

# ラジオボタンを生成
for text, value in options:
    rb = tk.Radiobutton(window, text=text, value=value, variable=radio_var)
    rb.pack(anchor=tk.W)
    # 初期値に'1'を選択状態にしておく
    if value == '1':
        rb.select()

# 値の取得を実行するボタン
btn = tk.Button(window, text='値を取得する', command=get_selected_value)
btn.pack()

window.mainloop()
```

## 選択状態で処理を分岐させる

### ラジオボタンに設定した数値で処理を分岐させる

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

# ラジオボタンの値を保持する変数
radio_var = tk.IntVar()

# ラジオボタンの生成
radio_button1 = tk.Radiobutton(window, text='ラジオボタン1', variable=radio_var, value=1)
radio_button1.pack()
radio_button1.select()

radio_button2 = tk.Radiobutton(window, text='ラジオボタン2', variable=radio_var, value=2)
radio_button2.pack()

radio_button3 = tk.Radiobutton(window, text='ラジオボタン3', variable=radio_var, value=3)
radio_button3.pack()

# ボタンを作成して選択状態を確認する
check_button = tk.Button(window, text='選択を確認', command=check_selection)
check_button.pack()

window.mainloop()
```

### ラジオボタンに設定した文字列で処理を分岐させる

```python
import tkinter as tk

def get_selected_value():
    selected_value = radio_var.get()
    print(f'{selected_value}が選択されました')

# GUIの作成
window = tk.Tk()
window.title('ラジオボタンの選択値を取得する関数')

# ラジオボタンの値を保持する変数
radio_var = tk.StringVar()

# ラジオボタンの生成
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

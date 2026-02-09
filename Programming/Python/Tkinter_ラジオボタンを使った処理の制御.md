# Tkinter_ラジオボタンを使った処理の制御

---

## 値を取得する

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

app = tk.Tk()

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
    rb = tk.Radiobutton(app, text=text, value=value, variable=radio_var)
    rb.pack(anchor=tk.W)
    # 初期値に'1'を選択状態にしておく
    if value == '1':
        rb.select()

# 値の取得を実行するボタン
btn = tk.Button(app, text='値を取得する', command=get_selected_value)
btn.pack()

app.mainloop()
```

### CustomTkinter リプレイス版

```python
import customtkinter as ctk


# 値を取得する関数
def get_selected_value() -> None:
    selected_value = radio_var.get()
    print(f'取得値：{selected_value}')

# CustomTkinterの基本設定
ctk.set_appearance_mode('System')   # 'Light' / 'Dark' / 'System'
ctk.set_default_color_theme('blue') # 'blue' / 'green' / 'dark-blue'

app = ctk.CTk()
app.title('RadioButton Sample')
app.geometry('350x200')

# ラジオボタンの値を保持する変数
radio_var = ctk.StringVar(value='1')  # 初期値を指定する

# ラジオボタンのオプション
options = [
    ('ラジオボタン1', '1'),
    ('ラジオボタン2', '2'),
    ('ラジオボタン3', '3')
]

# ラジオボタンを生成
for text, value in options:
    rb = ctk.CTkRadioButton(master=app, text=text, value=value, variable=radio_var)
    rb.pack(anchor='w', padx=20, pady=5)

# 値の取得を実行するボタン
btn = ctk.CTkButton(master=app, text='値を取得する', command=get_selected_value)
btn.pack(pady=15)

app.mainloop()
```

---

## 選択状態で処理を分岐させる

### ラジオボタンに設定した数値で処理を分岐させる

```python
import tkinter as tk

# 処理内容の対応表
HANDLERS: dict[int, str] = {
    1: 'ラジオボタン1が選択されました',
    2: 'ラジオボタン2が選択されました',
    3: 'ラジオボタン3が選択されました',
}

DEFAULT_MESSAGE = '選択肢以外の値です'

# 値を取得する関数
def get_selected_value() -> None:
    selected_value = radio_var.get()
    print(HANDLERS.get(selected_value, DEFAULT_MESSAGE))

# GUIの作成
app = tk.Tk()
app.title('ラジオボタンの選択による条件分岐')

# ラジオボタンの値を保持する変数（初期値=1）
radio_var = tk.IntVar(value=1)

# ラジオボタンのオプション
options = [
    ('ラジオボタン1', 1),
    ('ラジオボタン2', 2),
    ('ラジオボタン3', 3)
]

# ラジオボタンを生成
for text, value in options:
    rb = tk.Radiobutton(app, text=text, value=value, variable=radio_var)
    rb.pack(anchor=tk.W)

# 値の取得を実行するボタン
btn = tk.Button(app, text='選択を確認', command=get_selected_value)
btn.pack(pady=10)

app.mainloop()
```

### CustomTkinter リプレイス版

```python
import customtkinter as ctk

# 表示メッセージ
HANDLERS: dict[int, str] = {
    1: 'ラジオボタン1が選択されました',
    2: 'ラジオボタン2が選択されました',
    3: 'ラジオボタン3が選択されました',
}

DEFAULT_MESSAGE = '選択肢以外の値です'

def check_selection() -> None:
    selected_value = radio_var.get()
    print(HANDLERS.get(selected_value, DEFAULT_MESSAGE))

# CustomTkinterの基本設定
ctk.set_appearance_mode('System')
ctk.set_default_color_theme('blue')

# GUIの作成
app = ctk.CTk()
app.title('ラジオボタンの選択による条件分岐')
app.geometry('320x220')

# ラジオボタンの値を保持する変数（初期値=1）
radio_var = ctk.IntVar(value=1)

# ラジオボタンの生成
options = [
    ('ラジオボタン1', 1),
    ('ラジオボタン2', 2),
    ('ラジオボタン3', 3),
]

for text, value in options:
    rb = ctk.CTkRadioButton(master=app, text=text, variable=radio_var, value=value)
    rb.pack(anchor='w', padx=20, pady=5)

# 選択状態を確認するボタン
check_button = ctk.CTkButton(master=app, text='選択を確認', command=check_selection)
check_button.pack(pady=15)

app.mainloop()
```

### ラジオボタンに設定した文字列で処理を分岐させる

```python
import tkinter as tk

# 表示文言
HANDLERS: dict[str, str] = {
    'opt1': '選択肢1が選択されました',
    'opt2': '選択肢2が選択されました',
    'opt3': '選択肢3が選択されました',
}

DEFAULT_MESSAGE = '未定義の選択肢です'

def get_selected_value() -> None:
    selected_value = radio_var.get()
    print(HANDLERS.get(selected_value, DEFAULT_MESSAGE))

# GUIの作成
app = tk.Tk()
app.title('ラジオボタンの選択値を取得')

# ラジオボタンの値を保持する変数
radio_var = tk.StringVar(value='opt1')

# ラジオボタンの生成
options = [
    ('ラジオボタン1', 'opt1'),
    ('ラジオボタン2', 'opt2'),
    ('ラジオボタン3', 'opt3'),
]

for text, value in options:
    rb = tk.Radiobutton(app, text=text, variable=radio_var, value=value)
    rb.pack(anchor=tk.W)

# ボタンを作成して選択値を取得する
get_value_button = tk.Button(app, text='選択値を取得', command=get_selected_value)
get_value_button.pack(pady=10)

app.mainloop()
```

### CustomTkinter リプレイス版

```python
import customtkinter as ctk

# 表示文言
HANDLERS: dict[str, str] = {
    'opt1': '選択肢1が選択されました',
    'opt2': '選択肢2が選択されました',
    'opt3': '選択肢3が選択されました',
}

DEFAULT_MESSAGE = '未定義の選択肢です'

def get_selected_value() -> None:
    selected_value = radio_var.get()
    print(HANDLERS.get(selected_value, DEFAULT_MESSAGE))

# CustomTkinterの基本設定
ctk.set_appearance_mode('System')
ctk.set_default_color_theme('blue')

# GUIの作成
app = ctk.CTk()
app.title('ラジオボタンの選択値を取得')
app.geometry('360x240')

# ラジオボタンの値を保持する変数
radio_var = ctk.StringVar(value='opt1')  # 初期値

# ラジオボタンの生成
options = [
    ('ラジオボタン1', 'opt1'),
    ('ラジオボタン2', 'opt2'),
    ('ラジオボタン3', 'opt3'),
]

for text, value in options:
    rb = ctk.CTkRadioButton(master=app, text=text, variable=radio_var, value=value)
    rb.pack(anchor='w', padx=20, pady=6)

# ボタンを作成して選択値を取得する
get_value_button = ctk.CTkButton(master=app, text='選択値を取得', command=get_selected_value)
get_value_button.pack(pady=15)

app.mainloop()
```

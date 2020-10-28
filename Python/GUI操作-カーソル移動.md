# GUI操作-カーソル移動

* pyautoguiでカーソルを操作する

***

## pyautoguiのインストール

* pipからpyautoguiをインストールする

  ```cmd
  pip install pyautogui
  ```

***

## カーソル移動のテストコード

* 位置情報を取得してカーソルを画面中央に移動させる

  ```python
  # ----------------------------------------
  # ライブラリのインポート
  # ----------------------------------------
  import pyautogui

  # ----------------------------------------
  # 位置情報の取得
  # ----------------------------------------
  # 画面サイズ
  screen_x, screen_y = pyautogui.size()
  print('画面サイズ [' + str(screen_x) + ']/[' + str(screen_y) + ']')

  # 現在のカーソル位置
  cursor_x, cursor_y = pyautogui.position()
  print('カーソル位置 [' + str(cursor_x) + ']/[' + str(cursor_y) + ']')

  # 画面中央位置
  center_x = screen_x / 2
  center_y = screen_y / 2
  print('画面中央 [' + str(center_x) + ']/[' + str(center_y) + ']')

  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # 2秒かけてカーソルを中央に移動
  pyautogui.moveTo(center_x, center_y, duration=2)
  ```
  
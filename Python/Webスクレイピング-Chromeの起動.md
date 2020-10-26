# Webスクレイピング-Chromeの起動

* seleniumとChrome DriverでGoogle Chromeを操作する

***

## seleniumのインストール

* pipからseleniumをインストールする

  ```cmd
  pip install selenium
  ```

***

## Chrome Driverのダウンロード

* 使用しているChromeのバージョンを確認する

  * 設定もしくはヘルプから __Chromeについて__ を開く

* [ダウンロードページ](https://chromedriver.chromium.org/downloads)で対象バージョンのドライバーをダウンロードする

* 展開したexeファイルを適宜配置しておく

* ソースコードの中でドライバーのパスを指定して使用する

***

## ブラウザ操作のテストコード

* ブラウザを開いて5秒後に閉じる動作テストコード

  ```python
  # ----------------------------------------
  # ライブラリのインポート
  # ----------------------------------------
  import time
  from selenium import webdriver

  # ----------------------------------------
  # 変数の設定
  # ----------------------------------------
  # # ChromeDriverを絶対パスで指定する
  cd_path = '\\...\\\\...\\chromedriver.exe'

  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # ブラウザを起動
  driver = webdriver.Chrome(cd_path)

  # Googleを開いて5秒後に閉じる
  driver.get('https://www.google.com/')
  time.sleep(5)
  driver.quit()
  ```

* 警告非表示とブラウザ最大化のオプションを加えたテストコード

  ```python
  # ----------------------------------------
  # ライブラリのインポート
  # ----------------------------------------
  import time
  from selenium import webdriver

  # ----------------------------------------
  # 変数の設定
  # ----------------------------------------
  # ChromeDriverのパスを絶対パスで指定する
  cd_path = '\\...\\\\...\\chromedriver.exe'
  # ChromeDriverのオプションを指定する
  chrome_options = webdriver.ChromeOptions()
  # ブラウザ起動時の警告を非表示にするオプション
  chrome_options.add_experimental_option("excludeSwitches", ['enable-automation'])

  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # ブラウザを起動して最大化する
  driver = webdriver.Chrome(cd_path, options=chrome_options)
  driver.maximize_window()

  # Googleを開いて5秒後に閉じる
  driver.get('https://www.google.com/')
  time.sleep(5)
  driver.quit()
  ```

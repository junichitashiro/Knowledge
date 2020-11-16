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
  # モジュールのインポート
  # ----------------------------------------
  import time
  from selenium import webdriver


  # ----------------------------------------
  # 変数の設定
  # ----------------------------------------
  # ChromeDriverの絶対パス
  cd_path = '\\...\\...\\chromedriver.exe'


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

* 以下のオプションと設定を加えたテストコード
  * ヘッドレスモードで起動
  * ブラウザ起動時のテスト実行警告を非表示
  * DevToolsのログを出力しない
  * 要素が見つかるまで待つ

  ```python
  # ----------------------------------------
  # モジュールのインポート
  # ----------------------------------------
  import time
  from selenium import webdriver


  # ----------------------------------------
  # 変数の設定
  # ----------------------------------------
  # ChromeDriverの絶対パス
  cd_path = '\\...\\...\\chromedriver.exe'
  # ChromeDriverのオプション
  chrome_options = webdriver.ChromeOptions()
  # ヘッドレスモードで起動
  chrome_options.add_argument('--headless')
  # enable-automation：ブラウザ起動時のテスト実行警告を非表示
  # enable-logging：DevToolsのログを出力しない
  chrome_options.add_experimental_option('excludeSwitches', ['enable-automation', 'enable-logging'])
  # ファイルのダウンロードフォルダを指定する
  dl_folder = '\\...'
  chrome_options.add_experimental_option('prefs', {'download.default_directory': dl_folder})


  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # ブラウザを起動する
  driver = webdriver.Chrome(cd_path, options=chrome_options)
  # 要素が見つかるまで最大10秒待つ設定
  driver.implicitly_wait(10)
  # ブラウザを最大化
  driver.maximize_window()

  # Googleを開いて5秒後に閉じる
  driver.get('https://www.google.com/')
  time.sleep(5)
  driver.quit()
  ```

# Webスクレイピング_Chromeの起動

* seleniumとChrome DriverでGoogle Chromeを操作する

***

## seleniumのインストール

* pipからseleniumをインストールする

  ```cmd
  pip install selenium
  ```

***

## ブラウザ操作のテストコード

* 動作テストコードの例

  ```python
  # ----------------------------------------
  # モジュールのインポート
  # ----------------------------------------
  import time

  import chromedriver_binary
  from selenium import webdriver
  from selenium.webdriver.chrome import service as fs
  from selenium.webdriver.common.by import By
  from selenium.webdriver.common.keys import Keys
  from webdriver_manager.chrome import ChromeDriverManager


  # ----------------------------------------
  # ChromeDriverの設定
  # ----------------------------------------
  CHROMEDRIVER = ChromeDriverManager().install()
  chrome_service = fs.Service(executable_path=CHROMEDRIVER)


  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # ブラウザを起動する
  driver = webdriver.Chrome(service=chrome_service)

  # 指定するURLを開く
  driver.get('https://www.google.com/')

  # XPathで検索ボックスを特定する
  search_box_xpath = '/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input'
  driver.find_element(By.XPATH, search_box_xpath).send_keys('Selenium実践入門')

  # NAMEで検索ボックスを特定する
  search_box_name = 'q'
  driver.find_element(By.NAME, search_box_name).clear()

  # 検索の3秒後にブラウザを閉じる
  driver.find_element(By.XPATH, search_box_xpath).send_keys('Selenium実践入門' + Keys.RETURN)
  time.sleep(3)
  driver.quit()
  ```

* 以下のオプションと設定を加えたテストコード
  * ヘッドレスモードで起動
  * ブラウザ起動時のテスト実行警告を非表示
  * DevToolsのログを出力しない
  * ダウンロードフォルダの指定
  * 要素が見つかるまで待つ

  ```python
  # ----------------------------------------
  # モジュールのインポート
  # ----------------------------------------
  import time

  import chromedriver_binary
  from selenium import webdriver
  from selenium.webdriver.chrome import service as fs
  from selenium.webdriver.common.by import By
  from selenium.webdriver.common.keys import Keys
  from webdriver_manager.chrome import ChromeDriverManager


  # ----------------------------------------
  # ChromeDriverの設定
  # ----------------------------------------
  CHROMEDRIVER = ChromeDriverManager().install()
  chrome_service = fs.Service(executable_path=CHROMEDRIVER)

  # オプションを設定する
  chrome_options = webdriver.ChromeOptions()
  # ヘッドレスモードで起動する
  chrome_options.add_argument('--headless')
  # enable-automation：ブラウザ起動時のテスト実行警告を非表示
  # enable-logging：DevToolsのログを出力しない
  chrome_options.add_experimental_option('excludeSwitches', ['enable-automation', 'enable-logging'])
  chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])
  # ファイルのダウンロードフォルダを指定する
  dl_folder = 'C:\temp'
  chrome_options.add_experimental_option('prefs', {'download.default_directory': dl_folder})


  # ----------------------------------------
  # 処理開始
  # ----------------------------------------
  # ブラウザを起動する
  driver = webdriver.Chrome(service=chrome_service, options=chrome_options)
  # ブラウザを最大化する
  driver.maximize_window()
  # 要素が見つかるまで最大10秒待つ設定
  driver.implicitly_wait(10)

  # 指定したURLを開く
  driver.get('https://www.google.com/')

  # XPathで検索ボックスを特定する
  search_box_xpath = '/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input'
  driver.find_element(By.XPATH, search_box_xpath).send_keys('Selenium実践入門')

  # NAMEで検索ボックスを特定する
  search_box_name = 'q'
  driver.find_element(By.NAME, search_box_name).clear()

  # 検索の3秒後にブラウザを閉じる
  driver.find_element(By.XPATH, search_box_xpath).send_keys('Selenium実践入門' + Keys.RETURN)
  time.sleep(3)
  driver.quit()
  ```

* その他のオプション
  * 起動するChromeのアカウントを指定する

  ```python
  PROFILE_PATH = r'C:\Users\***\AppData\Local\Google\Chrome\User Data'
  chrome_options.add_argument('--user-data-dir=' + PROFILE_PATH)
  ```

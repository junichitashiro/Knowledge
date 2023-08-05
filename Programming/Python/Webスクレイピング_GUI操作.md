# seleniumでGUI操作をする

---

## カーソル移動

* pyautoguiでカーソルを操作する

### pyautoguiのインストール

#### pipからpyautoguiをインストールする

```cmd
pip install pyautogui
```

### カーソル移動のテストコード

#### 位置情報を取得してカーソルを画面中央に移動させる

```python
import pyautogui


# ========================================
# 初期処理
# ========================================
# ------------------------------
# 位置情報の取得
# ------------------------------
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


# ========================================
# メイン処理
# ========================================
# 2秒かけてカーソルを中央に移動
pyautogui.moveTo(center_x, center_y, duration=2)
```

---

## 画面スクロール

* 対象の要素まで画面をスクロールする
* 要素が画面に表示されていないと操作できない場合などに有効

### 画面スクロールのテストコード

#### 要素のy座標を取得してスクロールする

```python
import chromedriver_binary
from selenium import webdriver
from selenium.webdriver.chrome import service as fs
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager


# ========================================
# 初期処理
# ========================================
# ChromeDriverの設定
CHROMEDRIVER = ChromeDriverManager().install()
chrome_service = fs.Service(executable_path=CHROMEDRIVER)


# ========================================
# メイン処理
# ========================================
# ブラウザを起動する
driver = webdriver.Chrome(service=chrome_service)
# 指定するURLを開く
driver.get('https://www.yahoo.co.jp/')

# 画面左側カテゴリの「サービス一覧」リンクの位置までスクロールしてからクリックする
service_list_link = '//*[@id="ToolFooter"]/a/dl/dt/span'
element_heigh = str(driver.find_element(By.XPATH, service_list_link).location['y'])
driver.execute_script("window.scrollTo(0, " + element_heigh + ");")
driver.find_element(By.XPATH, service_list_link).click()
```

# Webスクレイピング_proxy認証を突破する

---

## seleniumでproxy接続時の認証ダイアログを突破する

### 事前準備

* proxy認証に必要なマニフェストファイルを生成するコードを作成し配置しておく
* このファイルはスクレイピング実行時に外部モジュールとしてインポートされる

### マニフェストファイル生成コードのサンプル

#### proxy_auth_plugin.py

```python
def make_plugin():
    import zipfile

    PROXY_HOST = 'host or ip'
    PROXY_PORT = 80 # port番号
    PROXY_USER = 'ユーザーネーム' # username
    PROXY_PASS = 'パスワード' # password

    manifest_json = """
    {
        "version": "1.0.0",
        "manifest_version": 2,
        "name": "Chrome Proxy",
        "permissions": [
            "proxy",
            "tabs",
            "unlimitedStorage",
            "storage",
            "<all_urls>",
            "webRequest",
            "webRequestBlocking"
        ],
        "background": {
            "scripts": ["background.js"]
        },
        "minimum_chrome_version":"22.0.0"
    }
    """

    background_js = """
    var config = {
            mode: "fixed_servers",
            rules: {
            singleProxy: {
                scheme: "http",
                host: "%s",
                port: parseInt(%s)
            },
            bypassList: ["localhost"]
            }
        };

    chrome.proxy.settings.set({value: config, scope: "regular"}, function() {});

    function callbackFn(details) {
        return {
            authCredentials: {
                username: "%s",
                password: "%s"
            }
        };
    }

    chrome.webRequest.onAuthRequired.addListener(
                callbackFn,
                {urls: ["<all_urls>"]},
                ['blocking']
    );
    """ % (PROXY_HOST, PROXY_PORT, PROXY_USER, PROXY_PASS)

    pluginfile = 'proxy_auth_plugin.zip'
    with zipfile.ZipFile(pluginfile, 'w') as zp:
        zp.writestr("manifest.json", manifest_json)
        zp.writestr("background.js", background_js)
```

---

## オプションの設定

### chrome_options.add_extension (pluginfile)

* 認証に必要なマニフェストファイルをオプションで指定する
* 実行の都度マニフェストファイルの存在をチェックし、なければ生成する

```python
import os
import time

import chromedriver_binary
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

import proxy_auth_plugin as proxy

# ========================================
# 初期処理
# ========================================
# ChromeDriverの設定
CHROMEDRIVER = ChromeDriverManager().install()
chrome_service = fs.Service (executable_path=CHROMEDRIVER)

# オプション用のパス指定
pluginfile = 'proxy_auth_plugin.zip'

if not os.path.exists(pluginfile):
    proxy.make_plugin()

# オプション設定
chrome_options = webdriver. ChromeOptions()
chrome_options.add_experimental_option('excludeSwitches', ['enable-automation'])
chrome_options.add_experimental_option('prefs', {'download.default_directory'})
chrome_options.add_extension (pluginfile)
```

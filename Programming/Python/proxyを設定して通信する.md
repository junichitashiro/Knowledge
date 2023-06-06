# proxyを設定して通信する

## Torによるproxy通信を行う

* Windows版Torを使用
* [公式サイト](https://www.torproject.org/ja/download/tor/)からエキスパートバンドルファイルをダウンロードして任意のフォルダに展開しておく


```python
import requests
import subprocess

# Torのデフォルトポート
proxies = {
    'http':'socks5://127.0.0.1:9050',
    'https':'socks5://127.0.0.1:9050'
}

# Torを起動する
subprocess.Popen(['path\to\tor.exe'], shell=True, text=True)

# プロキシを使用せずIPアドレス表示のAPIを実行する
res = requests.get('https://ipinfo.io')
print(res.json())

# プロキシを使用して再度実行する
res_proxy = requests.get('https://ipinfo.io', proxies=proxies)
print(res_proxy.json())

```

### 実行結果

> {'ip': '\*\*\*.\*\*\*.\*\*\*.\*\*\*', 'hostname': 'p83d5cbf6.tokynt01.ap.so-net.ne.jp', 'city': 'Tokyo', 'region': 'Tokyo', 'country': 'JP', 'loc': '35.6892,139.6726', 'org': 'AS2527 Sony Network Communications Inc.', 'postal': '164-0013', 'timezone': 'Asia/Tokyo', 'readme': 'https://ipinfo.io/missingauth'}

> {'ip': '185.230.163.237', 'hostname': '106d0201.cus13669.vps.st-srv.eu', 'city': 'Frankfurt am Main', 'region': 'Hesse', 'country': 'DE', 'loc': '50.1155,8.6842', 'org': 'AS48314 Michael Sebastian Schinzel trading as IP-Projects GmbH & Co. KG', 'postal': '60306', 'timezone': 'Europe/Berlin', 'readme': 'https://ipinfo.io/missingauth'}

### 依存関係エラーの対応方法

> requests.exceptions.InvalidSchema: Missing dependencies for SOCKS support.

* 上記のエラーはrequestsライブラリがSOCKSプロキシのサポートに必要な依存関係を満たしていない場合に発生する
* 解決策の一つとしてrequestsライブラリにSOCKSサポートを追加するパッケージをインストールする

#### 対応手順

1. **requests** と **requests[socks]** パッケージをアンインストールする

    ```bash
    pip uninstall requests requests[socks]
    ```

2. **requests**、 **requests[socks]**、 **PySocks** パッケージを再インストールする

    ```bash
    pip install requests requests[socks] PySocks
    ```

    * PySocksはSOCKSプロキシのサポートを提供するための補助パッケージ
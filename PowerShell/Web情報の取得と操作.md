# Web情報の取得と操作  
* 対象のWebページは [https://d4c-lt.com/contents/powershell/samplepage1.html]

***
## 対象ページの情報取得開始処理  
* Web情報取得の開始処理
```PowerShell
$url = "https://d4c-lt.com/contents/powershell/samplepage1.html"
$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $true
$ie.Navigate($url)
while($ie.Busy) { Start-Sleep -milliseconds 100 }
$doc = $ie.document
```

***
## ログイン処理の自動化  
* __getElementsByName__ を使用し __id__ で特定した要素の __value__ を設定している
```PowerShell
# IDの入力
$doc.getElementById("user_name").value = "ID12345"

# パスワードの入力
$doc.getElementById("password").value = "PW12345"

# ログインボタンの押下
$doc.getElementById("login_btn").click()
```

***
## プルダウン値の取得  
* __getElementsByName__ を使用し __name__ で特定した情報の __value__ を表示する
* このページに __name="year"__ の要素は1つしかないが配列で取得するため[0]を指定している。

```PowerShell
# 年のプルダウン選択値を取得して表示する
Write-Host $doc.getElementsByName("year")[0].value
```

## プルダウンの値の設定  
* 上記の取得処理と同様に特定した要素に値を設定する
```PowerShell
# 年のプルダウン値を設定する
$doc.getElementsByName("year")[0].value = "2025"
```

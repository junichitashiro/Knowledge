# Webスクレイピング-情報取得と操作

* 対象のWebページは [<https://d4c-lt.com>] で作成したもの

***

## 対象ページの情報取得開始処理

* Web情報を取得するための初期処理

  ```PowerShell
  $url = "https://d4c-lt.com"
  $ie = New-Object -ComObject InternetExplorer.Application
  $ie.Visible = $true
  $ie.Navigate($url)
  while($ie.Busy) { Start-Sleep -milliseconds 100 }
  $doc = $ie.document
  ```

***

## ログイン処理

* __getElementsByName__ を使用して要素の __id__ で入力項目を特定する
* 特定した入力項目の __value__ にログイン情報を設定する

  ```PowerShell
  # 対象URL
  $url = "https://d4c-lt.com/contents/samplepage/login1.html"

  # IDの設定
  $doc.getElementById("user_name").value = "ID12345"

  # パスワードの設定
  $doc.getElementById("password").value = "PW12345"

  # ログインボタンの押下
  $doc.getElementById("login_btn").click()
  ```

***

## プルダウン値の取得

* __getElementsByName__ を使用して __name__ で特定した情報の __value__ を表示する
* このページに __name="year"__ の要素は1つしかないが配列で取得するため[0]を指定している

  ```PowerShell
  # 対象URL
  $url = "https://d4c-lt.com/contents/samplepage/ymd_select.html"

  # 年のプルダウン選択値を取得して表示する
  Write-Host $doc.getElementsByName("year")[0].value
  ```

## プルダウンの値の設定

* 上記の取得処理と同様に特定した要素に値を設定する

  ```PowerShell
  # 年のプルダウン値を設定する
  $doc.getElementsByName("year")[0].value = "2025"
  ```

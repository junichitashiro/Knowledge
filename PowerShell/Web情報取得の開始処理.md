# Web情報取得の開始処理  

***
## Webページから情報を取得する方法  

* IEを起動して対象のWebページに移動する場合
```PowerShell
# 対象ページのURLを設定
$url = "https://d4c-lt.com/contents/powershell/samplepage1.html"

# IEを起動する
$ie = New-Object -ComObject InternetExplorer.Application

$ IEを表示する
$ie.Visible = $true

# 対象のWebページへ移動する
$ie.Navigate($url)

# ページが切り替わるまで待つ
while($ie.Busy) { Start-Sleep -milliseconds 100 }

# ドキュメントオブジェクトを取得する
$doc = $ie.document
```

* すでにIEでWebページを表示している場合
```PowerShell
# 対象ページのURLを設定
$url = "https://d4c-lt.com/contents/powershell/samplepage1.html"

# シェルを取得
$shell = New-Object -ComObject Shell.Application

# IEで開いているページ一覧を取得
$ieList = @($shell.Windows() | where { $_.Name -match "Internet Explorer" })

# URL指定でIEページのオブジェクトを取得する([-1]で同一ページの最新のタブのオブジェクトを取得する)
$ie = @($ieList | where { $_.LocationURL -match $url })[-1]
```

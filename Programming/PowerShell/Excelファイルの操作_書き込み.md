# Excelファイルの操作_書き込み

---

## 既存のExcelファイルへ書き込みをする

### test.xlsx を開いてテキストを入力するコード

```powershell
# Excelの初期処理
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$workbook = $excel.Workbooks.Open("C:\Path\To\test.xlsx")
$worksheet = $workbook.Worksheets.Item(1)

# Excelへの書き込み処理
$valueToWrite = "Input Test"
$cell = $worksheet.Cells.Item(1, 1)
$cell.Value2 = $valueToWrite

# Excelの終了処理
$workbook.Save()
$workbook.Close()
$excel.Quit()

# COMオブジェクトの解放
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# プロセスのクリーンアップ
Remove-Variable excel, workbook, worksheet
```

### 処理の補足説明

#### New-Object -ComObject Excel.Application

* 新規にExcelのアプリケーションを開始する

#### $excel.Visible

* Excelウィンドウの表示／非表示
  * 表示
    * $excel.Visible = $true
  * 非表示
    * $excel.Visible = $false

#### $excel.Workbooks.Open()

* 既存のExcelファイルを開く

#### $workbook.Worksheets.Item()

* ワークシートを選択する
  * インデックスで指定する場合
    * $workbook.Worksheets.Item(1)
  * シート名で指定する場合
    * $workbook.Worksheets.Item("SheetName")

#### $workbook.Save()

* Excelワークブックを保存する

#### $workbook.Close()

* Excelワークブックを保存する

#### $excel.Quit()

* Excelアプリケーションを終了する

---

## 新規にExcelファイルを開いて書き込みをする

### 新規にExcelを開いてテキストを入力し保存するコード

```powershell
# Excelの初期処理
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.ActiveSheet

# Excelへの書き込み処理
$worksheet.Cells.Item(1, 1) = "Input"
$worksheet.Cells.Item(1, 2) = "Test"

# Excelの終了処理
$workbook.SaveAs("C:\Path\To\new_test.xlsx")
$workbook.Close($false)
$excel.Quit()

# COMオブジェクトを解放
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# プロセスのクリーンアップ
Remove-Variable excel, workbook, worksheet
```

### 処理の補足説明

#### $excel.Workbooks.Add()

* 新規にExcelワークブックを開く

#### $workbook.ActiveSheet

* アクティブなワークシートを取得する


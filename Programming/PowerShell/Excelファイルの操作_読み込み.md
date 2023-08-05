# Excelファイルの操作_読み込み

---

## 既存のExcelファイルから読み込む

### Excelファイルを開いてテキストを読み込むコード

```powershell
# Excelの初期処理
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true
$workbook = $excel.Workbooks.Open("C:\Path\To\ExcelFile.xlsx")
$worksheet = $workbook.Worksheets.Item(1)

# セルの読み込み処理
$cellValue = $worksheet.Cells.Item(1, 1).Value()

# 読み込んだ値の表示
Write-Host "セルA1: $cellValue"

# Excelの終了処理
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

---

### Excelファイルの表を読み込む

```powershell
# Excelの初期処理
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true
$workbook = $excel.Workbooks.Open("C:\Path\To\ExcelFile.xlsx")
$worksheet = $workbook.Worksheets.Item(1)

$usedRange = $worksheet.UsedRange
$data = $usedRange.Value()

# 表の行数と列数を取得
$rowCount = $data.GetLength(0)
$columnCount = $data.GetLength(1)

# 表のデータを表示
for ($row = 1; $row -le $rowCount; $row++) {
    for ($col = 1; $col -le $columnCount; $col++) {
        Write-Host "Row $row, Column $col : $($data[$row, $col])"
    }
}

# Excelの終了処理
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

#### $worksheet.UsedRange

* Excelのワークシートで使用されている範囲を取得する

#### $data.GetLength()

* 行数または列数の長さを取得
  * 行数
    * $data.GetLength(0)
  * 列数
    * $data.GetLength(1)

---

## 外部ファイルへの書き込みを伴う処理

### Excelファイルから読み取った値をTSVファイルに書き込むコード

```powershell
# Excelの初期処理
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$workbook = $excel.Workbooks.Open("C:\Path\To\ExcelFile.xlsx")
$worksheet = $workbook.Worksheets.Item(1)

# 出力先のTSVファイルパス
$outputFilePath = "C:\Path\To\OutputFile.tsv"

# ワークシートの取得範囲を設定
$lastRow = $worksheet.UsedRange.Rows.Count
$lastColumn = $worksheet.UsedRange.Columns.Count

# ワークシートから値を読み込む
$tsvContent = @()
for ($row = 1; $row -le $lastRow; $row++) {
    $rowValues = @()
    for ($col = 1; $col -le $lastColumn; $col++) {
        $cellValue = $worksheet.Cells.Item($row, $col).Text
        $rowValues += $cellValue
    }
    $tsvContent += $rowValues -join "`t"
}

# TSVファイルにデータを書き込む
$tsvContent | Out-File -FilePath $outputFilePath -Encoding UTF8

# Excelの終了処理
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

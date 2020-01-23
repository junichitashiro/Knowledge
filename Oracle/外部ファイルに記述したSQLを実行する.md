# 外部ファイルに記述したSQLを実行する  

>## SQL*Plusから @filename.sql で実行する  

## sqlファイルのサンプル  

* テーブルを全選択するSQLを実行する
* 実行結果をログファイルに出力する

```sql
-- 出力設定
SET LINESIZE -- 1行に表示する文字の数
SET WRAP OFF -- 折り返しをしない
SET TRIMOUT ON -- 表示行の終わりに空白を入れない
SET TRIMSPOOL ON -- スプール行の終わりに空白を入れない
SET COLSEP , -- 区切り文字にカンマを指定する
SET TERMOUT OFF -- 画面に結果を出力しない
SET FEEDBACK OFF -- 結果件数を表示しない
SET ECHO OFF -- コンソールメッセージを表示しない
SET PAGESIZE 0 -- 全行1ページに表示する

SPOOL sql.log --出力ファイル名

-- SQL本体
SELECT * FROM TABLE_NAME ;

SPOOL OFF
```

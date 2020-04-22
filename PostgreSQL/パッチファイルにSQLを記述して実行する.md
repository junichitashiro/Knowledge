# バッチファイルにSQLを記述して実行する

* ユーザ名：postgres
* データベース名：postgres
* テーブル名：test_table

***

## オプションでSQLを実行し、実行結果を外部ファイルに出力する

* __-c__ オプションで" "内にSQLを記述する
* __-o__ オプションで出力先を指定する

  ```bat
  @echo off
  rem --------------------------------------------------
  rem DB接続パラメータ
  rem --------------------------------------------------
  set PGPATH=C:\"Program Files"\PostgreSQL\10\bin\
  set HOSTNAME=localhost
  set PORTNUM=5432
  set DBNAME=postgres
  set USERNAME=postgres
  set PGPASSWORD=postgres

  rem --------------------------------------------------
  rem bat実行パラメータ
  rem --------------------------------------------------
  set LOGFILE=result.log

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "select * from test_table;" -o %LOGFILE%
  ```

***

## 実行結果をCSV形式で出力する場合

* "copy ("SQL文") to '出力パス' with csv delimiter ',' ;" のコマンドを記述する
* ここではさらにnullを空白に、ヘッダ出力ありを指定している

  ```bat
  @echo off
  rem --------------------------------------------------
  rem DB接続パラメータ
  rem --------------------------------------------------
  set PGPATH=C:\"Program Files"\PostgreSQL\10\bin\
  set HOSTNAME=localhost
  set PORTNUM=5432
  set DBNAME=postgres
  set USERNAME=postgres
  set PGPASSWORD=postgres

  rem --------------------------------------------------
  rem bat実行パラメータ
  rem --------------------------------------------------
  set FILEPATH=%~dp0
  set SQLFILE=input.sql
  set LOGFILE=result.log
  set CSVFILE=result.csv

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -c "copy (select * from test_table) to '%FILEPATH%%CSVFILE%' with csv delimiter ',' null as '' header;"
  ```

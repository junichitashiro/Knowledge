# バッチファイルからSQLを実行して結果ファイルを出力する

* ユーザ名：postgres
* データベース名：postgres
* テーブル名：test_table

***

## バッチファイルにSQLを記述する方法

* 実行結果を外部ファイルに出力する

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

* 実行結果をCSV形式で出力する

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

## 外部ファイルにSQLを記述する方法

* __input.sql__ ファイルに記述したSQLを実行して結果を外部ファイルに出力する

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
  set SQLFILE=input.sql
  set LOGFILE=result.log

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f %SQLFILE% -o %LOGFILE%
  ```

* __input.sql__ の内容

  ```sql
  select * from test_table
  ```

* __input.sql__ ファイルに記述したSQLを実行して結果をCSV形式で出力する

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
  set SQLFILE=input.sql
  set CSVFILE=result.csv

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f %SQLFILE% -o %CSVFILE%
  ```

* __input.sql__ の内容

  ```sql
  copy (
      select * from test_table
  ) to stdout with csv delimiter ',' null as '' header;
  ```

# バッチファイルからSQLファイルを読み込んで実行する

* ユーザ名：postgres
* データベース名：postgres
* テーブル名：test_table

---

## オプションでSQLファイルを実行し、実行結果を外部ファイルに出力する

### バッチファイルの設定

* 出力先はバッチファイルで指定する
* **-f** オプションで実行するSQLファイルを指定する
* **-o** オプションで出力先を指定する

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

### SQLファイルの設定

* ファイル名 **input.sql**

  ```sql
  select * from test_table;
  ```

---

## 実行結果をCSV形式で出力する場合

### バッチファイルの設定

* 出力先をバッチファイルで指定する
* 出力形式はSQLファイルで指定する

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

### SQLファイルの設定

* ファイル名 **input.sql**
* SQLを **copy (** と **)to stdout with csv delimiter ',' ;** の中に記述する
* ここでは出力先を標準出力、nullを空白、ヘッダ出力ありを指定している

  ```sql
  copy (
      select * from test_table
  ) to stdout with csv delimiter ',' null as '' header;
  ```

---

## SQLファイルに出力パスまで記載する場合

### バッチファイルの設定

* バッチファイルで出力先の記述はしない

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

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f %SQLFILE%
  ```

### SQLファイルの設定

* ファイル名 **input.sql**
* **input.sql** で出力先を指定する
* 出力先は絶対参照で指定する

  ```sql
  copy (
      select * from test_table
  ) to 'D:\test\result.csv' with csv delimiter ',' null as '' header;
  ```

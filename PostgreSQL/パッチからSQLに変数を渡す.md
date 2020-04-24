# バッチからSQLに変数を渡す

* ユーザ名：postgres
* データベース名：postgres
* テーブル名：test_table

***

## バッチファイルで設定した変数をSQLファイルに渡す方法

* 通常のSQL実行結果

  ```sql
  select * from test_table where price = 260;
  ```

* 実行結果

  menu|price|cal
  --|--|--
  ブレンド             |   260 | 4
  アメリカン           |   260 | 3
  ティー(ダージリン)   |   260 | 1
  ティー(アールグレイ) |   260 | 1
  ティー(アッサム)     |   260 | 1
  アイスカフェ         |   260 | 4
  アイスティー         |   260 | 3
  (7 行)|

***

### バッチファイルの設定

* __-v__ オプションを指定する
* SQLに渡す変数名（PRICE）と値（260）を設定する

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
  %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f %SQLFILE% -v PRICE=260
  ```

### input.sqlの設定

* __:'変数名'__ で値を受け取る変数を記述する

  ```sql
  select * from test_table where price = :'PRICE';
  ```

* 実行結果

  menu|price|cal
  --|--|--
  ブレンド             |   260 | 4
  アメリカン           |   260 | 3
  ティー(ダージリン)   |   260 | 1
  ティー(アールグレイ) |   260 | 1
  ティー(アッサム)     |   260 | 1
  アイスカフェ         |   260 | 4
  アイスティー         |   260 | 3
  (7 行)|

***

## テキストファイルから読み込んだ値を変数としてSQLファイルに渡す方法

* 通常のSQL実行結果

  ```sql
  select * from test_table where price = 260 and cal = 3;
  select * from test_table where price = 260 and cal = 3;
  ```

* 実行結果1

  menu|price|cal
  --|--|--
  アメリカン           |   260 | 3
  アイスティー         |   260 | 3
  (2 行)|

* 実行結果2

  menu|price|cal
  --|--|--
  ブレンド             |   260 | 4
  アイスカフェ         |   260 | 4
  (2 行)|

***

### 実行元となるバッチファイルの設定

* input.txtから値を読み込んでSQLを繰り返し実行する
* 1,2,3列目の値をバッチの変数 i, j, k に格納している
* ヘッダの読み込みはスキップする

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
  set TXTFILE=input.txt
  set SQLFILE=input.sql

  rem --------------------------------------------------
  rem SQL実行
  rem --------------------------------------------------
  for /f "tokens=1,2,3 skip=1 delims=," %%i in (%TXTFILE%) do (
      %PGPATH%psql -h %HOSTNAME% -p %PORTNUM% -d %DBNAME% -U %USERNAME% -f %SQLFILE% -v PRICE=%%j -v CAL=%%k -o result_%%i.log
  )
  ```

### input.txtの設定

* カンマ区切りで値を記述する

  ```txt
  no,price,cal
  1,260,3
  2,260,4
  ```

### input.sqlの設定

* __:'PRICE'__ と __:'CAL'__ で変数値を受け取る

  ```sql
  select * from test_table where price = :'PRICE' and cal = :'CAL';
  ```

* 実行結果1（result_1.log）

  menu|price|cal
  --|--|--
  アメリカン           |   260 | 3
  アイスティー         |   260 | 3
  (2 行)|

* 実行結果2（result_2.log）

  menu|price|cal
  --|--|--
  ブレンド             |   260 | 4
  アイスカフェ         |   260 | 4
  (2 行)|

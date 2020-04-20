# バッチからSQLに変数を渡す

* ユーザ名：postgres
* データベース名：postgres
* テーブル名：test_table

***

## バッチからSQLファイルの変数に値を格納する方法

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

## バッチファイルの設定

* __-v__ オプションを使いSQLに渡す変数名（PRICE）に値（260）を設定する

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

* __input.sql__ の内容
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

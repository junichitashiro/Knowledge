# サンプルDBをローカル開発環境にインポートする  
* OS：CentOS7
* DB：MariaDB
* DBアカウント：セットアップ直後のrootアカウント（パスワードなし）

***
## 事前準備  
* [サーバサイド技術の学び舎](http://www.wings.msn.to/index.php/) にアクセス
* __総合FAQ/訂正＆ダウンロード__ をクリックし関連ダウンロードから __書き込み式SQLのドリル　改訂新版__ を選択する
* 移動先の画面からダウンロードボタン押下
* ダウンロードファイルを展開し __MySQL__ フォルダ内にある __workbook.sql__ をutf-8で保存する
* __workbook.sql__ をローカル開発環境に格納しておく

***
## インポート用DBの作成  
* MariaDBにログイン
```bash
mysql -u root
```

* DBの作成
```sql
CREATE DATABASE workbook;
SHOW DATABASES;
```

* workbook が作成されていること
```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
| workbook           |
+--------------------+
```

* MariaDBからログアウト
```sql
exit
```

***
## インポートの実行  
* workbook.sql の配置場所まで移動しておく
```bash
# mysql -u [username] -p[password] workbook < workbook.sql
mysql -u root -p workbook < workbook.sql
```

## 補足　OracleXEの場合
* 上記と同様に workbook.sql の配置場所まで移動しておく
```bash
sqlplus [username]/[password] @workbook.sql
```

***
## 作成されたDBの確認 
* MariaDBにログイン
```bash
mysql -u root
```

* テーブルの確認
```sql
USE workbook;
SHOW TABLES;
```

* テーブルが表示されること
```
+--------------------+
| Tables_in_workbook |
+--------------------+
| access_log         |
| author             |
| author_books       |
| books              |
| category           |
| contents           |
| depart             |
| employee           |
| menu               |
| order_desc         |
| order_main         |
| product            |
| quest              |
| rental             |
| sales              |
| shop               |
| time_card          |
| usr                |
+--------------------+
```

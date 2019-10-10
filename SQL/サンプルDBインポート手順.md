# サンプルDBをローカル開発環境にインポートする  
* OS：CentOS7
* DB：MariaDB
* DBアカウント：root
* DBパスワード：root1

***
## 事前準備  
* SQL配下の [workbook.sql](https://github.com/junichitashiro/Technical-Notes) をローカル開発環境に格納しておく

***
## インポート用DBの作成  
* MariaDBにログイン
```bash
mysql -u root -proot1
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
mysql -u root -proot1 workbook < workbook.sql
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
mysql -u root -proot1
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

# データベースの文字コードを設定する  

* DB：MariaDB,MySQL
* サーバの文字コード、ターミナルの文字コードがutf-8になっている前提で文字コードを __utf8__ に設定する

***

## 現在の設定を確認する  

* DBにログインして現在の設定を確認  
すでにutf8以外で作成したDBがある場合、作成済みのDBをDROPしてから以下の設定をすること

```sql
show variables like 'cha%';
```

```sql
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | latin1                     |←ここをutf8に設定する
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | utf8                       |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
```

## 設定ファイルを編集する  

* DBからログアウトして __/etc/my.cnf__ ファイルを編集

```bash
sudo vi /etc/my.cnf
# --------------------------------------------------
# 以下の編集を行う
# 既存のカテゴリに追加
[mysqld]
character-set-server=utf8

# カテゴリを作成して追加
[mysql]
default-character-set=utf8
# --------------------------------------------------
```

## サービスを再起動する  

* MariaDBの場合

```bash
sudo systemctl restart mariadb.service
```

* MySQLの場合

```bash
sudo systemctl restart mysqlb.service
```

## 設定を確認する  

* DDBにログインして変更後の文字コードを確認する

```sql
show variables like 'cha%';
```

```sql
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | utf8                       |
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | utf8                       |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
```

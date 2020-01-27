# MariaDBのセットアップ手順  

* 作業アカウント：vagrant
* 初期設定で文字コードを __utf8__ に設定する

***

## MariaDBをインストールする  

* yum からインストール  

```bash
sudo yum -y install mariadb mariadb-server
```

* 自動起動登録とサービスの起動

```bash
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
```

## 設定ファイルを編集する  

* __/etc/my.cnf__ ファイルを編集

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

* サービスの再起動  

```bash
sudo systemctl restart mariadb.service
```

* MariaDBの初期設定を行う  

```bash
sudo mysql_secure_installation

# 1. 現在のrootパスワードを入力  
Enter current password for root (enter for none): # 未設定なのでそのままEnter

# 2. rootパスワードの設定をするか
Set root password? [Y/n] # Enter

# 3.新しいrootパスワードを設定
New password: # パスワードを入力してEnter

# 4.パスワードの確認
Re-enter new password: # パスワードを再入力してEnter

# 5.匿名ユーザを削除するか
# 初期設定などのために誰でもログインできるユーザ、削除推奨
Remove anonymous users? [Y/n] # Enter

# 6.rootのリモートログインを禁止するか
Disallow root login remotely? [Y/n] # Enter

# 7.testデータベースを削除するか
Remove test database and access to it? [Y/n]  # Enter

# 8.権限を管理するテーブルをリロードして設定をすぐに反映するか
Reload privilege tables now? [Y/n] # Enter
```

## 設定を確認する  

* DBにログインして文字コードを確認する

```bash
$ mysql -u root -p
Enter password: #パスワードを入力する
```

* 設定を確認する  

```sql
show variables like 'cha%';

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

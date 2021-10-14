# MariaDBセットアップ手順

* 作業アカウント：vagrant
* 初期設定で文字コードを __utf8__ に設定する

***

## MariaDBをインストールする

* yum からインストールする

  ```bash
  sudo yum -y install mariadb mariadb-server
  ```

* サービスを起動する

  ```bash
  sudo systemctl start mariadb.service
  ```

* 自動起動の設定をする

  ```bash
  sudo systemctl enable mariadb.service
  ```

***

## 文字コードを設定する

* __/etc/my.cnf__ ファイルを編集する

  ```bash
  sudo vi /etc/my.cnf
  ```

* 以下の内容に編集する

  ```bash
  # 既存のカテゴリに追加する
  [mysqld]
  character-set-server=utf8

  # カテゴリを作成して追加する
  [mysql]
  default-character-set=utf8
  ```

* サービスを再起動する

  ```bash
  sudo systemctl restart mariadb.service
  ```

***

## データベースの初期設定

* MariaDBの初期設定を開始する

  ```bash
  sudo mysql_secure_installation

  # 以下のメッセージが表示される
  # NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
  #       SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!
  #
  # In order to log into MariaDB to secure it, we'll need the current
  # password for the root user.  If you've just installed MariaDB, and
  # you haven't set the root password yet, the password will be blank,
  # so you should just press enter here.
  ```

1. 現在のrootパスワードを入力する

    ```bash
    Enter current password for root (enter for none): # 未設定なのでそのままEnter
    ```

2. rootパスワードの設定をするか選択する

    ```bash
    Set root password? [Y/n] # Enter
    ```

3. 新しいrootパスワードを設定する

    ```bash
    New password: # パスワードを入力してEnter
    ```

4. パスワードの再入力

    ```bash
    Re-enter new password: # パスワードを再入力してEnter
    ```

5. 匿名ユーザ（初期設定などのために誰でもログインできるユーザ）を削除するか選択する

    ```bash
    Remove anonymous users? [Y/n] # ここでは削除推奨のため Enter
    ```

6. rootのリモートログインを禁止するか選択する

    ```bash
    Disallow root login remotely? [Y/n] # Enter
    ```

7. testデータベースを削除するか選択する

    ```bash
    Remove test database and access to it? [Y/n]  # Enter
    ```

8. 権限を管理するテーブルをリロードして設定をすぐに反映するか選択する

    ```bash
    Reload privilege tables now? [Y/n] # Enter
    ```

***

## 設定を確認する

* DBにログインして文字コードを確認する

  ```bash
  mysql -u root -p
  Enter password: #パスワードを入力する

  # Welcome to the MariaDB monitor.  Commands end with ; or \g.
  # Your MariaDB connection id is 10
  # Server version: 5.5.64-MariaDB MariaDB Server
  #
  # Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
  #
  # Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
  ```

* 設定を確認する
* __character_set_database__ が __utf8__ になっていること

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

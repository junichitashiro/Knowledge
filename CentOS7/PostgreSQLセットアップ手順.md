# PostgreSQLのセットアップ手順

* 作業アカウント：root
* インストールバージョン：10

***

## 既存状態の確認

* すでにインストールされているか確認する

  ```bash
  rpm -qa | grep postgres
  ```

* 存在した場合削除する

  ```bash
  yum -y remove postgresql
  ```

***

## インストール

指定するリポジトリのURLはパッケージごとに異なり、下記サイトで確認できる。  
[<https://yum.postgresql.org/repopackages.php#pg10>]

* 公式リポジトリの追加

  ```bash
  yum -y localinstall https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
  ```

* PostgreSQLの本体をインストールする

  ```bash
  yum -y install postgresql10-server
  ```

* バージョンを表示して確認する

  ```bash
  /usr/pgsql-10/bin/postgres --version
  ```

  > postgres (PostgreSQL) 10.13

* 作成されるディレクトリで確認する

  ```bash
  ls -l /usr/pgsql-10/
  ```

  > drwxr-xr-x 2 root root 4096  1月 23 09:00 bin  
    drwxr-xr-x 2 root root 4096  1月 23 09:00 lib  
    drwxr-xr-x 7 root root 4096  1月 23 09:00 share

***

## 初期設定作業

* データベースを初期化する

  ```bash
  /usr/pgsql-10/bin/postgresql-10-setup initdb
  ```

  > Initializing database ... OK

* 初期化をやり直す場合は関連ファイルを削除してから行う

  ```bash
  rm -fr /var/lib/pgsql
  ```

***

## PostgreSQLの起動

* サービスを起動する

  ```bash
  systemctl start postgresql-10.service
  ```

* 自動起動の設定をする

  ```bash
  systemctl enable postgresql-10.service
  ```

  > Created symlink from /etc/systemd/system/multi-user.target.wants/postgresql-10.service to /usr/lib/systemd/system/postgresql-10.service.

***

## データベースの動作確認

PostgreSQLインストール時にpostgresユーザーがOSに追加されるので、追加されたユーザーで動作確認を行う。

* postgresに切り替える

  ```bash
  su - postgres
  ```

  > プロンプトの表示が root から -bash-4.2 に変わる

* テーブル一覧を表示する

  ```bash
  psql -l
  ```

  > デフォルトのテーブル一覧が表示される

* バージョンを表示する

  ```bash
  psql --version
  ```

  > psql (PostgreSQL) 10.13

***

## OSのpostgresユーザーにログインパスワードを設定する

インストール時に作成されるpostgresユーザーはパスワードが設定されていない。  
DB接続ツールを使うとき等、パスワードが必要になるため設定しておく。  
OSのpostgresユーザーとPostgreSQLのpostgresユーザーを混同しないように注意。

* postgresユーザーにパスワードを設定する

* rootで実行する

  ```bash
  passwd postgres
  ```

  > ユーザー postgres のパスワードを変更。

  ```bash
  新しいパスワード: # パスワードを入力
  新しいパスワードを再入力してください: # パスワードを再入力
  ```
  
  > passwd: すべての認証トークンが正しく更新できました。

***

## PostgreSQLのpostgresユーザーにパスワードを設定する

* postgresユーザーに切り替える

  ```bash
  su - postgres
  ```

  > -bash-4.2$

* データベースにログインする

  ```bash
  psql
  ```

  > postgres  
    psql (10.13)  
    "help" でヘルプを表示します。

* ユーザーpostgresにパスワード'postgres'を設定する

  ```bash
  alter role postgres with password 'postgres';
  ```

  > ALTER ROLE

* データベースからログアウトして __root__ に戻る

  ```bash
  \q
  ```

  > postgres-#  
    → -bash-4.2$

  ```bash
  exit
  ```

  > ログアウト  
    -bash-4.2$  
    → root

* 設定ファイルを編集する

  ```bash
  vi /var/lib/pgsql/10/data/pg_hba.conf
  ```

* 以下のように編集してパスワード認証を有効にする

  ```bash
  local   all    all                    password # peerから変更する箇所
  # IPv4 local connections:
  host    all    all    127.0.0.1/32    password # peerから変更する箇所
  # IPv6 local connections:
  host    all    all    ::1/128         password # peerから変更する箇所
  ```

* 再起動して設定を反映する

  ```bash
  systemctl restart postgresql-10.service
  ```

* パスワード認証でログインできることを確認する

  ```bash
  psql -U postgres
  Password for user postgres: # 設定したパスワードを入力
  psql (10.13)
  Type "help" for help.
  ```

***

## PostgreSQLのアンインストール

不要になったPostgreSQLを削除する手順。

* postgresqlの削除

  ```bash
  yum -y remove postgresql
  ```

* 関連ライブラリの削除

  ```bash
  yum -y remove postgresql-libs
  ```

* postgresユーザーの削除

* __-r__ はユーザーの作成データを削除するオプション

  ```bash
  userdel -r postgres
  ```

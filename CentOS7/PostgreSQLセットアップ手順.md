# PostgreSQLのセットアップ手順

* 作業アカウント：root
* インストールバージョン：10

***

## 既存の確認

* PostgreSQLがインストールされているか確認する

```bash
rpm -qa | grep postgres
# 存在したら削除する
yum -y remove postgresql
```

## PosggreSQLのインストール

* ostgreSQL公式リポジトリの追加  
  別バージョンをインストールするときは、対象バージョンのリポジトリを追加して「10」の箇所を変えれば良い

```bash
yum -y localinstall https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm

yum -y install postgresql10-server
```

* インストール完了後のバージョンの確認

```bash
/usr/pgsql-10/bin/postgres --version
# 以下が表示される
postgres (PostgreSQL) 10.12

ls -l /usr/pgsql-10/
# 以下が表示される
drwxr-xr-x 2 root root 4096  1月 23 09:00 bin
drwxr-xr-x 2 root root 4096  1月 23 09:00 lib
drwxr-xr-x 7 root root 4096  1月 23 09:00 share
```

***

## インストール後の作業

* データベースの初期化

```bash
/usr/pgsql-10/bin/postgresql-10-setup initdb
```

* 初期化を再実行する場合は以下のコマンドを実行してから行う

```bash
rm -fr /var/lib/pgsql
```

***

## PostgreSQLの起動

* サービスを起動する

```bash
systemctl start postgresql-10.service
```

* 自動起動を設定する

```bash
systemctl enable postgresql-10.service
```

***

## PostgreSQLへの接続確認

```bash
psql -l
# デフォルトのテーブル一覧が表示される

# バージョン表示
psql --version
# 以下のバージョンが表示される
psql (PostgreSQL) 10.12
```

***

## postgresユーザにログインパスワードを設定する

* 設定ファイルを編集する

```bash
vi /var/lib/pgsql/10/data/pg_hba.conf
# 下記のように変更する
# --------------------------------------------------
local   all    all                    password
# IPv4 local connections:
host    all    all    127.0.0.1/32    password
# IPv6 local connections:
host    all    all    ::1/128         password
# --------------------------------------------------
```

* 再起動して反映

```bash
systemctl restart postgresql-10.service
```

* パスワード認証でログインできることを確認する

```bash
psql -U postgres
Password for user postgres: # 設定したパスワードを入力
psql (10.12)
Type "help" for help.
```

***

## postgresユーザの環境変数設定

インストール時に作成されるpostgresユーザの環境設定をする

* ユーザの切り替え

```bash
su - postgres
```

***

## PostgreSQLのアンインストール

不要になったPostgreSQLを削除する手順

* postgresqlの削除

```bash
yum remove postgresql
```

* 関連ライブラリの削除

```bash
yum remove postgresql-libs
```

* postgresユーザの削除

```bash
# -r はユーザの作成データを削除するオプション
userdel -r postgres
```

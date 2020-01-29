# PostgreSQLのセットアップ手順  

* 作業アカウント：root
* インストールバージョン：12.1

***

## PosggreSQLのインストール  

* リポジトリパッケージをインストールする

```bash
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```

* serverパッケージをインストールする

```bash
yum -y install postgresql12-server
```

* インストールされたことを確認する

```bash
ls -l /usr/pgsql-12/
# 以下が表示される
drwxr-xr-x. 2 root root 4096  MM DD hh:mm bin
drwxr-xr-x. 3 root root   22  MM DD hh:mm doc
drwxr-xr-x. 3 root root 4096  MM DD hh:mm lib
drwxr-xr-x. 8 root root 4096  MM DD hh:mm share
```

***

## データベースクラスタの作成  

* 日本語ではロケールを使う必要性とメリットがあまりないためロケールを使わないようにする

```bash
PGSETUP_INITDB_OPTIONS="-E UTF8 --locale=C" /usr/pgsql-12/bin/postgresql-12-setup initdb
# 結果が表示される
Initializing database ... OK
```

* クラスタの確認

```bash
ls /var/lib/pgsql/12/data
# .confの設定ファイルが作成されていること
```

***

## PostgreSQLの起動  

* サービスを起動

```bash
systemctl start postgresql-12.service
```

* 自動起動の設定

```bash
systemctl enable postgresql-12.service
```

***

## postgresユーザの環境変数設定  

インストール時に作成されるpostgresユーザの環境設定をする

* ユーザの切り替え

```bash
su - postgres
```

```bash
vi ~/.pgsql_profile
#以下を設定する
# --------------------------------------------------
PATH=/usr/pgsql-12/bin:$PATH
MANPATH=/usr/pgsql-12/share/man:$MANPATH
PGDATA=/var/lib/pgsql/12/data
export PATH MANPATH PGDATA
# --------------------------------------------------
```

* 設定ファイルの再読み込み

```bash
. ~/.bash_profile
```

***

## データベースの接続確認  

* PostgreSQLに接続できるか確認する

```bash
psql -l
```

* バージョン表示

```bash
psql --version
# 以下のバージョンが表示される
psql (PostgreSQL) 12.1
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
userdel -r postgres
# -r はユーザの作成データを削除するオプション
```

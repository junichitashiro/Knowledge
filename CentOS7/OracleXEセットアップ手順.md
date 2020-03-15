# CentOS7 で Oracle Database Express Edition 11g をセットアップする手順

* 作業アカウント：root

***

## パッケージのダウンロード

* 下記URLより Oracle Database Express Edition 11g Release 2 for Linux x64 をダウンロードする

[<http://www.oracle.com/technetwork/jp/database/database-technologies/express-edition/downloads/index.html>]

* ダウンロード後はCentOS7の任意のディレクトリに格納しておく

* Vagrantファイルに下記を追記することでホストとゲストの共有フォルダを作成可能

```ruby
config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
```

***

## hostsファイルの設定変更

* Oracleが自身を認識するための設定をする

* [127.0.0.1] [ホスト名] の行を追記する

```bash
vi /etc/hosts
# --------------------------------------------------
127.0.0.1 local-centos7
# --------------------------------------------------
```

## スワップの設定

* インストールに要求されるサイズのスワップ（物理メモリの2倍）を設定する

* スワップの削除

```bash
swapoff -a
```

* 確認コマンド

```bash
# ヘッダのみが表示される
cat /proc/swaps
```

* スワップファイルの作成  
ここでは2GB（1MB×2048）を割り当てている

```bash
dd if=/dev/zero of=/swap bs=1M count=2048
# 結果が出力される
2048+0 records in
2048+0 records out
2147483648 bytes (2.1 GB) copied, 01.2345 s, 789 MB/s
```

* スワップ領域の作成

```bash
mkswap /swap
```

* スワップ領域の有効化

```bash
swapon /swap
```

* 確認コマンド

```bash
# 2Gが割り当てられていること
cat /proc/swaps
```

***

## 事前インストール

* 必要なライブラリをインストールしておく

```bash
yum -y install libaio bc zip unzip
```

## Oracleパッケージのインストール

* ダウンロードしたファイルを展開してインストールする

```bash
cd /vagrant/share
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
rpm -ivh Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
# 完了後以下が表示される
# You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.
```

* 初期設定の実行

```bash
/etc/init.d/oracle-xe configure
Specify the HTTP port that will be used for Oracle Application Express [8080]: # Enterキー押下
Specify a port that will be used for the database listener [1521]: # Enterキー押下
initial configuration: # パスワードを入力
Confirm the password: # パスワードを再入力
Do you want Oracle Database 11g Express Edition to be started on boot (y/n) [y]: # Enterキー押下
```

* セットアップ完了後以下のメッセージが出力される

```bash
Starting Oracle Net Listener...Done
Configuring database...Done
Starting Oracle Database 11g Express Edition instance...Done
Installation completed successfully.
```

* Oracle用の環境変数を設定する

```bash
. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
# 毎回設定するのは手間なのでログインユーザの .bashrc に追加しておく
cd
vi .bashrc
# 下記を末尾に追記
# --------------------------------------------------
. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
# --------------------------------------------------
```

***

## インストール後の確認

* sqlplusでログイン

```sql
sqlplus system
SQL*Plus: Release 11.2.0.2.0 Production on ****
Copyright (c) 1982, 2011, Oracle. All rights reserved.
パスワードを入力してください: # 設定したパスワードを入力
# ログイン後に以下のメッセージが表示される
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
に接続されました。
```

* バージョン確認

```sql
select * from v$version;
# 以下の情報が表示される
BANNER
--------------------------------------------------------------------------------
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
PL/SQL Release 11.2.0.2.0 - Production
CORE    11.2.0.2.0      Production
TNS for Linux: Version 11.2.0.2.0 - Production
NLSRTL Version 11.2.0.2.0 - Production
```

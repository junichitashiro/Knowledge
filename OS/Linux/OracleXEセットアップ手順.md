# CentOS7 で Oracle Database Express Edition 11g をセットアップする手順

* 作業アカウント：root

---

## パッケージのダウンロード

* 下記URLより Oracle Database Express Edition 11g Release 2 for Linux x64 をダウンロードする

  [<http://www.oracle.com/technetwork/jp/database/database-technologies/express-edition/downloads/index.html>]

* ダウンロード後はCentOS7の任意のディレクトリに格納しておく

* Vagrantファイルに下記を追記することでホストとゲストの共有フォルダを作成可能

  ```ruby
  config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
  ```

---

## hostsファイルの設定を変更する

* Oracleが自身を認識するための設定をする

  ```bash
  vi /etc/hosts
  # [127.0.0.1] [ホスト名] の行を追記する
  # --------------------------------------------------
  127.0.0.1 dev-centos7
  # --------------------------------------------------
  ```

## スワップを設定する

インストールに要求されるサイズのスワップ（物理メモリの2倍）を設定する

* スワップの削除

  ```bash
  swapoff -a
  ```

* 表示コマンドでヘッダしか表示されないことを確認する

  ```bash
  cat /proc/swaps
  # Filename                                Type            Size    Used    Priority
  ```

* スワップファイルを4GB（1MB×4096）を作成する

  ```bash
  dd if=/dev/zero of=/swap bs=1M count=4096
  # 結果が表示される
  4096+0 レコード入力
  4096+0 レコード出力
  4294967296 バイト (4.3 GB) コピーされました、 9.83032 秒、 437 MB/秒
  ```

* スワップ領域を割り当てる

  ```bash
  mkswap /swap
  # 結果が表示される
  スワップ空間バージョン1を設定します、サイズ = 4194300 KiB
  ラベルはありません, UUID=d3b878ff-e214-4ce3-ab40-ce06625f7f97
  ```

* スワップ領域を有効化する

  ```bash
  swapon /swap
  # 結果が表示される
  swapon: /swap: 安全でない権限 0644 を持ちます。 0600 がお勧めです。
  ```

* 表示コマンドで確認する

  ```bash
  cat /proc/swaps
  # 割り当てたサイズが表示されること
  Filename                                Type            Size    Used    Priority
  /swap                                   file            4194300 0       -1
  ```

---

## 事前インストール

* インストールに必要なライブラリをインストールしておく

  ```bash
  yum -y install libaio bc zip unzip
  ```

* CentOS7以降 **netstat** コマンドが非推奨となっているため **net-tools** を実行して有効化する

  ```bash
  yum -y install  net-tools
  ```

## Oracleパッケージのインストール

* ダウンロードしたファイルを展開する

  ```bash
  cd /vagrant/share
  unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
  ```

* インストールを実行する

  ```bash
  rpm -ivh Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
  # 完了すると以下のメッセージが表示される
  # You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.
  ```

## 初期設定の実行

* 初期設定コマンドを実行する

  ```bash
  /etc/init.d/oracle-xe configure
  # コンソールの表示内容に従って初期設定をする
  Specify the HTTP port that will be used for Oracle Application Express [8080]: # Enterキー押下
  Specify a port that will be used for the database listener [1521]: # Enterキー押下
  initial configuration: # パスワードを入力
  Confirm the password: # パスワードを再入力
  Do you want Oracle Database 11g Express Edition to be started on boot (y/n) [y]: # Enterキー押下
  ```

* セットアップが完了すると以下のメッセージが出力される

  ```bash
  Starting Oracle Net Listener...Done
  Configuring database...Done
  Starting Oracle Database 11g Express Edition instance...Done
  Installation completed successfully.
  ```

* Oracle用の環境変数を設定する

  ```bash
  . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
  ```

* 毎回設定するのは手間なのでログインユーザの .bashrc に追加しておく

  ```bash
  cd
  vi .bashrc
  # 下記を末尾に追記する
  # --------------------------------------------------
  . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
  # --------------------------------------------------
  ```

---

## インストール後の確認

* sqlplusでログインする

  ```sql
  sqlplus system

  SQL*Plus: Release 11.2.0.2.0 Production on ****
  Copyright (c) 1982, 2011, Oracle. All rights reserved.

  パスワードを入力してください: # 設定したパスワードを入力

  # ログイン後に以下のメッセージが表示される
  Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
  に接続されました。
  ```

* バージョンを表示して確認する

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

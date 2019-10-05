# CentOS7にZabbixをセットアップする  
* Vagrantで実施する場合のシステム要件  
メモリ：4G以上  
プロセッサー：2以上
* 作業アカウント：root
* Zabbixのバージョン：4系
* 使用DB：MariaDB
* [https://github.com/junichitashiro/Technical-Notes/] のVagrant/CentOS7の環境構築.md を実施しておく

***
## Zabbixで使用するフォントの対応  
* 日本語用フォントのインストール
```bash
yum -y install ibus-kkc vlgothic-*
```

***
## ファイアウォール機能の停止  
* 起動中サービスの停止と自動起動の停止  
安全な環境でない場合は非推奨
```bash
systemctl stop firewalld
systemctl disable firewalld
```

* サービス自動起動一覧の確認
```bash
# firewalld.service が disabled になっていること
systemctl list-unit-files -t service | grep firewalld.service
```

***
## パッケージのインストール  
* PHPのインストール
```bash
yum -y install php php-mysql php-mbstring
```

* webサービスの再起動
```bash
systemctl restart httpd.service
```

* MariaDBのインストール
```bash
yum -y install mariadb-server
```

* サービスの開始と自動起動の設定
```bash
systemctl start mariadb
systemctl enable mariadb
```

***
## パーミッションの変更  
* インストールエラー回避のためパーミッションを変更しておく
```bash
chmod -R 777 /var/www/html
```

* Zabbixインストール前に一度CentOS7の再起動をしておく  
```bash
reboot
```

***
## Zabbix関連パッケージのインストール  
* Zabbixリポジトリの登録
```bash
yum -y install http://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
```


* Zabbixのバイナリ、Webインターフェース、Zabbixエージェントのインストール
```bash
yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-web-japanese zabbix-agent
```

* getコマンドとsenderコマンドのインストール
```bash
yum -y install zabbix-get zabbix-sender
```

## MariaDBの設定変更  
* [mysqld]カテゴリの編集
```bash
vi /etc/my.cnf.d/server.cnf
# --------------------------------------------------
# [mysqld]カテゴリを編集、なければ追加する
[mysqld]
character-set-server = utf8
collation-server = utf8_bin
skip-character-set-client-handshake
innodb_file_per_table
# --------------------------------------------------
```

* MariaDBのサービス再起動
```bash
systemctl restart mariadb
```

***
## Zabbix用データベースの作成  
* MariaDBにログイン
```bash
mysql -uroot
```

* データベースの作成
```sql
create database zabbix;
```

* 権限付与とパスワードの設定  
パスワードに zabbixpassword を設定
```sql
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbixpassword';
```
* MariaDBからログアウト
```sql
exit
```

* DBのインポート  
インストールしたパッケージのバージョンによってパスが異なるので確認すること
```bash
zcat /usr/share/doc/zabbix-server-mysql-X.X.X/create.sql.gz | mysql -uroot zabbix
```

* zabbix_server.conf ファイルの設定変更
```bash
sed -i '/# DBHost=localhost/cDBHost=localhost' /etc/zabbix/zabbix_server.conf
sed -i '/# DBPassword/cDBPassword=zabbixpassword' /etc/zabbix/zabbix_server.conf
```

* zabbix.conf ファイルの設定変更
```bash
sed -i '/date.timezone/a\        php_value\ date.timezone \Asia\/Tokyo' /etc/httpd/conf.d/zabbix.conf
```

* Zabbixサービスの開始
```bash
systemctl start zabbix-server
systemctl enable zabbix-server
```

* 自動起動の設定
```bash
systemctl start zabbix-agent
systemctl enable zabbix-agent
```

* Webサービスの再起動
```bash
systemctl restart httpd
```

* プロセスの確認  
複数のzabbixプロセスが起動していること
```bash
ps ax | grep zabbix
```

***
## GUIからインストールを実行  
## Zabbixにアクセス  
* ホスト端末のブラウザから [http://192.168.33.10/zabbix] にアクセスする

## 事前チェック画面  
* すべて OK になっていること

## DB接続設定画面  
* 作成したMariaDBの設定に合わせる
```
Database type : MySQL
Database host : localhost
Database port : 0
Database name : zabbix
user          : zabbix
Password      : zabbixpassword
```

## Zabbixサーバー詳細画面  
* Zabbixから監視するときのDB名を指定できるが、希望がなければそのまま次へ

## 事前チェックまとめ画面  
* 内容を確認してそのまま次へ

## インストール画面  
* 完了が表示されたら次へ

## ログイン画面  
* 以下の設定でログインする  
Useraname:Admin  
Password :zabbix  
ログインできればセットアップ完了  

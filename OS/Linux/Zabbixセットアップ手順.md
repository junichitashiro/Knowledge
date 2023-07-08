# CentOS7にZabbixをセットアップする

* Vagrantで実施する場合のシステム要件
* メモリ：4G以上
* プロセッサー：2以上
* 作業アカウント：root
* Zabbixのバージョン：4系
* 使用DB：MariaDB

---

## Zabbixで使用するフォントを準備する

### 日本語用フォントのインストール

```bash
yum -y install ibus-kkc vlgothic-*
```

---

## ファイアウォール機能を停止する

* 安全な環境でない場合は非推奨

### 起動中のサービスを停止する

```bash
systemctl stop firewalld.service
```

### 自動起動も停止しておく

```bash
systemctl disable firewalld.service
# Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
# Removed symlink /etc/systemd/system/basic.target.wants/firewalld.service.
```

### サービス自動起動一覧を表示して確認する

```bash
systemctl list-unit-files -t service | grep firewalld.service
# firewalld.service                             disabled
```

---

## 必要なパッケージをインストールする

### PHPのインストール

```bash
yum -y install php php-mysql php-mbstring
```

### Webサービスを再起動する

```bash
systemctl restart httpd.service
```

### MariaDBのインストール

```bash
yum -y install mariadb-server
```

### MariaDBのサービスを開始する

```bash
systemctl start mariadb.service
```

### MariaDBの自動起動を設定する

```bash
systemctl enable mariadb.service
# Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.
```

### サービス自動起動一覧を表示して確認する

```bash
systemctl list-unit-files -t service | grep mariadb.service
# mariadb.service                               enabled
```

### Zabbixインストール前に一度OSを再起動する

```bash
reboot
```

---

## Zabbix関連パッケージのインストール

### Zabbixのリポジトリを登録する

```bash
yum -y install http://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
```

### Zabbixのバイナリ, Webインターフェース, Zabbixエージェントをインストールする

```bash
yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-web-japanese zabbix-agent
```

### getコマンドとsenderコマンドのインストール

```bash
yum -y install zabbix-get zabbix-sender
```

## MariaDBの設定変更

### [mysqld]カテゴリを編集する

```bash
vi /etc/my.cnf.d/server.cnf
# --------------------------------------------------
# [mysqld]カテゴリを以下のように編集する
[mysqld]
character-set-server = utf8
collation-server = utf8_bin
skip-character-set-client-handshake
innodb_file_per_table
# --------------------------------------------------
```

### MariaDBのサービスを再起動する

```bash
systemctl restart mariadb.service
```

---

## Zabbix用のデータベースを作成する

### MariaDBにログインする

```bash
mysql -uroot
# → プロンプトの表示が root から MariaDB に変わる
```

### データベースを作成する

```sql
create database zabbix;
# Query OK, 1 row affected (0.00 sec)
```

### 権限を付与してパスワードを設定する

```sql
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbixpassword';
# Query OK, 0 rows affected (0.00 sec)
# ここではパスワードに zabbixpassword を設定している
```

### MariaDBからログアウトする

```sql
exit
# Bye
```

### DBのインポート

インストールしたパッケージのバージョンによってパスが異なるので確認すること

```bash
zcat /usr/share/doc/zabbix-server-mysql-4.0.20/create.sql.gz | mysql -uroot zabbix
```

### zabbix_server.conf ファイルの設定を変更する

```bash
sed -i '/# DBHost=localhost/cDBHost=localhost' /etc/zabbix/zabbix_server.conf
sed -i '/# DBPassword/cDBPassword=zabbixpassword' /etc/zabbix/zabbix_server.conf
```

### zabbix.conf ファイルの設定を変更する

```bash
sed -i '/date.timezone/a\        php_value\ date.timezone \Asia\/Tokyo' /etc/httpd/conf.d/zabbix.conf
```

### zabbixサーバのサービスを起動して自動起動を設定する

```bash
systemctl start zabbix-server.service
systemctl enable zabbix-server.service
# Created symlink from /etc/systemd/system/multi-user.target.wants/zabbix-server.service to /usr/lib/systemd/system/zabbix-server.service.
```

### zabbixエージェントのサービスを起動して自動起動を設定する

```bash
systemctl start zabbix-agent.service
systemctl enable zabbix-agent.service
# Created symlink from /etc/systemd/system/multi-user.target.wants/zabbix-agent.service to /usr/lib/systemd/system/zabbix-agent.service.
```

### Webサービスを再起動する

```bash
systemctl restart httpd.service
```

### プロセスを表示して複数のzabbixプロセスが起動していることを確認する

```bash
ps ax | grep zabbix
```

---

## GUIからインストールを実行する

## Zabbixにアクセスして以下を実行する

1. ホスト端末のブラウザから [<http://192.168.33.10/zabbix>] にアクセスする
2. 事前チェック画面ですべて OK になっていること
3. DB接続設定画面で作成したMariaDBの設定に合わせる
    ```ini
    Database type : MySQL
    Database host : localhost
    Database port : 0
    Database name : zabbix
    user          : zabbix
    Password      : zabbixpassword
   ```
4. Zabbixサーバー詳細画面
   * Zabbixから監視するときのDB名を指定できるが、希望がなければそのまま次へ
5. 事前チェックまとめ画面で内容を確認してそのまま次へ進む
6. インストール画面で完了が表示されたら次へ進む
7. ログイン画面が表示されたら以下の設定でログインする
    * Useraname:Admin
    * Password :zabbix

### ログインできればセットアップ完了

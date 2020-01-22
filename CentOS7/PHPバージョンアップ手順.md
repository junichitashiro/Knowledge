# 既存のPHPを削除してバージョンアップする手順  

* 作業アカウント：root
* wordpressインストール用の手順として作成  
Zabbixのインストールに都合が悪いため共存させない

***

## PHPのリポジトリ追加  

* EPELのリポジトリ追加

```bash
yum -y install epel-release
```

* REMIのリポジトリ追加

```bash
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
```

## 既存のPHPを削除  

* 既存のPHPはすべて削除する

```bash
yum remove php-*
```

## 新しいバージョンのPHPをインストール  

* ここでは7.1.Xを指定

```bash
yum -y install --disablerepo=* --enablerepo=epel,remi,remi-safe,remi-php71 php
```

***

## 補足　関連性の高いMySQLの拡張機能をインストールしておく  

* php-mysqlndのインストール

```bash
yum -y install yum-utils
yum-config-manager --enable remi-php71
yum -y install php-mysqlnd
```

* 確認コマンド

```bash
php -m | grep mysql
# 以下が表示されること
mysqli
mysqlnd
pdo_mysql
```

* Apacheの再起動

```bash
service httpd restart
```

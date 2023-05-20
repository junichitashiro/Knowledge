# 既存のPHPを削除してバージョンアップする手順

* 作業アカウント：root
* wordpressインストール用の手順として作成
* Zabbixのインストールに都合が悪いため共存させない

---

## リポジトリの追加

### EPELのリポジトリを追加する

```bash
yum -y install epel-release
```

### REMIのリポジトリを追加する

```bash
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
```

## 既存のPHPを削除する

### PHPのバージョンを確認して古い場合は削除する

```bash
php -v
```

> PHP X.X.X (cli) (built: Jul  9 2020 08:57:23) ( NTS )

### 既存のPHPを削除するコマンド

```bash
yum -y remove php-*
```

## 新しいバージョンのPHPをインストールする

### 7.4を指定してインストール

```bash
yum -y install --disablerepo=* --enablerepo=epel,remi,remi-safe,remi-php74 php
```

---

## 補足：関連性の高いMySQLの拡張機能をインストールしておく

### MySQLネイティブドライバのインストール

```bash
yum -y install yum-utils
yum-config-manager --enable remi-php74
yum -y install php-mysqlnd
```

### PHPモジュールを表示して確認する

```bash
php -m | grep mysql
```

> mysqli  
mysqlnd  
pdo_mysql

### バージョンを表示して確認する

```bash
php -v
```

> PHP 7.4.8 (cli) (built: Jul  9 2020 08:57:23) ( NTS )  
Copyright (c) The PHP Group  
Zend Engine v3.4.0, Copyright (c) Zend Technologies

### Apacheを再起動する

```bash
systemctl restart httpd.service
```

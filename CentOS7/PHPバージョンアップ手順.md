# 既存のPHPを削除してバージョンアップする手順

* 作業アカウント：root
* wordpressインストール用の手順として作成  
Zabbixのインストールに都合が悪いため共存させない

***

## リポジトリの追加

* EPELのリポジトリを追加する

  ```bash
  yum -y install epel-release
  ```

* REMIのリポジトリを追加する

  ```bash
  rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
  ```

## 既存のPHPを削除する

* 既存のPHPはすべて削除する

  ```bash
  yum -y remove php-*
  ```

## 新しいバージョンのPHPをインストールする

* 7.1を指定してインストール

  ```bash
  yum -y install --disablerepo=* --enablerepo=epel,remi,remi-safe,remi-php71 php
  ```

***

## 補足：関連性の高いMySQLの拡張機能をインストールしておく

* MySQLネイティブドライバのインストール

  ```bash
  yum -y install yum-utils
  yum-config-manager --enable remi-php71
  yum -y install php-mysqlnd
  ```

* PHPモジュールを表示して確認する

  ```bash
  php -m | grep mysql
  # mysqli
  # mysqlnd
  # pdo_mysql
  ```

* バージョンを表示して確認する

  ```bash
  php -v
  # PHP 7.1.33 (cli) (built: Apr 14 2020 10:36:03) ( NTS )
  # Copyright (c) 1997-2018 The PHP Group
  # Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies
  ```

* Apacheを再起動する

  ```bash
  systemctl restart httpd.service
  ```

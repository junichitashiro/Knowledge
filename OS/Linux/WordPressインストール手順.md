# Vagrant上のCentOS7にWordPressをインストールする手順

* 作業アカウント：vagrant
* 使用DB：MariaDB
* PHPのバージョンアップを実行しておく  
  [<https://github.com/junichitashiro/Technical-Notes/blob/master/CentOS7/PHPバージョンアップ手順.md>]

***

## unzipのインストール

* zipファイルを展開する必要があるので __unzip__ をインストールする

  ```bash
  sudo yum -y install unzip
  ```

***

## DocumentRootの確認

* __DocumentRoot__ がwordpressのファイル配置場所（ここでは"/var/www/html"）と同じであることを確認する

  ```bash
  view /etc/httpd/conf/httpd.conf
  ```

* 以下の内容であること

  ```bash
  #
  # DocumentRoot: The directory out of which you will serve your
  # documents. By default, all requests are taken from this directory, but
  # symbolic links and aliases may be used to point to other locations.
  #
  DocumentRoot "/var/www/html"
  ```

***

## ディレクティブの変更

* \<Directory "/var/www/html">～\</Directory>タグの __AllowOverride__ の設定をNone から All に変更する

  ```bash
  sudo vi /etc/httpd/conf/httpd.conf
  ```

* 以下の内容に変更する

  ```bash
  <Directory "/var/www/html">
    Options Indexes FollowSymLinks
    # AllowOverride None # コメントアウトする
    AllowOverride All    # 追記する
    Require all granted
  </Directory>
  ```

***

## WordPressのインストールファイルを取得する

* WordPressの公式サイトから最新版のファイルを取得する

  ```bash
  cd /var/www/html
  sudo wget https://ja.wordpress.org/latest-ja.zip
  ```

* 取得したzipファイルを展開する

  ```bash
  sudo unzip latest-ja.zip
  ```

***

## データベースの準備

* MariaDBをインストールする

  ```bash
  sudo yum -y install mariadb-server
  ```

* サービスを起動する

  ```bash
  sudo systemctl start mariadb.service
  ```

* 自動起動を設定する

  ```bash
  sudo systemctl enable mariadb
  ```

  > Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.

* MariaDBにログインする  
  ログインするとプロンプトの表示が __MariaDB [(none)]>__ に変わる

  ```bash
  mysql -uroot
  ```

  > Welcome to the MariaDB monitor.  Commands end with ; or \g.  
  Your MariaDB connection id is 2  
  Server version: 5.5.64-MariaDB MariaDB Server  
  Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.  
  Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

* 以下の設定のデータベースを作成する

  |設定項目|設定値|
  |--|--|
  |データベース名|wordpress|
  |ユーザー名|dbuser|
  |パスワード|dbuser1|

* データベースの作成

  ```sql
  create database wordpress;
  ```

  > Query OK, 1 row affected (0.00 sec)

* __dbuser__ に データベース __wordpress__ を変更する権限を付与する

  ```sql
  grant all privileges on wordpress.* to dbuser@localhost identified by 'dbuser1';
  ```

  > Query OK, 0 rows affected (0.00 sec)

* MariaDBからログアウトする

  ```sql
  exit
  ```

  > Bye

***

## .htaccessファイルの作成

* __/var/www/html/wordpress__ 配下に __.htaccess__ ファイルを作成する

  ```bash
  cd /var/www/html/wordpress
  sudo touch .htaccess
  ```

* パーミッションを変更する

  ```bash
  sudo chmod 666 .htaccess
  ```

* 内容を編集する

  ```bash
  sudo vi .htaccess
  ```

* 以下の内容を記述して保存する

  ```bash
  # BEGIN WordPress
  <IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.php# - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.php [L]
  </IfModule>

  # END WordPress
  ```

***

## configファイルの作成

* __wp-config-sample.php__ をコピーして __wp-config.php__ を作成する

  ```bash
  sudo cp wp-config-sample.php wp-config.php
  ```

* __wp-config.php__ の内容を編集し、作成したデータベースの設定情報を入力する

  ```bash
  sudo sed -i 's/database_name_here/wordpress/g' /var/www/html/wordpress/wp-config.php
  sudo sed -i 's/username_here/dbuser/g' /var/www/html/wordpress/wp-config.php
  sudo sed -i 's/password_here/dbuser1/g' /var/www/html/wordpress/wp-config.php
  ```

* 設定情報を表示して確認する

  ```bash
  view wp-config.php
  ```

* 以下の内容になっていること

  ```php
  /** WordPress のためのデータベース名 */
  define('DB_NAME', 'wordpress');

  /** MySQL データベースのユーザー名 */
  define('DB_USER', 'dbuser');

  /** MySQL データベースのパスワード */
  define('DB_PASSWORD', 'dbuser1');
  ```

## 認証キーの取得と設定

* wp-config.phpに記載されている [<https://api.wordpress.org/secret-key/1.1/salt/>] にアクセスすると認証用のユニークキーが表示される

* __wp-config.php__ の55～62行目を上記の内容に書き換える

  ```bash
  sudo vi wp-config.php
  ```

* 参考

  ```php
  #@+
  * 認証用ユニークキー
  *
  * それぞれを異なるユニーク (一意) な文字列に変更してください。
  * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の秘密鍵サービス} で自動生成することもできます。
  * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせることになります。
  *
  * @since 2.6.0
  */
  define('AUTH_KEY',         'ランダムな文字列');
  define('SECURE_AUTH_KEY',  'ランダムな文字列');
  define('LOGGED_IN_KEY',    'ランダムな文字列');
  define('NONCE_KEY',        'ランダムな文字列');
  define('AUTH_SALT',        'ランダムな文字列');
  define('SECURE_AUTH_SALT', 'ランダムな文字列');
  define('LOGGED_IN_SALT',   'ランダムな文字列');
  define('NONCE_SALT',       'ランダムな文字列');

  /**#@-*/
  ```

***

## WordPressのインストール

* ブラウザから [<http://192.168.33.10/wordpress/>] にアクセスしインストールを実行する

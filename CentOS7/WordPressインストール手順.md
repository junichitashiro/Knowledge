# CentOS7にWordPressをインストールする手順  
* 作業アカウント：vagrant
*使用DB：MariaDB
* PHPのバージョンアップを実行しておく  
[https://github.com/junichitashiro/Technical-Notes]  
CentOS7/PHPバージョンアップ手順.md

***
## DocumentRootの確認  
* DocumentRoot がwordpressのファイル配置場所（ここでは"/var/www/html"）と同じであることを確認する
```bash
view /etc/httpd/conf/httpd.conf
```

## ディレクティブの変更  
* <Directory "/var/www/html">～\</Directory>タグの AllowOverride の設定をNone から All に変更する
```bash
vi /etc/httpd/conf/httpd.conf
```

## ファイルの取得  
* [https://ja.wordpress.org/download/] からWordPressの最新版を取得する
```bash
cd /var/www/html
wget https://ja.wordpress.org/latest-ja.zip
```

* 取得したzipファイルを展開する
```bash
unzip latest-ja.zip
```

## データベースの準備  
* MariaDBのインストール
```bash
yum -y install mariadb-server
```

* サービスの開始と自動起動の設定
```bash
systemctl start mariadb
systemctl enable mariadb
```

* MariaDBにログイン
```bash
mysql -uroot
```

* 以下の設定のデータベースを作成する  
データベース名：wordpress  
ユーザ名：dbuser  
パスワード：dbuser1  
```sql
create database wordpress;
grant all privileges on wordpress.* to dbuser@localhost identified by 'dbuser1';
exit
```

## .htaccessファイルの作成  
* /var/www/html/wordpress 配下に.htaccessファイルを作成する
```bash
cd /var/www/html/wordpress
touch .htaccess
```

* パーミッションを変更して内容を編集する
```bash
chmod 666 .htaccess
vi .htaccess
# --------------------------------------------------
# 以下の内容を記述して保存する
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
# --------------------------------------------------
```

## wp-config.phpファイルの作成  
* wp-config-sample.phpをコピーしてwp-config.phpを作成する
```bash
cp wp-config-sample.php wp-config.php
```
* 内容を編集する
```bash
sed -i 's/database_name_here/wordpress/g' /var/www/html/wordpress/wp-config.php
sed -i 's/username_here/dbuser/g' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/dbuser1/g' /var/www/html/wordpress/wp-config.php
```
```bash
vi wp-config.php
# --------------------------------------------------
# 以下の内容を設定する
/** WordPress のためのデータベース名 */
define('DB_NAME', 'wordpress');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'dbuser');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', 'dbuser1');
# --------------------------------------------------
```

## 認証キーの取得と設定  
* wp-config.phpに記載されている  
[https://api.wordpress.org/secret-key/1.1/salt/]  
にアクセスし wp-config.php の55～62行目を書き換える

## WordPressのインストール  
* ブラウザから [http://192.168.33.10/wordpress/]  
にアクセスしインストールを実行する
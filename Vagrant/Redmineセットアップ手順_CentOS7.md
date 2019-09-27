# CentOS7にRedmineをセットアップする  
* CentOS7のセットアップまでは省略
* 作業はrootで実行する

***
## CentOSの設定  
* SELinuxの無効化
```Shell
vi /etc/sysconfig/selinux
# --------------------------------------------------
# SELINUX=disable
# --------------------------------------------------
```

* 再起動して確認する
```Shell
getenforce  # Disabled になっていること
```
* firewalldでHTTPを許可する
```Shell
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
firewall-cmd --zone=public --list-services
```

***
## 各種パッケージのインストール
* 開発ツール
```Shell
yum -y groupinstall "Development Tools"
```

* Ruby/Passenger
```Shell
yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel libffi-devel
```

* PostgreSQLとヘッダファイル
```Shell
yum -y install postgresql-server postgresql-devel
```

* Apacheとヘッダファイル
```Shell
yum -y install httpd httpd-devel
```

* ImageMagickと日本語フォント
```Shell
yum -y install ImageMagick ImageMagick-devel ipa-pgothic-fonts
```

***
## Rubyのインストール  
* rbenvのインストール
```Shell
cd /usr/local
sudo git clone https://github.com/rbenv/rbenv.git rbenv
sudo mkdir /usr/local/rbenv/shims
sudo mkdir /usr/local/rbenv/versions
```

* rbenvのパスを通す
```Shell
echo 'export RBENV_ROOT=/usr/local/rbenv' | sudo tee -a  /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' | sudo tee -a  /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' | sudo tee -a  /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh
```

* ファイルの編集
```Shell
sudo vi
# --------------------------------------------------
# 下記のように既存の行をコメントアウトして以下の2行追加する
# Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rbenv/bin:/usr/local/rbenv/shims
Defaults    env_keep += "RBENV_ROOT"
# --------------------------------------------------
```

* rbenvにruby-installプラグインを追加する
```Shell
git clone https://github.com/rbenv/ruby-build.git  rbenv/plugins/ruby-build
sudo rbenv/plugins/ruby-build/install.sh
```

* インストール可能なRuby一覧を確認
```Shell
rbenv install -l | grep 2.4
```

* rbenvを使ってRubyをインストール
```Shell
sudo rbenv install 2.4.4
sudo rbenv rehash
sudo rbenv global 2.4.4
ruby -v # バージョンが表示される
```

***
## gemの管理をするbundlerをインストール  
* ※後続処理でエラーとなったため回避策としてバージョンを指定している
```Shell
gem install -v 1.5.0 bundler
```

***
## PostgreSQLのインストール  
* 初期設定
```Shell
postgresql-setup initdb
# Initializing database ... OK
```

* 設定ファイルの編集
```Shell
vi /var/lib/pgsql/data/pg_hba.conf
# --------------------------------------------------
# 以下の2行を追加
# TYPE  DATABASE        USER            ADDRESS                 METHOD
host    redmine         redmine         127.0.0.1/32            md5
host    redmine         redmine         ::1/128                 md5
# --------------------------------------------------
```

* 自動起動の設定
```Shell
systemctl start postgresql.service
systemctl enable postgresql.service
```

* Redmine用のユーザの追加とDB作成
```Shell
cd /var/lib/pgsql
sudo -u postgres createuser -P redmine
新しいロールのためのパスワード: # パスワードを入力
もう一度入力してください：  # パスワードを再入力
sudo -u postgres createdb -E UTF-8 -l ja_JP.UTF-8 -O redmine -T template0 redmine
```

***
## Redmineのインストール  
* Redmineのsvnからチェックアウト
```Shell
svn co https://svn.redmine.org/redmine/branches/3.4-stable /var/lib/redmine
```

* DB設定ファイルdatabase.ymlの作成
* デフォルトファイルをコピーして設定ファイルを編集する
```Shell
cd /var/lib/redmine/config
touch database.yml
vi database.yml
# --------------------------------------------------
# 以下の内容で作成
# PostgreSQL configuration example
production:
  adapter: postgresql
  database: redmine
  host: localhost
  username: redmine
  password: "設定したパスワード"
# --------------------------------------------------
```

***
## 設定ファイルconfiguration.ymlの作成  
* メール通知用のサーバやファイルのアップロード先をこのファイル内で設定できるが今回は使用しないのでデフォルのまま
```Shell
cp configuration.yml.example configuration.yml
```

* gemパッケージのインストール
```Shell
cd /var/lib/redmine/
bundle install --without development test --path vendor/bundle
```

***
## Redmineの初期設定  
* セッション改ざん防止用の秘密鍵作成
```Shell
bundle exec rake generate_secret_token
```

* DBテーブルを作成しデフォルトデータを登録する
```Shell
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data
```

***
## Passengerのインストール  
* Phusion Passengerをインストール
* Apache上でRedmineなどのRailsアプリを動かすために使われる
```Shell
gem install passenger
```

* Apache用モジュールを追加し設定確認
```Shell
passenger-install-apache2-module --auto --languages ruby
passenger-install-apache2-module --snippet
# --------------------------------------------------
# ここで表示された内容を控えておく
LoadModule passenger_module /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.2/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.2
  PassengerDefaultRuby /usr/local/rbenv/versions/2.4.4/bin/ruby
</IfModule>
# --------------------------------------------------
```

* ApacheにRedmine用設定ファイルを追加
```Shell
vi /etc/httpd/conf.d/redmine.conf
# --------------------------------------------------
<Directory "/var/lib/redmine/public">
  Require all granted
</Directory>
# 先ほどのコマンドの結果を入力する
LoadModule passenger_module /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.2/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.2
  PassengerDefaultRuby /usr/local/rbenv/versions/2.4.4/bin/ruby
</IfModule>
# --------------------------------------------------
```

* 自動起動の設定と起動
```Shell
systemctl start httpd.service
systemctl enable httpd.service
```

* PassengerでRedmineが実行できるようPermission変更
```Shell
chown -R apache:apache /var/lib/redmine
```

***
## Redmineのアドレス変更  
* http://<IPアドレス>/redmine でアクセス出来るようにするためRedmineをサブディレクトリ運用にする
```Shell
vi /etc/httpd/conf.d/redmine.conf
# --------------------------------------------------
# 以下を追記する
Alias /redmine /var/lib/redmine/public
<Location /redmine>
  PassengerBaseURI /redmine
  PassengerAppRoot /var/lib/redmine
</Location>
# --------------------------------------------------
```

* 設定が正しいかチェック
```Shell
service httpd configtest
# Syntax OK
```

* ApacheのListenアドレス/ポートを変更
```Shell
vi /etc/httpd/conf/httpd.conf
# --------------------------------------------------
# 以下に設定する
#Listen 12.34.56.78:80
#Listen 80
Listen 192.168.33.10:80
# --------------------------------------------------
```

* Apacheの再起動
```Shell
systemctl restart httpd
systemctl status httpd
```
__[http://192.168.33.10:80] にアクセスできればセットアップ完了__

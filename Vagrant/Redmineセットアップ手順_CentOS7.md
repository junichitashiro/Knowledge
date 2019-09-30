# CentOS7にRedmineをセットアップする  
* CentOS7のセットアップまでは省略
* 作業はrootで実行する
* 使用するDBはPostgreSQL

***
## SELinuxの無効化  
* SELINUX の設定を enforcing , permissiveから disabled に変更する
```bash
vi /etc/sysconfig/selinux
# --------------------------------------------------
SELINUX=disabled
# --------------------------------------------------
```

* 再起動
```bash
reboot
```

* 確認コマンド
```bash
# Disabled が表示されること
getenforce
```

* firewalldでHTTPを許可する
```bash
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
```

* 確認コマンド
```bash
# http が含まれていること
firewall-cmd --zone=public --list-services
```


***
## 各種パッケージのインストール  
* 開発ツール
```bash
yum -y groupinstall "Development Tools"
```

* Ruby/Passenger
```bash
yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel libffi-devel
```

* PostgreSQLとヘッダファイル
```bash
yum -y install postgresql-server postgresql-devel
```

* Apacheとヘッダファイル
```bash
yum -y install httpd httpd-devel
```

* ImageMagickと日本語フォント
```bash
yum -y install ImageMagick ImageMagick-devel ipa-pgothic-fonts
```

***
## Rubyのインストール  
* rbenvのインストール
```bash
cd /usr/local
sudo git clone https://github.com/rbenv/rbenv.git rbenv
sudo mkdir /usr/local/rbenv/shims
sudo mkdir /usr/local/rbenv/versions
```

* rbenvのパスを通す
```bash
echo 'export RBENV_ROOT=/usr/local/rbenv' | sudo tee -a  /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' | sudo tee -a  /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' | sudo tee -a  /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh
```

* rbenv を実行するためファイル編集
```bash
visudo
# --------------------------------------------------
# 下記のように既存の行をコメントアウトして以下の2行追加する
# Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rbenv/bin:/usr/local/rbenv/shims
Defaults    env_keep += "RBENV_ROOT"
# --------------------------------------------------
```

* rbenvにruby-installプラグインを追加する
```bash
git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
cd /usr/local/rbenv/plugins/ruby-build
sudo ./install.sh
```

* インストール可能なRuby一覧を確認
```bash
rbenv install -l | grep 2.4
```

* rbenvを使ってRubyをインストール
```bash
sudo rbenv install 2.4.4
sudo rbenv rehash
sudo rbenv global 2.4.4
```

* インストールバージョンの確認
```bash
# バージョンを表示する
ruby -v
```

***
## gemの管理をするbundlerをインストール  
* ※後続処理でエラーとならなかったバージョンを指定している
```bash
gem install -v 1.5.0 bundler
```

***
## PostgreSQLのインストール  
* 初期設定
```bash
# Initializing database ... OK が表示されること
postgresql-setup initdb
```

* 設定ファイルの編集
```bash
vi /var/lib/pgsql/data/pg_hba.conf
# --------------------------------------------------
# 以下の2行を追加
# TYPE  DATABASE        USER            ADDRESS                 METHOD
host    redmine         redmine         127.0.0.1/32            md5
host    redmine         redmine         ::1/128                 md5
# --------------------------------------------------
```

* 自動起動の設定
```bash
systemctl start postgresql.service
systemctl enable postgresql.service
```

* Redmine用のユーザの追加とDB作成
```bash
cd /var/lib/pgsql
sudo -u postgres createuser -P redmine
新しいロールのためのパスワード: # パスワードを入力
もう一度入力してください：  # パスワードを再入力
sudo -u postgres createdb -E UTF-8 -l ja_JP.UTF-8 -O redmine -T template0 redmine
```

***
## Redmineのインストール  
* Redmineのsvnからチェックアウト
```bash
svn co https://svn.redmine.org/redmine/branches/3.4-stable /var/lib/redmine
```

* DB設定ファイルdatabase.ymlの作成
* デフォルトファイルを参考に設定ファイルを作成する
```bash
cd /var/lib/redmine/config
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
* 設定ファイルconfiguration.ymlの作成  
メール通知用のサーバやファイルのアップロード先をこのファイル内で設定できるが今回は使用しないのでデフォルのまま
```bash
cp configuration.yml.example configuration.yml
```

* gemパッケージのインストール
```bash
cd /var/lib/redmine/
# CPUコア数分だけ並列処理を指定する
bundle install --jobs=2
```

***
## Redmineの初期設定  
* セッション改ざん防止用の秘密鍵作成
```bash
bundle exec rake generate_secret_token
```

* DBテーブルを作成しデフォルトデータを登録する
```bash
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data
```

***
## Passengerのインストール  
* Phusion Passengerをインストール
* Apache上でRedmineなどのRailsアプリを動かすために使われる
```bash
gem install passenger
```

* Apache用モジュールを追加し設定確認
```bash
passenger-install-apache2-module --auto --languages ruby
passenger-install-apache2-module --snippet
# --------------------------------------------------
# ここで表示された内容を控えておく
LoadModule passenger_module /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.4/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.4
  PassengerDefaultRuby /usr/local/rbenv/versions/2.4.4/bin/ruby
</IfModule>
# --------------------------------------------------
```

* ApacheにRedmine用設定ファイルを追加
```bash
vi /etc/httpd/conf.d/redmine.conf
# --------------------------------------------------
<Directory "/var/lib/redmine/public">
  Require all granted
</Directory>
# 先ほどのコマンドの結果
LoadModule passenger_module /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.4/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/rbenv/versions/2.4.4/lib/ruby/gems/2.4.0/gems/passenger-6.0.4
  PassengerDefaultRuby /usr/local/rbenv/versions/2.4.4/bin/ruby
</IfModule>
# --------------------------------------------------
```

* 自動起動の設定と起動
```bash
systemctl start httpd.service
systemctl enable httpd.service
```

* PassengerでRedmineが実行できるようPermission変更
```bash
chown -R apache:apache /var/lib/redmine
```

***
## Redmineのアドレス変更  
* http://<IPアドレス>/redmine でアクセス出来るようにするためRedmineをサブディレクトリ運用にする
```bash
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
```bash
# Syntax OK が表示されること
service httpd configtest
```

* ApacheのListenアドレス/ポートを変更
```bash
vi /etc/httpd/conf/httpd.conf
# --------------------------------------------------
# 以下に設定する
#Listen 12.34.56.78:80
#Listen 80
Listen 192.168.33.10:80
# --------------------------------------------------
```

* Apacheの再起動
```bash
systemctl restart httpd
systemctl status httpd
```
__[http://192.168.33.10:80/redmine] にアクセスできればセットアップ完了__  
__ログインIDとパスワードはどちらも admin__

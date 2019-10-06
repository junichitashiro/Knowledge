# CentOS7の環境構築手順  
* 作業アカウント：vagrant
* 各種パッケージのバージョンは動作確認できたものを記載

***
## yum のリポジトリサーバのドメインを指定する
* 国内サーバを指定して高速化を図る
```bash
sudo sed -i '/# include_only=/i include_only=.JP' /etc/yum/pluginconf.d/fastestmirror.conf
sudo yum clean all
```

* 手動の場合
```bash
sudo vi /etc/yum/pluginconf.d/fastestmirror.conf
# --------------------------------------------------
# 以下の指定をする
include_only=.JP
# --------------------------------------------------
sudo yum clean all
```

***
## Gitのセットアップ準備  
* 古いバージョンの削除と開発用パッケージのインストール
```bash
sudo yum -y remove git
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf
```

* 新しいバージョンのGitをインストール
```bash
# Gitの取得　必要なバージョンを指定すること
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.23.0.tar.gz
# 取得したファイルの展開
sudo tar vfx git-2.23.0.tar.gz
cd git-2.23.0
# インストールの事前チェックとコンパイル
sudo make configure
sudo ./configure --prefix=/usr
sudo make all
# インストールの実行
sudo make install
```

***
## Githubからセットアップシェルを取得  
* Git用のディレクトリを作成してリポジトリを取得
```bash
mkdir ~/git
cd ~/git
git clone https://github.com/junichitashiro/ShellScript.git
```

* セットアップシェルを実行する
```bash
cd ShellScript
./centos7_initial_setup.sh
```

* システムを最新化
```bash
sudo yum -y update
```

* 鍵の不一致で最新化できない場合鍵を取得しなおす
```bash
curl -L https://yum.puppetlabs.com/RPM-GPG-KEY-puppet -o /tmp/RPM-GPG-KEY-puppet
gpg --with-fingerprint "/tmp/RPM-GPG-KEY-puppet"
sudo cp /tmp/RPM-GPG-KEY-puppet /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1
```

***
## centos7_initial_setup.shの実行内容
***
## ホスト名の変更  
* /etc/hostnameを上書きする
```bash
sudo sh -c "echo 'local-centos7' > /etc/hostname"
```

* 手動で/etc/hostnameを編集する場合
```bash
vi /etc/hostname
# --------------------------------------------------
# 設定したいホスト名を追記して上書き保存する
local-centos7
# --------------------------------------------------
```

* 確認コマンド
```bash
# ホスト名の表示
hostname
```

***
## システムの表記を日本語にする  
* 日本語用のutf8設定をlocaleに追加する
コマンドは『localectl -f "文字コード" -i "設定元となるlocaleファイル"』

```bash
sudo localectl set-locale LANG=ja_JP.UTF-8
```

* 現在のログインシェルに設定を反映する
```bash
sudo localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf
```
* 確認コマンド
```bash
# 言語設定の表示
echo $LANG
```

***
## タイムゾーンを設定する  
* タイムゾーンを日本に設定
```bash
sudo timedatectl set-timezone Asia/Tokyo
```

* 確認コマンド
```bash
# 現在時刻の表示
date
# タイムゾーン設定の表示
timedatectl
```

***
## ファイアウォール設定の変更  
* ファイアウォールをON
初期設定がON/OFFのどちらでも対応できるよう restart を指定
```bash
sudo systemctl restart firewalld.service
sudo systemctl enable firewalld.service
```

* httpとssh通信を許可する
```bash
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --reload
```

***
## 時刻同期の設定  
* ntpのインストール
```bash
sudo yum -y install ntp
```

* デーモンが起動している場合は止める
```bash
sudo systemctl stop ntpd.service
```

* 事前に手動で日本標準時プロジェクトのサーバから時刻を取得する  
大幅に時刻がずれていると自動での時刻合わせができないため
```bash
sudo ntpdate ntp.nict.jp
```

* 設定ファイルを編集して同期するサーバを設定する
```bash
# 編集前の内容
# --------------------------------------------------
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
server 0.centos.pool.ntp.org iburst
server 1.centos.pool.ntp.org iburst
server 2.centos.pool.ntp.org iburst
server 3.centos.pool.ntp.org iburst
# --------------------------------------------------
```
```bash
# 以下の内容に書き換える
# --------------------------------------------------
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
server -4 ntp.nict.jp iburst
server -4 ntp.nict.jp iburst
server -4 ntp.nict.jp iburst
# --------------------------------------------------
```

* デーモンの起動と自動同期の設定
```bash
systemctl start ntpd.service
systemctl enable ntpd.service
```

***
## パッケージの追加インストール  
* マニュアルのインストール
```bash
sudo yum -y install man
sudo yum -y install man-pages-ja
```

* Apacheのインストール
```bash
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
```

***
## 設定の反映
* shellにログインしなおす
```bash
exec $SHELL -l
```

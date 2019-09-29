## CentOS7の環境構築手順  
* vagrant アカウントで実施
* 各種パッケージのバージョンはメモ作成時に動作確認した安定版
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
wget https://www.kernel.org/pub/software/scm/git/git-2.23.0.tar.gz
# 取得したファイルの展開
tar vfx git-2.23.0.tar.gz
cd git-2.23.0
# インストールの事前チェックとコンパイル
make configure
./configure --prefix=/usr
make all
# インストールの実行
sudo make install
```

***
## Githubからセットアップシェルを取得  
* Git用のディレクトリを作成してリポジトリを取得
```bash
mkdir ~/git
cd ~/git
git clone https://github.com/junichitashiro/vm_setup.git
```

* セットアップシェルを実行する
```bash
cd vm_setup/
./centos7_initial_setup.sh
```

* システムを最新化
```bash
sudo yum -y update
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
```bash
sudo systemctl restart firewalld.service
sudo systemctl enable firewalld.service
```

* ファイアウォールをOFF
```bash
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service
```

* httpとssh通信を許可する
```bash
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --reload
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

***
##  システムのアップデート  
* 既存のパッケージを最新化する
```bash
sudo yum -y update
```

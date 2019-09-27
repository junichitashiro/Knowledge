# MacのVagrantセットアップ手順
* 事前にHomebrewをインストールしておく

***
## Vagrantのインストール  
* Homebrewからインストールする
```Shell
brew cask install vagrant
# バージョンの確認
vagrant --version
```

* アップデートの場合
```Shell
brew cask reinstall vagrant
```

***
## VirtualBoxのインストール  
* Homebrewからインストールする
```Shell
brew cask install VirtualBox
VirtualBox --version
```

* アップデートの場合
```Shell
brew cask reinstall VirtualBox
```

***
## CentOS7のセットアップ  
* ディレクトリの作成
```Shell
mkdir vagrant
cd vagrant
mkdir local-centos7
```

* Boxの追加（Box名をlocal-centos7とする）
```Shell
vagrant box add local-centos7 https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box
```

* Boxの確認
```Shell
vagrant box list
```

* Boxの初期化
```Shell
vagrant init local-centos7
```

* Vagrantファイルの編集
```Shell
# 以下の行をコメントイン
config.vm.network "private_network", ip: "192.168.33.10"
```

* vagrantの実行
```Shell
vagrant up
```

***
## セットアップシェルを実行してCentOS7の環境設定をする  
* GitHubからセットアップ用のリポジトリをコピーする
```Shell
git clone https://github.com/junichitashiro/vm_setup.git
cd vm_setup
```

* gitのセットアップ
```Shell
./centos7_git_setup.sh
```

* CentOS7の初期セットアップ
```Shell
./centos7_initial_setup.sh
```
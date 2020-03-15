# VagrantでLinux環境をセットアップする手順

* OS：CentOS7
* Macで作業する場合は事前にHomebrewをインストールしておく

***

## VirtualBoxのインストール

### Windows

* 下記VirtualBoxのダウンロードページへアクセス  
[<https://www.virtualbox.org/wiki/Downloads>]  
Windows用インストーラ「VirtualBox x.x.xx for Windows hosts x86/amd64」をダウンロードしてインストーラを実行  
※x.x.xxはバージョン

### Mac

* Homebrewからインストールする

```bash
brew cask install VirtualBox
# バージョンの確認
VirtualBox --version
```

* アップデートの場合

```bash
brew cask reinstall VirtualBox
```

***

## Vagrantのインストール

Windows

* 下記Vagrantのダウンロードページへアクセス  
[<http://www.vagrantup.com/downloads.html>]  
WINDOWSカテゴリから「Universal (32 and 64-bit)」をダウンロードしてインストーラを実行

Mac

* Homebrewからインストールする

```bash
brew cask install vagrant
# バージョンの確認
vagrant --version
```

* アップデートの場合

```bash
brew cask reinstall vagrant
```

***

## Box作成の準備

* コマンドプロンプト、ターミナルから作業
* VagrantのBox用ディレクトリを作成

```bat
mkdir vagrant
cd vagrant
```

* Boxごとにディレクトリ分けしたほうが管理しやすいため各Box用のディレクトリを作成

```bat
mkdir local-centos7
cd local-centos7
```

## Boxを追加

* 下記のBox公開ページへアクセス  
[<http://www.vagrantbox.es/>]  
対象となるBoxのURLをコピーするかBoxファイルをダウンロードしておく

* [<https://www.dropbox.com/s/7u194d6reyr1loe/vagrant-centos-7.2.box?dl=0>]  
ここでは上記URLからダウンロードしたBoxをローカルに配置して実行している

* Boxの追加

vagrant box add [Box名] [コピーしたBoxのURLまはたパス]

```bat
vagrant box add local-centos7 vagrant-centos-7.2.box
```

* Boxの初期化  
vagrant init [Box名]  
コマンド実行後Box名のディレクトリにVagrantfileが作成される

```bat
vagrant init local-centos7
```

***

## Vagrantfileの編集

* 作成されたVagrantfileの下記の行をコメントインして保存する
* ブラウザから下記アドレスを指定するとWEBサーバとしてアクセスできるようになる

```bash
# config.vm.network "private_network", ip: "192.168.33.10"
```

## ホストOSとゲストOSのフォルダを共有する設定（任意）

* ホスト端末の"share"フォルダとゲスト端末の"/tmp/share"フォルダを共有する設定  
なお[create: true]はフォルダがなかった場合作成するオプション

```bash
config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
```

***

## Boxの起動

* Vagrantfileと同一のディレクトリでコマンドを実行

```bat
vagrant up
```

## ターミナルからBoxにアクセス

* Boxが起動している状態でTeraTermなどからアクセスする

```bash
TCP/IP ホスト：127.0.0.1
TCPポート：2222
サービス：SSH SSHバージョン：SSH2
```

```bash
ログインユーザ：vagrant
パスワード：vagrant
※rootもパスワードは同じ
```

* Vagrantfileの編集を行っている場合は次の設定でもアクセス可能

```bash
TCP/IP ホスト：192.168.33.10
TCPポート：22
サービス：SSH SSHバージョン：SSH2
```

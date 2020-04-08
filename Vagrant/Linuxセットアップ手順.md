# VagrantでローカルにCentOSをセットアップする

* OS：CentOS7
* Macで作業する場合は事前にHomebrewをインストールしておく

***

## VirtualBoxのインストール

### Windows

* VirtualBoxのダウンロードページへアクセスする  
[<https://www.virtualbox.org/wiki/Downloads>]

* Windows用インストーラ __VirtualBox x.x.xx for Windows hosts x86/amd64__ をダウンロードして実行する  
※ __x.x.xx__ はバージョン

### Mac

* Homebrewからインストールする

  ```bash
  brew cask install VirtualBox
  ```

* バージョンを表示して確認する

  ```bash
  VirtualBox --version
  ```

* インストール済みでアップデートする場合

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

* VagrantのBox用ディレクトリを作成する
* コマンドプロンプト、ターミナルから作業する

  ```bash
  mkdir vagrant
  cd vagrant
  ```

* Boxごとにディレクトリ分けしたほうが管理しやすいため各Box用のディレクトリを作成

  ```bash
  mkdir dev-centos7
  cd dev-centos7
  ```

## Boxの追加

* Box公開ページへアクセスする  
[<http://www.vagrantbox.es/>]

* 対象となるBoxのURLをコピーするかBoxファイルをダウンロードしておく

* Boxを追加する

  ```bash
  # vagrant box add [Box名] [コピーしたBoxのURLまはたパス]
  vagrant box add dev-centos7 vagrant-centos-7.2.box
  ```

* Boxを初期化する  
実行後Box名のディレクトリにVagrantfileが作成される

  ```bash
  # vagrant init [Box名]
  vagrant init dev-centos7
  ```

***

## Vagrantfileの編集

* 作成されたVagrantfileの下記の行をコメントインして保存する
* ブラウザから下記アドレスを指定するとWEBサーバとしてアクセスできるようになる

  ```ruby
  config.vm.network "private_network", ip: "192.168.33.10"
  ```

## ホストOSとゲストOSのフォルダを共有する設定（任意）

* ホスト端末の"share"フォルダとゲスト端末の"/tmp/share"フォルダを共有する設定

  ```bash
  # [create: true]はフォルダがなかった場合作成するオプション
  config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
  ```

***

## Boxの起動

* Vagrantfileと同一のディレクトリでコマンドを実行する

  ```bash
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

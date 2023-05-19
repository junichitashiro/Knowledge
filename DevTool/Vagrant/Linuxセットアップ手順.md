# VagrantでローカルにLinux環境をつくる

* OS：CentOS7
* Macで作業する場合は事前に **Homebrew** をインストールしておく

---

## VirtualBoxのインストール

### Windows

* VirtualBoxのダウンロードページへアクセスする
  * https://www.virtualbox.org/wiki/Downloads
* Windows hostsのリンクからインストーラをダウンロードして実行する

### Mac

* Homebrewからインストールする

  ```bash
  brew cask install VirtualBox
  ```

* インストール済みの場合はアップデートする

  ```bash
  brew cask reinstall VirtualBox
  ```

* バージョンを表示して確認する

  ```bash
  VirtualBox --version
  ```

---

## Vagrantのインストール

### Windows

* 下記Vagrantのダウンロードページへアクセスする
  * http://www.vagrantup.com/downloads.html
* WINDOWSカテゴリから対象bit数のインストーラをダウンロードして実行する

### Mac

* Homebrewからインストールする

  ```bash
  brew cask install vagrant
  # バージョンの確認
  vagrant --version
  ```

* インストール済みの場合はアップデートする

  ```bash
  brew cask reinstall vagrant
  ```

---

## Box作成の準備

### コマンドプロンプト、ターミナルから作業する

* VagrantのBox用ディレクトリを作成する

  ```bash
  mkdir vagrant
  cd vagrant
  ```

* Boxごとにディレクトリ分けしたほうが管理しやすいため各Box用のディレクトリを作成する

  ```bash
  mkdir dev-centos7
  cd dev-centos7
  ```

## Boxの追加

* Box公開ページへアクセスする
  * http://www.vagrantbox.es/

* 対象となるBoxのURLをコピーしておく

* Boxを追加する

  ```bash
  # vagrant box add [Box名] [コピーしたBoxのURL]
  vagrant box add dev-centos7 https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.2/vagrant-centos-7.2.box
  ```

* Boxを初期化する
* 初期化するとBox名のディレクトリに **Vagrantfile** が作成される

  ```bash
  # vagrant init [Box名]
  vagrant init dev-centos7
  ```

---

## Vagrantfileの編集

* 作成された **Vagrantfile** の下記の行をコメントインして保存する
* このIPアドレスを指定してSSH接続する
* ブラウザからこのアドレスを指定するとWebサーバへのアクセスができる

  ```ruby
  config.vm.network "private_network", ip: "192.168.33.10"
  ```

## フォルダを共有する設定（任意）

* ホスト端末の **share** フォルダとゲスト端末の **/tmp/share** フォルダを共有する設定
* **create: true** はフォルダがなかった場合作成するオプション

  ```bash
  config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
  ```

---

## Boxの起動

* **Vagrantfile** と同一のディレクトリでコマンドを実行する

  ```bash
  vagrant up
  ```

## ターミナルからBoxにアクセスする

* Boxが起動している状態でTeraTermなどからアクセスする

  ```bash
  TCP/IP ホスト：192.168.33.10
  TCPポート：22
  サービス：SSH SSHバージョン：SSH2
  ```

  ```bash
  ログインユーザ：vagrant
  パスワード：vagrant
  ※rootもパスワードは同じ
  ```

* **Vagrantfile** の編集を行わなくても次の設定でアクセス可能

  ```bash
  TCP/IP ホスト：127.0.0.1
  TCPポート：2222
  サービス：SSH SSHバージョン：SSH2
  ```

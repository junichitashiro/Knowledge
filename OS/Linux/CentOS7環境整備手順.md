# インストール後の環境整備手順

* 作業アカウント：vagrant
* 各種パッケージのバージョンは動作確認したものを記載

---

## yum のリポジトリサーバーのドメインを設定する

### 国内サーバーを指定して高速化を図る

```bash
sudo sed -i '/#include_only=/a include_only=.JP' /etc/yum/pluginconf.d/fastestmirror.conf
```

### 手動で書き換える場合

```bash
sudo vi /etc/yum/pluginconf.d/fastestmirror.conf
# --------------------------------------------------
# 以下の指定をする
include_only=.JP
# --------------------------------------------------
sudo yum clean all
```

### キャッシュを削除する

```bash
sudo yum clean all
```

---

## Gitのセットアップ準備

* デフォルトでインストールされているGitは古い場合が多いのでアップデートする

### 古いバージョンを削除する

```bash
sudo yum -y remove git
```

### 開発用パッケージをインストールする

```bash
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf
```

### 新しいGitを取得する

```bash
# 2.26.0のバージョンを指定している
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.26.0.tar.gz
```

### 取得したファイルを展開する

```bash
sudo tar vfx git-2.26.0.tar.gz
```

### インストールの事前チェックをしてコンパイルする

```bash
cd git-2.26.0
sudo make configure
sudo ./configure --prefix=/usr
sudo make all
```

### インストールを実行する

```bash
sudo make install
```

---

## GitHubからセットアップシェルを取得する

### Git作業用のディレクトリを作成しリポジトリを複製する

```bash
mkdir ~/git
cd ~/git
git clone https://github.com/junichitashiro/ShellScript.git
```

### セットアップシェルを実行する

```bash
cd ShellScript
./centos7_initial_setup.sh
```

### PGPキーを最新化する

```bash
curl -L https://yum.puppetlabs.com/RPM-GPG-KEY-puppet -o /tmp/RPM-GPG-KEY-puppet
gpg --with-fingerprint "/tmp/RPM-GPG-KEY-puppet"
sudo cp /tmp/RPM-GPG-KEY-puppet /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1
```

### システムを最新化する

```bash
sudo yum -y update
```

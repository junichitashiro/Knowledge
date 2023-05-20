# centos7_initial_setup.shの実行内容

## ホスト名を変更する

### /etc/hostnameを上書きする

```bash
sudo sh -c "echo 'dev-centos7' > /etc/hostname"
```

### 手動で/etc/hostnameを編集する場合

```bash
sudo vi /etc/hostname
# --------------------------------------------------
# 設定したいホスト名を追記して上書き保存する
dev-centos7
# --------------------------------------------------

# ホスト名を表示して確認する
hostname
```

---

## システムの表記を日本語にする

### 日本語用のutf8設定をlocaleに追加する

コマンドは **localectl -f "文字コード" -i "設定元となるlocaleファイル"**

```bash
sudo localectl set-locale LANG=ja_JP.UTF-8
```

### 現在のログインシェルに設定を反映する

```bash
source /etc/locale.conf
```

### 言語設定を表示して確認する

```bash
echo $LANG
```

---

## タイムゾーンを設定する

### タイムゾーンを日本に設定する

```bash
sudo timedatectl set-timezone Asia/Tokyo
```

### 現在時刻を表示して確認する

```bash
date
```

### タイムゾーン設定を表示して確認する

```bash
timedatectl
```

---

## ファイアウォールの設定を変更する

### ファイアウォールをONにする

* 初期設定がON/OFFのどちらでも対応できるよう **restart** を指定している

```bash
sudo systemctl restart firewalld.service
sudo systemctl enable firewalld.service
```

### httpとssh通信を許可する

```bash
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --reload
```

---

## 時刻同期を設定する

### ntpのインストール

```bash
sudo yum -y install ntp
```

### デーモンが起動している場合は止める

```bash
sudo systemctl stop ntpd.service
```

### 時刻の取得

* 大幅に時刻がずれていると自動での時刻合わせができないため、事前に手動で日本標準時プロジェクトのサーバから時刻を取得する。

```bash
sudo ntpdate ntp.nict.jp
```

### 設定ファイルを編集して同期するサーバを設定する

```bash
sudo vi /etc/ntp.conf
```

### 編集前の内容

```bash
# --------------------------------------------------
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
server 0.centos.pool.ntp.org iburst
server 1.centos.pool.ntp.org iburst
server 2.centos.pool.ntp.org iburst
server 3.centos.pool.ntp.org iburst
# --------------------------------------------------
```

### 以下の内容に書き換える

```bash
# --------------------------------------------------
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
server -4 ntp.nict.jp iburst
server -4 ntp.nict.jp iburst
server -4 ntp.nict.jp iburst
# --------------------------------------------------
```

### デーモンを起動して自動同期の設定をする

```bash
systemctl start ntpd.service
systemctl enable ntpd.service
```

---

## パッケージの追加インストール

### マニュアルのインストール

```bash
sudo yum -y install man
sudo yum -y install man-pages-ja
```

### Apacheのインストール

```bash
sudo yum -y install httpd
```

### Apacheの起動と自動起動の設定

```bash
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
```

---

## 設定を反映する

### shellにログインしなおす

```bash
exec $SHELL -l
```

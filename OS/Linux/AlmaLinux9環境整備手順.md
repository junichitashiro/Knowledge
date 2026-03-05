# インストール後の環境整備手順

* 作業アカウント：vagrant
* 各種パッケージのバージョンは動作確認したものを記載

---

## 既存システムの最新化

```bash
sudo dnf update -y
```

## 基本パッケージのインストール

```bash
sudo dnf -y install glibc-langpack-ja firewalld httpd
```

* 本作業で必要となるパッケージがない前提でインストールする

---

## ホスト名の設定

### 任意のホスト名（dev-alma9）に変更する

```bash
sudo hostnamectl set-hostname dev-alma9
```

### 確認

```bash
hostnamectl
```

>  Static hostname: dev-alma9

---

## システム言語の設定

### システム言語を日本語に設定する

```bash
sudo localectl set-locale LANG=ja_JP.UTF-8
```

### 確認

```bash
localectl status
```

* 反映は 再ログインか再起動後

> System Locale: LANG=ja_JP.UTF-8

---

## タイムゾーンの設定

### タイムゾーンを日本に設定する

```bash
sudo timedatectl set-timezone Asia/Tokyo
```

### タイムゾーン設定を表示して確認する

```bash
timedatectl
```

>  Time zone: Asia/Tokyo (JST, +0900)

---

## ファイアウォールの設定

### ファイアウォールを有効化する

```bash
sudo systemctl enable --now firewalld
```

### httpとssh通信を許可する

```bash
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=ssh  --permanent
sudo firewall-cmd --reload
```

* ログインしている時点で ssh は有効なのでエラーになる想定

---

## Webサーバの設定

### Apacheの起動と自動起動を設定する

```bash
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
```

### 確認

```bash
systemctl status httpd
```

> ● httpd.service - The Apache HTTP Server  
> Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)  
> Active: active (running) since Wed 2026-03-04 22:48:14 JST; 17min ago  

* ブラウザから **192.168.33.10** にアクセスすると "Web Server Test Page" が表示されることでも確認できる

---

## 設定を反映する

### shellにログインしなおす

```bash
exec $SHELL -l
```

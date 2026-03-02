# MariaDBセットアップ手順

* 作業アカウント：vagrant
* 初期設定で文字コードを **utf8mb4** に設定する

---

## MariaDBをインストールする

### dnf からインストールする

```bash
sudo dnf -y install mariadb mariadb-server
```

### サービスを起動する

```bash
sudo systemctl start mariadb.service
```

### 自動起動の設定をする

```bash
sudo systemctl enable mariadb.service
```

---

## 文字コードを設定する

### /etc/my.cnf ファイルを編集する

```bash
sudo vi /etc/my.cnf
```

### 以下のカテゴリと内容を記入する

```bash
[mysqld]
character-set-server=utf8mb4

[client]
default-character-set=utf8mb4
```

### サービスを再起動する

```bash
sudo systemctl restart mariadb.service
```

---

## データベースの初期設定

### MariaDBの初期設定を開始する

```bash
sudo mysql_secure_installation
```

### 1. 現在のrootパスワードを入力する

```text
Enter current password for root (enter for none):
```
* 未設定なのでそのまま **[Enter]**

### 2. unix_socket認証にするか選択する

```text
Switch to unix_socket authentication [Y/n]
```

* rootのログインをOSのrootユーザー限定にするかどうか
* 安全性を高めるために **[Y]** を選択

### 3. rootのパスワードを設定する

```text
Change the root password? [Y/n]
```

* socket認証を選択しパスワード管理は不要になったため **[N]** を選択

### 4. 匿名ユーザを削除するか選択する

```text
Remove anonymous users? [Y/n]
```

* 匿名ユーザは初期設定などのために誰でもログインできるユーザ
* 削除推奨のため **[Y]** を選択

### 5. rootのリモートログインを禁止するか選択する

```text
Disallow root login remotely? [Y/n]
```

* ```mysql -u root -h xxx``` を禁止するか
* rootはサーバ内限定で十分なので **[Y]** を選択

### 6. testデータベースを削除するか選択する

```text
Remove test database and access to it? [Y/n]
```

* 不要なので **[Y]** を選択

### 7. 権限を管理するテーブルをリロードして設定をすぐに反映するか選択する

```text
Reload privilege tables now? [Y/n]
```

* すぐに反映するように **[Y]** を選択

---

## 設定を確認する

### DBにログインして文字コードを確認する

```bash
sudo mysql
```

* または ```sudo mysql```

### 文字コード設定を確認する

* **character_set_database** が **utf8mb4** になっていること

```sql
show variables like 'cha%';

+--------------------------+------------------------------+
| Variable_name            | Value                        |
+--------------------------+------------------------------+
| character_set_client     | utf8mb4                      |
| character_set_connection | utf8mb4                      |
| character_set_database   | utf8mb4                      |
| character_set_filesystem | binary                       |
| character_set_results    | utf8mb4                      |
| character_set_server     | utf8mb4                      |
| character_set_system     | utf8                         |
| character_sets_dir       | /usr/share/mariadb/charsets/ |
+--------------------------+------------------------------+
```

---

## アンインストール手順

### 1. MariaDBサービスを停止

```bash
sudo systemctl stop mariadb
```
### 2. パッケージをアンインストール

```bash
sudo dnf remove mariadb-server mariadb
```

### データと設定ファイルの削除

```bash
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/my.cnf*
```

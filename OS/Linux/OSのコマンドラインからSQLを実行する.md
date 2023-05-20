# OSのコマンドラインからSQLを実行する

* OS：CentOS7
* 作業アカウント：root
* DB：MySQL
* DBアカウント：root
* DBパスワード：root1

---

## SQLの基本構文

### mysql [データベース名] -u [ユーザ名] -p[パスワード] -e "SQL"

#### SQL実行のサンプル

```sql
mysql workbook -u root -proot1 -e "select * from books"
```
---

## 複数SQLを実行する場合の構文

### mysql [データベース名] -u [ユーザ名] -p[パスワード] -e "SQL1;SQL2;SQL3"

**;** で区切ることで複数のSQLを実行可能

#### 複数実行のサンプル

```sql
mysql workbook -u root -proot1 -e "select * from books;select * from usr"
```

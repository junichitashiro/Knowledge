# OSのコマンドラインからSQLを実行する

* OS：CentOS7
* 作業アカウント：root
* DB：MySQL
* DBアカウント：root
* DBパスワード：root1

---

>## mysql [データベース名] -u [ユーザ名] -p[パスワード] -e "SQL"

* SQL実行のサンプル

```sql
mysql workbook -u root -proot1 -e "select * from books"
```

## **;** で区切ることにより複数のSQLが実行可能

>## mysql [データベース名] -u [ユーザ名] -p[パスワード] -e "SQL1;SQL2;SQL3"

* 複数実行のサンプル

```sql
mysql workbook -u root -proot1 -e "select * from books;select * from usr"
```

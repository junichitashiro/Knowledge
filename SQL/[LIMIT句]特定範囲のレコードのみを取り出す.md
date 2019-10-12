# [LIMIT句]特定範囲のレコードのみを取り出す  
> SELECT 列名 FROM テーブル名 ORDER BY ソート条件 LIMIT [開始行,] 行数;
* 開始行は 0
* ORDER BY句と併用する（順番が不定では「先頭5行」の指定にあまり意味がないため）

***
* 社員テーブル（employee）から最近更新された情報の上位5件を表示する
```sql
SELECT * FROM employee ORDER BY last_update DESC LIMIT 5;
```

* 開始行（0）の指定は省略できるので以下でも結果は同じ
```sql
SELECT * FROM employee ORDER BY last_update DESC LIMIT 0,5;
```

* 書籍情報テーブル（BOOKS）から刊行日が新しいものを3件目から5件分だけ取り出す
```sql
SELECT * FROM books ORDER BY publish_date DESC LIMIT 2,5;
```

* アンケート回答テーブル（quest）から回答日時が新しいものを先頭から10件取り出す
```sql
SELECT * FROM quest ORDER BY answered DESC LIMIT 0,10;
```

* 貸し出し記録テーブル（rental）から未返却のもので貸出日が古いものを先頭から5件取り出す
```sql
SELECT * FROM rental WHERE returned=0 ORDER BY rental_date ASC LIMIT 5;
```

* アクセス記録テーブル（access_log）からアクセス日時の新しい順に10件のログデータを取得する
```sql
SELECT * FROM access_log ORDER BY access_date DESC LIMIT 10;
```

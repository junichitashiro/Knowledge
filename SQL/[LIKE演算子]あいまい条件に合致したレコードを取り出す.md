# [LIKE演算子]あいまい条件に合致したレコードを取り出す  
>## SELECT 列名 FROM テーブル名 WHERE 列名 [NOT] LIKE 文字列パターン;  

## 部分一致  
* 書籍情報テーブル（books）から書名に「SQL」という文字列が含まれている情報だけを取り出す
```sql
SELECT * FROM books WHERE title LIKE '%sql%';
```

* 書籍情報テーブル（books）から名前が「社」で終わる出版社の情報を取り出す
```sql
SELECT * FROM books WHERE publish LIKE '%社';
```

## 部分不一致  
* アンケート回答テーブル（quest）から名前が「子」で終わらない人の情報だけを取り出す
```sql
SELECT * FROM quest WHERE name NOT LIKE '%子';
```

## 前方一致  
* 著作情報テーブル（author）から名前が「山田」で始まる著者の情報を取り出す
```sql
SELECT * FROM author WHERE name LIKE '山田%';
```

* 書籍情報テーブル（books）から書名が「SQL○○」（○は一文字）である書籍の情報を取り出す
```sql
SELECT * FROM books WHERE title LIKE 'SQL__';
```

* 社員テーブル（employee）から名前が氏（カナ）が「ア」で始まる社員の情報だけを取り出す
```sql
SELECT * FROM employee WHERE l_name_kana LIKE 'ア%';
```

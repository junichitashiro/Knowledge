# [WHERE句]条件に合致したレコードを取り出す  
>## SELECT 列名 FROM テーブル名 WHERE 条件式;  

* アンケート回答テーブル（quest）から「女」が回答した結果だけを取り出す
```sql
SELECT * FROM quest WHERE sex='女';
```

* アンケート回答テーブル（quest）から20歳以上の回答だけを取り出す
```sql
SELECT * FROM quest WHERE age >= 20;
```

* 書籍情報テーブル（books）から出版社が「日経BP」「翔泳社」である情報だけを取り出す
```sql
SELECT * FROM books WHERE publish IN ('日経BP' , '翔泳社');
```

* ユーザテーブル(usr)から「東京都」に住んでいない人の情報だけを取り出す
```sql
SELECT * FROM usr WHERE prefecture <> '東京都';
```

* アンケート回答テーブル（quest）から30歳以上40歳未満の回答だけを取り出す
```sql
SELECT * FROM quest WHERE age BETWEEN 30 AND 39;
```

* アンケート回答テーブル（quest）から回答日時が「2013-01-01」以降の情報だけを取り出す
```sql
SELECT * FROM quest WHERE answered >= '2013-01-01';
```

* 貸し出し記録テーブル（rental）から貸し出し中の情報だけを取り出す
```sql
SELECT * FROM rental WHERE returned=0;
```

* アンケート回答テーブル（quest）から感想欄が未定義（NULL値）でない情報だけを取り出す
```sql
SELECT * FROM quest WHERE answer2 IS NOT NULL;
```

* 書籍情報テーブル（books）から価格が5000円未満の書籍情報だけを取り出す
```sql
SELECT * FROM books WHERE price < 5000;
```


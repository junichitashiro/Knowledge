# [AS]列に別名を指定する  

> SELECT 列名 AS 別名 FROM テーブル名;

* 列の値はSELECT時に演算可能

***

* 商品テーブル（product）からp_name、price列を価格が安い順に取り出し、それぞれに「商品名」、「価格」の別名をつける

```sql
SELECT p_name AS 商品名,price AS 価格 FROM product ORDER BY price ASC;
```

* アンケート回答テーブル（quest）から都道府県ごとの回答者の平均年齢を出し、それぞれに「都道府県名」、「平均年齢」の別名をつける

```sql
SELECT prefecture AS 都道府県名,AVG(age) AS 平均年齢 FROM quest GROUP BY prefecture;
```

* ユーザテーブル（usr）から都道府県別のユーザ数を取り出し、それぞれに「都道府県名」、「ユーザ数」の別名をつける

```sql
SELECT prefecture AS 都道府県名,COUNT(*) AS ユーザ数 FROM usr GROUP BY prefecture;
```

* 書籍情報テーブル（books）から出版社ごとの書籍価格の平均値を出し、それぞれに「出版社」、「価格平均」の別名をつける

```sql
SELECT publish AS 出版社,AVG(price) AS 価格平均 FROM books GROUP BY publish;
```

* アンケート回答テーブル（quest）から都道府県、性別ごとの評価平均を出す

```sql
SELECT prefecture AS 都道府県,sex AS 性別,AVG(answer1) AS 評価平均 FROM quest GROUP BY prefecture,sex;
```

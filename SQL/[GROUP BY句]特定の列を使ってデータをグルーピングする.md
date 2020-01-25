# [GROUP BY句]特定の列を使ってデータをグルーピングする  

> SELECT グループ化列,集計列 FROM テーブル名 GROUP BY グループ化キー;

* 取得列に指定できるのはグループ化キーと集計関数の集計対象列のみ

***

* 書籍情報テーブル（books）を出版社ごとにグルーピングし、各社ごとの価格の平均値を出す

```sql
SELECT publish,AVG(price) FROM books GROUP BY publish;
```

* アンケート回答テーブル（quest）から性別ごとに年齢の最大値と最小値を出す

```sql
SELECT sex,MAX(age),MIN(age) FROM quest GROUP BY sex;
```

* アンケート回答テーブル（quest）から都道府県、性別ごとに評価の平均を出す

```sql
SELECT prefecture,sex,AVG(answer1) FROM quest GROUP BY prefecture,sex;
```

* 月間売り上げテーブル（sales）で、店舗別の売上合計値を出す

```sql
SELECT s_id,SUM(s_value) FROM sales GROUP BY s_id;
```

* 書籍情報テーブル（books）で、出版社ごとの価格の最大値を出す

```sql
SELECT publish,MAX(price) FROM books GROUP BY publish;
```

* アクセス記録テーブル（access_log）からメニューコード別のアクセス数を取得する

```sql
SELECT page_id,COUNT(*) FROM access_log GROUP BY page_id;
```

# [HAVING句]グルーピング結果に対して絞り込み条件を設定する  

> SELECT グループ列,集計列 FROM テーブル名 GROUP BY グループ化キー HAVING 条件式;

***

* アンケート回答テーブル（quest）から都道府県ごとの評価で平均が2未満のデータだけを取り出す

```sql
SELECT prefecture,AVG(answer1) AS 評価平均 FROM quest GROUP BY prefecture HAVING AVG(answer1) < 2;
```

* アンケート回答テーブル（quest）から都道府県ごとに年齢の平均値を求め、35歳以上50歳未満のデータのみ取り出す

```sql
SELECT prefecture,AVG(age) FROM quest GROUP BY prefecture HAVING AVG(age) BETWEEN 35 AND 49;
```

* アンケート回答テーブル（quest）から都道府県ごとに男性回答者のみの年齢の最高値を求め、60歳より大きいデータのみ取り出す

```sql
SELECT prefecture,MAX(age) FROM quest WHERE sex = '男' GROUP BY prefecture HAVING MAX(age) > 60;
```

* 著者-書籍情報テーブル（author_books）で著者ごとの書籍数を求め、登録数が3冊以上の情報だけを取り出す

```sql
SELECT author_id,COUNT(isbn) FROM author_books GROUP BY author_id HAVING COUNT(isbn) >= 3;
```

* 書籍情報テーブル（books）から出版社、分類IDごとに登録数を求め、登録数が3冊未満の情報だけを取り出す

```sql
SELECT publish,category_id,COUNT(*) FROM books GROUP BY publish,category_id HAVING COUNT(*) < 3;
```

* 社員テーブル（employee）から所属部署ごとの女性の人数を求め、3人以上の部署だけを取り出す

```sql
SELECT depart_id,COUNT(*) FROM employee WHERE sex = 2 GROUP BY depart_id HAVING COUNT(*) >= 3;
```

* アクセス記録テーブル(access_log)からアクセス日付が2013/01/01以降のものについてリンク元URLごとにアクセス数を算出し、アクセス数が5件未満のものをアクセス数降順で取り出す

```sql
SELECT referer,COUNT(*) FROM access_log WHERE access_date >= '2013-01-01' GROUP BY referer HAVING COUNT(*) < 5 ORDER BY COUNT(*) DESC;
```

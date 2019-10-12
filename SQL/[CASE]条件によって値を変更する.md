# [CASE]条件によって値を変更する  
## CASE演算子では最初に合致したWHEN句が実行される  

> CASE  
&nbsp; &nbsp; WHEN 条件式1 THEN 値1  
&nbsp; &nbsp; [WHEN 条件式2 THEN 値2...]  
&nbsp; &nbsp; [ELSE 値X]  
END

> CASE  
&nbsp; &nbsp; （集計）列  
&nbsp; &nbsp; WHEN 比較値1 THEN 値1  
&nbsp; &nbsp; [WHEN 比較値2 THEN 値2...]  
&nbsp; &nbsp; [ELSE 値X]  
END

***
* アクセス記録テーブル（access_log）からリンク元ごとのアクセス数を求めアクセス数に応じたランク付けをする
```sql
SELECT referer,COUNT(*) AS カウント数,
CASE
    WHEN COUNT(*) >= 50 THEN 'A'
    WHEN COUNT(*) >= 10 THEN 'B'
    ELSE 'C'
END AS ランク
FROM access_log GROUP BY referer;
```

* アンケート回答テーブル（quest）から回答日時が新しい順にname、answer1、answer2列を取得する
* answer1の値3～1に対応してそれぞれ「ためになった」「普通」「役に立たない」という文字列に置き換える
* 別名はそれぞれ「氏名」「評価」「感想」とする
```sql
SELECT name AS 氏名,
CASE answer1
    WHEN 3 THEN 'ためになった'
    WHEN 2 THEN '普通'
    WHEN 1 THEN '役に立たない'
    ELSE ''
END AS 評価,answer2 AS 感想
FROM quest ORDER BY answered DESC;
```

* 貸し出し記録テーブル（rental）をisbnコードでグループ化しそれぞれの「貸出数」列を出力する
* カウント数に応じた「評価」列を出力する
```sql
SELECT isbn,COUNT(*) AS 貸出数,
CASE
    WHEN COUNT(*) >= 10 THEN '好評'
    WHEN COUNT(*) >= 5 THEN '普通'
    ELSE '不評'
END AS 評価
FROM rental GROUP BY isbn;
```

* アクセス記録テーブル（access_log）からリンク元ごとのアクセス数を求めアクセス数に応じたランク付けをする
* データはアクセス数が3件以上のものを多い順に並べる
```sql
SELECT referer,COUNT(*) AS カウント数,
CASE
    WHEN COUNT(*) >= 50 THEN 'A'
    WHEN COUNT(*) >= 10 THEN 'B'
    ELSE 'C'
END AS ランク
FROM access_log GROUP BY referer HAVING COUNT(*) >= 3 ORDER BY COUNT(*) DESC;
```

* 著者-書籍情報テーブル（author_books）から著者ごとの書籍数を求め書籍数に応じて「評価」列を出力する
* 出力するのは「著者ID」「カウント数」「評価」とする
```sql
SELECT author_id AS 著者ID,COUNT(isbn) AS カウント数,
CASE
    WHEN COUNT(*) >= 4 THEN '多い'
    WHEN COUNT(*) >= 2 THEN '普通'
    ELSE '少ない'
END AS 評価
FROM author_books GROUP BY author_id;
```

* 社員テーブル（employee）から社員名（姓 + 名）、役職クラス（部長・課長は管理職、主任・担当は総合職、アシスタントは一般職）を出力する
```sql
SELECT CONCAT(l_name,f_name),
CASE
    WHEN class IN ('部長','課長') THEN '管理職'
    WHEN class IN ('主任','担当') THEN '総合職'
    ELSE '一般職'
END AS 役職クラス
FROM employee;
```

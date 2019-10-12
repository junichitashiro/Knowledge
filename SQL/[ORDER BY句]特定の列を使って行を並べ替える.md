# [ORDER BY句]特定の列を使って行を並べ替える  
> SELECT 列名 FROM テーブル名 ORDER BY ソート条件;
* 並び順：ASC（昇順）またはDESC（降順）、省略した場合ASCとみなされる

***
* アンケート回答テーブル（quest）から感想欄が空でないデータを抽出し、評価が低い順に並べ替える
```sql
SELECT * FROM quest WHERE answer2 IS NOT NULL AND answer2 <> '' ORDER BY answer1 ASC;
```

* 書籍情報テーブル（books）から価格が2500～3500円の範囲の書籍を価格が安い順に取り出す
```sql
SELECT * FROM books WHERE price BETWEEN 2500 AND 3500 ORDER BY PRICE ASC;
```

* ユーザテーブル（usr）から東京都、千葉県、神奈川県に住んでいる人のリストを姓（カナ）、名（カナ）について昇順で表示する
```sql
SELECT * FROM usr WHERE prefecture IN ('東京都' , '千葉県' , '神奈川県') ORDER BY l_name_kana ASC,f_name_kana ASC;
```

* 貸し出し記録テーブル（rental）から未返却で、貸出日が2012年12月1日より前の貸し出し情報を貸出日が新しい順に抽出する
```sql
SELECT * FROM rental WHERE returned=0 AND rental_date < '2012-12-01' ORDER BY rental_date DESC;
```

* アクセス記録テーブル（access_log）から2013年1月分のアクセスログをreferer、ip_address列について降順で取り出す
```sql
SELECT * FROM access_log WHERE access_date BETWEEN '2013-01-01' AND '2013-01-31' ORDER BY referer DESC,ip_address DESC;
```

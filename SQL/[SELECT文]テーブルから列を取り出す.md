# [SELECT文]テーブルから列を取り出す  

>SELECT 列名 FROM テーブル名;

## テーブルからすべての列を取り出す  

* アンケート回答テーブル（quest）からすべてのデータを取り出す

```sql
SELECT * FROM quest;
```

## テーブルから特定の列を取り出す  

* アンケート回答テーブル（quest）から名前、性別、年齢の列だけを取り出す

```sql
SELECT name,sex,age FROM quest;
```

## 重複行を取り除いて出力する  

* 書籍情報テーブル（books）から重複なしで出版社列を取り出す

```sql
SELECT DISTINCT publish FROM books;
```

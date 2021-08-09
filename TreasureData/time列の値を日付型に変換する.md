# timeカラムをDate型に変換する

## テーブル作成時に設定されるtimeカラムをUnixtime型からDate型に変換して出力する

* TD_TIME_FORMAT関数を使用する
* 変換したtimeカラムを別カラム名（datetime）で出力する

  ```sql
  SELECT
    TD_TIME_FORMAT(time, 'yyyy-MM-dd HH:mm:ss', 'JST') as datetime,
    *
  FROM
    table_name
  ;
  ```

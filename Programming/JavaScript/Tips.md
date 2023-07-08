# Tips

---

## falsyな値

* 空文字

  ```javascript
  !''
  ```

  実行結果

  > true

* 数値の0

  ```javascript
  !0
  ```
  ```javascript
  !'0'
  ```

  実行結果

  > true

  > false

* NaN

  ```javascript
  !NaN
  ```
  ```javascript
  NaN == NaN
  ```

  実行結果

  > true

  > false

* null

  ```javascript
  !null
  ```

  実行結果

  > true

* undefined

  ```javascript
  !undefined
  ```

  実行結果

  > true

# Homebrewのインストールと最新化

***

* 最新のコマンドを下記から確認する  
[<https://brew.sh/index_ja.html>]

* インストールの実行

  ```bash
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

* Homebrewの最新化

  ```bash
  brew update
  ```

* HomebrewとHomebrewでインストールしたパッケージの最新化

  ```bash
  brew upgrade
  ```

* 実行結果を表示して確認

  ```bash
  brew doctor
  # Your system is ready to brew.
  ```

* バージョン表示して確認

  ```bash
  brew --version
  # バージョンが表示される
  ```

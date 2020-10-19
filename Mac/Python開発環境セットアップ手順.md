# Python開発環境のセットアップ

インストール手順

1. Xcode（Mac用開発ツール）
2. Homebrew（アプリ管理ツール）
3. pyenv（Pythonのバージョン切替）
4. Python 3.X（本体）

上記をインストールした後、 __venv__ による開発用の仮想環境を作成する

***

## Xcodeのインストール

* App Storeで __Xcode__ を検索してインストールする

* XCodeの __Command Line Tools__ をインストールする

  ```bash
  xcode-select --install
  ```

***

## Homebrewのインストール

* [Homebrew最新化手順](https://github.com/junichitashiro/Technical-Notes/blob/master/Mac/Homebrew最新化手順.md)でHomebrewをインストール、もしくは最新化しておく

***

## pyenvのインストール

* Homebrewからpyenvをインストールする

  ```bash
  brew install pyenv
  ```

* pathの設定

  ```bash
  sudo vim ~/.bash_profile
  ```

* 以下の2行を追記する

  ```bash
  # ~/.pyenvではなく /usr/loca/var/pyenv を使用する
  export PYENV_ROOT=/usr/local/var/pyenv

  # 自動補完機能を提供してもらう
  if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
  ```

* 設定を反映させる

  ```bash
  source .bash_profile
  ```

* 確認コマンド

  ```bash
  brew list | grep pyenv
  # -> pyenv が表示される
  ```

  ```bash
  pyenv --version
  # -> pyenv とバージョン番号が表示される
  ```

***

## Pythonのインストール

* pyenvからインストール可能な一覧を表示する

  ```bash
  pyenv install --list
  ```

* pyenvからpythonをインストールする

  ```bash
  pyenv install 3.8.5
  ```

* インストールしたバージョンをシステム全体に適用する

  ```bash
  pyenv global 3.8.5
  pyenv rehash
  ```

* Pythonのバージョン確認コマンド

  ```bash
  python --version
  # -> Python 3.8.5
  ```

* pyenvのバージョン確認コマンド

  ```bash
  pyenv versions
  #   system
  # * 3.8.5 (set by /usr/local/var/pyenv/version)
  ```

***

## 仮想環境の作成

* ホームディレクトリに仮想環境用のフォルダを作成して移動する

  ```bash
  cd ~
  mkdir python_dev;cd $_
  ```

* 仮想環境を作成する

  ```bash
  python -m venv venv385
  ```

* 仮想環境の有効化と無効化

  ```bash
  source venv385/bin/activate  # 有効化
  deactivate  # 無効化
  ```

***

## pygameのインストール

* 仮想環境を無効化する

  ```bash
  deactivate
  ```

* HomebrewからSDL関連ライブラリをインストールする  
venvで作成した開発環境でpygameをインストールするときに必要になる

  ```bash
  brew install sdl sdl_image sdl_mixer sdl_ttf portmidi
  ```

* 仮想環境を有効化する

  ```bash
  source venv385/bin/activate
  ```

* pipを最新化する

  ```bash
  python -m pip install --upgrade pip
  ```

* pipからpygameをインストールする

  ```bash
  pip install pygame
  ```

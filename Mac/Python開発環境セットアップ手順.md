# Pythonのセットアップ

* Google Colaboratoryが使えない場合の備忘録
* 事前にHomebrewをインストールしておく

***

## python3とpyenvのインストール

* python3のインストール

  ```bash
  brew install python3
  ```

* バージョンを表示して確認

  ```bash
  python3 --version
  ```

* pyenvをインストールする

  ```bash
  brew install pyenv
  ```

* pathの設定

  ```bash
  sudo vim .bash_profile
  ```

* 以下を設定する

  ```bash
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  ```

* 設定の反映

  ```bash
  source .bash_profile
  ```

***

## pyenvによるpythonのインストール

* pyenvでインストール可能な一覧を表示する

  ```bash
  pyenv install --list
  ```

* pyenvでpythonをインストールする

  ```bash
  pyenv install 3.X.X
  ```

* インストールしたバージョンをシステム全体に適用する

  ```bash
  pyenv global 3.X.X
  pyenv rehash
  python --version
  ```

***

## Djangoによる開発環境の作成

* ホームディレクトリに仮想環境を作成する

  ```bash
  mkdir my_django;cd $_
  python3 -m venv myvenv
  ```

* 仮想環境の有効化と無効化

  ```bash
  source myvenv/bin/activate  # 有効化
  deactivate  # 無効化
  ```

* Djangoのインストール

  ```bash
  pip install --upgrade pip
  pip install django==2.1.2
  pip freeze  # 確認
  ```

* プロジェクトを作成する（ここではtestProjectを作成している）

  ```bash
  django-admin startproject testProject
  ```

* サーバの起動

  ```bash
  python manage.py runserver
  # http://127.0.0.1:8000/ が起動する
  ```

***

## Pythonの統合開発環境を導入する

* pycharmのインストール

  ```bash
  brew cask install pycharm-ce
  ```

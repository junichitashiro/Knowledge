# macOSでGitを最新化する

* masOSセットアップ後のgit最新化手順
* 事前にHomebrewをインストールしておく

## 設定ファイルを編集する

### .bash_profileの設定

```bash
vi ~/.bash_profile
```

### 以下の設定内容を記述する

```bash
# 反映の自動化
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# ターミナルの表示項目を変更
export PS1="\W \$ "
```

### .bash_rcの設定

```bash
vi ~/.bashrc
```

### 以下の設定内容を記述する

```bash
# ターミナルの表示色設定
# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
    PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'
```

### 設定を反映させる

```bash
source ~/.bash_profile
```

---

## Gitのインストール

### 現在のバージョンを確認する

```bash
git --version
```

### brewからインストールする

```bash
brew install git
```

### pathを表示して確認

```bash
which git
```

### ユーザ設定

```bash
git config --global user.name "GitHubのアカウント名"
git config --global user.email "GitHubで設定したメールアドレス"
git config --list
```

### 鍵を生成する

```bash
ssh-keygen -t rsa -b 4096 -C "GitHubで設定したメールアドレス"
```

### 鍵の配置場所を指定する

```bash
/Users/[user name]/.ssh/id_rsa_github
```

### パーミッションの変更

```bash
chmod 600 /Users/[user name]/.ssh/id_rsa_github
```

### ssh-agentに秘密鍵を登録する

```bash
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa_github
```

### 登録の確認

```bash
ssh-add -l
# 鍵の情報が表示されること
# ------------------------------------
# 4096 SHA256:"文字列" [設定したメールアドレス] (RSA)
# ------------------------------------
```

### sshのconfigファイル作成

```bash
vim ~/.ssh/config
# ------------------------------------
# Host github
#  HostName github.com
#  User git
#  IdentityFile ~/.ssh/id_rsa_github
# ------------------------------------
```

### 公開鍵をGitHubに登録する

```bash
pbcopy < ~/.ssh/id_rsa_github.pub
```

### 接続を確認する

```bash
ssh github
```

### cloneの実行ができることを確認する

適宜テストファイルを追加してpush,pullも確認しておく

```bash
git clone git@github.com:[Account]/[Repository].git
```

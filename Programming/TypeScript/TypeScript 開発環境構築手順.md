# TypeScript 開発環境構築手順

### 前提

* Node.js がインストール済みであること

## 1. プロジェクトディレクトリの作成と初期化

* ディレクトリ作成

```bash
mkdir my-ts-project
```

* プロジェクトの初期化

```bash
cd my-ts-project
npm init -y
```
> パッケージ管理用の package.json ファイルが作成される


## 2. TypeScript のローカルインストール（バージョン指定）

### グローバルではなくプロジェクトディレクトリでのみ TypeScript を使う

* 最新バージョン確認

```bash
npm info typescript
```

* インストール

```bash
npm install --save-dev typescript@5.8.3
```

## 3. tsconfig.json の作成

### TypeScript 用の設定ファイルを作成する

* 作成コマンド実行

```bash
npx tsc --init
```

> tsconfig.json が作成される

## 4. ソースコード用ディレクトリとサンプルコードの作成

* windows

```bash
mkdir src
"console.log('Hello, TypeScript');" | Out-File -FilePath .\src\index.ts -Encoding utf8 -NoNewline
```

* Git, WSL2, macOS

```bash
mkdir src
printf "console.log('Hello, TypeScript');\n" > src/index.ts
```

## 5. ビルド（コンパイル）実行

* 実行コマンド
  * tsc コマンドの実体は **\node_modules\.bin\tsc**
  * npx tsc は **.\node_modules\.bin\tsc** と同義

```bash
npx tsc .\src\index.ts
```

## 6. ts-node のインストール

### ファイル実行を簡易化するツールの導入

* 最新バージョン確認

```bash
npm info ts-node
```

* インストール

```bash
npm install --save-dev ts-node@10.9.2
```

* 実行コマンド

```bash
npx ts-node src\index.ts
```
> コンパイルなしで実行結果が表示される

## 7. ts-node-dev のインストール

### ソースコードの変更を検知して自動で再実行するツールの導入

* 最新バージョン確認

```bash
npm info ts-node-dev
```

* インストール

```bash
npm install --save-dev ts-node-dev@2.0.0
```

* 実行コマンド

```bash
npx ts-node-dev --respawn src\index.ts
```
> index.ts の内容を変更して保存するたびに実行される

## 補足. VScodeの設定

### 拡張機能の追加

* ESLint
* Prettier

### setting.json の設定

```json
  "[typescript]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode",
      "editor.formatOnSave": true,
      "editor.tabSize": 2,
      "prettier.semi": true,
      "prettier.singleQuote": true
  },
```

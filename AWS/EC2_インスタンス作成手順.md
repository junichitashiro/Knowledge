# EC2_インスタンス作成手順

* Webサーバー用のインスタンスを作成する
* 事前に [VPC_ネットワーク構築手順](https://github.com/junichitashiro/Technical-Notes/blob/master/AWS/VPC_ネットワーク構築手順.md) によるネットワークが作成されている前提とする
* 作成したインスタンスに __Apache__ をインストールする

***

## １．パブリックサブネットにEC2インスタンスを設置する

### AMIを選択する

サーバーのテンプレートを決める

1. EC2ダッシュボードを開く
2. 左メニューから __インスタンス__ をクリックする
3. __インスタンスの作成__ をクリックする
4. __クイックスタート__ タブの __Amazon Linux 2__ を選択する
5. __t2.micro__ を選択して __次のステップ：インスタンスの詳細の設定__ をクリックする

***

### インスタンスの詳細を設定する

サーバーのスペックを決める

* インスタンスの概要
  * __ファミリー・世代・サイズ__ で表記される
  * EBS：OS、DB向けで永続性と耐久性が高い
  * インスタンスストア：一時ファイルやキャッシュ向け
* インスタンス数：1
* ネットワーク：aws-dev-vpc
* サブネット：aws-deb-public-subnet-1a
* 自動割り当てパブリックIP：有効
* キャパシティーの予約：なし
* ネットワークインターフェイスのプライマリIP：10.0.10.10

設定したら __次のステップ：ストレージの追加__ をクリックする

***

### ストレージの設定をする

データの保存の設定をする（ここではデフォルトのまま）

* サイズ：8
* ボリュームタイプ：汎用 SSD（gp2）
* 終了時に削除：チェック
* 暗号化：暗号化なし

設定したら __次のステップ：タグの追加__ をクリックする

***

#### タグの追加をクリックして以下の設定をする

* キー：Name
* 値：aws-dev-web

設定したら __次のステップ：セキュリティグループの設定__ をクリックする

***

#### 新しいセキュリティグループを作成するを選択して以下の設定をする

* セキュリティグループ名：aws-dev-web

設定したら __確認と作成をクリック__ する

次の確認画面で問題なければ __起動__ をクリックする

***

#### キーペアを作成する

1. __新しいキーペアの作成__ を選択する
2. キーペア名（__aws-dev-ssh-key__）を入力する
3. __キーペアのダウンロード__ をクリックして保存する
4. __インスタンスの作成__ をクリックする
5. 一覧のステータスチェックで __チェックに合格__ が表示されれば完了

***

#### Apacheをインストールする

作成したインスタンスの __IPv4 パブリック IP__ に __ssh__ でログインして作業する

* yum からインストールを実行する

  ```bash
  sudo yum update -y
  ```

* サービスを開始する

  ```bash
  sudo systemctl start httpd.sercivice
  ```

* サービスの状態を表示して確認する

  ```bash
  sudo systemctl status httpd.service
  ```

  下記が表示される

  ```bash
    ・・ httpd.service - The Apache HTTP Server
      Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
      Active: active (running) since Tue 2020-06-30 06:20:20 UTC; 20s ago
        Docs: man:httpd.service(8)
    Main PID: 15726 (httpd)
      Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      CGroup: /system.slice/httpd.service
              tq15726 /usr/sbin/httpd -DFOREGROUND
              tq15727 /usr/sbin/httpd -DFOREGROUND
              tq15728 /usr/sbin/httpd -DFOREGROUND
              tq15729 /usr/sbin/httpd -DFOREGROUND
              tq15730 /usr/sbin/httpd -DFOREGROUND
              mq15731 /usr/sbin/httpd -DFOREGROUND

    Jun 30 06:20:20 ip-10-0-10-10.ap-northeast-1.compute.internal systemd[1]: Starting The ...
    Jun 30 06:20:20 ip-10-0-10-10.ap-northeast-1.compute.internal systemd[1]: Started The A...
    Hint: Some lines were ellipsized, use -l to show in full.
  ```

* プロセスを表示して確認する

  ```bash
  ps -aux | grep httpd
  ```

  下記が表示される

  ```bash
  root     15726  0.0  0.9 257432  9552 ?        Ss   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  apache   15727  0.0  0.6 298560  6380 ?        Sl   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  apache   15728  0.0  0.6 298560  6380 ?        Sl   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  apache   15729  0.0  0.6 495240  6392 ?        Sl   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  apache   15730  0.0  0.6 298560  6380 ?        Sl   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  apache   15731  0.0  0.6 298560  6380 ?        Sl   06:20   0:00 /usr/sbin/httpd -DFOREGROUND
  ec2-user 15776  0.0  0.0 119420   988 pts/0    S+   06:21   0:00 grep --color=auto httpd
  ```

* 自動起動の設定をする

  ```bash
  sudo systemctl enable httpd.service
  # Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
  ```

* 自動起動が有効になっているか確認する

  ```bash
  sudo ssystemctl is-enabled httpd.service
  # enabled
  ```

***

#### HTTP通信を許可する

パブリックサブネットへのHTTP通信を許可する

1. EC2ダッシュボードを開く
2. 左メニューから __セキュリティグループ__ をクリックする
3. 対象のセキュリティグループにチェックを入れる
    * __インスタンス画面の説明タブ__ から確認できる
4. __インバウンドルール__ タブの __インバウンドルールを編集__ をクリックする
5. __ルールを追加__ をクリックする
6. 以下の設定をして __ルールを保存__ をクリックする
    * タイプ：HTTP
    * ソース：任意の場所
7. ブラウザからアクセスしてApacheの __Test Page__ が表示されることを確認する

***

#### IPアドレスを固定化する

確保したElastic IPアドレスをパブリックIPアドレスに関連付けて固定化する

1. EC2ダッシュボードを開く
2. 左メニューから __Elastic IP__ をクリックする
3. __Elastic IP アドレスの割り当て__ をクリックする
4. 確認画面で __割り当て__ をクリックする
5. 割り当てられたIPアドレスが表示される
6. 一覧に戻るので割り当てたIPアドレスにチェックを入れる
7. アクションメニューから __Elastic IP アドレスの関連付け__ をクリックする
8. 以下の設定をして __関連付ける__ をクリックする
    * リソースタイプ：インスタンス
    * インスタンス：aws-dev-web
    * プライベートIPアドレス：10.0.10.0（aws-dev-webのプライベートIPアドレスが表示される）
    * 再関連付け：チェックなし

#### ※使用していない時は以下の手順で開放する

1. Elastic IP アドレスの画面を開く
2. アクションメニューから __Elastic IP アドレスの関連付けの解除__ をクリックする
3. 確認画面で __関連付け解除__ をクリックする
4. 続けて __Elastic IP アドレスの開放__ をクリックする
5. 確認画面で __解除__ をクリックする

# RDS_WEBサーバーからの接続手順

## １．WEBサーバーにMySQLをインストールする

1. EC2ダッシュボードから __インスタンス__ をクリックする

2. 対象WEBサーバーの __パブリック IPv4 アドレス__ を控えておく

3. ターミナルからWEBサーバーへ接続する

    ```bash
    # WEBサーバー構築時に作成したキーペアを使用する
    ssh -i ~/Desktop/aws-dev-ssh-key.pem ec2-user@ipアドレス
    ```

4. MySQLをインストールする

    ```bash
    sudo yum -y install mysql
    ```

## ２．MySQLに接続する

1. RDSダッシュボードから __データベース__ をクリックする

2. 対象データベースの __エンドポイント__ を控えておく

3. ターミナルから接続する

    ```bash
    mysql -h エンドポイント -u root -p
    ```

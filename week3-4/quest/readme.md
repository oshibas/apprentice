# Read ME

## パスワードマネージャー

ファイル: password_manager.sh
暗号化されたパスワード管理ツールです。

以下の機能を持っています。
- パスワードの保存: passwords.txtに追記されます。
- パスワードの検索: サービス名から検索し、パスワードを表示します。

## ご利用方法

### 1. GnuPGをインストール/設定
   - PGP（Pretty Good Privacy）: ファイルを暗号化するための無料ソフトウェアです。
   - 下記のコマンドを実行すると、インストールできます。（MAC, Linux環境）
```shell
 sudo apt install gnupg
```
  - PGPの設定: https://wiki.archlinux.jp/index.php/GnuPG
### 2. password_manager.zshをダウンロード
  - GitHubリポジトリの「<>code」プルダウンから、「Download Zip」をクリック。

### 3. password_manager.zshを実行

  - 下記のコマンドを入力してください。
  - ファイルに実行権限を付与し、ファイルを起動します。
```shell
 chmod +x password_manager.sh
 ./password_manager.sh
```
### 4. 動作内容
  1. あなたのGPGキーで設定したメールアドレスを入力してください。
  2. 次の選択肢から入力してください(Add Password/Get Password/Exit)
  3. 終了したい場合は、 exit と入力してください。

### 5. 工夫したポイント
  1. ユーザーのGPGキーを、コマンド入力から受け取ります。
  2. 空文字を入力した場合、エラーメッセージを表示します。
  3. セキュリティを強化。trapコマンドを使って一時ディレクトリを削除することで、予期しないエラーが発生しても、一時ファイルを確実に削除できます。

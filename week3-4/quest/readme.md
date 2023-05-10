# Read ME

## パスワードマネージャー

暗号化されたパスワード管理ツールです。
以下の機能を持っています。

- パスワードの追加:　passwords.txtに追記されます。
- パスワードの検索: 登録したサービス名から検索ができます。


## ご利用方法

### 1. GnuPGをのインストールと設定
   - PGP（Pretty Good Privacy）: ファイルやメールを暗号化してやり取りするためsの無料ソフトウェアです。
   - 下記のコマンドを実行すると、インストールできます。（MAC, Linux環境）
```shell
 sudo apt install gnupg
```
  - PGPの設定: https://wiki.archlinux.jp/index.php/GnuPG
### 2. パスワードマネージャーをダウンロード
  - GitHubリポジトリの「<>code」プルダウンから、「Download Zip」をクリック。

### 3. password_manager.zshを実行

  - 下記のコマンドを入力してください。ファイルに実行権限を付与し、ファイルを起動します。
```shell
 chmod +x password_manager.sh
 ./password_manager.sh
```
### 4. 動作内容
  1. GPGキーで設定したメールアドレスを入力します。

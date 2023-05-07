# ユーザーを作成・権限付与・削除できる
> Root権限を持つユーザーで MySQL へ接続してください。

```sql
mysql -u root -p

mysql -h mysql1203b.xserver.jp -u <パスワード> -p
```

## 1. ユーザーの作成
> MySQL のユーザーを作成してください。名前とパスワードは任意、ホストは localhost を指定してください。

```sql
CREATE USER 'ユーザー名'@'ホスト名' IDENTIFIED BY 'パスワード';

CREATE USER 'test'@'localhost' IDENTIFIED BY '<パスワード>';
```

## 2. ユーザーの表示
> ユーザーを作成できたことを確認するために、ユーザーの一覧を表示してください。

```sql
SELECT user, host FROM mysql.user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
| staff            | localhost |
| test             | localhost |
+------------------+-----------+
6 rows in set (0.00 sec)
```

## 3. ユーザーへの権限付与
> 作成したユーザーに、MySQL 内のすべてのデータベースとテーブルへの root のフルアクセス権を付与してください。
>
> なお、ユーザーへの権限付与を学習するために本問題を用意していますが、現場ですべてのデータベースへの root のフルアクセス権限を付与することはほぼありません。データベースのセキュリティを危険にさらす可能性があるためです。

```sql
ワイルドカード*.*: すべてのデータベースとテーブルに対してフルアクセス権限を付与することを意味する
GRANT ALL PRIVILEGES ON *.* TO 'ユーザー名'@'ホスト名';

GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost';
Query OK, 0 rows affected (0.00 sec)
```

## 4. 権限のリロード
> ユーザーに権限を付与したら、すべての権限をリロードしてください。これにより設定が有効になります。

```sql
FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)
```

## 5. ユーザーの削除
> 作成したユーザーを削除してください。削除後、削除できていることを確認してください。

```sql
DROP USER 'ユーザー名'@'ホスト名';

DROP USER 'test'@'localhost';
Query OK, 0 rows affected (0.00 sec)
```

## 6. ユーザーの再作成
> 再度ユーザーを作成、権限付与、権限のリロードを行ってください。
>
> 今後は root ユーザーは基本的に使用せず、今回作成したユーザーを使用してください。

```sql
CREATE USER '新しいユーザー名'@'新しいホスト名' IDENTIFIED BY '新しいパスワード';
GRANT ALL PRIVILEGES ON *.* TO '新しいユーザー名'@'新しいホスト名';
FLUSH PRIVILEGES;

CREATE USER 'test'@'localhost' IDENTIFIED BY '<パスワード>';
GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost';
FLUSH PRIVILEGES;
```

# データを登録・検索・更新・削除できる
## 1. データの登録
> 作成済みのテーブルに対して、任意のデータを一行分追加してください。

```sql
INSERT INTO テーブル名 (カラム1, カラム2, カラム3, ...)
VALUES (値1, 値2, 値3, ...);

INSERT INTO users (id, name, email)
VALUES (1, 'aoki', 'aoki@gmail.com');
Query OK, 1 row affected (0.01 sec)
```

## 2. データの検索
> データを追加したテーブルに対して、すべてのデータを検索して出力してください。

```sql
SELECT * FROM テーブル名;

SELECT * FROM users;
+------+------+----------------+
| id   | name | email          |
+------+------+----------------+
|    1 | aoki | aoki@gmail.com |
+------+------+----------------+
1 row in set (0.00 sec)
```

## 3. データの更新
> 追加済みのデータのある行の値を別の値に更新してください。

```sql
UPDATE テーブル名
SET カラム名1 = 新しい値1, カラム名2 = 新しい値2, ...
WHERE 条件;

UPDATE users
SET name = 'tanaka', email = 'tanaka@gmail.com'
WHERE id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

## 4. データの削除
> テーブル内の全データを削除してください。

```sql
DELETE FROM テーブル名;

DELETE FROM users;
Query OK, 1 row affected (0.01 sec)
```

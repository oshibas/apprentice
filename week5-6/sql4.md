# テーブルを作成・修正・削除できる
> 作成済みのデータベースを指定して MySQL に接続してください。MySQL に接続後、使用するデータベースを指定しても大丈夫です。

```sql
mysql -u <ユーザー名> -p
mysql -u test -p

USE <データベース名>;
USE test;
```

## 1. テーブルの作成
> 任意のテーブルを作成してください。テーブルのカラムは自由に作成してください。

```sql
CREATE TABLE テーブル名 (
    カラム1 データ型,
    カラム2 データ型,
    ...
);

CREATE TABLE users (
    id INT,
    name VARCHAR(255)
);
Query OK, 0 rows affected (0.02 sec)
```

## 2. テーブルの表示
> テーブルが作成できたことを確認するために、テーブルの一覧を表示してください。

```sql
SHOW TABLES;
+----------------+
| Tables_in_test |
+----------------+
| users          |
+----------------+
1 row in set (0.00 sec)
```

## 3. カラムの追加
> 作成したテーブルに、任意のカラムを一列追加してください。

```sql
ALTER TABLE テーブル名 ADD COLUMN カラム名 データ型;

ALTER TABLE users ADD COLUMN email VARCHAR(255);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 4. カラムの表示
> カラムが追加できたことを確認するために、テーブルのカラムの一覧を表示してください。

```sql
SHOW COLUMNS FROM テーブル名;

SHOW COLUMNS FROM users;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
| email | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
```

## 5. カラムの削除
> 追加したカラムを削除してください。削除後、削除できていることを確認してください。

```sql
ALTER TABLE テーブル名 DROP COLUMN カラム名;

ALTER TABLE users DROP COLUMN email;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 6. テーブルの削除
> 作成したテーブルを削除してください。削除後、削除できていることを確認してください。

```sql
DROP TABLE テーブル名;

DROP TABLE users;
Query OK, 0 rows affected (0.01 sec)
```

## 7. テーブルの再作成
> 再度テーブルを作成しましょう。
>
> 今後、作成したテーブルを指定して作業します。

```sql
CREATE TABLE users (
    ->     id INT,
    ->     name VARCHAR(255),
    ->     email VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.01 sec)
```

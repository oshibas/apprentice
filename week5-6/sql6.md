# データを検索できる
## 1. 環境構築
> MySQL 公式サンプルデータベースの employee data のデータをデータベースに入れます。ドキュメント内の Installation のやり方に従ってください。
>
```sql
- 以下にも手順を記します。
1. 公式サンプルデータベースの中の employee data(test_db) を開く
2. リポジトリをクローンする
3. クローンしたディレクトリに移動する
4. mysql -u root -p < employees.sql を実行してデータを入れる
5. データベース一覧を表示し、employees データベースがあることを確認する
6. employees データベースを指定する
7. テーブルの一覧を確認する
8. 以降、employees データベースを使用します。
```

```sql
git clone https://github.com/datacharmer/test_db.git

cd test_db

mysql -u test -p < employees.sql

```

## 9. 全カラムの取得
> 部署マネージャーの全データを取得してください。dept_manager テーブルの全データを * を指定して取得します。

```sql

```

## 1. カラムの選択
> 部署マネージャーの従業員番号の一覧のみを取得してください。dept_manager テーブルの emp_no カラムの値のみを取得します。

```sql

```

## 1. カラム名の別名
> 部署マネージャーの従業員番号の一覧のみを、取得データの見出し（カラム）に「employee_no」という名前を付けて取得してください。

```sql

```

## 1. 重複行の削除
> 部署マネージャーが所属する部署番号を重複なく取得してください。dept_manager テーブルの dept_no カラムの値を、重複を削除して取得します。

```sql

```

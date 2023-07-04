## 商品テーブル

追加日・更新日は自動取得。

| 列名              | データ型       | 制約                                                           |
| ----------------- | -------------- | -------------------------------------------------------------- |
| id                | INT(11)        | NOT NULL                                                       |
| stock             | INT(11)        | NOT NULL                                                       |
| created_at        | DATETIME       | NOT NULL DEFAULT CURRENT_TIMESTAMP                             |
| updated_at        | DATETIME       | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |
| name              | VARCHAR(255)   |                                                                |
| category          | VARCHAR(255)   |                                                                |
| main_image        | VARCHAR(255)   |                                                                |
| sub_image1        | VARCHAR(255)   |                                                                |
| sub_image2        | VARCHAR(255)   |                                                                |
| sub_image3        | VARCHAR(255)   |                                                                |
| sub_image4        | VARCHAR(255)   |                                                                |
| variety           | VARCHAR(255)   |                                                                |
| price             | DECIMAL(10, 2) |                                                                |
| size              | VARCHAR(50)    |                                                                |
| description       | TEXT           |                                                                |
| cultivation_guide | TEXT           |                                                                |
| tags              | VARCHAR(255)   |                                                                |

主キー: id
インデックス: idx_search (name, tags, variety)

## ユーザーテーブル

ユーザー名は8文字以内。
パスワードは12桁＋英数字＋記号（SHA-256を用いてハッシュ化し、ハッシュ値でDBに保存する）。

追加日・更新日は自動取得。

| 列名       | データ型    | 制約                                                           |
| ---------- | ----------- | -------------------------------------------------------------- |
| id         | INT(11)     | NOT NULL                                                       |
| nickname   | VARCHAR(8)  |                                                                |
| password   | VARCHAR(12) |                                                                |
| created_at | DATETIME    | NOT NULL DEFAULT CURRENT_TIMESTAMP                             |
| updated_at | DATETIME    | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |

主キー: id

## パスワードリセットテーブル

パスワードをリセットする際に、一時的なトークンを発行する。

追加日は自動取得。

| 列名       | データ型     | 制約                               |
| ---------- | ------------ | ---------------------------------- |
| id         | INT(11)      | NOT NULL AUTO_INCREMENT            |
| user_id    | INT(11)      | NOT NULL                           |
| token      | VARCHAR(255) | NOT NULL                           |
| created_at | DATETIME     | NOT NULL DEFAULT CURRENT_TIMESTAMP |

主キー: id
外部キー: user_id REFERENCES user_master(id)

## お気に入りテーブル

追加日は自動取得。

| 列名        | データ型 | 制約                               |
| ----------- | -------- | ---------------------------------- |
| customer_id | INT(11)  | NOT NULL                           |
| product_id  | INT(11)  | NOT NULL                           |
| created_at  | DATETIME | NOT NULL DEFAULT CURRENT_TIMESTAMP |

主キー: customer_id, product_id

## 新着情報テーブル

追加日は自動取得。

| 列名       | データ型 | 制約                               |
| ---------- | -------- | ---------------------------------- |
| id         | INT(11)  | NOT NULL AUTO_INCREMENT            |
| created_at | DATETIME | NOT NULL DEFAULT CURRENT_TIMESTAMP |
| content    | TEXT     | NOT NULL                           |

主キー: id

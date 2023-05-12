# インターネットTV

## ステップ1: テーブル設計

### テーブル名： channels

| カラム名 | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| -------- | ------------ | ---- | ------- | ------ | -------------- |
| id       | bigint(20)   |      | PRIMARY |        | YES            |
| name     | varchar(255) |      |         |        |                |

## テーブル名： timeframes

| カラム名   | データ型   | NULL | キー     | 初期値 | AUTO INCREMENT |
| ---------- | ---------- | ---- | -------- | ------ | -------------- |
| id         | bigint(20) |      | PRIMARY  |        | YES            |
| channel_id | bigint(20) |      | INDEX,FK |        |                |
| start_time | datetime   |      |          |        |                |

- 外部キー制約: channelsテーブルのidカラムに対して設定

## テーブル名： programs

| カラム名 | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| -------- | ------------ | ---- | ------- | ------ | -------------- |
| id       | bigint(20)   |      | PRIMARY |        | YES            |
| title    | varchar(255) |      |         |        |                |
| detail   | text         | YES  |         |        |                |

## テーブル名： genres

| カラム名 | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| -------- | ------------ | ---- | ------- | ------ | -------------- |
| id       | bigint(20)   |      | PRIMARY |        | YES            |
| name     | varchar(255) |      | UNIQUE  |        |                |

- ユニークキー制約：nameカラムに対して設定

## テーブル名： program_genres

| カラム名   | データ型   | NULL | キー     | 初期値 | AUTO INCREMENT |
| ---------- | ---------- | ---- | -------- | ------ | -------------- |
| id         | bigint(20) |      | PRIMARY  |        | YES            |
| program_id | bigint(20) |      | INDEX,FK |        |                |
| genre_id   | bigint(20) |      | INDEX,FK |        |                |

- 外部キー制約：programsテーブルのidカラムに対して設定
- 外部キー制約：genresテーブルのidカラムに対して設定

## テーブル名： episodes

| カラム名      | データ型   | NULL | キー     | 初期値 | AUTO INCREMENT |
| ------------- | ---------- | ---- | -------- | ------ | -------------- |
| id            | bigint(20) |      | PRIMARY  |        | YES            |
| program_id    | bigint(20) |      | INDEX,FK |        |                |
| season_number | int(11)    | YES  |          |

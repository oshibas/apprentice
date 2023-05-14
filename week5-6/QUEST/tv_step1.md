# インターネットTV

## テーブル設計

### channels テーブル：

| カラム名 | データ型     | NULL許容 | 備考         |
| -------- | ------------ | -------- | ------------ |
| id       | int(11)      | NO       | PRIMARY KEY  |
| name     | varchar(255) | YES      | チャンネル名 |

### time_slots テーブル：

| カラム名   | データ型 | NULL許容 | 備考        |
| ---------- | -------- | -------- | ----------- |
| id         | int(11)  | NO       | PRIMARY KEY |
| start_time | time     | NO       | 開始時刻    |
| end_time   | time     | NO       | 終了時刻    |

### programs テーブル：

| カラム名   | データ型     | NULL許容 | 備考                                                                     |
| ---------- | ------------ | -------- | ------------------------------------------------------------------------ |
| id         | int(11)      | NO       | PRIMARY KEY                                                              |
| title      | varchar(255) | NO       | プログラム名                                                             |
| detail     | text         | YES      | 詳細情報                                                                 |
| channel_id | int(11)      | NO       | channelsテーブルのidと外部キー関連、ON DELETE CASCADE, ON UPDATE CASCADE |

### program_time_slots テーブル：

| カラム名     | データ型 | NULL許容 | 備考                                                    |
| ------------ | -------- | -------- | ------------------------------------------------------- |
| program_id   | int(11)  | NO       | programsテーブルのidと外部キー関連、ON DELETE CASCADE   |
| time_slot_id | int(11)  | NO       | time_slotsテーブルのidと外部キー関連、ON DELETE CASCADE |

### genres テーブル：

| カラム名 | データ型     | NULL許容 | 備考        |
| -------- | ------------ | -------- | ----------- |
| id       | int(11)      | NO       | PRIMARY KEY |
| name     | varchar(255) | NO       | ジャンル名  |

### program_genres テーブル：

| カラム名   | データ型 | NULL許容 | 備考                                                                     |
| ---------- | -------- | -------- | ------------------------------------------------------------------------ |
| program_id | int(11)  | NO       | programsテーブルのidと外部キー関連、ON DELETE CASCADE, ON UPDATE CASCADE |
| genre_id   | int(11)  | NO       | genresテーブルのidと外部キー関連、ON DELETE CASCADE, ON UPDATE CASCADE   |

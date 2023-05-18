# step.2 テーブルの構築

実際にテーブルを構築し、データを入れましょう。その手順をドキュメントとしてまとめてください（アウトプットは手順のドキュメントです）。

<details>
<summary><b>テーブル構築の仕様</b></summary>
具体的には、以下のことを行う手順のドキュメントを作成してください。

1. データベースを構築します
2. ステップ1で設計したテーブルを構築します
3. サンプルデータを入れます。サンプルデータはご自身で作成ください（ChatGPTを利用すると比較的簡単に生成できます）

手順のドキュメントは、他の人が見た時にその手順通りに実施すればテーブル作成及びサンプルデータ格納が行えるように記載してください。

なお、ステップ2は以下のことを狙っています。

- データを実際に入れることでステップ3でデータ抽出クエリを試せるようにすること
- 手順をドキュメントにまとめることで、自身がやり直したい時にすぐやり直せること
- 手順を人が同じように行えるようにまとめることで、ドキュメントコミュニケーション力を上げること
</details>
<br>

## 1: データベースの構築

- MySQLサーバーにログイン。
- 新しいデータベースを作成。ターミナルで以下のコマンドを実行。

```sql
CREATE DATABASE internet_tv;
```
<br>

## 2: テーブルの作成

- ステップ1で提供したSQLコードを使用してテーブルを作成。
- さきほど構築したデータベースを選択し、SQLコードを実行。

```sql
USE internet_tv;
```

- その後、各テーブル作成用のSQL文を実行します。

<details>
<summary><b>SQL文</b></summary>

```sql
-- channelsテーブル作成
CREATE TABLE channels (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NULL,
  PRIMARY KEY (id)
);

-- time_slotsテーブル作成
CREATE TABLE time_slots (
  id INT(11) NOT NULL AUTO_INCREMENT,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  PRIMARY KEY (id)
);

-- programsテーブル作成
CREATE TABLE programs (
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  detail TEXT NULL,
  channel_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (channel_id) REFERENCES channels (id) ON DELETE CASCADE
);

-- program_time_slotsテーブル作成
CREATE TABLE program_time_slots (
  program_id INT(11) NOT NULL,
  time_slot_id INT(11) NOT NULL,
  FOREIGN KEY (program_id) REFERENCES programs (id) ON DELETE CASCADE,
  FOREIGN KEY (time_slot_id) REFERENCES time_slots (id) ON DELETE CASCADE
);

-- genresテーブル作成
CREATE TABLE genres (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- program_genresテーブル作成
CREATE TABLE program_genres (
  program_id INT(11) NOT NULL,
  genre_id INT(11) NOT NULL,
  FOREIGN KEY (program_id) REFERENCES programs (id) ON DELETE CASCADE,
  FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE CASCADE
);
```
</details>
<br>

## 3: サンプルデータの挿入

- 次に、サンプルデータを挿入します。

<details>
<summary><b>サンプルデータ</b></summary>

```sql
-- channelsテーブルにサンプルデータを挿入
INSERT INTO channels (name) VALUES
('ABEMA NEWS'),
('ABEMA SPECIAL'),
('ABEMA SPORTS'),
('ABEMA DRAMA'),
('ABEMA ANIME');

-- time_slotsテーブルにサンプルデータを挿入
INSERT INTO time_slots (start_time, end_time) VALUES
('08:00:00', '08:30:00'),
('08:30:00', '09:00:00'),
('09:00:00', '09:30:00'),
('09:30:00', '10:00:00'),
('10:00:00', '10:30:00');

-- programsテーブルにサンプルデータを挿入
INSERT INTO programs (title, detail, channel_id) VALUES
('ABEMA NEWS MORNING', '朝の最新ニュースをお届けします。', 1),
('ABEMA SPECIAL DOCUMENTARY', '感動的なドキュメンタリー番組です。', 2),
('ABEMA SPORTS HIGHLIGHTS', 'スポーツのハイライト映像をお楽しみください。', 3),
('ABEMA DRAMA SERIES', 'ドラマシリーズの新エピソードです。', 4),
('ABEMA ANIME SHORTS', '短編アニメをお楽しみください。', 5);

-- program_time_slotsテーブルにサンプルデータを挿入
INSERT INTO program_time_slots (program_id, time_slot_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- genresテーブルにサンプルデータを挿入
INSERT INTO genres (name) VALUES
('ニュース'),
('ドキュメンタリー'),
('スポーツ'),
('ドラマ'),
('アニメ');

-- program_genresテーブルにサンプルデータを挿入
INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
```

</details>
<br>

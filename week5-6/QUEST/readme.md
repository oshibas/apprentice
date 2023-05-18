# インターネットTV

好きな時間に好きな場所で話題の動画を無料で楽しめる「インターネットTVサービス」を新規に作成することになりました。データベース設計をした上で、データ取得する SQL を作成してください。

<details>
<summary>※インターネットTVの仕様</summary>

>仕様は次の通りです。サービスのイメージとしては [ABEMA](https://abema.tv/) を頭に思い浮かべてください。

- ドラマ1、ドラマ2、アニメ1、アニメ2、スポーツ、ペットなど、複数のチャンネルがある
- 各チャンネルの下では時間帯ごとに番組枠が1つ設定されており、番組が放映される
- 番組はシリーズになっているものと単発ものがある。シリーズになっているものはシーズンが1つものと、シーズン1、シーズン2のように複数シーズンのものがある。各シーズンの下では各エピソードが設定されている
- 再放送もあるため、ある番組が複数チャンネルの異なる番組枠で放映されることはある
- 番組の情報として、タイトル、番組詳細、ジャンルが画面上に表示される
- 各エピソードの情報として、シーズン数、エピソード数、タイトル、エピソード詳細、動画時間、公開日、視聴数が画面上に表示される。単発のエピソードの場合はシーズン数、エピソード数は表示されない
- ジャンルとしてアニメ、映画、ドラマ、ニュースなどがある。各番組は1つ以上のジャンルに属する
- KPIとして、チャンネルの番組枠のエピソードごとに視聴数を記録する。なお、一つのエピソードは複数の異なるチャンネル及び番組枠で放送されることがあるので、属するチャンネルの番組枠ごとに視聴数がどうだったかも追えるようにする

</details>

<br>

# step1. テーブル設計

<details>
<summary><b>テーブル設計を見る</b></summary>

## channelsテーブル：
| カラム名 | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| -------- | ------------ | -------- | ----------- | ------ | -------------- |
| id       | int(11)      | NO       | PRIMARY KEY |        | YES            |
| name     | varchar(255) | YES      |             |        |                |

## time_slotsテーブル：
| カラム名   | データ型 | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ---------- | -------- | -------- | ----------- | ------ | -------------- |
| id         | int(11)  | NO       | PRIMARY KEY |        | YES            |
| start_time | time     | NO       |             |        |                |
| end_time   | time     | NO       |             |        |                |

## programsテーブル：
| カラム名   | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ---------- | ------------ | -------- | ----------- | ------ | -------------- |
| id         | int(11)      | NO       | PRIMARY KEY |        | YES            |
| title      | varchar(255) | NO       |             |        |                |
| detail     | text         | YES      |             |        |                |
| channel_id | int(11)      | NO       |             |        |                |

## program_time_slotsテーブル：
| カラム名     | データ型 | NULL許容 | キー | 初期値 | AUTO_INCREMENT |
| ------------ | -------- | -------- | ---- | ------ | -------------- |
| program_id   | int(11)  | NO       |      |        |                |
| time_slot_id | int(11)  | NO       |      |        |                |

## genresテーブル：
| カラム名 | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| -------- | ------------ | -------- | ----------- | ------ | -------------- |
| id       | int(11)      | NO       | PRIMARY KEY |        | YES            |
| name     | varchar(255) | NO       |             |        |                |

## program_genresテーブル：
| カラム名   | データ型 | NULL許容 | キー | 初期値 | AUTO_INCREMENT |
| ---------- | -------- | -------- | ---- | ------ | -------------- |
| program_id | int(11)  | NO       |      |        |                |
| genre_id   | int(11)  | NO       |      |        |                |


</details>

<br>

# step.2 テーブルの構築

実際にテーブルを構築し、データを入れましょう。その手順をドキュメントとしてまとめてください（アウトプットは手順のドキュメントです）。

<details>
<summary>※テーブルの構築の仕様</summary>


## テーブル構築の仕様
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

<br>

<details>
<summary><b>テーブル作成用 SQL文</b></summary>

<br>

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

# step.3 データを抽出するクエリ

<details>
<summary><b>クエリ 1-4</b></summary>

#### 1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。
<br>

```sql
SELECT episode_title, views
FROM episodes
ORDER BY views DESC
LIMIT 3;
```

<br>

#### 2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
<br>

- エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください。
<br>

```sql
SELECT programs.title, seasons.season_number, episodes.episode_number, episodes.episode_title, episodes.views
FROM programs
INNER JOIN seasons ON programs.program_id = seasons.program_id
INNER JOIN episodes ON seasons.season_id = episodes.season_id
ORDER BY episodes.views DESC
LIMIT 3;
```

- エピソードテーブルからエピソードタイトルと視聴数を取得し、視聴数の降順でソート。
- 上位3つを取得するSQLを実行。
<br>

#### 3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
<br>

- 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
- なお、番組の開始時刻が本日のものを本日放送される番組とみなすものとします。

```sql
  SELECT channels.name, programs.start_time, programs.end_time, seasons.season_number, episodes.episode_number, episodes.episode_title, episodes.episode_description
  FROM channels
  INNER JOIN programs ON channels.channel_id = programs.channel_id
  INNER JOIN seasons ON programs.program_id = seasons.program_id
  INNER JOIN episodes ON seasons.season_id = episodes.season_id
  WHERE DATE(programs.start_time) = CURDATE()
  ORDER BY programs.start_time;

```
<br>

#### 4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。

- ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
<br>

```sql
SELECT
    program.start_time,
    program.end_time,
    program.season_number,
    program.episode_number,
    program.episode_title,
    program.episode_description
FROM
    program
WHERE
    program.channel = 'ドラマ'
    AND program.start_time >= NOW()
    AND program.start_time <= DATE_ADD(NOW(), INTERVAL 1 WEEK)
ORDER BY
    program.start_time ASC;

```
- programテーブルから、チャンネルが「ドラマ」であり、開始時刻が本日以降の一週間分の番組を取得。
- 番組表は開始時刻で昇順にソート。

<br>

</details>

<details>
<summary><b>クエリ 5-6(advanced)</b></summary>

#### 5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください。
<br>

```sql
SELECT
    program.title,
    SUM(viewership.episode_views) AS total_views
FROM
    program
    JOIN viewership ON program.id = viewership.program_id
WHERE
    program.start_time >= DATE_SUB(NOW(), INTERVAL 1 WEEK)
GROUP BY
    program.id
ORDER BY
    total_views DESC
LIMIT 2;

```

- programテーブルとviewershipテーブルを結合して、直近一週間に放送された番組のうち、エピソード視聴数合計がトップ2の番組を取得。
- 番組タイトルと視聴数のみが取得される。
- 番組タイトルで降順にソート。

<br>

#### 6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
<br>

  ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

```sql
SELECT
    program.genre,
    program.title,
    AVG(viewership.episode_views) AS avg_views
FROM
    program
    JOIN viewership ON program.id = viewership.program_id
GROUP BY
    program.id,
    program.genre
HAVING
    AVG(viewership.episode_views) = (
        SELECT
            MAX(avg_views)
        FROM
            (
                SELECT
                    program.genre,
                    program.id,
                    AVG(viewership.episode_views) AS avg_views
                FROM
                    program
                    JOIN viewership ON program.id = viewership.program_id
                GROUP BY
                    program.id,
                    program.genre


```
- programテーブルとviewershipテーブルをJOINし、番組のIDとジャンル、およびエピソードごとの視聴数を取得。
- GROUP BYを使用して、番組のIDとジャンルごとにグループ化し、エピソードの平均視聴数を計算。
- HAVINGを使用して、各ジャンルごとに最も高い平均視聴数を持つ番組のみを選択。
- サブクエリを使用して、最大平均視聴数を計算し、その値に一致する番組を選択。
- 選択された番組のジャンル、タイトル、およびエピソードの平均視聴数を取得。

</details>

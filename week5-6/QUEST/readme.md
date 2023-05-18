# インターネットTV

好きな時間に好きな場所で話題の動画を無料で楽しめる「インターネットTVサービス」を新規に作成することになりました。データベース設計をした上で、データ取得する SQL を作成してください。

<details>
<summary><b>インターネットTVの仕様</b></summary>

>仕様は次の通りです。サービスのイメージとしては [ABEMA](https://abema.tv/) を頭に思い浮かべてください。

- ドラマ1、ドラマ2、アニメ1、アニメ2、スポーツ、ペットなど、複数のチャンネルがある
- 各チャンネルの下では時間帯ごとに番組枠が1つ設定されており、番組が放映される
- 番組はシリーズになっているものと単発ものがある。シリーズになっているものはシーズンが1つものと、シーズン1、シーズン2のように複数シーズンのものがある。各シーズンの下では各エピソードが設定されている
- 再放送もあるため、ある番組が複数チャンネルの異なる番組枠で放映されることはある
- 番組の情報として、タイトル、番組詳細、ジャンルが画面上に表示される
- 各エピソードの情報として、シーズン数、エピソード数、タイトル、エピソード詳細、動画時間、公開日、視聴数が画面上に表示される。単発のエピソードの場合はシーズン数、エピソード数は表示されない
- ジャンルとしてアニメ、映画、ドラマ、ニュースなどがある。各番組は1つ以上のジャンルに属する
- KPIとして、チャンネルの番組枠のエピソードごとに視聴数を記録する。なお、一つのエピソードは複数の異なるチャンネル及び番組枠で放送されることがあるので、属するチャンネルの番組枠ごとに視聴数がどうだったかも追えるようにする

## テーブル設計の仕様
テーブルごとにテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）を記載してください。また、外部キー制約、ユニークキー制約に関しても記載してください。

</details>
<br>

# step1. テーブル設計

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

<br>

# step.2 テーブルの構築

>実際にテーブルを構築し、データを入れましょう。その手順をドキュメントとしてまとめてください（アウトプットは手順のドキュメントです）。

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
<hr>
<br>

## 1: データベースの構築

- MySQLサーバーにログインします。
- 次に、新しいデータベースを作成します。
- ターミナルで以下のコマンドを実行します。

```sql
CREATE DATABASE internet_tv;
```
<br>
<hr>
<br>

## 2: テーブルの作成

- ステップ1で提供したSQLコードを使用してテーブルを作成します。
- さきほど構築したデータベースを選択し、SQLコードを実行します。

```sql
USE internet_tv;
```

- その後、各テーブル作成用のSQL文を実行します。

<details>
<summary><b>SQL文</b></summary>

```sql
NSERT INTO channels (id, name) VALUES
(1, 'NHK'),
(2, 'NTV'),
(3, 'TBS'),
(4, 'Fuji TV'),
(5, 'TV Asahi');

INSERT INTO time_slots (id, start_time, end_time) VALUES
(1, '06:00:00', '06:30:00'),
(2, '06:30:00', '07:00:00'),
(3, '07:00:00', '07:30:00'),
...
(n-1, n-1 * ':30:00', n * ':30:00'),
(n, n * ':30:00', n+1 * ':30:00');

INSERT INTO programs (id, title, detail, channel_id) VALUES
(1, 'NHKニュースおはよう日本（前半）', '最新のニュースや気象情報などをお伝えします。', 1),
...
(m-1, 'ドラゴンボール超（再）', '孫悟空と仲間たちが宇宙の平和を守るために戦うアニメ。第1話「平和の報酬 一億ゼニーは誰の手に!?」', 4),
(m, 'クレヨンしんちゃん（新）', '野原しんのすけとその家族や友人たちの日常を描くギャグアニメ。第1109話「ひまわりとお花見」', 5);

INSERT INTO program_time_slots (program_id, time_slot_id) VALUES
(1, 1),
...
(m-1, n-2),
(m, n-1);

INSERT INTO genres (id, name) VALUES
(1, 'ニュース'),
(2, '情報番組'),
(3, 'ドラマ'),
...
(k-1, 'アニメ'),
(k, '映画');

INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
...
(m-1, k-1),
(m, k-1);
```
</details>
<br>
<hr>
<br>

## 3: サンプルデータを挿入

- 次に、サンプルデータを挿入します。

<details>
<summary><b>サンプルデータ</b></summary>

```sql
INSERT INTO channels (id, name) VALUES
(1, 'NHK'),
(2, 'NTV'),
(3, 'TBS'),
(4, 'Fuji TV'),
(5, 'TV Asahi');

INSERT INTO time_slots (id, start_time, end_time) VALUES
(1, '06:00:00', '06:30:00'),
(2, '06:30:00', '07:00:00'),
(3, '07:00:00', '07:30:00'),
(4, '07:30:00', '08:00:00'),
(5, '08:00:00', '08:30:00'),
(6, '08:30:00', '09:00:00');

INSERT INTO programs (id, title, detail, channel_id) VALUES
(1, 'NHKニュースおはよう日本（前半）', '最新のニュースや気象情報などをお伝えします。', 1),
(2, 'NNNドキュメント72時間', '日本全国の様々な場所やテーマを取材するドキュメンタリー番組。', 2),
(3, 'ひるおび！', 'ニュース、天気予報、スポーツなどを扱う情報番組。', 3),
(4, '総力報道！THE NEWS', 'ニュースや経済情報、芸能情報などを扱う報道番組。', 4),
(5, '報道ステーション', '日本の政治、社会、経済、科学、文化、芸能などに関する最新のニュースを扱う報道番組。', 5);

INSERT INTO program_time_slots (program_id, time_slot_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO genres (id, name) VALUES
(1, 'ニュース'),
(2, '情報番組'),
(3, 'ドラマ'),
(4, 'バラエティ'),
(5, 'スポーツ'),
(6, '音楽'),
(7, 'アニメ'),
(8, '映画');

INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 1);
```

</details>

<br>
<hr>
<br>

# step.3 データを抽出するクエリ


> 1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。
<br>
<details>
<summary><b>1. クエリ</b></summary>

<br>

```sql
SELECT episode_title, views
FROM episodes
ORDER BY views DESC
LIMIT 3;
```

</details>

<br>
<hr>
<br>



> 2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
<br>
<details>
<summary><b>2. クエリ</b></summary>

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
</details>
<br>
<hr>
<br>


> 3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
<br>

<details>
<summary><b>3. クエリ</b></summary>

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
</details>
<br>

> 4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
<br>

<details>
<summary><b>4. クエリ</b></summary>

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

</details>
<br>

> 5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください。
<br>

<details>
<summary><b>5. クエリ</b></summary>

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
</details>
<br>

> 6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
<br>

  ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

<details>
<summary><b>6. クエリ</b></summary>

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
<br>

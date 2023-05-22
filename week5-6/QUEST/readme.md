# インターネットTV

好きな時間に好きな場所で話題の動画を無料で楽しめる「インターネットTVサービス」を新規に作成することになりました。データベース設計をした上で、データ取得する SQL を作成してください。

<br>

## インターネットTVの仕様

| 項目               | 説明                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------------ |
| チャンネル         | 複数のチャンネルがある                                                                           |
| 番組               | タイトル、番組詳細、ジャンルが画面上に表示される                                                 |
| シリーズ           | シーズンが1つ、複数シーズンがあり、各シーズンの下では各エピソードが設定されている                |
| 再放送             | 再放送もある                                                                                     |
| 番組の情報         | タイトル、番組詳細、ジャンルが画面上に表示される                                                 |
| 各エピソードの情報 | シーズン数、エピソード数、タイトル、エピソード詳細、動画時間、公開日、視聴数が画面上に表示される |
| 単発のエピソード   | シーズン数、エピソード数は表示されない                                                           |
| ジャンル           | アニメ、映画、ドラマ、ニュースなど。各番組は1つ以上のジャンルに属する                            |
| KPI                | チャンネルの番組枠のエピソードごとに視聴数を記録する                                             |
| 視聴数             | 各チャンネルの番組枠ごとに視聴数を追えるようにする                                               |


<br>

# step.1 テーブル設計

<details>
<summary><b>テーブル設計を見る</b></summary>

## channelsテーブル：
- 複数のチャンネルを表します。
- チャンネルには名前があり、それぞれ一意の id で識別されます。

| カラム名 | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| -------- | ------------ | -------- | ----------- | ------ | -------------- |
| id       | int(11)      | NO       | PRIMARY KEY |        | YES            |
| name     | varchar(255) | NO       |             |        |                |

## time_slotsテーブル：
- 番組の放送時間帯を表します。
- 各タイムスロットには開始時刻と終了時刻があり、それぞれ一意の id で識別されます。

| カラム名   | データ型 | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ---------- | -------- | -------- | ----------- | ------ | -------------- |
| id         | int(11)  | NO       | PRIMARY KEY |        | YES            |
| start_time | time     | NO       |             |        |                |
| end_time   | time     | NO       |             |        |                |

## programsテーブル：
- 番組の情報を表します。番組にはタイトルや詳細があり、それぞれ一意の id で識別されます。
- また、channel_id カラムを通じて channels テーブルのチャンネルと関連付けられます。

| カラム名   | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ---------- | ------------ | -------- | ----------- | ------ | -------------- |
| id         | int(11)      | NO       | PRIMARY KEY |        | YES            |
| title      | varchar(255) | NO       |             |        |                |
| detail     | text         | YES      |             |        |                |
| channel_id | int(11)      | NO       |             |        |                |

## program_time_slotsテーブル：
- 番組とタイムスロットの関係を表現します。
- 番組とタイムスロットは多対多の関係にあり、このテーブルによって関連付けられます。
- program_id カラムは programs テーブルの番組と、time_slot_id カラムは time_slots テーブルのタイムスロットと関連付けられます。

| カラム名     | データ型 | NULL許容 | キー | 初期値 | AUTO_INCREMENT |
| ------------ | -------- | -------- | ---- | ------ | -------------- |
| program_id   | int(11)  | NO       |      |        |                |
| time_slot_id | int(11)  | NO       |      |        |                |

## genresテーブル：
- 番組のジャンルを表します。
- ジャンルには名前があり、それぞれ一意の id で識別されます。

| カラム名 | データ型     | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| -------- | ------------ | -------- | ----------- | ------ | -------------- |
| id       | int(11)      | NO       | PRIMARY KEY |        | YES            |
| name     | varchar(255) | NO       |             |        |                |

## program_genresテーブル：
- 番組とジャンルの関係を表現します。
- 番組とジャンルも多対多の関係にあり、このテーブルによって関連付けられます。
- program_id カラムは programs テーブルの番組と、genre_id カラムは genres テーブルのジャンルと関連付けられます。

| カラム名   | データ型 | NULL許容 | キー | 初期値 | AUTO_INCREMENT |
| ---------- | -------- | -------- | ---- | ------ | -------------- |
| program_id | int(11)  | NO       |      |        |                |
| genre_id   | int(11)  | NO       |      |        |                |

## seasons テーブル:
- program_id: シーズンが所属する番組を識別するための外部キー（異なるテーブル間の関連性を定義するために使用されるキー）です。programsテーブルのidカラムと関連付けられます。
- number: シーズンの番号を表します。

| カラム名   | データ型 | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ---------- | -------- | -------- | ----------- | ------ | -------------- |
| id         | int(11)  | NO       | PRIMARY KEY |        | YES            |
| program_id | int(11)  | NO       |             |        |                |
| number     | int(11)  | NO       |             |        |                |

## viewership テーブル:

- episode_id: エピソードを識別するための外部キー。エピソードテーブルの id カラムと関連付けられます。
- channel_id: チャンネルを識別するための外部キー。チャンネルテーブルの id カラムと関連付けられます。
- time_slot_id: 番組枠を識別するための外部キー。番組枠テーブルの id カラムと関連付けられます。
- viewership: エピソードの視聴数を表す整数値です。初期値として0が設定されています。

| カラム名     | データ型 | NULL許容 | キー        | 初期値 | AUTO_INCREMENT |
| ------------ | -------- | -------- | ----------- | ------ | -------------- |
| id           | int(11)  |          | PRIMARY KEY |        | YES            |
| episode_id   | int(11)  |          |             |        |                |
| channel_id   | int(11)  |          |             |        |                |
| time_slot_id | int(11)  |          |             |        |                |
| viewership   | INT      |          |             | 0      |                |

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

- ステップ1で作成したデータベースを選択。
```sql
USE internet_tv;
```

- その後、各テーブル作成用のSQL文を実行。

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

-- seasonsテーブル作成
CREATE TABLE seasons (
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  program_id INT(11) NOT NULL,
  number INT(11) NOT NULL,
  FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- viewershipテーブル作成
CREATE TABLE viewership (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  episode_id INT(11),
  channel_id INT(11),
  time_slot_id INT(11),
  viewership INT DEFAULT 0,
  FOREIGN KEY (episode_id) REFERENCES episodes(id),
  FOREIGN KEY (channel_id) REFERENCES channels(id),
  FOREIGN KEY (time_slot_id) REFERENCES time_slots(id)
);
```

</details>

<br>

## 3: サンプルデータの挿入

次に、サンプルデータを挿入します。

<details>
<summary><b>サンプルデータ</b></summary>

### データを挿入する順序：

- データを挿入する際には、外部キー制約を考慮する必要があります。
- 外部キー制約がある場合、関連するテーブルのデータを先に挿入します。
- 例えば、"viewership" テーブルの "episode_id" カラムは "episodes" テーブルの外部キーとして定義されています。

1. channelsテーブル
2. time_slotsテーブル
3. programsテーブル
4. genresテーブル
5. seasonsテーブル
6. episodesテーブル
7. program_time_slotsテーブル
8. program_genresテーブル
9. viewershipテーブル


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

-- seasonsテーブルにサンプルデータを挿入
INSERT INTO seasons (program_id, number) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2);

-- viewershipテーブルにサンプルデータを挿入
INSERT INTO viewership (episode_id, channel_id, time_slot_id, viewership) VALUES
(1, 1, 1, 1000),
(2, 2, 2, 500),
(3, 3, 3, 1500),
(4, 4, 4, 800),
(5, 5, 5, 1200);
```

</details>
<br>

# step.3 データを抽出するクエリ

<details>
<summary><b>クエリ 1-4</b></summary>

#### 1. よく見られているエピソードを知りたいです。

エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。
<br>

```sql
SELECT episode_title, views
FROM episodes
ORDER BY views DESC
LIMIT 3;
```
- episodes テーブルからエピソードのタイトルと視聴数を取得します。
- SELECT 文は取得する列を指定します。
- ORDER BY 句を使用して視聴数の降順でソートし、LIMIT 句を使って上位3つの結果に制限しています。


### ORDER BY句

- ORDER BY句は、SELECT文の最後に記述します。
- 指定したカラムの値に基づいて結果を昇順（ASC/デフォルト）または降順（DESC）で並び替えます。

```sql
SELECT 列名1, 列名2, ...
FROM テーブル名
ORDER BY 列名 [ASC | DESC];
```

<br>

#### 2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。

エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください。
<br>

```sql
SELECT
    programs.title AS program_title,
    seasons.season_number,
    episodes.episode_number,
    episodes.episode_title,
    viewership.viewership AS episode_views
FROM
    programs
    JOIN seasons ON programs.id = seasons.program_id
    JOIN episodes ON seasons.id = episodes.season_id
    JOIN viewership ON episodes.id = viewership.episode_id
ORDER BY
    viewership.viewership DESC
LIMIT 3;
```

#### SELECT句:
- programs.title AS program_title: programsテーブルのtitleカラムをprogram_titleという別名で表示。
- viewership.viewership AS episode_views: viewershipテーブルのviewershipカラムをepisode_viewsという別名で表示。

#### FROM句:
- programs: programsテーブルをメインのテーブルとして指定。

#### JOIN句:
- JOIN seasons ON programs.id = seasons.program_id: programsテーブルのidカラムとseasonsテーブルのprogram_idカラムを結合条件として指定。
- JOIN episodes ON seasons.id = episodes.season_id: seasonsテーブルのidカラムとepisodesテーブルのseason_idカラムを結合条件として指定。
- JOIN viewership ON episodes.id = viewership.episode_id: episodesテーブルのidカラムとviewershipテーブルのepisode_idカラムを結合条件として指定。

#### ORDER BY句:
- viewership.viewership DESC: viewershipテーブルのviewershipカラムを降順でソート。

<br>

#### 3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。

1. 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
2. 番組の開始時刻が本日のものを本日放送される番組とみなすものとします。

```sql
  SELECT channels.name, programs.start_time, programs.end_time, seasons.season_number, episodes.episode_number, episodes.episode_title, episodes.episode_description
  FROM channels
  INNER JOIN programs ON channels.channel_id = programs.channel_id
  INNER JOIN seasons ON programs.program_id = seasons.program_id
  INNER JOIN episodes ON seasons.season_id = episodes.season_id
  WHERE DATE(programs.start_time) = CURDATE()
  ORDER BY programs.start_time;
```

- FROM句:テーブルの結合順序を指定。
- channelsテーブルとprogramsテーブルをINNER JOINで結合しています。結合条件はchannels.id = programs.channel_idで、チャンネルIDを使用してチャンネル名と番組情報を関連付けています。

- programsテーブルとseasonsテーブルをINNER JOINで結合。結合条件はprograms.id = seasons.program_idで、番組IDを使用して番組とシーズン情報を関連付けています。

- seasonsテーブルとepisodesテーブルをINNER JOINで結合。結合条件はseasons.id = episodes.season_idで、シーズンIDを使用してシーズンとエピソード情報を関連付けています。

- WHERE句: 番組の開始時刻が本日のものとなるように条件を指定しています。DATE(programs.start_time) = CURDATE()という条件は、programsテーブルの開始時刻が現在の日付 (CURDATE()) と一致する番組のみを選択します。

- ORDER BY句: 結果の並び順を番組の開始時刻でソート。

#### INNER JOIN
- クエリで複数のテーブル間の関連データを結合するために使用される結合操作。
- INNER JOINを使用することで、結合条件に一致する行のみを結合した結果を取得できます。
```sql
SELECT 列名1, 列名2, ...
FROM テーブル1
INNER JOIN テーブル2 ON 結合条件;
```
- 列名1, 列名2, ...: 取得する列の名前
- テーブル1, テーブル2: 結合するテーブルの名前
- 結合条件: 結合するテーブル間の関連条件。通常、テーブル間の共有カラムを指定。

### WHERE句
- 条件を指定して、その条件に一致する行のみを結果に含めます。
```sql
WHERE DATE(programs.start_time) = CURDATE()
```
- DATE(programs.start_time)はprograms.start_timeの日付部分を抽出し、CURDATE()は現在の日付を表します。
- この条件はprograms.start_timeの日付が現在の日付（今日）と一致する行のみを抽出します。

### ORDER BY句
- 結果を特定の列で並び替えます。
```sql
ORDER BY programs.start_time
```
- programs.start_time列の値で昇順にソートします。
- 番組の開始時刻が早い順に結果が並びます。
<br>

#### 4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。

ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
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
- channels テーブルと programs テーブル、それらに関連する seasons テーブルと episodes テーブルを結合しています。
- 結果には、ドラマチャンネルの番組の開始時刻、終了時刻、シーズン数、エピソード数、エピソードのタイトル、およびエピソードの詳細が含まれます。
- クエリの条件として、channels.name が 'ドラマ' であり、番組の開始時刻が本日以上かつ一週間以内であることを指定しています。
- 結果は番組の開始時刻で昇順にソートされます。

<br>

</details>

<details>
<summary><b>クエリ 5-6(advanced)</b></summary>

#### 5. (advanced) 直近一週間で最も見られた番組が知りたいです。

直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください。
<br>

```sql
SELECT
    p.title AS program_title,
    SUM(v.viewership) AS total_views
FROM
    programs p
    JOIN viewership v ON p.id = v.program_id
WHERE
    p.start_time >= DATE_SUB(NOW(), INTERVAL 1 WEEK)
GROUP BY
    p.id
ORDER BY
    total_views DESC
LIMIT 2;
```

- programs テーブルと viewership テーブルを結合。番組と視聴数データが関連付けられます。
- p.title AS program_title: 番組のタイトルを表すカラムのエイリアス（別名）。結果のカラム名をわかりやすく。
- v.viewership: 視聴数データのカラムを表しています。SUM() 関数を使って、各番組の視聴数を合計します。
- p.start_time >= DATE_SUB(NOW(), INTERVAL 1 WEEK): 番組の開始時間が直近一週間以内である条件。
- GROUP BY p.id: 番組IDごとにグループ化して、視聴数をまとめています。
- ORDER BY total_views DESC: 視聴数の合計を降順に並び替えます。

<br>

#### 6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。

番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
<br>

  ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

```sql
SELECT
    g.name AS genre_name,
    p.title AS program_title,
    AVG(v.episode_views) AS average_views
FROM
    programs p
    JOIN program_genres pg ON p.id = pg.program_id
    JOIN genres g ON pg.genre_id = g.id
    JOIN viewership v ON p.id = v.program_id
GROUP BY
    g.id,
    p.id,
    g.name,
    p.title
HAVING
    AVG(v.episode_views) = (
        SELECT
            MAX(average_views)
        FROM
            (
                SELECT
                    AVG(viewership.episode_views) AS average_views
                FROM
                    programs p
                    JOIN program_genres pg ON p.id = pg.program_id
                    JOIN genres g ON pg.genre_id = g.id
                    JOIN viewership v ON p.id = v.program_id
                GROUP BY
                    p.id,
                    g.id
            ) AS subquery
    );
```
- 最初のSELECT文: 表示するカラムとそのエイリアスを指定しています。
- g.name AS genre_name => ジャンル名
- p.title AS program_title => 番組タイトル
- AVG(v.episode_views) AS average_views => エピソードの平均視聴数

- FROM句: 番組情報を表すprogramsテーブルとジャンル情報を表すgenresテーブル、番組とジャンルの関連付けを表すprogram_genresテーブル、視聴数情報を表すviewershipテーブルを結合。

- GROUP BY句: ジャンルID (g.id) と番組ID (p.id) でグループ化。ジャンルごとの番組の平均視聴数を計算します。

- HAVING句: 平均視聴数が最大値と等しい結果のみを抽出。内部のサブクエリによって、全体のクエリから最大の平均視聴数を持つ結果が選択されます。

#### HAVING句
グループ化された結果に対して条件を適用するために使用されるSQLの句。一般的に、WHERE句は個々の行に対して条件を適用するのに対し、HAVING句はグループに対して条件を適用。

HAVING句の条件式
```sql
AVG(v.episode_views) = (SELECT MAX(average_views) FROM ...)
```
- この条件式では、平均視聴数 (AVG(v.episode_views)) がサブクエリの結果と等しいかどうかを比較。
- サブクエリは、番組とジャンルの結合を含む内部のSELECT文。番組ごとに平均視聴数を計算し、最大の平均視聴数 (MAX(average_views)) を求めています。

- HAVING句によって、全体のクエリ結果から平均視聴数が最大値と等しい結果のみを抽出することができます。
</details>

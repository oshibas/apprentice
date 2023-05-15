# step.3 データを抽出するクエリ


### 1. よく見られているエピソードを知りたいです。
<br>

- エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください

<br>

```sql
SELECT episode_title, views
FROM episodes
ORDER BY views DESC
LIMIT 3;
```
<br>
<hr>
<br>

### 2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
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
<hr>
<br>
<br>

### 3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
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
<hr>
<br>
<br>

### 4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
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
<hr>
<br>
<br>

### 5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください。
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
<hr>
<br>

### 6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
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
<br>
<hr>
<br>

# データを絞り込むことができる
## 1. 指定した行数のみ取得
> 従業員データ(employees テーブル)を10行のみ取得してください。
- 「LIMIT句」を使い、取得するデータの数を指定する。（先頭から）
- データの取得を行う最初の位置を指定するには 「OFFSET句」を使用。

```sql
SELECT * FROM employees LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |
+--------+------------+------------+-----------+--------+------------+
```

10 rows in set (0.05 sec)
## 2. 等しいデータの絞り込み
> 従業員のうち、女性のデータを10行分取得してください。

```sql
SELECT * FROM employees WHERE gender = 'F' LIMIT 10;
+--------+------------+------------+------------+--------+------------+
| emp_no | birth_date | first_name | last_name  | gender | hire_date  |
+--------+------------+------------+------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel     | F      | 1985-11-21 |
|  10006 | 1953-04-20 | Anneke     | Preusig    | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski  | F      | 1989-02-10 |
|  10009 | 1952-04-19 | Sumant     | Peac       | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau   | F      | 1989-08-24 |
|  10011 | 1953-11-07 | Mary       | Sluis      | F      | 1990-01-22 |
|  10017 | 1958-07-06 | Cristinel  | Bouloucos  | F      | 1993-08-03 |
|  10018 | 1954-06-19 | Kazuhide   | Peha       | F      | 1987-04-03 |
|  10023 | 1953-09-29 | Bojan      | Montemayor | F      | 1989-12-17 |
|  10024 | 1958-09-05 | Suzette    | Pettey     | F      | 1997-05-19 |
+--------+------------+------------+------------+--------+------------+
10 rows in set (0.01 sec)
```

## 3. 等しくないデータの絞り込み
> 従業員のうち、女性でないデータを10行分取得してください。その際、否定形の構文を使用してください。
- 「NOT演算子」を使用して、gender が 'F' ではない行を取得する。

```sql
SELECT * FROM employees WHERE NOT gender = 'F' LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello     | M      | 1986-06-26 |
|  10003 | 1959-12-03 | Parto      | Bamford     | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick     | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak    | M      | 1989-09-12 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi    | M      | 1994-09-15 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10014 | 1956-02-12 | Berni      | Genin       | M      | 1987-03-11 |
|  10015 | 1959-08-19 | Guoxiang   | Nooteboom   | M      | 1987-07-02 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
+--------+------------+------------+-------------+--------+------------+
10 rows in set (0.00 sec)
```

## 4. より大きいデータの絞り込み
> 従業員のうち、誕生日が1960年1月1日以降の人のデータを10行分取得してください。
- WHERE birth_date > '1960-01-01'  LIMIT 10; と書くことで取得できる。

```sql
SELECT * FROM employees WHERE birth_date > '1960-02-01' LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel      | F      | 1985-11-21 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau    | F      | 1989-08-24 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
|  10021 | 1960-02-20 | Ramzi      | Erde        | M      | 1988-02-10 |
|  10027 | 1962-07-10 | Divier     | Reistad     | F      | 1989-07-07 |
|  10028 | 1963-11-26 | Domenick   | Tempesti    | M      | 1991-10-22 |
|  10032 | 1960-08-09 | Jeong      | Reistad     | F      | 1990-06-20 |
|  10034 | 1962-12-29 | Bader      | Swan        | M      | 1988-09-21 |
+--------+------------+------------+-------------+--------+------------+
10 rows in set (0.06 sec)
```

## 5. あいまいな条件の絞り込み
> 従業員のうち、ファーストネームに vi が含まれる人のデータを10行分取得してください。
- LIKE演算子: 文字列のパターンを比較するために使用。
- %: 0文字以上の任意の文字列にマッチするワイルドカード。
- first_name LIKE '%vi%': ファーストネームのどこかに'vi'を含むものにマッチ。

```sql
SELECT * FROM employees WHERE first_name LIKE '%vi%' LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10027 | 1962-07-10 | Divier     | Reistad   | F      | 1989-07-07 |
|  10030 | 1958-07-14 | Elvis      | Demeyer   | M      | 1994-02-17 |
|  10082 | 1963-09-09 | Parviz     | Lortz     | M      | 1990-01-03 |
|  10083 | 1959-07-23 | Vishv      | Zockler   | M      | 1987-03-31 |
|  10102 | 1959-11-04 | Paraskevi  | Luby      | F      | 1994-01-26 |
|  10200 | 1961-12-31 | Vidya      | Awdeh     | M      | 1985-10-16 |
|  10204 | 1956-12-09 | Nevio      | Ritcey    | F      | 1986-12-04 |
|  10211 | 1964-08-05 | Vishu      | Strehl    | F      | 1989-11-18 |
|  10212 | 1959-05-09 | Divier     | Esteva    | M      | 1990-07-11 |
|  10421 | 1959-03-22 | Divine     | Marzano   | M      | 1989-09-12 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.01 sec)
```

## 6. 特定の範囲の絞り込み
> 従業員のうち、誕生日が1960年1月1日から1960年1月31日までの人のデータを10行分取得してください。
- WHERE birth_date BETWEEN '1960-01-01' AND '1960-01-31': BETWEEN句を使い、指定した期間のみを取得。

```sql
SELECT * FROM employees WHERE birth_date BETWEEN '1960-01-01' AND '1960-01-31' LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10141 | 1960-01-17 | Shahaf     | Ishibashi | F      | 1993-05-06 |
|  10175 | 1960-01-11 | Aleksandar | Ananiadou | F      | 1988-01-11 |
|  10208 | 1960-01-02 | Xiping     | Klerer    | M      | 1991-12-23 |
|  10352 | 1960-01-28 | Erzsebet   | Ohori     | M      | 1996-01-21 |
|  10366 | 1960-01-25 | Morrie     | Piazza    | M      | 1994-04-11 |
|  10647 | 1960-01-12 | Tesuro     | Bahk      | M      | 1995-09-28 |
|  10893 | 1960-01-30 | Danil      | Kropatsch | M      | 1989-08-23 |
|  11259 | 1960-01-13 | Amalendu   | Gronowski | M      | 1986-12-26 |
|  11353 | 1960-01-30 | Utpal      | Berztiss  | M      | 1986-08-25 |
|  11374 | 1960-01-25 | Remzi      | Matzat    | F      | 1993-12-12 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.00 sec)
```

## 7. かつ
> 従業員のうち、ファーストネームが Mary で、かつ女性のデータを取得してください。
- かつ: AND条件

```sql
 SELECT * FROM employees WHERE first_name = 'Mary' AND gender = 'F';
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10011 | 1953-11-07 | Mary       | Sluis       | F      | 1990-01-22 |
|  10532 | 1959-08-31 | Mary       | Wossner     | F      | 1986-05-18 |
|  11821 | 1954-10-18 | Mary       | Piazza      | F      | 1995-12-13 |
|  12334 | 1962-03-08 | Mary       | Ertl        | F      | 1990-03-06 |
|  13881 | 1956-08-14 | Mary       | Monarch     | F      | 1991-06-10 |
|  13924 | 1955-05-23 | Mary       | DasSarma    | F      | 1991-11-05 |
|  16021 | 1964-06-04 | Mary       | Ananiadou   | F      | 1994-05-21 |
|  23680 | 1962-07-14 | Mary       | Navazio     | F      | 1986-09-17 |
|  26899 | 1963-12-21 | Mary       | Luders      | F      | 1987-12-03 |
|  27747 | 1959-03-27 | Mary       | Fujisawa    | F      | 1990-09-07 |
|  28912 | 1955-10-27 | Mary       | Monarch     | F      | 1996-02-25 |
|  29339 | 1953-11-06 | Mary       | Itzfeldt    | F      | 1991-01-18 |
|  33624 | 1963-08-31 | Mary       | Babu        | F      | 1992-05-05 |
|  37228 | 1959-02-14 | Mary       | Glinert     | F      | 1990-03-21 |
|  39942 | 1952-10-06 | Mary       | Hofmeyr     | F      | 1992-09-25 |
|  45693 | 1964-01-01 | Mary       | Lindenbaum  | F      | 1996-02-25 |
|  48464 | 1962-01-26 | Mary       | Heemskerk   | F      | 1985-08-11 |
|  50080 | 1954-01-17 | Mary       | Argence     | F      | 1987-12-15 |
|  52983 | 1958-06-15 | Mary       | Litzkow     | F      | 1985-11-23 |
|  54250 | 1953-02-15 | Mary       | Kalafatis   | F      | 1996-10-28 |
|  63678 | 1958-10-11 | Mary       | Lorch       | F      | 1986-08-03 |
|  65145 | 1955-07-25 | Mary       | Perz        | F      | 1990-07-29 |
|  78541 | 1960-11-02 | Mary       | Collette    | F      | 1986-10-11 |
|  84052 | 1956-06-27 | Mary       | Decleir     | F      | 1985-04-29 |
|  87235 | 1958-01-05 | Mary       | Speek       | F      | 1988-04-30 |
|  88698 | 1954-11-01 | Mary       | Lundstrom   | F      | 1985-12-09 |
|  90298 | 1960-07-02 | Mary       | Kalefeld    | F      | 1991-06-16 |
|  93118 | 1957-07-20 | Mary       | Ruemmler    | F      | 1985-04-11 |
|  94138 | 1962-02-12 | Mary       | Schrooten   | F      | 1988-12-16 |
| 104751 | 1954-05-04 | Mary       | Puoti       | F      | 1990-06-22 |
| 201430 | 1953-01-06 | Mary       | Melski      | F      | 1987-09-13 |
| 201790 | 1958-02-18 | Mary       | Gente       | F      | 1990-05-15 |
| 202957 | 1961-12-23 | Mary       | Leivant     | F      | 1986-07-09 |
| 205146 | 1955-12-01 | Mary       | Billingsley | F      | 1991-01-17 |
| 205500 | 1965-01-04 | Mary       | Setiz       | F      | 1989-01-13 |
| 215804 | 1957-01-28 | Mary       | Lorch       | F      | 1994-03-09 |
| 217707 | 1962-09-05 | Mary       | Lichtman    | F      | 1987-11-20 |
| 219082 | 1954-03-29 | Mary       | Baalen      | F      | 1988-03-31 |
| 224166 | 1954-12-12 | Mary       | Baaz        | F      | 1987-02-11 |
| 224498 | 1955-06-24 | Mary       | Khalil      | F      | 1986-05-13 |
| 231418 | 1964-03-22 | Mary       | Bierbaum    | F      | 1988-04-13 |
| 240360 | 1953-12-12 | Mary       | Pelz        | F      | 1985-08-19 |
| 241287 | 1957-08-03 | Mary       | Rodite      | F      | 1987-04-17 |
| 244656 | 1959-08-15 | Mary       | Beausoleil  | F      | 1985-05-03 |
| 246376 | 1956-06-03 | Mary       | Pollock     | F      | 1986-01-26 |
| 254095 | 1959-12-13 | Mary       | Farris      | F      | 1988-08-16 |
| 258873 | 1955-06-29 | Mary       | Czaja       | F      | 1993-11-04 |
| 259980 | 1962-06-11 | Mary       | Muntz       | F      | 1986-02-04 |
| 261556 | 1963-09-02 | Mary       | Camurati    | F      | 1985-06-23 |
| 268565 | 1961-03-22 | Mary       | Henders     | F      | 1989-06-22 |
| 271976 | 1952-12-06 | Mary       | Kuhnemann   | F      | 1986-09-06 |
| 282853 | 1954-12-07 | Mary       | Perna       | F      | 1992-12-01 |
| 290877 | 1957-02-09 | Mary       | Cronau      | F      | 1991-03-30 |
| 295934 | 1961-11-03 | Mary       | Chinen      | F      | 1989-05-28 |
| 297847 | 1962-10-31 | Mary       | Takanami    | F      | 1985-12-25 |
| 401515 | 1956-03-10 | Mary       | Kampfer     | F      | 1996-12-11 |
| 402915 | 1958-09-27 | Mary       | Hutter      | F      | 1988-03-01 |
| 404420 | 1955-07-30 | Mary       | Ranka       | F      | 1986-09-14 |
| 404839 | 1952-08-19 | Mary       | Masand      | F      | 1986-05-01 |
| 407489 | 1964-06-07 | Mary       | Carrere     | F      | 1993-01-29 |
| 410311 | 1960-05-15 | Mary       | Poujol      | F      | 1987-01-23 |
| 415883 | 1958-11-06 | Mary       | Koyama      | F      | 1988-07-31 |
| 423164 | 1960-06-24 | Mary       | Tokunaga    | F      | 1993-04-24 |
| 423386 | 1964-03-23 | Mary       | Stavenow    | F      | 1990-03-22 |
| 427560 | 1953-03-20 | Mary       | Burnard     | F      | 1990-05-29 |
| 427641 | 1953-02-27 | Mary       | Lamparter   | F      | 1992-05-18 |
| 434277 | 1953-11-02 | Mary       | Assaf       | F      | 1995-06-09 |
| 443029 | 1952-08-29 | Mary       | Bahk        | F      | 1990-02-12 |
| 443267 | 1956-03-09 | Mary       | Feinberg    | F      | 1986-04-05 |
| 446393 | 1957-10-03 | Mary       | Kornyak     | F      | 1994-05-17 |
| 451899 | 1964-07-21 | Mary       | Kaiser      | F      | 1987-03-15 |
| 459548 | 1952-05-01 | Mary       | Meszaros    | F      | 1986-12-26 |
| 459666 | 1959-03-22 | Mary       | Claffy      | F      | 1987-02-12 |
| 462039 | 1956-03-30 | Mary       | Yavatkar    | F      | 1985-10-19 |
| 462906 | 1953-11-17 | Mary       | Cronin      | F      | 1995-10-08 |
| 471069 | 1959-06-11 | Mary       | Grospietsch | F      | 1986-05-24 |
| 478996 | 1954-07-15 | Mary       | Conti       | F      | 1988-01-20 |
| 480956 | 1955-03-30 | Mary       | Delaune     | F      | 1989-01-01 |
| 491899 | 1957-01-16 | Mary       | Ananiadou   | F      | 1987-06-20 |
| 494905 | 1962-05-09 | Mary       | Kinley      | F      | 1985-06-24 |
| 495777 | 1958-06-25 | Mary       | Baba        | F      | 1994-07-18 |
+--------+------------+------------+-------------+--------+------------+
81 rows in set (0.23 sec)
```

## 8. または
> 従業員のうち、ファーストネームが Mary または ラストネームが Peck の人のデータを10行分取得してください。
- または: OR条件

```sql
SELECT * FROM employees WHERE first_name = 'Mary' OR last_name = 'Peck' L
IMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10011 | 1953-11-07 | Mary       | Sluis     | F      | 1990-01-22 |
|  10532 | 1959-08-31 | Mary       | Wossner   | F      | 1986-05-18 |
|  10664 | 1962-06-02 | Xumin      | Peck      | M      | 1989-12-24 |
|  10856 | 1964-03-13 | Sreenivas  | Peck      | F      | 1986-12-31 |
|  11821 | 1954-10-18 | Mary       | Piazza    | F      | 1995-12-13 |
|  12333 | 1964-05-01 | Gino       | Peck      | M      | 1990-09-20 |
|  12334 | 1962-03-08 | Mary       | Ertl      | F      | 1990-03-06 |
|  13562 | 1960-02-15 | Mary       | Cooley    | M      | 1986-02-24 |
|  13881 | 1956-08-14 | Mary       | Monarch   | F      | 1991-06-10 |
|  13924 | 1955-05-23 | Mary       | DasSarma  | F      | 1991-11-05 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.06 sec)
```

## 9. 含まれる
> 従業員のうち、従業員番号が 10011, 10021, 10031 のいずれかに合致する人のデータを取得してください。なお、OR 演算子は使用しないでください。
- IN演算子を使用。
- 含まれる: IN演算子。指定された複数の値に合致する行を抽出する。
```sql
SELECT * FROM employees WHERE emp_no IN (10011, 10021, 10031);
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10011 | 1953-11-07 | Mary       | Sluis     | F      | 1990-01-22 |
|  10021 | 1960-02-20 | Ramzi      | Erde      | M      | 1988-02-10 |
|  10031 | 1959-01-27 | Karsten    | Joslin    | M      | 1991-09-01 |
+--------+------------+------------+-----------+--------+------------+
3 rows in set (0.01 sec)
```

## 10. 従業員番号
> 従業員番号（emp_no）が20,000の人のファーストネームとラストネームを取得してください。
```sql
SELECT first_name, last_name FROM employees WHERE emp_no = 20000;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Jenwei     | Matzke    |
+------------+-----------+
1 row in set (0.01 sec)
```

## 11. 誕生日
> 誕生日が1959年1月の人のレコードを取得してください。

-  AND を使って複数の条件を結合する場合: 可読性を重視するのであれば、可能な限り()を使うことが推奨されてるらしい。
```sql
SELECT * FROM employees WHERE ( birth_date >= '1959-01-01' AND birth_date <= '1959-01-31' );

~
~
| 499956 | 1959-01-08 | Zhonghua      | Crooks           | F      | 1994-10-12 |
+--------+------------+---------------+------------------+--------+------------+
1981 rows in set (0.13 sec)
```
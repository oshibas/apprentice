# データを集計できる

## 1. 列の合計値
> 給与情報(salaries テーブル)から、全データの給与の合計値を求めてください。
- SUM(salary)
```sql
SELECT SUM(salary) FROM salaries;
+--------------+
| SUM(salary)  |
+--------------+
| 181480757419 |
+--------------+
1 row in set (0.50 sec)
```

## 2. 列の平均値
> 給与情報から、全データの給与の平均値を求めてください。
- 給与情報テーブル(salaries)のsalary列の平均値。
- AVG関数を使用して平均値を求める。

```sql
SELECT AVG(salary) FROM salaries;
+-------------+
| AVG(salary) |
+-------------+
|  63810.7448 |
+-------------+
```

## 3. 四捨五入
> 給与の平均値は小数点で取得されたかと思います。給与の平均値を四捨五入して整数で求めてください。
- ROUND関数を使用して整数値に丸める。

```sql
SELECT ROUND(AVG(salary)) FROM salaries;
+--------------------+
| ROUND(AVG(salary)) |
+--------------------+
|              63811 |
+--------------------+
1 row in set (0.37 sec)
```

## 4. 列の最大値
> 給与情報から、全データの給与の最大値を求めてください。
- MAX関数: salary列の最大値を取得。

```sql
SELECT MAX(salary) FROM salaries;
+-------------+
| MAX(salary) |
+-------------+
|      158220 |
+-------------+
1 row in set (0.35 sec)
```

## 5. 列の最小値
> 給与情報から、全データの給与の最小値を求めてください。
- MIN関数: salary列の最小値を取得。
```sql
SELECT MIN(salary) FROM salaries;
+-------------+
| MIN(salary) |
+-------------+
|       38623 |
+-------------+
1 row in set (0.35 sec)
```

## 6. 行数
> 給与情報から、全データの行数を求めてください。
- salariesテーブルに含まれる全行の数を求める。
- COUNT(*): *にマッチするすべての行を数える。
```sql
SELECT COUNT(*) FROM salaries;
+----------+
| COUNT(*) |
+----------+
|  2844047 |
+----------+
1 row in set (0.08 sec)
```

## 7. 絞り込みとの組み合わせ
> from_date が1986年6月26日の従業員の最大給与を取得してください。

```sql
SELECT MAX(salary) FROM salaries WHERE from_date = '1986-06-26';
+-------------+
| MAX(salary) |
+-------------+
|      103344 |
+-------------+
1 row in set (0.38 sec)
```

## 8. 少数第1桁
> to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得してください。
- salariesテーブルからto_dateが1991-06-26のレコードを取得。
- 給与の平均値を小数点以下1桁まで丸めて取得。
- ROUND関数を使い、第1引数に平均値を、第2引数に小数点以下の桁数を指定。
```sql
SELECT ROUND(AVG(salary), 1) FROM salaries WHERE to_date = '1991-06-26';
+-----------------------+
| ROUND(AVG(salary), 1) |
+-----------------------+
|               57371.6 |
+-----------------------+
1 row in set (0.37 sec)
```

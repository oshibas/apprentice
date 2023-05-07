# テーブルを結合できる
## 1. 内部結合
> 部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得してください。
- テーブルemployeesには、従業員の情報。従業員のID、名前、生年月日、雇用日など。
- テーブルdept_managerには、部門マネージャーの情報。従業員のID、所属する部署のID、雇用期間など。
- JOIN句: 2つのテーブルを結合する。従業員のID（emp_no）をキーとして、employeesテーブルとdept_managerテーブルをJOIN。
- SELECT *: 両方のテーブルからすべてのカラムを取得するために使用。
- JOIN条件: employeesテーブルとdept_managerテーブルのemp_noカラムが等しいことを指定。

```sql
SELECT * FROM employees JOIN dept_manager ON employees.emp_no = dept_manager.emp_no;
+--------+------------+-------------+--------------+--------+------------+--------+---------+------------+------------+
| emp_no | birth_date | first_name  | last_name    | gender | hire_date  | emp_no | dept_no | from_date  | to_date    |
+--------+------------+-------------+--------------+--------+------------+--------+---------+------------+------------+
| 110022 | 1956-09-12 | Margareta   | Markovitch   | M      | 1985-01-01 | 110022 | d001    | 1985-01-01 | 1991-10-01 |
| 110039 | 1963-06-21 | Vishwani    | Minakawa     | M      | 1986-04-12 | 110039 | d001    | 1991-10-01 | 9999-01-01 |
| 110085 | 1959-10-28 | Ebru        | Alpin        | M      | 1985-01-01 | 110085 | d002    | 1985-01-01 | 1989-12-17 |
| 110114 | 1957-03-28 | Isamu       | Legleitner   | F      | 1985-01-14 | 110114 | d002    | 1989-12-17 | 9999-01-01 |
| 110183 | 1953-06-24 | Shirish     | Ossenbruggen | F      | 1985-01-01 | 110183 | d003    | 1985-01-01 | 1992-03-21 |
| 110228 | 1958-12-02 | Karsten     | Sigstam      | F      | 1985-08-04 | 110228 | d003    | 1992-03-21 | 9999-01-01 |
| 110303 | 1956-06-08 | Krassimir   | Wegerle      | F      | 1985-01-01 | 110303 | d004    | 1985-01-01 | 1988-09-09 |
| 110344 | 1961-09-07 | Rosine      | Cools        | F      | 1985-11-22 | 110344 | d004    | 1988-09-09 | 1992-08-02 |
| 110386 | 1953-10-04 | Shem        | Kieras       | M      | 1988-10-14 | 110386 | d004    | 1992-08-02 | 1996-08-30 |
| 110420 | 1963-07-27 | Oscar       | Ghazalie     | M      | 1992-02-05 | 110420 | d004    | 1996-08-30 | 9999-01-01 |
| 110511 | 1957-07-08 | DeForest    | Hagimont     | M      | 1985-01-01 | 110511 | d005    | 1985-01-01 | 1992-04-25 |
| 110567 | 1964-04-25 | Leon        | DasSarma     | F      | 1986-10-21 | 110567 | d005    | 1992-04-25 | 9999-01-01 |
| 110725 | 1961-03-14 | Peternela   | Onuegbe      | F      | 1985-01-01 | 110725 | d006    | 1985-01-01 | 1989-05-06 |
| 110765 | 1954-05-22 | Rutger      | Hofmeyr      | F      | 1989-01-07 | 110765 | d006    | 1989-05-06 | 1991-09-12 |
| 110800 | 1963-02-07 | Sanjoy      | Quadeer      | F      | 1986-08-12 | 110800 | d006    | 1991-09-12 | 1994-06-28 |
| 110854 | 1960-08-19 | Dung        | Pesch        | M      | 1989-06-09 | 110854 | d006    | 1994-06-28 | 9999-01-01 |
| 111035 | 1962-02-24 | Przemyslawa | Kaelbling    | M      | 1985-01-01 | 111035 | d007    | 1985-01-01 | 1991-03-07 |
| 111133 | 1955-03-16 | Hauke       | Zhang        | M      | 1986-12-30 | 111133 | d007    | 1991-03-07 | 9999-01-01 |
| 111400 | 1959-11-09 | Arie        | Staelin      | M      | 1985-01-01 | 111400 | d008    | 1985-01-01 | 1991-04-08 |
| 111534 | 1952-06-27 | Hilary      | Kambil       | F      | 1988-01-31 | 111534 | d008    | 1991-04-08 | 9999-01-01 |
| 111692 | 1954-10-05 | Tonny       | Butterworth  | F      | 1985-01-01 | 111692 | d009    | 1985-01-01 | 1988-10-17 |
| 111784 | 1956-06-14 | Marjo       | Giarratana   | F      | 1988-02-12 | 111784 | d009    | 1988-10-17 | 1992-09-08 |
| 111877 | 1962-10-18 | Xiaobin     | Spinelli     | F      | 1991-08-17 | 111877 | d009    | 1992-09-08 | 1996-01-03 |
| 111939 | 1960-03-25 | Yuchang     | Weedman      | M      | 1989-07-10 | 111939 | d009    | 1996-01-03 | 9999-01-01 |
+--------+------------+-------------+--------------+--------+------------+--------+---------+------------+------------+
24 rows in set (0.03 sec)

```

## 2. 列の選択
> 部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
SELECT dept_manager.dept_no, dept_manager.emp_no, employees.first_name, employees.last_name FROM dept_manager JOIN employees ON dept_manager.emp_no = employees.emp_no;
+---------+--------+-------------+--------------+
| dept_no | emp_no | first_name  | last_name    |
+---------+--------+-------------+--------------+
| d001    | 110022 | Margareta   | Markovitch   |
| d001    | 110039 | Vishwani    | Minakawa     |
| d002    | 110085 | Ebru        | Alpin        |
| d002    | 110114 | Isamu       | Legleitner   |
| d003    | 110183 | Shirish     | Ossenbruggen |
| d003    | 110228 | Karsten     | Sigstam      |
| d004    | 110303 | Krassimir   | Wegerle      |
| d004    | 110344 | Rosine      | Cools        |
| d004    | 110386 | Shem        | Kieras       |
| d004    | 110420 | Oscar       | Ghazalie     |
| d005    | 110511 | DeForest    | Hagimont     |
| d005    | 110567 | Leon        | DasSarma     |
| d006    | 110725 | Peternela   | Onuegbe      |
| d006    | 110765 | Rutger      | Hofmeyr      |
| d006    | 110800 | Sanjoy      | Quadeer      |
| d006    | 110854 | Dung        | Pesch        |
| d007    | 111035 | Przemyslawa | Kaelbling    |
| d007    | 111133 | Hauke       | Zhang        |
| d008    | 111400 | Arie        | Staelin      |
| d008    | 111534 | Hilary      | Kambil       |
| d009    | 111692 | Tonny       | Butterworth  |
| d009    | 111784 | Marjo       | Giarratana   |
| d009    | 111877 | Xiaobin     | Spinelli     |
| d009    | 111939 | Yuchang     | Weedman      |
+---------+--------+-------------+--------------+
24 rows in set (0.07 sec)
```


## 3. 複数の内部結合
> 部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name FROM departments JOIN dept_manager ON departments.dept_no = dept_manager.dept_no JOIN employees ON dept_manager.emp_no = employees.emp_no;
+---------+--------------------+--------+-------------+--------------+
| dept_no | dept_name          | emp_no | first_name  | last_name    |
+---------+--------------------+--------+-------------+--------------+
| d009    | Customer Service   | 111692 | Tonny       | Butterworth  |
| d009    | Customer Service   | 111784 | Marjo       | Giarratana   |
| d009    | Customer Service   | 111877 | Xiaobin     | Spinelli     |
| d009    | Customer Service   | 111939 | Yuchang     | Weedman      |
| d005    | Development        | 110511 | DeForest    | Hagimont     |
| d005    | Development        | 110567 | Leon        | DasSarma     |
| d002    | Finance            | 110085 | Ebru        | Alpin        |
| d002    | Finance            | 110114 | Isamu       | Legleitner   |
| d003    | Human Resources    | 110183 | Shirish     | Ossenbruggen |
| d003    | Human Resources    | 110228 | Karsten     | Sigstam      |
| d001    | Marketing          | 110022 | Margareta   | Markovitch   |
| d001    | Marketing          | 110039 | Vishwani    | Minakawa     |
| d004    | Production         | 110303 | Krassimir   | Wegerle      |
| d004    | Production         | 110344 | Rosine      | Cools        |
| d004    | Production         | 110386 | Shem        | Kieras       |
| d004    | Production         | 110420 | Oscar       | Ghazalie     |
| d006    | Quality Management | 110725 | Peternela   | Onuegbe      |
| d006    | Quality Management | 110765 | Rutger      | Hofmeyr      |
| d006    | Quality Management | 110800 | Sanjoy      | Quadeer      |
| d006    | Quality Management | 110854 | Dung        | Pesch        |
| d008    | Research           | 111400 | Arie        | Staelin      |
| d008    | Research           | 111534 | Hilary      | Kambil       |
| d007    | Sales              | 111035 | Przemyslawa | Kaelbling    |
| d007    | Sales              | 111133 | Hauke       | Zhang        |
+---------+--------------------+--------+-------------+--------------+
24 rows in set (0.00 sec)
```

# 4. 絞り込み
> 部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

```sql
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name FROM departments JOIN dept_manager ON departments.dept_no = dept_manager.dept_no JOIN employees ON dept_manager.emp_no = employees.emp_no WHERE dept_manager.to_date = '9999-01-01';
+---------+--------------------+--------+------------+------------+
| dept_no | dept_name          | emp_no | first_name | last_name  |
+---------+--------------------+--------+------------+------------+
| d001    | Marketing          | 110039 | Vishwani   | Minakawa   |
| d002    | Finance            | 110114 | Isamu      | Legleitner |
| d003    | Human Resources    | 110228 | Karsten    | Sigstam    |
| d004    | Production         | 110420 | Oscar      | Ghazalie   |
| d005    | Development        | 110567 | Leon       | DasSarma   |
| d006    | Quality Management | 110854 | Dung       | Pesch      |
| d007    | Sales              | 111133 | Hauke      | Zhang      |
| d008    | Research           | 111534 | Hilary     | Kambil     |
| d009    | Customer Service   | 111939 | Yuchang    | Weedman    |
+---------+--------------------+--------+------------+------------+
9 rows in set (0.02 sec)
```


## 5. 給与
> 従業員番号10001から10010の従業員ごとに、ファーストネーム、ラストネーム、いつからいつまで給与がいくらだったかを取得してください。

```sql
SELECT employees.first_name, employees.last_name, salaries.from_date, salaries.to_date, salaries.salary FROM employees salaries ON employees.emp_no = salaries.emp_no WHERE employees.emp_no BETWEEN 10001 AND 10010;
+------------+-----------+------------+------------+--------+
| first_name | last_name | from_date  | to_date    | salary |
+------------+-----------+------------+------------+--------+
| Georgi     | Facello   | 1986-06-26 | 1987-06-26 |  60117 |
| Georgi     | Facello   | 1987-06-26 | 1988-06-25 |  62102 |
| Georgi     | Facello   | 1988-06-25 | 1989-06-25 |  66074 |
| Georgi     | Facello   | 1989-06-25 | 1990-06-25 |  66596 |
| Georgi     | Facello   | 1990-06-25 | 1991-06-25 |  66961 |
| Georgi     | Facello   | 1991-06-25 | 1992-06-24 |  71046 |
| Georgi     | Facello   | 1992-06-24 | 1993-06-24 |  74333 |
| Georgi     | Facello   | 1993-06-24 | 1994-06-24 |  75286 |
| Georgi     | Facello   | 1994-06-24 | 1995-06-24 |  75994 |
| Georgi     | Facello   | 1995-06-24 | 1996-06-23 |  76884 |
| Georgi     | Facello   | 1996-06-23 | 1997-06-23 |  80013 |
| Georgi     | Facello   | 1997-06-23 | 1998-06-23 |  81025 |
| Georgi     | Facello   | 1998-06-23 | 1999-06-23 |  81097 |
| Georgi     | Facello   | 1999-06-23 | 2000-06-22 |  84917 |
| Georgi     | Facello   | 2000-06-22 | 2001-06-22 |  85112 |
| Georgi     | Facello   | 2001-06-22 | 2002-06-22 |  85097 |
| Georgi     | Facello   | 2002-06-22 | 9999-01-01 |  88958 |
| Bezalel    | Simmel    | 1996-08-03 | 1997-08-03 |  65828 |
| Bezalel    | Simmel    | 1997-08-03 | 1998-08-03 |  65909 |
| Bezalel    | Simmel    | 1998-08-03 | 1999-08-03 |  67534 |
| Bezalel    | Simmel    | 1999-08-03 | 2000-08-02 |  69366 |
| Bezalel    | Simmel    | 2000-08-02 | 2001-08-02 |  71963 |
| Bezalel    | Simmel    | 2001-08-02 | 9999-01-01 |  72527 |
| Parto      | Bamford   | 1995-12-03 | 1996-12-02 |  40006 |
| Parto      | Bamford   | 1996-12-02 | 1997-12-02 |  43616 |
| Parto      | Bamford   | 1997-12-02 | 1998-12-02 |  43466 |
| Parto      | Bamford   | 1998-12-02 | 1999-12-02 |  43636 |
| Parto      | Bamford   | 1999-12-02 | 2000-12-01 |  43478 |
| Parto      | Bamford   | 2000-12-01 | 2001-12-01 |  43699 |
| Parto      | Bamford   | 2001-12-01 | 9999-01-01 |  43311 |
| Chirstian  | Koblick   | 1986-12-01 | 1987-12-01 |  40054 |
| Chirstian  | Koblick   | 1987-12-01 | 1988-11-30 |  42283 |
| Chirstian  | Koblick   | 1988-11-30 | 1989-11-30 |  42542 |
| Chirstian  | Koblick   | 1989-11-30 | 1990-11-30 |  46065 |
| Chirstian  | Koblick   | 1990-11-30 | 1991-11-30 |  48271 |
| Chirstian  | Koblick   | 1991-11-30 | 1992-11-29 |  50594 |
| Chirstian  | Koblick   | 1992-11-29 | 1993-11-29 |  52119 |
| Chirstian  | Koblick   | 1993-11-29 | 1994-11-29 |  54693 |
| Chirstian  | Koblick   | 1994-11-29 | 1995-11-29 |  58326 |
| Chirstian  | Koblick   | 1995-11-29 | 1996-11-28 |  60770 |
| Chirstian  | Koblick   | 1996-11-28 | 1997-11-28 |  62566 |
| Chirstian  | Koblick   | 1997-11-28 | 1998-11-28 |  64340 |
| Chirstian  | Koblick   | 1998-11-28 | 1999-11-28 |  67096 |
| Chirstian  | Koblick   | 1999-11-28 | 2000-11-27 |  69722 |
| Chirstian  | Koblick   | 2000-11-27 | 2001-11-27 |  70698 |
| Chirstian  | Koblick   | 2001-11-27 | 9999-01-01 |  74057 |
| Kyoichi    | Maliniak  | 1989-09-12 | 1990-09-12 |  78228 |
| Kyoichi    | Maliniak  | 1990-09-12 | 1991-09-12 |  82621 |
| Kyoichi    | Maliniak  | 1991-09-12 | 1992-09-11 |  83735 |
| Kyoichi    | Maliniak  | 1992-09-11 | 1993-09-11 |  85572 |
| Kyoichi    | Maliniak  | 1993-09-11 | 1994-09-11 |  85076 |
| Kyoichi    | Maliniak  | 1994-09-11 | 1995-09-11 |  86050 |
| Kyoichi    | Maliniak  | 1995-09-11 | 1996-09-10 |  88448 |
| Kyoichi    | Maliniak  | 1996-09-10 | 1997-09-10 |  88063 |
| Kyoichi    | Maliniak  | 1997-09-10 | 1998-09-10 |  89724 |
| Kyoichi    | Maliniak  | 1998-09-10 | 1999-09-10 |  90392 |
| Kyoichi    | Maliniak  | 1999-09-10 | 2000-09-09 |  90531 |
| Kyoichi    | Maliniak  | 2000-09-09 | 2001-09-09 |  91453 |
| Kyoichi    | Maliniak  | 2001-09-09 | 9999-01-01 |  94692 |
| Anneke     | Preusig   | 1990-08-05 | 1991-08-05 |  40000 |
| Anneke     | Preusig   | 1991-08-05 | 1992-08-04 |  42085 |
| Anneke     | Preusig   | 1992-08-04 | 1993-08-04 |  42629 |
| Anneke     | Preusig   | 1993-08-04 | 1994-08-04 |  45844 |
| Anneke     | Preusig   | 1994-08-04 | 1995-08-04 |  47518 |
| Anneke     | Preusig   | 1995-08-04 | 1996-08-03 |  47917 |
| Anneke     | Preusig   | 1996-08-03 | 1997-08-03 |  52255 |
| Anneke     | Preusig   | 1997-08-03 | 1998-08-03 |  53747 |
| Anneke     | Preusig   | 1998-08-03 | 1999-08-03 |  56032 |
| Anneke     | Preusig   | 1999-08-03 | 2000-08-02 |  58299 |
| Anneke     | Preusig   | 2000-08-02 | 2001-08-02 |  60098 |
| Anneke     | Preusig   | 2001-08-02 | 9999-01-01 |  59755 |
| Tzvetan    | Zielinski | 1989-02-10 | 1990-02-10 |  56724 |
| Tzvetan    | Zielinski | 1990-02-10 | 1991-02-10 |  60740 |
| Tzvetan    | Zielinski | 1991-02-10 | 1992-02-10 |  62745 |
| Tzvetan    | Zielinski | 1992-02-10 | 1993-02-09 |  63475 |
| Tzvetan    | Zielinski | 1993-02-09 | 1994-02-09 |  63208 |
| Tzvetan    | Zielinski | 1994-02-09 | 1995-02-09 |  64563 |
| Tzvetan    | Zielinski | 1995-02-09 | 1996-02-09 |  68833 |
| Tzvetan    | Zielinski | 1996-02-09 | 1997-02-08 |  70220 |
| Tzvetan    | Zielinski | 1997-02-08 | 1998-02-08 |  73362 |
| Tzvetan    | Zielinski | 1998-02-08 | 1999-02-08 |  75582 |
| Tzvetan    | Zielinski | 1999-02-08 | 2000-02-08 |  79513 |
| Tzvetan    | Zielinski | 2000-02-08 | 2001-02-07 |  80083 |
| Tzvetan    | Zielinski | 2001-02-07 | 2002-02-07 |  84456 |
| Tzvetan    | Zielinski | 2002-02-07 | 9999-01-01 |  88070 |
| Saniya     | Kalloufi  | 1998-03-11 | 1999-03-11 |  46671 |
| Saniya     | Kalloufi  | 1999-03-11 | 2000-03-10 |  48584 |
| Saniya     | Kalloufi  | 2000-03-10 | 2000-07-31 |  52668 |
| Sumant     | Peac      | 1985-02-18 | 1986-02-18 |  60929 |
| Sumant     | Peac      | 1986-02-18 | 1987-02-18 |  64604 |
| Sumant     | Peac      | 1987-02-18 | 1988-02-18 |  64780 |
| Sumant     | Peac      | 1988-02-18 | 1989-02-17 |  66302 |
| Sumant     | Peac      | 1989-02-17 | 1990-02-17 |  69042 |
| Sumant     | Peac      | 1990-02-17 | 1991-02-17 |  70889 |
| Sumant     | Peac      | 1991-02-17 | 1992-02-17 |  71434 |
| Sumant     | Peac      | 1992-02-17 | 1993-02-16 |  74612 |
| Sumant     | Peac      | 1993-02-16 | 1994-02-16 |  76518 |
| Sumant     | Peac      | 1994-02-16 | 1995-02-16 |  78335 |
| Sumant     | Peac      | 1995-02-16 | 1996-02-16 |  80944 |
| Sumant     | Peac      | 1996-02-16 | 1997-02-15 |  82507 |
| Sumant     | Peac      | 1997-02-15 | 1998-02-15 |  85875 |
| Sumant     | Peac      | 1998-02-15 | 1999-02-15 |  89324 |
| Sumant     | Peac      | 1999-02-15 | 2000-02-15 |  90668 |
| Sumant     | Peac      | 2000-02-15 | 2001-02-14 |  93507 |
| Sumant     | Peac      | 2001-02-14 | 2002-02-14 |  94443 |
| Sumant     | Peac      | 2002-02-14 | 9999-01-01 |  94409 |
| Duangkaew  | Piveteau  | 1996-11-24 | 1997-11-24 |  72488 |
| Duangkaew  | Piveteau  | 1997-11-24 | 1998-11-24 |  74347 |
| Duangkaew  | Piveteau  | 1998-11-24 | 1999-11-24 |  75405 |
| Duangkaew  | Piveteau  | 1999-11-24 | 2000-11-23 |  78194 |
| Duangkaew  | Piveteau  | 2000-11-23 | 2001-11-23 |  79580 |
| Duangkaew  | Piveteau  | 2001-11-23 | 9999-01-01 |  80324 |
+------------+-----------+------------+------------+--------+
112 rows in set (0.07 sec)
```


## 6. 内部結合と外部結合の違い
> INNER JOIN と OUTER JOIN の違いについて、SQL 初心者にわかるように説明してください。またどのように使い分けるのかも合わせて説明してください。

### JOIN
- データベースの結合。2つ以上のテーブルを組み合わせて、あたかも1つのテーブルのように取り扱う操作。
- 結合方法: 主にINNER JOIN と OUTER JOINの２通りで行われる。
- 結合の条件: 結合させたい各テーブルが、共通の値を持つこと。（共通のIDなど）
- その他の結合に LEFT JOIN, RIGHT JOIN, FULL JOINがある。

### INNER JOIN（内部結合）
- 複数のテーブルのデータで、結合できた結果をだけを表示する。
- 使い分け:  <b>結合できたデータだけを表示したい場合に使う。</b>

### OUTER JOIN（外部結合）
- 複数のテーブルのデータを結合の可否に関わらず結合先のデータを全て表示する。
- 使い分け: <b>結合に関わらずデータを全て表示したい場合に使う。</b>

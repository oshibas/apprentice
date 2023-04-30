# シェルスクリプトを書くことができる
## 1. Hello
> シェルスクリプトのファイルを作成し、「Hello!」と出力してください。なお、シェルスクリプトを実行する際にはファイルに実行権限が付与されている必要があることに気を付けてください。

```md
# シェルスクリプトのファイルを作成
touch hello.sh

# hello.sh ファイルに実行権限を付与
chmod +x hello.sh

# hello.sh ファイルを開き、以下のコマンドを入
echo "Hello!"

# hello.sh ファイルを保存して閉じる
# ターミナルで以下のコマンドを実行
./hello.sh
```

## 2. 標準入力から値を受け取る
> シェルスクリプトのファイルに「What's your name?」と出力し、ユーザーに名前の入力を求めます。その後ユーザーが入力した名前に対して、「Welcome, $name!」（$name は入力された名前）と出力する処理を追加してください。

```ubuntu
# test.sh ファイルを作成
#!/bin/bash
echo "What's your name?"
read name
echo "Welcome, $name!"

# test.sh ファイルに実行権限を付与
chmod +x test.sh

# test.shファイルを実行
./test.sh
What's your name?
saori
Welcome, saori!
```

## 3. 条件分岐
>四則演算を行う電卓を作成してください。実行すると以下の挙動になります。

```ubuntu
Enter two numbers:
10 # ユーザーが入力
11 # ユーザーが入力
Choose an arithmetic operation (+, -, *, /):
+ # ユーザーが入力
The result:21
```
> なお、割り算の時の割る数が 0 であるケースや、演算子の記号 +, -, *, / が合致しないケースを考慮するかは任意とします。

```ubuntu
# math.shファイルを作成

#!/bin/bash
echo "Enter two numbers:"
read num1
read num2
echo "Choose an arithmetic operation (+, -, *, /):"
read op
case $op in
    +) echo "The result:" $(($num1 + $num2));;
    -) echo "The result:" $(($num1 - $num2));;
    \*) echo "The result:" $(($num1 * $num2));;
    /) echo "The result:" $(($num1 / $num2));;
    *) echo "Invalid operator";;
esac # case文の終了を示すために使用されるキーワード
```
```md
# 実行権限を付与
chmod +x math.sh
#ファイルを実行
./math.sh
```

## 1. 繰り返し処理
> for 文 または while 文を利用して、1~100までのうち、偶数の数字を表示する処理を書いてください。以下の結果が出力されます。
```ubuntu
2 4 8 ... 100
```

```ubuntu

# for.shファイルに以下を記述

#!/bin/bash
# 1~100までの数字を順番に変数「i」に代入
# 偶数かどうかを判定。
for i in {1..100}
do
    if [ $(($i % 2)) -eq 0 ]
    then
        # 偶数であれば、その数字を表示
        echo $i
    fi
done
```
```md
# 実行権限を付与
chmod +x for.sh

# ファイルを実行
./for.sh

# コンソールにて確認
2
4
6
8
...
100
```

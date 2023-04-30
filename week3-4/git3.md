# GitHub を使って開発を進めることができる
## 1. リモートリポジトリ
> GitHub 上に新規リポジトリを作成してください。
```ubuntu
新規リポジトリ
git test
```

## 2. プッシュ
> ローカルの PC 上に GitHub 上で作成したリポジトリの同じ名前のディレクトリを作成し、そのディレクトリ内に README.md　ファイルを作成してください。
```ubuntu
/Users/ooshibasaori/git_test
touch README.md
```
> 次に、ローカルリポジトリを新規作成し、変更をステージに追加、コミットしてください。
```ubuntu
ローカルリポジトリ：git_test.git
git init
git add .
git commit -m "Initial commit
```
> リモートリポジトリを登録してください。そして GitHub に変更をプッシュしてください。
```ubuntu
git remote add origin <リポジトリのURL>
git push origin main
```
3. 追加の変更をプッシュ
> README.md に変更を追加してください。そしてその変更を GitHub にプッシュしてください。
```ubuntu
git add README.md
git commit -m "Update README"
git push origin main
```
4. クローン
> GitHub 上にある他者が作成したリポジトリを自分の PC 上にクローンしてください。クローン対象は何でも良いです。
```ubuntu
# 今回は練習用の公開リポジトリをクローン
cd github-practice
# git clone <リポジトリのURL>
git clone https://github.com/mollifier/github-practice.git
# ローカルにクローンされた
```

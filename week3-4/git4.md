# ブランチを利用して開発を進めることができる
> Git で管理されているディレクトリに移動してください。
```ubuntu

```
## 1. ブランチの新規作成
> feature という名前のブランチを新規作成してください。
```ubuntu
git branch feature

```
## 2. ブランチの切り替え
> ローカルリポジトリのブランチを feature ブランチに切り替えてください。
```ubuntu
git checkout feature

```
## 3. マージ
> feature ブランチでファイルの変更を行い、コミットしてください。そしてローカルリポジトリのブランチを main ブランチに切り替えてください。
```ubuntu
# test.mdを作成、修正
git add .
git commit -m "Feature changes"

```
> 次に、feature ブランチの変更を main ブランチに取り込んでください。なお、他のブランチの変更を取り込むことをマージと言います。
```ubuntu
git checkout main
git merge feature

```
# 4. ブランチの名前の変更
> feature ブランチの名前を rename という名前に変更してください。
```ubuntu
git branch -m feature rename

```
## 5. ブランチの削除
> rename ブランチを削除してください。
```ubuntu
git branch -d rename

```

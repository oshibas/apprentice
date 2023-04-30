# 変更状況を確認できる
> Git で管理されているディレクトリに移動してください。
> 任意のファイルに何らかの変更を追加してください。

```ubuntu
# ディレクトリに移動
cd git_practice
# ファイル内容を変更
vim README.md # Helloを追記
```

## 1. 変更状況の確認
> 現在何のファイルが変更されているかを確認してください。
```ubuntu
# 変更状況を確認
git status
#
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   README.md


```

## 2. 変更内容の確認
> 何が変更されたか、変更内容を確認してください。
```ubuntu
cd git_practice
vim README.md
```

## 3. 変更履歴
> 変更の履歴（ログ）を確認してください。
```ubuntu

```

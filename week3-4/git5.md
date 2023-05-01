# GitHub フローに従って開発を進めることができる
> GitHub にプッシュをしたことのあるローカルリポジトリ（自分の PC 上のディレクトリ）に移動してください。
```ubuntu
cd /git_test
```
## 1. プルリクエストとは
> プルリクエストは何か、何のためにあるかをプログラミング初心者にわかるように説明してください。
```ubuntu
プルリクエスト（プルリク）とは何か？：既存のコードに、他者が新たな修正コード依頼するしくみ。GitHub というバージョン管理ツールの機能。

何のためにあるのか？：
1. 品質管理: プログラムの改善を行い、コードの安定性を向上させる。
2. バグの修正：他のエンジニアが変更内容をレビューすることで、バグを発見・修正できる。
3. コミュニケーション：複数人でレビューを行い、コードに関する意見を共有できる。
4. 学習の機会：他のエンジニアからのコメントを通じて、自身のコーディングスキルを向上できる。
5. 通知機能：GitHubが、コードの修正や作業内容などを関係者に通知する。
6. 作業漏れを防ぐ：ソースコードの変更箇所をわかりやすく表示し、修正や作業の漏れを防ぐ。

ワークフロー：
1. 担当者 => 「作業用ブランチ」にて、ソースコードの変更を行う。
* 作業用ブランチ：メインの作業スペースから枝分かれさせているから「ブランチ」。一時的なプライベートの作業スペースで、担当者が自由に開発を行うための環境。

2. 担当者 => 変更内容をレビュアーに送るための依頼を作成。

3. レビュアー => 変更差分を確認し、コードの品質やバグの有無、セキュリティ上の懸念などを評価。必要に応じてコメントやフィードバックを残す。

4. 担当者 => 上記を確認し、必要な修正や変更を行う。

5. レビュアーが変更差分を承認した場合：担当者は変更を「開発用ブランチ」にマージ（統合）する。
* 開発用ブランチ：チーム内のメンバーでコードを共有する作業スペース。

6. マージ完了後：必要に応じて「公開用ブランチ」に変更をマージする。
* 公開用ブランチ：ソフトウェアのリリースに使用される安定したコードを、一般公開するスペース。リリース前の最終的な調整が行われる。


```
## 2. プルリクエストの作成
>以下のことを行い、プルリクエストを作成してください。

> ローカル（自分の PC ）で pullrequest ブランチを新規作成し、切り替えてください
```ubuntu
# ブランチを新規作成
git branch pullrequest

# ブランチの切り替え
git checkout pullrequest
```
> 任意のファイルに変更を行ってください
```ubuntu
test.md
```
> 変更をコミットしてください
```ubuntu
git add test.md
git commit -m "test"

[pullrequest 112c3d9] test
 1 file changed, 1 insertion(+)
 create mode 100644 week1-2/test.md
```
> GitHub に pullrequest というブランチ名で変更をプッシュしてください
```ubuntu
git push origin pullrequest

Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 408 bytes | 408.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote:
remote: Create a pull request for 'pullrequest' on GitHub by visiting:
remote:      https://github.com/oshibas/appentice_practice/pull/new/pullrequest
remote:
To github.com:oshibas/appentice_practice.git
 * [new branch]      pullrequest -> pullrequest
```
> GitHub を開き、pullrequest ブランチから main ブランチへのプルリクエストを作成してください
```ubuntu
GitHub上でプルリクエストを作成する
GitHubのリポジトリページにアクセスし、pullrequestブランチに切り替える。
"Compare & pull request"（比較してプルリクエスト）ボタンをクリック。
プルリクエストのタイトルや説明を入力し、変更内容を確認。
問題がなければ、"Create pull request"（プルリクエストの作成）ボタンをクリック。
```
> 変更内容を確認し、問題なければ GitHub 上で変更をマージしてください
```ubuntu
プルリクエストページで変更内容を確認。
問題がなければ、"Merge pull request"（プルリクエストのマージ）ボタンをクリック。
```
> GitHub 上の pullrequest ブランチを削除してください
```ubuntu
プルリクエストがマージされたら、GitHub上でpullrequestブランチを削除。
Pull request successfully merged and closed
You’re all set—the pullrequest branch can be safely deleted.
- Delete branch をクリック。
```
## ３. ローカルへのリポートリポジトリの変更内容の取り込み
> ローカルリポジトリのブランチを main ブランチに切り替えてください。
```ubuntu
git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
```
> 次に、リモートリポジトリ（GitHub）の main ブランチの内容をローカルリポジトリの main ブランチに取り込んでください。
```ubuntu


```
> それができたらローカルリポジトリの pullrequest ブランチを削除してください。
```ubuntu


```
> ※開発を行う際はここから1に戻り、この1~2のステップを繰り返します

## 4. GitHub フロー
> GitHub フロー の公式リファレンスを一読してください。

> その上で、今後の開発は GitHub フローに基づいて行ってください。多くの組織における基本的な開発フローは GitHub フローもしくは GitHub フローをベースにしたものになります。今から GitHub フローに慣れていきましょう。

RealWorld
# Introduction

- RealWorldの[イントロ](https://realworld-docs.netlify.app/docs/intro/)の対訳です。
- 原文（英語）と対訳は灰色の引用で表示します。
- 注釈は *1 のように表示します。


See how the exact same Medium.com clone (called Conduit) is built using different frontends and backends. Yes, you can mix and match them, because they all adhere to the same API spec 😮😎

全く同じMedium.comクローン（Conduitと呼ばれる）が、異なるフロントエンドとバックエンドを使ってどのように構築されているかを見てみましょう。これらはすべて同じAPI仕様に準拠しているため、混在させることができます😮😎


While most "todo" demos provide an excellent cursory glance at a framework's capabilities, they typically don't convey the knowledge & perspective required to actually build real applications with it.

多くの「Todo」デモは、フレームワークの機能をざっと見るには最適ですが、実際にそのフレームワークを使ってアプリケーションを構築するために必要な知識や視点は、一般的に伝えられません。


RealWorld solves this by allowing you to choose any frontend (React, Angular, & more) and any backend (Node, Django, & more) and see how they power a real world, beautifully designed fullstack app called Conduit.

RealWorldでは、フロントエンド（React、Angularなど）とバックエンド（Node、Djangoなど）を自由に選択し、それらがConduitという現実世界の美しいデザインのフルスタックアプリをどのように動かしているかを見ることができるので、これ *1 を解決します。

```
*1 : 何を解決するって？「これを解決します」とは、実際のアプリケーション開発において必要な知識や視点を提供し、フレームワークやプラットフォームの機能をより実践的な形で理解できるようにするという意味です。
```

Read the full blog post announcing RealWorld on Medium.

RealWorldを発表したブログ記事の全文はMediumでご覧ください。

Join us on GitHub Discussions! 🎉

## Implementations
Over 150 implementations have been created using various languages, libraries, and frameworks.

Explore them on CodebaseShow.

実装
様々な言語、ライブラリ、フレームワークを使って、150以上の実装が作成されています。

CodebaseShowでご覧ください。


## Create a new implementation
Create a new implementation >>>

Or you can view upcoming implementations (WIPs).

## Learn more
- "Introducing RealWorld 🙌" by Eric Simons
- Every tutorial is built against the same API spec to ensure modularity of every frontend & backend
- Every frontend utilizes the same hand crafted Bootstrap 4 theme for identical UI/UX
- There is a hosted version of the backend API available for public usage, no API keys are required
- Interested in creating a new RealWorld stack? View our starter guide & spec

## もっと詳しく
- "リアルワールドの紹介🙌" by Eric Simons
- すべてのチュートリアルは、フロントエンドとバックエンドのモジュール性を確保するために、同じAPI仕様で作られています。
- すべてのフロントエンドは、同一のUI/UXを実現するために、同じ手作りのBootstrap 4テーマを使用しています。
- バックエンドのAPIは、APIキーが不要なホスティング版が公開されています。
- 新しいRealWorldスタックを作ることに興味がありますか？スターターガイドと仕様書をご覧ください。Thinksterによって提供されています。

# Implementation Creation

- RealWorldの[実装クリエーション](https://realworld-docs.netlify.app/docs/implementation-creation/introduction)の対訳です。

## Introduction

Conduit is a social blogging site (i.e. a Medium.com clone). It uses a custom API for all requests, including authentication. Discover our live demo.

TIP
Check for Discussions about works in progress as we don't list duplicate projects.
An opportunity to collaborate might awaits you already.

Otherwise:

fork our starter kit
Read the followings sections: expectations and features for a better understanding of this project
Read the frontend and/or the backend specs
Submit the new implementation on CodebaseShow
Happy coding!

## はじめに
Conduitはソーシャルブログサイト（つまりMedium.comのクローン）です。認証も含め、すべてのリクエストにカスタムAPIを使用しています。私たちのライブデモをご覧ください。

ヒント
重複するプロジェクトはリストアップしないので、進行中の作品についてのディスカッションをチェックしてください。
コラボレーションする機会があなたを待っているかもしれません。

それ以外の場合は:

スターターキットを購入する
このプロジェクトをよりよく理解するために、次のセクションを読んでください: 期待と特徴
フロントエンドやバックエンドの仕様を読んでください。
新しい実装をCodebaseShowに投稿してください。
ハッピーコーディング！

# Expectations
Remember: Keep your codebases simple, yet robust.
If a new developer to your framework comes along and takes longer than 10 minutes to grasp the high-level architecture, it's likely that you went a little overboard in the engineering department.

Alternatively, you should never forgo following fundamental best practices for the sake of simplicity, lest we teach that same newbie dev the wrong way of doing things.

The quality & architecture of Conduit implementations should reflect something similar to an early-stage startup's MVP: functionally complete & stable, but not unnecessarily over-engineered.

To write tests, or to not write tests?
TL;DR — we require a minimum of one unit test with every repo, but we'd definitely prefer all of them to include excellent testing coverage if the maintainers are willing to add it (or if someone in the community is kind enough to make a pull request :)

We believe that tests are a good concept, and we are big supporters of TDD in general. Building Conduit implementations without complete testing coverage, on the other hand, is a significant time commitment in and of itself, therefore we didn't include it in the spec at first since we believed that if people wanted it, it would be a fantastic "extra credit" aim for the repo. For example, a request for unit tests was made in our Angular 2 repo, and several fantastic community members are presently working on a PR to address it.

Another reason we didn’t include them in the spec is from the "Golden Rule" above:

The quality & architecture of Conduit implementations should reflect something similar to an early-stage startup's MVP: functionally complete & stable, but not unnecessarily over-engineered.

Most startups we know that work in consumer-facing apps (like Conduit) don’t apply TDD/testing until they have a solid product-market fit, which is smart because they then spend most of their time iterating on product & UI and thus are far more likely to find PMF.

This doesn’t mean that TDD/testing === over-engineering, but in certain circumstances that statement does evaluate true (ex: consumer product finding PMF, side-projects, robust prototypes, etc).

That said, we do prefer that every repo includes excellent tests that are exemplary of TDD/testing with that framework 👍

Other Expectations
All the required features (see specs) should be implemented.
You should publish your implementation on a dedicated GitHub repository with the "Issues" section open.
You should provide a README that presents an overview of your implementation and explains how to run it locally.
The library/framework you are using should have at least 300 GitHub stars.
You should do your best to keep your implementation up to date.

# 期待すること
忘れないでください： コードベースはシンプルに、かつ堅牢に保ちましょう。
もし、あなたのフレームワークに新しく参加した開発者が、高レベルのアーキテクチャを理解するのに10分以上かかるとしたら、それはあなたがエンジニアリング部門で少しやり過ぎたのかもしれません。

基本的なベストプラクティスに従いましょう。新人に間違ったやり方を伝えないようにね👶

Conduitの実装の品質とアーキテクチャは、アーリーステージのスタートアップのMVPと同じように、機能的に安定しています。

## テストを書くべきか、書かないべきか？
私たちは、すべてのレポに最低1つのユニットテストを要求していますが、もしメンテナが追加してくれるなら（あるいはコミュニティの誰かが親切にもプルリクエストをしてくれるなら）、すべてのレポに優れたテストカバレッジを含めることを強く希望しています 🐤

私たちはテストは良い概念だと信じています。しかし、テストを完全にカバーせずにConduitの実装を構築することは、時間的な負担になります。したがって、私たちは当初、テストを仕様に含めませんでした。例えば、Angular 2のレポでユニットテストの要望があり、現在数人の素晴らしいコミュニティメンバーがそれに対応するPRを作成しています。

仕様に含めなかったもう1つの理由は、上記の「ゴールデンルール」からです：

Conduitの実装の品質とアーキテクチャは、機能的に完全で安定していますが、過剰にエンジニアリングされていないものを反映する必要があります。

私たちが知っている消費者向けアプリ（Conduitのような）を扱うスタートアップのほとんどは、製品・市場浸透が固まるまでTDD/テストを適用しません。これは賢い方法です。彼らは製品とUIの反復にほとんどの時間を費やすため、PMFを発見する可能性がはるかに高くなります。

これは、TDD/テスト==オーバーエンジニアリングという意味ではありませんが、特定の状況下では、この言葉は真実と評価されます（例：PMFを見つける消費者製品、サイドプロジェクト、堅牢なプロトタイプなど）。

とはいえ、すべてのレポにそのフレームワークを使ったTDD/テストの模範となるような優れたテストが含まれていることが望ましいです👍

## その他 期待すること
必要な機能（仕様書参照）はすべて実装されている必要があります。
実装はGitHubの専用リポジトリで公開し、「Issues」セクションをオープンにしてください。
実装の概要とローカルでの実行方法を説明したREADMEを提供する必要があります。
あなたが使用しているライブラリ/フレームワークは、少なくとも300のGitHubスターを持っている必要があります。
あなたの実装を最新の状態に保つために最善を尽くしてください。

# Features
General functionality:

- Authenticate users via JWT (login/signup pages + logout button on settings page)
- CRU- users (sign up & settings page - no deleting required)
- CRUD Articles
- CR-D Comments on articles (no updating required)
- GET and display paginated lists of articles
- Favorite articles
- Follow other users

# 特徴
一般的な機能

- JWTによるユーザー認証（ログイン／サインアップページ＋設定ページのログアウトボタン）
- CRU-ユーザー（サインアップと設定ページ - 削除の必要なし）
- CRUD 記事
- CR-D 記事へのコメント（更新の必要なし）
- 記事一覧のGETとページ分割表示
- 記事のお気に入り登録
- 他のユーザーをフォローする

# MVC について説明できる

# 1. MVC とは

MVC とは何か、プログラミング初心者にわかるように説明してください。その際に、MVC がなぜ必要なのか、Model とは何か、View とは何か、Controller とは何かも合わせて説明してください。

<br>

# 回答

## MVCって何？

アプリケーションの設定を整理するための「概念」です。Webフレームワークで一般的に取り入れられています。

Model（モデル）-View（ビュー）-Controller（コントローラー）の略語です。「M＝モデル」、「V=ビュー」、「C＝コントローラー」、それぞれの頭文字をとり「MVC」と呼びます。

<br>

## MVCを使うメリットは？

- 各エンジニアが役割分担しながら開発、保守を行いやすくなるため、効率化が図れます。
- 変更時の作業が軽くなります。
- コードを再利用しやすいです。
- 機能を分割できます。

<br>

## なぜ必要なの？

以下の理由から、MVCはWebアプリケーション開発において必要とされています。

- MVCは、それぞれの機能が独立しているため、アプリケーションの保守性や拡張性が高くなります。
- 開発チームが複数人いる場合でも、各々の担当領域を明確にすることができます。専門性の高い業務を分けることで、作業効率とクオリティーの向上が期待されます。

<br>

## MVCの役割は？

- データベースと連携しデータ処理を行うModel
- ユーザーが入出力を行う画面を生成するView
- ViewとModelを制御するController

### Model（モデル）：
システムの本体部分にあたります。アプリケーションのデータや処理を行います。システムの中でビジネスロジックを担当。

### View（ビュー）
画面を表示したり、入力する機能の処理を行います。例えば、Webブラウザに表示するHTMLを動的に生成します。

### Controller（コントローラ）
ユーザーの入力を受け取り、モデルとビューを制御します。Viewからの入力に応じて、必要なロジックの実行をModelに依頼し、その結果表示をViewに依頼します。

<br>

## MVCの役割を図で表すと？

![Alt text](https://atmarkit.itmedia.co.jp/fjava/javafaq/j2ee/faq4.gif)

<br>

## MVCを使ったアプリケーション開発手順

MVCの前に、「ルーティング」という概念を理解する必要があります。
ルーティングは、URLとコントローラのアクションを紐付ける仕組みです。

ブラウザからサーバーへ送られてきたURLをもとに、サーバー側でどの部分のどの処理を実施すればいいか判断する機能です。

![Alt text](https://read-engineer.com/wp-content/uploads/2020/07/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2020-07-24-18.28.09.png)

<br>

1. Modelの作成：アプリケーションのデータを定義するModelを作成。データベースへのアクセスやデータの操作を担当します。

![Alt text](https://read-engineer.com/wp-content/uploads/2020/07/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2020-07-24-18.36.01.png)

<br>

2. Viewの作成：表示する画面のUIを設計し、Viewを作成。ユーザーが操作するUI部分を担当します。

![Alt text](https://read-engineer.com/wp-content/uploads/2020/07/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2020-07-24-18.44.41.png)

<br>

3. Controllerの作成：ViewとModelを制御するControllerを作成。Controllerは、ユーザーからの入力を受け取り、ModelとViewを制御します。

![Alt text](https://read-engineer.com/wp-content/uploads/2020/07/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2020-07-24-19.02.53.png)

<br>

## 参考サイト

[@ IT MVCモデルとは何ですか・・・](https://atmarkit.itmedia.co.jp/fjava/javafaq/j2ee/j2e07.html)

[MVCモデルとは！概念やそのメリットをわかりやすく解説！](https://www.geekly.co.jp/column/cat-technology/1911_040/)

[MVCフレームワークとは？【WEBサービス開発の基礎】](https://read-engineer.com/2020/07/29/mvc/)

[Ruby on Rails チュートリアル　1.3.3Model-View-Controller（MVC）](https://railstutorial.jp/chapters/beginning?version=7.0#sec-mvc)

# CRUD 処理を実装できる

TODO を管理できる「TODO アプリ」を作りながら学んでいきましょう。基本的な機能は以下の通りです。

- TODO を追加する: ユーザーは新しいタスクを追加することができます。各タスクにはタイトル（タスクの簡単な説明）があります。
- TODO の一覧を表示する: ユーザーは、すべてのタスクの一覧示することができます。一覧には、タスクのタイトルが表示されます。
- TODO を編集する: タスクのタイトルを編集することができます。
- TODO を削除する: 一覧からタスクを削除することができます。

なお、Scaffold 機能は使用しないでください。

```
rails new todo_app
```

<br>

## 2. テーブルの作成

今回使用するテーブルを作成しましょう。

テーブルの作成にはマイグレーションを使用します。マイグレーションとは何か、マイグレーションを使用するメリットは何かを説明してください。


<details><summary>マイグレーションとは？</summary><div>

システムやデータを別の環境に移転したり、新しい環境に移行することです。

Railsアプリケーションにおけるマイグレーションは、データベースの構造を変更する方法です。

マイグレーションを使用するメリットは、以下の通りです。

- 現行システム資源を有効利用することができるため、コストの抑制が期待できます。
- 開発期間が短縮されるため、開発コストの削減が期待できます。
- 移行手法によっては、システムの安全性が向上することがあります。


例えば、あなたがToDoリストのアプリを作っていて、タスクを保存するためのデータベースを使いたいとします。

1. マイグレーションファイルの生成: まず、ターミナルで以下のコマンドを実行してマイグレーションファイルを作成します。

```
rails generate migration CreateTodos title:string
```

`db/migrate`ディレクトリにマイグレーションファイルが作成されます。マイグレーションファイル内で、todosテーブルの構造を定義しています。


2. マイグレーションファイルの編集: 作成されたマイグレーションファイルを開き、データベースの構造を記述します。例えば、以下のようになります。

```ruby
class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.timestamps
    end
  end
end
```

このコードは、`todos` テーブルを作成し、その中に `title` という文字列を保存するためのカラムを追加しています。また、`timestamps` メソッドを使用して `created_at` と `updated_at` のカラムも自動的に追加しています。

3. マイグレーションの実行: 作成したマイグレーションをデータベースに適用するために、以下のコマンドを実行します。

```
bundle exec rails db:migrate
```

これにより、データベース内に `todos` テーブルが作成されます。

マイグレーションは、データベースの構造を段階的に変更するための仕組みです。新しい機能やデータモデルを追加する場合や、既存の構造を変更する場合に使用されます。マイグレーションを使うことで、データベースの変更を簡単かつ安全に管理できるようになります!!

</div></details>
<br>

次に、TODO のデータを保存するためのテーブルを作成してください。テーブル名は `todos` とします。テーブルには以下のカラムが必要です。

- `id`: タスクの ID
- `title`: タスクのタイトル
- `created_at`: タスクの作成日時
- `updated_at`: タスクの更新日時

<details><summary>テーブル作成の手順</summary><div>

1. ターミナルで以下のコマンドを実行して、`db/migrate` ディレクトリに移動します。

```
cd db/migrate
```

2. `todos` テーブルを作成するためのマイグレーションファイルを作成します。

```
touch 20230607000000_create_todos_table.rb
```

3. テキストエディタで `20230607000000_create_todos_table.rb` ファイルを開き、以下のコードを追加します。

```ruby
class CreateTodosTable < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.timestamps
    end
  end
end
```

4. 保存してエディタを閉じます。

5. ターミナルで以下のコマンドを実行して、マイグレーションを適用します。

```
bundle exec rails db:migrate
```

`todos` テーブルがデータベースに作成されます。
</div></details>

<br>

## 3. モデルの作成

TODO のデータを扱うためのモデルを作成してください。モデルには特に処理を書く必要はありません。

```
rails generate model Todo
```

上記のコマンドを実行すると、`app/models/todo.rb`ファイルが作成されます。

## 4. ルーティングの設定

`/todos` に GET されると、TODO の一覧を表示するページ（以下、TODO 一覧ページ）を表示するようにルーティングを設定してください。

また、トップページにアクセスしたときも TODO 一覧ページを表示するようにしてください。

```ruby
Rails.application.routes.draw do
  resources :todos
  root 'todos#index'
end
```
`config/routes.rb`ファイル内でルーティングを定義します。

上記のルーティング設定により、`/todos`にGETリクエストが送信された場合には`todos#index`アクションが実行され、一覧ページが表示されます。

トップページ（`root`）にアクセスした場合もTODO一覧ページが表示されます。


## 5. コントローラーの作成

TODO 一覧を表示するためのコントローラー及びコントローラーのアクションを作成してください。アクション内では特に処理を行わなくて大丈夫です。

```
rails generate controller Todos index
```

コントローラーは、アプリケーションのロジックを処理し、ビューとモデルを連携させます。

`todos_controller.rb`ファイルを開き、以下のようにアクションを編集。

```ruby
class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
end
```

`index`アクション内で`Todo`モデルから全てのTODOを取得し、`@todos`変数に代入しています。

## 6. ビューの作成

TODO 一覧ページのビューを作成してください。HTML は以下を参考にしてください。

```html
<div class="container">
  <h1>Todo List</h1>

  <a class="new-task" href="/todos/new">タスクを追加する</a>

  <table>
    <thead>
      <tr>
        <th>タスク</th>
        <th>アクション</th>
      </tr>
    </thead>
    <tbody>
      <!-- ここは後から動的コンテンツに置き換える -->
      <tr>
        <td>サンプルタスク</td>
        <td>
          <a class="edit" href="#">編集</a>
          <a class="delete" href="#">削除</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
```

CSS は以下を参考にしてください。

```css
body {
  font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
  background-color: #f5f5f5;
  padding: 20px;
}

.container {
  max-width: 600px;
  margin: 0 auto;
}

h1 {
  text-align: center;
}

form {
  display: flex;
  margin-bottom: 20px;
}

form input[type="text"] {
  flex: 1;
  padding: 10px;
  margin-right: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

form input[type="submit"] {
  width: 150px;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  color: #fff;
  background-color: #007BFF;
  cursor: pointer;
}

table {
  width: 100%;
  border-collapse: collapse;
}

table,
th,
td {
  border: 1px solid #ddd;
}

th,
td {
  padding: 10px;
  text-align: left;
}

.edit,
.delete {
  display: inline-block;
  padding: 10px;
  border: none;
  border-radius: 4px;
  color: #fff;
  text-decoration: none;
  margin-right: 5px;
}

.edit {
  background-color: #FFC107;
}

.delete {
  background-color: #DC3545;
}

.new-task {
  display: inline-block;
  margin-bottom: 20px;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  color: #fff;
  background-color: #007BFF;
  text-decoration: none;
}
```

```bash
mkdir -p app/views/todos
touch app/views/todos/index.html.erb
touch app/views/todos/edit.html.erb
```

app/views/todosディレクトリを作成したのち、`index.html.erb`と`edit.html.erb`ファイルを作成。

`index.html.erb`ファイルを開き、以下のHTMLコードを追加。

```html+erb
<div class="container">
  <h1>Todo List</h1>

  <%= link_to "タスクを追加する", new_todo_path, class: "new-task" %>

  <table>
    <thead>
      <tr>
        <th>タスク</th>
        <th>アクション</th>
      </tr>
    </thead>
    <tbody>
      <% @todos.each do |todo| %>
        <tr>
          <td><%= todo.title %></td>
          <td>
            <%= link_to "編集", edit_todo_path(todo), class: "edit" %>
            <%= link_to "削除", todo_path(todo), method: :delete, data: { confirm: "本当に削除していいですか？" }, class: "delete" %>
          </td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
```

`@todos`変数にはコントローラーで取得したTODOの一覧が格納されていることを前提としています。

## 7. TODO 新規作成ページの作成

TODO の新規作成ページを作成してください。HTML は以下を参考にしてください。

```html
<div class="container">
  <h1>タスクの追加</h1>

  <form>
    <input type="text" placeholder="タスクを入力する">
    <input type="submit" value="保存する">
  </form>
</div>
```

ビューが完成したら、タスクの保存処理を実装してください。タスクが保存できたら、TODO 一覧ページにリダイレクトするようにします。また、データベースにタスクが保存されていることを確認してください。

`app/views/todos`ディレクトリに`new.html.erb`という名前のファイルを作成します。

```bash
touch app/views/todos/new.html.erb
```

`new.html.erb`ファイルを開き、以下のHTMLコードを追加。

```html+erb
<div class="container">
  <h1>タスクの追加</h1>

  <%= form_for @todo do |f| %>
    <%= f.text_field :title, placeholder: "タスクを入力する" %>
    <%= f.submit "保存する" %>
  <% end %>
</div>
```

`form_for`ヘルパーを使用して、`@todo`オブジェクトをフォームに紐付けています。


## 8. TODO 一覧の表示

TODO 一覧ページで、保存されている TODO の一覧を表示してください。その際に、一覧ページの HTML で示した「サンプルタスク」の部分を、保存されている TODO のタイトルに置き換えてください。

`app/controllers/todos_controller.rb`ファイルを開き、`index`アクション内に以下のコードを追加。

```ruby
def index
  @todos = Todo.all
end
```

## 9. 編集ページの作成

TODO の編集ページを作成し、タイトルを編集できるようにしてください。HTML は以下を参考にしてください。

```html
<div class="container">
  <h1>タスクの編集</h1>

  <form>
    <input type="text" placeholder="タスクを入力する">
    <input type="submit" value="保存する">
  </form>
</div>
```

ビューが完成したら、タスクの保存処理を実装してください。タスクが保存できたら、TODO 一覧ページにリダイレクトするようにします。また、データベースに更新されたタスクが保存されていることを確認してください。

この機能を作成する際、フォーム部分の HTML はパーシャル化することで、TODO の新規作成ページと共通化してください。

## 10. 削除機能

TODO 一覧ページで、TODO の削除ボタンをクリックすると、TODO を削除できるようにしてください。

削除ボタンをクリックすると、「本当に削除していいですか?」と確認ダイアログが表示され、OK をクリックすると TODO が削除され、TODO 一覧ページにリダイレクトするようにします。

`app/views/todos/index.html.erb`ファイルを開き、以下のコードを追加。

```html+erb
<%= link_to "削除", todo_path(todo), method: :delete, data: { confirm: "本当に削除していいですか？" }, class: "delete" %>
```

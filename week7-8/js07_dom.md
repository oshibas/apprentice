# DOM 操作ができる

以下、ブログの投稿フォームを作成するための HTML です。この HTML を元に、JavaScript を `dom.js` に記載し、DOM 操作を行ってください。

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ブログ</title>
</head>
<body>
  <h1>ブログ</h1>
  <form id="post-form">
    <label for="title">タイトル：</label><br>
    <input type="text" id="title" name="title"><br>
    <label for="content">本文：</label><br>
    <textarea id="content" name="content"></textarea><br>
    <input type="submit" value="Submit">
  </form>
  <div id="posts"></div>
  <script src="dom.js"></script>
</body>
</html>
```

## 1. DOM とは

DOM とは何で、なんのためにあるのか、プログラミング初心者にわかるように説明してください。なお、DOM　とは API の一つなのですが、API とは何かも説明してください。

※ヒント: DOM はクライアントサイド（ブラウザ上でプログラムを実行する）に限定した話です。JavaScript の仕様そのものではないので区別して理解しましょう。HTML の操作をしたいときに JavaScript から DOM を利用するということであり、JavaScript と DOM は別物です。

```
DOM（Document Object Model）は、Webページの要素や構造を表現するためのインターフェースです。HTML文書をブラウザ上で扱うための仕組みであり、プログラミング言語であるJavaScriptを使用してWebページの構造や内容を操作することができます。

DOMは、Webページの各要素（タグ）をノードとして表現します。ノードはツリー構造を持ち、親子関係や兄弟関係によって要素が結びついています。DOMを使うことで、JavaScriptからWebページの要素や属性にアクセスし、追加、削除、変更などの操作を行うことができます。

DOMの役割は、次のようなものです。

要素の操作: DOMを使用すると、JavaScriptからHTML要素にアクセスして属性や内容を変更したり、新しい要素を作成したりすることができます。例えば、テキストの変更、スタイルの変更、要素の追加や削除などが可能です。

イベント処理: DOMを使用すると、ユーザーの操作やブラウザのイベント（クリック、マウスオーバー、フォーム送信など）に対してJavaScriptの関数を実行することができます。これにより、ユーザーとの対話や動的なページの作成が可能になります。

Webページの動的な変更: DOMを使用することで、JavaScriptを使ってWebページを動的に変更することができます。例えば、ユーザーの入力に基づいて要素を追加したり、データを取得して表示したりすることができます。

現在の DOM は協調して動作する複数 API によって構築されています。 コア DOM は、文書やその中のオブジェクトを基礎的に記述するオブジェクトを定義しています。 これは必要に応じて DOM に新しい機能や能力を追加する他の API によって拡張されます。 例えば、 HTML DOM API (en-US) はコア DOM に HTML 文書の表現の対応を、 SVG API は SVG 文書の表現の対応を追加しています。
```

## 2. 要素ノードの変更

JavaScript を使って、h1 タグのテキストを「シンプルブログ」変更してください。

```js
<!DOCTYPE html>
<html>
<body>

<h1 id="myHeading">Hello World</h1>

<script>
  const heading = document.getElementById("myHeading");
  heading.textContent = "シンプルブログ";
</script>

</body>
</html>
```

## 3. イベントハンドラの設定

JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームに入力された内容（タイトルと本文）をコンソールに出力するようにしてください。

```js
<!DOCTYPE html>
<html>
<body>

<form id="myForm">
  <input type="text" id="titleInput" placeholder="タイトル">
  <input type="text" id="contentInput" placeholder="本文">
  <button type="submit">送信</button>
</form>

<script>
  const form = document.getElementById("myForm");

  form.addEventListener("submit", function(event) {
    event.preventDefault();

    const titleInput = document.getElementById("titleInput");
    const contentInput = document.getElementById("contentInput");

    console.log("タイトル:", titleInput.value);
    console.log("本文:", contentInput.value);

    // 入力内容のリセット
    titleInput.value = "";
    contentInput.value = "";
  });
</script>

</body>
</html>
```

## 4. 要素ノードの追加

JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの内容を `#posts` の div タブ内に、以下の形式で表示するようにしてください。

```html
<div id="posts">
  <h2>入力されたタイトル</h2>
  <p>入力された本文</p>
</div>
```

```js
<!DOCTYPE html>
<html>
<body>

<form id="myForm">
  <input type="text" id="titleInput" placeholder="タイトル">
  <input type="text" id="contentInput" placeholder="本文">
  <button type="submit">送信</button>
</form>

<div id="posts"></div>

<script>
  const form = document.getElementById("myForm");
  const postsContainer = document.getElementById("posts");

  form.addEventListener("submit", function(event) {
    event.preventDefault();

    const titleInput = document.getElementById("titleInput");
    const contentInput = document.getElementById("contentInput");

    const postDiv = document.createElement("div");
    const titleHeading = document.createElement("h2");
    const contentParagraph = document.createElement("p");

    titleHeading.textContent = titleInput.value;
    contentParagraph.textContent = contentInput.value;

    postDiv.appendChild(titleHeading);
    postDiv.appendChild(contentParagraph);
    postsContainer.appendChild(postDiv);

    // 入力内容のリセット
    titleInput.value = "";
    contentInput.value = "";
  });
</script>

</body>
</html>
```

## 5. 要素ノードの追加

JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの中身を空にしてください。
```js
<!DOCTYPE html>
<html>
<body>

<form id="myForm">
  <input type="text" id="titleInput" placeholder="タイトル">
  <input type="text" id="contentInput" placeholder="本文">
  <button type="submit">送信</button>
</form>

<div id="posts"></div>

<script>
  const form = document.getElementById("myForm");
  const postsContainer = document.getElementById("posts");

  form.addEventListener("submit", function(event) {
    event.preventDefault();

    const titleInput = document.getElementById("titleInput");
    const contentInput = document.getElementById("contentInput");

    const postDiv = document.createElement("div");
    const titleHeading = document.createElement("h2");
    const contentParagraph = document.createElement("p");

    titleHeading.textContent = titleInput.value;
    contentParagraph.textContent = contentInput.value;

    postDiv.appendChild(titleHeading);
    postDiv.appendChild(contentParagraph);
    postsContainer.appendChild(postDiv);
```

## 6. スタイルの変更

JavaScript を使って、`#post-form` の div タブ上にマウスポインターを乗せたタイミングで背景色を黄色に、マウスポインターを外したタイミングで白色に変更するようにしてください。
```js
<!DOCTYPE html>
<html>
<head>
  <style>
    #post-form {
      width: 200px;
      height: 200px;
      background-color: white;
      transition: background-color 0.3s;
    }

    #post-form:hover {
      background-color: yellow;
    }
  </style>
</head>
<body>

<div id="post-form"></div>

<script>
  const postForm = document.getElementById("post-form");

  postForm.addEventListener("mouseenter", function() {
    postForm.style.backgroundColor = "yellow";
  });

  postForm.addEventListener("mouseleave", function() {
    postForm.style.backgroundColor = "white";
  });
</script>

</body>
</html>

```
- post-form というIDを持つ <div> タグの背景色をマウスポインターを乗せた時に黄色、外した時に白色に変更するようにしています。
- mouseenter イベントと mouseleave イベントを使用して、マウスポインターの乗せた時と外した時のスタイル変更を行っています。

## 7. 要素ノードの削除

フォームの投稿が増え、`#posts` の div タブ内に表示される投稿が多くなってきたとします。このとき `#posts` の div タブ内に追加された投稿の数が3つを超えた場合、一番古い投稿を削除してください。なお、4で作成した投稿の表示形式は変更して構いません。
```js
<!DOCTYPE html>
<html>
<body>

<div id="posts"></div>

<script>
  const postsContainer = document.getElementById("posts");

  function createPost(title, content) {
    const postDiv = document.createElement("div");
    const titleHeading = document.createElement("h2");
    const contentParagraph = document.createElement("p");

    titleHeading.textContent = title;
    contentParagraph.textContent = content;

    postDiv.appendChild(titleHeading);
    postDiv.appendChild(contentParagraph);
    postsContainer.appendChild(postDiv);
  }

  function removeOldestPost() {
    const posts = postsContainer.children;

    if (posts.length > 3) {
      postsContainer.removeChild(posts[0]);
    }
  }

  const form = document.createElement("form");
  const titleInput = document.createElement("input");
  const contentInput = document.createElement("input");
  const submitButton = document.createElement("button");

  titleInput.type = "text";
  titleInput.placeholder = "タイトル";
  contentInput.type = "text";
  contentInput.placeholder = "本文";
  submitButton.type = "submit";
  submitButton.textContent = "送信";

  form.appendChild(titleInput);
  form.appendChild(contentInput);
  form.appendChild(submitButton);
  document.body.appendChild(form);

  form.addEventListener("submit", function(event) {
    event.preventDefault();

    createPost(titleInput.value, contentInput.value);
    removeOldestPost();

    titleInput.value = "";
    contentInput.value = "";
  });
</script>

</body>
</html>
```
- フォームを作成し、送信ボタンをクリックした際にフォームの内容を #posts の <div> タグ内に表示します。
- 投稿が3つを超えた場合、一番古い投稿を削除します。
- createPost 関数で投稿の作成、removeOldestPost 関数で投稿の削除を行っています。

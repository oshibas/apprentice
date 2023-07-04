※文字数は検討中。

＜商品テーブル＞

追加日・更新日は自動取得。

CREATE TABLE products (
id INT(11) NOT NULL,
stock INT(11) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
name VARCHAR(255),
category VARCHAR(255),
main_image VARCHAR(255),
sub_image1 VARCHAR(255),
sub_image2 VARCHAR(255),
sub_image3 VARCHAR(255),
sub_image4 VARCHAR(255),
variety VARCHAR(255),
price DECIMAL(10, 2),  *小数点以下の桁数は必要か検討。
size VARCHAR(50),
description TEXT,
cultivation_guide TEXT, *育て方ガイド
tags VARCHAR(255), *検索用タグ
PRIMARY KEY (id),
INDEX idx_search (name, tags, variety) *検索用インデックス
);

＜ユーザーテーブル＞
ユーザー名　8文字以内
パスワード　12桁＋英数字＋記号（SHA-256を用いてハッシュ化、ハッシュ値でDBに保存する）

追加日・更新日は自動取得。

CREATE TABLE user_master (
id INT(11) NOT NULL,
nickname VARCHAR(8),
password VARCHAR(12),
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);

＜パスワードリセットテーブル＞

パスワードをリセットする際に、一時的なトークンを発行する。

追加日は自動取得。

CREATE TABLE password_reset (
id INT(11) NOT NULL AUTO_INCREMENT,
user_id INT(11) NOT NULL,
token VARCHAR(255) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (user_id) REFERENCES user_master(id)
);

<お気に入りテーブル>

追加日は自動取得。

CREATE TABLE favorite_master (
customer_id INT(11) NOT NULL,
product_id INT(11) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (customer_id, product_id),
FOREIGN KEY (customer_id) REFERENCES user_master(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

＜新着情報テーブル＞

追加日は自動取得。

CREATE TABLE news (
id INT(11) NOT NULL AUTO_INCREMENT,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
content TEXT NOT NULL,
PRIMARY KEY (id)
);

【メモ】PHPのコード

<?php
// パスワードのハッシュ化
$password = $_POST['password']; // ユーザーが入力したパスワード
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// データベースにハッシュ化されたパスワードを保存
$sql = "INSERT INTO user_master (id, nickname, password, created_at, updated_at) VALUES (1, '**name**', :password, NOW(), NOW())";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':password', $hashedPassword);
$stmt->execute();
?>

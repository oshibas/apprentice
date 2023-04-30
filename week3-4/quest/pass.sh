#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read service_name

echo "ユーザー名を入力してください："
read username

echo "パスワードを入力してください："
read -s password

# ユーザーの入力をpass.txtに書き込む
echo "$service_name:$username:$password" >> pass.txt

echo "Thank you!"

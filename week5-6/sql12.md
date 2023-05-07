# スタイルガイドに則ってクエリを書ける
> スタイルガイドとは共通のコードの書き方の書式・ルールについてまとめたものです。スタイルガイドに従うことで読みやすい SQL クエリを書くことができます。

## 1. スタイルガイド
> SQL スタイルガイドを一通り読んでください。文章が読みづらい場合は SQL クエリの箇所だけ見て、SQL クエリの書式を把握してください。

## 2. スタイルガイドに則る
> 今後 SQL クエリを書く際はスタイルガイドに則って書いてください。

```sql
スタイルガイドの要点

⚫︎ コメントスタイル
複数行: /* Updating the file record after writing to the file */
1行:  -- stored ssdeep hash

⚫︎ 命名規則
1. 名前には英字、数字、アンダースコアのみを使用する。
2. 集合体を表す用語を使用する。たとえばemployeesの代わりにstaff。

⚫︎ 統一的接尾辞
_id - 主キーである列など一意の識別子。
_status - flag値または任意のタイプの状況を表す（例: publication_status）。
_total - 値の集合の合計または総計。
_num - フィールドに数値が含まれていることを表す。
_name - first_nameのように名前を強調する。
_seq - 連続した数値を含む。
_date - 何かの日付を含む列であることを表す。
_tally - カウント。
_size - ファイルサイズや衣類などのサイズ。
_addr - 有形無形のデータのアドレス（例: ip_addr)。

⚫︎ 望ましい形式
1. 複数のANDを組み合わせる代わりにBETWEENを使用する。
2. 同様に複数のOR句を使用する代わりにIN()句を使用する。
3. 使用するデータベースに接続した状態で値を変換する必要がある場合にはCASE式を使う。CASE式はネストしてより複雑な論理構造を形成することができる。
4. UNION節および一時表は極力避ける。これらの機能へ依存しないようにスキーマを最適化できる場合はそうした方が良い。

SELECT CASE postcode
       WHEN 'BN1' THEN 'Brighton'
       WHEN 'EH1' THEN 'Edinburgh'
       END AS city
  FROM office_locations
 WHERE country = 'United Kingdom'
   AND opening_time BETWEEN 8 AND 9
   AND postcode IN ('EH1', 'BN1', 'NN1', 'KW1');
```

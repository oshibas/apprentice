画面遷移図

```mermaid
graph TD;

A[トップページ] --> B[商品一覧ページ]
A --> C[ユーザーページ]
A --> D[お問い合わせ]
B --> E[商品詳細ページ]
B --> F[カートページ]
B --> G[特定商取引]
C --> H[ログインページ]
C --> I[マイページ]
H --> I
E --> F
```

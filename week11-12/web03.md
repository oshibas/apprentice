# DNS について説明できる

## 1. ドメインとは

>ドメインとは何か、プログラミング初心者にわかるように説明してください。

インターネット上のコンピューターが所属するグループの名前のことです。

ドメイン名は、.（ドット）で区切られた階層構造を持ち、右側から順にトップレベルドメイン、セカンドレベルドメイン、サードレベルドメインと呼ばれます。

例えば、www.google.com の場合、com がトップレベルドメイン、google がセカンドレベルドメイン、www がサードレベルドメインになります。

## 2. DNS とは

>DNS とは何か、プログラミング初心者にわかるように説明してください。

DNS（Domain Name System）とは、ドメイン名と IP アドレスを対応付けるシステムのことです。

DNS サーバーは、ドメイン名と IP アドレスの対応表を持っており、クライアントからの問い合わせに対して、対応する IP アドレスを返します。

## 3. ドメイン名と IP アドレスの対応

>`www.google.com` の IP アドレスを調べてください。またブラウザでその IP アドレスにアクセスして、`www.google.com` が開かれることを確認してください。

Mac の場合: ターミナルで nslookup www.google.com コマンドを実行します。
```ubuntsu
Server:		192.168.128.1
Address:	192.168.128.1#53

Non-authoritative answer:
Name:	www.google.com
Address: 142.251.42.164
```
http://142.251.42.164 にアクセスすると、Google のトップページが表示されました。

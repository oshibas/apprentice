# IP アドレスについて説明できる

## 1. IP アドレスとは

>IP アドレスとは何か、プログラミング初心者にわかるように説明してください。

インターネット上のコンピューターが通信する際に使用する、コンピューターの住所のようなものです。IP アドレスは、数値で表現され、各コンピューターに一意に割り当てられます。

## 2. IP アドレスの種類

>IP アドレスにはパブリック（グローバル） IP アドレスとプライベート（ローカル） IP アドレスの2種類があります。それぞれの違いを説明してください。

1. パブリック IP アドレス: インターネット上で一意に割り当てられる IP アドレスです。インターネット上の他のコンピューターから直接アクセスすることができます。

2. プライベート IP アドレス: ローカルネットワーク内で使用される IP アドレスです。インターネット上の他のコンピューターから直接アクセスすることはできません。

## 3. IP アドレスの割り当て

>パブリック IP アドレスは世界共通で割り当てられ使用するため、勝手に好きな番号を使用することはできません。パブリック IP アドレスはどのように割り当てられるのでしょうか。説明してください。

パブリックIPアドレスは、ICANN（アイキャン/Internet Corporation for Assigned Names and Numbers）という組織が管理しており、各国・地域の ISP（Internet Service Provider）に割り当てられます。また、ISP は、その割り当てられた IP アドレスを、個々のユーザーに割り当てます。

## 4. IP アドレスのバージョン

>IP アドレスには IPv4 と IPv6 があります。それぞれの違いを説明してください。

- IPv4: 32ビットの正整数値で表現される IP アドレスです。約43億個のアドレスが割り当てられます。

- IPv6: 128ビットの正整数値で表現される IP アドレスです。膨大な数のアドレスが割り当てられます。

※ IPv4 のアドレス空間が枯渇しつつあるため、IPv6 が普及しつつあります。

## 5. IP アドレスの表記

>IP アドレスは、IPv4 の場合、192.168.128.10 のように表記します。これは32ビットの正整数値を4組にわけて表記したものです。192.168.128.10 を32ビットの正整数値で表現してください。

>なお、ビットについて知らない場合、ビット及び2進数、10進数について調べてください。

192 = 11000000 (2進数)
168 = 10101000 (2進数)
128 = 10000000 (2進数)
10 = 00001010 (2進数)

11000000 10101000 10000000 00001010 = 3232268810 (10進数)


## 6. IP アドレスの CIDR 表記

>IP アドレスは、CIDR 表記という方法で表記することができます。10.0.0.0/16 のように表記します。以下を説明してください。

> CIDR 表記とは何か、また何のためにあるものですか？

CIDR 表記とは何か: ネットワークアドレスとサブネットマスクを組み合わせた表記方法です。10.0.0.0/16のうち、/16 の部分がサブネットマスクを示します。

CIDR 表記がある理由: ネットワークアドレスとサブネットマスクを組み合わせることで、IP アドレスの範囲を簡潔に表現することができます。

> 10.0.0.0/16 が表す IP アドレスの範囲は何ですか？

10.0.0.0 から 10.0.255.255 までの IP アドレスが含まれます。

## 7. IP アドレスの確認

今自分が使用しているパソコンのパブリック IP アドレス及びプライベート IP アドレスを調べてください。

- パブリック IP アドレス: Web ブラウザで「my ip」と検索すると、検索結果に表示されます。

接続元IPアドレス
49.96.26.163

- プライベート IP アドレス: Mac の場合、ターミナルで ifconfig コマンドを実行すると、inet の項目に表示されます。

```ubuntsu
ifconfig
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
	inet 127.0.0.1 netmask 0xff000000
	inet6 ::1 prefixlen 128
	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
	nd6 options=201<PERFORMNUD,DAD>
gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
stf0: flags=0<> mtu 1280
anpi1: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether 22:d2:1f:89:4a:f8
	inet6 fe80::20d2:1fff:fe89:4af8%anpi1 prefixlen 64 scopeid 0x4
	nd6 options=201<PERFORMNUD,DAD>
	media: none
	status: inactive
anpi0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether 22:d2:1f:89:4a:f7
	inet6 fe80::20d2:1fff:fe89:4af7%anpi0 prefixlen 64 scopeid 0x5
	nd6 options=201<PERFORMNUD,DAD>
	media: none
	status: inactive
en3: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether 22:d2:1f:89:4a:d7
	nd6 options=201<PERFORMNUD,DAD>
	media: none
	status: inactive
en4: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether 22:d2:1f:89:4a:d8
	nd6 options=201<PERFORMNUD,DAD>
	media: none
	status: inactive
en1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
	options=460<TSO4,TSO6,CHANNEL_IO>
	ether 36:f4:80:bb:99:c0
	media: autoselect <full-duplex>
	status: inactive
en2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
	options=460<TSO4,TSO6,CHANNEL_IO>
	ether 36:f4:80:bb:99:c4
	media: autoselect <full-duplex>
	status: inactive
bridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=63<RXCSUM,TXCSUM,TSO4,TSO6>
	ether 36:f4:80:bb:99:c0
	Configuration:
		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0
		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200
		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0
		ipfilter disabled flags 0x0
	member: en1 flags=3<LEARNING,DISCOVER>
	        ifmaxaddr 0 port 8 priority 0 path cost 0
	member: en2 flags=3<LEARNING,DISCOVER>
	        ifmaxaddr 0 port 9 priority 0 path cost 0
	nd6 options=201<PERFORMNUD,DAD>
	media: <unknown type>
	status: inactive
ap1: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=6463<RXCSUM,TXCSUM,TSO4,TSO6,CHANNEL_IO,PARTIAL_CSUM,ZEROINVERT_CSUM>
	ether fe:e2:6c:29:c7:13
	inet6 fe80::fce2:6cff:fe29:c713%ap1 prefixlen 64 scopeid 0xb
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect (<unknown type>)
	status: inactive
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=6463<RXCSUM,TXCSUM,TSO4,TSO6,CHANNEL_IO,PARTIAL_CSUM,ZEROINVERT_CSUM>
	ether fc:e2:6c:29:c7:13
	inet6 fe80::18e9:1282:4ed8:2ab4%en0 prefixlen 64 secured scopeid 0xc
	inet 192.168.128.122 netmask 0xffffff00 broadcast 192.168.128.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
awdl0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=6463<RXCSUM,TXCSUM,TSO4,TSO6,CHANNEL_IO,PARTIAL_CSUM,ZEROINVERT_CSUM>
	ether fa:de:c0:02:b9:1a
	inet6 fe80::f8de:c0ff:fe02:b91a%awdl0 prefixlen 64 scopeid 0xd
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
llw0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether fa:de:c0:02:b9:1a
	inet6 fe80::f8de:c0ff:fe02:b91a%llw0 prefixlen 64 scopeid 0xe
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: inactive
utun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000
	inet6 fe80::7819:d267:d64e:8eda%utun0 prefixlen 64 scopeid 0xf
	nd6 options=201<PERFORMNUD,DAD>
utun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
	inet6 fe80::513e:8853:329a:6a98%utun1 prefixlen 64 scopeid 0x10
	nd6 options=201<PERFORMNUD,DAD>
utun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1000
	inet6 fe80::ce81:b1c:bd2c:69e%utun2 prefixlen 64 scopeid 0x11
	nd6 options=201<PERFORMNUD,DAD>
utun3: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
	inet6 fe80::58e6:4c9e:7ce1:8651%utun3 prefixlen 64 scopeid 0x14
	nd6 options=201<PERFORMNUD,DAD>
```

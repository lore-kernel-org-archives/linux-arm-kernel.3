Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD80CDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF/jaXhx5/NNBI1uZEY/Y3g3zYWwoUvRzmIALicrljo=; b=JurqscVjBybTmqIHpIN9FSdYDG
	WcElxj7fTx53hxDu5BunySDQiyTWVIT9eXIJPRv4qcUdCmrlzODfl+RBwgMnoNR96SwBp2GX3SIMO
	qV5lQEzupHc//ju3pkyH4SPbuzNK4gOzz+7V3VaqiLdci4ufeDGbdhXs39fQP3mHtyH86yyYJqxXX
	AG2pyd7bbjWKvTQmF68iAIvQFGGWv7EPLtMcysWWARjrncnMjAReq2mxaqVUrfPF1XaTHuDcO3qgX
	959h+bG2ZmecFiVHVdCfDdvxnlBkRcI3sitAZTbcyVb8FeXNadlYCO1CvIq4yas+bdBZn9XhWzaoe
	T5AAgXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YJ0-0000000Dvpg-0AKZ;
	Wed, 23 Oct 2024 10:09:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xpg-0000000DpdR-3qD5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 09:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QF/jaXhx5/NNBI1uZEY/Y3g3zYWwoUvRzmIALicrljo=; b=llAXY5Wdo1p5zNh8UulZZFeaIW
	RgKVidZx/GMQlHhKRb87UkGPZj6nnh627YRYZ5LeLnYXLYepI8VpnjlB23Ws+8qD1heRo0a1gTS0g
	GebRqrRgEQ9bc7hdW2FtklAolSJoezjSEua5iBmiMC5WBWldBGkACs6ZH37V9CBbLZpURPX6YnT3o
	vtRUWzMgAZAPYKwqoHgT/eJ6S1697NQgft5gT7BUqsTWqTI9bubUistswtIOrVCwsDKwFoChUZXRN
	NGzqRpRAETx/3nEwLji+7OtAAreu8BK0tnSC0erGZfJv4bc4Y+RLaawV7BR/XjbsqEg2/uJUY011y
	ShsjNVow==;
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xpa-00000008Mth-2mO1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729676311;
	bh=QF/jaXhx5/NNBI1uZEY/Y3g3zYWwoUvRzmIALicrljo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=R40Q7z4TMR6QysGPZMc4BsJPggQ2G7NA6xxgCc8xYKIrVGdIekOK+YyxzZJV44Qb6
	 6wE3J6JlTjNnqlCSerK98GXlzf2nti+I0xOZk0QgmWxSzBbzLQgajKugioJ1lQFOYz
	 XNjXcolt2BULS2oYGQDMxfmvuQiwnX82qRGJFq08=
X-QQ-mid: bizesmtp77t1729676302tfw4pc5r
X-QQ-Originating-IP: j4Uoxci2RtnVTGsTNP/gQfdQgd0owTwx3inBP/hx8jA=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Oct 2024 17:38:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17180917475525741311
Message-ID: <1E6A0B26DC871B50+d97424c4-29ab-4bb2-b1df-8f04f8b865ca@uniontech.com>
Date: Wed, 23 Oct 2024 17:38:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
To: Mingcong Bai <jeffbai@aosc.io>
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, nikita@trvn.ru,
 ink@jurassic.park.msu.ru, shc_work@mail.ru, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
 linux-hwmon@vger.kernel.org, dmaengine@vger.kernel.org, xeb@mail.ru,
 netdev@vger.kernel.org, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 serjk@netup.ru, aospan@netup.ru, linux-media@vger.kernel.org,
 ddrokosov@sberdevices.ru, linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com, mchehab+huawei@kernel.org,
 xiangxia.m.yue@gmail.com
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r97sG9xHlL94zbsyZpdQWneg"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NkyHzehpHY4/MtweqoV+FSa9wHPlnlGG2HwrhAk4idCWBt/lTZc9mlHz
	ZQL4U8YNgilbs3Ua9RtAhDCA8onFh+UUsEoQMTtwpWOsw7SptXQHf2eV+8/XLXnzLrniJt0
	lUOiwf8HXZjU8tEWjgGHJIVWGTYKIUS9Pva8NXxYN/49FBK5FKDPkJTw7G6I9E7UpFAE18K
	d9ahYeDp48YQpGrvLAOxQTeGnCZcemrMcX7yvGy2buYriQHzprHLuiIkok9nHdo1ZhVj9gC
	fuFnHgUZDWUz7aJrU/D55u3CYwQE9CCqS535FOMzOiw0RHEP1fl/pKRLCYtyiuKBxxcLfCj
	CJ01XNLS0eNoxw3orCnT0A8fq76b2Ni+uelJzs2KiAXJxalgIWyl3qkI75Us9UMsRLJHsu7
	KVT8yU3Q2nwi89FPyQFviR5c14Q5Z/VTmsrWd+Af8rVP3TFK+sA7XRsFpdJqrnoXr6I7+7o
	coRrKLFU+sKXAmmUA+iiA1YvEAQ7ZE92w5HiVD5c8OOq+pQnlJc67XNesD/6D1HbaJZoBJA
	n9sUNkazVmXTxMbEZIC2FPOdRsxybKCif7CW6k+VNiSL2M5uSdrMbqVHoBmj+Sxla4IwMA/
	QfVTgecpIZEzKzecqaPi2rgqRm3oSYQ9NADAFMJq3ilE7IpA9qfM21xmkt1Dh5ynf4R9rgG
	ZPE7OQMvTHws7D1vW9LDNE6stEKtDt9fTGxxqnpN4J9CNVaUv/t68hrafXaRK+zGESECF0T
	pbRnqNixuXF0I0N/rpqlIVP+Wi8uRcziXlYMkLQnXx5H1pNHRW/udBgQ+KTThqn8yjt5Ffy
	CRVpFoDXXRcjb2RRgvcbohDyP8j83HantQGbdLMgB76+MCNqUbeVfFhBkDWwotz+O93rdv7
	bA2pSCtCoJAIRIHDfbeiNBVRWWRUkKjZ7wb4tEzLH6fjAJkvXW9a5iEyKPbaJYCh4DWV4SJ
	bch7xtT5ECGvW7YG6x5sdkDJPPk3qhH1nLo7q+wvdw8gOBHYaK4t9kNmQmaajs74IqVJUTx
	8urP4pcA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103908_527919_54688280 
X-CRM114-Status: GOOD (  10.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r97sG9xHlL94zbsyZpdQWneg
Content-Type: multipart/mixed; boundary="------------JzXTUjOcl4RCqRode5kxglom";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, nikita@trvn.ru,
 ink@jurassic.park.msu.ru, shc_work@mail.ru, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
 linux-hwmon@vger.kernel.org, dmaengine@vger.kernel.org, xeb@mail.ru,
 netdev@vger.kernel.org, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 serjk@netup.ru, aospan@netup.ru, linux-media@vger.kernel.org,
 ddrokosov@sberdevices.ru, linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com, mchehab+huawei@kernel.org,
 xiangxia.m.yue@gmail.com
Message-ID: <d97424c4-29ab-4bb2-b1df-8f04f8b865ca@uniontech.com>
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>

--------------JzXTUjOcl4RCqRode5kxglom
Content-Type: multipart/mixed; boundary="------------scTKQpIAgv93yoqxUNnHojEI"

--------------scTKQpIAgv93yoqxUNnHojEI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGFoYSwgSSByZWNlaXZlZCBhIHNpbWlsYXIgb2ZmLWxpc3QgcmVwbHkuDQoNCkkgZGVlcGx5
IHN5bXBhdGhpemUgd2l0aCBHcmVnLWtoJ3Mgc2l0dWF0aW9uIGFuZCBoaXMgdW5zcG9rZW4g
DQpkaWZmaWN1bHRpZXMsIGFsdGhvdWdoIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIE1B
SU5UQUlORVJTIGZpbGUsIGFzIA0KcGFydCBvZiB0aGUga2VybmVsIGNvZGUsIHNob3VsZCBi
ZSBvZmYtbGltaXRzIHRvIG5vbi1tYWludGFpbmVyIA0KZGV2ZWxvcGVycywgZXNwZWNpYWxs
eSB3aGVuIHRoaXMgY2xlYXJseSBpc24ndCBqdXN0IGFib3V0ICdtb2RpZnlpbmcgdGhlIA0K
TUFJTlRBSU5FUlMgZmlsZS4nDQoNCklmIGFueSBMaW51eCBkZXZlbG9wZXIgdGFjaXRseSBh
cHByb3ZlcyBvZiB0aGlzLCB0aGV5J3JlIGVzc2VudGlhbGx5IA0KZ2l2aW5nIGEgZ3JlZW4g
bGlnaHQgdG8gc29tZSBzaGFkeSBwb2xpdGljYWwgYWN0b3JzIGZyb20gYSBjZXJ0YWluIA0K
Y291bnRyeSB0byBjb2VyY2UgcGVvcGxlIGludG8gYmV0cmF5aW5nIGl0J3MgY29uc3RpdHV0
aW9uLg0KDQpUaGF0J3MgYWJzdXJkLiBBZ2FpbiwgbXkgaGVhcnQgZ29lcyBvdXQgdG8gYWxs
IChpbmNsdWRpbmcgR3JlZy1raCkgdGhhdCANCmFmZmVjdGVkIGJ5IHRoaXMuDQoNCkkgbWVh
biBubyBvZmZlbnNlIHRvIGFueW9uZSwgYnV0IHRoaXMgYWN0aW9uIHdpbGwgY29tcGxldGVs
eSBkZXN0cm95IHRoZSANCnRydXN0IHRoYXQgZGV2ZWxvcGVycyB3b3JsZHdpZGUgaGF2ZSBp
biB0aGUgTGludXgga2VybmVsIHByb2plY3QgYW5kIHRoZSANCmVudGlyZSBMaW51eCBGb3Vu
ZGF0aW9uLCBhbmQgdGhlIHBvbGl0aWNpYW5zIGZvcmNpbmcgeW91IHRvIGRvIHRoaXMgDQpj
bGVhcmx5IGRvbid0IGNhcmUgYWJvdXQgdGhhdC4NCg0KVG8gYXZvaWQgYmVjb21pbmcgcGF3
bnMgaW4gYSBwb2xpdGljYWwgZ2FtZSBhbmQgdG8gcHJldmVudCBhbGllbmF0aW5nIA0KYWxs
IHRoZSBkZXZlbG9wZXJzIHdobyBoYXZlIGNvbnRyaWJ1dGVkIHRvIHRoZSBMaW51eCBrZXJu
ZWwsIEkgc2luY2VyZWx5IA0Kc3VnZ2VzdCB0aGF0IHlvdSBtYWludGFpbmVycyByZXZlcnQg
dGhpcyBjb21taXQgYW5kIHByb21pc2Ugbm90IHRvIGRvIA0Kc29tZXRoaW5nIGxpa2UgdGhp
cyBhZ2Fpbi4NCg0KQW5kIEkgdXJnZSBldmVyeW9uZSB3aG8gYWdyZWVzIHRoYXQgdGhpcyBp
cyB1bnJlYXNvbmFibGUgdG8gcmVwbHkgdG8gDQoiW1BBVENIXSBSZXZlcnQgIk1BSU5UQUlO
RVJTOiBSZW1vdmUgc29tZSBlbnRyaWVzIGR1ZSB0byB2YXJpb3VzIA0KY29tcGxpYW5jZSBy
ZXF1aXJlbWVudHMuIiB3aXRoIHRoZWlyIG93biAiUmV2aWV3ZWQtYnkiLg0KDQpSZW1lbWJl
cjogV2hhdCBzZXRzIGh1bWFucyBhcGFydCBmcm9tIGFuaW1hbHMgaXMgb3VyIHVuZHlpbmcg
c3Bpcml0IG9mIA0KcmVzaXN0YW5jZS4gV2UgY2Fubm90IGJlIGRvbWVzdGljYXRlZCBvciB0
YW1lZCBieSBvdGhlcnMuDQoNCkZpbmFsbHksIEknZCBsaWtlIHRvIHNoYXJlIGEgcXVvdGUg
ZnJvbSBOb3JzZSBteXRob2xvZ3k6IE9ubHkgd2FycmlvcnMgDQp3aG8gZGllIGluIGJhdHRs
ZSBhcmUgd29ydGh5IG9mIGVudGVyaW5nIFZhbGhhbGxhLg0KDQotLSANCldhbmdZdWxpDQo=

--------------scTKQpIAgv93yoqxUNnHojEI
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------scTKQpIAgv93yoqxUNnHojEI--

--------------JzXTUjOcl4RCqRode5kxglom--

--------------r97sG9xHlL94zbsyZpdQWneg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZxjECQUDAAAAAAAKCRDF2h8wRvQL7kjt
APwI7fd1226UgOd7cRVAf8ZOTwbN8jQ1fJQ8MgqEad3U9wD9EIMXUDfMpotDS9T8MXgx3FH68pyV
elWfHTzpUpxMGw4=
=Mkes
-----END PGP SIGNATURE-----

--------------r97sG9xHlL94zbsyZpdQWneg--


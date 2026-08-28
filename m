Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA1AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 06:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYM0QuKOcduK6Gp9GXzDfG45WKu2zz5egHZM03P8ZFs=; b=xfvU0iRl7LnLi5ryknhcRdYP1p
	XpZ/4a1OE48B8t845zY7QlZaWTH/XANAGq2eK4yKAnInQU2GLitR/tZPJhht/J/ciWSSUf0vK3x87
	ca8WgS2sr5HZ/YaOItBDXHiVBtagExYuBz7/NGkb+EAJFfZeWoXTKuCeZIoAjkngTx4MYO1av8aFl
	pWzFaSFi6jCpuCMjh77eUGpvc7nqoITPnCo/weL3hZ2N4xpd0ymT8WayPh5xS55+Wwc/5s5QV8RqW
	SQJSgczLdy65Z6FaYdi6Ua1tLGtEkR46g0882/tR3OfbLRuYROPu5jSj8Rz4N2Ct7DsmZipp3KVWr
	bLuhSCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqFi-00000005DAD-1ufu;
	Fri, 28 Aug 2026 06:39:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqFg-00000005D9z-2y5R;
	Fri, 28 Aug 2026 06:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mYM0QuKOcduK6Gp9GXzDfG45WKu2zz5egHZM03P8ZFs=; b=WtbWUkvwMDnct5IV3+9qxhi+YZ
	6iuM6KcNJM7ZHuUDhvYQL8eeajwcO3GLS90sixMD5OFXl6n0m1EICXb4afedWUYMBpj67BpWxlLty
	QqkKewFfkpnbogCWuFDhSlpNat8yNh8R+6rejKxatP/35h3xYHfrELv9uK3czaxqMamoSm4tUji7s
	BmMXfegH2ezc+18ZJPFUSw3hZzA7p22ZeNnDxEKQC9j9xHnpug8ssnCL+LzezJrQtsKYm+gysLmKN
	ZYJudi1qzmDSjpcKTjdN1T5KUIlc2LvA84PF2Q4pJMPhD8OgMrpuJgKqNIGvcpoLCrmvRRCEAgrma
	+POQsNjw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzqFc-000000083bC-2xqk;
	Fri, 28 Aug 2026 06:39:47 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67S6d58y92240244, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1787899145; bh=mYM0QuKOcduK6Gp9GXzDfG45WKu2zz5egHZM03P8ZFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LOK4CB3Loll4qGfbnHB/SDi40UIabunI8l49uHSTf4Kzba86ewZtTUGuqMCbaHwwZ
	 D2D4/fEgdzUX6eeNTovkhOHsIbMU5I60BwqOZjghLgks61fKweB5MOU7kfOEx0AwUW
	 Ivg+wJvoyAEhaKemqpCsTymuwZUbU17ZVy3uW347ZQER4xdlz6RueWhjDVHXmGGe1f
	 6EqFDn03LL20iCh8a7IEt/y78rPiyUoGR86LPqagXGj4Vv5j/pPt6h5oFs6Jg2MC+E
	 BLGmCqWu04fJCnsWnxfIiqKG1mdmRS6rvn112HegicRYJ38IBfvI7xyASqxV0zO8Ri
	 T5cmdcBu+aPZw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67S6d58y92240244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Aug 2026 14:39:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 28 Aug 2026 14:39:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Fri, 28 Aug 2026 14:39:05 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, =?big5?B?SnlhbiBDaG91IFupUKrppndd?=
	<jyanchou@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Thread-Topic: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Thread-Index: AQHdKf98tGU4ULZZCkawWMV9VkFKTbas76AAgAYrYeA=
Date: Fri, 28 Aug 2026 06:39:05 +0000
Message-ID: <9642b853a9c24ba6b11c81e95341bfbd@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-5-eleanor.lin@realtek.com>
 <aoxv9PJd6r_8DaNA@redhat.com>
In-Reply-To: <aoxv9PJd6r_8DaNA@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_073945_521345_2ACCF5C6 
X-CRM114-Status: GOOD (  20.35  )
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

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQouLi4NCg0KPiA+ICtpbnQgcnRrX2Nsa19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QNCj4gPiArcnRr
X2Nsa19kZXNjICpkZXNjKSB7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4gPiArICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gKyAgICAgc3RydWN0
IGNsa19odyAqaHc7DQo+ID4gKyAgICAgaW50IGksIHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmVn
bWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKGRldi0+b2Zfbm9kZSk7DQo+IA0KPiBMb29raW5n
IGF0IHRoZSBTYXNoaWtvIGNvbW1lbnRzIGZvciB0aGlzIHNlcmllcy4gZGV2aWNlX25vZGVfdG9f
cmVnbWFwKCkgaGFzDQo+IHRoaXMgbm90ZSBpbiBkcml2ZXJzL21mZC9zeXNjb24uYzoNCj4gDQo+
IC8qKg0KPiAgKiBkZXZpY2Vfbm9kZV90b19yZWdtYXAoKSAtIEdldCBvciBjcmVhdGUgYSByZWdt
YXAgZm9yIHNwZWNpZmllZCBkZXZpY2UNCj4gbm9kZQ0KPiAgKiBAbnA6IERldmljZSB0cmVlIG5v
ZGUNCj4gICoNCj4gICogR2V0IGEgcmVnbWFwIGZvciB0aGUgc3BlY2lmaWVkIGRldmljZSBub2Rl
LiBJZiB0aGVyZSdzIG5vdCBhbiBleGlzdGluZw0KPiAgKiByZWdtYXAsIHRoZW4gb25lIGlzIGlu
c3RhbnRpYXRlZC4gVGhpcyBmdW5jdGlvbiBzaG91bGQgbm90IGJlIHVzZWQgaWYgdGhlDQo+ICAq
IGRldmljZSBub2RlIGhhcyBhIGN1c3RvbSByZWdtYXAgZHJpdmVyIG9yIGhhcyByZXNvdXJjZXMg
KGNsb2NrcywgcmVzZXRzKSB0bw0KPiAgKiBiZSBtYW5hZ2VkLiBVc2Ugc3lzY29uX25vZGVfdG9f
cmVnbWFwKCkgaW5zdGVhZCBmb3IgdGhvc2UgY2FzZXMuDQo+ICAqDQo+ICAqIFJldHVybjogcmVn
bWFwIHB0ciBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ICAq
Lw0KPiANCj4gU2hvdWxkIHRoaXMgYmUgbW92ZWQgdG8gc3lzY29uX25vZGVfdG9fcmVnbWFwKCk/
DQo+IA0KDQpZb3UgYXJlIHJpZ2h0IHRoYXQgdXNpbmcgZGV2aWNlX25vZGVfdG9fcmVnbWFwKCkg
aXMgaW5hcHByb3ByaWF0ZSBoZXJlLg0KSG93ZXZlciwgdGhlc2UgY2xvY2sgZG9tYWlucyBoYXZl
IHRoZWlyIG93biBkZWRpY2F0ZWQgcmVnaXN0ZXJzIGFuZCBhcmUgbm90DQpzaGFyZWQgd2l0aCBh
bnkgb3RoZXIgZHJpdmVycy4NCg0KSSB3aWxsIGRyb3AgZGV2aWNlX25vZGVfdG9fcmVnbWFwKCkg
YW5kIGluaXRpYWxpemUgdGhlIHJlZ21hcCB2aWENCmRldm1fcmVnbWFwX2luaXRfbW1pbygpIGlu
c3RlYWQuIFNpbmNlIHRoZXkgYWxsIHNoYXJlIHRoZSBleGFjdCBzYW1lIHJlZ2lzdGVyDQpmb3Jt
YXQsIEkgd2lsbCBkZWZpbmUgYSBzaGFyZWQgcmVnbWFwX2NvbmZpZyBpbiBjbGstcnRrLWNvbW1v
bi5jLg0KDQo+ID4gKyAgICAgaWYgKElTX0VSUihyZWdtYXApKQ0KPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJlZ21hcCksICJmYWlsZWQgdG8NCj4g
PiArIGdldCByZWdtYXBcbiIpOw0KPiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZGVz
Yy0+bnVtX2Nsa3M7IGkrKykNCj4gPiArICAgICAgICAgICAgIGRlc2MtPmNsa3NbaV0tPnJlZ21h
cCA9IHJlZ21hcDsNCj4gPiArDQo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGRlc2MtPmNsa19k
YXRhLT5udW07IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgaHcgPSBkZXNjLT5jbGtfZGF0YS0+
aHdzW2ldOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFodykNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgcmV0ID0gZGV2bV9jbGtf
aHdfcmVnaXN0ZXIoZGV2LCBodyk7DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxl
ZCB0byByZWdpc3Rlcg0KPiBodyBvZiBjbGslZFxuIiwgaSk7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICByZXQgPSBkZXZtX29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoZGV2LCBvZl9jbGtf
aHdfb25lY2VsbF9nZXQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlc2MtPmNsa19kYXRhKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYWRkIGNsb2NrDQo+
ID4gKyBwcm92aWRlclxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsICh2b2lkICopZGVzYyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBydGtfcmVzZXRf
Y29udHJvbGxlcl9yZWdpc3RlcihkZXYsIGRlc2MtPmF1eF9uYW1lLA0KPiA+ICtyZWdtYXApOyB9
IEVYUE9SVF9TWU1CT0xfTlNfR1BMKHJ0a19jbGtfcHJvYmUsICJDTEtfUkVBTFRFSyIpOw0KPiA+
ICsNCj4gPiArdm9pZCBydGtfY2xrX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KSB7DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IHJ0a19jbGtfZGVzYyAqZGVzYyA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoIWRlc2MpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
ZGVzYy0+bnVtX2Nsa3M7IGkrKykNCj4gPiArICAgICAgICAgICAgIGRlc2MtPmNsa3NbaV0tPnJl
Z21hcCA9IE5VTEw7DQo+IA0KPiBMb29raW5nIGF0IHRoZSBTYXNoaWtvIGNvbW1lbnRzLCBpcyB0
aGlzIHJlbW92ZSBjYWxsYmFjayByZWFsbHkgbmVlZGVkPw0KPiANCg0KV2lsbCBkcm9wLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gQnJpYW4NCg==


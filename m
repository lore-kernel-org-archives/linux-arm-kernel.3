Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6BC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36QJMW5pEJUHtQkQLki8rTjxolYQrZNrNwsjEeZsaxo=; b=ciyNDOCEmE+04QHdApAMQu48FM
	eP4/qQtuYGAmR7xrpPGZL5cpM1PDs0GPU6hcxjHkZRJ82NSIwcvp8APkMtFGlf/7fAgoXwayukVRf
	fovQFGboYQ/mhRgtyKxAbDIAuOOxco7xh5PGRfHtGlc4LTPfcm3MqbLzcVI8mJ83oAL1wtxORVgG0
	5nTm03Ur6bFPKyyzZKNKq82U/azVZveJMSTxCGB8723KlDFNYntBtKa5D52ur+Z65MeRTSW3VOCYU
	R9oV9IoO9/b0WU/i7Qcaf92u3838Lh1Jy3xq2rcNggYkcwR1EK5stTdytcSA4fuO1y8Isyj7IAftH
	pD2cH+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISYS-00000003yNy-3qGc;
	Fri, 23 May 2025 13:35:20 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISIN-00000003vds-2JHI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:18:44 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:18:33 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Fri, 23 May 2025 15:18:33 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Thomas Richard <thomas.richard@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM support
Thread-Topic: [PATCH 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Index: AQHby+UuH7XxjH3Oy02KoZkEi3Dspw==
Date: Fri, 23 May 2025 13:18:32 +0000
Message-ID: <20250523131814.1047662-5-john.ernberg@actia.se>
References: <20250523131814.1047662-1-john.ernberg@actia.se>
In-Reply-To: <20250523131814.1047662-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453607162
Content-Type: text/plain; charset="utf-8"
Content-ID: <928AE8E9249EE0458E24F6D5F153B114@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_061843_774464_5761B273 
X-CRM114-Status: GOOD (  17.42  )
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

RnJvbTogSG9yaWEgR2VhbnTEgyA8aG9yaWEuZ2VhbnRhQG54cC5jb20+DQoNClRoZSBpTVg4UVhQ
IGFuZCBpTVg4UU0gaGF2ZSBhIENBQU0gKENyeXB0b2dyYXBoaWMgQWNjZWxlcmF0aW9uIGFuZA0K
QXNzdXJhbmNlIE1vZHVsZSkgbGlrZSBtYW55IG90aGVyIGlNWHMuDQoNCkFkZCB0aGUgZGVmaW5p
dGlvbnMgZm9yIGl0Lg0KDQpKb2IgUmluZ3MgMCBhbmQgMSBhcmUgYm91bmQgdG8gdGhlIFNFQ08g
KFNlY3VyaXR5IENvbnRyb2xsZXIpIEFSTSBjb3JlDQphbmQgYXJlIG5vdCBleHBvc2VkIG91dHNp
ZGUgaXQuIFRoZXJlJ3Mgbm8gcG9pbnQgdG8gZGVmaW5lIHRoZW0gaW4gdGhlDQpiaW5kaW5ncyBh
cyB0aGV5IGNhbm5vdCBiZSB1c2VkIG91dHNpZGUgdGhlIFNFQ08uDQoNClNpZ25lZC1vZmYtYnk6
IEhvcmlhIEdlYW50xIMgPGhvcmlhLmdlYW50YUBueHAuY29tPg0KW2plcm5iZXJnOiBDb21taXQg
bWVzc2FnZSwgZml4ZWQgZHRic19jaGVjayB3YXJuaW5ncywgdHJpbW1lZCBtZW1vcnkgcmFuZ2Vz
XQ0KU2lnbmVkLW9mZi1ieTogSm9obiBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+DQoN
Ci0tLQ0KDQpJbXBvcnRlZCBmcm9tIE5YUCB0cmVlLCB0cmltbWVkIGRvd24gYW5kIGZpeGVkIHRo
ZSBkdGJzX2NoZWNrIHdhcm5pbmdzLg0KQ29uc3RyYWluZWQgdGhlIHJhbmdlcyB0byB0aGUgbmVl
ZGVkIG9uZXMuDQpDaGFuZ2VkIHRoZSBjb21taXQgbWVzc2FnZS4NCk9yaWdpbmFsIGhlcmU6IGh0
dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2xpbnV4LWlteC9jb21taXQvNjk5ZTU0YjM4NmNiOWI1
M2RlZjQwMTc5OGQwYTRlNjQ2MTA1NTgzZA0KLS0tDQogLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4LXNzLXNlY3VyaXR5LmR0c2kgIHwgMzggKysrKysrKysrKysrKysrKysrKw0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpICAgICB8ICAxICsNCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgICAgfCAgMSArDQogMyBmaWxlcyBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaQ0KDQpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpDQpuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5kZjA0ZTIwM2U3ODMNCi0tLSAvZGV2L251
bGwNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHku
ZHRzaQ0KQEAgLTAsMCArMSwzOCBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wKw0KKy8qDQorICogQ29weXJpZ2h0IDIwMTkgTlhQDQorICovDQorDQorI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmg+DQorDQorc2VjdXJpdHlfc3Vic3lzOiBidXNA
MzE0MDAwMDAgew0KKwljb21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KKwkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCisJI3NpemUtY2VsbHMgPSA8MT47DQorCXJhbmdlcyA9IDwweDMxNDAwMDAwIDB4
MCAweDMxNDAwMDAwIDB4OTAwMDA+Ow0KKw0KKwljcnlwdG86IGNyeXB0b0AzMTQwMDAwMCB7DQor
CQljb21wYXRpYmxlID0gImZzbCxzZWMtdjQuMCI7DQorCQlyZWcgPSA8MHgzMTQwMDAwMCAweDkw
MDAwPjsNCisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNDggSVJRX1RZUEVfTEVWRUxfSElHSD47
DQorCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisJCSNzaXplLWNlbGxzID0gPDE+Ow0KKwkJcmFu
Z2VzID0gPDAgMHgzMTQwMDAwMCAweDkwMDAwPjsNCisJCWZzbCxzZWMtZXJhID0gPDk+Ow0KKwkJ
cG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfQ0FBTV9KUjI+Ow0KKw0KKwkJc2VjX2pyMjog
anJAMzAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLHNlYy12NC4wLWpvYi1yaW5nIjsNCisJ
CQlyZWcgPSA8MHgzMDAwMCAweDEwMDAwPjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDUz
IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19S
X0NBQU1fSlIyPjsNCisJCX07DQorDQorCQlzZWNfanIzOiBqckA0MDAwMCB7DQorCQkJY29tcGF0
aWJsZSA9ICJmc2wsc2VjLXY0LjAtam9iLXJpbmciOw0KKwkJCXJlZyA9IDwweDQwMDAwIDB4MTAw
MDA+Ow0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0NTQgSVJRX1RZUEVfTEVWRUxfSElHSD47
DQorCQkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfQ0FBTV9KUjM+Ow0KKwkJfTsNCisJ
fTsNCit9Ow0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhx
bS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kNCmluZGV4
IDZmYTMxYmM5ZWNlOC4uNmRmMDE4NjQzZjIwIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxbS5kdHNpDQpAQCAtNjEyLDYgKzYxMiw3IEBAIHZwdV9kc3A6IGRzcEA1NTZl
ODAwMCB7DQogCX07DQogDQogCS8qIHNvcnRlZCBpbiByZWdpc3RlciBhZGRyZXNzICovDQorCSNp
bmNsdWRlICJpbXg4LXNzLXNlY3VyaXR5LmR0c2kiDQogCSNpbmNsdWRlICJpbXg4LXNzLWNtNDEu
ZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtYXVkaW8uZHRzaSINCiAJI2luY2x1ZGUgImlteDgt
c3MtdnB1LmR0c2kiDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHF4cC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
DQppbmRleCAwNTEzODMyNmYwYTUuLmUxNDAxNTVkNjVjNiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQpAQCAtMzIxLDYgKzMyMSw3IEBAIG1hcDAgew0K
IAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KIAkjaW5jbHVkZSAiaW14OC1zcy1p
bWcuZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtdnB1LmR0c2kiDQorCSNpbmNsdWRlICJpbXg4
LXNzLXNlY3VyaXR5LmR0c2kiDQogCSNpbmNsdWRlICJpbXg4LXNzLWNtNDAuZHRzaSINCiAJI2lu
Y2x1ZGUgImlteDgtc3MtZ3B1MC5kdHNpIg0KIAkjaW5jbHVkZSAiaW14OC1zcy1hZG1hLmR0c2ki
DQotLSANCjIuNDkuMA0K


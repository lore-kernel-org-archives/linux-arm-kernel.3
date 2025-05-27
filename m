Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19855C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y08a/dTVSVM+/XsHWHTfPzKKXmUsqI91RqkkVefuBdk=; b=duPyUvgm186GWzlPN5pmZXEo/2
	CYBRKLwjhNZrX9jFEYXKHSGEKvpLlVsTnWFfrs+OiE630g9A7FOxK0Pn9wCg7ocyrVNvBlcRXWjXM
	2xkfsLZZM+wBXBksnqeLPi4daOL4XLBPVz+k5UYBFCrOyKyKgq9kPmzvLKRmQAMHNuDWr0UdSKHXL
	1382GZAJ67WZzGiisNbn17db8xWGZ4xFSwcweAKjDj5/ZYmKht37gtH5XDM4VNd3KIvPmL0PApenb
	IW873GwD/tUKPbU31SAKtHMlk3fveltU7rL9nqCnqv3B1597v/NeKjrZQ4t325YC7sAb8kbrg2rw/
	vVZNXkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoe4-0000000A9Ku-3xET;
	Tue, 27 May 2025 07:22:44 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoXj-0000000A8LP-3skf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 07:16:13 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 09:16:03 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 27 May 2025 09:16:03 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v2 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Topic: [PATCH v2 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Index: AQHbztc0T1fA+eNp8E2a5tgCivNrBA==
Date: Tue, 27 May 2025 07:16:03 +0000
Message-ID: <20250527071552.1424997-5-john.ernberg@actia.se>
References: <20250527071552.1424997-1-john.ernberg@actia.se>
In-Reply-To: <20250527071552.1424997-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445360726A
Content-Type: text/plain; charset="utf-8"
Content-ID: <26D9C3FA2C04A740B422139B30F6361A@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_001611_967861_EEFE443A 
X-CRM114-Status: GOOD (  17.20  )
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
M2RlZjQwMTc5OGQwYTRlNjQ2MTA1NTgzZA0KDQotLS0NCg0KdjI6DQogLSBVc2UgbmV3IGNvbXBh
dGlibGVzIGludHJvZHVjZWQgaW4gMy80IChGcmFuayBMaSkNCi0tLQ0KIC4uLi9ib290L2R0cy9m
cmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpICB8IDM4ICsrKysrKysrKysrKysrKysrKysN
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaSAgICAgfCAgMSArDQog
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDEgKw0KIDMg
ZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLXNlY3VyaXR5LmR0c2kNCg0KZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaQ0K
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uOWVjYWJiMmQwM2U5DQot
LS0gL2Rldi9udWxsDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNz
LXNlY3VyaXR5LmR0c2kNCkBAIC0wLDAgKzEsMzggQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCsNCisvKg0KKyAqIENvcHlyaWdodCAyMDE5IE5YUA0KKyAqLw0KKw0KKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oPg0KKw0KK3NlY3VyaXR5X3N1
YnN5czogYnVzQDMxNDAwMDAwIHsNCisJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCisJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQorCSNzaXplLWNlbGxzID0gPDE+Ow0KKwlyYW5nZXMgPSA8MHgz
MTQwMDAwMCAweDAgMHgzMTQwMDAwMCAweDkwMDAwPjsNCisNCisJY3J5cHRvOiBjcnlwdG9AMzE0
MDAwMDAgew0KKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHFtLWNhYW0iLCAiZnNsLHNlYy12NC4w
IjsNCisJCXJlZyA9IDwweDMxNDAwMDAwIDB4OTAwMDA+Ow0KKwkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDE0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCisJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
KwkJI3NpemUtY2VsbHMgPSA8MT47DQorCQlyYW5nZXMgPSA8MCAweDMxNDAwMDAwIDB4OTAwMDA+
Ow0KKwkJZnNsLHNlYy1lcmEgPSA8OT47DQorCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0Nf
Ul9DQUFNX0pSMj47DQorDQorCQlzZWNfanIyOiBqckAzMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9
ICJmc2wsaW14OHFtLWpvYi1yaW5nIiwgImZzbCxzZWMtdjQuMC1qb2ItcmluZyI7DQorCQkJcmVn
ID0gPDB4MzAwMDAgMHgxMDAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ1MyBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCisJCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9DQUFN
X0pSMj47DQorCQl9Ow0KKw0KKwkJc2VjX2pyMzoganJANDAwMDAgew0KKwkJCWNvbXBhdGlibGUg
PSAiZnNsLGlteDhxbS1qb2ItcmluZyIsICJmc2wsc2VjLXY0LjAtam9iLXJpbmciOw0KKwkJCXJl
ZyA9IDwweDQwMDAwIDB4MTAwMDA+Ow0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0NTQgSVJR
X1RZUEVfTEVWRUxfSElHSD47DQorCQkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfQ0FB
TV9KUjM+Ow0KKwkJfTsNCisJfTsNCit9Ow0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHFtLmR0c2kNCmluZGV4IDZmYTMxYmM5ZWNlOC4uNmRmMDE4NjQzZjIwIDEwMDY0NA0KLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kNCisrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpDQpAQCAtNjEyLDYgKzYxMiw3IEBA
IHZwdV9kc3A6IGRzcEA1NTZlODAwMCB7DQogCX07DQogDQogCS8qIHNvcnRlZCBpbiByZWdpc3Rl
ciBhZGRyZXNzICovDQorCSNpbmNsdWRlICJpbXg4LXNzLXNlY3VyaXR5LmR0c2kiDQogCSNpbmNs
dWRlICJpbXg4LXNzLWNtNDEuZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtYXVkaW8uZHRzaSIN
CiAJI2luY2x1ZGUgImlteDgtc3MtdnB1LmR0c2kiDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OHF4cC5kdHNpDQppbmRleCAwNTEzODMyNmYwYTUuLmUxNDAxNTVkNjVjNiAxMDA2
NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQpAQCAtMzIxLDYg
KzMyMSw3IEBAIG1hcDAgew0KIAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KIAkj
aW5jbHVkZSAiaW14OC1zcy1pbWcuZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtdnB1LmR0c2ki
DQorCSNpbmNsdWRlICJpbXg4LXNzLXNlY3VyaXR5LmR0c2kiDQogCSNpbmNsdWRlICJpbXg4LXNz
LWNtNDAuZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtZ3B1MC5kdHNpIg0KIAkjaW5jbHVkZSAi
aW14OC1zcy1hZG1hLmR0c2kiDQotLSANCjIuNDkuMA0K


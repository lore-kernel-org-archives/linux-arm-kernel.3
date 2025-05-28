Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EC8C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0xV6EzExbkEJOL/y+gejGBDzr+C+HIce0XGvVtJSLE=; b=FHSmA6lYczOKmTORlXOqAtEvyB
	bFjaeXEkTwdUcXgrNIQj93/nHGbvohQd5GE1+xtJOMi+aMIHDpN+oEWck+AFyLIzKx+xPTx3bkaUJ
	adSK0IT7md2NQiPrd2Uk8L+wxckw9ThCieQJ+rzArsOktME5bcJWAJkfgdxAuuquQu/sgR35Ei+tr
	Cx3EjErjisPvejOgjE9VlLz7XJ2WkXlZwo5uE9uejo5SJpZLv+c3bv6jg8F/0+e7IdRAVyC97BwfA
	eGjB1lnZ9jf7BORw4WZx0z/2AXu4yIweKjiN9KkHBlocrZkXRET4JJAw76Jp6YwQ4j7Faal/k0LR0
	4rdNhO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIAY-0000000DTtF-46J6;
	Wed, 28 May 2025 14:54:14 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHzx-0000000DRuP-0kJn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:43:18 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 16:43:08 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Wed, 28 May 2025 16:43:08 +0200
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
Subject: [PATCH v3 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Topic: [PATCH v3 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Index: AQHbz97Tt285JTpbTEmv8WU56gl5og==
Date: Wed, 28 May 2025 14:43:08 +0000
Message-ID: <20250528144259.2603914-5-john.ernberg@actia.se>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
In-Reply-To: <20250528144259.2603914-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453607C60
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A8DC40C555BA24E83914717FD2E9602@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_074317_218051_F4E6D39E 
X-CRM114-Status: GOOD (  17.75  )
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
M2RlZjQwMTc5OGQwYTRlNjQ2MTA1NTgzZA0KDQotLS0NCg0KdjM6DQogLSBubyBjaGFuZ2VzDQoN
CnYyOg0KIC0gVXNlIG5ldyBjb21wYXRpYmxlcyBpbnRyb2R1Y2VkIGluIDMvNCAoRnJhbmsgTGkp
DQotLS0NCiAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaSAgfCAz
OCArKysrKysrKysrKysrKysrKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OHFtLmR0c2kgICAgIHwgIDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhx
eHAuZHRzaSAgICB8ICAxICsNCiAzIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1z
ZWN1cml0eS5kdHNpDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4LXNzLXNlY3VyaXR5LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4LXNzLXNlY3VyaXR5LmR0c2kNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAw
MDAwMDAuLjllY2FiYjJkMDNlOQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpDQpAQCAtMCwwICsxLDM4IEBADQor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQorLyoNCisgKiBDb3B5cmlnaHQg
MjAxOSBOWFANCisgKi8NCisNCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3Jz
cmMuaD4NCisNCitzZWN1cml0eV9zdWJzeXM6IGJ1c0AzMTQwMDAwMCB7DQorCWNvbXBhdGlibGUg
PSAic2ltcGxlLWJ1cyI7DQorCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKwkjc2l6ZS1jZWxscyA9
IDwxPjsNCisJcmFuZ2VzID0gPDB4MzE0MDAwMDAgMHgwIDB4MzE0MDAwMDAgMHg5MDAwMD47DQor
DQorCWNyeXB0bzogY3J5cHRvQDMxNDAwMDAwIHsNCisJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhx
bS1jYWFtIiwgImZzbCxzZWMtdjQuMCI7DQorCQlyZWcgPSA8MHgzMTQwMDAwMCAweDkwMDAwPjsN
CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNDggSVJRX1RZUEVfTEVWRUxfSElHSD47DQorCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCisJCSNzaXplLWNlbGxzID0gPDE+Ow0KKwkJcmFuZ2VzID0g
PDAgMHgzMTQwMDAwMCAweDkwMDAwPjsNCisJCWZzbCxzZWMtZXJhID0gPDk+Ow0KKwkJcG93ZXIt
ZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfQ0FBTV9KUjI+Ow0KKw0KKwkJc2VjX2pyMjoganJAMzAw
MDAgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxbS1qb2ItcmluZyIsICJmc2wsc2VjLXY0
LjAtam9iLXJpbmciOw0KKwkJCXJlZyA9IDwweDMwMDAwIDB4MTAwMDA+Ow0KKwkJCWludGVycnVw
dHMgPSA8R0lDX1NQSSA0NTMgSVJRX1RZUEVfTEVWRUxfSElHSD47DQorCQkJcG93ZXItZG9tYWlu
cyA9IDwmcGQgSU1YX1NDX1JfQ0FBTV9KUjI+Ow0KKwkJfTsNCisNCisJCXNlY19qcjM6IGpyQDQw
MDAwIHsNCisJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cW0tam9iLXJpbmciLCAiZnNsLHNlYy12
NC4wLWpvYi1yaW5nIjsNCisJCQlyZWcgPSA8MHg0MDAwMCAweDEwMDAwPjsNCisJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgNDU0IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJCXBvd2VyLWRvbWFp
bnMgPSA8JnBkIElNWF9TQ19SX0NBQU1fSlIzPjsNCisJCX07DQorCX07DQorfTsNCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpDQppbmRleCA2ZmEzMWJjOWVjZTguLjZk
ZjAxODY0M2YyMCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhxbS5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRz
aQ0KQEAgLTYxMiw2ICs2MTIsNyBAQCB2cHVfZHNwOiBkc3BANTU2ZTgwMDAgew0KIAl9Ow0KIA0K
IAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KKwkjaW5jbHVkZSAiaW14OC1zcy1z
ZWN1cml0eS5kdHNpIg0KIAkjaW5jbHVkZSAiaW14OC1zcy1jbTQxLmR0c2kiDQogCSNpbmNsdWRl
ICJpbXg4LXNzLWF1ZGlvLmR0c2kiDQogCSNpbmNsdWRlICJpbXg4LXNzLXZwdS5kdHNpIg0KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KaW5kZXggMDUxMzgzMjZm
MGE1Li5lMTQwMTU1ZDY1YzYgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4cXhwLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhxeHAuZHRzaQ0KQEAgLTMyMSw2ICszMjEsNyBAQCBtYXAwIHsNCiAJLyogc29ydGVkIGluIHJl
Z2lzdGVyIGFkZHJlc3MgKi8NCiAJI2luY2x1ZGUgImlteDgtc3MtaW1nLmR0c2kiDQogCSNpbmNs
dWRlICJpbXg4LXNzLXZwdS5kdHNpIg0KKwkjaW5jbHVkZSAiaW14OC1zcy1zZWN1cml0eS5kdHNp
Ig0KIAkjaW5jbHVkZSAiaW14OC1zcy1jbTQwLmR0c2kiDQogCSNpbmNsdWRlICJpbXg4LXNzLWdw
dTAuZHRzaSINCiAJI2luY2x1ZGUgImlteDgtc3MtYWRtYS5kdHNpIg0KLS0gDQoyLjQ5LjANCg==


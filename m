Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E212C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OinrcQkKP+invtmfZEgmKc9uaH1M7ZYOcO3eHfnnWrM=; b=ZaJI2wWcJSl/VikSYGT37Cu7oU
	WgCSq5kXRIqeeyPeVchboRAczoI6Q15a0oryJR7V9VXkLG+1pZmhi3S0bebBR1FOC/0fnsMmlTvze
	JF2kAnV2jlDjkSk52hX5wNJpIkDMQiWzIp+/ieJeEXAOnuam0l4Mi8r9160l+zoRHyW9zrbr6PPRe
	KfLBVO4UjyFseV6z15FijFTA/xfColT9fn4uK+fP+Uf72phDCjIEwSMMyl9hqDwabej8XgUYdBvDN
	2sffsxbOdhpdTX2BSXMqoa2SxZmYsSE0pp47As8v79Gy9NxdEFIlQ8Jys2YjdIxx9hejLwxYF4NwO
	D76crdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZzD-0000000FShg-1IwT;
	Thu, 29 May 2025 09:55:43 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZtA-0000000FSDC-2S5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:49:29 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 11:49:26 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 29 May 2025 11:49:26 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Frank Li <Frank.li@nxp.com>
CC: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Topic: [PATCH v3 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Thread-Index: AQHbz97Tt285JTpbTEmv8WU56gl5orPoAYiAgAE7H4A=
Date: Thu, 29 May 2025 09:49:26 +0000
Message-ID: <aDgtpd_pXyLjgoIJ@w447anl.localdomain>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-5-john.ernberg@actia.se>
 <aDclTQ8Z5WcHMxgT@lizhi-Precision-Tower-5810>
In-Reply-To: <aDclTQ8Z5WcHMxgT@lizhi-Precision-Tower-5810>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453637562
Content-Type: text/plain; charset="utf-8"
Content-ID: <1915B73BA669544EBEE2CF7E9C60C389@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_024928_620629_9C45B7D7 
X-CRM114-Status: GOOD (  19.04  )
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

SGkgRnJhbmssDQoNCk9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDExOjAxOjMzQU0gLTA0MDAsIEZy
YW5rIExpIHdyb3RlOg0KPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAwMjo0MzowOFBNICswMDAw
LCBKb2huIEVybmJlcmcgd3JvdGU6DQo+ID4gRnJvbTogSG9yaWEgR2VhbnTEgyA8aG9yaWEuZ2Vh
bnRhQG54cC5jb20+DQo+ID4NCj4gPiBUaGUgaU1YOFFYUCBhbmQgaU1YOFFNIGhhdmUgYSBDQUFN
IChDcnlwdG9ncmFwaGljIEFjY2VsZXJhdGlvbiBhbmQNCj4gPiBBc3N1cmFuY2UgTW9kdWxlKSBs
aWtlIG1hbnkgb3RoZXIgaU1Ycy4NCj4gPg0KPiA+IEFkZCB0aGUgZGVmaW5pdGlvbnMgZm9yIGl0
Lg0KPiA+DQo+ID4gSm9iIFJpbmdzIDAgYW5kIDEgYXJlIGJvdW5kIHRvIHRoZSBTRUNPIChTZWN1
cml0eSBDb250cm9sbGVyKSBBUk0gY29yZQ0KPiA+IGFuZCBhcmUgbm90IGV4cG9zZWQgb3V0c2lk
ZSBpdC4gVGhlcmUncyBubyBwb2ludCB0byBkZWZpbmUgdGhlbSBpbiB0aGUNCj4gPiBiaW5kaW5n
cyBhcyB0aGV5IGNhbm5vdCBiZSB1c2VkIG91dHNpZGUgdGhlIFNFQ08uDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIb3JpYSBHZWFudMSDIDxob3JpYS5nZWFudGFAbnhwLmNvbT4NCj4gPiBbamVy
bmJlcmc6IENvbW1pdCBtZXNzYWdlLCBmaXhlZCBkdGJzX2NoZWNrIHdhcm5pbmdzLCB0cmltbWVk
IG1lbW9yeSByYW5nZXNdDQo+IA0KPiB3aGF0J3MgdGhpcyBmb3I/ICByZW1vdmUgaXQgaWYgbm90
IHJlbGF0ZWQgd2l0aCB0aGlzIHBhdGNoLg0KDQpUaGVzZSBhcmUgdGhlIGFkanVzdG1lbnRzIEkg
ZGlkIHRvIHRoZSBwYXRjaCBieSBIb3JpYSB0aGF0IEkgdG9vayBvdXQgb2YNCnRoZSBsaW51eC1p
bXggdHJlZSAob3JpZ2luYWwgcGF0Y2ggbGlua2VkIGJlbG93IGluIGNvbnRleHQpLg0KDQpXaGls
ZSBub3QgcGFydCBvZiB0aGUgcHJvY2VzcyBJIGhhdmUgc2VlbiB0aGVtIHVzZWQgYW5kIGZvdW5k
IHRoZW0gaGVscGZ1bCwNCkkgY2FuIGRyb3AgaXQgaWYgcHJlZmVycmVkLg0KDQpCZXN0IHJlZ2Fy
ZHMgLy8gSm9obiBFcm5iZXJnDQoNCj4gDQo+IEZyYW5rDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPg0KPiA+DQo+ID4gLS0tDQo+ID4N
Cj4gPiBJbXBvcnRlZCBmcm9tIE5YUCB0cmVlLCB0cmltbWVkIGRvd24gYW5kIGZpeGVkIHRoZSBk
dGJzX2NoZWNrIHdhcm5pbmdzLg0KPiA+IENvbnN0cmFpbmVkIHRoZSByYW5nZXMgdG8gdGhlIG5l
ZWRlZCBvbmVzLg0KPiA+IENoYW5nZWQgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+IE9yaWdpbmFs
IGhlcmU6IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2xpbnV4LWlteC9jb21taXQvNjk5ZTU0
YjM4NmNiOWI1M2RlZjQwMTc5OGQwYTRlNjQ2MTA1NTgzZA0KPiA+DQo+ID4gLS0t


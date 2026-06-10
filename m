Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A03CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsmYCQzt+o3RV3waHI3Bqu1fLdPPjGC+Dw+9KHYIaC4=; b=QVT7TYmrMmwVDPAR6f6f+/qMej
	n+c/4lmx7FimwYcAHa/G1CkyBNkwvMICJvf+PeF6GvJ5LQM5x5MiaCrwiU/vcfRQYNXDks2un3jWD
	Bro+20NSL6uRxnlgZn5DSXJKUtu1PuwFRNJG7vUA1jB8swe2cDgllPp7vUVcpiiYTFDqXmmPlJh8K
	h16SjVv0bTjtzta3OXqndolq66vOwgaceu0TkMwK9iZvB1WIIH1ueh8QQok/gokz3ouLCNH3keNhO
	88UTFFEkNgWZl4RTwFTvKTypW2T5Fy0nKArrIscPRqyLEnDyg0mERSHbPP5Ps8RlZN9MABhJyonBO
	g4/Yrx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGcm-00000007TMt-3nep;
	Wed, 10 Jun 2026 10:57:32 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGcj-00000007TL2-408K;
	Wed, 10 Jun 2026 10:57:31 +0000
X-UUID: 2a1879f464bb11f1a87c2323a98e90a4-20260610
X-CID-CACHE: Type:Local,Time:202606101857+08,HitQuantity:4
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0078cb74-26f9-43bd-bad1-307f654ecea2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:3da9e7a4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|817|836|865|
	888|898,TC:-5,Content:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:11|99|82|106|1,Fil
	e:130,RT:-1,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a1879f464bb11f1a87c2323a98e90a4-20260610
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1766043707; Wed, 10 Jun 2026 18:57:25 +0800
X-UUID: fafd74a864ba11f193ca45dd90e675b2-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:dc6ba2bd-5014-4963-bb9a-a7c71c44cb72,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:e08c882a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|817|836|865|
	888|898,TC:-5,Content:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:11|99|82|106|1,Fil
	e:130,RT:-1,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fafd74a864ba11f193ca45dd90e675b2-20260610
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1492383430; Wed, 10 Jun 2026 18:56:06 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Wed, 10 Jun 2026 18:56:00 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Wed, 10 Jun 2026 18:56:00 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Jakub Kicinski
	<kuba@kernel.org>, Jack Wu via B4 Relay
	<devnull+jackbb_wu.compal.com@kernel.org>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>, Johannes Berg
	<johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
	<Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "wojackbb@gmail.com" <wojackbb@gmail.com>
Subject: RE: [External Mail] Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Topic: [External Mail] Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Index: AQHc8iePJegWnmu1bUi94DWo9+PN/LYrGJEzgAAe7YCAAtdz8IAJmspd
Date: Wed, 10 Jun 2026 10:56:00 +0000
Message-ID: <8f058bd8d7e54ec682d62c8f8cbeeb93@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260601173401.2c892526@kernel.org>
 <c279aea41ecf41c6aca4314a2f4e306b@compal.com>,<e7df5082-ef48-43d0-ad07-10e1e64e1d26@gmail.com>,<98dcaccc34ac4083aef7d57d349c4b7a@compal.com>
In-Reply-To: <98dcaccc34ac4083aef7d57d349c4b7a@compal.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-as-result: No-10--31.405600-8.000000
x-tmase-matchedrid: ySitKx1yZtkuv++HU7VXryRFbfQbCufdN0X64jGy2dbVc/AFNTvLS9XY
	nKy9ZqbG0wNjG7j2lpfWtteiDVXz7mpW0A+eYNud4WMcbQqR5OFkrVIXZHd52KloHyDFpaEsbxq
	9W35blN9+M8NObIEDkCLCiAPpH5Zk/7zDDoXJoQ2DhqUecocKp1Izqo1F8yQS6ZPX83a4JSt/+c
	5g4eNP+u8BzumvjiFCXT2nCSyOs5j74diwVvyjRcFwCSR9lLGI8kOnQJj3cxIkxtQqXREtZO/yM
	kwYZmJ2tOKF1u0biJAV2Z+xPG+d+I62nm6DaDgUVnni4UoVxuO6wG+1uTW14Id1FpoF4NeYU19U
	ImjpbIGuh6YVToIwy41RNFEIob/KmQi8fYMxpGuFhGp9GNPDrc1nntU6vE00IXRpMFb6AcKB0h0
	6Pr4Hn4t7NVVLHZ3t19I3/idrQ/CnuESkPwwQeXklMOiBtXiEHKqgYbpP2hyqHwywAOvb9XdQkp
	MxxUGIhuCUFs6dGYrIgOfnPMXSLX09KsQd2DQzjmPZ0N3CeosKVVHIs2YAvkqeu0zeBUVuBx6SO
	Ojq0ZiamtHOLn4EBMN+7Q+g/XmFvyTqgw6abkQRLjqoJJt/9frDHrB5YKTLXFAIRSIiEKJxg7sv
	MtapLiJsZ0L4JGotLb8DWiq6ZlRX9HM7P8GE6Q==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--31.405600-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-snts-smtp: F0C02E8CA2FE024CD9E79C7CA05254B62E68CEAF98652B2FB8F2B1EBA89A107E2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_035730_346114_50A131E0 
X-CRM114-Status: GOOD (  33.51  )
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

PiBsZXQgbWUgam9pbiB0aGUgZGlzY3Vzc2lvbiBhbmQgcHV0IG15IDJjLg0KPg0KPiBPbiA2LzIv
MjYgMTM6NTgsIFd1LiBKYWNrQkIgKEdTTSkgd3JvdGU6DQo+ID4gSGkgSmFrdWIsDQo+ID4NCj4g
PiA+IE9uIEZyaSwgMjkgTWF5IDIwMjYgMTg6MzE6MzkgKzA4MDAgSmFjayBXdSB2aWEgQjQgUmVs
YXkgd3JvdGU6DQo+ID4gPiA+IDQzIGZpbGVzIGNoYW5nZWQsIDE0NzYxIGluc2VydGlvbnMoKykN
Cj4gPiA+DQo+ID4gPiBQbGVhc2UgdHJ5IHRvIGN1dCB0aGlzIGRvd24gdG8gfjVrTG9DIGZvciB0
aGUgaW5pdGlhbCBzdWJtaXNzaW9uLg0KPiA+ID4gV2hhdGV2ZXIgdGhlIGFic29sdXRlIG1pbmlt
dW0gc2Vuc2libGUgY2h1bmsgb2YgY29kZSBpcy4NCj4gPiA+DQo+ID4gPiBFYWNoIHBhdGNoIG11
c3QgYnVpbGQgY2xlYW5seSB3aXRoIFc9MQ0KPiA+DQo+ID4gV2UndmUgYWxyZWFkeSByZWR1Y2Vk
IHRoaXMgc2lnbmlmaWNhbnRseSBmcm9tIHRoZSBvcmlnaW5hbCA0MWsgTG9DDQo+ID4gZG93biB0
byB+MTQuN2sgYnkgc3RyaXBwaW5nIG91dCBub24tZXNzZW50aWFsIGZlYXR1cmVzIHN1Y2ggYXMN
Cj4gPiBleGNlcHRpb24gaGFuZGxpbmcsIG1lbW9yeSBsb2dnaW5nLCBkZXZsaW5rLCBzdGF0aXN0
aWNzLCBkZWJ1Zw0KPiA+IHRyYWNpbmcsIGFuZCBvdGhlcnMuDQo+ID4NCj4gPiBXZSBldmVuIHJl
bW92ZWQgc29tZSBhcmd1YWJseSBuZWNlc3NhcnkgZmVhdHVyZXMgKFBNLCBtZGxvZywNCj4gPiB0
aHJvdWdocHV0IG9wdGltaXphdGlvbnMpIHRoYXQgd2UgcGxhbiB0byBzdWJtaXQgYXMgZm9sbG93
LXVwDQo+ID4gc2VyaWVzLg0KPg0KPiBHcmVhdCB3b3JrLiBIaWdobHkgYXBwcmVjaWF0ZSENCj4N
Cj4gPiBOb3RlIHRoYXQgdGhlIGxpbmUgY291bnQgbWF5IHNsaWdodGx5IGluY3JlYXNlIGluIHYy
LCBhcyB3ZSBwbGFuDQo+ID4gdG8gYWRkIG1pc3Npbmcga2RvYyBjb21tZW50cyBiYXNlZCBvbiBy
ZXZpZXcgZmVlZGJhY2suDQo+ID4NCj4gPiBGb3IgcmVmZXJlbmNlLCB0aGUgdDd4eCBkcml2ZXIg
KHR3byBnZW5lcmF0aW9ucyBvbGRlciwgc2ltcGxlciBIVykNCj4gPiBoYWQgYW4gaW5pdGlhbCBz
dWJtaXNzaW9uIG9mIH4xMS4zayBMb0MgWzFdLiBUaGUgdDl4eCBoYXJkd2FyZSBpcw0KPiA+IG1v
cmUgY29tcGxleCwgc28gd2UgYmVsaWV2ZSBiZWluZyBpbiBhIHNpbWlsYXIgcmFuZ2UgaXMgcmVh
c29uYWJsZS4NCj4NCj4gTGV0IG1lIGVsYWJvcmF0ZSBhIGJpdCBoZXJlLiBUaGUgc2l6ZSBwcm9i
bGVtIGlzIG5vdCBkdWUgdG8gYSBnaXQgb3IgYQ0KPiBtYWlsYm94IGxpbWl0YXRpb24uIEl0IGFy
aXNlIGR1ZSB0byB0aGUgaHVtYW4gbGltaXRhdGlvbi4gVGhlIFQ3eHgNCj4gc3VibWlzc2lvbiBy
ZXZpZXcgdG9vayBzb21ldGhpbmcgYWJvdXQgNCBtb250aHMgYW5kIDggaXRlcmF0aW9ucy4gQW5k
IGl0DQo+IHdhcyAnb25seScgMTEuM2sgbGluZXMuIExldCdzIGRvIHNvbWUgZXh0cmFwb2xhdGlv
biBhc3N1bWluZyB0aGF0DQo+IGZ1bmN0aW9uIGlzIGxpbmVhci4gMTQuN2sgaXMgMzAlIGJpZ2dl
ciwgdGh1cywgZXN0aW1hdGVkIHJldmlld2luZyB0aW1lDQo+IHNob3VsZCBiZSA1IG1vbnRocyBh
bmQgMiB3ZWVrcy4gQW5kIHRoaXMgbG9va3Mgb3B0aW1pc3RpYy4NCj4NCj4gUmVjb21tZW5kYXRp
b24sIHNoYXJlZCBieSBKYWt1YiwgaXMgcHJhY3RpY2FsLiA1ayBsaW5lcyBtaWdodCBiZQ0KPiBy
ZXZpZXdlZCBpbiBhIHJlYXNvbmFibGUgdGltZSBhbmQgbWVyZ2VkIHdpdGggdGhlIGZ1bGwgY29u
ZmlkZW5jZSBvZiB0aGUNCj4gcXVhbGl0eS4NCj4NCj4gPiBXZSdkIGxpa2UgdG8ga2VlcCB0aGUg
ZHJpdmVyIGZ1bmN0aW9uYWwgYW5kIHJldmlld2FibGUgaW4gaXRzDQo+ID4gY3VycmVudCBzY29w
ZS4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB3ZSBjb3VsZCBmdXJ0aGVyDQo+
ID4gcmVkdWNlIHRoZSBzaXplIHdoaWxlIG1haW50YWluaW5nIGEgd29ya2luZyBpbml0aWFsIHN1
Ym1pc3Npb24/DQo+DQo+IE9mZiB0aGUgdG9wIG9mIG15IGhlYWQsIEkgd291bGQgc3VnZ2VzdCBq
b2luaW5nIFQ3eHggYW5kIFQ5eHggY29kZQ0KPiBiYXNlcy4gSXQgY291bGQgYmUgZG9uZSB0aHJv
dWdoIGZhY3RvcmluZyBvdXQgYSBjb3JlIGZ1bmN0aW9uYWxpdHkgb2YNCj4gVDd4eCBpbnRvIGEg
bGlicmFyeSwgb3IgdGhyb3VnaCBtYWtpbmcgdGhlIGRyaXZlciBsYXllcmVkLg0KPg0KPiBJIGFt
IG5vdCBwcmV0ZW5kaW5nIGJlaW5nIGFuIGV4cGVydCBpbiBhbnkgb2YgdGhlc2UgZHJpdmVycywg
YnV0DQo+IGdlbmVyYWxseSBkaXZpZGUtbi1jb25xdWVyb3IgdG9nZXRoZXIgd2l0aCBjb2RlIHJl
dXNlIHdvcmsgcmVsaWFibGUuIEFzDQo+IGFuIGFsdGVybmF0aXZlLCBJIGNvdWxkIHNwZW5kIGEg
Y291cGxlIG9mIHdlZWtzIHJldmlld2luZyB0aGUgbmV3DQo+IHN1Ym1pc3Npb24gYW5kIHdpbGwg
Y29tZSB3aXRoIG1vcmUgc3BlY2lmaWMgaWRlYXMgb24gd2hhdCBjYW4gYmUgdGhyb3duDQo+IGF3
YXkgb3IgcmV1c2VkLg0KPg0KDQogIFRoYW5rIHlvdSBhZ2FpbiBmb3IgdGhlIHN1Z2dlc3Rpb25z
IG9uIHJlZHVjaW5nIHRoZSBzdWJtaXNzaW9uIHNpemUuDQoNCiAgV2Ugd2VudCB3aXRoIHRoZSBz
cGxpdCBhcHByb2FjaCBkaXNjdXNzZWQgZWFybGllciChWCB2MiBjb3ZlcnMgb25seSB0aGUNCiAg
Y29udHJvbCBwbGFuZSAocGF0Y2hlcyAxoVY2KSBwbHVzIGEgTUFJTlRBSU5FUlMgZW50cnksIGJy
aW5naW5nIGl0IGRvd24NCiAgdG8gfjcuOWsgTG9DIGFjcm9zcyA3IHBhdGNoZXMuIFRoZSBkYXRh
IHBsYW5lIHdpbGwgZm9sbG93IGFzIGEgc2VwYXJhdGUNCiAgc2VyaWVzIG9uY2UgdGhlIGNvbnRy
b2wgcGxhbmUgaXMgYWNjZXB0ZWQuDQoNCiAgdjIgYWxzbyBhZGRyZXNzZXMgYWxsIHJldmlldyBm
ZWVkYmFjayBmcm9tIHYxLCBpbmNsdWRpbmcgVz0xIGNsZWFuDQogIGJ1aWxkcyBmb3IgZWFjaCBw
YXRjaC4NCg0KICBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA2MTAt
dDl4eF9kcml2ZXJfdjEtdjItMC1jNjVhZGRmMjNiM2ZAY29tcGFsLmNvbQ0KDQogIFdlIHdvdWxk
IGFwcHJlY2lhdGUgYW55IGZ1cnRoZXIgZmVlZGJhY2sgeW91IG1heSBoYXZlLg0KDQogIEJlc3Qg
cmVnYXJkcywNCiAgSmFjaw0KDQo+ID4gWzFdDQo+ID4gIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9uZXRkZXZicGYvY292ZXIvMjAyMjA1MDYxODEzMTAuMjE4MzgyOS0xLXJp
Y2FyZG8ubWFydGluZXpAbGludXguaW50ZWwuY29tLw0KPiA+DQo+ID4gVGhhbmtzLg0KPiA+DQo+
ID4NCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+
ID4gVGhpcyBtZXNzYWdlIG1heSBjb250YWluIGluZm9ybWF0aW9uIHdoaWNoIGlzIHByaXZhdGUs
IHByaXZpbGVnZWQgb3INCj4gPiBjb25maWRlbnRpYWwgb2YgQ29tcGFsIEVsZWN0cm9uaWNzLCBJ
bmMuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZA0KPiA+IHJlY2lwaWVudCBvZiB0aGlzIG1l
c3NhZ2UsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVzdHJveS9kZWxldGUgdGhlDQo+
ID4gbWVzc2FnZS4gQW55IHJldmlldywgcmV0cmFuc21pc3Npb24sIGRpc3NlbWluYXRpb24gb3Ig
b3RoZXIgdXNlIG9mLCBvcg0KPiA+IHRha2luZyBvZiBhbnkgYWN0aW9uIGluIHJlbGlhbmNlIHVw
b24gdGhpcyBpbmZvcm1hdGlvbiwgYnkgcGVyc29ucyBvcg0KPiA+IGVudGl0aWVzIG90aGVyIHRo
YW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBwcm9oaWJpdGVkLg0KPiA+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4NCj4gQW5kIHRoaXMgZGlzY2xh
aW1lciBkb2VzIG5vdCBmYWNpbGl0YXRlIHRoZSByZXZpZXcuIEFtIEkgJ2ludGVuZGVkJw0KPiBy
ZWNpcGllbnQgb3Igc2hvdWxkIEkgZGVzdHJveSB0aGUgbWVzc2FnZSBBU0FQPw0KDQpXZSBhcG9s
b2dpemUgZm9yIGFueSBpbmNvbnZlbmllbmNlIHRoaXMgbWF5IGNhdXNlLg0KDQpDb3VsZCBJIHVz
ZSBteSBwZXJzb25hbCBlbWFpbCBhZGRyZXNzICh3b2phY2tiYkBnbWFpbC5jb20pIHRvIGRpc2N1
c3MgY29kZSByZXZpZXc/DQoNClRoaXMgd291bGQgYXZvaWQgdGhpcyBpc3N1ZS4NCg0KVGhhbmtz
Lg0KDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NClRo
aXMgbWVzc2FnZSBtYXkgY29udGFpbiBpbmZvcm1hdGlvbiB3aGljaCBpcyBwcml2YXRlLCBwcml2
aWxlZ2VkIG9yIGNvbmZpZGVudGlhbCBvZiBDb21wYWwgRWxlY3Ryb25pY3MsIEluYy4gSWYgeW91
IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIG1lc3NhZ2UsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciBhbmQgZGVzdHJveS9kZWxldGUgdGhlIG1lc3NhZ2UuIEFueSByZXZp
ZXcsIHJldHJhbnNtaXNzaW9uLCBkaXNzZW1pbmF0aW9uIG9yIG90aGVyIHVzZSBvZiwgb3IgdGFr
aW5nIG9mIGFueSBhY3Rpb24gaW4gcmVsaWFuY2UgdXBvbiB0aGlzIGluZm9ybWF0aW9uLCBieSBw
ZXJzb25zIG9yIGVudGl0aWVzIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBw
cm9oaWJpdGVkLg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0K


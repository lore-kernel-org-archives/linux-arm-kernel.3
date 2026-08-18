Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785CAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o95+dGe2lZwMciIdj1990zSZR9RoP9oK8e84NguWWls=; b=e8jCE8VXGRAgByCuSi4BLcCzvF
	tVzm73OrYm8VOC+WSXYg34F067XMTW7d0729PQpwwOxA1aezVRkSkGzgHz2G067eSFciY6JdkJU5M
	l2Tke4ESVMacJVD+cyEm8fhsdmfkUdr33vubaPB+LWe6WIrYti8znj1lWV2Z/AeTZpmDT4ZwDlzY5
	ovo7/XMNR7eTHXKimkCOdbqCsd7phDMU3RyViUKgOfsobHkby7SvbaQjoVNfM1bc75bzpdf7thp+p
	+PZLSaB6jzu1GLmQRehdcS1lbLzelVAaMAiMjwX2PRPxfVPYQIIxdUb7Wn3/9G+9MrEwFaGXPjoDQ
	5bx9gg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIod-00000007uqG-1aYP;
	Tue, 18 Aug 2026 12:21:15 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIoZ-00000007upM-2Zqz;
	Tue, 18 Aug 2026 12:21:14 +0000
X-UUID: 4499bc969aff11f1b2470fb4f881575f-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8f7602cf-93c4-439d-a387-dd9c74249285,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7f1ae54,CLOUDID:f252fff1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4499bc969aff11f1b2470fb4f881575f-20260818
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1197951111; Tue, 18 Aug 2026 20:20:58 +0800
X-UUID: 406d7d889aff11f1a9f9c99e036204b4-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e11947a9-b923-45fd-a231-f79468464d8d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:371b1124-78f2-442a-bf4c-8228a1b653b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 406d7d889aff11f1a9f9c99e036204b4-20260818
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 91996563; Tue, 18 Aug 2026 20:20:51 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Tue, 18 Aug 2026 20:20:48 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Tue, 18 Aug 2026 20:20:48 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>, Jack Wu via B4 Relay
	<devnull+jackbb_wu.compal.com@kernel.org>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Wen-Zhi
 Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
	"Minano Tseng" <Minano.tseng@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Simon Horman" <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"Yu. Robert (GSM)" <robert_yu@compal.com>, "Chang. Jeff (GSM)"
	<Jeff_Chang@compal.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v6 0/7] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Topic: [External Mail] Re: [PATCH v6 0/7] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Index: AQHdLplh6WkyumRPKUmREg8WmPgZkbajujDR
Date: Tue, 18 Aug 2026 12:20:48 +0000
Message-ID: <8040d0a7a42c428baa3aec46bba6bec2@compal.com>
References: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>,<20260817153958.4b120ce9@kernel.org>
In-Reply-To: <20260817153958.4b120ce9@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-as-result: No-10--15.520700-8.000000
x-tmase-matchedrid: 17iyaxE7EzIuv++HU7VXryRFbfQbCufdN0X64jGy2dbsEpKlvft9qjRG
	JnoK3ysiHe/Upp/4ecRLyT/MN7wrGVhzQ/Tix+nNNLxBLGvmmCRkrVIXZHd52ALbwVZWOSEX4kw
	dNFZOfC76xO7vZu5A28G8AIXlLA0nbVJbuBUpqcCeKdOylUhP2VHdSSkRFiZkreGXMMoufLm5Rz
	EGHN4/BWh0k1oC3GkQ04edJN77sRYptHIgj0tkE4i/ka5VrHsKlIhi5GPAGeNdkzEmKKnHIP9vf
	1NXtdDv0mBu7EWIkV4ymx1OgmpWWkcX1B9oqpNpnSty3uLSJPTuB3lKociGMqAcDPu7eAhBmBGz
	eOcTpv/Q+sS71+DOCCTavWo/K3hlv9rSd36EgULA931+mNd9sJs7gkGWoKY36QLge8Tcpn0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.520700-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-snts-smtp: 5E8AF933061CD3863F1CFDC5F8DC0848C521E9B58D432474CAB7AA981997B7422000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_052112_027590_8645D72F 
X-CRM114-Status: GOOD (  10.13  )
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

T24gTW9uLCAxNyBBdWcgMjAyNiBhdCAyMjozOSwgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IFRoaXMgRlNNIGV4aXN0cyBpbiB0aGUgZHJpdmVyLCBldmVuIHRobyB5
b3UgY2FsbCBpdCAiY29yZSBsb2dpYyIuDQo+IFBsZWFzZSBwcm92aWRlIG1vcmUgZGV0YWlscyBp
biB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gb2YgcGF0Y2ggNQ0KPiBhbmQgY29uc2lkZXIgd2hldGhl
ciBhbnkgb2YgdGhpcyBsb2dpYyBzaG91bGQgbGl2ZSBpbiB0aGUgV1dBTg0KPiBmcmFtZXdvcmsu
DQoNCkdvb2QgcG9pbnQgb24gdGhlIG5hbWluZyChWCAiY29yZSBsb2dpYyIgaXMgbWlzbGVhZGlu
Zy4gV2lsbCByZW5hbWUgaXQNCnRvICJkZXZpY2UgbGlmZWN5Y2xlIG1hbmFnZW1lbnQiIGluIHRo
ZSBjb3ZlciBsZXR0ZXIgdG8gbWFrZSB0aGUgc2NvcGUNCmNsZWFyLg0KDQpXaWxsIGFsc28gZXhw
YW5kIFA1J3MgY29tbWl0IG1lc3NhZ2UgdG8gZGVzY3JpYmUgdGhlIEZTTSBzdGF0ZXMNCihPRkYg
ofcgQk9PVFVQIKH3IFJFQURZIKH3IE9OIKH3IE9GRiksIHRoZSBIUzEvSFMyL0hTMyBoYW5kc2hh
a2UNCnByb3RvY29sLCBDTERNQSBpbml0L2V4aXQgd2lyaW5nLCBhbmQgdGhlIGVycm9yLXJlY292
ZXJ5IHBhdGhzLg0KDQpSZWdhcmRpbmcgd2hldGhlciB0aGlzIGJlbG9uZ3MgaW4gdGhlIFdXQU4g
ZnJhbWV3b3JrOiB0aGUgRlNNIG1hbmFnZXMNCnRoZSBUOXh4LXNwZWNpZmljIGJvb3Qgc2VxdWVu
Y2UgoVggUENJZSBsaW5rIGJyaW5ndXAsIGZpcm13YXJlDQpoYW5kc2hha2UgdmlhIENMRE1BLWJh
c2VkIHJ1bnRpbWUgZmVhdHVyZSB0YWJsZSAoUlRGVCkgZXhjaGFuZ2UsIGFuZA0KaGFyZHdhcmUg
ZXJyb3IgcmVjb3ZlcnkgKEZMRFIvUExEUikuIEV2ZXJ5IHN0YXRlIGFuZCB0cmFuc2l0aW9uIGlz
DQpkaWN0YXRlZCBieSBUOXh4IGhhcmR3YXJlIGJlaGF2aW91ci4NCg0KVGhlIHQ3eHggZHJpdmVy
IGhhcyBpdHMgb3duIEZTTSAodDd4eF9mc20uYyAvDQp0N3h4X21vZGVtX29wcy5jKSBpbiB0aGUg
ZHJpdmVyIGZvciB0aGUgc2FtZSByZWFzb24goVggaXRzIGJvb3QNCnNlcXVlbmNlIGFuZCBoYW5k
c2hha2UgcHJvdG9jb2wgYXJlIGVxdWFsbHkgZGV2aWNlLXNwZWNpZmljLiANCg0KVGhlIFdXQU4g
c3Vic3lzdGVtIHRvZGF5IHByb3ZpZGVzIHBvcnQgbWFuYWdlbWVudCBhbmQgbmV0ZGV2IGhlbHBl
cnMsDQp3aGljaCB0OXh4IHVzZXMgKHd3YW5fY3JlYXRlX3BvcnQgaW4gUDYpLiBBIGdlbmVyaWMg
ZGV2aWNlIGxpZmVjeWNsZQ0Kc3RhdGUgbWFjaGluZSB3b3VsZCBuZWVkIHRvIGFic3RyYWN0IG92
ZXIgdGhlc2UgdmVuZG9yLXNwZWNpZmljIGJvb3QNCnByb3RvY29scywgYW5kIHdlIGRvbid0IHRo
aW5rIHRoYXQgYWJzdHJhY3Rpb24gZXhpc3RzIHdpdGhvdXQNCmhhcmR3YXJlLXNwZWNpZmljIGtu
b3dsZWRnZSBmcm9tIGVhY2ggdmVuZG9yLg0KDQpXZSBiZWxpZXZlIHRoZSBGU00gYmVsb25ncyBp
biB0aGUgZHJpdmVyLCBidXQgd2UgYXJlIGhhcHB5IHRvIGRpc2N1c3MNCmlmIHlvdSBzZWUgc3Bl
Y2lmaWMgcGllY2VzIHRoYXQgY291bGQgYmUgZmFjdG9yZWQgb3V0Lg0KDQpUaGFua3MuDQoNCi0t
DQpKYWNr


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12725C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivf16bA8eVGk4xRiswVz/tEyGrtwzJybER8q/jQMd/o=; b=2CALtmZ0qK+2c4/Dk3BvXjo4qT
	yWzUAdIX5d8TwmMW+PJbyJIPs8H/7/0UuSvCDkjRR+yAnAmFieTM0G1zLvFBKr4ermxsrew4QTM4p
	LVwnTdlxm65z6CzRxyUg6pUdYK35iXQMzLjuIQujiFEkLzLvIeynS6PpnGlI+RFAjE/iaKNWRvUlC
	b5dbXQPA8ZlzckU8vVSPbVvcm+B56JmurIijC3qoix1hrkqBYnMRDIfOpKCU1nFn2JgGktkf2izcg
	jSppRcTHf/Ws1QQDtzRxwsubbbUjUddHfIKV/gNtegB1OP3wlEU0t67Xo84hp5U2CsIkbtabBPESZ
	K/dSH1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y6y-000000019oj-2EX5;
	Mon, 21 Sep 2026 07:06:48 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y6u-000000019ku-2r3E;
	Mon, 21 Sep 2026 07:06:46 +0000
X-UUID: f72ab270b58a11f1a87c2323a98e90a4-20260921
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:542aed34-3ffe-4e13-b1ea-954a40e62e98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7f1ae54,CLOUDID:15bd5c7c-2058-4298-90ad-1156c3f1dffd,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f72ab270b58a11f1a87c2323a98e90a4-20260921
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 845946827; Mon, 21 Sep 2026 15:06:28 +0800
X-UUID: f59cd0d2b58a11f1a9f9c99e036204b4-20260921
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:9d68b3eb-ecc8-47bc-86e0-148128b0111c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:1413f33e-2015-4ac0-848c-dd56b04f9b18,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f59cd0d2b58a11f1a9f9c99e036204b4-20260921
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 33028743; Mon, 21 Sep 2026 15:06:25 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.43;
 Mon, 21 Sep 2026 15:06:23 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::d3a3:2665:d306:e36a]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::d3a3:2665:d306:e36a%11]) with mapi id
 15.02.2562.043; Mon, 21 Sep 2026 15:06:23 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>
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
Subject: RE: [External Mail] Re: [PATCH v8 1/6] net: wwan: t9xx: Add PCIe core
Thread-Topic: [External Mail] Re: [PATCH v8 1/6] net: wwan: t9xx: Add PCIe
 core
Thread-Index: AQHdSJJBQFFxpFYlr0WIdtg0cV9n2bbYnPye
Date: Mon, 21 Sep 2026 07:06:23 +0000
Message-ID: <690e3d6d04ba47efba2b4cda7b18e42e@compal.com>
References: <20260914-t9xx_driver_v1-v8-0-5206c2e6bea0@compal.com>
	<20260914-t9xx_driver_v1-v8-1-5206c2e6bea0@compal.com>,<20260919165434.08d026a8@kernel.org>
In-Reply-To: <20260919165434.08d026a8@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30210.003
x-tm-as-result: No-10--18.348800-8.000000
x-tmase-matchedrid: zwpC2WOSP9Uuv++HU7VXryRFbfQbCufdN0X64jGy2dbsEpKlvft9qnHR
	BdVJXEE0Q9AIZswE7Im8sf/3lUadtLxENwJ2UvCEGG92L3YEEC5ILH3fawhH7DQHeAZCLtjENrZ
	e+GlFOmnuq1DMO5F4aWrxeeoq6G+ydcaBsQNmVY6HSpOq1C5m8F0iRWBzvhn/Ge0TacJImEMR41
	St/qTSiI8fvsGG1r6CjGPUz3XtE9EWmVwQ4nb0sCbE4NyCMIorMjLMwAKwNtI+P0BFWEUq1Em6z
	KX/LJcmL6i+4hIrtWii5iIVX8OUW/zdToSelMHyDH4m2ujwCtt+rvFZ7FWrXG30LxWftKfhr54J
	Ix46I6T3t3pfLmJRU9vIAMT/07OiB73xunbyKrpX9HM7P8GE6Q==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--18.348800-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30210.003
x-tm-snts-smtp: 04D8DC24E44A8B3D5A0BC88503CDD9415739087981A51077E7CBB44370D133782000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_000644_888181_DF0B4DEA 
X-CRM114-Status: GOOD (  14.58  )
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

T24gU3VuLCAyMCBTZXAgMjAyNiAwNzo1NDowMCArMDgwMCBKYWt1YiBLaWNpbnNraSB3cm90ZToN
Cg0KPiA+ICtzdHJ1Y3QgbXRrX2Rldl9vcHMgew0KPiA+ICsgICAgIHUzMiAoKmdldF9kZXZfc3Rh
dGUpKHN0cnVjdCBtdGtfbWRfZGV2ICptZGV2KTsNClsuLi5dDQo+ID4gKyAgICAgaW50ICgqc2Vu
ZF9kZXZfZXZ0KShzdHJ1Y3QgbXRrX21kX2RldiAqbWRldiwgdTMyIGRldl9ldnQpOw0KPiA+ICt9
Ow0KPg0KPiBQbGVhc2UgcmVtb3ZlIHRoZSBhYnN0cmFjdGlvbnMgd2hpY2ggYXJlIG5vdCBuZWNl
c3NhcnkgaW4gdGhlIGluaXRpYWwNCj4gdmVyc2lvbiBvZiB0aGUgZHJpdmVyLiBJZiB5b3UgaGF2
ZSBhY2Nlc3MgdG8gYSBnb29kIExMTSB0aGVzZSBwcm9tcHRzDQo+IHdpbGwgcHJvYmFibHkgZG8g
YSBiZXR0ZXIgam9iIHByZXBhcmluZyB0aGUgcGF0Y2hlcyB0aGFuIHlvdToNCj4NCj4gaHR0cHM6
Ly9naXRodWIuY29tL2t1YmEtbW9vL2FpLXByb21wdHMvYmxvYi9tYWluL2RyaXZlci11cHN0cmVh
bWluZy1wcm9tcHRzLm1kDQoNCldpbGwgZml4IGluIHY5LiAgc3RydWN0IG10a19kZXZfb3BzIGhh
cyBvbmUgaW1wbGVtZW50YXRpb24sIHBjaV9od19vcHMsDQpyZWFjaGVkIHRocm91Z2ggbmluZSBw
YXNzLXRocm91Z2ggaW5saW5lcyBpbiBtdGtfZGV2Lmg7IGJvdGggZ28gYXdheSBhbmQNCnRoZSBQ
Q0llIGZ1bmN0aW9ucyBhcmUgY2FsbGVkIGRpcmVjdGx5LiAgU2FtZSB0cmVhdG1lbnQgZm9yDQpj
bGRtYV9kcnZfb3BzIGFuZCBtdGtfY3RybF9oaWZfb3BzLCBhbHNvIHNpbmdsZS1pbXBsZW1lbnRh
dGlvbiwgZm9yIHRoZQ0KbXRrX3Q5eHgua28vbXRrX3Q5eHhfcGNpZS5rbyBzcGxpdCwgd2hpY2gg
ZHJvcHMgbmluZSBFWFBPUlRfU1lNQk9MX0dQTCgpcw0KYW5kIG10a19kZXYuYywgYW5kIGZvciB0
aGUgdGhyZWUgX205eHggZmlsZXMsIHdoaWNoIHBhcmFtZXRlcmlzZSBhIHNpbmdsZQ0Kc3RydWN0
IG10a19wY2lfZGV2X2NmZyBzaGFyZWQgYnkgYm90aCBQQ0kgSURzLiAgcG9ydF9vcHMgc3RheXM6
IHR3bw0KaW1wbGVtZW50YXRpb25zIGhlcmUsIHRocmVlIHdpdGggdGhlIGZvbGxvdy11cCB3b3Jr
LiAgV2UgY2hlY2tlZCB0aGUNCndob2xlIG91dC1vZi10cmVlIHRyZWUsIG5vdCBqdXN0IHRoaXMg
c2VyaWVzIC0gbm9uZSBvZiB0aGUgcmVtb3ZlZCBvbmVzDQpnYWlucyBhIHNlY29uZCBpbXBsZW1l
bnRhdGlvbiBsYXRlci4NCg0KVHdvIHF1ZXN0aW9ucyBvbiB0aGUgcHJvbXB0cyBkb2N1bWVudC4N
Cg0KQXJlIHRoZSBmb2xsb3dpbmcgaGFyZCByZXF1aXJlbWVudHMgdGhlIHNlcmllcyBoYXMgdG8g
bWVldCwgb3IgdGFyZ2V0cw0KZm9yIHRoZSB0b29sPw0KDQogLSBsaW5lIDQ0OiAiSWRlYWwgcGF0
Y2hlcyBhcmUgYmV0d2VlbiAyMDAgYW5kIDcwMCBMb0MgKGFkZGVkICsNCiAgIHJlbW92ZWQsIG5v
dCBjb3VudGluZyBjb250ZXh0KS4iDQogLSBsaW5lIDQ2OiAiQXZvaWQgc2VyaWVzIGxhcmdlciB0
aGFuIDIuNWsgTG9DLiBUaGUgZmlyc3Qgc2VyaWVzIGlzDQogICB1c3VhbGx5IGxhcmdlciwgYnV0
IG11c3Qgbm90IGV4Y2VlZCA0ayBMb0MuIg0KIC0gbGluZXMgNTctNTg6ICJTZXJpZXMgMSBzaG91
bGQgYWltIHRvIGFkZCB0aGUgc2ltcGxlc3QgcG9zc2libGUNCiAgIHZlcnNpb24gb2YgdGhlIGRy
aXZlciB3aGljaCBub25ldGhlbGVzcyBjYW4gc2VuZCBhbmQgcmVjZWl2ZSBhDQogICB0cml2aWFs
IChubyBvZmZsb2FkcykgcGFja2V0LiINCiAtIGxpbmUgMTE3OiAiQXZvaWQgdGhlIHVzZSBvZiBt
YW5hZ2VkIEFQSXMgKGBgZGV2bV9gYCwgYGBwY2ltX2BgKS4iDQoNCk9uIHRoZSBwYWNrZXQgb25l
OiB0aGlzIHNlcmllcyBjYXJyaWVzIG5vIG5ldGRldiBiZWNhdXNlIGFuIGVhcmxpZXINCnJldmll
dyBmb3VuZCB0aGUgZHJpdmVyIHRvbyBsYXJnZSB0byBzdWJtaXQgYXQgb25jZSwgc28gdGhlIG5l
dHdvcmsNCmZ1bmN0aW9uYWxpdHkgd2FzIHNwbGl0IGludG8gZm9sbG93LXVwIHNlcmllcy4NCg0K
VGhlIGRvY3VtZW50IGFsc28gYXNrcyBmb3Igbm8gZGVmZW5zaXZlIGNoZWNrcyAobGluZXMgMTE5
LTEyMCkgYW5kIGZldw0KY29kZSBjb21tZW50cyAobGluZSAxMjQpLiAgVGhhdCBydW5zIGFnYWlu
c3QgdGhlIGRpcmVjdGlvbiBvZiB0aGUgQUkgcmV2aWV3DQp3ZSBoYXZlIGJlZW4gZ2V0dGluZywg
d2hlcmUgYm90aCBoYXZlIGJlZW4gZ3Jvd2luZy4gIElzIHRoZSBjdXJyZW50DQpkaXJlY3Rpb24g
c3RpbGwgZmluZT8NCg0KVGhhbmtzLA0KSmFjaw0KICAgIA==


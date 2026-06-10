Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F38CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4cHUsy17i/oJpycpVVzFP8YI1IsCTMX3DiYCihWkcA=; b=bGbbio59+3R9r5GHJx26XOqWx8
	pw67CJcKhps4VLRzr1fiiFBAT12QaIQooEiO6xfvGMSDH6iM6sdmmzEkybt/Zc9fobCfMvEthsWFY
	542mw/pN+IW3w0JJZEQCVMZM6doq/Qbog4sNcH643tQtIyH5pr0qFq5pLHwhSY+4tZFRKbTiWtTo5
	t+jg4mbiGt/zhTzDgUH4ZrtXyR8uuxPC+HF3e3P35NO3KhU5L1p1X6HgsMb2MTsb1fHO/F6JFH8bs
	l4e9zBx2voSvXvFEn/fX56sEEgVwTu3KZjTris/0BqZtkvP7amDBnGKs0+aXoDr+1/2+aoEsjp8Du
	cq55eF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGN7-00000007PwP-0elO;
	Wed, 10 Jun 2026 10:41:21 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGMv-00000007Pmd-3z0j;
	Wed, 10 Jun 2026 10:41:13 +0000
X-UUID: df3af09e64b811f1a87c2323a98e90a4-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0737b58e-282f-4035-a419-f0a18b2b8d02,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:906a882a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: df3af09e64b811f1a87c2323a98e90a4-20260610
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 122137577; Wed, 10 Jun 2026 18:41:00 +0800
X-UUID: dc9e333264b811f1943831befd1aa4bc-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:a8d029ca-758b-49d6-a8b3-e566e168da00,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:7c85e7a4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dc9e333264b811f1943831befd1aa4bc-20260610
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 43648245; Wed, 10 Jun 2026 18:40:56 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Wed, 10 Jun 2026 18:40:52 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Wed, 10 Jun 2026 18:40:52 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Loic Poulain
	<loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"wojackbb@gmail.com" <wojackbb@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 02/11] net: wwan: t9xx: Add control plane transaction
 layer
Thread-Topic: [PATCH 02/11] net: wwan: t9xx: Add control plane transaction
 layer
Thread-Index: AQHc8bk+1UsrKa/XR0qfabIgrb3y4LY3lQgi
Date: Wed, 10 Jun 2026 10:40:52 +0000
Message-ID: <547cfcb5d0564a7b8a1559910f8d54c8@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260529-t9xx_driver_v1-v1-2-bdbfe2c01e57@compal.com>,<PH0PR11MB5902FB4FF84AF8041B72D455F0152@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5902FB4FF84AF8041B72D455F0152@PH0PR11MB5902.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-as-result: No-10--15.724400-8.000000
x-tmase-matchedrid: 13nEecSBt9Euv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZgOe
	+RYG/aOVMleF7vJIPgqngxQtDfARLJNGCDJJzpnrGG92L3YEEC4KEmq2HWwB6pxT0ucAo6R2dPQ
	2JTiaKeKG4JQWzp0Zih6lu1tpMWzEknndMSHWXqCTlNTCzR+UCOwFnNOJUtAVMLjTaDguNi+3UZ
	vGR+CLKEtQw4utslF9AncoiTVMdT0QPgd/epoDdr+y8+LvjzkGT7IWEFuukP5dzRkE/gTMQeYRj
	GOCJsx0JWAArnzpKFTLmCJM+UUcQ41g3zDt1sv5v9rSd36EgULA931+mNd9sJs7gkGWoKY36QLg
	e8Tcpn0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.724400-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-snts-smtp: 7FFC1613B90922E79617064043959316F57413319CC95328D8E791F49BFFC0232000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_034110_334451_D3F7C247 
X-CRM114-Status: GOOD (  14.50  )
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

SGkgSmFnaWVsc2tpLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEJlbG93IGFyZSB0aGUg
Y2hhbmdlcyBhbmQgcmVzcG9uc2VzIGZvciB2Mi4NCg0KPiA+ICtpbnQgbXRrX2N0cmxfaW5pdChz
dHJ1Y3QgbXRrX21kX2RldiAqbWRldikNCj4gPiArew0KPiA+IC4uLg0KPiA+ICtFWFBPUlRfU1lN
Qk9MKG10a19jdHJsX2luaXQpOw0KPg0KPiBwbGVhc2UgYWRkIGtkb2MsIGVzcGVjaWFsbHkgdGhl
cmUncyBFWFBPUlRfU1lNQk9MDQoNCkFkZGVkIGtlcm5lbC1kb2MgY29tbWVudHMgdG8gYm90aCBt
dGtfY3RybF9pbml0KCkgYW5kDQptdGtfY3RybF9leGl0KCkuDQoNCj4gPiAraW50IG10a19jdHJs
X2V4aXQoc3RydWN0IG10a19tZF9kZXYgKm1kZXYpDQo+DQo+IGRvIHdlIG5lZWQgaW50IGlmIDAg
aXMgYWx3YXlzIHJldHVybmVkPw0KDQpDaGFuZ2VkIHRvIHZvaWQgcmV0dXJuIHR5cGUuDQoNCj4g
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsgKg0KPiA+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjIsIE1lZGlhVGVrIEluYy4NCj4NCj4gc2hvdWxkbid0IDIw
MjYgYmUgcHV0Pw0KDQpUaGUgY29weXJpZ2h0IHllYXIgcmVmbGVjdHMgdGhlIG9yaWdpbmFsIGNy
ZWF0aW9uIGRhdGUgb2YgdGhlDQpzb3VyY2UgY29kZSBieSBNZWRpYVRlay4gVGhpcyBpcyBjb25z
aXN0ZW50IHdpdGggdGhlIGNvbnZlbnRpb24NCnVzZWQgYnkgdGhlIGV4aXN0aW5nIHQ3eHggZHJp
dmVyIGluIHRoZSBrZXJuZWwgdHJlZS4NCg0KPiA+ICtzdGF0aWMgdm9pZCBfX2V4aXQgbXRrX2Nv
bW1vbl9kcnZfZXhpdCh2b2lkKQ0KPg0KPiBpcyBpdCB1c2VkIGFueXdoZXJlIGhlcmUgaW4gdGhl
IHBhdGNoPw0KDQpUaGlzIGlzIHRoZSBtb2R1bGVfZXhpdCBjYWxsYmFjayByZXF1aXJlZCBieSB0
aGUga2VybmVsIG1vZHVsZQ0KZnJhbWV3b3JrLiBJdCBpcyByZWdpc3RlcmVkIHZpYSBtb2R1bGVf
ZXhpdCgpIGFuZCBjYWxsZWQNCmF1dG9tYXRpY2FsbHkgd2hlbiB0aGUgbW9kdWxlIGlzIHVubG9h
ZGVkLiBJdCBpcyBpbnRlbnRpb25hbGx5DQplbXB0eSBhcyBubyBnbG9iYWwgY2xlYW51cCBpcyBu
ZWVkZWQgYXQgbW9kdWxlIGV4aXQgdGltZS4NCg0KVGhhbmtzLg0KDQpKYWNrIFd1DQoNCg0KPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhpcyBtZXNzYWdl
IG1heSBjb250YWluIGluZm9ybWF0aW9uIHdoaWNoIGlzIHByaXZhdGUsIHByaXZpbGVnZWQgb3Ig
Y29uZmlkZW50aWFsIG9mIENvbXBhbCBFbGVjdHJvbmljcywgSW5jLiBJZiB5b3UgYXJlIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIGFuZCBkZXN0cm95L2RlbGV0ZSB0aGUgbWVzc2FnZS4gQW55IHJldmlldywgcmV0cmFu
c21pc3Npb24sIGRpc3NlbWluYXRpb24gb3Igb3RoZXIgdXNlIG9mLCBvciB0YWtpbmcgb2YgYW55
IGFjdGlvbiBpbiByZWxpYW5jZSB1cG9uIHRoaXMgaW5mb3JtYXRpb24sIGJ5IHBlcnNvbnMgb3Ig
ZW50aXRpZXMgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IGlzIHByb2hpYml0ZWQu
DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo=


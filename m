Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3957FCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npSKpn2mPguRbhZHnmDVJZ8K052ijPWXXnumdzaiILs=; b=ZXSuzil4r0C3PEMO8dJXDphlTk
	zDQUHA8OaieiSxKKw8vYdsKr3jbYBZUCYTv29ku94CgSXefgpMk75tX+EDww7Iv5j13q38DhVTiAS
	J6n+v5lkrm55RxbhjbkUhr2UiiEGQcdK1srX/dGHw96Sf6QXuW/+Rlevc9+v3sYMFrbtXR3dabPlm
	9Wa64guVT8PCJ10i2fGBMT2A4otKI2cJVKowWIMTk/hRbFKKnMdp+HgR+6qTmHe7JA3XHW4z17z9u
	SK8yvGcvYv8SKkq7/S9pFxBu9v2BY1sypz8GRmnxgtRWTd7Ff+MVTM7qe+e4+YwmOX7kH8ctZU2DY
	66DOEZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVA6-000000034Jw-3GNi;
	Mon, 08 Jun 2026 08:16:46 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVA2-000000034J2-370L;
	Mon, 08 Jun 2026 08:16:44 +0000
X-UUID: 5dfc2c3e631211f1b2470fb4f881575f-20260608
X-CID-CACHE: Type:Local,Time:202606081614+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:7bb72a75-f1da-4757-bc1c-ef2d58060688,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e276073,CLOUDID:99133d50-23b6-41e0-a310-51c498ab6908,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:0,Content:0|14|50,EDM:-3,IP:nil,URL:11|94|82|106|1,File:130,RT:-1,B
	ulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5dfc2c3e631211f1b2470fb4f881575f-20260608
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2039100749; Mon, 08 Jun 2026 16:16:36 +0800
X-UUID: 5a797328631211f1943831befd1aa4bc-20260608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:4266c7f6-32e6-46d7-a334-2702d8dc500a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:2b2f702a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|817|836|865|
	888|898,TC:-5,Content:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:11|94|82|106|1,Fil
	e:130,RT:-1,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5a797328631211f1943831befd1aa4bc-20260608
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 570636317; Mon, 08 Jun 2026 16:16:30 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Mon, 8 Jun 2026 16:16:28 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Mon, 8 Jun 2026 16:16:28 +0800
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
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Topic: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Index: AQHc8bhcdmgibeQV+0mP7OG8OB0FzrYt9Hq3gAXWO4CAAInHl4AABd2t
Date: Mon, 8 Jun 2026 08:16:28 +0000
Message-ID: <bacf828774754822870877ea59532313@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260529-t9xx_driver_v1-v1-1-bdbfe2c01e57@compal.com>,<PH0PR11MB5902127C590230B9FE50F78AF0152@PH0PR11MB5902.namprd11.prod.outlook.com>
 <c9e80369a7ec449a814cd85269f1135e@compal.com>,<PH0PR11MB5902CCC89F0B7C8EB3DE84E4F01C2@PH0PR11MB5902.namprd11.prod.outlook.com>,<bfecf94780ad458b91a26d18d832cdd1@compal.com>
In-Reply-To: <bfecf94780ad458b91a26d18d832cdd1@compal.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29994.005
x-tm-as-result: No-10--12.856700-8.000000
x-tmase-matchedrid: IDcII6LbfMAuv++HU7VXryRFbfQbCufdN0X64jGy2db7+pncqRJfyx3E
	y8bUOyJjaUPlBsIyPQqQd7hqnnHt1ITLlkTaHclrGG92L3YEEC50pPFWgq1KNgSjtG4gy/zQk3M
	PpgxG+BYZ+O+6wWe+rfJ3yfksIbvtUohvb26/VwDIUNmTDb0ad1XyfUSvLyzCLlyTQpkPM/muL/
	wQL67inHpDwkRjycbm5qWmJpeeRGrxPy/KTnXd847tl5XBMfR0GfP6Q7XnYodvlBCrK8pGQDEVg
	wwZHfKtcQQjXLG6PQHW4nEWqErTWXohGpceJQZ8+1ee9G3wijaVmuhG06IIbe/bYoUSKfqauJCI
	QB6CcSAUniOR5wPtVfpgVVYHPd+B6FXDqHhzf++hHa4ajj4rLHJdOCvX33ZJSNuzoTmS1wVSGht
	saB9Y8PoHz/xoqkhb8Q9k+ZQpzmofJ8WtENJ4xuL0Mdyrs1C+i9V1e7G8XUjm4kfqYdQJGXJtKF
	u5zOx/r3RRr3ptPn2DrdGzSk8YQY1g3zDt1sv5D4I+2Qtnp0WiWLhmiI4dPyDilljGyWFts2R4R
	gZsli6DG4IEHJUquTFZQVzIOU+Yd6RfXt3YMtMRsDS3Qlo4C7Nbolk9uKBt
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--12.856700-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29994.005
x-tm-snts-smtp: 093F413311FB7B08C4AC994EA4DE7698500C8608CD52C3CCA11167296C04F8D02000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_011643_127129_627B7072 
X-CRM114-Status: GOOD (  24.80  )
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

PiA+ID4gU2VudDogRnJpZGF5LCBNYXkgMjksIDIwMjYgMTI6MzIgUE0NCj4gPiA+DQo+ID4gPiA+
ICsNCj4gPiA+DQo+ID4gPiBwbGVhc2UgYWxzbyB0YWtlIGEgbG9vayBvbiBzYXNoaWtvIG5vdGVz
LCB0aGVyZSBpcyBzb21lIG51bWJlciBvZiB0aGVtDQo+ID4NCj4gPiBIaSBKYWdpZWxza2ksDQo+
ID4NCj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LiBXZSBoYXZlIGZpeGVkIHNvbWUgaXNz
dWVzIGFuZCBhcmUgc3RpbGwNCj4gPiBkaXNjdXNzaW5nIG90aGVycyB3aXRoIE1lZGlhVGVrLiBB
bGwgb2YgdGhlbSB3aWxsIGJlIGFkZHJlc3NlZCBpbiBWMi4NCj4gPg0KPiA+IFJlZ2FyZGluZyBz
YXNoaWtvIG5vdGVzLCBob3cgc2hvdWxkIEkgaGFuZGxlIHRoZW0gaWYgZGlzY3Vzc2lvbiBpcyBu
ZWVkZWQ/IEkNCj4gPiBjYW5ub3QgZmluZCBzYXNoaWtvJ3MgZW1haWwgYWRkcmVzcywgYW5kIGl0
cyB3ZWJzaXRlIGRvZXMgbm90IGhhdmUgYSByZXBseQ0KPiA+IG9wdGlvbi4NCj4gPg0KPg0KPiBJ
IGd1ZXNzIGRpc2N1c3Npb24gaXMgbmVlZGVkIHdoZW4gYW55IG9mIHRoZSByZXZpZXdlcnMgZGly
ZWN0bHkgcmVmZXJzDQo+IHRvIGFueSBvZiB0aGUgbm90ZXMgcG9zdGVkIGJ5IHNhc2hpa28uDQo+
DQo+IElmIGFueSBvZiB0aGUgbm90ZXMgd2FzIG5vdCBkaXJlY3RseSBwb2ludGVkIG91dCBieSBh
bnlib2R5IHBsZWFzZSBqdXN0DQo+IGNoZWNrIHdoaWNoIG9mIHNhc2hpa28gbm90ZXMgYXJlIHZh
bGlkIGFuZCBmaXggdGhlbSByZXNwZWN0aXZlbHkNCj4gaWYgbmVlZGVkLg0KPg0KPg0KPiA+IEZv
ciBleGFtcGxlOg0KPiA+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyOS10
OXh4X2RyaXZlcl92MS12MS0wLWJkYmZlMmMwMWU1NyU0MGNvbXBhbC5jb20/cGFydD0yDQo+ID4N
Cj4gPiBRMTogVGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIGltcGxlbWVudGluZyBUWCBhbmQg
Ulggc2VydmljZXMsIGJ1dCB0aGUNCj4gPiBwYXRjaCBwcmltYXJpbHkgYWRkcyBlbXB0eSBzdHJ1
Y3R1cmVzIGFuZCBib2lsZXJwbGF0ZSBjb2RlLiBJcyB0aGUgcGF0Y2gNCj4gPiBtaXNzaW5nIHRo
ZSBhY3R1YWwgVFgvUlggaW1wbGVtZW50YXRpb24gZGVzY3JpYmVkIGhlcmU/DQo+ID4NCj4gPiBS
ZXBseToNCj4gPiBXZSBwbGFuIHRvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuIFdvdWxkIHRo
ZSBmb2xsb3dpbmcgYmUgYWNjZXB0YWJsZT8NCj4NCj4gSSBiZWxpZXZlIGlmIHlvdSB3YW50IHRv
IGNoZWNrIGlmIHNhc2hpa28gaGFzIG5vIGFueSBsb25nZXIgcHJvYmxlbXMgd2l0aCBpdA0KPiB5
b3UNCj4gbmVlZCB0byBzZW5kIHYyIGFuZCBjaGVjayB0aGF0IHdheSwgdW5sZXNzIGltIG5vdCBh
d2FyZSBvZiBzb21ldGhpbmcNCj4NCj4gPg0KPiA+IEFkZCB0aGUgY29udHJvbCBwbGFuZSB0cmFu
c2FjdGlvbiBsYXllciBmcmFtZXdvcmsgZm9yIHRoZSB0OXh4DQo+ID4gV1dBTiBkcml2ZXIsIGlu
Y2x1ZGluZyBjb25maWd1cmF0aW9uIG9wdGlvbnMsIGRldmljZSBzdHJ1Y3R1cmUNCj4gPiBkZWZp
bml0aW9ucywgYW5kIGluaXRpYWxpemF0aW9uL2NsZWFudXAgZnVuY3Rpb25zLg0KPiA+DQo+ID4g
VGhlIGFjdHVhbCBUWC9SWCBzZXJ2aWNlIGltcGxlbWVudGF0aW9ucyB0aGF0IHVzZSB0aGlzIGZy
YW1ld29yaw0KPiA+IGFyZSBpbnRyb2R1Y2VkIGluIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4gPg0K
PiA+DQo+ID4gVGhhbmtzLg0KDQpIaSBKYWdpZWxza2ksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNs
YXJpZmljYXRpb24uIEl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2Ugbm93Lg0KDQpSZWdhcmRpbmcgdGhl
IHNhc2hpa28gbm90ZXMsIHRoZXJlIGFyZSBhIGZldyB0aGF0IHdlIGJlbGlldmUgYXJlIGZhbHNl
DQpwb3NpdGl2ZXMgb3IgZG8gbm90IHJlcXVpcmUgbW9kaWZpY2F0aW9ucyBiYXNlZCBvbiBvdXIg
aGFyZHdhcmUgZGVzaWduLg0KU2luY2Ugbm9ib2R5IGhhcyBkaXJlY3RseSBwb2ludGVkIHRoZW0g
b3V0LCB3ZSB3aWxsIGFkZHJlc3Mgb25seSB0aGUNCnZhbGlkIG9uZXMgYW5kIGxlYXZlIHRoZSBy
ZXN0IHVuY2hhbmdlZCBmb3IgVjIuDQoNCkFzIGZvciB0aGUgVjIgc3VibWlzc2lvbiB0aW1pbmcs
IEkgYW0gc3RpbGwgd2FpdGluZyBmb3IgZmVlZGJhY2sgZnJvbSB0aGUNCldXQU4gbWFpbnRhaW5l
cnMvcmV2aWV3ZXJzLCBzcGVjaWZpY2FsbHk6DQotIExvaWMgUG91bGFpbiA8bG9pYy5wb3VsYWlu
QG9zcy5xdWFsY29tbS5jb20+DQotIFNlcmdleSBSeWF6YW5vdiA8cnlhemFub3Yucy5hQGdtYWls
LmNvbT4NCi0gSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4NCg0KU2hv
dWxkIEkgd2FpdCB1bnRpbCBJIHJlY2VpdmUgY29tbWVudHMgZnJvbSBhbGwgb2YgdGhlbSBiZWZv
cmUgc3Bpbm5pbmcgVjIsDQpvciBpcyBpdCBhY2NlcHRhYmxlIHRvIHNlbmQgVjIgb25jZSB0aGUg
Y3VycmVudCBmZWVkYmFjayBoYXMgYmVlbiBhZGRyZXNzZWQ/DQoNClRoYW5rcywNCkphY2sNCg0K
DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpUaGlzIG1l
c3NhZ2UgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gd2hpY2ggaXMgcHJpdmF0ZSwgcHJpdmlsZWdl
ZCBvciBjb25maWRlbnRpYWwgb2YgQ29tcGFsIEVsZWN0cm9uaWNzLCBJbmMuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgYW5kIGRlc3Ryb3kvZGVsZXRlIHRoZSBtZXNzYWdlLiBBbnkgcmV2aWV3LCBy
ZXRyYW5zbWlzc2lvbiwgZGlzc2VtaW5hdGlvbiBvciBvdGhlciB1c2Ugb2YsIG9yIHRha2luZyBv
ZiBhbnkgYWN0aW9uIGluIHJlbGlhbmNlIHVwb24gdGhpcyBpbmZvcm1hdGlvbiwgYnkgcGVyc29u
cyBvciBlbnRpdGllcyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgaXMgcHJvaGli
aXRlZC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==


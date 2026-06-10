Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3316ECD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI38I5ENHl5K/xLXbu9kXVyOKQTTDhVkGa0dkyWeeEE=; b=0E5Bw/ZcfxevHGQ6Xk5esXb+9B
	YTK3tdbBeKazrAUQEIKo6WGCUlnKNa83DfHkpygKsV4BNpW0EjD+j6gcSnjnuO84YNcyGkG5CcpaS
	tjO2WR2P0G3BKCsAW1YlbcQsPJUNrKD0yUfc09TtA22o650MCc2CliHJk1qkkYOKhYI4LCRZvL+CW
	kUV1bToFuY8B3ogkAhH0W+tkef7MHfW0yPFX83wekOYcV5aYslu8m6lJu1MESJA2zkEZg3cI/xwrb
	KdlWHNw8R1UOdNDtAAujjHR+20wNlZg7zvTtJANBCgoFlzPEjvWw9TOUr3lYxbXiEkDZx7FBhAr3B
	3Blp4hKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGND-00000007Q1d-1aSy;
	Wed, 10 Jun 2026 10:41:27 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGMy-00000007Pnk-0NCV;
	Wed, 10 Jun 2026 10:41:13 +0000
X-UUID: e169bd0a64b811f1a87c2323a98e90a4-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:7a5c6d84-e99a-403f-829b-6ac7e5ee1bbf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:bf85e7a4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e169bd0a64b811f1a87c2323a98e90a4-20260610
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1294240019; Wed, 10 Jun 2026 18:41:04 +0800
X-UUID: dd2015dc64b811f1a42089d3d1632821-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:cfca93aa-5195-4858-b403-d2c6918fdf59,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:876a882a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd2015dc64b811f1a42089d3d1632821-20260610
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 689644572; Wed, 10 Jun 2026 18:40:57 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.29;
 Wed, 10 Jun 2026 18:40:55 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Wed, 10 Jun 2026 18:40:55 +0800
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
Subject: RE: [PATCH 03/11] net: wwan: t9xx: Add control DMA interface
Thread-Topic: [PATCH 03/11] net: wwan: t9xx: Add control DMA interface
Thread-Index: AQHc8b2GcEXIidYmSUOshBMxeAbtZrY3lXjp
Date: Wed, 10 Jun 2026 10:40:55 +0000
Message-ID: <336375db52e64e9c9b38882e5ed7a3ea@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260529-t9xx_driver_v1-v1-3-bdbfe2c01e57@compal.com>,<PH0PR11MB590283906E1724DEFC0985E6F0152@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB590283906E1724DEFC0985E6F0152@PH0PR11MB5902.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-as-result: No-10--14.460600-8.000000
x-tmase-matchedrid: IDcII6LbfMAuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZgOe
	+RYG/aOVMleF7vJIPgrSbqGL9tBhQIgwREucKN123Qno10sIadHt08AkgFFynb5vYc/RF4DMIeU
	yk0r7SB2nLSPyJcfFP21Vadl7H9NiJzYi9JMPqXGFhGp9GNPDrfJDp0CY93MSeKnzndt922XSv5
	FCBxtfs1wBC+ObXMKeHK34MkSkfGc9F1mStRnXLLEGwwlGI5qhvzW3esYP4H7RDig+1bLp5Cl3D
	B68Rh7wjUNbqe3xrue15Jy4WHo1YpJ53TEh1l6gO9AbTF0WkML4qryqgi1bdfo2ryv7FQo4aRBV
	JZ6LCZEBlBlrcnSfn10hRTfTyAkPNHce8OjN0HXdtDLKIRgYoOPBqjds3Z7Jm8FbMD4J+lfWu1q
	i7UBzSJnG3JVss1SOUzrGFfGuC0EwUUvWm9TB7Pe+18RAuG2T0J735/IbYe3yYHi4HOy3fI9Xup
	CU2lE4Utar0GYFavTLmCJM+UUcQ41g3zDt1sv5D4I+2Qtnp0WiWLhmiI4dPyDilljGyWFts2R4R
	gZsli74ibNi9ALLMfHPTxUzJiJsmUIw8x4sD3ZnGpXqGceDwhDRNSuqVU5d
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--14.460600-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29998.006
x-tm-snts-smtp: 6DBC74E95CE9D5E15F12595340A85DD5246C89B846F683B066B8B85E95F02A7F2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_034112_472574_3AB4125D 
X-CRM114-Status: GOOD (  20.70  )
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
Y2hhbmdlcyBhbmQgcmVzcG9uc2VzIGZvciB2Mi4NCg0KPiA+ICtpbnQgaSwgaGlmX2lkOw0KPiA+
ICtzdHJ1Y3QgdHJiICp0cmI7DQo+ID4gK3UzMiB0eHFubzsNCj4NCj4gcGxlYXNlIHN0aWNrIHRv
IFJDVA0KDQpSZW9yZGVyZWQgdmFyaWFibGUgZGVjbGFyYXRpb25zIHRvIGZvbGxvdyByZXZlcnNl
IENocmlzdG1hcyB0cmVlDQpzdHlsZS4NCg0KPiA+ICthZ2FpbjoNCj4gPiArZm9yIChpID0gMDsg
aSA8IHR4cS0+bnJfZ3BkczsgaSsrKSB7DQo+ID4gLi4uDQo+ID4gK3N0YXRlID0gZHJ2X29wcy0+
Y2xkbWFfY2hlY2tfaW50cl9zdGF0dXMoZHJ2X2luZm8sIERJUl9UWCwgdHhxbm8sIFFVRVVFX1hG
RVJfRE9ORSk7DQo+ID4gK2lmIChzdGF0ZSkgew0KPiA+IC4uLg0KPiA+ICtnb3RvIGFnYWluOw0K
Pg0KPiBhcmUgd2Ugc3VyZSB3ZSB3b24ndCBiZSBsb2NrZWQgaGVyZT8NCg0KVGhlIGxvb3AgaXMg
Ym91bmRlZDogZWFjaCBpdGVyYXRpb24gb2YgdGhlIGZvciBsb29wIHByb2Nlc3NlcyBhdA0KbW9z
dCBucl9ncGRzIGRlc2NyaXB0b3JzLCBhbmQgdGhlIGdvdG8gYWdhaW4gcGF0aCBvbmx5IHRyaWdn
ZXJzDQp3aGVuIGEgbmV3IFhGRVJfRE9ORSBpbnRlcnJ1cHQgYXJyaXZlcyB3aGlsZSBwcm9jZXNz
aW5nLiBTaW5jZSB0aGUNClRYIHJpbmcgaGFzIGEgZml4ZWQgbnVtYmVyIG9mIHNsb3RzLCBmb3J3
YXJkIHByb2dyZXNzIGlzIGd1YXJhbnRlZWQNCqFYIG9uY2UgYWxsIGNvbXBsZXRlZCBkZXNjcmlw
dG9ycyBhcmUgY29uc3VtZWQsIHRoZSBmb3IgbG9vcCBicmVha3MNCmF0IHRoZSBIV08gY2hlY2su
IGNvbmRfcmVzY2hlZCgpIHByZXZlbnRzIHNvZnQgbG9ja3VwLiBUaGlzIHBhdHRlcm4NCmlzIGNv
bnNpc3RlbnQgd2l0aCB0aGUgUlggd29yayBoYW5kbGVyIGluIHRoZSBzYW1lIGZpbGUuDQoNCj4g
PiArZXJyID0gbXRrX2NsZG1hX2NoZWNrX3J4X3JlcShkcnZfaW5mbywgcnhxKTsNCj4gPiAraWYg
KCFlcnIpDQo+ID4gK2dvdG8gYWdhaW47DQo+DQo+IHVuY2xlYXIgZm9yIG1lDQo+IHJlcGVhdCB3
aGVuIDAgaXMgcmV0dXJuZWQNCj4gZG8gbm90IHJlcGVhdCB3aGVuIC1FQUdBSU4gaXMgcmV0dXJu
ZWQgYnkgbXRrX2NsZG1hX2NoZWNrX3J4X3JlcT8NCg0KbXRrX2NsZG1hX2NoZWNrX3J4X3JlcSgp
IHJldHVybnMgMCB3aGVuIHRoZXJlIGFyZSBtb3JlIFJYDQpkZXNjcmlwdG9ycyByZWFkeSBmb3Ig
cHJvY2Vzc2luZyAoSFcgY3VycmVudCBhZGRyZXNzIGRpZmZlcnMgZnJvbQ0KdGhlIHNvZnR3YXJl
IGZyZWUgaW5kZXggYW5kIEhXTyBiaXQgaXMgY2xlYXJlZCksIHNvIHRoZSBsb29wDQpjb250aW51
ZXMuIE5vbi16ZXJvIG1lYW5zIGVpdGhlciBubyBtb3JlIGRhdGEgaXMgYXZhaWxhYmxlIG9yIGFu
DQplcnJvciBvY2N1cnJlZDoNCi0gLUVBR0FJTjogSFcgaXMgc3RpbGwgd29ya2luZyBvbiB0aGUg
Y3VycmVudCBkZXNjcmlwdG9yLCBvciBIV08NCiAgYml0IGRpZG4ndCBjbGVhciBpbiB0aW1lIKFY
IG5vIG1vcmUgZGF0YSB0byBwcm9jZXNzLg0KLSAtRU5YSU86IEhXIGN1cnJlbnQgYWRkcmVzcyBy
ZWFkIGJhY2sgYXMgMCwgaW5kaWNhdGluZyBhIGxpbmsNCiAgZXJyb3IuDQoNCldlIGFncmVlIHRo
ZSBzZW1hbnRpY3MgY291bGQgYmUgY2xlYXJlci4gV291bGQgeW91IHByZWZlciB3ZQ0KcmVuYW1l
L3Jlc3RydWN0dXJlIHRoaXMgoVggZm9yIGV4YW1wbGUsIHJldHVybmluZyBhIGJvb2wgKHRydWUg
PQ0KbW9yZSB3b3JrKSBhbmQgaGFuZGxpbmcgZXJyb3JzIHNlcGFyYXRlbHksIG9yIHVzaW5nIGEg
ZGlmZmVyZW50DQplcnJvciBjb2RlIGluc3RlYWQgb2YgLUVBR0FJTj8gT3BlbiB0byBzdWdnZXN0
aW9ucyBvbiB3aGF0IHdvdWxkDQpiZSBtb3N0IGludHVpdGl2ZSBoZXJlLg0KDQo+IHNvIGhvdyBF
QUdBSU4gaXMgYWN0dWFsbHkgdXNlZCBoZXJlPw0KDQotRUFHQUlOIGlzIHJldHVybmVkIGJ5IG10
a19jbGRtYV9zdWJtaXRfdHgoKSB3aGVuIHJlcV9idWRnZXQgPT0gMA0KKFRYIGRlc2NyaXB0b3Ig
cmluZyBmdWxsKS4gSW4gbXRrX2N0cmxfdHJiX2hhbmRsZXIsIHRoaXMgdHJpZ2dlcnMNCmZsb3cg
Y29udHJvbDogaWYgcGFja2V0cyB3ZXJlIGFscmVhZHkgYmF0Y2hlZCAodHhfYnVyc3RfY250ID4g
MCksDQpmbHVzaCB0aGVtOyBvdGhlcndpc2UgcmV0dXJuIGltbWVkaWF0ZWx5IGFuZCBsZWF2ZSB0
aGUgc2tiIGluIHRoZQ0KcXVldWUgZm9yIHJldHJ5IGFmdGVyIFRYIGNvbXBsZXRpb24gZnJlZXMg
YnVkZ2V0Lg0KDQpXZSBhZ3JlZSB0aGUgc2VtYW50aWNzIGNvdWxkIGJlIGNsZWFyZXIuIENvdWxk
IHlvdSBzdWdnZXN0IHdoaWNoDQplcnJvciBjb2RlIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUg
Zm9yIHRoaXMgY2FzZT8NCg0KPiA+ICtzdGF0aWMgaW50IG10a19jbGRtYV9yeHFfZnJlZShzdHJ1
Y3QgY2xkbWFfZHJ2X2luZm8gKmRydl9pbmZvLCB1MzIgcnhxbm8pDQo+DQo+IHBsZWFzZSBtYWtl
IGl0IHZvaWQNCg0KQ2hhbmdlZCB0byB2b2lkIHJldHVybiB0eXBlLg0KDQo+ID4gK2ludCByZXQg
PSAwOw0KPiA+IC4uLg0KPiA+ICtyZXR1cm4gcmV0Ow0KPg0KPiBqdXN0IHJldHVybiAwLCBubyBu
ZWVkIHRvIHplcm9pbml0IHJldA0KDQpSZW1vdmVkIHplcm9pbml0IGFuZCByZXR1cm4gMCBkaXJl
Y3RseSBpbiBtdGtfY2xkbWFfc3RhcnRfeGZlcigpLg0KDQo+ID4gK2ludCBtdGtfY2xkbWFfZXhp
dChzdHJ1Y3QgbXRrX2N0cmxfdHJhbnMgKnRyYW5zKQ0KPg0KPiB2b2lkPw0KDQpDaGFuZ2VkIHRv
IHZvaWQgcmV0dXJuIHR5cGUuDQoNCj4gPiAraW50IGVyciA9IDA7DQo+DQo+IHBsZWFzZSBiZSBj
b25zaXN0ZW50IHdpdGhpbiB0aGUgc2VyaWVzDQo+IGVpdGhlciB5b3UgbmFtZSAncmV0JyAgZWl0
aGVyICdlcnInDQoNClJlbmFtZWQgYWxsICdlcnInIHRvICdyZXQnIGNvbnNpc3RlbnRseSB0aHJv
dWdob3V0IHRoZSBwYXRjaC4NCg0KPiA+ICtpbnQgZXJyID0gMDsNCj4NCj4gbm8gbmVlZCB0byB6
ZXJvaW5pdA0KDQpSZW1vdmVkIHVubmVjZXNzYXJ5IHplcm8taW5pdGlhbGl6YXRpb24gaW4gbXRr
X2NsZG1hX3R4KCkuDQoNCj4gPiAraWYgKHVubGlrZWx5KCFkcnZfaW5mbykpIHsNCj4gPiArcmV0
ID0gLUVJTlZBTDsNCj4gPiArZ290byBvdXQ7DQo+ID4gK30NCj4NCj4gd2h5IGNhbm5vdCByZXR1
cm4gZGlyZWN0bHk/DQoNCkNoYW5nZWQgdG8gcmV0dXJuIGRpcmVjdGx5IGluc3RlYWQgb2YgZ290
byBvdXQgaW4NCm10a19jbGRtYV9zdWJtaXRfdHgoKSBlcnJvciBwYXRocy4NCg0KPiA+ICtpZiAo
dW5saWtlbHkoIWRydl9pbmZvKSkgew0KPg0KPiB3aGF0J3MgdGUgYmVuZWZpdCBvZiB1c2luZyB1
bmxpa2VseSBoZXJlPw0KDQpSZW1vdmVkIHVubGlrZWx5KCkgZnJvbSB2YWxpZGF0aW9uIHBhdGhz
IGluDQptdGtfY2xkbWFfY2hlY2tfY2hfY2ZnKCkuDQoNCj4gPiArdTMyIGFkZHI7DQo+ID4gK3Uz
MiB2YWw7DQo+ID4gK3UzMiBzdGE7DQo+DQo+IHBsZWFzZSBzcXVhc2gNCg0KU3F1YXNoZWQgaW50
byBhIHNpbmdsZSBkZWNsYXJhdGlvbiBsaW5lLg0KDQpUaGFua3MuDQoNCkphY2sgV3UNCg0KDQo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpUaGlzIG1lc3Nh
Z2UgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gd2hpY2ggaXMgcHJpdmF0ZSwgcHJpdmlsZWdlZCBv
ciBjb25maWRlbnRpYWwgb2YgQ29tcGFsIEVsZWN0cm9uaWNzLCBJbmMuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgYW5kIGRlc3Ryb3kvZGVsZXRlIHRoZSBtZXNzYWdlLiBBbnkgcmV2aWV3LCByZXRy
YW5zbWlzc2lvbiwgZGlzc2VtaW5hdGlvbiBvciBvdGhlciB1c2Ugb2YsIG9yIHRha2luZyBvZiBh
bnkgYWN0aW9uIGluIHJlbGlhbmNlIHVwb24gdGhpcyBpbmZvcm1hdGlvbiwgYnkgcGVyc29ucyBv
ciBlbnRpdGllcyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgaXMgcHJvaGliaXRl
ZC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A738CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 01:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYnjqPNVFu7ROXRSzsNG7oC6Xw/dD3rEz9+rqBfvRdk=; b=g1cjvceRh7Oc6+QlV0NeEM7pDT
	50vmqx64/CwXmAgnVUP3HRlMlxWfntcMs3R1k9fkGP5vq4A1lLREepQdMKhpoEHxe5JZTEyk2kXo7
	ESAOCEybpDlou03PQvOIMN7gqKNAlONHKNuVlCKXp9VLWEk1JEFvNdjo+bLgzMmqSp9EBxTWk6wBx
	awYYk401FI9ZZkX/o8mvrUTNT+H72V6LI0JEe3ygN3bB2RnbrMkI8Y4itKj9SbLixE7rgDVUvHSYP
	Z+y1MHO/X2k676X7q45dYNuHBycuhGVoER3IRDs5jVE+4dwpBEpAIcincT5K5xbcQ3QydwJzdwdfY
	jseL8Hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZK4-00000008XwQ-3dKN;
	Thu, 25 Jun 2026 01:56:08 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZK0-00000008Xvf-06cZ;
	Thu, 25 Jun 2026 01:56:07 +0000
X-UUID: 00e45a6a703911f1a87c2323a98e90a4-20260625
X-CID-CACHE: Type:Local,Time:202606250955+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:4552d839-2eaf-4017-be4d-3482480779dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:945e40dc-f655-490c-9732-a9abc897f0c3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
	S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
	ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 00e45a6a703911f1a87c2323a98e90a4-20260625
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1609356530; Thu, 25 Jun 2026 09:55:55 +0800
X-UUID: fe6aebbe703811f1a9f9c99e036204b4-20260625
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:33c3770c-6076-40bd-b9fb-7dfd19789dd8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:a1a3b245-bfd5-44dc-a827-0ed06cccddf4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
	S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
	ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe6aebbe703811f1a9f9c99e036204b4-20260625
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 1419889263; Thu, 25 Jun 2026 09:55:51 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.29;
 Thu, 25 Jun 2026 09:55:49 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Thu, 25 Jun 2026 09:55:49 +0800
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v3 0/7] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Topic: [External Mail] Re: [PATCH v3 0/7] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Index: AQHdBDbr7gV1PIIW20uy7p6BeLMYarZOgjDU
Date: Thu, 25 Jun 2026 01:55:49 +0000
Message-ID: <cec5736466864641967b99adcfaf324a@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>,<20260624170917.09967c74@kernel.org>
In-Reply-To: <20260624170917.09967c74@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30028.002
x-tm-as-result: No-10--16.192600-8.000000
x-tmase-matchedrid: gIzQ6PxOy4Muv++HU7VXryRFbfQbCufdN0X64jGy2dbVc/AFNTvLS9XY
	nKy9ZqbG0wNjG7j2lpdVUa9LFLuAZpxv10buNpyDTAmQRh6AQEfVmJNHK/THAdorNiZ3c9zKLRf
	XC5L8hclDfCGkjjCVDTpfMfqKQCtJRC61Eoj6CJWbZ5Rb+gO6ITj61oDLR3drl2KBmLXt0epcRg
	SNUhN0V7Gs6LmC3y4my5giTPlFHEONYN8w7dbL+QJmkj1SAkweoli4ZoiOHT8g4pZYxslhbbNke
	EYGbJYuA/3R8k/14e0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--16.192600-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30028.002
x-tm-snts-smtp: 111CFFE2D82E31ED4BD8D70AC0B219B45BE41667AA6B454FDB79CD9BE7D3B1502000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_185604_413695_7EEBB51D 
X-CRM114-Status: GOOD (  13.89  )
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

SGkgSmFrdWIsDQoNCj4gT24gV2VkLCAyNCBKdW4gMjAyNiAxODowNDowNiArMDgwMCBKYWNrIFd1
IHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiBUOVhYIGlzIHRoZSBQQ0llIGhvc3QgZGV2aWNlIGRy
aXZlciBmb3IgTWVkaWFUZWsncw0KPiA+IHQ5MDAgbW9kZW0uIFRoZSBkcml2ZXIgdXNlcyB0aGUg
V1dBTiBmcmFtZXdvcmsNCj4gPiBpbmZyYXN0cnVjdHVyZSB0byBjcmVhdGUgdGhlIGZvbGxvd2lu
ZyBjb250cm9sIHBvcnRzDQo+ID4gYW5kIG5ldHdvcmsgaW50ZXJmYWNlcyBmb3IgZGF0YSB0cmFu
c2FjdGlvbnMuDQo+DQo+IFJlcGx5aW5nIGFmdGVyIGEgbG9uZyBkZWxheSBhbmQgdGhlbiBpbW1l
ZGlhdGVseSBwb3N0aW5nIGEgbmV3IHZlcnNpb24NCj4gb2YgcGF0Y2hlcyBpcyB2ZXJ5IGJhZC4g
RG9uJ3QgYm90aGVyIHJlcGx5aW5nIGFuZCBqdXN0IHB1dCB0aGUgY29tbWVudHMNCj4geW91IGhh
ZCBpbiB0aGUgY2hhbmdlbG9nIG9mIHRoZSBuZXcgcG9zdGluZy4gT3RoZXJ3aXNlIHRoZSBkaXNj
dXNzaW9uDQo+IG1heSBnZXQgc3BsaXQuDQoNCiAgU29ycnkgYWJvdXQgdGhlIGNvbmZ1c2lvbi4N
Cg0KICBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCB0aGUgcHJlZmVycmVkIHdvcmtmbG93OiB0aGUg
Y292ZXINCiAgbGV0dGVyIGNoYW5nZWxvZyB3b3VsZCBnZXQgcXVpdGUgbG9uZyBpZiBJIGluY2x1
ZGUgZGV0YWlsZWQNCiAgZXhwbGFuYXRpb25zIGZvciBlYWNoIHNhc2hpa28gY29tbWVudCB3ZSBj
aG9zZSBub3QgdG8gZml4Lg0KDQogIFdhcyB0aGUgY29uY2VybiBtb3JlIGFib3V0IHRpbWluZz8g
U2hvdWxkIHdlIGhhdmUgcmVwbGllZA0KICB0byB0aGUgc2FzaGlrbyByZXZpZXcgcHJvbXB0bHkg
d2hlbiBpdCBjYW1lIGluLCByYXRoZXIgdGhhbg0KICB3YWl0aW5nIHVudGlsIHRoZSBmdWxsIHYz
IHdhcyByZWFkeT8NCg0KICBUaGFua3MgZm9yIHRoZSBndWlkYW5jZS4NCg0KDQo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpUaGlzIG1lc3NhZ2UgbWF5IGNv
bnRhaW4gaW5mb3JtYXRpb24gd2hpY2ggaXMgcHJpdmF0ZSwgcHJpdmlsZWdlZCBvciBjb25maWRl
bnRpYWwgb2YgQ29tcGFsIEVsZWN0cm9uaWNzLCBJbmMuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
YW5kIGRlc3Ryb3kvZGVsZXRlIHRoZSBtZXNzYWdlLiBBbnkgcmV2aWV3LCByZXRyYW5zbWlzc2lv
biwgZGlzc2VtaW5hdGlvbiBvciBvdGhlciB1c2Ugb2YsIG9yIHRha2luZyBvZiBhbnkgYWN0aW9u
IGluIHJlbGlhbmNlIHVwb24gdGhpcyBpbmZvcm1hdGlvbiwgYnkgcGVyc29ucyBvciBlbnRpdGll
cyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgaXMgcHJvaGliaXRlZC4NCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==


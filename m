Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A78C44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCIWovYdaf3pwvsPpnFbTADY1/TuSiLdFjeFymk+Qss=; b=kFG7dA9iMmsmsvHeXRIsN+Uc/9
	sN/GZr/9Sb32Hj3hH+2A8fBs1IWzlDe76PaYiLaOGpZnV6USNbKHUd83alwkqxmkALWFNZg5+TDPa
	zsUqHdN3io7pxtjl0doLcXoIXtwF4RPvhUuURpevfhNRsrRmNx4R3S0jZlJfXy/giPEyMYoPeB1qd
	0Awx2D62EPYoRPKYzOvbJCC4nouOlemG1e4yJvRIXm45/Qfze/fN2V2pk/D1M0eBg8N2E3lB39BzX
	kovRkA6X60oqHDPEE7d5HD07fMDhTIV7h4gQfQPy2OJk28fFZSfeCZxntAviiBU30uds4ujdvU6Au
	zEYkFBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcwM-00000001QaR-2wzm;
	Fri, 17 Jul 2026 07:24:58 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcwJ-00000001QWR-1Sva;
	Fri, 17 Jul 2026 07:24:56 +0000
X-UUID: 97effeea81b011f1a87c2323a98e90a4-20260717
X-CID-CACHE: Type:Local,Time:202607171524+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:93798944-ddd8-4f75-8741-e0868344c462,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:10635f3f-46cf-453a-bd84-ad9fc7cb0e8c,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97effeea81b011f1a87c2323a98e90a4-20260717
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 573903451; Fri, 17 Jul 2026 15:24:48 +0800
X-UUID: 94a4fe7081b011f1b328fd8a884f4420-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:60d24bde-28aa-4434-b274-085c8a448ee9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:2cc612d7-d84b-4e52-b801-314e13fb1691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94a4fe7081b011f1b328fd8a884f4420-20260717
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 611019451; Fri, 17 Jul 2026 15:24:43 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 15:24:41 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Fri, 17 Jul 2026 15:24:41 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Simon Horman <horms@kernel.org>
CC: "loic.poulain@oss.qualcomm.com" <loic.poulain@oss.qualcomm.com>,
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"wen-zhi.huang@mediatek.com" <wen-zhi.huang@mediatek.com>,
	"shi-wei.yeh@mediatek.com" <shi-wei.yeh@mediatek.com>,
	"Minano.tseng@mediatek.com" <Minano.tseng@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v4 5/7] net: wwan: t9xx: Add FSM
 thread
Thread-Topic: [External Mail] Re: [PATCH v4 5/7] net: wwan: t9xx: Add FSM
 thread
Thread-Index: AQHdFQZYY6Au0ymBcU6QRccOSxUFeLZxT48k
Date: Fri, 17 Jul 2026 07:24:41 +0000
Message-ID: <cbd2ef0bba8e46efb19f692a2e114149@compal.com>
References: <20260709-t9xx_driver_v1-v4-5-a8c009d509c5@compal.com>,<20260716093422.231112-1-horms@kernel.org>
In-Reply-To: <20260716093422.231112-1-horms@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30074.005
x-tm-as-result: No-10--27.110200-8.000000
x-tmase-matchedrid: hanTHthjeUwuv++HU7VXryRFbfQbCufdN0X64jGy2db7+pncqRJfy5KJ
	3aPFxe9NnEvLMlkSt6cGzC6W4eU7pdsGK5f6Y2+IBLWfGuAH4BXAmqJNCjDgNnMUPmsZKq7TyN/
	9xESzQGMe67A3WrjNy9P9fVG+UNlLzxLA25BQ1yOUnSCU9aFRnY6Y3KWHZUQHzHuyBo0NRYbhq3
	ad3d4seVhR+S0G9WbJovsdKXnstfFog/ekWbLG5/gxOc6+WoXcexd6SR339H8wuNNoOC42LzLN1
	EoMPMryK0A4VlXuse81KKLxojcbNd3CgHlkU7zSO3MTq07BukSFCkPhi2xezXijRgXGYJ1Rrr1Z
	MaShiLQa6yL3ff+GceWZ4XPNQALbgAILpT0UYaqGLYLt2U0pakGoVfTbC+0PZAvO4QbJLKPTcn9
	450ShCZCQrS5nW+U5TLtcinM5zpzsqkhDJwwmIqia225OwhaBGKIXqFMWhdjOXN0+DA/PhFuO/m
	DqliqZlShfb454tPC/j8oPE4fqbOFgT/F/XlPPITytpp/jrEzc3xNLGJRAgSa19X1up3Nj/KmF6
	PXUvSGl/QUZuGbUvdcB/psJfq/UMBe1pL8roLQsJRkKgHlrKPDx2saqTt6YEgg3cwDHl/1O85Jc
	oT0w/WCMkDOCX51pJU0nG3tpe+CbCOivU2HrC5oUszEQtRvZ
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--27.110200-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30074.005
x-tm-snts-smtp: FE7ED39047A238EE9C538D100ED790F57632F97083E7B1B51CBB47BC022941052000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002455_721492_5F1F1E0A 
X-CRM114-Status: GOOD (  16.82  )
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

SGkgU2ltb24sDQoNCj4gPiArc3RhdGljIGludCBtdGtfZnNtX3BhcnNlX2hzMl9tc2coLi4uKQ0K
Pg0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IEFzc3VtZXMgZW50aXJlIFNLQiBwYXlsb2FkIGlzIGxp
bmVhcmx5IGFjY2Vzc2libGUgd2l0aG91dCBjaGVja2luZw0KPiBib3VuZGFyaWVzIHVzaW5nIHBz
a2JfbWF5X3B1bGwoKSBiZWZvcmUgZGlyZWN0IGRlcmVmZXJlbmNpbmcuDQoNClRoZSBSWCBTS0Jz
IGFyZSBhbGxvY2F0ZWQgaW50ZXJuYWxseSBieSB0aGUgQ0xETUEgZHJpdmVyIHVzaW5nDQpfX2Rl
dl9hbGxvY19za2Igd2l0aCBsaW5lYXIgYnVmZmVycy4gVGhlIGNvbnRyb2wgbWVzc2FnZSBkYXRh
DQphbHdheXMgcmVzaWRlcyBpbiB0aGUgY29udGlndW91cyBsaW5lYXIgZGF0YSByZWdpb24uIFRo
ZXNlIFNLQnMNCmFyZSBub3QgcmVjZWl2ZWQgZnJvbSB0aGUgbmV0d29yayBzdGFjayBhbmQgYXJl
IGFsd2F5cyBsaW5lYXIsDQpzbyBwc2tiX21heV9wdWxsIGlzIG5vdCBuZWVkZWQuDQoNCj4gW1Nl
dmVyaXR5OiBIaWdoXQ0KPiBUaGUgcnRmdF9lbnRyeS0+ZGF0YSBpcyBwYXNzZWQgdG8gYWN0aW9u
IGNhbGxiYWNrcyBiZWZvcmUgZGF0YV9sZW4NCj4gaXMgdmFsaWRhdGVkIGFnYWluc3QgYnVmZmVy
IGJvdW5kcy4NCg0KVGhlIGJvdW5kcyBjaGVjayBhdCB0aGUgbG9vcCBzdGFydCBlbnN1cmVzIHRo
ZSBydGZ0X2VudHJ5IHN0cnVjdA0KaGVhZGVyIGlzIHdpdGhpbiBib3VuZHMuIFRoZSBhY3Rpb24g
ZnVuY3Rpb25zIG9ubHkgcmVhZCBmaXhlZC1zaXplDQpmaWVsZHMgKGUuZy4sIGEgc2luZ2xlIF9f
bGUzMiBmb3IgcGFja2V0IHBhZGRpbmcgbW9kZSkuIFRoZSBtb2RlbQ0KZmlybXdhcmUgaXMgYSB0
cnVzdGVkIHNvdXJjZSB3aXRoIGhlYWRfcGF0dGVybi90YWlsX3BhdHRlcm4NCmludGVncml0eSBj
aGVja3MuDQoNCj4gPiArc3RhdGljIGludCBtdGtfZnNtX3NlbmRfaHMzX21zZyguLi4pDQo+ID4g
Kwlza2IgPSBfX2Rldl9hbGxvY19za2IoLi4uKQ0KPg0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFVu
aW5pdGlhbGl6ZWQga2VybmVsIGhlYXAgbWVtb3J5IGxlYWsuIEJ1ZmZlciBpcyBub3QgemVyb2Vk
Lg0KDQpJbiBtdGtfZnNtX2FwcGVuZF9ydGZ0X2VudHJpZXMsIGVhY2ggcnVudGltZV9mZWF0dXJl
X2VudHJ5IGhhcw0KZmVhdHVyZV9pZCwgc3VwcG9ydF9pbmZvLCBhbmQgZGF0YV9sZW4gZXhwbGlj
aXRseSBzZXQuIFRoZQ0KcmVzZXJ2ZWRbMl0gZmllbGQgaXMgbm90IHplcm9lZCwgYnV0IHRoaXMg
ZGF0YSBpcyBzZW50IHRvIHRoZQ0KbG9jYWwgbW9kZW0gb3ZlciBQQ0llIERNQSBhcyBwYXJ0IG9m
IHRoZSBIUzMgaGFuZHNoYWtlIKFYIGl0IGlzDQpub3QgZXhwb3NlZCB0byBleHRlcm5hbCBuZXR3
b3Jrcy4gVGhlIG1vZGVtIGZpcm13YXJlIGlnbm9yZXMgdGhlDQpyZXNlcnZlZCBmaWVsZC4NCg0K
PiA+ICtzdGF0aWMgaW50IG10a19mc21fc2FwX2N0cmxfbXNnX2hhbmRsZXIoLi4uKQ0KPiA+ICsJ
c2tiX3B1bGwoc2tiLCAuLi4pDQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gTWlzc2luZyBwc2ti
X21heV9wdWxsKCkgY2FsbC4NCg0KU2FtZSBhcyBhYm92ZS4gVGhlIFJYIFNLQnMgYXJlIGludGVy
bmFsIGxpbmVhciBidWZmZXJzIGZyb20gdGhlDQpDTERNQSBkcml2ZXIuIHNrYi0+bGVuIGlzIGNo
ZWNrZWQgYmVmb3JlIGFjY2Vzc2luZyBza2ItPmRhdGEuDQoNCj4gW1NldmVyaXR5OiBIaWdoXQ0K
PiBEYW5nbGluZyBwb2ludGVyIGFuZCBTS0IgbGVhay4gSWYgbXRrX2ZzbV9ldnRfc3VibWl0KCkg
ZmFpbHMsDQo+IFNLQiBpcyBmcmVlZCBidXQgaHNfaW5mby0+cnRfZGF0YSBub3QgbnVsbGVkLg0K
DQpXZSB3aWxsIGFkZCBoc19pbmZvLT5ydF9kYXRhID0gTlVMTCBhZnRlciBkZXZfa2ZyZWVfc2ti
KHNrYikgaW4NCnRoZSBldnRfc3VibWl0IGZhaWx1cmUgcGF0aCB0byBhdm9pZCBsZWF2aW5nIGEg
ZGFuZ2xpbmcgcG9pbnRlci4NClRoZSBzYW1lIGZpeCB3aWxsIGJlIGFwcGxpZWQgdG8gbXRrX2Zz
bV9tZF9jdHJsX21zZ19oYW5kbGVyDQp3aGljaCBoYXMgdGhlIGlkZW50aWNhbCBwYXR0ZXJuLg0K
DQo+ID4gK3N0YXRpYyBpbnQgbXRrX3BvcnRfY2hfZGlzYWJsZSguLi4pDQo+ID4gKwl3YWl0X2V2
ZW50X2ludGVycnVwdGlibGVfdGltZW91dCguLi4pDQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4g
SW5maW5pdGUgYnVzeSBsb29wIG9uIHNpZ25hbCBwZW5kaW5nLg0KDQpUaGlzIGlzIGludGVudGlv
bmFsLiBDaGFubmVsIGRpc2FibGUgbXVzdCBjb21wbGV0ZSBvciB0aW1lb3V0IKFYDQphYm9ydGlu
ZyBtaWQtb3BlcmF0aW9uIHdvdWxkIGxlYXZlIHRoZSBjaGFubmVsIGluIGFuIGluY29uc2lzdGVu
dA0Kc3RhdGUuIFRoZSBsb29wIGRvZXMgbm90IGJ1c3ktc3BpbjogZWFjaCBpdGVyYXRpb24gc2xl
ZXBzIGluDQp3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCB1bnRpbCB0aGUgY29uZGl0
aW9uIGlzIG1ldCBvcg0KdGhlIHRpbWVvdXQgZXhwaXJlcy4gVGhlIHRpbWVvdXQgZ3VhcmFudGVl
cyBib3VuZGVkIGV4ZWN1dGlvbi4NCg0KPiA+ICtzdGF0aWMgaW50IG10a19mc21fZXZ0X3N1Ym1p
dCguLi4pDQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKC4uLikNCj4NCj4gW1NldmVyaXR5
OiBIaWdoXQ0KPiBSYWNlIGNvbmRpdGlvbiBkdXJpbmcgdGVhcmRvd24uIGZzbS0+ZnNtX2hhbmRs
ZXIgY291bGQgYmVjb21lDQo+IE5VTEwgYmVmb3JlIHdha2VfdXBfcHJvY2VzcygpLg0KDQptdGtf
ZnNtX2V4aXQoKSBmaXJzdCBzdWJtaXRzIGEgRlNNX0VWVF9ERVZfUk0gZXZlbnQuIFRoZSBGU00N
Cmt0aHJlYWQgcHJvY2Vzc2VzIHRoaXMgYW5kIHNldHMgRVZUX1RGX0dBVEVDTE9TRUQgdW5kZXIN
CmV2dHFfbG9jay4gT25seSBhZnRlciB0aGUga3RocmVhZCBmaW5pc2hlcyBkb2VzIG10a19mc21f
ZXhpdCgpDQpjYWxsIGt0aHJlYWRfc3RvcCgpIGFuZCBzZXQgZnNtX2hhbmRsZXIgdG8gTlVMTC4g
SWYNCm10a19mc21fZXZ0X3N1Ym1pdCgpIHBhc3NlcyB0aGUgRVZUX1RGX0dBVEVDTE9TRUQgY2hl
Y2sgaW5zaWRlDQp0aGUgc3BpbmxvY2ssIGZzbV9oYW5kbGVyIGlzIHN0aWxsIHZhbGlkIGF0IHRo
ZSBwb2ludCBvZg0Kd2FrZV91cF9wcm9jZXNzKCkuDQoNCj4gPiArc3RhdGljIGludCBtdGtfcG9y
dF9kaXNhYmxlKC4uLikNCj4gPiArCWtjYWxsb2MoLi4uKQ0KPg0KPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+IFNpbGVudCBhbGxvY2F0aW9uIGZhaWx1cmUuDQoNClRoZSBrY2FsbG9jIGFsbG9jYXRlcyBh
IHNtYWxsIHRlbXBvcmFyeSBhcnJheSBvZiBwb2ludGVycw0KKHR5cGljYWxseSBhIGZldyBodW5k
cmVkIGJ5dGVzKS4gQWxsb2NhdGlvbiBmYWlsdXJlIGF0IHRoaXMgc2l6ZQ0KaXMgZXh0cmVtZWx5
IHVubGlrZWx5LiBBZGRpdGlvbmFsbHksIG10a19wb3J0X2Rpc2FibGUgaXMgY2FsbGVkDQpkdXJp
bmcgRlNNX1NUQVRFX09GRiB0cmFuc2l0aW9uLCB3aGVuIHRoZSBtb2RlbSBoYXJkd2FyZSBoYXMN
CmFscmVhZHkgYmVlbiBwb3dlci1jeWNsZWQgdmlhIFBMRFIuIFRoZSBoYXJkd2FyZSBjaGFubmVs
cyBhcmUNCm5vIGxvbmdlciBhY3RpdmUgcmVnYXJkbGVzcyBvZiB0aGUgc29mdHdhcmUgcG9ydCBz
dGF0ZS4NCg0KPiA+ICtzdGF0aWMgaW50IG10a19mc21fbm90aWZpZXJfcmVnaXN0ZXIoLi4uKQ0K
Pg0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gUmFjZSBjb25kaXRpb24gb24gbm90aWZpZXIgbGlz
dHMuDQoNClRoZSBub3RpZmllciByZWdpc3RyYXRpb24gYW5kIHVucmVnaXN0cmF0aW9uIGFyZSBv
bmx5IGNhbGxlZA0KZHVyaW5nIGRyaXZlciBwcm9iZSBhbmQgcmVtb3ZlIHBhdGhzLCB3aGljaCBh
cmUgc2VyaWFsaXplZCBieQ0KdGhlIGRyaXZlciBtb2RlbC4gVGhlIEZTTSBrdGhyZWFkIGRvZXMg
bm90IHN0YXJ0IHByb2Nlc3NpbmcNCmV2ZW50cyB1bnRpbCBwcm9iZSBjb21wbGV0ZXMsIHNvIHRo
ZXJlIGlzIG5vIGNvbmN1cnJlbnQgYWNjZXNzDQp0byB0aGUgbm90aWZpZXIgbGlzdHMuDQoNCj4g
PiArc3RhdGljIHZvaWQgbXRrX2ZzbV9ldnRfY2xlYW51cCguLi4pDQo+DQo+IFtTZXZlcml0eTog
TWVkaXVtXQ0KPiBJbmNvbXBsZXRlIGV2ZW50IHF1ZXVlIGNsZWFudXAuIENsZWFudXAgbWlzc2Vz
IGZyZWVpbmcgU0tCIHN0b3JlZA0KPiBpbiBzaGFyZWQgZnNtLT5oc19pbmZvW10ucnRfZGF0YSBp
ZiBIUzIgbWVzc2FnZSB3YXMgcGVuZGluZy4NCldlIFdpbGwgYWRkIHJ0X2RhdGEgY2xlYW51cCBp
biB0aGUgdGVhcmRvd24gcGF0aCBpbiB2NS4NCg0KVGhhbmtzLg0KDQpKYWNrIFd1


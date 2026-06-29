Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyP1rDr+scbd8EHqOhd2SEKwzz9Yk3yho9coNffyF3s=; b=PReOmxkEGczz0NCEmT+MbaSkYG
	MOYZM0vonlWl2YWF4MBNi6ZWN+UpUG+2AoUDAwt4cMVA2TYSF2qg45qxtmnJ+vPJEDkkDvkFalTwt
	CdCWR0ZjD6c5eMeNnKDW+SkU8yW7dLpVX0eDvXeEDN3GL2VGbPFCP5G8qbLgGi9f0nMPNVjDt8CQ/
	ztVJAF/i9PyJaLj/gYpkw+A3NNs5hZzL9K/jr6D/1WOoQzrczz7Nt0CgXN4I33g+1FnPIjkWmKKT8
	AR7T4TO/zEHodokqrNxFBqsybTvqZOFueEt1Zzy+HFoouEw2qUr0/U3Gb3YBH5rz4FXU64UOyfVjz
	/mvt8ECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6OS-0000000DsyN-394w;
	Mon, 29 Jun 2026 07:27:00 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6OP-0000000Dsxu-2F5i;
	Mon, 29 Jun 2026 07:26:58 +0000
X-UUID: e5119798738b11f1a87c2323a98e90a4-20260629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:a88dff58-80aa-4fd8-8822-6aca3768c74b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:300c9912-9a7e-42e1-81ab-466f1025c889,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e5119798738b11f1a87c2323a98e90a4-20260629
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1505790952; Mon, 29 Jun 2026 15:26:50 +0800
X-UUID: e216f86c738b11f1a9f9c99e036204b4-20260629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:412e1593-7594-480f-8640-49ac201ef9bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:d57df88b-c1a3-4335-bf81-c4a7f9da024d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e216f86c738b11f1a9f9c99e036204b4-20260629
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 1908956407; Mon, 29 Jun 2026 15:26:45 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.29;
 Mon, 29 Jun 2026 15:26:40 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::7d1b:448d:4d95:51b0]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::7d1b:448d:4d95:51b0%11]) with mapi id
 15.02.2562.029; Mon, 29 Jun 2026 15:26:40 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v3 2/7] net: wwan: t9xx: Add control
 plane transaction layer
Thread-Topic: [External Mail] Re: [PATCH v3 2/7] net: wwan: t9xx: Add control
 plane transaction layer
Thread-Index: AQHdA/KoG0AzoVDQmky5mWyAxH40ubZVI4cU
Date: Mon, 29 Jun 2026 07:26:40 +0000
Message-ID: <49939d4d682f4c1fb359973ea2cdbd00@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-2-73ff03f60c48@compal.com>,<2a90ae6b-2b6d-4340-b557-915252cc3488@lunn.ch>
In-Reply-To: <2a90ae6b-2b6d-4340-b557-915252cc3488@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30036.005
x-tm-as-result: No-10--4.183300-8.000000
x-tmase-matchedrid: tkB2VEODQ1cuv++HU7VXryRFbfQbCufdN0X64jGy2db7+pncqRJfy2XQ
	7TcqkNINhElhJj9TP7jAaX2MpgGS36gkniSqkpn+WZxYhPYYrMlHgZVDYg0zz4vmY1hE2VDUJQk
	txNYzOLPtFo0/MAzmm/xu9bNQI/V0YNP5ZvfGAKupSoJx15avkdZEjr6xrP/hagCqz15rA4CvI7
	qr7lIWqpm1ztAFUDBkjMlIlc7424OFF2q3JMLbrJGPSO6O5JCao4NJa7SjFsq4ssz2NHTRNT0wV
	pvG2n4d28gAxP/Ts6IHvfG6dvIquv6mDCw61sljHGqZLFSL6vqvbctbyBVCOC+JND9IHIJ4kfMa
	fuDIkC0Ich2EKbNazC40qe60KYOEZS4zlkrLF17MiA92IomI4m+o7cT3SFLw39InOc4KUjGgIAo
	CghvZZgz+8rPHUa6xHcvjWJiii5la1X5Zxk7x/Q==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--4.183300-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30036.005
x-tm-snts-smtp: BD93CB2734EF2CC9B20D2CE68070D84515D2F48398ED874D2E0ED1AAC02636F92000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002657_940095_D5B68CD1 
X-CRM114-Status: GOOD (  13.39  )
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

SGkgQW5kcmV3LA0KDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IG10a19jb21tb25fZHJ2X2luaXQo
dm9pZCkNCj4gPiArew0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArbW9kdWxlX2luaXQo
bXRrX2NvbW1vbl9kcnZfaW5pdCk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBfX2V4aXQgbXRr
X2NvbW1vbl9kcnZfZXhpdCh2b2lkKQ0KPiA+ICt7DQo+ID4gK30NCj4gPiArbW9kdWxlX2V4aXQo
bXRrX2NvbW1vbl9kcnZfZXhpdCk7DQo+DQo+IFNpbmNlIHRoZXNlIGRvbid0IGRvIGFueXRoaW5n
LCB0aGV5IHNob3VsZCBub3QgYmUgbmVlZGVkLg0KDQpXaWxsIG1vdmUgbW9kdWxlX2luaXQvbW9k
dWxlX2V4aXQgdG8gdGhlIHBhdGNoIHRoYXQgZmlyc3QgYWRkcw0KY29udGVudCB0byB0aGVtIGlu
IHY0Lg0KDQo+ID4gKwlTRVRfSFdfQklUUyhod19iaXRzLCBjaHMsIE1IQ0NJRl9SQzJFUF9FVlRf
REVWSUNFX1JFU0VULA0KPiA+ICsJCSAgICBERVZfRVZUX0gyRF9ERVZJQ0VfUkVTRVQpOw0KPiA+
ICsNCj4gPiArCXJldHVybiBMRTMyX1RPX1UzMihjcHVfdG9fbGUzMihod19iaXRzKSk7DQo+DQo+
IFBsZWFzZSBkb24ndCBhZGQgd2hpdGUgc3BhY2UgbGlrZSB0aGlzLiBJIGFzc3VtZSBhIHByZXZp
b3VzIHBhdGNoDQo+IGFkZGVkIHRoaXMgY29kZSwgc28gbW92ZSB0aGlzIHRvIHRoYXQgcGF0Y2gu
DQoNCldpbGwgcmVtb3ZlIHRoZSBleHRyYSBibGFuayBsaW5lIGluIHY0Lg0KDQo+ID4gLQlkZXZt
X2tmcmVlKGRldiwgbWRldik7DQo+ID4gKwltdGtfZGV2X2ZyZWUobWRldik7DQo+DQo+IFdoeSBh
cmUgeW91IHJlbW92aW5nIGRldm1fIGNhbGxzPw0KDQptdGtfZGV2X2FsbG9jL210a19kZXZfZnJl
ZSBhcmUgcGFpcmVkIHdyYXBwZXJzIHNvIHRoZSBjYWxsZXINCmRvZXNuJ3QgbmVlZCB0byBrbm93
IHRoZSB1bmRlcmx5aW5nIGFsbG9jYXRpb24gbWVjaGFuaXNtLg0KVGhlIGRldm1fa2ZyZWUgaXMg
c3RpbGwgY2FsbGVkIGluc2lkZSBtdGtfZGV2X2ZyZWUuDQoNClRoYW5rcy4NCg0KSmFjayBXdS4N
Cg0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB9C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LcRghasOB3VLrSPGq3lnn1siJOIGXDD6Dyzhq13TiE=; b=HBV5uj1IESEtiu92mVTcaWDXLc
	PP+X8BHXx84/bWJnRDhPpCJpLxQ4Hlw9bBzyAGqdstnyCEDADktCNu5OiKK+KBVjip0pfliFHel3L
	Q2DeC8/KnMQyQM4vI4oROiAI356PYn012PWlLLks56LQUvacarERJfaA8OGtHoE4KkHQeh96ZPGPW
	rp4UU+p87axT3fJQV+sI/I3SHzewsGJLzsd+gPHi4SyqoOfOQDP5dyiumgtWj9erz3pfOrEcdgpPV
	VJXXOOrbSCWBDHYuqmkd0J/f1an5e1SpDll5sXdxIon3fIEvkujRx4xCiBSzdfSKIuW16WPr2W3uh
	pw5uPMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIpy-00000007v0r-35YY;
	Tue, 18 Aug 2026 12:22:38 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIpw-00000007v0A-0Wf8;
	Tue, 18 Aug 2026 12:22:37 +0000
X-UUID: 7af4897e9aff11f1a87c2323a98e90a4-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:919b353d-9ca7-44d2-9570-0ff80c722afa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7f1ae54,CLOUDID:d74327fe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7af4897e9aff11f1a87c2323a98e90a4-20260818
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1895005151; Tue, 18 Aug 2026 20:22:29 +0800
X-UUID: 7922cc3c9aff11f1b328fd8a884f4420-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:653c14b8-c511-42eb-860c-11779fda892d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:76c5972a-ef9f-4a00-a93a-cba8739f43f0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7922cc3c9aff11f1b328fd8a884f4420-20260818
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 1139914629; Tue, 18 Aug 2026 20:22:26 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.43;
 Tue, 18 Aug 2026 20:22:24 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Tue, 18 Aug 2026 20:22:24 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "loic.poulain@oss.qualcomm.com" <loic.poulain@oss.qualcomm.com>,
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "wen-zhi.huang@mediatek.com"
	<wen-zhi.huang@mediatek.com>, "shi-wei.yeh@mediatek.com"
	<shi-wei.yeh@mediatek.com>, "Minano.tseng@mediatek.com"
	<Minano.tseng@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "horms@kernel.org"
	<horms@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "Yu. Robert (GSM)"
	<robert_yu@compal.com>, "Chang. Jeff (GSM)" <Jeff_Chang@compal.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v6 2/7] net: wwan: t9xx: Add control
 plane transaction layer
Thread-Topic: [External Mail] Re: [PATCH v6 2/7] net: wwan: t9xx: Add control
 plane transaction layer
Thread-Index: AQHdLpjxRfnlGRj89kaNdQWGkDdGgLajuvOM
Date: Tue, 18 Aug 2026 12:22:24 +0000
Message-ID: <44acb3c30c574ab2b9571502c3a6ad3f@compal.com>
References: <20260811-t9xx_driver_v1-v6-2-2c969fad57c6@compal.com>,<20260817223652.3688666-1-kuba@kernel.org>
In-Reply-To: <20260817223652.3688666-1-kuba@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-as-result: No-10--10.158000-8.000000
x-tmase-matchedrid: qiJ73D9abaUuv++HU7VXryRFbfQbCufdN0X64jGy2dbsEpKlvft9qjRG
	JnoK3ysiHe/Upp/4ecQGzC6W4eU7pZNJfSyzeDrtWZxYhPYYrMmB1fO2o4QGcOVvCN18RUQ056v
	0NFZuss1EnKTFRM7l3SIYOt02uIowVaaUT3OZE8MlQx76zly9o3VyPgX36i7ki5UbR3yuTZMeLw
	e+CmFhEgPRBqiZn/HBkBFw6vND/ukPm15xyht8lST5U3lJ4T8Kzu6zTBXvx+VaOxpgjiWHdTudE
	/QO+BwrthRFAcCnfMpj+fRYqRUugSmNddlth1D0EQP+pp1bPw4ba1csdkurwJxI+eocOPrc
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--10.158000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-snts-smtp: 2776AB56E5D6E94197B793C2DEABD23EAA6758B96FBC1D24CBE22758E9652F202000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_052236_520999_BB110227 
X-CRM114-Status: GOOD (  11.97  )
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

T24gTW9uLCAxNyBBdWcgMjAyNiBhdCAyMjozNiwgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgdGhlIGNvbW1pdCBtZXNz
YWdlIG1lbnRpb24gdGhpcyBtb2R1bGUgc3BsaXQ/ICBCZWZvcmUgdGhpcyBwYXRjaA0KLi4uDQo+
IHNvIHRoZSBtb2R1bGUgdGhhdCBiaW5kcyB0aGUgaGFyZHdhcmUgYW5kIGNhcnJpZXMgdGhlIFBD
SSBtb2RhbGlhc2VzIGlzDQo+IG5vdyBtdGtfdDl4eF9wY2llLmtvLCB3aGlsZSBtdGtfdDl4eC5r
byBvbmx5IGhvbGRzIG10a19kZXYubyBhbmQNCj4gbXRrX2N0cmxfcGxhbmUubyB3aXRoIG5vIGRy
aXZlciByZWdpc3RyYXRpb24uDQoNCldpbGwgZml4IGluIHY3LiBXaWxsIHVwZGF0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gbWVudGlvbiB0aGUgbW9kdWxlDQpzcGxpdCwgYW5kIHVwZGF0ZSB0aGUg
S2NvbmZpZyBoZWxwIHRleHQgdG8gbmFtZSBib3RoIG10a190OXh4IGFuZA0KbXRrX3Q5eHhfcGNp
ZS4NCg0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGUga2VybmVsLWRvYyBmb3IgbXRrX2N0
cmxfZXhpdCgpIG1hdGNoIHdoYXQgdGhlIGZ1bmN0aW9uIGRvZXM/ICBUaGUNCj4gY29tbWVudCBz
YXlzICJGcmVlcyB0aGUgY29udHJvbCBwbGFuZSBibG9jayBhc3NvY2lhdGVkIHdpdGggQG1kZXYi
LCBidXQgdGhlDQo+IGJvZHkgb25seSBjbGVhcnMgdGhlIHBvaW50ZXI6DQouLi4NCj4gQ291bGQg
dGhlIGRvYyBiZSByZXdvcmRlZCB0byBzYXkgdGhlIHBvaW50ZXIgaXMgY2xlYXJlZCBhbmQgdGhl
DQo+IGFsbG9jYXRpb24gaXMgcmVsZWFzZWQgYnkgZGV2cmVzLCBzbyBhIGxhdGVyIHBhdGNoIGFk
ZGluZyBhbiBleHBsaWNpdA0KPiBkZXZtX2tmcmVlKCkgZG9lcyBub3QgZW5kIHVwIGRvdWJsZSBm
cmVlaW5nIGl0Pw0KDQpXaWxsIGZpeCBpbiB2Ny4gV2lsbCByZXdvcmQgdGhlIGtlcm5lbC1kb2Mg
dG86ICJDbGVhcnMgdGhlIGNvbnRyb2wNCnBsYW5lIGJsb2NrIHBvaW50ZXIuIFRoZSBhbGxvY2F0
aW9uIGl0c2VsZiBpcyBtYW5hZ2VkIGJ5IGRldnJlcyBhbmQNCmZyZWVkIG9uIGRyaXZlciBkZXRh
Y2guIg0KDQpUaGFua3MuDQoNCi0tDQpKYWNr


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdXCHFlSHY6Pi75XVezjTuGAQRUzEJGxffv1ff2kPdo=; b=AZpVsKnMzO6lmeYwgJCzKGDDgE
	F4qyogmZjA/vSpIecZO5iK93tcOkMoYRaKgXgDlq4Wkqv/H/ZzzisyKurJjkOsQgQpfKqXpRTVxLW
	vfo7tzxxeL38VMIXhgD/53EYa2UxrYl34qwFatp9Yo0r/ruwBpOm+Py6bm7wvHZ26zjiM1h8zt/zq
	fSz4FODtpZX+wG9wID6Sh9uMvDHVOjGUkQk7yQKV2uJB6tRcuGQLHMx1fFLRuygwPFLpQUoThuMCO
	/e7+an/Eo5ARwBO8GUsOSNElw63ae4X23fnu/VUw2zod5k0jKKyNT1cc9y7tWj0WuN8e602uNvaIi
	4gV2HY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOc2-0000000Gl3R-46ri;
	Wed, 08 Jul 2026 09:30:39 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whObz-0000000Gl21-22so;
	Wed, 08 Jul 2026 09:30:37 +0000
X-UUID: a31695847aaf11f1a87c2323a98e90a4-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:ebc3fc81-4464-4f9f-b862-a8b97f2ce416,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:ed79e314-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a31695847aaf11f1a87c2323a98e90a4-20260708
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 204283926; Wed, 08 Jul 2026 17:30:19 +0800
X-UUID: a0d994747aaf11f1b328fd8a884f4420-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:67e242bb-a205-4bc1-8542-34d19cf307b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:b579e314-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0d994747aaf11f1b328fd8a884f4420-20260708
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 2050100014; Wed, 08 Jul 2026 17:30:16 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 8 Jul 2026 17:30:12 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Wed, 8 Jul 2026 17:30:12 +0800
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
Thread-Index: AQHdA/KoG0AzoVDQmky5mWyAxH40ubZVI4cU///wpwCABNxa7P//y6CAgAm0KDo=
Date: Wed, 8 Jul 2026 09:30:12 +0000
Message-ID: <e85332119e154021b062b5fc55c0e7b8@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-2-73ff03f60c48@compal.com>
 <2a90ae6b-2b6d-4340-b557-915252cc3488@lunn.ch>
 <49939d4d682f4c1fb359973ea2cdbd00@compal.com>
 <92b1e341-31a1-4f60-80d5-ccf8f742a38a@lunn.ch>
 <4ec081f8df234cc584702abc67213965@compal.com>,<1e75c090-f4aa-4a02-82f5-fd4f3854acbe@lunn.ch>
In-Reply-To: <1e75c090-f4aa-4a02-82f5-fd4f3854acbe@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30054.005
x-tm-as-result: No-10--3.904000-8.000000
x-tmase-matchedrid: CEwNJ/T/RZQuv++HU7VXryRFbfQbCufdN0X64jGy2db7+pncqRJfyx3E
	y8bUOyJjLw+bI5poIljs40ztshOst3xCS+CiD3FqO9AbTF0WkMJ2Tr80kEaYUBxnMY5CbhsDBK5
	jsahkTKnXaWrmEWCMgtXNOAQ2MSi2E+WLy1iJCWo58Sarp97J8xfqd/DJ3Zya7rEbQf2fdE7Y1X
	9Lfi2tyajbSjLATgmfsOVWI173K16vZxwuuLqHzTAkd+hz53cJ9DE2tWwfka1IaQZV+iBbeJT/N
	1bEGeXqAyJyOEvE0jHbYRPoS4v8I1dlNryGcEYBugRp53kzD5HdjOqvc66oIgeBiFV2jjCF
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--3.904000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30054.005
x-tm-snts-smtp: 67EF2485A09C352298FE9A9653BA47C3F06CDA692DB1F078D6CA9BF212C9D1CA2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_023035_872910_1325595C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

SGkgQW5kcmV3LA0KDQo+ID4gV2Ugd2lsbCBhbHNvIHJlbW92ZSBhbGwgdW5uZWNlc3NhcnkgZGV2
bV9rZnJlZSgpIGNhbGxzIGZyb20gcHJvYmUNCj4gPiBlcnJvciBwYXRocyBhbmQgcmVtb3ZlIHBh
dGhzLCBrZWVwaW5nIHRoZW0gb25seSB3aGVyZSByZXNvdXJjZXMNCj4gPiBhcmUgZnJlZWQgYW5k
IHJlLWFsbG9jYXRlZCBhdCBydW50aW1lIChlLmcuLCBDTERNQSBxdWV1ZSBsaWZlY3ljbGUNCj4g
PiBkdXJpbmcgbW9kZW0gcmVzZXQgY3ljbGVzKS4NCj4NCj4gVGhlcmUgaXMgbm8gcG9pbnQgdXNp
bmcgZGV2bV8gaWYgeW91IGFyZSBnb2luZyB0byBtYW51YWxseSBtYW5hZ2UNCj4gdGhlaXIgcmVs
ZWFzZS4gQW55dGhpbmcgd2hpY2ggaGFzIGEgc2hvcnRlciBsaWZldGltZSB0aGFuIHRoZSBkZXZp
Y2UNCj4gc2hvdWxkIHVzZSBremFsbG9jKCkva2ZyZWUoKS4NCg0KV2Ugd2lsbCBjb252ZXJ0IGFs
bCBydW50aW1lLW1hbmFnZWQgcmVzb3VyY2VzIGZyb20NCmRldm1fa3phbGxvYy9kZXZtX2tmcmVl
IHRvIHBsYWluIGt6YWxsb2Mva2ZyZWUsIHNpbmNlIHRoZXkgaGF2ZQ0Kc2hvcnRlciBsaWZldGlt
ZXMgdGhhbiB0aGUgZGV2aWNlLiBPbmx5IGRldmljZS1saWZldGltZSByZXNvdXJjZXMNCndpbGwg
cmVtYWluIGFzIGRldm1fa3phbGxvYy4NCg0KVGhhbmtzLg0KICAgIEphY2sgV3U=


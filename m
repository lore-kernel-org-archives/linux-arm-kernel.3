Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9519C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeTnNwE9zAl/2PeQiD7HfAWUZzInG8v71OulXD0GcmI=; b=Ym5X2eTKzaRHhop9qcOVjRw3EB
	IP2EDUMfLzLGl7+ct2yE/8rkk3C6fbd8Jy22N1vfgnD/cJNUimgdjE+Rh4hil2gqrrtOSRuxP6Bdn
	/TCWpIYAdSLD34/hfBDn3hC/vALgOJhIH1/OVNL3Pe6glp3WGE9QBKtddKtzrIGAazsn2tWDpkkTS
	EVIhP0zbTC+p0lKvLmSo5tWj2/PPznBnieMdENEIGdzWCrPGyrMDm7ju0Umkti1ESsfucowB54ZXw
	61FLsvDXQqxEc9Ro1Ymtnp14VUTBUMKv070bp1dEZYKwJ4qIHWxbQx6/8iPPmA+gMiUqvQ1cYybKE
	lmNUQ5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we64D-0000000DqtR-0ifT;
	Mon, 29 Jun 2026 07:06:05 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we649-0000000Dqqz-2i5l;
	Mon, 29 Jun 2026 07:06:03 +0000
X-UUID: f29009b6738811f1a87c2323a98e90a4-20260629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:f392318a-5541-4fa7-8b14-458a7d7b41fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:7fec2e55-f146-4045-b36d-316e66e921c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f29009b6738811f1a87c2323a98e90a4-20260629
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 491602424; Mon, 29 Jun 2026 15:05:44 +0800
X-UUID: f0550e30738811f1b328fd8a884f4420-20260629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:9f5b2324-446e-4959-8583-243ad8fb5f36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:6df59e0c-7517-44c1-aea5-8c9d3ce153dd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f0550e30738811f1b328fd8a884f4420-20260629
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 238474838; Mon, 29 Jun 2026 15:05:41 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.29;
 Mon, 29 Jun 2026 15:05:38 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::7d1b:448d:4d95:51b0]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::7d1b:448d:4d95:51b0%11]) with mapi id
 15.02.2562.029; Mon, 29 Jun 2026 15:05:38 +0800
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
Subject: RE: [External Mail] Re: [PATCH v3 1/7] net: wwan: t9xx: Add PCIe core
Thread-Topic: [External Mail] Re: [PATCH v3 1/7] net: wwan: t9xx: Add PCIe
 core
Thread-Index: AQHdA/IH10HhI6o7GUuqYj0+Wsnzp7ZVIxqw
Date: Mon, 29 Jun 2026 07:05:38 +0000
Message-ID: <e1345ff36a94468c83a0f82e5b2ec22d@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-1-73ff03f60c48@compal.com>,<b6ee3440-385f-4567-993d-c10db6f10b97@lunn.ch>
In-Reply-To: <b6ee3440-385f-4567-993d-c10db6f10b97@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30036.005
x-tm-as-result: No-10--8.890000-8.000000
x-tmase-matchedrid: CEwNJ/T/RZQuv++HU7VXryRFbfQbCufdN0X64jGy2db7+pncqRJfy2XQ
	7TcqkNINLfgCWmpP5eNQyXUpsiJmUqfDm5zpCGQxJw66cQh/R5edVbkPpTjx908Amukj7bVmEbr
	AUOQkjxDQ+sS71+DOCDt5SMZ9h0apLRtwOjyP9FeiWLhmiI4dPyDilljGyWFts2R4RgZsli4Ghf
	Rb1Tj8IFtuSLLSc0B1Rj1QPIRw621+ObWvlxRIpL6eQJjrK3FJ
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--8.890000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30036.005
x-tm-snts-smtp: 1842DB57374D5C5769838A65F7F54A1E39FC6395FFF685D109E847A256343F1B2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000602_022377_6F8D284C 
X-CRM114-Status: UNSURE (   9.47  )
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

SGkgQW5kcmV3LA0KDQo+ID4gKyNlbHNlIC8qICFDT05GSUdfQUNQSSAqLw0KPiA+ICsJZGV2X2Vy
cigobWRldiktPmRldiwgIlVuc3VwcG9ydGVkLCBDT05GSUcgQUNQSSBoYXNuJ3QgYmVlbiBzZXQg
dG8gJ3knXG4iKTsNCj4NCj4gV2h5IG5vdCBqdXN0IGhhdmUgdGhlIEtjb25maWcgZGVwZW5kIG9u
IEFDUEk/DQoNCldpbGwgYWRkICJkZXBlbmRzIG9uIEFDUEkiIGFuZCByZW1vdmUgdGhlICNpZmRl
ZiBibG9ja3MgaW4gdjQuDQoNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKChtZGV2
KS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIG1oY2NpZl9pcnEgY2FsbGJhY2tcbiIpOw0KPg0K
PiBXaHkgdGhlICgpIGFyb3VuZCBtZGV2Pw0KDQpXaWxsIHJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkg
cGFyZW50aGVzZXMgZnJvbSBhbGwgb2NjdXJyZW5jZXMgaW4gdjQuDQoNClRoYW5rcy4=


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F63C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muYZ2Z/i8Wd4P0DhRTDk2O8YiDkrBYWL87HRk9Al4eg=; b=p3MaJ4rpcCx+ibwqdGbgNAcnO0
	oFlKSSD46gRUnZT4ciB5BklJQKZ+Uae6rAQ3xPCbk/8ZiuRNnRA1PZ4pPI0oOdmRceRT0lX88UdEc
	etc+Omb2Xi2CUiVk7Xz84rJW6MvJmvVpk+mVJXKeHdvXCyMKvLx6Lr3SgFfpOtxGVsfPrJARxx9nA
	MARmv25HY/nHc+U6b/b7SHPWTXQjVzA1svY8czg6ZH+9gnvk9JQ6W3PA2bUo0msDLU5063FUaoog/
	sclPBTGHVI7mdLu5G3cTU74JSLVAt975KtElYicxiTKzIJbteQBmfoqk/d7gNEOh46ohqcVi+BrVD
	MwtyaSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKao-00000009eAW-235O;
	Thu, 30 Jul 2026 06:50:10 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKak-00000009e9P-1weM;
	Thu, 30 Jul 2026 06:50:09 +0000
X-UUID: ddd88f448be211f1a87c2323a98e90a4-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:b7745416-769d-4913-bbce-350307af46c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:09cfb933-ecf5-44a3-a34c-573dcd551473,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ddd88f448be211f1a87c2323a98e90a4-20260730
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2049505728; Thu, 30 Jul 2026 14:49:52 +0800
X-UUID: db2744de8be211f1a9f9c99e036204b4-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0f7f9550-cd24-49fd-935b-f98ff3e4defd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:9dae4de7-61a4-4820-ab46-0ec6c5e6fc1a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: db2744de8be211f1a9f9c99e036204b4-20260730
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 231696872; Thu, 30 Jul 2026 14:49:48 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 30 Jul 2026 14:49:45 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Thu, 30 Jul 2026 14:49:45 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>, Jack Wu via B4 Relay
	<devnull+jackbb_wu.compal.com@kernel.org>
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
Subject: RE: [External Mail] Re: [PATCH v5 3/7] net: wwan: t9xx: Add control
 DMA interface
Thread-Topic: [External Mail] Re: [PATCH v5 3/7] net: wwan: t9xx: Add control
 DMA interface
Thread-Index: AQHdHi3kzir4g820RkqQJOnw7ns9qbaFooJ+
Date: Thu, 30 Jul 2026 06:49:45 +0000
Message-ID: <722e299291e1433e89f5a75674797dd2@compal.com>
References: <20260723-t9xx_driver_v1-v5-0-b27afb99ccbb@compal.com>
	<20260723-t9xx_driver_v1-v5-3-b27afb99ccbb@compal.com>,<20260727181012.69e06bf6@kernel.org>
In-Reply-To: <20260727181012.69e06bf6@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30102.005
x-tm-as-result: No-10--5.766900-8.000000
x-tmase-matchedrid: CEwNJ/T/RZQuv++HU7VXryRFbfQbCufdN0X64jGy2dbVc/AFNTvLS4zv
	m4Pxxv8PfK2mxZdDSo0OW9wxtd9rfKGjTWUsfZTwm2eUW/oDuiGHF5DTCmfB2pASM5lkTKECEbr
	AUOQkjxDQ+sS71+DOCDt5SMZ9h0apLRtwOjyP9FeiWLhmiI4dPyDilljGyWFts2R4RgZsli5q/W
	wTchxsnmCMAACdFXeB0hBdGn2fh2eusmWOeoC/5bk5vrGhmfHN
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.766900-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30102.005
x-tm-snts-smtp: 6C47867A59C0461A93575AEB75272C270C262313A21D8C2F0B5E6B9331198B162000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_235006_675073_BFA3440D 
X-CRM114-Status: UNSURE (   5.99  )
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

SGkgSmFrdWIsDQoNCj4gZWFjaCBjb21taXQgaGFzIHRvIGJ1aWxkIGNsZWFubHkgd2l0aCBXPTEg
Qz0xLCBwbGVhc2U6DQo+DQo+IGRyaXZlcnMvbmV0L3d3YW4vdDl4eC9wY2llL210a19jbGRtYV9k
cnZfbTl4eC5jOjM0OjIyOiB3YXJuaW5nOiBzeW1ib2wgJ210a19jbGRtYV9yZWdzX205eHgnIHdh
cyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+IGRyaXZlcnMvbmV0L3d3YW4v
dDl4eC9wY2llL210a19jbGRtYV9kcnZfbTl4eC5jOjE2NzoyMjogd2FybmluZzogc3ltYm9sICdj
bGRtYV9kcnZfb3BzX205eHgnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
DQoNCldpbGwgZml4IGluIHY2LiBUaGUgZXh0ZXJuIGRlY2xhcmF0aW9ucyBmb3IgdGhlc2UgdHdv
IHN5bWJvbHMNCndlcmUgcGxhY2VkIGluIFBhdGNoIDUncyBtdGtfY2xkbWEuaCChWCB3aWxsIG1v
dmUgdGhlbSB0byBQYXRjaCAzDQp3aGVyZSB0aGUgc3ltYm9scyBhcmUgZmlyc3QgZGVmaW5lZC4N
Cg0KVGhhbmtzLg0KICAgIA==


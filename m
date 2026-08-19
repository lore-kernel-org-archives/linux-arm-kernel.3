Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2578C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6Hwogk4xuc023cZNOOiB9kxauBFDCx4dg2yArYsBKI=; b=T+u4O5D+raP/qNco5xmaVp+aoP
	paiWKDf5f47FmWOT4L6Wtj0qHprR7LZQHro/WxYWRzUwtOjz0dfiyqaqD2gDPFLiLY+b4UMm26Z8T
	nq6KsFDMcyZ1XFZhIPBO2YDAyJeedtm9r8dXJ1uB1dC+OPhL0Ep6CUTmrL0lBqxLvU6GA09VvhlBR
	7l+FHGylx+YfseZyZpDeU9C+wBtKhOsQBCYy5f+c38+epzudwbp8NMt8ODJuPb+U4fOq+MfftL/Z2
	9bP+4C2KI/PL/WgJDT4bgQackbuDI53UXO13eNJ2PW1ig2H/3ZGCgJNmvB3nm76WaB7Qeg9MwQw5n
	Gr7uTrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbCr-00000009Gjv-0bQ3;
	Wed, 19 Aug 2026 07:59:29 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbCo-00000009Gih-1i8w;
	Wed, 19 Aug 2026 07:59:27 +0000
X-UUID: e1ef53129ba311f1a87c2323a98e90a4-20260819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b152ef33-2eb8-4099-ac87-75c36dabcc6d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7f1ae54,CLOUDID:c4132ffe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e1ef53129ba311f1a87c2323a98e90a4-20260819
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 882948833; Wed, 19 Aug 2026 15:59:19 +0800
X-UUID: de6629f09ba311f1a9f9c99e036204b4-20260819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:d4680aac-9536-4db1-b73a-04136b04f194,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:c5d4cfa0-7377-490f-a356-eb91016bc023,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|110|111|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: de6629f09ba311f1a9f9c99e036204b4-20260819
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 489627133; Wed, 19 Aug 2026 15:59:13 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 19 Aug 2026 15:59:12 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Wed, 19 Aug 2026 15:59:12 +0800
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
Subject: [PATCH v6 7/7] net: wwan: t9xx: Add maintainers entry
Thread-Topic: [PATCH v6 7/7] net: wwan: t9xx: Add maintainers entry
Thread-Index: AQHdL7Cff36K70JpjEGgLe8eVrrWfw==
Date: Wed, 19 Aug 2026 07:59:11 +0000
Message-ID: <8420be34b7774eff879c1d4f83699ed0@compal.com>
References: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
	<20260811-t9xx_driver_v1-v6-7-2c969fad57c6@compal.com>,<20260817153821.6ee1b4a8@kernel.org>
In-Reply-To: <20260817153821.6ee1b4a8@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30142.005
x-tm-as-result: No-10--9.060000-8.000000
x-tmase-matchedrid: g7XVaO+YFMvZmVIfLFnK1FY9XYa1m8xA1gfGMJv7tZLlNADTSrHgla89
	5HEdohSr6lROzfyovSO4fx6iZUeivg/RC70xblB+bSejuH+Mi11krVIXZHd52MKcbytqP33nssb
	eQsTRANLO+1REui4fP9XNOAQ2MSi2UV8QgFV01kxIkEj2f2VroVo7GmCOJYd1O50T9A74HCu2FE
	UBwKd8yqMp+U+0bFgFhD1jXM2Nd1zTJ5ZgafpXEr2+fGXKVCfTH/DYKaRnY4A=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--9.060000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30142.005
x-tm-snts-smtp: AA6D6C90046F3F3B7BEB2A4F68C37B6437A24F8C9D9EFB33508FFA298C45B9432000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005926_784660_881C7B46 
X-CRM114-Status: UNSURE (   8.56  )
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

T24gTW9uLCAxNyBBdWcgMjAyNiBhdCAyMjozOCwgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVs
Lm9yZz4gd3JvdGU6DQoNCj4gT24gVHVlLCAxMSBBdWcgMjAyNiAxNToxNDoyOSArMDgwMCBKYWNr
IFd1IHZpYSBCNCBSZWxheSB3cm90ZToNCj4+IEFkZCBNQUlOVEFJTkVSUyBlbnRyeSBmb3IgdGhl
IE1lZGlhVGVrIFQ5WFggNUcgV1dBTiBtb2RlbSBkZXZpY2UNCj4+IGRyaXZlci4NCg0KDQo+IFBs
ZWFzZSBzcXVhc2ggdGhpcyBpbnRvIHRoZSBmaXJzdCBwYXRjaA0KDQpXaWxsIGZpeCBpbiB2Ny4N
Cg0KVGhhbmtzLg0KDQotLQ0KSmFjayAgICA=


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B9C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 02:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Udjd/1Gsb94kZtOu8ASc4fNZoYWQocqTFq710VaSY8g=; b=t41T6OAyKinu+y731RKt5JJ+zd
	ctKWQfT+k9f/z5LJGpkxP5W/5bCfcIpw3ZCwRNBVutbTRAoQmdgtSG8KvUzuGQaHzXdaU6a4ZpriV
	cKyaGXAQSq7TcP9fwJx5PkOzxphP3miKLCRkW+ZKHYPkg+0Wf8NVSN80J/KaMesd9cDuSp9CGXk02
	lNIzz0dqRXrq8eo0Csp+/7IAqbHUDUeVptVGu991i0g5WxZJiGOgvMId0g20zCrSfN0qzE50TRUzq
	jU+LDcQ9fnPp7Z5Fyh+G+YHmX90hNlzdyeCSH+faBtUrdf9xH9ayMG89QmE8NRVNILUSi2d8N2ZB3
	xYw/YMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzPlv-00000003JGW-1RiC;
	Thu, 27 Aug 2026 02:23:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzPls-00000003JFj-3Y7Q;
	Thu, 27 Aug 2026 02:23:18 +0000
X-UUID: 3fef8052a1be11f1afed4741b24580c9-20260826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Udjd/1Gsb94kZtOu8ASc4fNZoYWQocqTFq710VaSY8g=;
	b=uJfFrzpNlpqagrf/byvOWnmdNAadAXQXq5cjJaH9C/jCPprGjy+siay4zhWO56htjYHBvhxGXP2WAnykMgkN+4uWo7cJligVKqSDRjQhOcDeVyWh3SeZ+2+kVfSaGywwemy4MhTygjvOW4Eu1Tb9pmXGJiB/yOeUxcD129rROts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e42b857b-a749-4b77-ac13-fcab36230d50,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b9e93ac3-610e-480f-b463-9bb53aa0aeaf,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fef8052a1be11f1afed4741b24580c9-20260826
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1545381160; Wed, 26 Aug 2026 19:23:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Aug 2026 10:23:08 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 27 Aug 2026 10:23:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkAFONkvvCBIEWenpNzHLBpcMywlVx9CDY4RLz/uWWBT/4ofJoJRO52fwoHE6ySjYhfm9JS+Md08tp2AKWw1Yxs8LcUKMb+BNnXx481PQKxJEI5MFo5ido63ofH8/6E15islaWA0pxSDmBwBv7qbVyunSB27ZIEIGwgSFVDDbZrQMHpfmGMEakDjbqJui5Er6gZJmSST2SVHX+fPn8PSIwdYdCp2TkMWJPy9Un9gjKbdpD4OB4mRbYTzye53v0WhgRBsoZJiy+B0vRFkJI9hO9UfHWWB74wcRGd7KPNeWlq9Q7W1YzmnbwEfD7QV/lAPoY0Yr0fNA41zxLsv7nBaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udjd/1Gsb94kZtOu8ASc4fNZoYWQocqTFq710VaSY8g=;
 b=sywBSwpyDdqD566wxDPoqgKVyc+Tg2asxwFUAqH1Z75yf48vHyUCYtYl5rQD3LIEk916YUjNkpuLA+Qp3qjs/FMIzF2mmES/7so559VY5SEzzCh3w7XteyK+FlMUrHh8FaelVT6265N/n2JhLynFIbfAcLkpfiLtFO0dG1lIgZLh/IzxvN3zs/TAp4UZRHZKVEA9MILYPF9UnSaOy/fT7ufmd8mPqGTi4Y4mN/Kqo3I7XaAjnQRKSj5dBooGJIkt2dNO5m0e8N5W6rW3+9fQrFGm81sC7cCKq4TXBz4q35lCXjbhV8m2jR0l6LjfWSKEZgFaaXhjWJ5ljZTmNzDL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udjd/1Gsb94kZtOu8ASc4fNZoYWQocqTFq710VaSY8g=;
 b=viwE5Kzb0ztx3ihcq8laKpV35DSwTDDmGdt2XR7ilaeHOBE0ygIod/eDbIPMFqCDqhxsMziu8GNAAoVeIE+jSXz9xPmJPAoqY9OuoSF+VXlfgCnODXWmc5Bu2gN9zOU+VJllH1tCM6oLidVkLSlU/pzdURmyo7nLlpSCyje9oaQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYUPR03MB7109.apcprd03.prod.outlook.com (2603:1096:400:354::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 02:23:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 02:23:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "kernel@collabora.com" <kernel@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?=
	<Justin.Yeh@mediatek.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH v6 08/11] drm/mediatek: mtk_dsi: Add support for MT8196
Thread-Topic: [PATCH v6 08/11] drm/mediatek: mtk_dsi: Add support for MT8196
Thread-Index: AQHdFGIAtcZbf0YUyEurgDw1dINDvLaxbTYA
Date: Thu, 27 Aug 2026 02:23:04 +0000
Message-ID: <68c076aece72a61683a894567a8a27ec58d917b7.camel@mediatek.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
	 <20260715135703.46540-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260715135703.46540-9-angelogioacchino.delregno@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYUPR03MB7109:EE_
x-ms-office365-filtering-correlation-id: 45064da1-01a2-4530-16a7-08df03e2202c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|23010399003|7416014|56012099006|10067099003|3023799007|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: NZSBgz41Y/YMjlza33t8apioKWJ4n4LTfZcclZyffgLnzgMpWWpcfOKk6lE49BkUDuGX2XSc8LQkYEE9JRUpslD1aPlgSkolspkihW/WviUIbHoTcbKXapAqotOMiw2XXjEIMcdfo9tnni9WUREcPLcK5Sr9W8hJDfM95P619m09Kt+D5v/dOfcn18T9WSfBqwymVrg2n0G7ZovFtzAhFRVVffrYQy8X/+2tTaFBg0yIeIqn3Mw1rIwPBdF+0P+BWyF0xgMp+Fii8puizFERe8Zty4H8rZ/6GCvp3VtRsB7uLtEcSpy+dgzL2/MR7/dRKI5zrRpZ0cZdVyKPwNMwye6y+9diQGTfbUj4OB+mdzUsRbA/LYsyVk5ffOBxgRcWIXmpjNxR/lC+9fsZaeK11jX+GSHrtEBbVRByc3fcprDpVwO2js7VhfW0UQ2ACRAFtqFmfTcI8CttSBWspItAZ2WlL28AEJpxkN0ORI588NGmNNg6N0xbfqtM76cdbEJRfB2rLhz1XyICzx1w1Iiyoi3SaZ1GSo2dVv/kIgAaHTfGW3BkCFJj++RoERZvEXehzprRgzNVjBVqsG5JHjreK90TF0cr7MWMZTj4ymLN717SzI0vAJQFb5g5igc9UV9kjzWy3Q0gyV9/YqD0k1gKtV8QEowm4Xpf0k3/VPDKjd4peaXvHPuTjXLQe5/mYC1KeTXsfeeM3KnB5/iPkDMyBGe4O2Z9RHZhS6is/3k9LtQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(23010399003)(7416014)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmVKWUdtWER0R2JsK0g2L2FqNXA5aW0vc2pTZFVybk5KaTRaTzR3dGozUlRP?=
 =?utf-8?B?dUEya2lFSDNJWTBpM3VwVUN3Q0RnR0c2RmZYeGwzMWpTYWFrUnpjNE10M0RR?=
 =?utf-8?B?WjBBTlEzL2ZwYVpjKzV2NmN3RlJETUdVUlNqbG8vRE9VQXdqTFM2VFpkSVRk?=
 =?utf-8?B?S1g4dmJKR2pOS3drRkphZ1VlWEprSFB5bnRONlowdTVFL2Z6aVh3T1VaQ1Bo?=
 =?utf-8?B?SnBHYk9GTUI5dkdMM1d3bG9wNVMyakh4Zk9mME9pbFJoZ1lkY1ptV3lZdlE4?=
 =?utf-8?B?cjRLZEg1bWUrdFk4b1BMZEhid0twK3dqZkpwK3dSblVyUjNHOFRSRlAyTHll?=
 =?utf-8?B?amZQTmVSV2Y4bmV4YWtVdk9uQVhqUDVEUzZYbXdKbmhLVDkya05ncnJ5Q1Y3?=
 =?utf-8?B?dDFaQXVJR2luaUhvKzJENS8yU0tKS0hab0VheHlTeENSSTZqdHphR3hacXlw?=
 =?utf-8?B?OFphRDlqQ3dsZklrRFRTYXpMSWloVEVKWWVrdEVYMjVHSm5IMjAvZWZJZjVS?=
 =?utf-8?B?VG5nMFhCUnY1eWxaSEUvQktGb3ZuZUE1Si9TR2RZYWpvb2pPY0ZVNkRadHVU?=
 =?utf-8?B?d2ROZ1hYTFJvU3BidFpRcDJ1cmZpMHBNbTFGSndwcHRuVnB4VmgzT09RbFhB?=
 =?utf-8?B?dUdMN3ZHbGNYYzJweE82YVlUWGZIZXFZVDNlVjVjdEJXdUdTMTJ0c1JLakVJ?=
 =?utf-8?B?NFJRVDBQWGFOQWloZmcxTkVPeWNTOG12dDJmU1lQWHZYalpYbWpILytaVDFK?=
 =?utf-8?B?NVFleFF3Ky9hZS9GOVhxQjkwL3NLYUZCckpFVEM0WjIvbVdOamp4SFp0UjdR?=
 =?utf-8?B?enVCVDZER1J0S1poMEpYTzZaUEpsRm1WbEtSUGdrSEtPRDNlRk81MTVDNGxB?=
 =?utf-8?B?V0VlZkV4bVNVNitEaDJNUDFBdXQwdnBFbE1ISHI0TUFOZlgxRGNlczZNOGhR?=
 =?utf-8?B?R0gvdnpobmZuVytObHpETzhWTzNMc1d6TlN5VjErazc0NEJpQi92MkdycW1U?=
 =?utf-8?B?SjA4Z2RtRzlmYzRjN3pBanVOMWFRejlGTDR5RHhjVFk4c1d6Z1VYY2doVFI1?=
 =?utf-8?B?YzBxeHd3aXlZMkZFblB3RW5DTTJxMlZZUFBzanA0bmNGOSs1d2JpcUZHeTJZ?=
 =?utf-8?B?WVVEZ0kvU29CYWp3OWZUQjUwNkF5eUptUVN4bVA3UjY2QmIvdVh3M2pHdGdD?=
 =?utf-8?B?YTJ3c0UzMlNyaHhUMWtWV1BtSk1md2FTWE1ORWZoanE2dEFpbDNmVkhNeFZT?=
 =?utf-8?B?bW9hSnoxSUp0TTBlaVVVdmZRQ3RvTGJyTWNpRGZHV1JmNDdnbDZCUXM5N1lC?=
 =?utf-8?B?YXRZVEQrcTFHejd4TXVsVEFLTUl4Sk1BdVd3SjhWZDdEZEx3ZStQcjhEWFFD?=
 =?utf-8?B?dDRQb2ZPdGJUU0JIRlhhNTNoZ0psMVY4ckdPUktNMGpqZG5zM0l1ZUJYdXFB?=
 =?utf-8?B?UThnem10ZDh2aTVSdlM4bVNGL0NMR051RUVXUHE4RU9aanBmM055Y2FpMllZ?=
 =?utf-8?B?U3NlbmZDVWxWcWV3SFlWdHhQOUxVenhJVVNOcFhwRmtTMG4yU1JTODFUUUVW?=
 =?utf-8?B?eVJXeGIwbG8zcFlBRzlsL3BiM3Rwdjc2QTUrS2pMOEkyUTMwOWkzalZFbWNl?=
 =?utf-8?B?UUlnakJ0blUrVXBmM0pMR1JuUStSdUdEYUVUU0pmWmxmcFVzOGw4bUlpbzVU?=
 =?utf-8?B?WjdKYlluZmZyV1MwWkFTb1lPbWhUQWlhbmhTWENtZjROcEdrdVZlc2FMTjE4?=
 =?utf-8?B?OS84ZHVhYnNaMEI1c3RaaTBETDN6azhlL2htUWszZXcycEZ1YnZ4TTd0TGRa?=
 =?utf-8?B?Y0hUcWFKeUl1ZDRjcGdJUnVWSkNyMFFSbkI4MFRPSVllM0FjeEtWWGtvM043?=
 =?utf-8?B?ZTgxVSt4RU1WWk0zb2ZQdnBsNDJaVnhoTWVBbC9jSmJBT1E0VXhQNFp2WThK?=
 =?utf-8?B?dVI3Q2tyMEE2YkZJZVErd2p5Q3RKT3hDMGwveEptcHVvWE9SRk5uS2Fxa2Qv?=
 =?utf-8?B?R29semdoRytnRkRGN1JNcFZPbXNKMG5Fb2Q1SU5PMGF2aEVYTUp4d3NsMjBG?=
 =?utf-8?B?VmNCd0orMVdXVEd1azlxTWpaUmF3ck95blkzb1JFejBXMS96QkdBWnpIYi9M?=
 =?utf-8?B?azJPa1dvQlRqMDB5Uk1oSS9QbVphZVBxUmZaS0NTQWFsTkNyNmJ4Vk5pVHVs?=
 =?utf-8?B?QkxHTTVqTm9qT1dSL3NtbWZlOXNSalhOcUFZSlpnTVlTV0REMURub21ZOHZU?=
 =?utf-8?B?VmJ0RVdWSXNLY1FLenZtR3FQbllVOTJWNldkNkoyeWhWUk5WMEVuZTJ3dXI3?=
 =?utf-8?B?b1hRVEFQN2pacC9IeFg1VE5HY2NOMmxuTTljejNKQ05lNGllazBuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9589D5F9686CF7439B1C7348E2626879@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z35/duxu+hAAqbiWRJpJdu+hJC2AldiqRptgkMACNT5gdihNhbn448DjKjLVSrdr5W7Aeo8HvAy91cgOfX+kDnCERWyhDcYNEo3q2OzNTiwYce/Y5h2DONedGjqnKDu8YKGyly15x2+uHfBBIA3OAZibYRRjqoO/Q4W/tFuzyhJbwMVKgTAWeSd53mSBVTRbh2BvSYpL4mFWqrJOGwoSH/WQ1KG2dQx0Rb32vAmj6eN+k7TanTNqHgrlm2yhNBvdfciPlZwvICSdpR1IknGvuuimnkVMDi4LA4LK1DS4JR58fvRTMP2NqgnNPeKKNVwRPu1dkhCx986m+mQGORkQNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45064da1-01a2-4530-16a7-08df03e2202c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 02:23:04.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qpYay45o/T17+PQMuIG455FVezgkx8Ysm5ZubTgiFidz4VPcTEFL9TeONyoiiyQB9HWZjR6XU0O6nHY3Bq5Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7109
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_192316_902574_0E9C2F66 
X-CRM114-Status: GOOD (  12.33  )
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

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDE1OjU3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBuZXcgRFNJIElQIGZvdW5kIGluIHRo
ZSBLb21wYW5pbyBVbHRyYSBNVDgxOTYNCj4gU29DIGFuZCBpdHMgRGltZW5zaXR5IGFuZCBHZW5p
byB2YXJpYW50cy4NCj4gDQo+IERpZmZlcmVudGx5IGZyb20gdGhlIG9sZGVyIERTSSBJUHMsIHRo
ZSBvbmUgZnJvbSBNVDgxOTYgcmVxdWlyZXMNCj4gdGhlIGluaXRpYWxpemF0aW9uIG9mIGFsbCBv
ZiB0aGUgUW9TIHBhcmFtZXRlcnMgYW5kIGNhbiBtYWtlIHVzZQ0KPiBvZiBhIERTSSBTUkFNIHJl
c2VydmVkIGJ1ZmZlciAocHJlc2VudCBhbHNvIG9uIG9sZGVyIFNvQ3MgYnV0IG5vdA0KPiBtYW5k
YXRvcnkgb24gdGhvc2UpLg0KDQpJIHdvdWxkIGxpa2UgdG8gc2VwYXJhdGUgdGhpcyBwYXRjaCBp
bnRvIHR3byBwYXRjaGVzLg0KT25lIGlzIHRvIHNldCBRb1MgcGFyYW1ldGVyIGFuZCBTUkFNLg0K
QW5vdGhlciBvbmUgaXMgdG8gc3VwcG9ydCBNVDgxOTYgRFNJLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCg==


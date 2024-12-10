Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0EBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keMHajbHwNYN5YLc0GI1mp6t1qzwNIUsW19sfnbzYq8=; b=UGrhTMcTRS9oBSe+1VyT74INnA
	xSuL/lojqDSWvIoVUpaKbCB+VYq/A3dUuPY9wwnS6bB5LedlIVqDl4qehpUS+1ES35GEuewRnAXnM
	5RFGTP+bbi+eZDk0b2IyAUgMtpqXedjYolU3l5glqzr02bqXoWKhJjNefeRLlYJJphWt6lkvZEXsx
	vQwXKDsPWkAw9kao0f0YrkbspmAFFjZ3MJMREOFbnlQkdK4uRiK3+/GQhDmqqHvEDW5EWGWXjhjbt
	HP5rq+TP0v2wZPdMAQmjVUVHGQNN6iZ0o2mt7ICeA6yKLrxJrGNnKmH/liHzJ2kyNdpoUNgkqPD+x
	8ZSveiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwNX-0000000AqS7-37YH;
	Tue, 10 Dec 2024 09:18:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwMT-0000000AqN4-3Ful;
	Tue, 10 Dec 2024 09:16:59 +0000
X-UUID: 7f3692c4b6d711ef82ff63e91e7eb18c-20241210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=keMHajbHwNYN5YLc0GI1mp6t1qzwNIUsW19sfnbzYq8=;
	b=L40uXD0Zg4BPtGTIbRUPx1zjlF7Gr5c9M0MhezjzPT4kmaUg3d8h/Ay2gAqU+Drc3hevZiJ7fjWWhs9/7DAc4tIqcZUHdzLcWXsjwEATzcJqoBmjL9+83o+BK+FPNhrUAsaVJ7lQQzaXOfFOnfnnSRSjahyatF5gDH/IH7+mDwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:21366623-441f-48a9-8aa4-d15f7f09b55a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:492c7e04-b3ca-4202-ba41-09fe265db19f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7f3692c4b6d711ef82ff63e91e7eb18c-20241210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1694551179; Tue, 10 Dec 2024 02:16:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 10 Dec 2024 17:16:51 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 10 Dec 2024 17:16:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To2j0qQi8bWd6LiUyfe2nZ5c29zr3raiET9VQ2VkFWwsB8f+0Hmejr2Rp9TpRuFiMZ/V+MLoxwyplgjNiIwqGwdKoX4G8lkEoK/jL9CDHB/ipNkGA2W4PKx8pP/DlLdY27+fO7laVp4qnRziPq0POsg1ARSIv8CqqItFXDBxr28Nz7dTn5JIgQodePrM+P2mhzLt1mYcWRZchKvBkAXBWP2IaUlvEaXp7opUNV7ve4gbasupM79JEE7YlASc2eh96MFjEQFgO1VBTN9etsRdn1P0b6TMqZ1yWvifg+8ypbCCuCXMiNdE8vXtBuTnYe0rV4Iog061ouRewZtXDzWBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keMHajbHwNYN5YLc0GI1mp6t1qzwNIUsW19sfnbzYq8=;
 b=hGOLn9GW4WpZilCtTLaEI3/DzSLNSaje/PKr1onOfgnObQ3qL4h8hSiCGcX1ZZa9M0qsAiotrZYmBLzSD9i+FakRuNa5436mcPbukvmkjf5EPaOQKkr4brO9cDIMf12VoRttPyEK1qfjXxHHDYMrnXqQpkSsF49tZsyWwfrdHC2HKKIDPkXtIuEPlDH9a6/qoOwtxMtMCRWUM5GSjtgRi3uIdrBDyKQdf6BrTR+tR5EGyIJs3wpviyK+ikWz51Qv9AscOe3dR4TX9V/Xm1pDq1GQyopdRGCGHwBI4ziOa3GSo5/xvBokL77VIoYyHfU9OsSOv4Hbx0lmXZZ2d4/a0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keMHajbHwNYN5YLc0GI1mp6t1qzwNIUsW19sfnbzYq8=;
 b=b43CzOooopx9Sxqwfj80bz/KkL98IcA58MutPd6WO+IegUkoKY7tWXQoMBTyLnBXd04hC0/y/BCQNRZS8OwkATJ0OHc6ujStr9sva2mRwhOZkDzYy1y/iPFtWfUTF1zA9pTsvkNnmhS0VvBNvqRcN5qbKhltHVbjdDwB01Ipbh0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8569.apcprd03.prod.outlook.com (2603:1096:820:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 09:16:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Tue, 10 Dec 2024
 09:16:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Guoqing Jiang
	<guoqing.jiang@canonical.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
Thread-Topic: [PATCH] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
Thread-Index: AQHbR+bC4T+ucRvLREO5HVpH+7StjLLfOKmA
Date: Tue, 10 Dec 2024 09:16:46 +0000
Message-ID: <3670b4af699a1c12000f09d671e93e3ae7359724.camel@mediatek.com>
References: <20241206135507.1274357-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241206135507.1274357-1-guoqing.jiang@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8569:EE_
x-ms-office365-filtering-correlation-id: 4d9a3b7d-da43-435a-0850-08dd18fb5edd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TWdCNkc0VGprVHZ6WC9ReDMycTV0dERZMklLZnJIeHRTUjI3M0hVVks3b1Y4?=
 =?utf-8?B?QitNZFh4bW5SZzRlMHllbmcxU05HWUg5aVlOMUUrKzRSVnp5aGduTHhkV0dq?=
 =?utf-8?B?aFFQN3I3R1lEbFMxVWZRS1dSb256MzVmYTJuVEVhTmlsd2RrMzllMnh0UElw?=
 =?utf-8?B?alNzNU1UQ0Q0cVoyNjhFMXJNSFl2RHFqQXl0NnJFMERzcjl1T2NOS3R4Z3FT?=
 =?utf-8?B?akc4MThMeEZNQ1luM2hUQ3pzZExCdXUvcS96TU9Sd0ZiUWVkWUUvWmRNNmFl?=
 =?utf-8?B?MDNjODd0YUtQbk42U05vVXlDWnQ0RU9FRVFUOUoxamlxenJhbWJxU3NvZFU2?=
 =?utf-8?B?bkkzYzJndXBvT0RBVU8xUjc0WDY3UFNDbzFxaXgwaXNPejIzZ2xuVURWdVhl?=
 =?utf-8?B?Zk1STm5LVEpYczZnNlZoUFVQeXRJMHJJNC9GUGxudmFpdUt3bE5jcGZwV3Yy?=
 =?utf-8?B?NEdYRVRtZmN2eHIwaGZFeFVYM2E3OTZPMEF1akdKNk02QlBsdDhIVGdYa1RP?=
 =?utf-8?B?clY5T1YxaHRCV1hTbC9GTUVUK2Y4TXdrVmd1WU9JeWRaczBmOUdOYXFra1dy?=
 =?utf-8?B?Sy9ERjR4THcvY09uek5lOVR3NTVhZEFXS1hpaEVHdzZPdGZlMHRsWURDMzlU?=
 =?utf-8?B?cXJabnJXbHRVR0pGckJveXV2b3FEZ3pEbU8rS2hmTkFBdy80SExtbUx6Szcx?=
 =?utf-8?B?VFBJSWwwL3FSL0xoSDNXV0N3eEhscmVIbFVDeExmQWRPYWp6QlRlKzFpZmZI?=
 =?utf-8?B?WUZFVlhidTJ1Zkx3ZmxtZ2dUVXpjb2hrTUxEMEYrdVBtM25IeW9Cem4yaWRR?=
 =?utf-8?B?UGhQSzdTaWNBT05ybjU4cytvM1l6UWx3dkdNUEQxdS9jYk5lTForeFc3MHYx?=
 =?utf-8?B?RFQ4TW04L3J4WFJrOVhOYWhidHFEMzhIc2d2endKMjkwUzBxNm5xbWdxVGpq?=
 =?utf-8?B?YkJHRXBlMklwNEl1SHVaZzRDMDJXNXRIZzVySkdRMTRkN205K2dsVW1WS3lj?=
 =?utf-8?B?UGFEYzB2c29hRXB5L2YyRXNNcTBkZzB6eHlIVHBtbGNhQ2ROVjh4Q2czNG56?=
 =?utf-8?B?c3c4UXNwMlY3T2VZaTdOcVJhbUxtRTQ3VndHLzNNVENuUWZGSzBCNGd6L1BW?=
 =?utf-8?B?UVBaSkV2bkNtN3EvYUZKSGdiQm9xb1RvNVZxUFJWbGc5L05NMjFFOWFNRUlx?=
 =?utf-8?B?akZtVGROdWM3QVZ3UUliVkViaE9NdmdkK1JaUXBnSmZVYlEvamc1NGsrU1pN?=
 =?utf-8?B?QlFRSDg2NHduYUE1ajhhTTVNWkw2VTRQL3krbFRkOUZwU3NOYnNRbDZ0cGVE?=
 =?utf-8?B?NUNvMU8zSDIzQUdUaS9TOGV1VW1jenJuYTFROHpWc2VsaUZWMFhuUHlMLzdv?=
 =?utf-8?B?MFVsbWFhNGFYbytFWWtDRkJubGNJMTd1SVpXRThKL1NZdEdQRWlRNFhJWitp?=
 =?utf-8?B?Y0t1bnZURzhFVHNhc1dLeUVVNklvVGxrZnowbjRUenNmMHdFSEx4bWxUeVo1?=
 =?utf-8?B?VGR0OWIzazMyQ2hEcW4wWFVqdGhOcTZlUVBWbkRKQUFvMzJnWXh6ZVU3c1M2?=
 =?utf-8?B?c05YZHE1UWlHa1JkMXBXTkRjcGRxcU1uRXM5RDVDNFNJK2xSZmdFZnpMVzU4?=
 =?utf-8?B?aUhhbEhoYnFlM3V5N3NtQjRSNUxud1pPbVlKcjh0QzdxTERtT2VFWDJQNFhW?=
 =?utf-8?B?QW9NUlF0a3Y0TXB3a3JZK0paS0FBYW01amVWRjltK3haMTd1ell3NVg4N1Ni?=
 =?utf-8?B?VlIra2V6djU1Q0FyYW9meVQxL1FUbjc4WUtyYkVyRWZiZG8walJXNWhEYzRm?=
 =?utf-8?B?SUFkQXZZdjVlVk4rUk0vemdaUU1kZi84NW10eFp3aU5CcVhLSWJVNVpkVWt3?=
 =?utf-8?B?YVhIT3ErSUxEYUtKTjV0em9nd1Q5UXNPbjZkbTBZNFdCNmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3dhMFR5YlVxamhXU0RtVWpEWXQ0MnVISTI4WjgySFZhTzFIak9zTW4zS1RQ?=
 =?utf-8?B?blF2UFl4NzZRaWN5YkFOWkZCRDVQbU5HdkRMK2c2eUNQeEtRSjQvZkZKSUhm?=
 =?utf-8?B?RVlTWGVxUmg0Z2FRNTlrZkxuM2ZyNklHb0ZMcmRhNVRKLzdLRWNPL0s0eXZz?=
 =?utf-8?B?NDY3YXRIU0ZMdVJFNzdsNCtPQzhzYWlWeEs1cW9leFJ6Qm91MU1nNUQ2bVhV?=
 =?utf-8?B?UVZZN2xjb2YxVTU2OUdFRHVtNnBHRnJ4ZTFZeXN1M0VpUDVWRXp4V3hwUGJV?=
 =?utf-8?B?QUxHQ1RnczU0cFFxMjhvaDdES2NwZzBCODdqNVRkNDVZcW9Ka2pUeERwOUpD?=
 =?utf-8?B?T2RBSFZhN1FEYXpNUkRFUE5PNmVqWWVKQUxONlo2QzExdWVNamYwTGtpVzZF?=
 =?utf-8?B?QjJ5dzJ1UktjTFk5VklsQXJLM0djaGsvaGRtMHpuSzJicHl3Ty9mdDJjUEJZ?=
 =?utf-8?B?TUd2NjdVZ2V4U3lZMHRFakI3N2hBaVNHckVlbmI4LzBlVW9wODE4MUlaL1My?=
 =?utf-8?B?RUM2d2VNcFY2bWRsWnlqN2xpVlVYdGJGWW11QlVWamtTYmZLbHhiVmk1c2RT?=
 =?utf-8?B?Z3NrM0tOcnowd3BWOVRtTGk3T2dST0lBUGJqbWFTelF4K1RDQVNwQVNPQkk4?=
 =?utf-8?B?a3BTNDdxcTQxVmxERTV6SFRJWVZPeU5wTEkwa3k1S0FKY3lMSHZTUUFBL3N0?=
 =?utf-8?B?MnRFUmJiK3AzYWdpYWh4UFRpNWowajNydzVjWVZCcERsMSthbTRBNnJWNytw?=
 =?utf-8?B?aGQ5enJxWFd6Wm1TRkpUV0NSSEpBYmJ6MW5MMmpNeEpDWTVnSmQrY3RQb0lX?=
 =?utf-8?B?a1lxTTR1QXg2QzVXR2lhQVRMbW5hYjRPeDFiS1NndHlCVWpNYS9DUjJKbEtX?=
 =?utf-8?B?ZGpCUXdOT3ZsTVlyMmwzODE0bnVrYjVWZXB4ZzNQM0MxTXE5WVJHVFcwejdr?=
 =?utf-8?B?Q3VDV04vS3lEY2tQNFNadjRKd1E2MUcxSTBjOWdydkVYZXlqYjBMV25kVzA5?=
 =?utf-8?B?MU9USkU4TVNJZWhja3RqTFdUNCtYQkNIRHpQMWdNcFNsLzhvS1Ftd2IySXJq?=
 =?utf-8?B?UGZCMlp5aTFXQVgvMi9JczlyZWpiT3lzZHBIUm1GUDdaWjdYNitWZFNEb0ow?=
 =?utf-8?B?OXoya3Q2Njh0MDhHRUs4cHBlZzhvY0hOdENaVjBzNE0wZElDS3lzaldKVzlR?=
 =?utf-8?B?dE14ZGFNdms2VUFJS0o5QkFhb3UrUEQ0T1ZQU2hrZlM3ZE5XQnVpZU5YZDA5?=
 =?utf-8?B?K2wzdG5SMjU4aXZ4WXh6VlBRMU1vMVdQQTM2MUJqaGpSYjRIeTRudWw1dSty?=
 =?utf-8?B?RFFLdjRqZXRKM2JoSS9NU1Nlb3BjWERaeVg5SVR4NU1PcEpGUS9kY0VlRlpt?=
 =?utf-8?B?YXlBQU9EdWJ6L2xFOUU5RG9Wc1FmRUh4djFPZnIzcnVrZTh6ZUE4bUdKSEpy?=
 =?utf-8?B?Rkpib2JHWVRINmxWaDdKcVhvQ3hXTHl2VVUwWDJVVFpiNFBRcGhsMEcybld3?=
 =?utf-8?B?YnVjUWtJV1lvejdiZGxJam90TmoyRi9Wdk1EaGtiVld5MjBwYTNVUUdZbzRk?=
 =?utf-8?B?RlM0eGF4NGJJQVlaUnVhUWFUUnFIV0ZjVkxLV0dzNVYranYrOTRHTUp1OGMz?=
 =?utf-8?B?YWtoZ2t6eUQvSlZXbmFLUXJMMGtoVEkxZTk3Q0lhT1JwLzlBVkxZUjAyaDRQ?=
 =?utf-8?B?T1J4TWg3bE1LMnRJVGdURWhKQm5JSDR0YUM0c2tCR1ZmeG5ObDZSd25sN2lK?=
 =?utf-8?B?WGlXTU94ZGxzTUVYQVhsRE1WeFJGVTRNeE9PSzJwcjFBbnQ0akNnNU16azVh?=
 =?utf-8?B?MVVueFpQWnFzc09ReW9pRjRXMXZDUTc4aTRVTUtEVEl2TGdPWFpIVVR1Q3lN?=
 =?utf-8?B?QXZWMEFGYTMzSENnRG81U3FtRjB6djZNLzBiQlVUcjVlZ2dCL3BnUDZoNUwz?=
 =?utf-8?B?L2RQaGN4clpSbndRRFhtQjRWRzZKRHZRMFJHNWdDbTE5aEZwdTROQndzbnBm?=
 =?utf-8?B?a1h2SjlBdFgwYVZ1MnFheEszc3NidEhUbDBQWVc1NGZ2ems1T3lEYVIwTmdi?=
 =?utf-8?B?a1FpQ1VFeVh5bkNKUDJ4Nlo1ZVowTWpUSDhkT1lFKzVzTTQvYTdPdW16SENv?=
 =?utf-8?Q?/GV4xuhXegEyePr9xfEXei9EI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DD0048BB6AB504AA8AE2C29D5B15703@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9a3b7d-da43-435a-0850-08dd18fb5edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 09:16:46.3363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WeqhZQhP4JVkmZO/NpS94iG1T1DyRBgs4ABQwq2uQV8IE8h032dmRuoIh7FNOf+TQ4nzAAslxU7AyfOa4srQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8569
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--26.727400-8.000000
X-TMASE-MatchedRID: eVEkOcJu0F6Is4Pn4FVe+Sa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCppZY7t46xf3yeVujmXuYYUk227Ivqakhbqln+jYe7ZhWmT
	LEJm4ZkSg01Am9ut57Dyql6CYqfcHwsZtKo32enR1e7Xbb6Im2ov8pidhVYOUwvQ8Ryq55PLzzI
	DHTOQOHgBCE7zybeHUIlRioCcUJrbpuI4DF8FKRsL7hngEtCqWbd6rGhWOAwSTodx4qqDXktwiv
	5J7HPU3cC3Ykk9bkKXK8MDOu23EVbNUVnqixiMOQr2qXCJMSV+eEP0DdJrulgqiCYa6w8tvGd22
	82fApofi8zVgXoAltj2Xsf5MVCB1t7DW3B48kkGtIWznhjjBtfoLR4+zsDTtAqYBE3k9Mpw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.727400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BC20B5018E83F27C7C756113D99B5B8CE9AACF3C7A139B939FFEDCA42F991FE52000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_011657_828395_73C5014F 
X-CRM114-Status: UNSURE (   9.96  )
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

SGksIEd1b3Fpbmc6DQoNCk9uIEZyaSwgMjAyNC0xMi0wNiBhdCAyMTo1NSArMDgwMCwgR3VvcWlu
ZyBKaWFuZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgcG9pbnRlciBuZWVkIHRvIGJlIHNldCB0
byBOVUxMLCBvdGhlcndpc2UgS0FTQU4gY29tcGxhaW5zIGFib3V0DQo+IHVzZS1hZnRlci1mcmVl
LiBCZWNhdXNlIGluIG10a19kcm1fYmluZCwgYWxsIHByaXZhdGUncyBkcm0gYXJlIHNldA0KPiBh
cyBmb2xsb3dzLg0KPiANCj4gcHJpdmF0ZS0+YWxsX2RybV9wcml2YXRlW2ldLT5kcm0gPSBkcm07
DQo+IA0KPiBBbmQgZHJtIHdpbGwgYmUgcmVsZWFzZWQgYnkgZHJtX2Rldl9wdXQgaW4gY2FzZSBt
dGtfZHJtX2ttc19pbml0IHJldHVybnMNCj4gZmFpbHVyZS4gSG93ZXZlciwgdGhlIHNodXRkb3du
IHBhdGggc3RpbGwgYWNjZXNzZXMgdGhlIHByZXZpb3VzIGFsbG9jYXRlZA0KPiBtZW1vcnkgaW4g
ZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24uDQo+IA0KPiBbICAgODQuODc0ODIwXSB3YXRjaGRv
Zzogd2F0Y2hkb2cwOiB3YXRjaGRvZyBkaWQgbm90IHN0b3AhDQo+IFsgICA4Ni41MTIwNTRdID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiBbICAgODYuNTEzMTYyXSBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBk
cm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bisweDMzYy8weDM3OA0KPiBbICAgODYuNTE0MjU4XSBS
ZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmYwMDAwZDQ2ZmMwNjggYnkgdGFzayBzaHV0ZG93bi8x
DQo+IFsgICA4Ni41MTUyMTNdDQo+IFsgICA4Ni41MTU0NTVdIENQVTogMSBVSUQ6IDAgUElEOiAx
IENvbW06IHNodXRkb3duIE5vdCB0YWludGVkIDYuMTMuMC1yYzEtbXRrK2dmYTFhNzhlNWQyNGIt
ZGlydHkgIzU1DQo+IFsgICA4Ni41MTY3NTJdIEhhcmR3YXJlIG5hbWU6IFVua25vd24gVW5rbm93
biBQcm9kdWN0L1Vua25vd24gUHJvZHVjdCwgQklPUyAyMDIyLjEwIDEwLzAxLzIwMjINCj4gWyAg
IDg2LjUxNzk2MF0gQ2FsbCB0cmFjZToNCj4gWyAgIDg2LjUxODMzM10gIHNob3dfc3RhY2srMHgy
MC8weDM4IChDKQ0KPiBbICAgODYuNTE4ODkxXSAgZHVtcF9zdGFja19sdmwrMHg5MC8weGQwDQo+
IFsgICA4Ni41MTk0NDNdICBwcmludF9yZXBvcnQrMHhmOC8weDViMA0KPiBbICAgODYuNTE5OTg1
XSAga2FzYW5fcmVwb3J0KzB4YjQvMHgxMDANCj4gWyAgIDg2LjUyMDUyNl0gIF9fYXNhbl9yZXBv
cnRfbG9hZDhfbm9hYm9ydCsweDIwLzB4MzANCj4gWyAgIDg2LjUyMTI0MF0gIGRybV9hdG9taWNf
aGVscGVyX3NodXRkb3duKzB4MzNjLzB4Mzc4DQo+IFsgICA4Ni41MjE5NjZdICBtdGtfZHJtX3No
dXRkb3duKzB4NTQvMHg4MA0KPiBbICAgODYuNTIyNTQ2XSAgcGxhdGZvcm1fc2h1dGRvd24rMHg2
NC8weDkwDQo+IFsgICA4Ni41MjMxMzddICBkZXZpY2Vfc2h1dGRvd24rMHgyNjAvMHg1YjgNCj4g
WyAgIDg2LjUyMzcyOF0gIGtlcm5lbF9yZXN0YXJ0KzB4NzgvMHhmMA0KPiBbICAgODYuNTI0Mjgy
XSAgX19kb19zeXNfcmVib290KzB4MjU4LzB4MmYwDQo+IFsgICA4Ni41MjQ4NzFdICBfX2FybTY0
X3N5c19yZWJvb3QrMHg5MC8weGQ4DQo+IFsgICA4Ni41MjU0NzNdICBpbnZva2Vfc3lzY2FsbCsw
eDc0LzB4MjY4DQo+IFsgICA4Ni41MjYwNDFdICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsw
eGIwLzB4MjQwDQo+IFsgICA4Ni41MjY3NTFdICBkb19lbDBfc3ZjKzB4NGMvMHg3MA0KPiBbICAg
ODYuNTI3MjUxXSAgZWwwX3N2YysweDRjLzB4YzANCj4gWyAgIDg2LjUyNzcxOV0gIGVsMHRfNjRf
c3luY19oYW5kbGVyKzB4MTQ0LzB4MTY4DQo+IFsgICA4Ni41MjgzNjddICBlbDB0XzY0X3N5bmMr
MHgxOTgvMHgxYTANCj4gWyAgIDg2LjUyODkyMF0NCj4gWyAgIDg2LjUyOTE1N10gVGhlIGJ1Z2d5
IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgcGh5c2ljYWwgcGFnZToNCj4gWyAgIDg2LjUyOTk3Ml0g
cGFnZTogcmVmY291bnQ6MCBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMCBpbmRl
eDoweGZmZmYwMDAwZDQ2ZmQ0ZDAgcGZuOjB4MTE0NmZjDQo+IFsgICA4Ni41MzEzMTldIGZsYWdz
OiAweGJmZmZjMDAwMDAwMDAwMChub2RlPTB8em9uZT0yfGxhc3RjcHVwaWQ9MHhmZmZmKQ0KPiBb
ICAgODYuNTMyMjY3XSByYXc6IDBiZmZmYzAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCBkZWFk
MDAwMDAwMDAwMTIyIDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgIDg2LjUzMzM5MF0gcmF3OiBmZmZm
MDAwMGQ0NmZkNGQwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDBmZmZmZmZmZiAwMDAwMDAwMDAw
MDAwMDAwDQo+IFsgICA4Ni41MzQ1MTFdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IGthc2FuOiBiYWQg
YWNjZXNzIGRldGVjdGVkDQo+IFsgICA4Ni41MzUzMjNdDQo+IFsgICA4Ni41MzU1NTldIE1lbW9y
eSBzdGF0ZSBhcm91bmQgdGhlIGJ1Z2d5IGFkZHJlc3M6DQo+IFsgICA4Ni41MzYyNjVdICBmZmZm
MDAwMGQ0NmZiZjAwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZg0KPiBbICAgODYuNTM3MzE0XSAgZmZmZjAwMDBkNDZmYmY4MDogZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4gWyAgIDg2LjUzODM2M10gPmZmZmYw
MDAwZDQ2ZmMwMDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmDQo+IFsgICA4Ni41NDQ3MzNdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQo+IFsgICA4Ni41NTEwNTddICBmZmZmMDAwMGQ0NmZj
MDgwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZg0KPiBb
ICAgODYuNTU3NTEwXSAgZmZmZjAwMDBkNDZmYzEwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4gWyAgIDg2LjU2MzkyOF0gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IFsg
ICA4Ni41NzEwOTNdIERpc2FibGluZyBsb2NrIGRlYnVnZ2luZyBkdWUgdG8ga2VybmVsIHRhaW50
DQo+IFsgICA4Ni41Nzc2NDJdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0
IGF0IHZpcnR1YWwgYWRkcmVzcyBlMGU5YzA5MjAwMDAwMDBiDQo+IFsgICA4Ni41ODE4MzRdIEtB
U0FOOiBtYXliZSB3aWxkLW1lbW9yeS1hY2Nlc3MgaW4gcmFuZ2UgWzB4MDc1MjA0OTAwMDAwMDA1
OC0weDA3NTIwNDkwMDAwMDAwNWZdDQo+IC4uLg0KDQpSZWZlciB0byBbMV0gdG8gYWRkIEZpeGVz
IHRhZy4NCg0KWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjYuMTIvcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbA0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogR3VvcWluZyBKaWFuZyA8Z3VvcWluZy5qaWFuZ0BjYW5vbmljYWwuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMiArKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gaW5kZXggOWE4ZWY4NTU4ZGE5Li4wMDYyMzc0Zjc1ZDUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IEBAIC02NzMsNiAr
NjczLDggQEAgc3RhdGljIGludCBtdGtfZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAg
ZXJyX2ZyZWU6DQo+ICAgICAgICAgcHJpdmF0ZS0+ZHJtID0gTlVMTDsNCj4gICAgICAgICBkcm1f
ZGV2X3B1dChkcm0pOw0KPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBwcml2YXRlLT5kYXRhLT5t
bXN5c19kZXZfbnVtOyBpKyspDQo+ICsgICAgICAgICAgICAgICBwcml2YXRlLT5hbGxfZHJtX3By
aXZhdGVbaV0tPmRybSA9IE5VTEw7DQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+
IC0tDQo+IDIuMzUuMw0KPiANCj4gDQoNCg==


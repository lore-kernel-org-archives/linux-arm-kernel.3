Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C8D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVhQE3TJgpBxHcReFjbNvtrqgSEEl1iDUWAuoiJ45mE=; b=Kcx06FeaKyvP0Riw3Lw1ToBU7q
	+WJNTSCZPxVS7t4emphq68EO213cjLu98f+yGbFVnnPNQFvNOgDBKVrOqFc+BO1UkVxrpUX/bTBFg
	F7Y2YGY+GPo/fqsjAulb9i+6sW52lkNFvmZh/0CnBgPODmiHgluAcnjU16+5DusHQCE5vdgCsERTF
	zoqvznwGTERk30IjQiz/n58cCYYV09vPmMGe/Dmr9GCbIGcKuWCBZJpewdmGLzuqKJSWIINXc1E/m
	d7Ea/Pctyazq8O6Z0JLFx9tB7//Y8ErBvhz4spJx+/HoyfcrKVSU/gNZt87zmYRRc7LOa10cmXzWv
	r0UVtgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoSX-00000006VRl-3ORM;
	Wed, 17 Dec 2025 10:08:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoSW-00000006VRG-0WeP;
	Wed, 17 Dec 2025 10:08:41 +0000
X-UUID: 56c2b0b0db3011f0a52f393f94899d25-20251217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nVhQE3TJgpBxHcReFjbNvtrqgSEEl1iDUWAuoiJ45mE=;
	b=ee9qOWSbyWYRRh0xlMtDjWovSKjXXYJftBFKDHuMeMVfTVdJcP7HwzyfTFV3JD8cqJJaJVgsY2S4nScaskUcHHCKAPNIZe+vCQSNABAnIntYQJu9LxVx24qCAi/skV05Mk6yLv51t/ZgwdhT84JC4DSmMwto35/rDeYCGqgB114=;
X-CID-CACHE: Type:Local,Time:202512170308-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ac7430d1-c918-4851-a343-9ff3b0edef66,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8e2f4baa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56c2b0b0db3011f0a52f393f94899d25-20251217
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 563878100; Wed, 17 Dec 2025 03:08:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:08:27 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 18:08:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDx5uRFxDMAeYz0p2Q93+DLmJjMlTNjwkkbPsP+yxiV0ffXKoJYIR2JqQ3/o24qGUf1mQ28loxyhQSkBvmddJFFjB9T8UkHX/yj1M2Qt37FiLJvT147LPpeDPJM9+1l9uKH9G9Q1noV11nR1/6XYbv02w87ytqSZDuLRJVEnE4RQXHD0zUsoaqepk36/L5T6lYmaWCzJ01WxVFUHHX1GdaE2mN6HFYBBBPJ/F8cJQfmFYjMF2gO4NYenis5V1BB0/k76/uTHNT7Z9+ftTExLdEW3eQeRrpNVIYrP7StXeujOvV50PM2t1RqX34D5uVUNnMxoQoT8ikeZQXaa2ZprUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVhQE3TJgpBxHcReFjbNvtrqgSEEl1iDUWAuoiJ45mE=;
 b=V9hU06EO55Dwdn9hJdH46AVT9ALSBjXbDoakH55Jot4m1kpVVdEYxpKfpFcQsZMnl0r3IYa1V9f2agyfJdxqOqSPZTh9hM3fG3pG4CKz40OprQ5rM3t3hxRmvhBnHzabhu7Gptrwl0SRUujQQ+/M0AXncwj47oeI0od0tJ44hkshoNqnYoGZHUZa3XxRXdrU3tElWFCaOBzWKsv2LUyexCUvngO1u94halShyujfZxPXvUMDHkyZKBGjPl4fuPuN5lpfBOgXCTTjCojpfPKdSPTmijXGiZhoBwFb7wIBk2EEBr5akwRnmIAy6f5OlxGRNAA9/isWMSlpTOkLMSerWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVhQE3TJgpBxHcReFjbNvtrqgSEEl1iDUWAuoiJ45mE=;
 b=Mh26mk7odiQd3ahuZbNw4pVMfTvZETXoH+5/p/gkZa8UuHInJdvCBq3n1gwd4Y/43M1Ky62RBsHIVFTv9ydUjs36ffVmSsTvOrRvAM4sMICQ0zMPyM99RXX7qNaQzNpNMkLESwFxzCD4OqWy4dhWY02G+tUxlpXE49BCPn8Jk4c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE1PPF499066549.apcprd03.prod.outlook.com (2603:1096:108:1::850) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 10:08:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 10:08:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?=
	<Mac.Shen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] drm/mediatek: Add isolation to edp
Thread-Topic: [PATCH v7 2/2] drm/mediatek: Add isolation to edp
Thread-Index: AQHcTWmD7mB16yri6Ei30YOxKZo2YLUl31SA
Date: Wed, 17 Dec 2025 10:08:23 +0000
Message-ID: <e9f167c88c29fa30ef3a22995c2955cde478b41d.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-3-liankun.yang@mediatek.com>
In-Reply-To: <20251104085957.1175-3-liankun.yang@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE1PPF499066549:EE_
x-ms-office365-filtering-correlation-id: c72b94a9-8b44-4b57-afe7-08de3d5436b6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|42112799006|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bTFnZmcyVlYvVWI2SDE2NkNzNk96WFdhK0J2cFRUWXFtUWxYNkdZMlYya1hK?=
 =?utf-8?B?Q3BQR1dXMTYzc0J2YmZuc0h0WHZQbE53Y2NYeUdOREhOQUpyaWtMTE12VTA0?=
 =?utf-8?B?ek9EMnlJaGV1SDRYYThPSjl2NGF0ZWV2K3JXV2NEUTllWFNtUlVXeFBETU9E?=
 =?utf-8?B?WlFMbWVodk1pMyt0VndKdENOelJLVWpuVUVxMzhkVnVlaThjeUgrY0FjM3cz?=
 =?utf-8?B?cGFmdDBFcGhxWEorM1F5WWdXdjdDWTdmdmZTOVQvbnVENVlUd0hhUDZhWlh2?=
 =?utf-8?B?TVBJSmpFYVFoYTVacGJ0b3orSUNHMUdlUUgwbUpCWDVFUHQ0ZFJBQmJkaHJP?=
 =?utf-8?B?QnFFVytONFpBK3p0RTRaUXZwa3EzWUlaZEZlcFJNYVo1VktoZ2R5S2RLaHFy?=
 =?utf-8?B?TWx3OExSNWJpL2ovNEVxaUU5NGJZY1VsTE1YQXh5YnJLZkQ5WnFORWpDTDJ6?=
 =?utf-8?B?aG1CT0FOTFY1cm9TTnpqZjd6dzJPSDNXRm5RZkE5b2dqRUxMa0xBZzJHSmsz?=
 =?utf-8?B?cGx2ZG5LK3Fva1hiekd3MFR0MjBOd2x6bm9RenRBTE9yU2dBN1NPWDVScW56?=
 =?utf-8?B?Y2h5THBtampwemZOS1JsWUE5RDk3Q3Z3K1JJYjVDTDY2T3d4N3VjTk5nM29H?=
 =?utf-8?B?VjNHYi84NzFNcFZZVzBwVUNZWWFqZnBNbCttM3pKQ25DM21BNW9zTUZqMm9i?=
 =?utf-8?B?bkVRL1VUQnVRUlJiOERUaXRCZCs0ckV6bVh0UHoxK3FBUzI4eTBBV0VIekpk?=
 =?utf-8?B?SkNGbWN5S1pTS0RZNmIwRm5idE8yZ0YvUWdZbXlQQUJTUzhBMlViTGhNVjRS?=
 =?utf-8?B?UjZRSnRwaDk0dVRPRkROeVNNTXExNTNKWGlOY1RXdGFHN3VSZzBKcHphY0Mw?=
 =?utf-8?B?aXBKWlBvMjQ4cTEvTGMwSFBTaGRyamx1dXIvRmJjb1JPT04zdGh4dk1oVlpq?=
 =?utf-8?B?WjZWa0NxYUNEcUw4L21HUGZhRWlVZ3hpTlBPbzRCVVpBUS82MVYvUW82UldQ?=
 =?utf-8?B?OUQwc2RkcXRSeWZOMkgzRElyOENuRGNzSHY5YnMxV3FSRWlxS0pMRm4zTjFq?=
 =?utf-8?B?WldIM1UvMC95UWJYUW41bzVxVk1LTjR2TEh4NERrcm9SUmRnSmtEQk9COVI5?=
 =?utf-8?B?UUQyTGJUMTIxU2ZxemQwSFZmaFVlM1BCWGlHaEhuOEZRbHF1WHhNRjRmcGs3?=
 =?utf-8?B?R0dvT0pUbXI4Z2s4K3NENVJqMkZKUHFrZDYvZXEyRUZwc2Z5QnBjbGZncjha?=
 =?utf-8?B?YUpmdS8wakNFZ1RPVnFYMElHTWtCaWN4SlMrb3oyV1ZsOWhaTm02TG56STZF?=
 =?utf-8?B?M0FGeFJSeHJ5UWtEKzFQZEdtTFpTU21JNDBXQUIxWTk4WHFRNXRtU0pIbEZz?=
 =?utf-8?B?MXZxY01uTmRtRVFKVW9taG9oMCtMeEgveUVTdEh5SEFuakl4djk1M1dSR3Q4?=
 =?utf-8?B?cTlEVmdzZXNpZjV0aGxCRDBlRUZCN3VyZUtUNGF4N0s2azFIQVduVzNNR2Vr?=
 =?utf-8?B?RGlsaWtpWkp0QlNza0hiejZFMmJPMEQ1dVFwamczazhIOVhWZmsyUDhlMHZv?=
 =?utf-8?B?dTN4OERKZ01UM3VKcEN5RGZ2ZlcvUjNqU0hZdFdWbkc2MTNNZkhUUDJDZHVC?=
 =?utf-8?B?MExXSGdSTWd0Nmg5N0x2cjhnYk9kcHY1UzE0eC9oSWdidmhTcVNndXV6QytH?=
 =?utf-8?B?eTBlR3Z5SkRzWGZ5UUtJOXY5R0JUREJmNzV0dzdEQUpDMjhxcHFVSGg4WWNL?=
 =?utf-8?B?WnU5Q0ZqcDd5bGxWY1NUTVp1aUhJQ2MvVHB4RVoxRGVDdzBmRythMmFoak05?=
 =?utf-8?B?UnVTM3NRNEZDV3JoV013ODdqZEtVbXJDdU96N1NuNXV3NzR6RWFWcjhhdjZo?=
 =?utf-8?B?ZFZSS0lPT2ZpbEVhOHZxU0dDazlCY0lOamhJL0JFdFJoMXE1VFdtTno2S1pY?=
 =?utf-8?B?ZlEwRGh1bzZ4aHlWeWxhVnRjamd6dnFWdGVXZkhSdWVqUUZIb0g3eXVkclJv?=
 =?utf-8?B?WUhvWVh6S2NrbFdCdSsxWmVLTDgrTnh0SUZYdUN5MVJrY2hybzhRS09rbjRr?=
 =?utf-8?B?UkxwOHl6TW9IcWREaFM0KzJtNlVDZW8zY3BSUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(42112799006)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUhSeXF2anZDVDB1VkVuRTZNeHBLQlErak9zZm9UWE9QejgxVjVPaGlzbTkw?=
 =?utf-8?B?aDlPTDRJOGdpQ0VCaE0wMkhsK1g3K3VJRmtuUERtSkN4c2Y0K3FGc2dweEZW?=
 =?utf-8?B?Nk1SRzZxempMNDNGbXIybG15MWtQRFZkOG9lQXVRVjdQano3UktFRlNUZjFG?=
 =?utf-8?B?Tlg4T3BQUEJ1VmJ2eWM3Z25GMmhnTUtycWlUcmFnZ3hvdnVPQjlHdUJMYXlI?=
 =?utf-8?B?M1dLOWJNTVhkNm5LMWJ5citsQ1hBbWQzSU1sV3dOR1NCRVMwTXN1dVoyTlYw?=
 =?utf-8?B?RENaR3FBcjZkNkw1ZXJMV3hFVmJzbTFUcDNDWWZaZEdxYUNpSHZrdmNSZkph?=
 =?utf-8?B?SmhhdHphUHQxOEFlOS9Lazg1S0swZnBZVjhGUVU4dzlGeDFRODZlWVNvSkVi?=
 =?utf-8?B?MEtWMnVUbzllZlZQNjRJbitsTWVVcnQ3ZkRmRVJEZEJ2RTFON09HU1dyVTRp?=
 =?utf-8?B?YlVIaDhRRXQzOWtGTjNaWk9TK1ZLRllBZFdYMk16M09ERWxKbTBaV1pTbFZo?=
 =?utf-8?B?ZXpYekVUazVvb1k5THlLWFhkbXFWQU9ReG9oMVZEL0xpVGtKU3ZKWUNFQ0Nj?=
 =?utf-8?B?M3Rrenhyak9UUDRLQlJTbVZhRThEK21QbUFVaW1mRk14eS9ZSGROS2M0TEl4?=
 =?utf-8?B?TnVxdE1GNUVKNjJJbnJ1b0gzZWRONVdiNWFVZ0FlYmQ1dFIrb2ZWdW1SeDFQ?=
 =?utf-8?B?azdaOW1CbFF1Qms2T2pzM0szbnhTZVpGeW03ZXVOait1MDRqUDNNR3NzN0tQ?=
 =?utf-8?B?VjFlNHJQaGd4T0VMeTdqY210Y1RDOGdLYmZMd0hzTjFrd2lPZjJ3eGxwSVJk?=
 =?utf-8?B?WXU1YmtwbFZtOURicmxyVitPdERVVVBSNDZPdGFlVGxKTFdBcVFkS01TOXlG?=
 =?utf-8?B?K2hQV0ovVTVYK09yNDlycVhsaUNQRGNwY29jZklJUmZGYW1ROXQ4V1krMFI0?=
 =?utf-8?B?MHAvbVhRLytLaUVWRjkvSE82cGxPRHViZkllRENkOHZ2czdBTzd4SW5ORXJz?=
 =?utf-8?B?ZjRkY2VSZmxrcjdzeE1SV2VmQU85ZnlKSzl2SU5NaWZoeC8wTm1uMEhydTZy?=
 =?utf-8?B?dHR5QVlsUHRNMEhKQWY1VzJiK29WVEZhSjV0a1k1RWVyYWlxQnFWMm5saklU?=
 =?utf-8?B?RWhUSmZwc0VtTTQ4VFdYZ1lndlVXNzIwa0luNWpWS3RqQnc0d2FXZ0FyRVZL?=
 =?utf-8?B?cmR0a3VDWDFYRVJQODFEYTUyRVBsYktxNUdqY2Z1T0QrMGtZRWhyRloyZDl1?=
 =?utf-8?B?eGlCZ1pXWEl6dmZ5Ukd3MXZrMmNBbHZLK1FWVFh4UDFpVWQ3YmFJbjd6aGcy?=
 =?utf-8?B?SWROQm1HbTdNcDR4eXh5UkgvaWlaUm1KWkNTR0N1dXBPb05JNXNVdkJjeEVR?=
 =?utf-8?B?K0lMcGhka2lNYzlLNmxINzBjTWhTdG9EMXJERzZ2ZExydXRmZ2RYUHNIeEZ5?=
 =?utf-8?B?bHF2eG5XNEY1elJhai9ValhET2FxRlQ1Wmxqb2lyRzFKQzkrWDdIRExHcVNt?=
 =?utf-8?B?UC9VdC9adFhhRHBoT2M1Y2k5ajMyNk9VQUk3cmlBdWo4NStmTE5JQjA0TURt?=
 =?utf-8?B?WDNacFp1YnplVytsUXB2YjEwZ2JkL0VFU3BkYW1WL3oxSmxnK1FISjJZTEZF?=
 =?utf-8?B?RzNicnFPS1Y5NW82dTBpQzRmeXhWdVlsTU9LVFFPM25hUXFKdVlrSlg4bUlk?=
 =?utf-8?B?RDVvbUlMUXgvKzZyQkRMZUlVTlgxWGQ2bEVKcmwwQ20vRXdvT09pcjl1S1BK?=
 =?utf-8?B?SzNKUHhsT2l4bkpkSHRiRXNoaGxWMndtYzU2b2diak9Xd212VjlXUE9zRjND?=
 =?utf-8?B?RFVzL09VaTJhVktvSER0SWFjWC8rN1VPRCtlQjh4bUhiMGJPZzFIMFJ6ZTk4?=
 =?utf-8?B?NkJNcEFFazFiWnpYU1BDWFF3ZUZscjVNaEFRRk00aGxZc2d2cERWVFBjRnox?=
 =?utf-8?B?YzlFSTdNK0c2THdJSHZZc2ZwYjUzVGtKQmNWUUdxejllVEhqNHp2MHVvQkVY?=
 =?utf-8?B?dExBbnNPblNXRUlCZEFBZUFJeDd3Y2hXMUpaNkovOU1HZG9ISkREUVJ2WmFT?=
 =?utf-8?B?aVhjSEhHbnExcWI0a21QZTQwcUtPYllaNnZGT2VMMjNzQzVYSHd3VzBKU3Bw?=
 =?utf-8?Q?eSM/+ZVGkWM9ZEPep2nlTST1K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1E37A1EDA4D7648A4ECEB41E3149D00@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72b94a9-8b44-4b57-afe7-08de3d5436b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 10:08:23.7225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /82TW3Mg0F3do5slO86C4MrcZ7rz2C/7q/7CCD8DxEle2mX3E2Cf5wzYk5D0q4+lZ8g/J4uQTJGUz65+JG9LVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF499066549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_020840_201478_08107390 
X-CRM114-Status: GOOD (  20.21  )
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDE2OjU1ICswODAwLCBMaWFua3VuIFlhbmcgd3JvdGU6DQo+
IEJlY2F1c2UgZWRwIGRvZXNuJ3QgZXhwZWN0IGFueSAodW4pcGx1ZyBldmVudHMgZHVyaW5nIHJ1
bnRpbWUgYW5kDQo+IGl0cyBwcm9jZXNzIGRpZmZlcnMgZnJvbSBEUC4gVGhlcmVmb3JlLCBpdCBp
cyBuZWNlc3NhcnkgdG8gaXNvbGF0ZQ0KPiB0aGUgcGFyc2luZyBjYXBhYmlsaXR5LCBwYW5lbCBw
b3dlciwgdHJhaW5pbmcgc3RhdGUgYW5kIGVuYWJsZSBzdGF0ZS4NCj4gDQo+IEFuZCBEUCByZWxh
dGVkIGJlaGF2aW9ycyBhcmUgYWRqdXN0ZWQgdG8gZXhlY3V0ZSBpbiB0aGUgc2Vjb25kIGhhbGYN
Cj4gb2YgdGhlIGludGVycnVwdC4NCj4gRm9yIERQIGRldGFpbHMsIHNlZSBkcm0vbWVkaWF0ZWs6
IEFkanVzdCBiYW5kd2lkdGggbGltaXQgZm9yIERQDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaWFu
a3VuIFlhbmcgPGxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcC5jIHwgMzcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBpbmRleCAwYmEyYzIwODgxMWMu
LmVmZDRjNDU5ODVjYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBAQCAt
MjE4Nyw3ICsyMTg3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZWRpZCAqbXRrX2RwX2Vk
aWRfcmVhZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgCSAqIFBhcnNlIGNhcGFiaWxp
dHkgaGVyZSB0byBsZXQgYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyBhbmQNCj4gIAkgKiBtb2Rl
X3ZhbGlkIHVzZSB0aGUgY2FwYWJpbGl0eSB0byBjYWxjdWxhdGUgc2luayBiaXRyYXRlcy4NCj4g
IAkgKi8NCj4gLQlpZiAobXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcyhtdGtfZHApKSB7DQo+ICsJ
aWYgKG10a19kcC0+YnJpZGdlLnR5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCAmJg0KPiAr
CSAgICBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCkpIHsNCg0KVGhpcyBpcyBub3Qg
cmVsYXRlZCB0byBkcCB0cmFpbmluZy4NCklmIGRwIGRvZXMgbm90IG5lZWQgdG8gcGFyc2UgZWRp
ZCwgZGVzY3JpYmUgV0hZIGFuZCBkbyBub3QgbWl4IGVkaWQgbW9kaWZpY2F0aW9uIHdpdGggZHAg
dHJhaW5pbmcgbW9kaWZpY2F0aW9uLg0KDQo+ICAJCWRybV9lcnIobXRrX2RwLT5kcm1fZGV2LCAi
Q2FuJ3QgcGFyc2UgY2FwYWJpbGl0aWVzXG4iKTsNCj4gIAkJZHJtX2VkaWRfZnJlZShkcm1fZWRp
ZCk7DQo+ICAJCWRybV9lZGlkID0gTlVMTDsNCj4gQEAgLTIzODUsMTMgKzIzODYsMTUgQEAgc3Rh
dGljIHZvaWQgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsDQo+ICAJCXJldHVybjsNCj4gIAl9DQo+ICANCj4gLQltdGtfZHBfYXV4X3BhbmVsX3Bv
d2Vyb24obXRrX2RwLCB0cnVlKTsNCj4gKwlpZiAobXRrX2RwLT5kYXRhLT5icmlkZ2VfdHlwZSA9
PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ICsJCW10a19kcF9hdXhfcGFuZWxfcG93ZXJv
bihtdGtfZHAsIHRydWUpOw0KPiAgDQo+IC0JLyogVHJhaW5pbmcgKi8NCj4gLQlyZXQgPSBtdGtf
ZHBfdHJhaW5pbmcobXRrX2RwKTsNCj4gLQlpZiAocmV0KSB7DQo+IC0JCWRybV9lcnIobXRrX2Rw
LT5kcm1fZGV2LCAiVHJhaW5pbmcgZmFpbGVkLCAlZFxuIiwgcmV0KTsNCj4gLQkJZ290byBwb3dl
cl9vZmZfYXV4Ow0KPiArCQkvKiBUcmFpbmluZyAqLw0KPiArCQlyZXQgPSBtdGtfZHBfdHJhaW5p
bmcobXRrX2RwKTsNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJZHJtX2VycihtdGtfZHAtPmRybV9k
ZXYsICJUcmFpbmluZyBmYWlsZWQsICVkXG4iLCByZXQpOw0KPiArCQkJZ290byBwb3dlcl9vZmZf
YXV4Ow0KPiArCQl9DQoNCk1lcmdlIHRoaXMgdG8gcHJldmlvdXMgcGF0Y2guDQoNCj4gIAl9DQo+
ICANCj4gIAlyZXQgPSBtdGtfZHBfdmlkZW9fY29uZmlnKG10a19kcCk7DQo+IEBAIC0yNDExLDcg
KzI0MTQsOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gIAkJICAgICAgIHNpemVvZihtdGtfZHAtPmluZm8uYXVk
aW9fY3VyX2NmZykpOw0KPiAgCX0NCj4gIA0KPiAtCW10a19kcC0+ZW5hYmxlZCA9IHRydWU7DQo+
ICsJaWYgKG10a19kcC0+ZGF0YS0+YnJpZGdlX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VE
UCkNCj4gKwkJbXRrX2RwLT5lbmFibGVkID0gdHJ1ZTsNCg0KTWVyZ2UgdGhpcyB0byBwcmV2aW91
cyBwYXRjaC4NCg0KPiArDQo+ICAJbXRrX2RwX3VwZGF0ZV9wbHVnZ2VkX3N0YXR1cyhtdGtfZHAp
Ow0KPiAgDQo+ICAJcmV0dXJuOw0KPiBAQCAtMjQyNiwyMSArMjQzMSwxNSBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHBfYnJpZGdlX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
DQo+ICB7DQo+ICAJc3RydWN0IG10a19kcCAqbXRrX2RwID0gbXRrX2RwX2Zyb21fYnJpZGdlKGJy
aWRnZSk7DQo+ICANCj4gLQltdGtfZHAtPmVuYWJsZWQgPSBmYWxzZTsNCj4gKwlpZiAobXRrX2Rw
LT5kYXRhLT5icmlkZ2VfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ICsJCW10
a19kcC0+ZW5hYmxlZCA9IGZhbHNlOw0KDQpNZXJnZSB0aGlzIHRvIHByZXZpb3VzIHBhdGNoLg0K
DQo+ICsJCW10a19kcF9hdXhfcGFuZWxfcG93ZXJvbihtdGtfZHAsIGZhbHNlKTsNCg0KWW91IGNo
YW5nZSB0aGUgY29kZSBmbG93IG9mIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFAuDQpJIHRoaW5rIHlv
dSBzaG91bGQgbm90IGNoYW5nZSB0aGlzLg0KDQo+ICsJfQ0KPiArDQo+ICAJbXRrX2RwX3VwZGF0
ZV9wbHVnZ2VkX3N0YXR1cyhtdGtfZHApOw0KPiAgCW10a19kcF92aWRlb19lbmFibGUobXRrX2Rw
LCBmYWxzZSk7DQo+ICAJbXRrX2RwX2F1ZGlvX211dGUobXRrX2RwLCB0cnVlKTsNCj4gIA0KPiAt
CWlmIChtdGtfZHAtPnRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikgew0KPiAtCQlkcm1fZHBf
ZHBjZF93cml0ZWIoJm10a19kcC0+YXV4LCBEUF9TRVRfUE9XRVIsIERQX1NFVF9QT1dFUl9EMyk7
DQo+IC0JCXVzbGVlcF9yYW5nZSgyMDAwLCAzMDAwKTsNCg0KRm9yIERSTV9NT0RFX0NPTk5FQ1RP
Ul9EUCwgeW91IHJlbW92ZSB0aGlzIHVzbGVlcC4gVGhpcyBtYXkgY2F1c2Ugc2lkZSBlZmZlY3Qu
DQpEb2Vzbid0IGl0Pw0KDQo+IC0JfQ0KPiAtDQo+IC0JLyogcG93ZXIgb2ZmIGF1eCAqLw0KPiAt
CW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsIE1US19EUF9UT1BfUFdSX1NUQVRFLA0KPiAtCQkJ
ICAgRFBfUFdSX1NUQVRFX0JBTkRHQVBfVFBMTCwNCj4gLQkJCSAgIERQX1BXUl9TVEFURV9NQVNL
KTsNCg0KaWYgKG10a19kcC0+ZGF0YS0+YnJpZGdlX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9S
X2VEUCkgew0KCS8qIHBvd2VyIG9mZiBhdXggKi8NCgltdGtfZHBfdXBkYXRlX2JpdHMobXRrX2Rw
LCBNVEtfRFBfVE9QX1BXUl9TVEFURSwNCgkJCSAgIERQX1BXUl9TVEFURV9CQU5ER0FQX1RQTEws
DQoJCQkgICBEUF9QV1JfU1RBVEVfTUFTSyk7DQp9DQoNClJlZ2FyZHMsDQpDSw0KDQo+IC0NCj4g
IAkvKiBTRFAgcGF0aCByZXNldCBzdyovDQo+ICAJbXRrX2RwX3NkcF9wYXRoX3Jlc2V0KG10a19k
cCk7DQo+ICANCg0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AE3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=; b=rUtn66fxjzhOmkd1+gt0/wI+/J
	lIR1bxWH4uWx3faM43dJwMlxN++u5e7nNiQ3x61v3jZgllJsP5Y8VCZ6VgZ3SxjBejzskNrBJRG14
	tz8/osM5iz9c74WJHdJUbIp3GFPktuTIr2kka7oo6a8VWmYyejpBbn2R2pAvxFpsOI7eWDa5CoShr
	5RfFmqWH2LpCLgAw9yDm98HyO2akRH/+0bMTx6k7uGgh6i5NsfX5KGUdXSo6KcCPgzuc5u1fLY93J
	4j5mZ6QI/psV6d5NVH8QNgG/AlhF0MbFrD71MV7JvkrBQqueqYDyRbA99UKO8p0H+9UQUBxLSNGXS
	J57WJNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timS6-0000000DUvx-0nse;
	Fri, 14 Feb 2025 03:33:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timQe-0000000DUnX-2OUu;
	Fri, 14 Feb 2025 03:31:49 +0000
X-UUID: 332aea48ea8411ef82ff63e91e7eb18c-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=;
	b=DPo/S0k3xmTP+TFKsPoLptWGkirHHWS9AjrADuDqXtKJM7bWvphabQ8Tch6IfltU8gswnwt+FBYGURnB2CrsHDL4C/PEa9RbcPCAqZlE/VG8izLPBqU/51libtbp73xUG9Rdw15TOZGvF4fJvlWjAnj5nnPxmyZ54cmGyeVTPGY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1b2f2a6f-96d9-4a63-929a-cf4ad866b5ec,IP:0,U
	RL:0,TC:0,Content:9,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:9
X-CID-META: VersionHash:60aa074,CLOUDID:7b445a8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 332aea48ea8411ef82ff63e91e7eb18c-20250213
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2099038146; Thu, 13 Feb 2025 20:31:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 11:31:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 11:31:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkAXnE+MKmj5GUygoIB6WAAzcILunUaIX5DxRScGebaXIAN2+AvahmlfUEZC1iCrXnrIs2qlQOpudMwkxJHnoeSlQ7CH7Rhf0XIRhW3nljTi1HTBRJBFKmRl151cFT3UAP2RqzeVHVQFXzW+CrTt1EcGIMeAbXIvtV0/Qcvz0g2bNfQe+I0K05Lqg8gweIENRYpA+ec9SYpXhNBGTkkDdO/o0e7dRdBZWoNrxfMYRoHknKNZsYlJk4t+uh+NtEvk1p1LyHtQPTXFJcFNfMG6GW0Hn3VxnCmFKEIdO8dnLdq4xzIP/DpDGEP7Orrpyquc0MsabefUhUjce2DJTB5Nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=;
 b=fU5uZ2hfH8eRvdt5EKQWVmHqU1ygJtBMRhsf+qil9D9FyB/nvXH9A+KcxBGuSV/diq1ipxVK2GhFnRfLpvfh8NjAPsLAB9ivPL0CjIH4qRBpgcopPaqXH0n1QzLAUFoVxldIavEUflngiPM8w6LJURWKAwX6OVzBUXKzWXG4x+oK/SKa8U9JgdoDFoBC8zgj/aIQt2t1Qdu8xBlB6SfczEIPXyWDE7kdxIJL7Sx1rrIydAxzE2VQ7881XrnKJkWFZcBFcoYor57Ydu78QbVQ4TID0rAW/RKwYnqg1f4f02o1YjApTpCg5xbC/YOlprRIJxKFTRBYZ1/4FePEQI5cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=;
 b=hWMZdIdhEAOpPqdd5QvN3C/WlV5DA4QaN0glIw5/MdnzHAzgaKWAF65ThuiK2CbcSLGy4k8NQCNyA21qGdI5aphOhKjzE5hvIuWFEa/fWptvZDvZ2/yIkR7wUGgCRYaBBGaAK4hKPbigYVJrwCUwC9qd4e9a2DQQZMKxafLTkZA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6643.apcprd03.prod.outlook.com (2603:1096:101:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 03:31:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 03:31:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Topic: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Index: AQHbfHkaiMYyujEbyE64CpDuL6FtRrNGDR4AgAAb0IA=
Date: Fri, 14 Feb 2025 03:31:31 +0000
Message-ID: <8a6031f901df5139f88fa70e7ecae5be4f66a58d.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
	 <20250211113409.1517534-10-angelogioacchino.delregno@collabora.com>
	 <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
In-Reply-To: <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6643:EE_
x-ms-office365-filtering-correlation-id: 3ed1cb4a-5820-48b7-ffd4-08dd4ca81354
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTB6NDdlQzhYUjVVQjBjYXdoYmYzalNYQmhodHE0TWd4NDdJVWZQRkgvYy9k?=
 =?utf-8?B?cG5tbkRlbmVPMEdESkdyN1F5U2o2RzlYdHVZZmtBa2wxSGxUejYrZUZEWVJW?=
 =?utf-8?B?a0o3Q2dYZkQrQjBaMDluVHRiNm03UDJXU09XWjM0WER5VlFBV1Y0Nk5GMDA4?=
 =?utf-8?B?aG0vZncvYjZtNkp6MEMybnJOQ01ueEl3ZHNBc1JLRUlaUzJtWHRkcVh1WEdx?=
 =?utf-8?B?NldodjBVZXFKYkIxN3VJbEl2elNGQ05XcUQveCt4MmdMZnhYWkdaOGVXbjN1?=
 =?utf-8?B?WkFnYzY0SU1DaW9aNkpTZlFuT1NUby96dTd1SHJqSEs3N2xVQ0FYenZtWGQ0?=
 =?utf-8?B?WlF6eVdMeVp5TFdubjZwTU1CMk9UOEo3bzVQUFZONENPVnFoYzFLbSs5aE9F?=
 =?utf-8?B?dkVRSHBTUXdZQ2ZpdG5JVStUVWNwQWw0cW1xbWJtSHVzV3YrSEIzUGdVem0v?=
 =?utf-8?B?aXNUdGlUV2Fvblo2VVRmQXNQS1Z1TjgwUkczR290TWVrUDNvVUVOQzRLVTZq?=
 =?utf-8?B?a05sYTBtekRDbmI5Z1pNaWNGZGJuR3h0cWU3RDE2VWVhbWVQcjBzZ0x0Mlln?=
 =?utf-8?B?aXFQR0RjcjFVbFUxWEtFSEQwcjlFQmtPTVplUWFkYURVSlMzSzNEWGFZR3Jk?=
 =?utf-8?B?elZaSDk0VzVreDFON25EQmtJNFlTUTZpdGF6cUNMRWNnWVNqYUIyWUxVN1F6?=
 =?utf-8?B?bDVlZEc1alAxbnMrYmFaZCtqdTJJQi90WXQxSlYyaEdYUy9pOEtRS2RWSmF6?=
 =?utf-8?B?ZC9lcFVFYXJLUDJHTldJVnY1QnNyTTVJQnpkTUlCREJ2WEFPRjhZTEEydWV3?=
 =?utf-8?B?QUZDNDFGQkR5dkllbnUraGNXTm9kYkVXT3MwcHRuTnV0S0VkNEh1WTkwMEw2?=
 =?utf-8?B?bG9kc2Q2YnZYRXlGV29LUFBMb0szR3RLODNFZEg2dTNhVHd5TDFpNG9oK3Qr?=
 =?utf-8?B?aENwWWVUVDk2QnhNa0x1Zy8yZ25KLy9ic1h5MllneVk0Z3ZmclRPMHdqNkNW?=
 =?utf-8?B?QmJETjZvMElRQThoVThlVTRxTUZ0NzNmRDVWSDJ5Zmw2ci9OUkpYUTdXc3Bu?=
 =?utf-8?B?cFlZSFd1MWRRblI5VGhQT282MUg3R1ZuWmhvbnovSWQzeUttNkt3RXl5VEhu?=
 =?utf-8?B?cXFHOFEzZlFUYWZRWCtpbU9qUHZod0hFKzV0V2x0b3p4OXJ5QXRsN282NTY2?=
 =?utf-8?B?a1F3ZnR6WXhZSVpIbHlLdDRSNFBkaUpVUTJUNDhMVlhxWmdBZ0NzS21LblJW?=
 =?utf-8?B?bXJzTkZkU3R5WnlldGR5UEVBVWloK1doaGx2VmcyaTF0U0NVaGw1ZHYrejFi?=
 =?utf-8?B?UDJLWVNjbnV5em0zNDBvN0UwS0R0dW1OSTJLTjNNWVZPU3g0V3FNM0UxUGIr?=
 =?utf-8?B?aEpyV0dYbDZYVkpLMytrWWhpNGNTVm5landDdE9XNTdTeVU1OFB4Q0lTMU9j?=
 =?utf-8?B?V0lMd2N3N0NvdEFjUm1UU1orRXZMM2kwRTVpTm1KQjVjdmd0QUsxeE51WStq?=
 =?utf-8?B?YkhML3AvcS80emtyb2FYVzc4Nmg5N2p2MDlYWHBhTnpHeUgxRFowQ0locm1t?=
 =?utf-8?B?dDRRUGhNdlVQVitHbVZsVExiNkk2ODFsYy9ZODRNVDczaStUUmNLZHd5VGRP?=
 =?utf-8?B?M0xYbVVoekpWb1grM1NZbmczWmhQclkyZlIxdExxL0hJeEhoeEJKNUFxYVNz?=
 =?utf-8?B?SkhVcjF4MXBFRzBvVmswSHF5dklobHdtRXoyMFVPOE5ISEpRWE5vT2lhOHZh?=
 =?utf-8?B?MGMrTm53WnVzSkV0ZlVxMkJycko3bFI4aFphQVJrLzgyUHRGWlJiL1ozbUhV?=
 =?utf-8?B?S3lLeURNRmM5dG9OUXA4Q2Mrd0JNN2FVODZWYWVFQWc1UStZNEQ5cC96ZFVS?=
 =?utf-8?B?bFp0aGlWMThvL3o3d1p5UG9oSnRHR1dMcVdmcEhlRW9CbnVUbFdMbmN2akR2?=
 =?utf-8?Q?APP1qyyKTMPvCDf2TS2f+AxlSazSGDEi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0dua1Izd1RnaStxRmo3OEFaZjFpU0RSL281eVh3ajI4R0ZadkQvYVJ3b1c5?=
 =?utf-8?B?d0VrakRVRjNXVXF2UU01c1NFRkpwYXdzUGVZK1B5NDdqSDhJOHNycmd6Rm9H?=
 =?utf-8?B?QnA0MUFyMlU2WGJleENCVTFBMHptWGlSZWJrQjY5SXNKWjNzdzBIalNkdEYx?=
 =?utf-8?B?Y3MrRkpMTmZ4LytuV2JqZk5UQVN4WVRYOVF0TGdPaGVZNXU0aEJxNSsrNkRw?=
 =?utf-8?B?WEFBQTZDbHJCMlhUNkxxZEhlUm9qaVJmaG12UzVKaVBwOTZVOEdLUlJRSmpj?=
 =?utf-8?B?UU9PaEdZNmFEaFNJV3ZQOUdDenBVdlovOUpqeWt0MkViQWsrTkFCL0dlWkdK?=
 =?utf-8?B?eDJqTHNHeDZ2N0lid2ZTZ1Y0L0pVRStaVWxIUGo2WG5GNGwweTVLaXU5WlR2?=
 =?utf-8?B?NEs4bExFaWk3UWZBZ3kvV1Z0VjFKT3FRazRPZ3dNQ3pmL2lSTTdSTzY3NXpo?=
 =?utf-8?B?ZjdJRndDUm9QdTBFa0dsU3JXTkExM0F2cHFDcGZIWStYL3ZGRVRnS3VUWm80?=
 =?utf-8?B?cGliN0I1MmZoa3ZRWDFDRTNDS21BalBvK0hwUzFHZmRWVzZDeU9iMysxQ2NP?=
 =?utf-8?B?bVJmcy95NnNLOUd6dGRFZFEvNHd3a1lKV1o0VC9Kb21pcWhaMmI2VHJUMS9O?=
 =?utf-8?B?WHUrb0Rmd0loaS9CNEZweEQ2RVN5U0dHSG5Sd2sybXI1SlFmVnhMT2pQNWs0?=
 =?utf-8?B?WCtTT2dYcTROeTMzT2JsdnBWbmd6YzdmU0tBZ2R4LzdvY1htS3JNYnFobGwy?=
 =?utf-8?B?YXg5N1lIOFd3bzZqZUZXakp3TFVQTGY3RkJxUVhxL25uMU1GQkNZSmNBSU90?=
 =?utf-8?B?cEtCWHpZOHhXUFBoVU4vM2NiUUhEN1F6ekJmRHo3TGNIVUNlNUl2K0tZQmo0?=
 =?utf-8?B?NFlUR0ZpWFdqbXBSaUpQRklMa2ZTNEJPSXp1OWFZVGFZZHpMVHJuMlR6LzNU?=
 =?utf-8?B?WVNJRzh0Rkc0aXF3bktBdVZhN0lzd2hxbnNSTGgzbkNESkg0Vk83SzdPNk9O?=
 =?utf-8?B?R1kvN2IrT21SN04xcitQZXZyc3BLRkthS2xSdVprcmZ1T2FjT3RYb01GWUZF?=
 =?utf-8?B?eUkxeTFkVGJtbWVhdzdvWWNQcmdpbkwzckQrQkZJWVFDK2xuTmlzaU5MU3Iz?=
 =?utf-8?B?OEVXUUhKRlU2TVJzMmhiRmFwWXc1blJEN24wVElFMEJLTmhGc25Nam9ra1JW?=
 =?utf-8?B?Q24rOFpMTXh5cTRhb1Nua1JzWWtsMktUZ1V3VXFwd0JEY250czF5bHRvaHJS?=
 =?utf-8?B?aURCSysya2FBWVA4amNFWlhQMWxQQzlwN3ZQNnNiRGRrTVA3eGptaGVrYmVD?=
 =?utf-8?B?NnhER1R3YWNPRjN2bFhSUWZKZ016LzVOUW0rL2pRQzFTL0ZvWjNWajQvYTJZ?=
 =?utf-8?B?VGlNQXdkeDI3aHQ5WHVFek5WM0JaYUlISjdUUlcwNHVHamxOa3pnU0ZnMGl5?=
 =?utf-8?B?WmVZZCtoWDZiKzgxUnFNT2J0MjNKZnBPM3NMM3BWZzBLZ0UyNXRlY3R3Z0Vu?=
 =?utf-8?B?enh3Tm1wbzZGaGx4VXROTGhRdWcvdHFtYU1qOWlSUlRMV2d3UVhPS01GZ2Qv?=
 =?utf-8?B?YmszeTB0OGVQZTNtWnZJN29OalV3YXdGS0hFNm9FRGlBcmlSWVZTaCtDTUtn?=
 =?utf-8?B?R1BkVFFQc05tQ2Qvdk1zRG5MVyt3NExYQzN3Z2ZpeTN2bUhXT2tjcHR0dFFV?=
 =?utf-8?B?czZYUEZoUFNvRmRWaUdUM25TeXBFWG9TRTA2VlB5Qk9QeUNuMVBYbzQ4eWJr?=
 =?utf-8?B?SjFjRkh1bEs2dWlRNWx4WEp6T1BhcFFYRitkdENaclBpVy83Um4wbHowYXVm?=
 =?utf-8?B?dXgvM09vZi9SeXJBckRmTVhqMHg1WS9aYi9wUk5jVHd4emFET0hWQ2hjWHlV?=
 =?utf-8?B?dGl0K04rRzYyTmNyWStiaHRMNUMrQ2FPM3I3QTJwMjRoSmtSMDRVL01kOTc2?=
 =?utf-8?B?THV1N09ZNE1SSWdZU2ROaDhVNUZIczMrSGxvRUJyS0xYc0hBNjN5QW1nN1Bj?=
 =?utf-8?B?Z2pqcWs5M2x4OWNQeHErMGJnb2d4NFc0dlRzQVhPdWdISkVPSTkyQ3pOaGIv?=
 =?utf-8?B?S1pYUDVuWkdXYUtaVjZ1MElOanZxUVVmOHcyZHRhdWtNL3IwOGQxczcrck5C?=
 =?utf-8?Q?1AVdVvShULg5AvoZSsGnG6d3Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45AA431953D4E34A9EEA0FD52928D253@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed1cb4a-5820-48b7-ffd4-08dd4ca81354
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 03:31:31.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGeCkE+D9PphoRBG+P3/yluGriILKeZbfD7Bul5PbY9ubPe8Eoeqd2dJB7r2eyupqCliK68Lb605GJpNEFO0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_193148_618149_03F2023B 
X-CRM114-Status: GOOD (  18.36  )
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

T24gRnJpLCAyMDI1LTAyLTE0IGF0IDA5OjUxICswODAwLCBDSyBIdSB3cm90ZToNCj4gT24gVHVl
LCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3
cm90ZToNCj4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiA+IA0KPiA+IA0KPiA+IEluIHByZXBhcmF0aW9uIGZvciBhZGRpbmcgc3Vw
cG9ydCBmb3IgTVQ4MTk1J3MgSERNSSByZXNlcnZlZA0KPiA+IERQSSwgYWRkIGNhbGxzIHRvIGNs
a19wcmVwYXJlX2VuYWJsZSgpIC8gY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkNCj4gPiBmb3IgdGhl
IFRWRCBjbG9jazogaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBhZm9yZW1lbnRpb25lZA0K
PiA+IGNsb2NrIGlzIG5vdCAoYW5kIGNhbm5vdCBiZSkgcGFyZW50ZWQgdG8gbmVpdGhlciBwaXhl
bCBvciBlbmdpbmUNCj4gPiBjbG9ja3MgaGVuY2UgaXQgd29uJ3QgZ2V0IGVuYWJsZWQgYXV0b21h
dGljYWxseSBieSB0aGUgY2xvY2sNCj4gPiBmcmFtZXdvcmsuDQo+ID4gDQo+ID4gUGxlYXNlIG5v
dGUgdGhhdCBvbiBhbGwgb2YgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgTWVkaWFUZWsNCj4gPiBw
bGF0Zm9ybXMsIHRoZSBUVkQgY2xvY2sgaXMgYWx3YXlzIGEgcGFyZW50IG9mIGVpdGhlciBwaXhl
bCBvcg0KPiA+IGVuZ2luZSBjbG9ja3MsIGFuZCB0aGlzIG1lYW5zIHRoYXQgdGhlIGNvbW1vbiBj
bG9jayBmcmFtZXdvcmsNCj4gPiBpcyBhbHJlYWR5IGVuYWJsaW5nIHRoaXMgY2xvY2sgYmVmb3Jl
IHRoZSBjaGlsZHJlbi4NCj4gPiBPbiBzdWNoIHBsYXRmb3JtcywgdGhpcyBjb21taXQgd2lsbCBv
bmx5IGluY3JlYXNlIHRoZSByZWZjb3VudA0KPiA+IG9mIHRoZSBUVkQgY2xvY2sgd2l0aG91dCBh
bnkgZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KT25lIHF1ZXN0aW9uOg0KTVQ4MTk1IERQSSBjbG9jayBpcyBmcm9tIEhE
TUksIHdoeSBuZWVkIHRvIGNvbnRvbCBUVkQgY2xvY2s/DQpJdCBzZWVtcyB0aGlzIHBhdGNoIGlz
IHJlZHVuZGFudC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyB8IDkgKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gPiBpbmRleCA1YzE1
Yzg5MzU5MTYuLjY3NTA0ZWI4NzRkMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiA+IEBAIC01MDEsNiArNTAxLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9wb3dl
cl9vZmYoc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiANCj4gPiAgICAgICAgIG10a19kcGlfZGlz
YWJsZShkcGkpOw0KPiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+cGl4ZWxf
Y2xrKTsNCj4gPiArICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPnR2ZF9jbGspOw0K
PiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Nsayk7DQo+ID4g
IH0NCj4gPiANCj4gPiBAQCAtNTE3LDYgKzUxOCwxMiBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93
ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcnJf
cmVmY291bnQ7DQo+ID4gICAgICAgICB9DQo+ID4gDQo+ID4gKyAgICAgICByZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoZHBpLT50dmRfY2xrKTsNCj4gPiArICAgICAgIGlmIChyZXQpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycihkcGktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgdHZkIHBs
bDogJWRcbiIsIHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2VuZ2luZTsNCj4g
PiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
ZHBpLT5waXhlbF9jbGspOw0KPiA+ICAgICAgICAgaWYgKHJldCkgew0KPiA+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBjbG9jazogJWRc
biIsIHJldCk7DQo+ID4gQEAgLTUyNiw2ICs1MzMsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93
ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+IA0K
PiA+ICBlcnJfcGl4ZWw6DQo+ID4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT50
dmRfY2xrKTsNCj4gPiArZXJyX2VuZ2luZToNCj4gPiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShkcGktPmVuZ2luZV9jbGspOw0KPiA+ICBlcnJfcmVmY291bnQ6DQo+ID4gICAgICAgICBk
cGktPnJlZmNvdW50LS07DQo+ID4gLS0NCj4gPiAyLjQ4LjENCj4gPiANCj4gDQoNCg==


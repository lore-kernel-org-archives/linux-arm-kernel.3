Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90663CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 04:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPiE7W6xYpGgpB/BeP/9uxFiMSclDoqzvRP9PMf+6bA=; b=Y9O4KS1BKCCq37OzadwnLwujva
	Yag5mhpM1bDtpzu75/g4HnNjAyEMYxIqDrj8mgAIboNU6XOV9zjHD9O+8HcCxeRx6GKttMoG2PgGm
	FKRhw2zFICj7J0s8yQND9nPmpxfX1UoBMt/zy/jPi87sUL9ey37+TwKnhQqF31l3HTr+gzK1GXgZW
	4Ux18RVBW9TmEPkNSE+eND1Mg/wQ5q9GtvK3fAYRc6OImoktMm5j3SArW/cvApm1m3uabI2lBBAol
	YMaR1erWsVnXKobFFG4uF9aQnvoYxnISNbU5EDM/a9i64aeT96LBrMqNfXmD7/NUdnixDxRc4wfcG
	7B4Vp1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Bs1-00000006Z7a-0uB1;
	Sun, 21 Sep 2025 04:40:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Bry-00000006Z6B-1aqF;
	Sun, 21 Sep 2025 04:40:15 +0000
X-UUID: 0cf4b6d896a511f09f706fa2197c6ceb-20250920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mPiE7W6xYpGgpB/BeP/9uxFiMSclDoqzvRP9PMf+6bA=;
	b=eHnySmoWHrr0afXnbghIYWz9Dd7kS0FzaAR8RArONHDyeyYGIBTlppgu/THoQNI+whJa6ySQ/GnfvnEJCE9UuplMmj1cP030m4SKRHpgstH5I77FrCN9UzQnGeR5dx4PKeJhjPQjJHRAebhtGjdW/zgTwfGgZkAOZNbCDimn3CE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:279c21f0-c6a1-4a9c-be12-c7e9b5cc8cf1,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:1ca6b93,CLOUDID:7a5bc66c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|11|97|83|106|80|1,File:nil,RT:n
	il,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
	,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0cf4b6d896a511f09f706fa2197c6ceb-20250920
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1577223644; Sat, 20 Sep 2025 21:40:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 21 Sep 2025 12:39:50 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Sun, 21 Sep 2025 12:40:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diMh48o25fI7TMmvYqAhmxFyOMn2gWsVY1qKhKhMxH3rUk7IjIfJqkDRArQ8OEmU9DWFsTNeBmb1uUScapt6pTWZqxMozGR6R+EhInwVA3XDXGm+QtkhITnaUmp/01dLNl0a8fQc5wtNe/HuLExrklZ/VgqS3zjTLTNyK8W5dtnbOhHe+Fsdk8wnzFmFSvfBVmUcBQbwh3zLbI3vJkEmFCUCB3YbrKoYo45BLqO8dlQVDgvL8AY4YUdiDTm6CPVUtJxM6zES3mswX80nkp/w4pSg8THr8yVNm4LkMDZrbYOSW9cZ7w0ArtL1UJkF7L40XLlJ0wl5DRzknzYRaGc6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPiE7W6xYpGgpB/BeP/9uxFiMSclDoqzvRP9PMf+6bA=;
 b=xMbFI/+6WHl8VHza8txA7Xa+hysOJuhQeXedbefIwsVWSCoConUgTlmgd60Bf81mwqU9YdgXqDlD7zodHUuK04+F5O6YzlcL187AeVBNh0XcgyorfH/1t8qSPsJCSWecrppqpHeqo8KPQ2B1YW1zvhCsvlBAM+YwmCh1VfXU5/EIrBuOo2t1DPXq7n7BudUUq82FFnmSB/D3FcmRMAGiczsqyQGr7VH/EDwC+7qpL7LzIkKFGF6z37wt//J1Ul+/hNkrFgi4W9iwRs8XwbvtNovOpSEue9MBT2Y6szLPYKz7KTb4GvS6v/YEwfLSh+9pwwhE5vARNyTkXs9KmDJEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPiE7W6xYpGgpB/BeP/9uxFiMSclDoqzvRP9PMf+6bA=;
 b=jrr+1HD7UtUnunwRmP/wtViugS/c6GxePeD7hPwUbaVt7GsZGdnckE15Slw1ZxVbvRNNXMuubo9tykqSPpvL7BuNr/TYh1b88st5jrtiZb+oanueIEkTxZCA0Zla7ew7s0Jxqkdm5o7ag6EgAKQNNg32VsFJcBTiUTSk1zhCe1c=
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com (2603:1096:400:459::6)
 by PS1PPF26E989C4E.apcprd03.prod.outlook.com (2603:1096:308::2cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Sun, 21 Sep
 2025 04:39:58 +0000
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939]) by TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939%7]) with mapi id 15.20.9137.017; Sun, 21 Sep 2025
 04:39:57 +0000
From: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Topic: [PATCH v3 4/6] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Index: AQHcCGQJHNY8RxD/PE6gfhyY1U2wH7RdGPIAgEA51QA=
Date: Sun, 21 Sep 2025 04:39:57 +0000
Message-ID: <ee7b16097fbc7c5cc6b8c3163447d48ead0d44f5.camel@mediatek.com>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
	 <20250808125512.9788-5-jay.liu@mediatek.com>
	 <20250811-boisterous-skinny-ammonite-a4ca7b@kuoka>
In-Reply-To: <20250811-boisterous-skinny-ammonite-a4ca7b@kuoka>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8136:EE_|PS1PPF26E989C4E:EE_
x-ms-office365-filtering-correlation-id: 9ccb786a-c985-4995-a51a-08ddf8c8eb19
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MW1MMHJYb2F3YXVJTjhEU1VDNVVvTUZnbXUxcll2WExCN09sKzlPVTVjL29w?=
 =?utf-8?B?SFJ4cXN5bkFhcG5ScDVkK0RxL0tYS2FFQldNRW8wdHg2RGV0bWhBa0l5L1RK?=
 =?utf-8?B?K0h5V2ROdHY0djA4UEdIR1VmYlZEejlBWTE0UnRvYUhPTmZiLzY0djFnZUJT?=
 =?utf-8?B?M3FWL0gzSkl6eHh1NVRwQWkxRXY0Q2p6YXRoUGF3Mk9GTVdUM0VUNTlVc29t?=
 =?utf-8?B?SmREM0lrYXpZSWpWZWU4N0VhNThKNVUvT3J1cVFJbUp6WFJiZUJ1UjRLWTk2?=
 =?utf-8?B?NWVadWo2cG94QWtnb0F2WVBOVU0rWktVcDhwOFJ2K0s1d1ZOTVR2UUdianhi?=
 =?utf-8?B?TTlmV21wcWpidGt2bmN1TDI2OHBlTCtpeXU1R1F3WHhOWmVMcUhOWjB4bENV?=
 =?utf-8?B?SktKK1N1bDFUb0ViclNneEZqeWpJUmI4UFY3aDdTWWVoRDJHMVhaYm9Sd1Vr?=
 =?utf-8?B?WGk0T1Y4Q0ZCRFhOd3djdHNSbm1zckJCSTlkOFM4bmZuZ0NYRG9CVjhobHlX?=
 =?utf-8?B?KzBxalhaRjBSeXYvVHpsc1luUEpmY1RGYTZlV1RPS2NBNnhHTS9haFVHMEZJ?=
 =?utf-8?B?dThPYXF5cWplTTd6a0MyWWVxaTVWVm1rcTN4MlBLM29DWXRXS1p3aEZyazlZ?=
 =?utf-8?B?WVZDTmFCRzdzSTgzTWtwT3pTZHFxMDJobHZQVzllaHJPRXc3a2FQeWZla1hu?=
 =?utf-8?B?cDdKV0V2UzdTeFpRRGpUYURxQVB1UEYwNUU2R1YrclBIK09CMGdPanRlL3NB?=
 =?utf-8?B?a25pTzF1bHAwRDd4dkNUQ1Z5MEdkbkdCeFJSaFIxZ0Z4RjhyTk56TlRIWHdS?=
 =?utf-8?B?R2RiRVN3dmJGUWEraUgyK3c3WVczRHBId09XTFBkaGtCWTA1U2RuZ0tTYnhZ?=
 =?utf-8?B?a0lyMDFrdjMyWCsxYVlkT05uTnBWKzNJbHZndDBCc01JeFVNK0tFSGtiTVFO?=
 =?utf-8?B?cWMxWnVVSVJMTGZTWXIzUFVPZ3EwLy9MK0gwMkpYUHR0QjRDek1vYVVFbEN6?=
 =?utf-8?B?NlROcE5wL2VPRkdnZGVuMjNTWWovVU91YlhmN1ZCTXRHbC93RngweDE3UHVj?=
 =?utf-8?B?b2tLbEpPQmlSL2JvK25jUlkyTGJraWQxVjMwbUVVWGhUZkcyQXgrZWxid0FE?=
 =?utf-8?B?dlNHQkR5My9JNXhNcCtlK2lnaWphUnpzMTMrRW1XdXdXalpRQWNzdWh5L3JE?=
 =?utf-8?B?WnhZNGdFRXdrOHFTaityWno1M3ZsWngycTNiQXlsVWp4RGlHNkh5VFNvR3Za?=
 =?utf-8?B?blhaNkgvNGIreXNUcnRKSGFIckw1dG1rTU54YVo1azN6NnVHRFV0MEdtRDEv?=
 =?utf-8?B?d2tzdk81bmtTTDc3UzJHVHh5VDVCeEIrcUNNM0hqdk9QQTJCK25tSUVKeW9B?=
 =?utf-8?B?Smt5MFMxeU5mdXIzbXY5L2Q0TDM3QkVyZGJzM0k0QXRRaUNZK0xPb2g2ZVdx?=
 =?utf-8?B?OXVNRHNCNmVlZldBRkYySXlGbmphUXhiejc3TlBsRWhIdERoYVZ1VDB4UGRu?=
 =?utf-8?B?WVNjcTNFSW15b2xpVTMyS1VqVUVYRVVJVlBDeXBlaVp5V1A5am5nN1ZCMlhn?=
 =?utf-8?B?ekIxQm0vcUhpOVQ2TUdKWjloMUlOdnhzWXQ2Sm9aeVFZZ0F5L1h1L1F3bGo5?=
 =?utf-8?B?RU5ab1VuZGlrQXdVejY0TUJJOXBHVUQ5dk1KbDczaFVRZlRUc3lzN2IwczY1?=
 =?utf-8?B?SXRjQkY1SVQybVB1amZSWHFhcmF5ZlV5K1hGTmpZQ3pTTk5vM2ZyTmM4Q1hQ?=
 =?utf-8?B?dTd6SHJUaXJDdzhYQ2gwQnI0YnhWVXRwcVF6OG5ZQW9zeUYvRk8rbWNodmth?=
 =?utf-8?B?Nmd3RGJCT2VreWt6UEc2a3NvV1BMV1NjR0pMbWFlck40NGZKSHdER2JVN0Ev?=
 =?utf-8?B?azlyeE1QaUoyVW1VN2gyU2h4UXNiY0N1MXlxUFJEVVNSL043Wjd6ZkdYWFpU?=
 =?utf-8?Q?KpSg9ddc7hM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8136.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEdtdzlsVGxBTU5YS0NwMmFBVUpQSFcvU1FycURrTzR5VzdjMHNFNXBsMUkv?=
 =?utf-8?B?dDFVRWRFNFc5WVNBbTFWVTVrd0llb2drWE1ubGxvQytDaUFuMFVQS1dnNzVj?=
 =?utf-8?B?a1IrbEJsVFQ1Z0lRNThBdjZnVEF6RlN4a25MckJZRm9pNVA0MjZxZzRTd0cy?=
 =?utf-8?B?Z211dHo5aGlrVVdvOXRzUnBuVFF0VGFYcFhzT292ZFRGdmRQK1I4WXFXT3or?=
 =?utf-8?B?QzFzY3Y5NkJZUGRMUGhpREZIM3hlMzFyZzV5SHVOMDU1Yk1vWEJFZkJ0VnI1?=
 =?utf-8?B?SlBxcXYwMUxneDBHU2FMY1BsZlFteTFDVWwydENWUytWS2NFYnEzYWtzSFF2?=
 =?utf-8?B?YndCc0RJR3pkeG4vRm8yZ2NVQlFtWUJERmZZWUU2aGd1UTdsTjVGS2xheGdu?=
 =?utf-8?B?OHFyVXpHb2JYcGI2dEwrNU9zOCtFa0RDWkdiU1E3S3FCOVlWL3JiZnkxN1VO?=
 =?utf-8?B?Y3pzaXd5UlVwZk0ybkxzOW85Q2dZZ0c4UEIzWlp4a2kvYW4vcFlnZXdlSUYx?=
 =?utf-8?B?RXBYNkhNWmFURHpKcHZQblc5TldER3J1ejAvOWlvM0d3Y01zbzhVSzVuSlFB?=
 =?utf-8?B?VG9xZElGb1BxcExUVTNpMXN5Q2JUVkVmV1plejVCZWdyUnpMMWgzUkwrM1JH?=
 =?utf-8?B?TVA0NnlzQkIxaGhHSHNxNUFQUlB5dXNuMlo5QjBQNzVFZXh4UlV4YUt6eXFU?=
 =?utf-8?B?Z2wwMmVkL3U3czlRZGpva2FaaGVlWStPU1BVSXZzR25qakUvbXJ5Y1V6MVNG?=
 =?utf-8?B?NlFDVGFwdFN3REJVcDF6SWZUZitYQ09aZkJldmxZUUhhZ3MwNkhmYUkyZHR1?=
 =?utf-8?B?L29KejdXQzd6RVhIZ0tmNytKVlQ3TXovRHlFaU1QdjBDK0RTaTVGMzNkUG11?=
 =?utf-8?B?c0FqQnlKU2pnZ2NZeDJkTE5FUS90L3dVVkRocEdJWGhXOFhvTWFmd3lrMW5t?=
 =?utf-8?B?UStzN1NObzYyY0VQL0tRYUtFbDE5T2JORkVMTXd4aHhYS2FuRnFCelRKMG10?=
 =?utf-8?B?MVdFTlg4ZHowcFNrT1pVc1AxWjdOR3RvQzR4eEwyNlpML3NBNWtDaXI3WGZu?=
 =?utf-8?B?allXNTJxTEEwU1l6ZFdOcVQ4M2FsUEVuTXliR0grbmx4SEtIS1kvSGV0emtM?=
 =?utf-8?B?b1VjVHdCYkxYRkE2Ky9Xa0hkdkxiaVRSN1h2NWdUc3VLcnhTNDFDd2NKZHVE?=
 =?utf-8?B?U202UHRkMU8wVUpPSHdIeXdPSlZZM01YTUswYjhuR0hOdmxNYlh3ckY0eTEw?=
 =?utf-8?B?dlczcVpNK0pPZmQ2M1ViQ1hyai9NYUtpM0lvRExxMlRXM1VmUkFLakpjMjV6?=
 =?utf-8?B?ZUZpd3daOFpYMWEzZ3ZKVFp1cjk3RDR3VjZOclJuVVY3L2xkbkIrR0xPN253?=
 =?utf-8?B?U3llcFE5ZHhvWkVxZnhqN0MyU1RUZkhMQnlXaWFmb1ZLTFpJRjZSSVlsSFFI?=
 =?utf-8?B?U0M2bW5HRVRBZHJwUHVDMFcyaVVyZFhTMWxobUhTYzErU3A4b1ZnZEw4SnR5?=
 =?utf-8?B?UGhEU2F2aUR2dG5vbmpibWpNbzVhSzltWFNnR3dzOU9ZYTluRTMyWFpyMUp5?=
 =?utf-8?B?RUZFM0VPTVg3Z1o1VldrVEhISTl5MTltakNmTXplRmUvOS9FV3lEQzFKblgz?=
 =?utf-8?B?eWgzeVRqbnpVSDZQeGI4ZGNPaDFpZ1NwSFUzdHMvdHg4Y1kwTFRzcHloRC9U?=
 =?utf-8?B?bGMveWFCMWxkMHVMY0YxVHVCYlhvcGR0SjEwU2dKS1FWSkYwbjVBL2VDdnlk?=
 =?utf-8?B?WXpQQlJhOWNDOWpGb2FTa0I2QzV0ZXM5andrNXRuNlBxL2dFKytIRHFBOXlJ?=
 =?utf-8?B?ZE04cTJhWEN2WHpxejdrVU1DZ3NVUkNVbVZMYWF4d2hmZ0pUT2h5NlhqeVlO?=
 =?utf-8?B?cWhsajhkV0NGVmd5VmFGalloekY3L1FZVnVWM1ZOMVk0eDBOZmIxRmZ5WUdu?=
 =?utf-8?B?OGRVTTZ3SkZ2MXg3a2t6b2NkSXFrZ3hDSVVMOVJGaUlyY0xGQ2Q2NmNBblZw?=
 =?utf-8?B?cGovbmlXMCtkeU1oU1J1THZVdWE2UnhQU0pXZUZvNWdBTHVXUnR2VnZsNXJu?=
 =?utf-8?B?T0l6TGxUZThzenYyQ2k4aFk2ZnlCNStFWmpyTGFtdXF2T1lVTlFYY1hpOUhv?=
 =?utf-8?Q?4jUa667FSMkG9OoQnVvJx+uni?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D91DFFAEAE300469A93375377E95AD1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8136.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccb786a-c985-4995-a51a-08ddf8c8eb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2025 04:39:57.7370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBuRZpKc+cJdiyEuIKwmXf4yxKN+x2vfICiZ2ZkUiYQE1FStpL2ZnM701fSi9eZMI/iEGhmtFpsIokx+VYCZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF26E989C4E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_214014_446710_C560C08B 
X-CRM114-Status: GOOD (  19.19  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDA5OjUyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgQXVnIDA4LCAyMDI1IGF0IDA4OjUzOjU5UE0g
KzA4MDAsIEpheSBMaXUgd3JvdGU6DQo+ID4gQWRkIGRpc3AtdGRzaHAgaGFyZHdhcmUgZGVzY3Jp
cHRpb24gZm9yIE1lZGlhVGVrIE1UODE5NiBTb0MNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YXkgTGl1IDxqYXkubGl1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sIHwgNTINCj4gPiArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AtDQo+ID4gdGRzaHAueWFtbA0KPiANCj4gV2UgZXhw
ZWN0IGZpbGVuYW1lIGJhc2VkIG9uIGNvbXBhdGlibGVzIChzZWUgd3JpdGluZyBiaW5kaW5ncyku
DQo+IA0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AtDQo+ID4gdGRzaHAueWFt
bA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZGlzcC0NCj4gPiB0ZHNocC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjk0YWEzM2EyYTVlZA0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AtDQo+ID4gdGRzaHAueWFtbA0KPiA+IEBAIC0wLDAg
KzEsNTIgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiANCj4g
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLXRkc2hwLnlhbWwqX187SXchIUNUUk5L
QTl3TWcwQVJidyFpUW1fMUh6eWZUX25TYUstS05iWEJ5TG1XNWRYeXRoUUNQRUp6Vy1faWJYaUxK
eU9LencwOE1nUXVpNEdLUm1KM1FqSElqMHpsMXgxJA0KPiA+ICskc2NoZW1hOiANCj4gPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFpUW1fMUh6eWZUX25TYUstS05iWEJ5
TG1XNWRYeXRoUUNQRUp6Vy1faWJYaUxKeU9LencwOE1nUXVpNEdLUm1KM1FqSElzbWY0dXJ2JA0K
PiA+ICsNCj4gPiArdGl0bGU6IE1lZGlhVGVrIGRpc3BsYXkgMkQgc2hhcnBuZXNzIHByb2Nlc3Nv
cg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gPiArICAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIE1lZGlhVGVr
IGRpc3BsYXkgMkQgc2hhcnBuZXNzIHByb2Nlc3NvciwgbmFtZWx5IFREU0hQLCBwcm92aWRlcw0K
PiA+IGENCj4gPiArICBvcGVyYXRpb24gdXNlZCB0byBhZGp1c3Qgc2hhcnBuZXNzIGluIGRpc3Bs
YXkgc3lzdGVtLg0KPiA+ICsgIFREU0hQIGRldmljZSBub2RlIG11c3QgYmUgc2libGluZ3MgdG8g
dGhlIGNlbnRyYWwgTU1TWVNfQ09ORklHDQo+ID4gbm9kZS4NCj4gDQo+IEhlaD8gV2h5IHdvdWxk
IHRoaXMgaGF2ZSB0byBiZSBhIHNpYmxpbmc/IFRoaXMgaXMgcmVhbGx5IG9kZCwgYmVjYXVzZQ0K
PiB5b3UgY2FubnRvIGFjdHVhbGx5IHJlbHkgb24gdGhhdC4NCj4gDQpoaSBLcnp5c3p0b2YsDQpk
aXNwLXRkc2hwIGlzIG9uZSBvZiBjb21wb25lbnRzIG9mIGRpc3BsYXkgcGlwZWxpbmUuIGp1c3Qg
bGlrZSBPVkwsDQpjb2xvciwgZXRjLiBNTVNZU19DT05GSUcgY29udHJvbHMgdGhlIGNsb2NrIG9m
IGRpc3BsYXkgcGlwZWxpbmUsDQoNCj4gWW91IGp1c3QgYWRkZWQgdW52ZXJpZmlhYmxlIHVudXN1
YWwgQUJJIHdpdGggbm8gZXhwbGFuYXRpb24uDQo+IA0KPiANCj4gPiArICBGb3IgYSBkZXNjcmlw
dGlvbiBvZiB0aGUgTU1TWVNfQ09ORklHIGJpbmRpbmcsIHNlZQ0KPiA+ICsgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWENCj4g
PiBtbA0KPiA+ICsgIGZvciBkZXRhaWxzLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiAr
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+IA0KPiBEcm9wLCBqdXN0IGVudW0uDQo+
IA0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1k
aXNwLXRkc2hwDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4g
Kw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICtyZXF1
aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tz
DQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4
YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsNCj4gDQo+IERyb3AgYmxhbmsgbGluZQ0KPiANCj4g
PiArICAgIHNvYyB7DQo+ID4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAg
ICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gDQo+IG1lc3NlZCBpbmRlbnRhdGlvbg0KPiANCj4gPiAr
DQo+ID4gKyAgICAgIGRpc3AtdGRzaHBAMzIxZTAwMDAgew0KPiANCj4gTm9kZSBuYW1lcyBzaG91
bGQgYmUgZ2VuZXJpYy4gU2VlIGFsc28gYW4gZXhwbGFuYXRpb24gYW5kIGxpc3Qgb2YNCj4gZXhh
bXBsZXMgKG5vdCBleGhhdXN0aXZlKSBpbiBEVCBzcGVjaWZpY2F0aW9uOg0KPiANCmh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFk
dGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2aWNldHJlZS1iYXNpY3MuaHRtbCpnZW5l
cmljLW5hbWVzLXJlY29tbWVuZGF0aW9uX187SXchIUNUUk5LQTl3TWcwQVJidyFpUW1fMUh6eWZU
X25TYUstS05iWEJ5TG1XNWRYeXRoUUNQRUp6Vy1faWJYaUxKeU9LencwOE1nUXVpNEdLUm1KM1Fq
SElqUU9JVVdDJA0KPiANCj4gZS5nLiBpbWFnZS1wcm9jZXNzb3INCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQo+IA0K


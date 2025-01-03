Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB0DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 03:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x6xzyieq7CKgKAMo8Man33L7SdunG8rMpiAnrCfu+s=; b=W+h1W3VlDRJE5MV1wkSwFWf2Ke
	sQLxJNlhXtJ32j36bIhzlAB1DxVdmVU2e9MSJy6tgZzO1E4ctys3Pq97CPEy1r8EeeOqCSAU3hIgG
	tfDHAd/TEcns2pNV9R9jEL6fgrS3gvx/i8ZUj+4iSwd2isBuaKYNHIuVuITzxaoB+JcUnNU484VxT
	S2+RnzjrS2qYvTY1Ihka6yZIrrc2+PiK1SBHj39RxsbuAIqx/dN3fMg9I2HEDQT5rFbEnZjxJzIG3
	ptup69nCPJkAPri2TXvwC/Gukb7hRuzrUr361NaxClRPhYCE2o/ONPcZKcnuQ8527FtHdB0EqCyW6
	EaX5mlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXyd-0000000Bybx-0Fzv;
	Fri, 03 Jan 2025 03:03:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXxR-0000000ByQj-1DZJ;
	Fri, 03 Jan 2025 03:02:42 +0000
X-UUID: 2e9f16d2c97f11ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3x6xzyieq7CKgKAMo8Man33L7SdunG8rMpiAnrCfu+s=;
	b=mzwnaWbsAgzUVhJ6O750Rd9xMs773IS5JTw/5EhbCbZ3QsxFFWjnwnf628aY0r9lJZGgJ7hxhJLqYV9o2Sn9xX6YElhuPkcGVWADc2HXGD9Nv608ve3/1EAOFgYkpf6yzVNkBtKVbc9ucARSO2oCDyLVVwr/DJLy5j3s7X4qFSo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1f1c2f91-b458-413b-aad1-a584b635366b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:04c89525-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2e9f16d2c97f11ef82ff63e91e7eb18c-20250102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755505642; Thu, 02 Jan 2025 20:02:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 11:02:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 11:02:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAKGZhgMpcNCZAVR4zlS3mXMs62qrMFmywie+0XeMzPb5kl15BiBc0QkpjLlWcjR8wFLfjZu7oNSgYe7+WRLB/MFu9eOcoPTAak+hwZoOxT/rDkeU+its2JHJIsLki9D3pwFUafKjdZcLY+p+14ebC1ilJ96Kq1R2GLEFwXMoxaLU+QdNtIVoEx1g8s/w+oDbbAG5OHUp35sFhEleAzzkbiha674Us6uMIXghCwjUZiPfywhcmF94UN/TdW5KCrVKOrfwXkr+v/86HNUtAaMflccp7SjU+jE/Unra3K0DE+442F/lWjPwlGcvgJQYEGtS070QWfjMajR0ZMw4jSA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x6xzyieq7CKgKAMo8Man33L7SdunG8rMpiAnrCfu+s=;
 b=AZr91VIVFMvxMnpcnMhsJ0VnfAMA5yEAVn3YuLhtSUcLe1qiJvQw6pKL64MDJ09hbVOb6UZwfiGwy5aHTfSfWrYfCHdjImSX1RIzaZ5OnPQqJYu7W1wcBD/yoDwSZ2W/wGWqtqGwpM9nKh+kW0aJQVR9tWTg7aGwR3Cg7cZlZkQCdURhOhpPLzvhRiIkLXl8n8h1tMlSdp8qhfF7KWTZEXmz4IjWamMi+0UKzRL0gCZ3H0nl4b4tIVLfcpaGo8++jr/sDlgs3QUVl83cBdVA0tNciBxG4ZQXrxn6dwUDfy1Iir4cPmI62J2oxhXhJmnAeihvEwjlYe6aeEiF3Dhdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x6xzyieq7CKgKAMo8Man33L7SdunG8rMpiAnrCfu+s=;
 b=F64wHLy6C0Rl7HGJlQ3PTeJWN3uecCSGBIMW/KVmUmLeJLOAoCvP2TnUUEJBTUkUccB/bncWBesYy8a+DZ68Dvtth6et7xW9IikuclZgU2kKxuWbxUkx47RUsa24FEVOefJ/lZP0RPNtjDUGFL6TA8si1bsuzZNc7q6n6fM6Bzc=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by SEZPR03MB7589.apcprd03.prod.outlook.com (2603:1096:101:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 03:02:29 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 03:02:29 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"granquet@baylibre.com" <granquet@baylibre.com>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Add return value check when reading
 DPCD
Thread-Topic: [PATCH v3 1/1] drm/mediatek: Add return value check when reading
 DPCD
Thread-Index: AQHbUUEC7A+EcZl0hEOVf8+igNWLgLLtVJUAgBcgv4A=
Date: Fri, 3 Jan 2025 03:02:29 +0000
Message-ID: <d48056062b6ac160fd133b2ff6434c0126515868.camel@mediatek.com>
References: <20241218113448.2992-1-liankun.yang@mediatek.com>
	 <CABnWg9uvQ4_vxYx-_8AKE_CvLgKd04LuvS1qvKwyMHvBck7_cw@mail.gmail.com>
In-Reply-To: <CABnWg9uvQ4_vxYx-_8AKE_CvLgKd04LuvS1qvKwyMHvBck7_cw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|SEZPR03MB7589:EE_
x-ms-office365-filtering-correlation-id: 6def99a6-7518-42fc-6f3c-08dd2ba30f92
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?alVmcW9OLzNjMlBWRVJtalBCOSswNm84cXNhSjdrcFBUTWY3MlBBdTVoUmRZ?=
 =?utf-8?B?Y2trRGVtKzRkVWZUeUVxVytqQUFpR0ZubFNEd1JyMk1FWU9MNlp2UWJxc0Vu?=
 =?utf-8?B?RlFNS0htMm1oTkZHSlpvblFEY3NjQjZla0J6VU5Wc2ZOYkd3ZHV0L0xENEpm?=
 =?utf-8?B?TzVCL1dLMEkyYkJzTjVtS3BSL2NHOVNrOXBFaW9nUzRwd0V3eEpFaFlwMmlF?=
 =?utf-8?B?VDVmUUdtcjlqMTB4enhWYzFDSUhYd3NLcCtNWDcvWmtXSDRNc1g2SWptWTJS?=
 =?utf-8?B?Mk9ZbGZYeDZhK3FRWFlrMXBXQ1U3aXE3aisrN2U1VGFCK29PYTg1dEo2M2Mv?=
 =?utf-8?B?bnVxczRUdmgrZThCMUN5UkNQK012MDlGWTZ3KzRaQWlIcVRQbWZXNVpLTXJ4?=
 =?utf-8?B?NDMwbVhXWHF6QjBxdy96NE1vYjBlYjJsUXFsaUUzZk0yUk5jT2t2SDhoYWRy?=
 =?utf-8?B?aE5kR2R3cnUwMlpyY0tWODV4OHh5ZEtwd3lZZnJXUDNRYU9RdmErbXd4bC95?=
 =?utf-8?B?TXVWT2pMZVhSNXNnY2tZenFhUndzSTh1RU5IQXV0V2hYZU0rTTdmaThyMWVV?=
 =?utf-8?B?YmhOSkNQcXkzak1SYU8yMHpXUU5NNkowSWNEYzAzQnpOUzF4VTNxdUJYWUx4?=
 =?utf-8?B?QXFzbkV3Z2FvWEhxaVVOM21HYnYzU3hrTk1UckVPRG53d3RWSWExSzBzRVlV?=
 =?utf-8?B?RmZsekRBVzgvUCtkUmlUSlQ4cUNENHZiS1puVkJNTTMrZTZ6bk1JN0dEbGhm?=
 =?utf-8?B?cGxMNDYwcVlJc3pzUExNMjdCNkp1SXVwQUFPWmVGR1pVYkFaNUZuV0dzaUFB?=
 =?utf-8?B?bUlCZENyYTU1YTBrYmR6YUl2eXRvVG9iVWc3OVlaaVNnb1dQNU5qSTRWK29X?=
 =?utf-8?B?NzhaS0FkZXcwQUZuaWQvNlp6WVFPRExWY3lIVXNqNlNCR3NLWHFqbmR1SGwx?=
 =?utf-8?B?Zm5VcERCV09QMlVTK0RqVHBkNklaamxvQUsrbkhLWFlobEtQeFlSMC9ZTXRO?=
 =?utf-8?B?OE80TEdXTDI0Q0lXU0hJdWRueGFjV0pyKzEvV285azNVbkp1b2d2cStCU1l6?=
 =?utf-8?B?QTdEV0VDaFhHUy9uL005RVlFMmdJSE1EMExncEM4RHI2clpjWElXR2FNODA5?=
 =?utf-8?B?dDYxR0FtV2NHRVRKQ1FNcWFvQ0tFMnJGOFBFRkZlR21xL0U0UmVUSDREc28w?=
 =?utf-8?B?NldaSGVKdUhseVBiNnc5OVpnckx1ZTIwOElCWDFITTBpc1VjZEdKSUJHRi9l?=
 =?utf-8?B?NGh1NWFCeDM4Q3dtMGZ5RVVWQm1zMTVrcVRjeFd4OC82NURoT2lWcUxLWkJ5?=
 =?utf-8?B?VllraDhtekgya3ZjSk85aGMzeDZvMHp4bEp6S1Y5bXpVSURodkxRaEVkMk1Y?=
 =?utf-8?B?UTUvSVBJb1dWREhQbTRGTTBsaW54bVBVcU1lS0FOZzVrZHc4V25mZjZyQVpt?=
 =?utf-8?B?cFhWeXJVZDFERjdDRXVBZUVWMVJLR21BdXJ4MG5iRVhNMUFLR2huRDZpZTVP?=
 =?utf-8?B?eWVjZEpGaFprVXpucUszVUd5YTE1MFJiZmRVSWNJR1lXUnNtZGF2ZHRUM0lD?=
 =?utf-8?B?WFk5ZC9ZSDduRzltTmtiNTBwUXVaSVZXdnlQMXFRQ2dMSms3R0lTU2QyT2Z2?=
 =?utf-8?B?akJXNFlRcG9GMVp0NXVPYnFRRGh3T2EvdElCclorRmozdGRMcWExb3Q3cm9s?=
 =?utf-8?B?eWcvYTNrWlA4Zm03b1FuYlhMVGhkN2tKTXh0R3hRZjlVY2paV0p0eCtYd1FO?=
 =?utf-8?B?d0crUW1XelNxVVF0OWhIZ1N1SnJadm1Bc2p5eFhCUmpTNnZ4TG44QnhQdVhi?=
 =?utf-8?B?TUUwcVJuNjZCaDZoa29aZDV1VUV2VTFYWlVFelh5RVFDaExhZVZFVkIyTDIz?=
 =?utf-8?B?dGtFYVQvYW9qMUpLckN2T1MrdC81cWovWnBLQ3NPK1JYdkxZUzY3a0ZoWmo3?=
 =?utf-8?B?V254bjZJejZ2UEV0RExxUmhrdXhIWW5HaWJ2R3ZJM2lBRDU5R0F6ZWhpY2xa?=
 =?utf-8?B?RnluaVNQM1ZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5760.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFdtWERBdE8xVG13ZFVRay9MQjRSNmVJT3J0ZHBLaG14dStSbE9RMVdCc28w?=
 =?utf-8?B?dDdTdWtDU21kakVvWHdLSUJLdkpySFBxWHpqRHhOdm9HQTYzRmJRVGdUbkxx?=
 =?utf-8?B?V3psTEdVZ2dXWGVBaVA5c3ZHUmlwL2JNMkl6LzJzTGNURkxNbkV6MWFnOGNn?=
 =?utf-8?B?RFB4TXZRRmdQU0VhNG5ncEVDbnF5VmVYaTY5T3hnb040dXZ6T21kYkhpUUFN?=
 =?utf-8?B?SDJ6K3o1UEIxcUlnSmpZV0IzeVZndmxzamZFTU9DY0hOQy95V1k2ODBtenRM?=
 =?utf-8?B?MzJpUWdJd1dLaEVNeXN5dktZV2d6U1VkdTAyYjVNTFI5eGtHeDU4U0E4SERm?=
 =?utf-8?B?eFZZM3RZMVRLWjNIYng5OHpObkh6Nm1OTVUwS1hJYVhuaWFGMWRXUGN2MEVE?=
 =?utf-8?B?eDduOXhSeVBxTnExZXhEN0Vtd2pZZGJVYzVqWGJXL2J2VWczR1puenBTVHJG?=
 =?utf-8?B?UlBOK0dGYzFiN0NxeVVRbERvWTllS0wvakhJMkloYjRodVdWY1o1YklRTjBE?=
 =?utf-8?B?SkROS0tWcjZoY2VRWTlmbWVkNVlNOTlhNWpxNFFuZXR2ejU0UGgwcktTOUV4?=
 =?utf-8?B?ZnVlcHJPZEc3NDJodzdwRUdMMExvQUlkUlpjVHJ5ZXdHblRCQi9YNWtoRXMr?=
 =?utf-8?B?bHJneEhMRUE3TG53NkMyZ1BydllmU2tYSzlGcGY5ZWdZeEpHVitDdnZvNUwy?=
 =?utf-8?B?TDJPTFQxRThZZEdGd3c5bjZQVkFMb2laSVhIN3BzMjE2WHhoSHVhTk40VlB4?=
 =?utf-8?B?WTVHRkNGeFBqcjBxMnNBQmxGZDlDWmlmMU1rMkU5R0xYMWVzVjVQQmJVYVdD?=
 =?utf-8?B?RWo2aUpIY2hXaUJFbng0K29NYmNjRnVFNVFQVDIrcUhsZmVVMUFYZVJjVGkx?=
 =?utf-8?B?c2J0MXozWllIYlhqU0lsWTI0M3R6VGNtcjkxVHR5dGNNMytrdXIycTM0SS8z?=
 =?utf-8?B?RFgwajlkTFg2TUZUb1NONlpKVDRoQzBraDh0a09WUlFpQ3JOVkxCZ0ZMWll4?=
 =?utf-8?B?WkRJMUVZL0k3dlFTSStzZ0RMM1dkNDZmcnBndG5YdjFESS9hRFFVYzcvUnl3?=
 =?utf-8?B?UTVkYi9PK0E4NzJ3N3BVOSt3U3lFQmRLOHJBZ1ZINmNMa0RLV0tVYXBkc05q?=
 =?utf-8?B?TGJuRDdlck5CeDNONGQwb2ZJTFd5RDg3N0NSTlZURHJYa2pzUGRVZzNtZ3VQ?=
 =?utf-8?B?SzNzUVJBQjNhQzVmeTlXOWpLWWx5cUNsQXhPUnBuaDZjSmVJY2pKOEFkTzA0?=
 =?utf-8?B?dmtCYkY4bWdKdWxYVmdacWY4MGp0SU8vYkNEOWtQYXQxcnUzMTlxZkt2TW1R?=
 =?utf-8?B?TG91OUFOUTg5ckFNVWZ5NmlNdkZPb3FJODVPTDhEb1hQYmpPRFBjZllxRGR5?=
 =?utf-8?B?eFgxK0UrVnRwOXIzeit4NzNzRHJIa1NZdFVZR1pJUkQ3cjBmbytwbWJDRnFl?=
 =?utf-8?B?L2VGN2hpSUZVZjFSUFBmQ3pFNU1ka1NBMTkra1gxTkVIWEgwdVE0QlJwSW5M?=
 =?utf-8?B?KzkvSXFOYnh6cGRmMUwyTkx3T3lpR1hHNFp1MTdmcno4enV4UXNkNTV5bGpu?=
 =?utf-8?B?SWN5Vm9DYVdVcnRha291M3NjMkFtQjZ5RTE0Z3hGamtteUE3cUlIekp3ZXpq?=
 =?utf-8?B?bnh1a1gyUHRKMm1zY2RsZFh3ZlYvZDUwRXNPdkREZE1lWVFTRjgrb3BCYXlF?=
 =?utf-8?B?MFV1VTdwOGRQMXBTYTkycG02c0RkSUZKN2l3RUcwNm9sL3luTHY4bEQ2dGcw?=
 =?utf-8?B?VllRTzRWNm1zYkZnTTNnZW1yUmlpN2VtbWhLMERyaitIblIzeWhKZVNSdDND?=
 =?utf-8?B?QWxWdjdreUFid1NSV003eXUrdGpONFR5SFR0VzVTUFBtbVM3blZMYkVDb1Fi?=
 =?utf-8?B?cm5qV056NDF6cEN4ZENzaVpCY1ZJcWgzT0ZobUxUdCtmaC9OZThWdVMxTGpk?=
 =?utf-8?B?NWkrOUFxSnY2SGcybVhjMlVCVUFEbi8vV0NiR0poT3o1bEY1SUNrYndMa01B?=
 =?utf-8?B?OFMzaDl6QzlMQnpiUkJnTzJBMFE2WDdta3p2KzZraStDNE1sSnVac1grTENi?=
 =?utf-8?B?SHV2SmlvSi80T1hKMnZ6enVlUU9LcGlYN3Z5VFVkUVM0WHMyZkw4a3BKWjEx?=
 =?utf-8?B?NlVUZzU2U1Bsd1RabW03aVBWSDVjVUR2OWFoV29RbVU5WVcrMmdCVUR2UVFq?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73E8BA15FB23D8439B20426D256B5611@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6def99a6-7518-42fc-6f3c-08dd2ba30f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 03:02:29.6985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNRWG8kcuI7mwDZLpHPt1TmHdGUSzDpJHB2krOVjjXHByPVM9yuV71l3t+z7rmkVtJRn7IxTftEqVkcLx4j/F7R8Kiy6/WFTMUMmR5fE7lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_190241_346343_90C6DD96 
X-CRM114-Status: GOOD (  19.68  )
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

T24gVGh1LCAyMDI0LTEyLTE5IGF0IDAzOjUxIC0wNjAwLCBHdWlsbGF1bWUgUmFucXVldCB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIDE4IERlYyAyMDI0IDEyOjM0LCBMaWFua3VuIFlh
bmcgPGxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IFJldHVybnMgdGhl
IG51bWJlciBvZiBieXRlcyB0cmFuc2ZlcnJlZCAoMSkgb24gc3VjY2Vzcy4NCj4gDQo+IEhpIExp
YW5rdW4sDQo+IA0KPiBJJ20gbm90IHN1cmUgdGhpcyBzdGF0ZW1lbnQgYWJvdmUgaXMgdHJ1ZSwg
eW91IGFyZSBub3QgcmV0dXJuaW5nIHRoZQ0KPiBudW1iZXIgb2YgdHJhbnNmZXJyZWQgYnl0ZXM/
DQo+IA0KPiANCj4gQXNpZGUgb2YgdGhhdCBsaXR0bGUgbml0cGljaw0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+DQo+IA0KSGkgR3Vp
bGxhdW1lLA0KDQoxLiBEUk1fRFBfUkVBRF9TSU5LX0NPVU5UIG1vZGlmaWNhdGlvbiBpcyB0cnVl
LCByZXR1cm5pbmcgdGhlIGN1cnJlbnQNCm51bWJlciBvZiByZWFsIGNvbm5lY3Rpb24gZGV2aWNl
cy4NCjIuIFNPTUUgRE9OR0xFUyBTdGlsbCBTb3VyY2UgSFBEIFdoZW4gdGhleSBkbyBub3QgY29u
bmVjdGVkIHRvIGFueSBzaW5rDQpkZXZpY2UuIFRvIGF2b2lkIHRoaXMsIHdlIG5lZWQgdG8gcmVh
ZCB0aGUgc2luayBjb3VudCB0byBtYWtlIGdvb2QgdG8NCnNpbmsgZGV2aWNlcy5UaGVyZWZvcmUs
IHRoZSBjdXJyZW50IGp1ZGdtZW50IG9mIHRoZSBudW1iZXIgb2YgY29ubmVjdGVkDQpkZXZpY2Vz
IGlzIGp1c3QgZW5vdWdoLg0KDQpCZXN0IFJlZ2FyZHMsDQpMaWFua3VuIFlhbmcNCg0KPiA+IENo
ZWNrIHRoZSByZXR1cm4gdmFsdWUgdG8gY29uZmlybSB0aGF0IEFVWCBjb21tdW5pY2F0aW9uIGlz
DQo+ID4gc3VjY2Vzc2Z1bC4NCj4gPiANCj4gPiBGaXhlczogZjcwYWMwOTdhMmNmICgiZHJtL21l
ZGlhdGVrOiBBZGQgTVQ4MTk1IEVtYmVkZGVkIERpc3BsYXlQb3J0DQo+ID4gZHJpdmVyIikNCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFua3VuIFlhbmcgPGxpYW5rdW4ueWFuZ0BtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiBWMzoNCj4gPiAtIFVzaW5nIGRybV9kcF9y
ZWFkX3NpbmtfY291bnQoKSB0byBpbXByb3ZlIHBhdGNoLg0KPiA+IFBlciBzdWdnZXN0aW9uIGZy
b20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0
Y2gvMjAyNDExMjgwMzA5NDAuMjU2NTctMS1saWFua3VuLnlhbmdAbWVkaWF0ZWsuY29tL19fOyEh
Q1RSTktBOXdNZzBBUmJ3IWhCNHF1RG41bUhnUnRCSy1HZjJwbWtNTl80TWJBNjZlZ2doMW84Z2RV
V1A3cEE3MnVQb1psbWJpc1JldHN3d3lZU2VuRzJFcklaSzZvT2FRcWRDeGR4NCQNCj4gPiANCj4g
PiBDaGFuZ2VzIGluIFYyOg0KPiA+IC0gTW9kaWZ5IEZpeGVzIGluIENvbW1pdCBNZXNzYWdlLg0K
PiA+IFBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gPiANCmh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA5MzAwOTIwMDAuNTM4NS0xLWxpYW5rdW4ueWFu
Z0BtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYnchaEI0cXVEbjVtSGdSdEJLLUdmMnBt
a01OXzRNYkE2NmVnZ2gxbzhnZFVXUDdwQTcydVBvWmxtYmlzUmV0c3d3eVlTZW5HMkVySVpLNm9P
YVFXV2FEQ2xnJA0KPiA+IC0tLQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
YyB8IDUgKystLS0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+IGlu
ZGV4IDM2NzEzYzE3NmNmYy4uYjI2ZGFkODc4M2JlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYw0KPiA+IEBAIC0yMTAwLDcgKzIxMDAsNiBAQCBzdGF0aWMgZW51bSBkcm1f
Y29ubmVjdG9yX3N0YXR1cw0KPiA+IG10a19kcF9iZGdfZGV0ZWN0KHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UpDQo+ID4gICAgICAgc3RydWN0IG10a19kcCAqbXRrX2RwID0gbXRrX2RwX2Zyb21f
YnJpZGdlKGJyaWRnZSk7DQo+ID4gICAgICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyByZXQg
PQ0KPiA+IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOw0KPiA+ICAgICAgIGJvb2wgZW5h
YmxlZCA9IG10a19kcC0+ZW5hYmxlZDsNCj4gPiAtICAgICAgdTggc2lua19jb3VudCA9IDA7DQo+
ID4gDQo+ID4gICAgICAgaWYgKCFtdGtfZHAtPnRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikN
Cj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gQEAgLTIxMTUsOCArMjExNCw4IEBA
IHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzDQo+ID4gbXRrX2RwX2JkZ19kZXRlY3Qo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gPiAgICAgICAgKiBmdW5jdGlvbiwgd2UganVz
dCBuZWVkIHRvIGNoZWNrIHRoZSBIUEQgY29ubmVjdGlvbiB0bw0KPiA+IGNoZWNrDQo+ID4gICAg
ICAgICogd2hldGhlciB3ZSBjb25uZWN0IHRvIGEgc2luayBkZXZpY2UuDQo+ID4gICAgICAgICov
DQo+ID4gLSAgICAgIGRybV9kcF9kcGNkX3JlYWRiKCZtdGtfZHAtPmF1eCwgRFBfU0lOS19DT1VO
VCwgJnNpbmtfY291bnQpOw0KPiA+IC0gICAgICBpZiAoRFBfR0VUX1NJTktfQ09VTlQoc2lua19j
b3VudCkpDQo+ID4gKw0KPiA+ICsgICAgICBpZiAoZHJtX2RwX3JlYWRfc2lua19jb3VudCgmbXRr
X2RwLT5hdXgpKQ0KPiA+ICAgICAgICAgICAgICAgcmV0ID0gY29ubmVjdG9yX3N0YXR1c19jb25u
ZWN0ZWQ7DQo+ID4gDQo+ID4gICAgICAgaWYgKCFlbmFibGVkKQ0KPiA+IC0tDQo+ID4gMi40NS4y
DQo=


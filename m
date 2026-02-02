Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA739D172DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBVKpP9yaMSDanDAW68YL/CG++vjQl4UST2qV2Ah4cI=; b=udBjx95c2aF29FLE1Awtw8zARe
	ePcXW4/EDfc4GcWYrGuD2uupK88IazA4Hv04W9Ux0Y8rvAm7Oy+U/p6OzIMsUF95RR8T1nRgaKpzA
	0JwFGV6eWe9RnLUdeWW4MDKGJtnwYzvf1RZ50V5MUF/r2HJGdEr7oTQvviLhEmZYczNAdBksktEaY
	9LlTgAeT68uj5CLw8lddbrDElm1+VpwmU57x5nBeGk+tLSQoHCrZfHNS2Zh88fGeoLr0gtS2nb5XZ
	6Mt+UZyCItrM2bNe2OwIANK1o9Ot6uGGLwbuLrz5bp9xdxxLP+ypZekDczG6xQaDm0G05GUMx5+Nx
	AQjPELog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnO4-00000004VQ9-2UKP;
	Mon, 02 Feb 2026 06:26:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnO1-00000004VPc-1MYC;
	Mon, 02 Feb 2026 06:26:14 +0000
X-UUID: 0f4af824000011f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BBVKpP9yaMSDanDAW68YL/CG++vjQl4UST2qV2Ah4cI=;
	b=S6NeS/IQJKsrP1JtHKmIdT9n0au1H1ECGlKQiqhVWM5oy1xj0t5jJqlYjwzdourCSnQCZ+KzNF0DfDH+UB8hANfBSWn+BKpqPDbGTchA1DO1dbiR6S3mg/onuTNeli29Va3/e7dTvselao2qT/OUu7f4Y3nUA9eUGO/rJdBDeGs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:0d0f94ae-4faf-44f8-a07d-90b9228a834e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:556034e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f4af824000011f1ad39f32c34db0b1c-20260201
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2067639192; Sun, 01 Feb 2026 23:26:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:26:05 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:26:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh6abbdZC92bIHL4juAXTz/Oz+dbkg0HLz8zbUDX7ZloPF23YPiIO6oOmxV6Cy85WwGMh5KQoWr7uo78aFzxcxQKvtLNhSSLpNYxlKdaEdeaeG4AycNlJA4rICzA3OAziPebHKm5GH10MNhxLGaS8O0MrSH7vesa93QA0GB/uFlFCbtQ8HR0tI90hmY1y7ZrsuVFhxpXaewFia0T6pIxr5AjwfKXfE+6OTWUUZRgOIqWOfbth1m0gaeDG1Qow51Pyjifg/hjK0N/4L7jmsvrz06JC9RnmjNwF4Fk8Prv4CufFwAPX4ye7Gid43HhAnAGlGFXf8UVgNUelnW5A81EZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBVKpP9yaMSDanDAW68YL/CG++vjQl4UST2qV2Ah4cI=;
 b=Fx/ARCvEetJFViCDpxh6NxGYiI+phWGJcDMBQtiu+siStqHq6OxRyZJoy0Hk1PZnLanVWYLy6bh1ih5Z1qDXZf1XdTG9lwne7SXEVM+0r56I5eApwh49j8nLbkzYEtve62gk8zOqnn9hPzNWRANBDmRypXmJewXhYDcuH+fI2fxf91jwhjIxXbieQJlwlFuLl3vVvGEy/ZY78f2z9HsObkIt76iqa8VFjiiiLLidyzT7MH4HNpX23qPLns9o4bZmcQp5JwZlFKGIfUQERBkE/bEHHH7yuW1WYip2uFKF4dNvKp9KkOtoT0FxRHAfKoizZxDPa4VPwabut6nrHKjdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBVKpP9yaMSDanDAW68YL/CG++vjQl4UST2qV2Ah4cI=;
 b=iUlKHl5XKXDrAMk/eMlNzmE3E2zYDyKbNTx1SvgnqSv6UsNSMoGVnDQpJ0igeUF5sFYJM8TgxGVCitbv30iSrBTD0/55yiWtOqpAW7Sh4Ce8r9ThqZ+L+yKiwWqw0yrl1NnZJkLvDLcY+nTq/N5bfeoXaom+FtYVflSDPbLbpcY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8781.apcprd03.prod.outlook.com (2603:1096:405:6b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 06:26:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:26:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 1/6] drm/mediatek: plane: Remove extra block from AFBC
 data payload offset
Thread-Topic: [PATCH RFC 1/6] drm/mediatek: plane: Remove extra block from
 AFBC data payload offset
Thread-Index: AQHceZVCuegI+1/bckCVtohCkS5noLVvJm6A
Date: Mon, 2 Feb 2026 06:26:02 +0000
Message-ID: <95aa482f5ee951175ab4a51995da86d49d88c247.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-1-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-1-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8781:EE_
x-ms-office365-filtering-correlation-id: 3d49892c-92bc-4621-2b49-08de6223efe0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MkN2cGRaWVkxTlh1SGlTL0RFNHVHTFFJekV5RVJJRzZzNlBZME82VVdOc1RL?=
 =?utf-8?B?T0VOSlk5YWxSL1VSdkM3VzJHQUo4WUdyK3Zmb1I5VVdOK2ljTnlGSFcvWTcz?=
 =?utf-8?B?dDd0RnBGbVRVSkZpRlJ0L3dhVmNIUnBIYUcxcnJ0YmlscUJ6UG1BZE94aDRT?=
 =?utf-8?B?NEUyUHc4VC92bTBHT2VoTmtaMlJJeG01bldHdm96d24vREpBeHdWTjN1RzNU?=
 =?utf-8?B?RE9QL3lVVTJsRUd0SUFMMWthcnFPbThuUSt0V1NuNzFvUXlDODFpWlhibk9B?=
 =?utf-8?B?NEYycFZsWk1ZWHRSTlE2VFBTcGNRWWVjUGNwU09HeXdZczJnZmdHRmNRUWdC?=
 =?utf-8?B?ZklSdHBVM2QzU0VUOXd2SlM1anpXeHdjaW5zby9Rd3pqUUFGWWRMN1NNdWhs?=
 =?utf-8?B?Y2JQMUZUbzJPU2FxQ0VFK2Z6ZlllUGU4YWtkTEJFRjBmUjlwYTVodTYwaWNw?=
 =?utf-8?B?czVJRHpHWEdMRmNYWWt2b0lNa3ZPUHZrK3pYcFNiVnNuOGNyZWh5UHVhN1ky?=
 =?utf-8?B?UCtxS0trOFRBOEx6TU9pOW1XVzlsZHJ4WFdLV1ovS2wySnVmQkdzUmlyZU1p?=
 =?utf-8?B?S0hVY0JtekVkdUFFZ0xUQmNLMUo3amlYVkR2dEdHVDNmcTJMbGJKdDdteWxz?=
 =?utf-8?B?MHNZMCtwUXprMnl2RXBlbDRvdUFYcjgxUUdhSHFTTXdFbWJyZHg4T0FPZ1Iy?=
 =?utf-8?B?Nk42aTRkN214T0ZVdm1zdENrWjAwUGxYYVY0d0NqQUIzRnIwVytBMWgvU2cx?=
 =?utf-8?B?YUFmblh5SyswZjhaQmVNM3dtYjNSYkRrc2NBT2pSS0dCK2FsUmJQcGNwVWxo?=
 =?utf-8?B?VStmR21KMi9QYklSQzR2dWtic0VnZVI3b2pNZ3dPT3gxQ25oSjh3dkhTdVRH?=
 =?utf-8?B?cVNmNTAzSFZMbzhYYWc0VTQzWVZxMFdxNWg0TDliSytzUkZnalA0V1JlZ2Ny?=
 =?utf-8?B?a0pNMEtHS1ZxeVZOSkFuaHdvUzg5YkpuZDNQV1NpUVhtd1hOeG9pQk81d3h5?=
 =?utf-8?B?WnlzWFVqMlNXTDVLOUZtaDJUa3ZRNHllTnpvVHBmTjdzeVhLZVlZb3VQZ0pv?=
 =?utf-8?B?TGtyelQ4ZU1TMjQwcjlLeXYzMCtETWx6b2tNQXVMOGl4LzI0djRpMWticnRX?=
 =?utf-8?B?K2YraWY3WW1DeEV0WEFSQ3NxOVpBZ1lqQXdlaW5MWmdpMDR6N0JHVlpYckdZ?=
 =?utf-8?B?UW1ta281UUhlZjJRVmhSRkRySGhpMUpBNFM4QXBtdHdNMnZMOWJJMlhQbzlG?=
 =?utf-8?B?V2NtOXN0cUNHVjBqSGU4M1dGV041Zm0rS25DY1doc3hRS3hxZnQyZnlWRnZ5?=
 =?utf-8?B?UVV4K01WTnhubzZxWWlpNlJyNGV3QUV6QnVyQ1FpRVBWT0h2Y0prYTJETS9D?=
 =?utf-8?B?Y0xqNjFDbkRHUXhRbUp5NGh1VjZDK3hyZCtLVm4vSC8xUWdBUVNuZjlsR0pF?=
 =?utf-8?B?RzNrQzNLWmVZNTRKWEVZQ2RHbjRPUXBFZ0tjQUNWODVZeXdGcUlVYzN0Q3VV?=
 =?utf-8?B?RFV1NlVzNXg5NGZTK2xJQmlrMWZFVVNlOG1RdUlzcUlLSUlIUUpYV0I5THlK?=
 =?utf-8?B?VTYwdVVFcFRGaFcrdUN2L3JIZVFjU3FBSzg5NDFCQXdpZnNyQy9ybmMydmpa?=
 =?utf-8?B?MGd3STdkNEkxaWNKT1pKdExhVjBHRE9IZFpDWmZnZjJYdW5sdjREVUk1Y0xP?=
 =?utf-8?B?SG8zYWZTcXRLMVRWUUtIc1BtM1N3VFpQMk9jdUozWDNqV3dzMEVKV2dRVStX?=
 =?utf-8?B?MmZFMnpUbFc5WmI2RzhHNXNUZE5YcGVpQWxFb3lVMlRmQmZxNVVneDM2YUN2?=
 =?utf-8?B?Y1ZWMnB3ZXJvbE1rOVRJbG9YUExKZnpzQkI4VGpsaWh3c2pkRWJlMmFJZjFK?=
 =?utf-8?B?TTE5KytPZkVmSHA1aU9acTZtazllanRzdHc4KzlhcVB4eHZpaDB3bTJ3Y1da?=
 =?utf-8?B?VVZXVVBNeVd0UCs0Z3Fja3E3VS9BZlE1R0JubFhSazhpaTE1WHpYTUI4b1FX?=
 =?utf-8?B?Z2puM0FPZ0VmYU51dXZzR25VVUd6R2s4UWJ2L254ajZacjc1OHVXM3ppdEVS?=
 =?utf-8?B?OEdiNmcrY21LSSsxY1MzNUd6Z1Zia3JGZ29OZjhQNno4eGlvR09UTk5HWkpK?=
 =?utf-8?B?bkU5QTBwU1JBTU5vQ1hXamlOMUVDelJHb1R2NCtBeFpIbCsyWWl2SzhiNnRh?=
 =?utf-8?Q?X0xdAI+CDG1bbhzADzEklA4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUpTaWoyTFVnMXByY1E5UFYvcy9ld0JDREZQYjFyblVuVG9Rc2JYREh0U2Zm?=
 =?utf-8?B?dFFmSGRJVC9HOWRjR3RqWnRRNU5XbUgrem5MNzZmQ2NDZHpGekt5NVBmcGFX?=
 =?utf-8?B?KzFRVkpIWGltaENoSHZPSDlyZnpNRmlXaG15VWZ2aVdpb3FqMGhtNUlKWnFp?=
 =?utf-8?B?Vkk2V0FkRlFEY3czc01kdTZGcjMxeitSSmxsU1hELzZOd056OUthdEp4a25Q?=
 =?utf-8?B?aHNQVUtsMGpNN2RjK2NXYnVScVArYUtQV0NaUlNpczdYc1dSZEhQaE1YdTlW?=
 =?utf-8?B?Rlpya1c0cGZXMXdmVVdNelkySlNMTEFid2pVSmdpODFTU2FlVkpFQUNlakMw?=
 =?utf-8?B?aENOMHdVWU1CbmZSOEdwcjNOazZrM3pDLzRzNmhraUc0Sy8rNTZicjAveSsz?=
 =?utf-8?B?M096c3JIWXJqcFdzSlhqdU5SRWRXU01OQ0lDRkFkMTJCUmsxUm5Oa1lwS3BX?=
 =?utf-8?B?UUJ4aVMzcFA4bzI4TzB5b0Rvb0JMWWRXSE9xcDc5ZjMzd2pmZVNSSVF0TFA2?=
 =?utf-8?B?eEZjOXVDbktTSnZRdzI5WE5jNzNYY2g2MG1TNFJYN0MyUkorTFVLTUtpRlBr?=
 =?utf-8?B?cWtsNEs3K1dzbS9wWHl3cGw1b0FFNS85NFRneGFyVmMyeHNNSFFTdHR0QnhC?=
 =?utf-8?B?Q0VjODFKVEFxZ3J0VWd6aW1QU2ZlT0lkQ2RSUUtJMlY0QW1zSjdFNElwbWp6?=
 =?utf-8?B?WElMcEdKVnZNMUttWlhscFdtU2MybVdURnkxb0UzWTZhRlhrdElTSldFd052?=
 =?utf-8?B?U00xNjBPY3JZUm5vUWZSWW1JVjNwcmdiMlRsWFZHTFYxSlB0SXREZkdvb2JC?=
 =?utf-8?B?RU9GZUZhTDVKRFVFS09NRkxXbnNVWURZZjRGcGZUc05LSVlxSnVnV20vRXdV?=
 =?utf-8?B?TFJMOHM3ZVNOd0M4UGhxdWxoenB1Uzd2MEt3WjF4UE5wbjBCaWNnVHFoYXJ0?=
 =?utf-8?B?bTEya0tNNXZ1SmY5S0t6YjI5RVh4NXVkeEZueWlpS1JldVpmcWpQT2FvRXFn?=
 =?utf-8?B?Mkh1ajJHMmY1VUhja3pwdVJvOHNzSU1PWVI0VzRrTVA0TVQrcTVIMDk2cTNV?=
 =?utf-8?B?Yzhsc0paMVdJVWRwdjNuNWloL2c4S1lYOTZDTWNkU2dBMDczU0ZIcTR5ckJv?=
 =?utf-8?B?ZzVEd0lDSHRva3BVdStYaGdIcnhnaDFYc0x5aGlyZlVIalRjNnFucjBCWlI0?=
 =?utf-8?B?QUhpeVRuMHI0Y1cvUzNSSnF0Vkt0ejhFaVlacWtGSGlMOXhpdmFNaU1jUzdl?=
 =?utf-8?B?aC85bWM5NERPNVJiQllNMjRyYjhtK0ZnRmQ2MzNabkI4d1VoOWpzOHdQTEdS?=
 =?utf-8?B?OGNqRnRwUlFHS3pCWEhqbFA2TEpyaUIyMjJlaHZRS0JEY0J3UFFOUjhWaHY3?=
 =?utf-8?B?MHcrRlJScGdySS9kbXBTTnhzTG9kRW9MU3lJT3FUcUl3YlIxbDJlWjd1cll2?=
 =?utf-8?B?S0VnN0swNHZmVXl0azljQ1JmcytCR0pUUkxLaFNJajF1Sll4eFBvNU9WdmlY?=
 =?utf-8?B?NDdGNk5GYXlqeG5pM1R1czZQaTRsNVJRV2sxOXlBOHlVT3RSUmxkTERRY0NC?=
 =?utf-8?B?aEkwd0Jwa1JKWFo2aitlNi81M0E0SzJKTUJoaW1jK0d0MTI0eTBaTDdaMzE0?=
 =?utf-8?B?RzE2QU1oczErWDJ4RnNhV1BpSEpqWjRoOHFieldRKy9paklpWlJaYjRHUzdM?=
 =?utf-8?B?dXJkR3EzVHhEOFd4VjdBNWQ2NDdVZGt0cWJHYjdmUnZUZFBUb0NGdjhWaTdp?=
 =?utf-8?B?d1BBakUxcjFvaC9ReEV3a2VsY29La0lBd3oxekdrRHNINWtSMEhVd1ZRY080?=
 =?utf-8?B?LzRRYmxCdVAzWlhOTUp6ZXVhdkdORTUybHVJckZmdHN1R2dRSFJLQ1dpSGtp?=
 =?utf-8?B?S2dTa0VaOUxDclhvbmV2UFF4YkxMeHpnOWJuY1ZaREFUT21KNUtSait1akx4?=
 =?utf-8?B?eHd3OXgvRWZldHJpU3A0Z1dRb0NNWGZsYzVGS2RNZkxlSk41a1YvdmhVbERu?=
 =?utf-8?B?SHk2NGlvTytFdXV4a01RTFA3YWZ6enh5RVlaTU5uWXdLR01kTjZ4RHlRd1ln?=
 =?utf-8?B?emd5KzhmTllhTkRJd3ZGV1J1Wk9EaUVzcTk0RkY4djNPY2F2NnJGRW1NTXdV?=
 =?utf-8?B?bWo4UnYrMDFwQi83VHZnZ2hGak9kYnlQQXAyamtVd1RXYXJNMitiMENoNzB6?=
 =?utf-8?B?UmQxSXVkWklMZk1Xc0ZTcW1oWktIQkt5ZUJpVVE5bnM4RVpDVktGRFRjdExi?=
 =?utf-8?B?NTNob2tNVC8rWUlRMkY2WVJDQjhLbzBUOU9GejZLQ1hGcEZibTd2WlpFcHBx?=
 =?utf-8?B?VkhQR3g3N28weitsSGprOUMzSnA2eVVpTWZmaEZzYmN0K1FnWUFrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09286396B3BE944C939BCFE23F2C6490@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d49892c-92bc-4621-2b49-08de6223efe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 06:26:02.0574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5pMP6CNK8x4o1GUUWnG1CML4joDfJJKp7Tc0YEwRbodKu4nPkIdwz0Bn9HAx+ewKP/6q1jgYLpsHt2QxzSjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8781
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222613_756947_7ED0978E 
X-CRM114-Status: GOOD (  16.34  )
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

SGksIE5pY29sYXM6DQoNCk9uIFR1ZSwgMjAyNS0xMi0zMCBhdCAxMTowMyAtMDMwMCwgTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IFRoZSBBRkJDIGRhdGEgcGF5bG9hZCBpcyBpbiBm
YWN0IG5vdCBvZmZzZXQgYnkgMSBhZGRpdGlvbmFsIGJsb2NrIGFzIHRoZQ0KPiBjb2RlIGFuZCBj
b21tZW50IHN1Z2dlc3QsIGFuZCB0aGlzIGNhdXNlcyB0aGUgYnVmZmVyIHRvIGJlIHJlbmRlcmVk
DQo+IG9mZnNldCBieSBvbmUgYmxvY2suIFJlbW92ZSB0aGlzIGV4dHJhbmVvdXMgb2Zmc2V0IHRv
IGdldCB0aGUgYnVmZmVyDQo+IGNvcnJlY3RseSBkaXNwbGF5ZWQuDQoNClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBGaXhlczogYzQxMGZhOWIwN2MzICgi
ZHJtL21lZGlhdGVrOiBBZGQgQUZCQyBzdXBwb3J0IHRvIE1lZGlhdGVrIERSTSBkcml2ZXIiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxh
Ym9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5j
IHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gaW5kZXggNTA0M2Uw
Mzc3MjcwLi4xMjE0ZjYyMzg1OWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3Bs
YW5lLmMNCj4gQEAgLTE2NCwxMCArMTY0LDkgQEAgc3RhdGljIHZvaWQgbXRrX3BsYW5lX3VwZGF0
ZV9uZXdfc3RhdGUoc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3N0YXRlLA0KPiAgCQkgKi8N
Cj4gIAkJaGRyX2FkZHIgPSBhZGRyICsgaGRyX29mZnNldDsNCj4gIA0KPiAtCQkvKiBUaGUgZGF0
YSBwbGFuZSBpcyBvZmZzZXQgYnkgMSBhZGRpdGlvbmFsIGJsb2NrLiAqLw0KPiAgCQlvZmZzZXQg
PSBwaXRjaCAqIHlfb2Zmc2V0X2luX2Jsb2NrcyArDQo+ICAJCQkgQUZCQ19EQVRBX0JMT0NLX1dJ
RFRIICogQUZCQ19EQVRBX0JMT0NLX0hFSUdIVCAqDQo+IC0JCQkgZmItPmZvcm1hdC0+Y3BwWzBd
ICogKHhfb2Zmc2V0X2luX2Jsb2NrcyArIDEpOw0KPiArCQkJIGZiLT5mb3JtYXQtPmNwcFswXSAq
IHhfb2Zmc2V0X2luX2Jsb2NrczsNCj4gIA0KPiAgCQkvKg0KPiAgCQkgKiBVc2luZyBkbWFfYWRk
cl90IHZhcmlhYmxlIHRvIGNhbGN1bGF0ZSB3aXRoIG11bHRpcGxpZXIgb2YgZGlmZmVyZW50IHR5
cGVzLA0KPiANCg0K


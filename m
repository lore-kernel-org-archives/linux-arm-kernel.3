Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D66BEDF142
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yakVy4sugXMe/hK9Wjoa93fh8ov9aHdyrK3Spf6rAZI=; b=z0kPa6fFUn8EcHW+hBQZnU1IoQ
	b8pURi8cTRFu+g6fE9D4Qwh5OK5crUGcmrY3MYN8c3Vz7eLVOrE6Wsb7d4NegYvi2ZMW484hBBVM5
	meYrp0Vh4JCE7jL+H20GdKYXs6eJUOnIMUBNakSv1H8Giq0DMjQIKn9LB5tSHffFXG8BsmBA72pVH
	mSwKcDVLOv67uO+q7s1qP2+bD2HdmQsAnNAe4Chl24e2p7kn5abs6tUTY4zuI+vjyx3Z34ccCwGGk
	bwCy+pdRD77ZawAO+0AhXgEZCdOcdXCQyZInMthQTddSrnahpMeKQBwJ+tMOSM40ZZVDHILCpluKg
	JvphZTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpyG-00000003HUO-0UOD;
	Fri, 13 Feb 2026 10:00:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpyD-00000003HTa-2Yrk;
	Fri, 13 Feb 2026 10:00:18 +0000
X-UUID: ca83a43608c211f1ad39f32c34db0b1c-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yakVy4sugXMe/hK9Wjoa93fh8ov9aHdyrK3Spf6rAZI=;
	b=BnCVNZ2D2ulWlYp57v0y7zzYABrx+wiEejmMk50wXiuGZIMSjAe7quLxWFqCkK7aFtE1i6/0ht41T/oMJA7QxS/4la47/PVnEKzjNk0pXqpUVy/eknL994jv3gEnq6L67wfexYO33Jgmpr76mwvKRczbmFuQei60reuFQjickTY=;
X-CID-CACHE: Type:Local,Time:202602130227-07,HitQuantity:4
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:62a9e6d2-33a8-4f0e-b87d-29adfe5b4aac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7d6fa9f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca83a43608c211f1ad39f32c34db0b1c-20260213
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2117629337; Fri, 13 Feb 2026 03:00:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 18:00:11 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 18:00:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVLc8UkczW3FLls4mAksyYKOogrl/JIFMAfKaus76bT4SGeC1yaLSzg05+SuzSsH2OUE6FCTj++/RHHkjdjQ0YdmAGLMoN2D6+Z879AmQt7GZOt+d1yVcxGdIElrGOhV5RrAEpUAK2q521SPm6Ow5WBGIfzEnYg1XUNna4U8SSWPRTDKXJDDqCBRp9f/B9QLNREkGl5UVGBst5/OnYj3gIARMCdlC8Oz4IrsYXt0P5CRXeJwAPrC3AfjolZ/GrDaswiLWBDL5lVtnJVwdtvc73MtP6c5nbMxLGy7xl77e43MHC1AESf7Hdbqn7XYI1PrMBpD3xsIu5/OwZWaWuzkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yakVy4sugXMe/hK9Wjoa93fh8ov9aHdyrK3Spf6rAZI=;
 b=Ua8Oec+FRNBNlt/DwCcgxi6BNME0SN0H+5okQ4Tkqmv3VXsxge6hF3tkNtAGaBpUN0IrPHwRHc6704r+iZ4Pwc9GbsTp3ll0aLel5yhTXiaYVgeESLKqi96N4HDT11DO2P9KdH8Q8gd8Yw5C92E0iUxU4YOLpc57VLsth1rmkvILVo0/DUFud6Us5S2PZE4NCxYiXW1Eor5Fty3eTS8Pg5BJ7IqT0Y03uzkiruXkQSYCU/k3dmL3wnCk2HSPXrAd5rTCgBBezJjRArGtp0LXnac56WbsCbcwcEijg2peT2w/g8g4OGykQqiVnjxcA/CCpKCQbqaWiYtN9F4e7XZ5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yakVy4sugXMe/hK9Wjoa93fh8ov9aHdyrK3Spf6rAZI=;
 b=AlE6/Z12wDNoNnLP2qmiWf19QUAHXgaA+H6KjSuKKnJWWbLIRA5YHTKLveIwqq//SQ68QQbozoHL5zFEImV+VCURZqBQdGk1+az2EUXoMuS5wkSjvdKvx5IYTHWodUsAmrpJG5mv8AK1iL9ElZnt2YmTPghrikNcOOfApn4X5Gw=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by PUZPR03MB7134.apcprd03.prod.outlook.com (2603:1096:301:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 10:00:08 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 10:00:07 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Topic: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Index: AQHcnAaiH9bvJOQmFEiMhKsD0Jzb37WAQ0mAgAAcrsGAAAUQ0YAAAfoA
Date: Fri, 13 Feb 2026 10:00:07 +0000
Message-ID: <54052ec60b539b0600509c6474dae169569665e1.camel@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
	 <20260212100104.11863-6-irui.wang@mediatek.com>
	 <20260213-didactic-whispering-impala-ea9e64@quoll>
	 <13bf9b8673c6d47e07dee4a233945ed542e9b4f3.camel@mediatek.com>
	 <e69cf0c6-f7cf-4f83-a7fc-dc4b9dfe174c@kernel.org>
	 <dad64d23d0e9588979005f5770806105eb32a831.camel@mediatek.com>
	 <ece3f7ee-8ecc-4528-a6ce-da4eeb24b236@kernel.org>
In-Reply-To: <ece3f7ee-8ecc-4528-a6ce-da4eeb24b236@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|PUZPR03MB7134:EE_
x-ms-office365-filtering-correlation-id: f7e1efce-7467-4eec-8293-08de6ae6ab1d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?LzZPU2t1SjZKa2ZTN0VpV09YSVJ1ZGJjNnNXNFlKODNHTGZqa2hraVZKVk9R?=
 =?utf-8?B?TVBsKzMxUGVIcVRCaU9Kd0pnMXdlQlAveVIyVkVwNEw0NUs3aG5tWCszTWN3?=
 =?utf-8?B?NVdvNHZVZktiZ05KNXhTR2lnMFFPSndZQVEzS2k1dzlHMzB6RXBZTmMvdnk4?=
 =?utf-8?B?bUIxVWdwMHJEZzEzQTRSdDd5czdtR1FSNnNQRjh1a21GU3M0enNhbVRuNUxT?=
 =?utf-8?B?OW1CNUlvTUpENHk0SnBHeGloUU9qQ3RlZXhVMGRvK0hiaUVFWjhhbzdCbUsy?=
 =?utf-8?B?a1pKVytBa1pDVTFYUGN1Nmg4YTl5UXg4dnk1NXpDa1Z5SWxSOEdBcmlQWmJv?=
 =?utf-8?B?WnJHRjY2b3MrN2RzYVk1MzlCQXZQcDhDZWVBU2hwOUwvTWd0ZzRQU1dnb0hU?=
 =?utf-8?B?c0ZQUjNoLzhxeTkzSmtKUFJLMEJpZFREbC9ickQzUlNyZVQwSmd1bGJhM1l4?=
 =?utf-8?B?NlYwajVlTEt2UU9YNXJRZzhiTnlrZ2Fxb1h1TGNyR3FSdmd1d04vd1hJcDB6?=
 =?utf-8?B?ZUI1Rk9jQ2dzZ0ZLQzJwZ0pCYWkxelhXTnVlMS9SNkxZelVNYXNjSGtXSkRQ?=
 =?utf-8?B?QXBydUsyYUcyaWgveHMwcGNGVWZyclhmYTVZdFdjeG1Mc1F6YjM1Z2E4UXRL?=
 =?utf-8?B?NHNQNm1BdUNyaStHZUNDZWdqMFJQbE9mSVprSGttRVJXMHVuWnN4bU0yOGNt?=
 =?utf-8?B?eFAxdVR3d1p4QVorR3ZPMkNlVENneXdqeGdhZTNuajUvb3ZtWHBOaTRZMWJm?=
 =?utf-8?B?TEZxSW5JNmFQcnRKaWcyMk9ickZtelUvbWVZWDA4S2hXS0pWVzBRcXdWZGhU?=
 =?utf-8?B?aXZFOWh4L2NHOXg3RElLS3k4ZlJVaEk0eVcxd2dpQUtBN0JTT2xadVdoZk9j?=
 =?utf-8?B?cVlEbngvRFY0cVlTY0Q2czU0SVRSRkQ0R1QwVkt5bjNFdE1adFJHMGVtLzFM?=
 =?utf-8?B?dkZpc3JVVXhKTjlXdkFaOUI2QkJORU1obEtXcCtlV0c0YVoyeGlBZ0tNdklt?=
 =?utf-8?B?T1hvemZsNk45bHdmUEVSWU1GK1dldDA5QUZDcFpYckFRQk1KQUpISUhSRTB3?=
 =?utf-8?B?TkVnOXZkOHY3RWREODBGckROKzlsMy9yQ3RtRzlUVGpibldnSlIrVXJ5Tjc1?=
 =?utf-8?B?Slk1NC9lV2NiNDVGeExBcGpLZ2xoc0haOThGNmhiUHZFNlV3empoYUhyaDRm?=
 =?utf-8?B?YXJoTzdpcWx6M1d0QnVHMnZ5UzRIYjVsSHJZRlptZXp4NFhPeHZXNGtPZUQz?=
 =?utf-8?B?YURvN1dHZFZRd1hyU0NkVVgrL01KWFZTUkpTTUhGOFQ3WG9hL1JOeHJwZW5Y?=
 =?utf-8?B?Q1NUMW5hVGhuYVAveEdIdTZMbGVQKy9objFpZC8wbFdkNUpVWFRUWmtWbFJw?=
 =?utf-8?B?WXJESS93QTVkdGZXN0twQXFWbVg0V3FXN1ZCYit6aFF2RkdNRDU4NHhmcHph?=
 =?utf-8?B?aUYyMDEvTlhFZDUvaW53WlRlbmNuc3NiblZSVTRkN1JVeGJFWFJpck4vbkVN?=
 =?utf-8?B?R0JxTm5jamErTTR4WGhDcHVoR3o4WHBYOU9Yb3BINWlEcTdPM2ZDOXVvWkRD?=
 =?utf-8?B?aDloQlJvT1lCd3lndkxWS1QrRFNBdGh3THI2WGVFa1NtcG9OTEhiK0lUaFpG?=
 =?utf-8?B?ZnRLaDdKQXZJbjljeVB5b3VtSUZLeng5WW5HWHJTY0tGUnhjcDhua0pVM2pQ?=
 =?utf-8?B?ZzlxUGoxWkM4V0VFazFPOGowbEg1bDZGVVlpM1hPaXpvYmc5blV4WTBtVzZU?=
 =?utf-8?B?RVd1WVgrQzFqVHpMdE1QZjdYNGczTjc4bzNlM3JaQm40WDB4MmZCT0FFVXk4?=
 =?utf-8?B?NndGcm1pM3d2NGpjUTZXWjNDWGoveHFpNFBDUXNQOS9SZjBuZ2lzU1Q4NGJy?=
 =?utf-8?B?NjNHYmRRL2N5emRRTXJibDk1aEdrSnE3TzRPT1NHbnc4V1pOdk5YNjFCemZB?=
 =?utf-8?B?S3VaN1lxaEJLbkY5UEhqYzBQL3ZscTBDQTlTK0ZGMnBkNzRXMDJDWDVnWFJK?=
 =?utf-8?B?UXR2byt3NzdlQm9TM2dMOHJpVks3SWpvNkxpczE4Ykg4MWxvWHNBbjZmdk9y?=
 =?utf-8?B?VzNldHlmbVZQM0VFQisxT08zNldEbHI0OEEyRnhEeDR1aVR5SmNXUENzcXY2?=
 =?utf-8?B?ZmJaZUhBZWFkNzFhSC9XQUkrQXo2N1p0VXJsQkxUcGtHenZwL0hic3k1WGFD?=
 =?utf-8?Q?rA/2DfnyWlmC7n767/6OB38=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejZLUzFRYXl3ZU0zcFd0WHBaa1lRLzQ3aGk0ZkUzUEZyWjhBYjN6ekwvTm9J?=
 =?utf-8?B?YlJNK2F4RE9zQTM1NndnZFhWOG80dFA5eVgrOUNmcENBYlRVMk4xa0lDUC9M?=
 =?utf-8?B?MGVRVG9NYXFhRDVuTFNQaWJoSU9BejZNNVBjcFUzRmUwdFJ4ZTRoWnlzSm81?=
 =?utf-8?B?RHlYZkkxYTRxM05hZkJBVXNPQVc3akhqOWN6Vno5SHVZV2UraHJRK0xWZk9C?=
 =?utf-8?B?OTFjZk9wYkd1aEtvQ256TVlkUDNQSHNvbXJkRXduM0dUd0w5WEdmcXlXSUFJ?=
 =?utf-8?B?TEhmMDM5bUdnaHQyeWVmVHVOSTRkcmVjQzRJNDlMdE9scWM3K3l5VlZqaUFr?=
 =?utf-8?B?M01leDVjcjZ4Nk1ZZ2FGb3Jnam52aGhDREtJTys5L1d0Z2E2YmI2VExvM3Iy?=
 =?utf-8?B?eitxMkZWZUJXc2lHbDA5bUhkT1R3akZKbG02cU9heGJXcVBwUTdxL1ZxSDhT?=
 =?utf-8?B?RVhFSXpaNWpsc0ZrcHc3SUZQMTRRYUxlUUNDNy9IS2FqR04xSnlwb0U5M1Ju?=
 =?utf-8?B?ZHpoT0dFWmIwbDlTUEo3d1FYMWVnZnZTbkVvQVZpV3dYT2hJUWQ0clhTMlZS?=
 =?utf-8?B?UDhJbi96RFdaeWYxd3l6SkRGS3pWa3V2NzNSanVyNkViaTlvSVFCOWVHakJT?=
 =?utf-8?B?eTd4SmgxQXMwUmt2a0dmMWp5YWIwdzFsblc0ZTljOW5taUlDV1IvS1ZTaDZP?=
 =?utf-8?B?dDRpZHhPd2lwTGJPU1RaQjltWC90NHYzRWtzK3pNK29YUk1PbDRGQ3M4czgv?=
 =?utf-8?B?YjJxVW84c242cTMxY2U5OEIwRkl5c3RiWTBWZVJNQUwxclNycXU3Q0JKU3Fw?=
 =?utf-8?B?WWgxUjdrOEpCUnN6RXY4ZjcxRmhxREhjWEhSSHpiQmtiTzNERGd2UGdCQnIz?=
 =?utf-8?B?ci9mN0VaNzI2R3g0UXp3WUszZlo1MXJNVGlidG1VM0ZmcTA4c3JoM256cTJK?=
 =?utf-8?B?SVhEQUFoa3QwS3NmR2JhcHZMZXlIUjVWUXpVN2dNa0UxK05PeTVWNmQ4NEJS?=
 =?utf-8?B?RVh0ejBVcmlJYmY5S1BubU5qcEc1aVpvbGltTWhPZGhWTTR2dWpjUnhZUzFI?=
 =?utf-8?B?L2V0MmUyanQ1SmdKTkczSWtUMmFlc1dQRFRocjQ4am1lbU1kUURsU2xTTFVj?=
 =?utf-8?B?TFhmUTJybm1pa1RJaytEalM4bW1nZFNQTXFlUGFqelFqNEhhOEx0WnZrSjI2?=
 =?utf-8?B?VkJvR3NiYzRXZUJrMFY4Y09ITVEwL2pOTVpEQUdyVGJQclZDcHpvVUlPcTJR?=
 =?utf-8?B?cTJXanFkQjFlWk5lUml6dlE1eTJSb0lGa3FuREFBdzRRazU1bVNxeFhJRGtK?=
 =?utf-8?B?RUV2ZVFhTU42eWZsVmNLUHJCeDduelZhWFFtbXMvRDJhWWFIR244Vm5TTlF6?=
 =?utf-8?B?Vk9YWVYzTWpCSElqK052Y1VOcTJ1Vjlxc3g1VkphbkZCZ3FhN0ZDMW5IdUJJ?=
 =?utf-8?B?bTdGMk1qYStYR3E1RnZNN3c5dVVkWmJhanNZQXBWNHk1QzVSLzUzUnNiVzNL?=
 =?utf-8?B?ODRoU1pDYWhyNFk3TXpNTHl6M1E1eEswcjJOVC9rUUNJdm05bXlwUWlHQjJp?=
 =?utf-8?B?ZkpkYWtuWm9wSWk4V0pkaHBKdTZaenVLT2d6NTRIbGowSmxYSEp5Mk9zRWtv?=
 =?utf-8?B?UGNBOFk0cG9ZL2k4cU56MjBmS2pac1FvcWpGWndzUXRuWk5xZDNmWG12TWlB?=
 =?utf-8?B?aXM1K2tDeXcrZGFhSEdFa2M4NkIxdFNUb2VoRTBxeERaL1c0elpRNjhCZTB3?=
 =?utf-8?B?a1V0UGwvUmdoNmVzS2ZTMVNhdUs1QlRJQkd3eGRGMkd1OS8rQzR3TVBuTDVy?=
 =?utf-8?B?ZWtuVzd3d0NBUFZMNHZpL3p4YjB3NGZLSDh1NGdZWE5md2JyZlJ1c0hGZTQw?=
 =?utf-8?B?alljS0lGUzdhY3R6RHdhZ0ZWSVZpeldEVnlFY3dVR21nYWF1aW41dW9rcW53?=
 =?utf-8?B?OFRkb2Z5VFNHZUROaGpWZFZ5cHdzVDQ1ZGE2R0FLallIZVBKOVRYWXNheUZK?=
 =?utf-8?B?T3B3aDdIWG96bithSjFOUTRXb1lpWkhMbGNHbk9pQkxINyttNjMvNVRiSnNM?=
 =?utf-8?B?UFJTVE41NHRIdE5ndStHTTc0amtYU2UzdkQ2MnNETWdmdkcwOS9icWpvcHdL?=
 =?utf-8?B?Vm1WS2c4ek1QVE52eXFsWFBHcGVoeVQrekpmbS9DR3kwM0I0WFlacHBpclh4?=
 =?utf-8?B?aDZFMXhMWTlJWG9lTlNLdmJ5SzlDRUwwWjJNR2U2K2k3aVNndVhwNGZwKzlr?=
 =?utf-8?B?OXBGaEdXaWZvZVgwd2NIdGpxeHhDTHYvSll4VkNob2lTRUpGYlJZdlZLZHpx?=
 =?utf-8?B?YWw5RW91VVg2aUxVM3dxM21BRnVhOWxFcWpVZDhLeTUzVFZ1Tm9hZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60B780385543AD4FA4CE45AF39F23592@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e1efce-7467-4eec-8293-08de6ae6ab1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 10:00:07.8592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5seOqC+UC8cKB2PDwalltcG4fTBYV7VFJrAETRc5JtM4cuKBSyTBdqznxCZdS5Z9ppH/6ulEVd+UdEAXD8+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7134
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_020017_668324_290753EC 
X-CRM114-Status: GOOD (  23.33  )
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

T24gRnJpLCAyMDI2LTAyLTEzIGF0IDEwOjUxICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxMy8wMi8yMDI2IDEwOjQ3LCBJcnVpIFdhbmcgKOeOi+eRnikgd3JvdGU6DQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gQW5kIGhlcmUgc3RpbGwgZGlkIG5vdCBpbXBsZW1lbnQgdGhl
IGNvbW1lbnQuIFNvIGJhc2ljYWxseQ0KPiA+ID4gPiA+IHlvdQ0KPiA+ID4gPiA+IGRpZA0KPiA+
ID4gPiA+IG5vdA0KPiA+ID4gPiA+IGltcGxlbWVudCBmdWxseSB2MiBhbmQgdjMuDQo+ID4gPiA+
IA0KPiA+ID4gPiBJZiB5b3UgYXJlIG1lYW4gYWJvdXQgdGhlIGBlbHNlIHN0YXRlbWVudGAsIEkg
bGVmdCBhIGNvbW1lbnRzDQo+ID4gPiA+IGFuZA0KPiA+ID4gPiB3YW50DQo+ID4gPiA+IHRvIGdl
dCBhbiBleHBsYW5hdGlvbiBmcm9tIHlvdSwgaWYgeW91IGZlZWwgdGhhdCBteSByZXBseSBpcw0K
PiA+ID4gPiB1bnNhdGlzZmFjdG9yeSBvciBpbmNvcnJlY3QsIHBsZWFzZSBsZXQgbWUga25vdy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBrZXkgcG9pbnQgaXMgdGhhdCBvdXIgcGF0Y2ggY2FuIHNh
dGlzZnkgeW91IGFuZCBnZXQgYQ0KPiA+ID4gPiBSZXZpZXdlZC0NCj4gPiA+ID4gYnkNCj4gPiA+
ID4gZnJvbSB5b3UuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBOZWl0aGVyIHlvdXIgYW5zd2Vy
LCBub3IgY29tbWl0IGRlc2NyaXB0aW9uIGhlcmUgYXJlIGFjdHVhbGx5DQo+ID4gPiBBTlNXRVJJ
TkcNCj4gPiA+IHRvIG15IGNvbW1lbnQgYXQgdjMuIElmIHlvdSBhbnN3ZXIgd2l0aCBpcnJlbGV2
YW50L3VucmVsYXRlZA0KPiA+ID4gY29tbWVudCwNCj4gPiA+IHRoZSByZXZpZXdlcidzIGZlZWRi
YWNrIHN0YXlzLiBPUiBleHBsYWluIHBsZWFzZSB3aXRoIGRpZmZlcmVudA0KPiA+ID4gd29yZHMN
Cj4gPiA+IHdoeSBvdGhlciBkZXZpY2VzIGhhdmUgdmNwIGJ1dCB5b3VyIGNvbW1pdCBtc2cgc2F5
cyB0aGV5IGRvIG5vdA0KPiA+ID4gaGF2ZQ0KPiA+ID4gdmNwLg0KPiA+IA0KPiA+IFdoeSBvdGhl
ciBkZXZpY2VzIGhhdmUgdmNwPyBiZWNhdXNlIEkgZGlkbid0IHdyaXRlDQo+ID4gJ21lZGlhdGVr
LHZjcDpmYWxzZScNCj4gPiBpbiBlbHNlIHN0YXRlbWVudD8NCj4gDQo+IFllcw0KSSB3aWxsIGFk
ZCBlbHNlIHN0YXRlbWVudCBpbiBuZXh0IHBhdGNoLCBtYW55IHRoYW5rcyBmb3IgeW91cmV4cGxh
bmF0aW9uLCBhbmQgc2luY2VyZWx5IGdyYXRlZnVsIGZvciB5b3VyIHJldmlldy4gDQoNCkhhdmUg
YSBuaWNlIGRheS4NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMNCg0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg==


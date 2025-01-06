Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sXsptbPLaoJCIKLvXN3hdwK7O9DTMopRTH+X+UKdYI=; b=YjqN5a/67gUYuD+3cfY7UGXAfr
	uIBo+L0etiiiZnotMQqEiAI2T9zCzohISqCv/dY9HdME3IWZn34RkYhW+K8yITv+CeYx72drsEN2j
	5Dk0O8jS5wuXCXW0+pMi7ymb8a56LXmOURB2jOtJvYJYeUH1E0FY61NKzt0zhy75cKv8ZFykv8Tp5
	Sk1rC8rWZXIpCn8ymSSCAjtLZscB9pub+qKeJdjOeLQwL55h4MXhpVfVn5uJg8z4dlapjrHL5jwb/
	BfH5Wc81eyNyOHS2sHKs12VvCbMPSb1CmFoI3XgBulA3QCNi7hK454azCagcdwShpt/ixjuL9uNlj
	WrHd9SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoQh-00000001eFX-1IhX;
	Mon, 06 Jan 2025 14:50:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoBl-00000001anC-2zSN;
	Mon, 06 Jan 2025 14:34:42 +0000
X-UUID: 59d23514cc3b11ef9048ed6ed365623b-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8sXsptbPLaoJCIKLvXN3hdwK7O9DTMopRTH+X+UKdYI=;
	b=QHguU8ASKIddUNfNFDgc1lUSeicZDxRCvjCr1RE2yyA/HG1Ov7Nxdo+3dWp9z7Z23AHASC3Ec8eJuSepYt+o+MXxwzUbFBFz5PNe/36LIjraQis8FYty9GvxIyNY7NGYYczUu3Z3Wq1Xs120MC4inZ8Ebk0nk9M4+mOxNa6aJGE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:073a35cc-8478-4abd-97a6-ec78e5a9f975,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:5508be25-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 59d23514cc3b11ef9048ed6ed365623b-20250106
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1569639490; Mon, 06 Jan 2025 07:34:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 22:34:32 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 22:34:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/9qskJibc1ISy4sNL333JRXodRZT7hg9T/pxhzJgiBBQPkIBg7dvFr7EkjnSbOK6jM5aBJmtlSN1Ca+hYGvib7bTXXiYo4mdfxPsowwy5ClURCLT92+l+1uN/mhUqtUbpBS/r4vOg9ujpNdAHXRO2iVWqWlWVOrInlltr3KUOf4pZ1uMG2Ztjqe0fFJOHrmW6nkip/OGVlfhsXnJqd+afUOFG66aMdzca+bGscciOSqHmnajJtZQkD2lQ2VnsA6Se1vlFnUEVee4xJeZOz6AF3z+kTCyOSWfgEELLzNag7IxPGzZHsQ14goM7Wqt3BFjITTP0RbH3en8przTFUNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sXsptbPLaoJCIKLvXN3hdwK7O9DTMopRTH+X+UKdYI=;
 b=J7fFz5Xn69vT/ghrKufZ5rGcdCtjxPRxf3wjf17ti7yP/36C0Agwok5HHAgoeG8fBSUjdJR+cXqLmj6zcH+TmFLLUa5Rmjgqb/Czw6yankff6Fie1eScTW9tOKPZXpXdbv04+/29WFnZwme6lZIPikME077rSrh+e5ia0lAVd+iASgBz9y3onDcPskVQglLMMLp5Xz5AWj4z+dTAXgoIgWPdDl9D2/e1RaP4mWkl5giuKwC/25lD/fEgRazwGRxsmJX+sXJqAXIqf7pX8V7h5UJmuSP+pP0EQDqa7bORgBws8588qT8b9Fv+hZ08b64QHobCL/Zk55VyyBUsUEtTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sXsptbPLaoJCIKLvXN3hdwK7O9DTMopRTH+X+UKdYI=;
 b=KgYNOZVn6IUcniHnG6pVCX7xMCmFTYqjEgvd/BjaVIcOxeaoeYUEdzbEKHLYdTAnIeDHKgmyoEJbbD/vPlqKPz8VA8ijjhNHyI1QWRJA++6o28iJQULhYhA6HbUXSZyPXUormYP8Pk8TDm2tPshbj0KaALD1BcN8aDY+ERMBQKk=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by SEYPR03MB7725.apcprd03.prod.outlook.com (2603:1096:101:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:34:30 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:34:30 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to set
 disconnect threshold
Thread-Topic: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to
 set disconnect threshold
Thread-Index: AQHbP68py1rCfJL+MkWe9w25qfqE7bLJQYmAgEDPUYA=
Date: Mon, 6 Jan 2025 14:34:30 +0000
Message-ID: <fb40e000d31c3c809a73f62e3e8dd36ca2b6de7a.camel@mediatek.com>
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
	 <4901ecf5-8cd1-4d82-a240-f56794f46429@collabora.com>
In-Reply-To: <4901ecf5-8cd1-4d82-a240-f56794f46429@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|SEYPR03MB7725:EE_
x-ms-office365-filtering-correlation-id: 01089905-d8f4-4872-7094-08dd2e5f3b0b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejMyQnhyVlAvTEo1SFVSMHJuZG9FNWk3KzdWdzBydnpJcmdEWExZRkY5L053?=
 =?utf-8?B?VjE4dXdzN1FxdW1NWU9KNEMwa09FejlqZHVENll2UC81Z2IzR0daMkZBejA1?=
 =?utf-8?B?NVVpNzZqY2FnazhuT2dEZmdSZTZyYzJxUUVOcVRmUmRZc0VCY25iUUJna3E1?=
 =?utf-8?B?WFM1VFZycjEzKzRBZXM4ay8vNVJRT1pCZ1J1K2FWMUx3SzdFNUJaVEg5WUsw?=
 =?utf-8?B?TlBaUWd1TXdOMDhTSi9UMGhQRVNJY3MzYWtsaFh6RW04WDR6WjVxV0c0NFJY?=
 =?utf-8?B?QVh5TXhJWTNacW5RaUFVOXRON21JcGc5TFhISEdaY0dPeUYvY1ZZMlFHYXFM?=
 =?utf-8?B?a2JBOHVmNEZIVk1GVEFZbEhsUlp1ZlhaTlU2cjk3a0RpS09yK2VZUDZFcWVy?=
 =?utf-8?B?WVZNYVV4YzZ5MWs1UFBWNnJ6bnloRHFpQWcwKzlPQitFNm95aTM2ankvVVFh?=
 =?utf-8?B?Qm8vYWxLNWtqTlV0TkFMTkJtTXZyMzFsK0hGZnF2d01OaW9NZ1owaUFMcitS?=
 =?utf-8?B?Mmw3bmo2VDYveFExTFA3WHV3Yzl6bW9Nb3lPYlNSSUVra3BFVGltZ0R4eHA4?=
 =?utf-8?B?N3gvYVZTRE4vS3RoR2NJZHVaRElPZmwxZzJoNEdZaVp6TVpUQ0VQcWhBU21o?=
 =?utf-8?B?THJ0SjZHdU44TDhjQTY1R0hWUFY4eFg1M3loWTA0bzB6SjhMaHJteUFtc2dm?=
 =?utf-8?B?eUlUdE5oOExCL2lxR3dMcTNjakk4TkE1RGppeGZ6Q1BNcVJsOThIWG15N1lB?=
 =?utf-8?B?TStEOUxSUFNGVTRybWtzeU5IZXhGTVg3ejRoZG1LZGpaN3U5UzM1clpBNHVY?=
 =?utf-8?B?QUF1WjV0UytaQm5FcktwMzdnUVNSeHNMU2g3Z2NDcWwxV0JkVHVuQlhuaFVU?=
 =?utf-8?B?emlNQWkyZEg3Q3psdDlTRTltcFd6aVBHSzE0elBKci81OVU1QUpDelZ6TE84?=
 =?utf-8?B?Sldya0UwemdQazNmamUreUdiZmlETCtvT21ySDJSWHhuY3U1U2FZbnZNb2Y4?=
 =?utf-8?B?ZCtLZGMwK3orUGxHK1pMd2EvZ2dQMkN2U1FPTm54UUVXbE5VUjAzeDd4WTNj?=
 =?utf-8?B?dDVGK2tpaWw1cnJpalByTW5vWnA5RE9zQ0hNdTN5clN0cEVyTWlFUG5SZDlT?=
 =?utf-8?B?Rmg4MENSNTRZOU05M2dTR0RJOUVFYVo0cmljRzZvTndmWHhCWUVPOTRmb005?=
 =?utf-8?B?U1RnbE5SR0poTkhtdmV1OG9zSktXait5eG9vZFhnZE1LRTE0WDNQZWNrMFJQ?=
 =?utf-8?B?SmY2REN4NVhuc1ByamR6L0tybWpFWjEyRkNocTNVMXN0REVlck5Td0Zidld4?=
 =?utf-8?B?UC96UlFEU1FMVGFPQ3VCbXhpaFVGcGJtQ0lCNTJYZHc5eVByVzNpNzVnTjBX?=
 =?utf-8?B?NlZIcnhWQ3lnZk5reEErR1llSGt1NkZ1QUdrdUE0R1RFZm1NWnpYU2hRQ0Mv?=
 =?utf-8?B?YTlrRTQzL2t6MkFIOEtPcXlrVVhxSHFNQmxkLzByZXNZODlxeWVxaFh6dkVJ?=
 =?utf-8?B?eHdsZTdZTzRXUUhmdEMwZ1hIaTZrM3B3RmMvckJISURzT01UVmhqS25ic2RQ?=
 =?utf-8?B?QUtPU0lObHhwSDY1cUh1Sk1aUHF4am1xRHY1OVBScmlpMU9rWUJodkcvd2l0?=
 =?utf-8?B?R0x6THloNTZlU0RFeEQ1UGFwVjM5RVdwMVI5UGgrRTZ3NlRPK3BBcnFjN2xK?=
 =?utf-8?B?R3Y5LzhWRG5PNlExRmFhRUV1MWZmaTVCTU1QYmYzb2ovRHJLYnpZaXZUYVdH?=
 =?utf-8?B?ZENtMGN1ZEN0YTBmUlB1ZWlGL3M2MCtHMEM4UHlzdlVqZGpTelhLa1ZpUHN1?=
 =?utf-8?B?UTJUSWZLcTIrSjhSbGNpL0pjOWxQL0RwN0JXKytzdlBIc0FSa0RMVWxoQXFD?=
 =?utf-8?B?ZlVtSkhnN3BySmxNaUtMMWkyQ3JrdFp0b0wxZlRiK3ovcFNnRkxVM3dNbGhz?=
 =?utf-8?Q?I80q22Ts2VTW+YLYPje2TI2C3V7f+dZs?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnhoOVROeHhValNqMnc3cXBsano4S1ZiNFJwUWdaZnA3WkQ1UTlMSWh6NUMy?=
 =?utf-8?B?dDZOUU0vVEhDb1lEbmZGQkd5b3Fsa3ZSbFdDQ0lSa3g0OHQ4eU5TbXNrYVd3?=
 =?utf-8?B?MytaLzlwQXo2RDZaNzIvdGdsOE1nVVZsejY3eXllVE1UTWhsdEtvamNoUkor?=
 =?utf-8?B?Q0ovSTRINVphQXBlVmc3NnlYNzFJbmRQWktkemNnVmt2cjlXN0taOHFKelAw?=
 =?utf-8?B?bzFNVkxwUUo5S00rREFYUWt0dXB2WnZXMGMzNGw3bUdhNC9ZU09xTFhZOWNH?=
 =?utf-8?B?am1Eb0RtWGhhdVlWcjJwSGlrT0ZXZDRqMTMvNWhrdDYwOUFkaFpmcnU5dTdt?=
 =?utf-8?B?c1BLQUttK1VFSHVMVHZERVhOT0wzV2pIRWp5ZW0yYURtNXJ4eDBxZCtqeWh1?=
 =?utf-8?B?SFpnM0NiNGUzNVcxOFRselhBUmRKSERTN2JYMDJ2YUgySGtHbXpxVXNiUWxN?=
 =?utf-8?B?WkJjZVlzQnB4VGxhRGNlMEVqOHhoZlExL0lMMjR1Q2Rlc3VCaGF2dlRzYVRU?=
 =?utf-8?B?OFM0MmNUQThYTFJQK1VpTVN0VkxEVllqbUV2TXhYSlJOeFBOdXFRVnkvMTNV?=
 =?utf-8?B?Uyt3bmRNMUdNT29jMTZuVzBiV0hCK2dtZEUyY21STEtYMDVZWVUrRUl5bFNk?=
 =?utf-8?B?R09VUWNuQjNFVWFnSWZBdUtpajhWTVlpWnluUXlPSUJXWSs5K1BDK3dFLy9E?=
 =?utf-8?B?OWVBREVQYmdtVHplNzVxamV2MENpTDFWRjd0MDZBM0xEMXpOeklnRzBTb0sx?=
 =?utf-8?B?TnAvSk1qdlRmQzdVbDFKTXVQMFFhdDMvak4zMFJmNG9OeUJ4ZTQwb2tmWXk4?=
 =?utf-8?B?SDE1NmQzK1dsR25oeTlBV1hjVjYzRmk3eDhmcWNmYUF5S2JPcmlqS0drVS9y?=
 =?utf-8?B?eW0wbzRkSXZNa3MvTHBncWZnVUJOdkRweEFKUXM3LzJoM1lSTUFOckhzbmFE?=
 =?utf-8?B?NTE4WVZuM3ErbE5IRmJhQVFrSytVTUpRSE1sM3pPMkN4L2VjT2M5RzlhU3ZN?=
 =?utf-8?B?cXVIQ0h0UktOaURBdVpGcnZyeFpkZjFZc29wOGI3RSt5SWxDQ0xvU3FTWXpl?=
 =?utf-8?B?ZW5LUWwvUk5VZEtNbHA1S3ZYR00zOHh5SnAzUGR1eHRiVnhUUXh0Uk1ZRTJD?=
 =?utf-8?B?dnlnVGhZcFN2cUhHZUV5Q3FrVExFU2FLbXlYSFRZQjY3L2NlNC92YjlFbHhX?=
 =?utf-8?B?Nm1paXFqTjd6SS93K2o5VlJIVTRNbUtJU3UxbUlIVDU4ZGxobTh3cVNSNjVQ?=
 =?utf-8?B?WWVaYjRVY28vNkNKWFoxTUt2WE9wREdVQWxFY1NWUFB0VCsxN0xsWDhtUFAr?=
 =?utf-8?B?L0JHdFFFTm02d1g1VmVsam9FZ2F1bDloci9qYWt2L0FyOFJSbUNtT3NQMkU1?=
 =?utf-8?B?NzJDQ1dCNVFKb2J4cVFvV2ZaWEh5WFVOUVRHTXZnNEdNTEN1QnFNdlNvamZ6?=
 =?utf-8?B?T3FISkp1TC9lbEpWcU5wazhxTjdlaFRUdEtnOVMrNUxXb1lWaGZ0WXVocWsy?=
 =?utf-8?B?eklBeGNlRzlXYktoUGVaYUlKN0VkMnlxVkhFNUx6WGoxcHNUMkd1eDlzTW83?=
 =?utf-8?B?M3hHSVFBUEp5Y29lUEY4Rk1ockwzV3V0ZitJN2tsbjRVRTNTY3IyWHVXakxK?=
 =?utf-8?B?WlBvOHo5WDBwS3NzRWxDV1kzQ3VENmZUV1VkemVON29CQkZTV01hTjNiVjNY?=
 =?utf-8?B?SGF1U2Nqa2RhenJYNTZsOThRdTdRY1MyRm9Eb3gvQndETXV5U1lFK1dTQkk5?=
 =?utf-8?B?Z29scEFqWm1lejRlRStsaFIvTWRzZndYQktDVk4zbVIvdFpTanJYckdxcDFV?=
 =?utf-8?B?VVBsc1IzaUx0WlhQOURoSUJzMXF1WWNwckV6TmR6RXlSNkkvMnpWak5Femla?=
 =?utf-8?B?eDJqdHpNYVVYMFI5bzNtSHRtZEw5SU9rVndQNlNUdEwrSHNLNTJneHZhUTZr?=
 =?utf-8?B?VmhhSjVON1l4eUR1bWEwK29IUjF2a25DeTA5cnFuR2haNWQrbzQzeGZWUG5Z?=
 =?utf-8?B?d2prYmV0OUVkckRzVWlCRFNjRndLOTBpQ05vYkpGMkt6ZGh3VTkra2paMlJS?=
 =?utf-8?B?cHNMcm5UN0hDVW9pTitoVUJrZ2xLdURkU1VOMHByMFI3SVR3TFNEUFVNQUZI?=
 =?utf-8?B?NmNQWklNUEtuM3V6bFpKTHZpRTFsbE51OHk0TkdnY1NTOWxES3hMcHlOU2hJ?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77A55F56178E664DA8F28D061CE6F71F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01089905-d8f4-4872-7094-08dd2e5f3b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 14:34:30.3521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8MaMseCeNfRuDePaQCqaq796bzrqRAUQTIHPZhYTmfqBGp/KT/CV4MuMmt+JBiVxbNzZIUSD85MABTyGfBKP00+XoM1WlvDRVDfwARRH9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7725
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_063441_754973_D0187E1F 
X-CRM114-Status: GOOD (  17.70  )
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

T24gVHVlLCAyMDI0LTExLTI2IGF0IDA5OjUxICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNi8xMS8yNCAwMzo1OCwgQ2h1bmZlbmcg
WXVuIGhhIHNjcml0dG86DQo+ID4gQWRkIGEgcHJvcGVydHkgdG8gdHVuZSB1c2IyIHBoeSdzIGRp
c2Nvbm5lY3QgdGhyZXNob2xkLg0KPiA+IEFuZCBhZGQgYSBjb21wYXRpYmxlIGZvciBtdDgxOTYu
DQo+ID4gDQo+IA0KPiBJcyB0aGlzIGEgYm9hcmQtc3BlY2lmaWMgcHJvcGVydHk/IElmIHNvLCBj
YW4geW91IHBsZWFzZSBkZXNjcmliZSB0aGUNCj4gcmVhc29uPw0KTm8sIGl0J3MgYSBjb21tb24g
cHJvcGVydHksIGFsbCBTb0Mgd2l0aCB4c3BoeSBjb250cm9sbGVyIGNhbiB1c2UgaXQuDQoNClRo
YW5rcw0KDQo+IA0KPiBUaGFua3MsDQo+IEFuZ2Vsbw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwg
fCA4DQo+ID4gKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbA0KPiA+IGluZGV4IGE5ZTMxMzlm
ZDQyMS4uMmUwMTJkNWUxZGExIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbA0KPiA+IEBA
IC00OSw2ICs0OSw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAtIGVudW06DQo+ID4gICAg
ICAgICAgICAgLSBtZWRpYXRlayxtdDM2MTEteHNwaHkNCj4gPiAgICAgICAgICAgICAtIG1lZGlh
dGVrLG10MzYxMi14c3BoeQ0KPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYteHNwaHkN
Cj4gPiAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLHhzcGh5DQo+ID4gDQo+ID4gICAgIHJlZzoN
Cj4gPiBAQCAtMTI5LDYgKzEzMCwxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gPiAgICAgICAg
ICAgbWluaW11bTogMQ0KPiA+ICAgICAgICAgICBtYXhpbXVtOiA3DQo+ID4gDQo+ID4gKyAgICAg
IG1lZGlhdGVrLGRpc2N0aDoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAg
ICAgIFRoZSBzZWxlY3Rpb24gb2YgZGlzY29ubmVjdCB0aHJlc2hvbGQgKFUyIHBoeSkNCj4gPiAr
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4g
PiArICAgICAgICBtaW5pbXVtOiAxDQo+ID4gKyAgICAgICAgbWF4aW11bTogMTUNCj4gPiArDQo+
ID4gICAgICAgICBtZWRpYXRlayxlZnVzZS1pbnRyOg0KPiA+ICAgICAgICAgICBkZXNjcmlwdGlv
bjoNCj4gPiAgICAgICAgICAgICBUaGUgc2VsZWN0aW9uIG9mIEludGVybmFsIFJlc2lzdG9yIChV
Mi9VMyBwaHkpDQo+IA0KPiANCj4gDQo=


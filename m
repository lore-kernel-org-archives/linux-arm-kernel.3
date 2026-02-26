Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2956FFD8FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBusy3UNwvndP4A8XNsI8Y27dkjl68vPbo/mwFPQap8=; b=2pfDCBDjB+N2PFbF1byevQde5C
	luzT125ym1SMQ4ZcAZ4MSRYf1YVQk/cssE1fp9jcpUVZD1hCktsALsL3sjOGeNJxLRrR22Kd9TRWD
	svGnETtITE+RUXXwxKqtDf+zIAPiNRscl9oasFv/RdSGBr9VNmmecPflnNaClfhAmt/2kv7X7ec2P
	WB9pO+ITKcyMtf8/fSKlVBikYwIbfYTUNQIvu9jRXSoaacMpds9z10fgkw9fzCkLCOxzb1opPkwab
	XSpN5fbvH0ItOmYxbP9MKxlP4MYzZJJkMAVBuxOmyqHEzQjB6G0e/9tEXRKY9GmtMsLv9Xoo096Ln
	5ulGbtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd3C-00000006Sh4-3pzZ;
	Thu, 26 Feb 2026 15:13:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd3B-00000006Sfp-1SAS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=PBusy3UNwvndP4A8XNsI8Y27dkjl68vPbo/mwFPQap8=; b=odZvaWj85EJPMFqBzKr5gF1W8s
	oTYi9PXRy5dgmigK9Ym6EHn4XAI13hLs+dESLbhxQgkI2Ori9alsBmZhULhfTYt7J2NZBIi4BMyiM
	qkjB/COXVwFl+jzdyHMDeNIVWvrncfxM7je51hlhGG2ZT7surR5tOQ9co+xqYfzkv5d3Mv974H9/c
	WwIYgyTMdzC2aCyzw6VHSNe+B6GTgzhcG4bjMT+Wglq1ZbpXOSkLerbFWD928QIXVdF2notwtiVUZ
	PYHKU88isrjlFbXBuMP/Uvn+vygzvd29Fk91Np0yB7ee7MnEYN0S8Zn7nYRWOx02S1tUZ85psT2Ik
	ju9mxWFQ==;
Received: from mail-westeuropeazon11010020.outbound.protection.outlook.com ([52.101.69.20] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd38-0000000BHg0-0a8t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cej45FXntVLGRPrEC9paIQNFzJdsOY/TO6fevZweAuFUBCi/VeUIXCATQnpdXSCyWMW1MWH4Yx/xJicZUeMQ9EPJfRuPWzPZmGtcLx1+e0WVRH2Ml4vZ7u5wP2Gp2UkSYNHQU/64+7MlvKX33oiGBjsPuoo/aEV7pmVqCfvvAmIClc513N4aDnf+HraPQZouO6u85iB8gghVwt5bpCBQSIJxuMpV9yz7SzmpoLiM8o60miq1CIa9wnKRcqLFFTxoZpb3c80V79jmBwdYd6FUh5oSm6AQsrpz9mSqt8C5z+SwqKq7epBSTX4gCtdSpp5/fc08WV6MOLfhGSsrL177lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBusy3UNwvndP4A8XNsI8Y27dkjl68vPbo/mwFPQap8=;
 b=lmvLan1gpRxrP5QyNZy5oA0H/Ys29qSYmJI8wvEyub5+OgjRGE74EQaN2qTYnAZ8NrWjYc2e4Oy5dTDnHUxVnq6fNKtLtr0G/OB6/+raDnFbbQxi0JeBT96LXUuLh6cBIx+rs0A9QKLHUqBGgJaDUin0Rg5VZMs0rXFvgVESJXFn7MMPwFG6KrobZDWHMb8o2zFr4cwTUasipeo9g7G8F36wi2NCt87A+jVWgnupfeY7AP0Pj++2FMvJu4SHkWOFXJ3v3CvLMAuwbk48wdCWWCVneAwCUTs6hGSPcALOjDe7CNJ5LRJIh0XWqPZ3+vX3LB1IbXQy4xeDa5IuzGB+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBusy3UNwvndP4A8XNsI8Y27dkjl68vPbo/mwFPQap8=;
 b=gE7f3hLE4WWmy4DW4eV8WBjCdfPLpH1WkEvq9hnGKEqXXGL5f5IrQfWiTl/vFgtRFFTyusIZy8edn5FeFxRa2sfpC6V3S4pBt2set5mDnJ3k2KWNFHA0fYJuNr82oV3frUXwkZoWeRiCGTJq6Q6/h7AVy3BD0uOwNVapEC2svSmwF1/KRrAHEciGUZOvJjfDs9xJPfRZdoM2NysX+iqPaAhoWHjZxCc5mqU0HoIaLQbMt00jnojMBwrBTqFcexui3qBrYAbLTvdwjTuXs2+kC/y0QGFyns/D/fv2gCCv0r2Woukan0kkCxED9sdtPGZ0J329aKR/eYUM6h3IxBeBcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10100.eurprd04.prod.outlook.com (2603:10a6:102:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 15:13:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 15:13:05 +0000
Date: Thu, 26 Feb 2026 10:12:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
 <aaBA65_zLu8S6WMS@toolbox>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaBA65_zLu8S6WMS@toolbox>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10100:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b85acd5-1dc3-4c11-ea9f-08de75498a9d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: oeCPb67GNQWyBxmJRQkEVuEiAgXzd15TG1dAK/3IBW/HfUYgTBsAu+TFPB48s7R945iw0zNqW1D6WZyVMIIgEDaFTmxd4LpJXqm5foyU9LiZk7OjYL7kTfV9nERHUCFiUiIipsuRamzk9JLpWKXXkxii22+QphafjGbCjS1JmWU+fYVH+p1uh2J0jsGUCdqeClL6b66uzfuI8m247FBgkSIzmhhAVIi77LcsUATz/BpAIHyuU56XthBjYT5JbEni95d8dlZuBMRv0v06HSL+JBvgHGzgg63/DWxz9hKYnBd6CJGNFAtodZ50LZB8MXojW1UUPTvc6SGDq1YQWVWjcUAxYOLLEl73pTsB+5Xv2JPWtPub19veqhrZI1kRUw9UPmGuFuMHCMDq2X5YbbX8rrsNsitBOCBFc30Ht/CtazG8Qx5Ai9tcew6ESjF+fZYmFc3YPFs3OdWVUsx8XxYjoor9WQ2f5DXJBcim75CCxCeJhqSJyHpRf12hq+jDVZPgjZMnQrECLyN0J3mbwUfg1HIotOyIcTPFCg8RdP2VKMlRUZiriTfJ/b3cawbc2KG4apkJpeCAuhdP1x6m5cylXmI5AYnefC41+YoHh4xPDfNRHGvsLeTeRy2Sv+xXZTQIu3OlAPunyALTrJr+6DjRGEta1py+uVn11o+oRn7PJO4p3Duh97uweJ8XqmsOYYKBiz5WoExWdSDZODBxOAaacvJk+Rn3jvb3wcTMe8uQnfXGixAwgZIs2VahugHpnW13VCpKqp1bTlNTPGtSA7s8kR4+4DTaBOvIQ7p634djvvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJiWndyVkUzWHdmNGgvZ054QzFPaGJKaU95T3p3eFdURUNRS1lETC9KTHBV?=
 =?utf-8?B?V29sTUtjWEc1aExCMWVYUVlWOVF1VHJ3d0Z6MmZaNzR0L2FmZWZyRm5ubVFm?=
 =?utf-8?B?dU9zN1RPTGNqeHYzeW9xblYvbXB3ZTdHd0VoNlhia0REZUZrbVNpckZOcWt3?=
 =?utf-8?B?VHlOZGNZWTRiY1A5c3kwa1QrMXV5RzVKYmRvSk1pdEMwRENUdGduZTNhbzJT?=
 =?utf-8?B?cTlEalo4YXJseGJXRTlBRDFlY2w4eUpPeklySjZHallvcUNiSkoxL1RxdGYv?=
 =?utf-8?B?cU9sU2lGWk96M2JaQnp3dFUzdGMrcjE4Z0pUem1mUXVJSW44Wng0OXExREF0?=
 =?utf-8?B?MHJmcFMwYVlHdUtmY25CQjNvM3g2WVJsZTVGWDEwcjBZMlJaeUVJZzhXb2FJ?=
 =?utf-8?B?cWJISzhrVlFmSmlvWjZVcW82Y2djR29pa09DT3Z4UWdlTG9wMi9McUE3Q1dK?=
 =?utf-8?B?ZUNEU1JtRzd6VVNJMW1uSWdPcFFFMXp0MnlTSW10M0J2NUduaU5JZ2o0Tkpw?=
 =?utf-8?B?OVk0UzRJRXZEQXFXb3YzNVluRFZRUTZMTnU0aUFzUmFjeitZRnFQUUErSzJx?=
 =?utf-8?B?dCt5dDcvbXRXWkE4eVdWa1FYeHExTGVGcG9jOSsrRXU2NlZTdXR6bjN1VHlv?=
 =?utf-8?B?Z21QZHBlaFRWWEZKdEplNXFLWGs4VTAxemtGdWpSMkszNTRscjhPUEg4MkhG?=
 =?utf-8?B?TGJUcmhlRmNXMlNQMGlSUE9jTTVhMHdTb2VzZTRqSFVCT01RdnFRdkdCZW0x?=
 =?utf-8?B?THVqVS9NZmpFSGdWNlVMYm91S1R2cjBjNFdpdEJSbDU0Qi9sKzZpUGlueUwx?=
 =?utf-8?B?RHc5TWdXcHJ4ZkRmRmhUNTk5eFhwVUhBWDYrd0VPM1ozNG9ueUdpVnpSbXBu?=
 =?utf-8?B?NGppL1FVRlVUSnlPVWZiRHVjcmxOWmZIWTdsWmlyZ2U5b3dRLytvNTk0b2hC?=
 =?utf-8?B?OXo1ZjhxTWhQRU8yUjdkUWt4d3BoMm9CS2FmWitrRW9sbEFISDA1aEYzdWli?=
 =?utf-8?B?ZVRGMHpVM1k3Z0pLMXBHYTZZaDZkZUJGTitqSlRkeGhuNTFmaUloSVBUcDNh?=
 =?utf-8?B?VndrWnVwSjFUR2xVOTJpaFM0YisvMUNGbkptS2wrTGwzNW43Nzl2cS9GZ0pz?=
 =?utf-8?B?ellXME91aWJ1ZEsvOExYa29xMXZ2LzJuSGZGUzZpYmcwVk5CUTlxZ3hMcmlP?=
 =?utf-8?B?S1ZiQ05sdHQwdzdPRWxsd3o2c1pQcDhMbnZLYjdpWEFIRkdCeXRSOWNObW81?=
 =?utf-8?B?cEloVWJsbkV0WFdwdDNzU2swUThGMTdWWVJvb0ZnbllkRk5Cb29qV25Nak53?=
 =?utf-8?B?UEhRbnQyRlEvalFmbFgydm5rbEFLYzlzeHVaMmlNbjlMMDF0RERvMkpvVnk1?=
 =?utf-8?B?dXBsOVMrUUtwZXhObkVORnFTc3hJVUFnbS9yZWJQaFArY2h1QjFJa3JlVnJJ?=
 =?utf-8?B?UDI1MnJsTUhZdXJER3ZqQXNEclZxcU4vQ3ZVNm9CbEhTRisvOUlnZ3ZyQ3ZD?=
 =?utf-8?B?dGlSdi9ndndmeDVuUEM5QWxSblZkdjR5VkIvTHF3c1V3V3ZORy94NGYvTmd6?=
 =?utf-8?B?N0JTUmRISW1EWnRRbldKWVFteTVuQWtSZGw5a3VpVWJEbjNyNUpxV0JBREFO?=
 =?utf-8?B?NDExRTZoQ0ZnWUhmUkpFU0lQMllhZURsZ0o0a0pTbUgvSmdYS2pCWmExaEZm?=
 =?utf-8?B?ME5OU2JZcVZBeFc3ZzBuZW9vL2xLZ0IrR29YeVVtaytGeUZqdFY1SGE5aGtt?=
 =?utf-8?B?TU5QNFU1bFFVUXYxc0JDRWYwcEZvczhvenVkdXJQMDRRRTZCVzN2eVR2czJG?=
 =?utf-8?B?K0EzRjFUZ2NiZVZXalRqZUVKM0VGVzNRcmg1ZVRaWXY2V0dzRkRaZUlYWTg5?=
 =?utf-8?B?L25ZSjI1Nk5aRXM5YS8zQXN2cGZsNE1jbWh0TWJwM1NNbWFNeHlBS0Y0NHY0?=
 =?utf-8?B?L0ROM0I2c3ZjYWZaaXY2NVBqMmJNRHA4MEZ4cjVGRHdwR2NKeVg0bkVpYWRJ?=
 =?utf-8?B?OFBuM0R4cTlBRVVGOFE5MlVhT08vbFZIaURPNUZkWkR1T0pYVHAwUU9IZHg2?=
 =?utf-8?B?akUwaWZKaXZGbHFVc2J2M1QrZklBZlFuMnNyUlNzK3lsSGY4QkxNQzEwTHp0?=
 =?utf-8?B?eTRoamIreENpR3JpUzAyMlFHMElBZmg1azZ5SFJUdVIyUHowZzBCa1VvKy9n?=
 =?utf-8?B?T294d3I2TnBRb1dXZ3BOd0Y3YWxsZk8zM011Tlp2TEdBZXFKTUJGVVJIVVZQ?=
 =?utf-8?B?dWpqOWxac1RHc25TZHVnSjUwd205YTdpZUdWa3NiWWxTWU5YeFFvZ05XRW55?=
 =?utf-8?B?cDMxSTRMOVd3RlBHck5XakNaM1pqUzdGMzExZm1yVkNEOGlzaXBGUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b85acd5-1dc3-4c11-ea9f-08de75498a9d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:13:05.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZV/pWIUomZwseSjEYF5V7X73x/y4gu8v3vEXuTzRJyZPHCCwa2IPFXvrbohDg5PEHPjB9xw87szyPDGMje0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_151310_320787_CA5F700F 
X-CRM114-Status: GOOD (  53.00  )
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

On Thu, Feb 26, 2026 at 01:47:39PM +0100, Max Krummenacher wrote:
> On Wed, Feb 25, 2026 at 12:51:32PM -0500, Frank Li wrote:
> > On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> > > On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > > > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > > > Hi Frank
> > > > >
> > > > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > >
> > > > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > > > > >
> > > > > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > > > > again after reverting it.
> > > > > > >
> > > > > > > Although this has only been verified on these two modules, the issue
> > > > > > > is expected to affect all device trees using the gpmi-nand driver.
> > > > > > >
> > > > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > > > ...
> > > > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > > > [    0.960500] ubi0: attaching mtd4
> > > > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > > > > ...
> > > > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > > > ...
> > > > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > > > > >
> > > > > > Can you help found the real reason why not boot?
> > > > > > nand@0 is preferred format for MTD raw nand.
> > > > > >
> > > > > > Frank
> > > > >
> > > > > I guess the root cause is that the driver for gpmi-nand predates the
> > > > > update of the binding rules which want the nand device described in
> > > > > a child node 'nand@0' also for nand controllers which only can
> > > > > control one nand chip.
> > > > >
> > > > > While it is possible to update the driver in the same patch set as
> > > > > changing the device tree to understand the new dtb rules, maybe even
> > > > > falling back to the old definitions this likely breaks other users,
> > > > > most notable U-Boot.
> > > >
> > > > GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> > > > boot problem?
> > >
> > > My concern is that the new device tree (with the nand@0 subnode) is not
> > > yet understood by other consumers of the DT sources, e.g. U‑Boot, older
> > > Linux kernels (before the driver change), possibly barebox, and any
> > > other consumer that relies on the kernel DT files.
> >
> > I understand, but we need move forward. we can keep both for transition.
> >
> > >
> > > Updating only the Linux driver to support both the new and old bindings
> > > therefore solves only part of the problem. As long as these other
> > > consumers do not understand both bindings as well, we cannot safely
> > > update the shared DT sources. So I think the commit needs to be reverted.
> > >
> > > In addition, the proposed fix in the driver is likely incomplete:
> > > with the old binding there may be child nodes (i.e for partitions).
> > > 'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
> > > a node whcih is not the node that actually describes the single NAND
> > > chip.
> >
> > I know it is incomplete, just want to check if it is the reason cause
> > boot failure.
> >
> > >
> > > An alternative approach could be to update the binding documentation
> > > so that, specifically for the GPMI driver, the older binding is also
> > > considered valid.
> >
> > Not easy to do that, I try many method to update yaml file. common nand
> > flash detect node node "nand-controller".
> >
> > > Once the driver supports both the old and the new binding, the old
> > > form could be marked as deprecated, but still allowed for compatibility.
> > > This would avoid breaking existing consumers while giving us a path
> > > to migrate DTs over time.
> >
> > Needn't revert all, just revert delete part, keep both to help migrate.
> >
> > anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NULL);
> > fix your problem.
>
> I tested the following on Colibri iMX7.
>
> kernel 7.0-rc1 and DTB are built from an untouched kernel at commit
> 7dff99b35460 ("Remove WARN_ALL_UNSEEDED_RANDOM kernel config option").
>
> kernel 7.0-rc1 patched has the sources as above plus the changes you
> propose to the gpmi-nand driver.
>
> DTB-reverted has the sources as above plus commit 8124b4a4a96b ("ARM:
> dts: imx: move nand related property under nand@0") reverted.
>
>                               DTB        DTB-reverted
>
> kernel 7.0-rc1                fail       boots
>
> kernel 7.0-rc1 patched        boots      boots

Thanks you for testing. I will work a formal patch for it. Can you help
rework you patch, which keep both properties, just revert deleted part
and keep everything nand@0, so it help transistion. you also start work
uboot part.

I plan give additional 1 year to do transistion. This type layout actually
exist for long time.

Frank

>
> Regards
> Max
>
> >
> > Frank
> > >
> > > Regards,
> > > Max
> > >
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > >  {
> > > >         struct nand_chip *chip = &this->nand;
> > > >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > > > +       struct device_node *np;
> > > >         int ret;
> > > >
> > > >         /* init the MTD data structures */
> > > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > >
> > > >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> > > >         nand_set_controller_data(chip, this);
> > > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > +       if (!np)
> > > > +               np = this->pdev->dev.of_node;
> > > > +       nand_set_flash_node(chip, np);
> > > >         chip->legacy.block_markbad = gpmi_block_markbad;
> > > >         chip->badblock_pattern  = &gpmi_bbt_descr;
> > > >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> > > >
> > > > Frank
> > > > >
> > > > >
> > > > > So I don't see a quick fix other than reverting and living with the
> > > > > dtb_check warning.
> > > > >
> > > > > Regards,
> > > > > Max
> > > > >
> > > > > > >
> > > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c3 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "disabled";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c3 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	#address-cells = <1>;
> > > > > > >  	#size-cells = <0>;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c3 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	fsl,no-blockmark-swap;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "disabled";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "disabled";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	fsl,no-blockmark-swap;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &i2c2 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > +	nand-ecc-strength = <8>;
> > > > > > > +	nand-ecc-step-size = <512>;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > -		nand-ecc-strength = <8>;
> > > > > > > -		nand-ecc-step-size = <512>;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > +	nand-ecc-strength = <0>;
> > > > > > > +	nand-ecc-step-size = <0>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > -		nand-ecc-strength = <0>;
> > > > > > > -		nand-ecc-step-size = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &iomuxc {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "disabled";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &uart1 {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > > >  &gpmi {
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	status = "okay";
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  &snvs_poweroff {
> > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > > >  /* NAND on such SKUs */
> > > > > > >  &gpmi {
> > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > +	nand-on-flash-bbt;
> > > > > > >  	pinctrl-names = "default";
> > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > -
> > > > > > > -	nand@0 {
> > > > > > > -		reg = <0>;
> > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > -		nand-on-flash-bbt;
> > > > > > > -	};
> > > > > > >  };
> > > > > > >
> > > > > > >  /* On-module Power I2C */
> > > > > > > --
> > > > > > > 2.42.0
> > > > > > >


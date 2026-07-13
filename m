Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C035DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGUnimUVmw/IW6hyDI/e/1VIVCj1FWo4tmeVoEy3LWg=; b=MpF94r6kF3gC3/YXhZqhnVVI4I
	g6w+HZhn2fE1Ypk09tsg8FB+8Kkd5wbudNBQPeCQdpBYYJ1Lmjwvt1YByP1mMzzaM1friStl7rGnu
	B8y5jqhaLBK04BMOORF0wRUvl/0etlbBAByadbS1Q2DlhYotTq5q2ChxqvzA4RJix9VEml0IdVeFT
	Ff5gvqHvQzQwFz/DopQt2bsm2QWAstIRwfxAcom9iUSdxc5naTsNwFPUNEvjLKe007DvQ/7fycIFX
	GVMYWhG665rZxQ/JTei/2bEl7ZsxtSTk7GKMHR77HZ2oAecGOpIGTyVvgsimqC13g7EUt1FYP4+14
	2jVYnd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIew-00000009nsV-3heI;
	Mon, 13 Jul 2026 15:33:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIev-00000009nsP-1ex2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eGUnimUVmw/IW6hyDI/e/1VIVCj1FWo4tmeVoEy3LWg=; b=nDYhO9orEXZXwOcI01KIus0sP0
	kt8nN4nYfslKn22aCuno6o5UlmF2+qooJRysqbiWxP90BCx5KckTP7xBWMeH9+YmLHb2Yy7mmNHgM
	jusUBI3oXNAdQ5sfn6j1uVAJ25aPMcYeTF2NMZevWrRINk3RLPjDV/ZHzQewLvkXFXS0lD4lrx9Iz
	F3+FbU7a27abEVn+HiASzuQVa0M1gi8uIccpJzfF24/DsNVNZz0E2iSKTK5eJFSNtSj0pAEvgUevk
	hF4tbGGmDp/VGP5u91niOti0cY0yx/OqCuzgj2rSi5KflaCkz/deiU4y4aTNTPyx0r1kTcC2EtkcK
	XrwAPhlw==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIes-0000000Bmd4-1312
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXJlk4N+REE6Qs4p6k3hZI196+1k6HPE8VlVMy2BZqweE9y2Zih3iQstxRqJfkfH3JunC86qOylI8fmk0mpgand/bBG9vyFMrhonu4xjOegzR4+ZpOCktEPAI5EVrovvbrFQ7PBvgvGfkfVymugqG8pNjKm4LomjqZmeNYkRqcy1v59Jpxk41LYSaTc74bEgzLDMDH2EgcwIqiYs6MO1P6o3g2T7S0DnZv4CgnIlQym/HsvzQbvfpNTbvJBB0vDUNOEBtfIWE3EHDnv7C3hhNJLqPCwJQZPkjnFCPH4GaYSyQdH/b8lghGKSh0VkgOszz6itiU4nppajunz939D3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGUnimUVmw/IW6hyDI/e/1VIVCj1FWo4tmeVoEy3LWg=;
 b=YJQP1XtiYt8EcNnPWvc5z59AetrfFlIKQGA8UuBiHWoOA1t4ceCo9pZuLiDOBCEorU4BASYWRpQ5fagcSE6loKsCK2Uy5eoHbECgUP6OvAeLsu1Z45YxNsbddJL27qWKY4eIMaAQTOWoUcFZ5mw3KS5lgV9A/tH6MbsKD5z7t9uSVmqHyRHLqAeCPWcEjAasEfzKSqP7VYxvAE0fcIf75HxdBHI1XLAf4dPAWibGWfrVXE+ppyEir4s3rA+hK8x8Tj2JkBf2Vnm+1p2fOxMHi5v+Ut2mD1YS2TWilfSmvDPq3wwjq4V+HUKkOmyGjI5hGLnp6c+vCB85Y1gb7AJHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGUnimUVmw/IW6hyDI/e/1VIVCj1FWo4tmeVoEy3LWg=;
 b=DmS3z5isuckjuEmcYG3RE7KmB4loNknARkJp38p2O9DLfpdV3imbW75BKeLKbfCr0Y5MJ8VelQYPs8katvV7p5JIZxnYQioCuncUpDFvYVMT8E6SNtClSVKJtk1FlaD6umTBR5CG+ItWkL1UHjcby1/i6mCNxpVLsIKE0eNJtdlhWYH9GyewWxWS6xdxgpHeARHcaBixHa2o68oqhSQSF8HD/VObos5xpnk/DWwPBi7co3pxMs55gfw7Nx9SwYW3fg1cXSD02crIauFytce5gtCU3qO0TeoOFRy3vXA5Il6bCDcmEofZ1AbRhtSX3bCupB0Sf9olTBvf8S7Yh+IggQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 15:33:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:33:20 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8: Correct indentation and whitespace
Date: Mon, 13 Jul 2026 11:33:12 -0400
Message-ID: <178395678837.411982.12697408544791228359.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:510:324::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdf6ec0-1e9b-4d4c-b7ea-08dee0f4113e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: OmUt4qbKMdV+AnIjuXiufkx9XpeznT3z5DuYWHnWpI6qzbNdowcWdixy0l5/ErpwxN6pCFUCoV2tkzeYbAUTWCH/znkotWzVzVFPg4HXj3KqSg/Xc29RboGEj+A0aJLxY3wgK4OgkiiK6YY7hQ7N6f6QH8jRgMC9CSEp/UYtBx0qqApUccQ0S9m1xpXTIybnULV0hFEKiDN5WObAstDYpauFOgNhpohjkNOAvgh/6EwE0o1pY+7DdJ8zDXX/BCAu6ociLCBrGKOGtbTPwAdeXnvw3/9lZCqgTfPu8M/ftt/EwWTLn9WFvaiO07rpw60AyrAVki+T6esoLZ2nkLMMPhnOOu+u2mrBin0axuTT9MNXo7AKFQQtfKKbNLH1QflJ47z7odG1Hy6YWi06ePGMZIBqr18yWk6T3RRkgjEn7AoWlzMG97SmZZqL7+GBdVyCh+oFB32O6vH7zoPWvZsLXGyZ0HqWPSCUFkmpDnf9cHMzWwyl9/KvQsZsfMR4W+22opiGAkOcX3NF/mYyo5K5m0hZ7JgIyVTojcVKKRLGJSAlBUXS/fbqaqp+w/ffCk08CuGlnL/TgjTvBSLiOvKsH0XGfBHfTXSIO5+bQ7Ogl19le2/ggffhVOkQ3x5hNNZ+lV/H8nbwmXgGw3yJIjSVIvSOBi0zHvbfLSPIchQZ3R4EyjFQEo3O1dGsTMr/rt0EAa91Xj0W7YbSAeN12SgRAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dyt4aEZIdFZoNkFlbUVwZTVGQmZmelAzR2VCOXdCRHhGdytKNmt6YlkrT3h0?=
 =?utf-8?B?ODdWdnNKMExUK1NQN01WNFdoSm93NjY2dkZBQjU3MXNKWlZ0VDRkUDRrVk5m?=
 =?utf-8?B?RDcwYXBnYUM5USs2bVRKWnFaZVFSdVNFdXk5b28rbU1iTFl2L1dXRC9aMjZi?=
 =?utf-8?B?a2I4azR6NEpRMnY1Vmc2dDRtVUYwY21hbVc1dWE4YndXaGtpd05wUk51UjNq?=
 =?utf-8?B?bXBkWEIzL3pSQXhnMXMvaTJWRGIyR2dmYjBFOEk0SWdUdTRuRS9yQ3NsYTZB?=
 =?utf-8?B?WXcrN3UxV0Q3L2xJZVN2Kyt1NUU5U2Q2VUJQSXEvWU1zSEZ0bnBZWGYwTTU3?=
 =?utf-8?B?SWprVzJuTVdaUXhjSGkwZ1NicXpESU51bkM3c1BSUFVzakpaLzlXQUZ4V253?=
 =?utf-8?B?R0gyTThSTHZ1WW5FUDUwbXNIMWpab1grb0FBUVNoZWZ3RWZRS3dHWTNhU0lT?=
 =?utf-8?B?dllZcStFOWwxWnkyY2NrSEVFdk82Q1BxeVFMZzZZRmpDcU41SGFvNEY1NENZ?=
 =?utf-8?B?OWtkRks1blJ5Z3d5Q1VBbmh5Z0J6TjRPMk1XWUVIby9OdlRNc1psa0dtcEgy?=
 =?utf-8?B?U1luSEdiUXNNM3hsODZtMEI4YUFJTEtpZFJqKytEblJkT1pJZ1NRa3FRT1lj?=
 =?utf-8?B?KzFDcGp5SnZsREhWUHlhYzFxN0U2eG1LMUJDNVlXeUhUTGR0VktFc2gzM01t?=
 =?utf-8?B?dkRnM0dETzVVK3E0bnp5ejJ0TVpXSzQ0ekRkZzRDOHBLQmlQeno4dDZGOW4w?=
 =?utf-8?B?K3hXN0VNK004OWlIaE85UXgxZkRoaDNndGVTS1JYN1B3T1M4TUI0bjVqY2NM?=
 =?utf-8?B?K0NOUUZDcitCVXo3UDRjNjJoU2V3ZWxqR2g4RS9YVkYyOU5JdHcvcUZmajc5?=
 =?utf-8?B?QnBJVlRRTDJhZWJ1MUp2UmQ1cCtJOW5mcFhZU0ZIZkdHVXI0RXVFZUFwYm5F?=
 =?utf-8?B?Y3pDNXI4NGdDNWdIeXB3WlV3Qmg3UTJWU0RCdmFmREVoNVpTOW9BVVB3MzNX?=
 =?utf-8?B?aXZOM3lyN0JvNmw3MGJyaWlNaVpMR3EvVlNqUjErd2VHbE0zdnFXK3NBZnlT?=
 =?utf-8?B?MG0zd0kxa1VVZGt2TWNTUGdOZnZSbEJWdjZWc1VLcmJBblhBTlBnU3BmUXlE?=
 =?utf-8?B?czIrdVNGTWtvNkFrUGNuRkM4aWVCL1VMRHRvUUVBN3hQY0Fjc3RRVGZEcE84?=
 =?utf-8?B?K1NmbENwMmNodVd0eEthZzVMTkN1MUcyWDZQVUt5TjR2ME5IeTFEaU9idTd5?=
 =?utf-8?B?SDZCa1NieUliNXh4VEZPcTBkenpOcVd4ZFJ4by9tdkJWeTNSZEdxTUcyZFNs?=
 =?utf-8?B?Q2hFZEEyUGJQbmcvODg2Q3loSGdCNi85SDBsTW1Da0QzdWFsVFRxb3Q0Q2RE?=
 =?utf-8?B?RjAyVHNVSGpBeERqaXgzMlZiK2JMR2xFWlA4VlRpa3Q3cEtWTEc5QWpCcS9R?=
 =?utf-8?B?aUVsTVdGUktZV2lYQTN5ZUZhUllObHh4UWdQUnV1NjdJQmc3YjRjQjU4RjNP?=
 =?utf-8?B?c0dQYVUvb0JJNHNXZER5c0d0T0tBOFI3ZC9PMFdxT0tLWkZZYW5oQWszc3RR?=
 =?utf-8?B?ZFFMMWJ2UU9keSt6SVAvZFVGZnY5MkdTZ3Z1dmxPNnM2ek8yNzY2YThXb2h6?=
 =?utf-8?B?WVpiTXlsNEdxeDdGOUJiUjNSVm1CNHpaTS9kb3NGWUVRL2xRak16TjVUMmNG?=
 =?utf-8?B?TVVqSVdXMVgzNVV0R2RwUmwwY1JkUHhMUTBMbG9TekRlNXhZK1FrWmdjUkZN?=
 =?utf-8?B?Z3hic29FbzFMb094YTJHWDAzM0hsMDBFS3phNGZCUm14R2UwTDE3NTZxdGI4?=
 =?utf-8?B?eUF2YkxNaENkcUFRaWpPZ3UzaVZ6UEJUei9NTWdUcTNQVXl1MXJSd2pSSGZD?=
 =?utf-8?B?WTV4SXlTUFZ2VGlidndXcWNPclM5a3RXVWp5MERMSEpLRVo3RlNBaVAyMi9G?=
 =?utf-8?B?Q1lYMG9MdjVyVFJMaGR2L2dSOXJFQ2JLMnNPWnI2UXNISVQrUDJJR3J3dmZJ?=
 =?utf-8?B?UmdFQU1hUzU1UVNNQUl5VDZuNmlSVzFRTi95ZSttQlZrY093clpURktZd3JO?=
 =?utf-8?B?SjU5bkx4eFpNWFpFQXZYcTJSRDRWWVRneHlJUW9sT1pCekpjeWkzN2dhWG5h?=
 =?utf-8?B?YU1ycnBSaDhwT0dPa2E1SVFMQS8wM0VZZzNFVy9oTlVyck5DdHRnSlBMc3I1?=
 =?utf-8?B?OS9VbHlNZ3lGNnRmNGhmUnRybnR1a1oxOWppQ0dDdmQ5TWFWVml3RUptcVlT?=
 =?utf-8?B?OU0yV1VRaGlXcmZuZ3BuMnJOaDM5OUZROXJxWm9BZkp1b20xM0RJV1p2a1B1?=
 =?utf-8?B?R2F1OWhsL3FLNWV3V3pHTzZCZmhuNE4rRlVJYnN0YzhEUVlJM3RCVFRzMG9r?=
 =?utf-8?Q?bVr2ZKkIquft7wmLyF8F1rKKxTTqrHJfDsDeG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdf6ec0-1e9b-4d4c-b7ea-08dee0f4113e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:33:20.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSyasB+iBHpe7J0y2U96/H+smkuiggQHGmgrFT3GEr3Ow9UFds/69UoH4rdeHWwFk7ESCnOUCeP96sdcVESCviZl1YbVWdYXMpgU6aL3/QrNjnVTx21GLHbyjReZXxYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_163326_441593_A9110F4B 
X-CRM114-Status: UNSURE (   6.29  )
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

From: Frank Li <Frank.Li@nxp.com>


On Mon, 06 Jul 2026 11:34:31 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).

Applied, thanks!

[1/2] arm64: dts: imx8: Correct indentation and whitespace
      commit: c8cb123cde467117f69ae57f83bf02d374f81609
[2/2] arm64: dts: s32g3: Correct indentation
      commit: 972e858b01fbc724947f8ec825e0897e545b380f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


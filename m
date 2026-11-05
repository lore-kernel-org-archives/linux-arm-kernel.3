Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89C606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 03:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GDWSPzcI;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QpDPAb8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=; b=GDWSPzcIg5ody44k0XEEIDBqRJ
	sdjKItEtmd+OYf559QOzMFIxYqu7bHLXPiGwAmZD9t7iiYWPB+iZlBC89GKCzf8kxczt40l0MFvSo
	up3kFo01e3vwKWLNo/GHSotCRFNyauH2mbXQ1pZemWQJyfQFrtWoN1hta8xs8JAn7yC1Oh9haD/xA
	YONBgdnfHhTyB2hmohIRod/oZrDCW8OyxfIo0ft9OzDwqYiJUnCTDb7D+THaRBuzS5fXksIj4T4a8
	yJHaGERw66tEOhvrM+6QENkIwsl88rtcbJyP0dDF/o86XBQzAXPrsLR6e7aC3Ll2kH8Q2ujAxjMUC
	lv1FMIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOobO-00000007ilF-0abk;
	Thu, 05 Nov 2026 03:57:28 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOobK-00000007idz-34Ml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 03:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc6UGUvy3+fhQXVY3kyXeMzMKx2WCZNNIs+FUxXl5b6ONTMESHiQUtvP4SA69zAC3DWrpg0ftMyZ6aHx+ZkI+5UEzt3uRTGp/hz7/eM2qTzXKN9jG4Lo/mYBoKXj1Hbsp3C29KSgCTZVyCtHzHfaqX/uXT3dUGr/lE2oYoPV5sBQSp3rJpL8asW8TCOpx/nmdwcXabz28pikjRm4FAF5ywCFJb2LVhyLmmJbJjx/qrNkKQ2eq9794KKP5TJdcZQYg+lxH/Ohb4NYdyPu71emAQ9Jppt+lzHHn3r1OAVe12qUQKZF3CtwYIHkoQ9usJuG0p9vueBS/6ZmFnd6+XBJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=UxTVCUdbhZP7Ob8AYmMMsEUCXjxziJyZSNqWOH7fKrAydPNr993z67wENOvLpVSmEfJuUp5WnDJTuc+wAh6T6Q1MAdK58iQARV4OGaTIhkbWwhNwCyWIWJFI4rDHWnpQHjt7X4cdbwxw0/EDceiPjRrj9wVjjeErdVIXuQ7+FoHbjLPVP/A0q5rTBC9ICgKgjuKtaXD4NPmdOhDuPnI59ifGGc6e09hCiIfnfXaNmVlRAOdL7eiAmdxO6cAKJrjCV54w5Q1M4MoRBY8H6iaKMCTm9PmL1fxH+Env5rOry73z/7s2tRO6ytW6sxdscjZzBfLFJ1gMVMs8jPLMO14xVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=QpDPAb8/6efgQ4h1M5fpHlpO/8ED6ywqBNaJAA7RR9mxe8U5L4mcXVaFzaQsIvGviCgZM2QX8r04lAjBvx5IrVRreX8eyb9GuJEKuI3OExVTIj3WZ0QOnPrRReiTVdxpFowm/XslBjxv2vxqeKHdWjy4mwFPQQZcfyXmypLv1PolwtwfTUcJ3w11lp40GsxNqOwYcunPhUM3x5MKGMnalRQscoCb1HNxlu3I8/vwZ+zd6JiEuc9u9gujGrky/cFea9jrcX/tFoo+TunmoGAGp1MAQ4RGxBmM4J8XGG6P3hqGpbZw9t8nivsT43ww6upcpmvu4C0WyL5E/E8COSVnWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:57:19 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:57:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:07 +0800
Subject: [PATCH v3 09/11] arm64: dts: imx95: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-9-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d57d91-bac9-4c0a-5fdc-08df3af0e34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: bNstN2EKdjvhN8StLYDO/Z8tjjsTzn0sdrBdluLADjeU7FnbqQ2wJnGuMTL3hVFeBJO7Yohh2lUI7xEYu78SOj4JavvIWwz+Q1kPvZLWRGc+SGtpic/w1EGkVEdALFi6UN4RnppGffhBYDvfNPCqQmwZF2PA9TxFChyn4CDLaelIVwxU0BpASsuIGdtZBZcSLJD2XHMt0HVYn1lUDgwCgerB/7SJc6v0P3bgtNP2hDFo6Vrr8yIwQUR4Y1jkC+UrHiTRY7HJorCfV4tfz/06FoeJprI2jiKLkoN4D+qsZZf7Q4hbraoMQ6hTON7jUveOC6U91eIt8vVVIqUiDSACDH6y42MMQNoNaAQGcPU1ScnDDZ8iAI6orsdSlymd6DrlmMakeDUOD3i2K+wQBqKpuhfg3zwm6MKUU3RqzMjASR9Lxox4L5VFSg00QuyzTar/yYmzPs41q/1oDfkMEccUgTUOetNtZOEnv7bCtCn1Hw88CdL9xZjY11cYPaB4s8+uEdwEjv5nJyK3IVuxTzWMNyp91ody0qvARFWvw0Br2cs6IvkD0njRO3/+5OZGhEeeNWcraAckgi+VTNQCYsHW74r5IHK5IlDnFEWZUcuKhgaTxHOt+N5Mh2nqlXoz9k6v07J/Ejzi7fZxCocDb8O63Pu9ebYCqqlqJgaMU23vko/aCZXc7z8dnGuHSORgGx8uu9FZlbTiF1bXOPO99n4BLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1KV0c4L2NxYzY5ZHFqWEZPVFA5bFhSaTRQNm5VWHlDbVo2dG1BZ2lQN1FN?=
 =?utf-8?B?QktWaVUxdjNWZlBNTGZoc3pDR2NBUmFnS1BGTTRCcUU1M2VFRDM5bjdXdXZz?=
 =?utf-8?B?QXYvNlBPdkdGdXp5UmlucGFON0xuR094MllHK04zcDgzNXg3aXVCTFdGNXQv?=
 =?utf-8?B?STFlZUhxM1ZDYWp2bmlqL041RDdYYm50OUI2UWZaajZWbjdxeStZdmFzcXlE?=
 =?utf-8?B?V2JwckZpSXN3bVVwMUlCajI2V0xKamNCWjltQUhpZ0hDRVd1VXF1bVNjb2pq?=
 =?utf-8?B?U0k1VEo4WnRRZTRwQXJ1bzdOS2g0b0ZHUUFoU3lqZzhDMlQvelJrVlFnM2Z4?=
 =?utf-8?B?UUkveDd6Smd5YXJNTS9VZnYvQU01YlpzbjlLYmE0ZnAvcjJ0ZnBCaVU0Sm1n?=
 =?utf-8?B?MWVaUUQ0SC93WGdzbWtocWIzTUtFd2tRYXFEbzFWak55RmFXT0duZjBtUTFU?=
 =?utf-8?B?UGRIR2hVQnVMVWRZZnBxYUlUNUp5U0swbFZFMExiRXlGRm1nWGNSQ3lVQVM4?=
 =?utf-8?B?UDhLS3dQZDFVdTFsNjNwUjRkSXZYR0NmeE04bEY5UnEvYkRpZ2JCUkZwTi9C?=
 =?utf-8?B?dGZ3V0Npdm0wb3hJaVp3dDEvRjdsT0RwTk0wRjYra3hCaU50YlRwTjIrMjFy?=
 =?utf-8?B?TzE2NWcyaWZtNkVVajBiSXMydTR6UGFiR3lobFNyMVRBNXhSUzNZK3RzWFhN?=
 =?utf-8?B?dWxxS2d1YnlGcnd1aGkxY1VRclBzWWVrS0pzK0xiSUVWWml1eEZON3Q1QnRQ?=
 =?utf-8?B?SjhEM2Y3L084ckl4bEhXdmdNOU9wWE8vR0l6R2dFZlNTN04rRXhjNU1TRU16?=
 =?utf-8?B?YVd5RzlzTm8zLzJFd1IzM1lyNjQ3c0ZoZjdYZXo4R0Q1dzVSZmo1RFVCdEVI?=
 =?utf-8?B?aXZsRThDZXVlb3cwdzRoZ2dCS2FuT2NUZlY3SjNsK1dobEVwdGZJNkNZM3Zm?=
 =?utf-8?B?UlFBMUxLNDVvVHhMcElxS1kzd0I0QXlrQWJ4Wjdma2FpMnZscFFQSVBmczF0?=
 =?utf-8?B?N0ZvcDdnei9vRTl2UW9sRGg4UTVCNkc0TDVPQUl3NGJzUHBIL0RHbndmSGpO?=
 =?utf-8?B?ZXJ1Zm5mSHFnb2lPNTk3ei9Ja0c1UGVVUW5IM2VjVWJZZVFPR2RmVUwxRHV2?=
 =?utf-8?B?cDliRHB3M2RRQ3MreGZ2OEhGMjVOS2hPbGtXaVBVN2huWm1uMnpGaXZnNW05?=
 =?utf-8?B?bzd5NjJyUUJxeFoyaFFKdUNKYlhqaG1MWVBQNEtKdGltMG5KcWVndkcyaS93?=
 =?utf-8?B?NE9reGQ1a3BIY3Z1MCtDdWI5WjNaMWp0bXFQeGUzR000UXpQZm1pakIwdXlm?=
 =?utf-8?B?Y01HK1RYb1ZCdWM5ZVZTblNEOUdLMHBVMUJyZUJVTFRoaDJyL3pSMnlXRk5x?=
 =?utf-8?B?eHo0RWRqNkFGampOa01ScEJNR1FYSy9CMVBjdzVHMjh0c1JCc2dXR25ZbnFX?=
 =?utf-8?B?d2FySnVkRU9TUlJ5S1R4dko5VjN2Wlc5MHFVNmsxNzB1NHFmWU5PYW9qZTBu?=
 =?utf-8?B?MEFad3RpYy92NmlTSklabDExRmRacytmSU85WEF2d2tFVXR2a2Vra0JjZU9S?=
 =?utf-8?B?dUVoQ0xYejNkZCtPT3B4bDBjdFFsOHFjMEdTcmQ4alhUNDBTL0NRWGpoQUwz?=
 =?utf-8?B?eEtQd1JwZUJVVS95ZGVDYWRjTnQzTDhOQzU5S3QwckhYY21BQ1V5M1pKMkVl?=
 =?utf-8?B?c2xIcnFjVzNKZ2NJNlFPTDF3SzRwVTZLbW5nUnpNeGRMaFJzZ3FZYVN1ZW8x?=
 =?utf-8?B?ZTNKc1NQWFZFeVlXS2tyQXBzK1llT0ttRXFYWWRjbDY0ZUx5V1dXdmJSbmNy?=
 =?utf-8?B?bmt0RlF4MG9FaU5ydHFlM3hJR2VQZC94TUpWZ0RSbng1eXMxSGFzenhFM1BW?=
 =?utf-8?B?U3piWHJNZXhKeTZOanlxSExFdWVNR2U3Ky9VNTh6Y0xZdVNJcnBkTzdGaEh0?=
 =?utf-8?B?RnhvdUFmSTk0OVRkNHVwWjk5aGNtajNiejFjekc5dnNreW9lemdhYU9vRlBl?=
 =?utf-8?B?aCtxTE5zMzRNUU01YW05NHByOGdqTVpSU3h0NXBvUTJSeWhWb0VaS2EvUWpQ?=
 =?utf-8?B?NUVweENVWU5OdStSU1Y1U0JrYWtIRG92RmxzdG5VN2NhTmcvVnlHWjFzeTRo?=
 =?utf-8?B?MXpqd0hGdG1ZZTl6ODdOS0hRTGg0YThhZzdGbWJ3SENiL2dEcTkxY3o0SGpj?=
 =?utf-8?B?U3NoNERYemg3V2p0c3R3SUFPNFVveUN2Vng0N1FoUXZXVzdYT3FJTWsxcmx0?=
 =?utf-8?B?MU42TUkyZ1lGeVh3cDVEekVDYzRLV0duNUNKaitLUHZ2eWQzSGQ2RnBmZXFF?=
 =?utf-8?B?bmVqdTN0S21nZDZZZ0JHTzJJV004bVBybWVtbzhBcG9HYkQyL3U3ZkZpdGxq?=
 =?utf-8?Q?un/KBACz0xxLT7tjrnKGzAEV98Y8VL+xIFwfl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d57d91-bac9-4c0a-5fdc-08df3af0e34a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:57:19.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XntOb7tjeLV/pulncjsAmDDNqNbHCY8feNTHy/KOzSo/PmoeEZ/lP0iFK6x+l7NJWt43Q0M3eaKefsqlTbItkflqbdJGs+4gx+xdaET6+ZaJvN92sf3LEK8UFcS1ks5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_195722_790075_E9184D5A 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 69.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf

Fixes: 5e3cbb8e4256 ("arm64: dts: freescale: add i.MX95 basic dtsi")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d20c2498b9aa..0398de491553 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1300,9 +1300,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1316,9 +1315,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1333,9 +1331,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
 			ngpios = <30>;
 		};
@@ -1349,9 +1346,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1689,9 +1685,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_M33>,
-				 <&scmi_clk IMX95_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0



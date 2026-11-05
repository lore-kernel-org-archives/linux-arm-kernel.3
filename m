Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66783606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rt+Ygdp9;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ROMKwe3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=; b=rt+Ygdp9+keJiC
	McuP4fQ4/e3hLITBuUcf9kf5qVw8ZWe8xeWCTboHkN9qEovPvY49RSSClhNSNjzGAkxFhjPdeUBoZ
	2lhy83edBJ/G1AqssEaeLIb9TN3gsSN7UUWOtkaYi06LBn0vl8cDEMzADfz1coaFK0g74R+XpbhM2
	mPJ0efni4Sy8WH+U0jfVMh6glXVdN5+oR73EG3ZV5wzGDgHHMq+1AqWcykQ6xyLaPDdCi8QLc2E0q
	iYzbQb33bvK1udw4VCl1lRbBWBJgIvHBmh+9tSMgh5WKXiiii/5lcIztx1+Knm8XhR7x6Tpl5eN3T
	MSq0HpbtYLhqVILsvPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAt-00000007y5u-047j;
	Thu, 05 Nov 2026 06:42:15 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAi-00000007xzk-1f6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnah7lak29lfvWeOaJ289EZWG96392LnIs2eo3WaOSApiroN31BR33/aTbDgOrWXb7TV6MlhAcJVWjdjd09NdLr/RlMMrApvUK5R4LRtWKeWatcjuEwSDCef2uVhc+fjoXgnEHFvgwd2tLUGsnW+YkO2sQj7ZhvD/+fFY1ANhdYLkzJH/MgLnOxUX+5FxDybKfzVw6bN9OXypV40KAwJaiELk647GUfpDEM0HII+0MZljo3ekYZ4HpzHLvEmK7H0WcJ8/ZdfteRrHobqg9Uw8Myu6ub0R3dmx8JTAHvm/1NjgLc9eoEckihK0zhkMs726EP5H0wWeiAoiV/YVTlVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=A/XtnmyFE2I4uhTu5GRftow9G9sh3mAcygJ6NguqLcmYLlt/OII4315zN59Frny1BF5xfiV952StxwpGIlXkGsJTVdWYm0o8/cU989/REdmoRo/JY3WBfevxX6hLY9OCdM+d2xuwVAVPXh2LWX3ix+Az0LGjecMWkWtOSL64A8cMLwDs+Tlh4RZBgiu8Z9k6ilfIhUdAPkDDoU+A6SjbLeBkPiw5OrBV1yFq47lqpXdlP23I1pLK3DPHI8eO9SkYbyupAooGx2aChftCdXJZJm4qwgTZowex/6hrntkdRQ26vtyEjT3CEGgAwe+Zw+yzWCqmKCIA04u1Nf7G3eqhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=ROMKwe3WkzqU4/ymktodsDulkt00TL/X4kDr0rYLp+/BCH1Td3lPB6YDCJtekV8i522ZI6BptDpIKQXu7/HO6KYRZWleRTssC8gDupwIzO3W5H+XIc8h2Rw4SpwcyKLEqqJdeGrkDzBdFCI6v5Gd/qURfZ86CX5S8/aglK87Ff1eObIRrNh9Rokxou/9FZPnELbnz94D9GWAzRfFvyTjhDBvwwzjfcZOY5MLgbEOw9lxgAfyrA8pChB7+ppy4wHxILzLgs8x2fI7PRNL/3KTtPhxaWCxBE15PX7LlT6PEzrPSKZbxi1uDrW4bHZUSC4LmvPZtB/jXz1twdN6LE+CKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA4PR04MB7710.eurprd04.prod.outlook.com
 (2603:10a6:102:e6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:59 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:58 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
Date: Thu,  5 Nov 2026 15:41:17 +0900
Message-ID: <20261105064117.277495-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0142.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: b80ddfcd-77f8-4c22-8439-08df3b07e411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|3023799007|10067099003|13003099007|56012099006|11063799006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 2ixvNeqH6ilp3hFbavwlS7qFJdRM4ztB3rVb3BXKCN7ZunsfWqHUnv5Gw/BfhRLg4F5GQMA0NLuBMR8do9p0zCghHZC5sWtQs8cglk8qKFc2NRkJOuMDnmFwacopQHpBSLiF6VOtruIUPR5L/AfF1K8pakFBly3r4uhvlDH4p4qsG922P5Aqo9G5t+b4Kb+J3eBH8pgEt8ZV47pyzAF5ewTuN2erW1GAxKOhD6nmsWGtauP2bxaRw74KSHfkgf1hmG256FiakiS53xSAn+i3Vgmytpd4wnabmLsPDdNLOfYeKsitJy9IR8D/NIm3i8aROL6ObsSpm9S9sfVcXCkPo1f+dZaIJ9eiR8Z2YB2yXrT5mdvT/t9PqnlpTuwRRcj2NdwYk8CC9Stw3/lj9Hjq56QConbuw6uAfbslsehbc4miBoPmqnlm5hpG6l7Edgo3I+oIuNaZB81efpwZmJ3j5E4A/9y6d46VKOs1X2dvXNn9kfypf6lqVuj5Zciap8VLjNmHhiqpUEj+EDgjq+1tvETC9OsJa3cKm4wnzXH39WmZhSdV+WEHbVycLaUz88aRen7+clkHunxKLVdrxPb8CcrkeTIxJ1rt8+20jrRkDk+O1oiVWG+7QpH9quOS8BUIa9SYtFG2ru0GpY0gUjzGU9jgMUEw/2cBZeJDktSIIHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(3023799007)(10067099003)(13003099007)(56012099006)(11063799006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJG82Rl53kdRWs/JnK+HNCs0ePDA+JM6awa8ghHkxfLgRwYCJZghLTi3aEIM?=
 =?us-ascii?Q?R2tUOOSLmar4M1+ALzncd1ifzGZE7hfvwbI155bAHGpI2jiM1xWkhTPqlU5V?=
 =?us-ascii?Q?hl8cAPwqMlhIuXf0gxOXq7gYQJOwXRWzcV1WCCSJgHOMXY1W/U6Sl759RtEN?=
 =?us-ascii?Q?RmBEo7Hqu0l3ChJlyw5pbOwuVx8Jor1P4kq9jcJyR560UvDLJqS01kd2RzbO?=
 =?us-ascii?Q?8nWgfEpAOXOVkd0zYDZjxtp1pDoXl1jMq4v32boKO9XKLXtwo/tPbd7dv0wR?=
 =?us-ascii?Q?rm/ISmezywIo98zstqqVJlWEQrilZ7CMWyC3xJ9LRCg1Zz3IbgSh6cF7Sqn0?=
 =?us-ascii?Q?hMD3jxCFXdu6xP98uDUY9XQc7x5B3UfBL4WoEFFJaBW0FjMlEsbdkjcPY+Li?=
 =?us-ascii?Q?rkKkxQBowrHMC+0916xDfycniCz5kTS78HLLz4bQ8m7C9/JKQEN1+rC5qrFT?=
 =?us-ascii?Q?C/m4JL5Nt7kl3HBe7a9As1EomJVgAcs07Sez32mabMpc914S0Sl/BDoA+6aU?=
 =?us-ascii?Q?DJBnoyNr0TBVdBbrJGa2ri4cPlww+ZGLdrMvXcsi5qQqSu6sJBVkSddaSbLS?=
 =?us-ascii?Q?lxlA8wQ1oFXYDsC6mIgRf3y3aFh26v41m3THVNbKVYkPB1xjPh0rPW6hkNWS?=
 =?us-ascii?Q?NXlI4x71rGaeMLBnFXqwc7hURr4IwOCFpFzvZiEC37pSZ8RR8/+ds2Wz7CFL?=
 =?us-ascii?Q?AAeHBl3xhuK/4+oNxh/4vjbc7rZdRFdzloTVfx7pQutx/Neu5hfopGFKldnN?=
 =?us-ascii?Q?mjIUdLqqC1fDhGC4w9qhZAcMlAC6gnTg90WicVsNQj+H94gQdu1G7ek4qOwB?=
 =?us-ascii?Q?LV9unGo/+8E/8WElMZAROOZKWByHyp6XTvRvNiH/+U84Xp9tbe/Wb/sRJbvr?=
 =?us-ascii?Q?GUZegYGRgX4/8X8SeUYJPuXiTwUnAhBFDjgHi5KJvCjT/fFBLbJR+EG7eMMX?=
 =?us-ascii?Q?ZVcFflxjJAHEmiEO8rCTTwRE70X6WcuOGzi2+BOOnn9e0EdnvTiKE3A85oiv?=
 =?us-ascii?Q?pBGopmPmIRFwMQdYV/9TOpzNSzf0MDU+z+bB3P8+OKI8e+Dju70yv7PpXQ2I?=
 =?us-ascii?Q?liG2YZZDf5BpnuCmXrJWuRR+yPp7q5xfwdfQHoBK8I9oEiM4ro+xRPSOVLrR?=
 =?us-ascii?Q?KhJNO2aoSI3gHvLshTGJT3I7P7N6GtMz9vg8jnT08VsA9+zcqGfuqS/o1wRs?=
 =?us-ascii?Q?+6t5Ogo9lYUNmBMTCLrZjZIwIky1EjEsw5Bpi9FrxztkBqJ54gStFm0pOrbY?=
 =?us-ascii?Q?fl/8ujXTXrYVLRc43J8baTlcGFxWEoSOqWvTyts+yQhfbL9nlHpZ4usH/GYK?=
 =?us-ascii?Q?wCizD1plCWBtNN/X1BLwa5xHHefvgfnX99txzvwawOwCLNJyXnB79TAL6fes?=
 =?us-ascii?Q?rlBnr/wS48zd1uffepdojqa1A5JX1a+aRzSz0TqFUMsSe2fxF7wJR26DzOgN?=
 =?us-ascii?Q?4HPlaznLbhR8yI70VQ0DdoC5mD9DxoOYRP5LPhoCMD2r2SREWFgDe+53DmL8?=
 =?us-ascii?Q?begQ/2MG4/Z/50r6y9iZUxpvn0zNCGsAXpZeKM+ZPrvRVDynRnVJEoNqhcod?=
 =?us-ascii?Q?X/xNO//8RdPBuNR82hO5JMlWpWIGfOOeELL+WsBGopqXirJv/D7F0yIc+bZU?=
 =?us-ascii?Q?vfgsYmRUHm2FzSpKpRBD7LnGFZBz8dOOjsp1qAbz1Y+5HF46bpn5/Ls5G1DG?=
 =?us-ascii?Q?/xn8w6QYNdZ5FhLIujI31XFev9JHdg4wpPJaKo8FtQFhPLHYrplwNPQjeREs?=
 =?us-ascii?Q?sGZVDpuN8ZeyAIuwWVITCWufuyEmCz2KvGC+63XU/C8sTnFHfeiY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80ddfcd-77f8-4c22-8439-08df3b07e411
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:58.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuLPEs80M83lA212fWw9lEHUP7VYCGEuFjyWvO4pEF2mG+jYwjGRPCGrOku90wQT6uS9/F47Oly+K4NkHGLg0e8QpYnNhymR6SvwFMUx+oc9AuElUYWO19ozbVvAtiMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224210_472888_4A5E189F 
X-CRM114-Status: GOOD (  13.24  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add common DTS overlay for the IMX-AUD-IO add-on board[1] which
connects to the base board through a fsl,aud-io-slot connector.

This board features a CS42888 codec providing 2 microphone inputs, 2
line inputs and 6 channels audio output capability.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 57 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..aaf546cec0c8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -994,6 +994,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+imx95-19x19-evk-aud-io-dtbs += imx95-19x19-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-aud-io.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
@@ -1001,6 +1003,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
 imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
+imx952-evk-aud-io-dtbs += imx952-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-aud-io.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-frdm.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx-aud-io.dtso b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
new file mode 100644
index 000000000000..311b7f984576
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Device Tree for the IMX-AUD-IO add-on board[1].
+ * It connects to the base board through an AUD-IO slot.
+ *
+ * [1]https://www.nxp.com/part/IMX-AUD-IO
+ *
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	aud-io-sound-cs42888 {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-cs42888";
+
+		pri-dai-link {
+			link-name = "cs42888";
+			format = "i2s";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&audio_io_codec>;
+			};
+
+			cpu {
+				sound-dai = <&aud_io_cpu>;
+			};
+		};
+	};
+};
+
+&aud_io_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_io_codec: codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&aud_io_slot 0>;
+		clock-names = "mclk";
+		VA-supply = <&aud_io_reg_5v>;
+		VD-supply = <&aud_io_reg_3v3>;
+		VLS-supply = <&aud_io_reg_1v8>;
+		VLC-supply = <&aud_io_reg_1v8>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&aud_io_slot 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud_io_cpu {
+	status = "okay";
+};
-- 
2.50.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7412C109C038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzEM2EAPxlOEC+9Cbq3j6xwb/dTmpvtx8MlZECwVSjQ=; b=sIYTgw0BDs9vXnymUJ3Mx5oFGi
	NR0Xgx7BUg7s9EP0SL4Tkd+utVTB41UYD1T3/6MxNGzDJy0rUfg+lMgYNnCJc552HomtezJENV7P6
	AoDuX/e2Jk4Wc+zCT3MnhDX7K6hSqmd6seBaEEf4GkWv6r45LuAlzVFL220wue2IItW4Y5wJgwD4v
	wH2D/Y5GjWZ6GOjB502noWWYpdwS3aR065xpL9OQkvTL5QdsOhhBz9Kih5YJlGunCvioS05cDVOZn
	tFc/fGHZbcJEVM8bvApzj9JANcJXT8W9Fbs3E6GsgQdLemXLNmsjCPowFlAi5nhN9aIabqdNyBPEZ
	iJW1Y2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8O-00000004vjV-01v1;
	Thu, 26 Mar 2026 07:28:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8L-00000004viJ-38Fn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 07:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hzEM2EAPxlOEC+9Cbq3j6xwb/dTmpvtx8MlZECwVSjQ=; b=gDiaMD+yF9kq3gGyzTj/+sdJZD
	PPhTJpsKYlogBFc6Ues+BUp/jAqfQWjLn9HZj14N0oRkWKRO52EzddZDiE3Yc6wLZM1q9PHhpAwl9
	onhe2XFIBnPyVQWpSrLqMrp1u4BroB+U65hTP5uDb8YhYpwDLj8QAYRdHJmBZbyg+z9qbtUBDTquW
	xoFazc3POaHnSambxOQcAH47UaeKLKQi6Kjpn68ftBHVU/Pm6A31Ps4kQKgI+wq+3SeoAncEUobJJ
	nsugaErVmVBvHfrcS4IGWtQMBMXx1X4hEyeyG06n9gCoL2D0wr+1b3+okz2xszgE3feowizZoTBMq
	Cenpb0lQ==;
Received: from mail-westeuropeazon11013064.outbound.protection.outlook.com ([52.101.72.64] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8I-00000007dPW-2JAW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKWFlFGPiShxMbk0tfaAfrirfbduN9hSE7LQlFNMVhWprD8Ju9f2c9R5CqfEF5eGc9m7yCGxU9TcTmaBH2MJMJwE3fL43Znxtb0vBC0SKkts/H0yAAsAehQyZXMhCHV2CvH+OfaiV/uHY1faRpPPsnDnl9EWlfyxpwr7UR8jY5/mNNco71Sr7yJmxi25IsIMUt8jRWc9N1VBaDKYEZu/DqyKr9f1K8o/68lOgMlDmEGjLKGjgAchan97tnKovWMUJO01ynmugg68hIVfaG4s/cfURNijY3iPUBTza4dNNP0k0+XBeJt1SfQVU6p5Klmqy7daAuHBbb1iCMTK6TYwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzEM2EAPxlOEC+9Cbq3j6xwb/dTmpvtx8MlZECwVSjQ=;
 b=XBZmaNas3uox9GPZI00ba6YyV+eQyQyEDO2rL81ZtWCVOwa1g1FNbd7YXR+r8aH+EUP4eTPyujgxgwuFFkTcfRyhMyo8acHXfE7Jge6df6VY011JIUWIQVe6Gzi7OyedwGHfQ1V0UTZQ6g/IydBYbIVmSnQprLhZCVW9uRZ08R7MhbwRuUVmOqT2eSovuw4nXfHVwzvkV5xZx6s8rl640P9kiKn/Q9AT7IgbN9G0A4bMy0qnMtNJs1/xKBVPeiZKM37ITK+KxBBDIlApyeNRHGQmeZyxiY4nCiG+2tvFRkTpYRSCRLqlbN8oiOoCQV0rHkd9B4bs8IiVPzhvyR01jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzEM2EAPxlOEC+9Cbq3j6xwb/dTmpvtx8MlZECwVSjQ=;
 b=s2+k0/zmrQ4omzH3kyYy7Etn0xW6QLRTOq79IgWUEGYo+pcUwXjHjt0pv7BNaBt3juy2ENIm/V5P5qOfRtB6JLRHHG4b/m+goqCLBs4CzEb7YraRvXUNwHO284Ff5EDmC/NN1NMujHPm1STKFD9jO5ckJuqvEJVqcN//1nIq3DFK6sJ/IHLFanjWZHxTayowsrnpEZKmm51/V5L0UkwRrr1ezyilWuLobnNSlnbZgRx2dPJq7aKlTDzCK/BCw7tsexaLxl8hriRftmkkom4GtxlBEq7onhBwKEG4HPuNl+4lRVMpctlVS2Dr+Dq2XIbklaRZB7a8n1uuP4FI0IDUjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:12 +0800
Subject: [PATCH v2 08/12] arm64: dts: imx8mp-nitrogen-som: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-8-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 758df855-b486-4095-39d7-08de8b092458
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0nvibaiFpvyFeJD9aGW6bGS+TAOisqO7OaN/qGPSCJZGO1RA9EB7FUCEEkif1QjOierkCx7PSp8BZOJKijlkV7BZ6bkTS4ObUQF/ivl3Cfd2BvUx0ympOrlh8DRWKVWce1DAKP4D5+Vv5siX/I8kJeojHsXq0rlHdHbkxHD7W0l0c/8IEenVcnh9PPWGQQSmcMiJG64vhZVw8qZU+aG+OT5THnOo8eDRXQXu2rxRsAWWpiSef46mkgzvTtVat6RN8C+1+lbcWo7T0WsY9byWzyLGpJFwI78vW9SfUu6GmAJNTx7Tm4ieI2tUNBFhdgleezhBE2u0X1RPpM5if2UhRoQDfkDlm5bWQBHJhjfYm5D69Bj/rH4d8H1ExMw22Fu+qzPW9r/l3KPylCdtyEWz2jTT4g6LoprL1eQV4A9kfnJsxRTVYLJ1Uy8btCrurYRMmL8H+CoJ/YXrRiklc/9Uspqrd1kwkoAuUWbw5pWhOYo8TvESJ+980t+0sLfbDd2a2/asVc7lM6VLTrcolm1OOxre8Kgk213P4j8KArXN//vmk8/f9RBF38lqSI5Rx6dFgK/qNwpAhQ71dpmW3dNbgz3j6vGWJDdFCCpc13/+9DOcnICWVljayASGZGJ9GFBqJBpXdCwqwO4w0tMvd9FeCiu5FJn1YD2FjHEwO63ZXfrl2d8UIm6UmiQIS1/K+1QA/tDfLh69XYEXSJEGu8PpV7xpVQl4oW+LztswTMi559ybL+0eMPApuFAPbayCcQVqQ9H6xtbUqWzCo+G0EV4+nXToZt6786oIuhyzoRLaZomjdKU6ctmu+y/TeG4zts51
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWFIVkV3YWJvY3BwNnNXa2RFUXA1UlVhd05CbUJ1bWxDL3hvN0NQdWxGanFl?=
 =?utf-8?B?ZXI1UDNGNXRqSUlWVW1jbXRWRW5sTDROVzFoS1g5eTBCL212MUNETGlIS05G?=
 =?utf-8?B?R0JzRi9kSUhtZU0zK0tvc2RwZ3ZicjBleFpESWhLUmR2UzhrWnZlbzNXUFVQ?=
 =?utf-8?B?RWhZeW1MRUNFTVpQUWc2ZWRKaWVOZkx4U3JZT0p0eDB0V2JBWGUvWWtXUnp1?=
 =?utf-8?B?WlZacEk2RGRoQ2gxdVFPMlk0NzFiakpweFZWMUhsUVUrNVRDeXQyQkNOMit4?=
 =?utf-8?B?VVBRQWU4ZUN1ZzFNcE1STms1QnBWWUFnTEFFNm5OT3h4bnllQmZDQWhYVmd5?=
 =?utf-8?B?UWV2UGxabXNRRVpHcGMxdGZ2Z0RwRXFWVFEzNzNSUW5IRUkzeUpYMU5aRnN4?=
 =?utf-8?B?ZkdJQStKV1hkdXBJU1AyWG5qaThNWForZllpTDRGUU1OWEZoYTExbzhUVVhi?=
 =?utf-8?B?dHp3WjVmMlRjUnpqZUdSMXVYM1JxMGJnRVllaWdyZi9KQk9iYm94WWt0ZGRC?=
 =?utf-8?B?TmJETnlwQWVhUGI1R2Q0NzloR1JOYXVqaFYzOThKTUhVVExDZml3UnAxL2cr?=
 =?utf-8?B?ZkhQbWx0bnZ3ODY2cTlDeXE2T1RzdnNEK2NCUzlzMWRnUjdEcDAxdFM3NGVh?=
 =?utf-8?B?QlZXdTNGY0RsMzVucjB3bUxSV1dxQStteUU2dlZoNDRwTEQwU1lldkZhSFpJ?=
 =?utf-8?B?aFMybDlybk1aSEdVWWxnM1RlTXVxRXpDelM0Y1BxQUlSRjJhZWI5SmJEcGFx?=
 =?utf-8?B?bVlkbnRLazR4OVljQ2RSOUw4RWJiUVR5TEVWSmU0Z3VHNHNmZFplYVE3VkVU?=
 =?utf-8?B?RVhqVmtrRkxGblBaSjZGRWlvWDZ6WUpNeGlXS0JPbkJtaFlaLzhhNFN1NlQx?=
 =?utf-8?B?L01tQXlNMzNPd1pjVWRsWVZNbmxlQTZiVXdqczFWazZDU1BBazJZeVhNNSs0?=
 =?utf-8?B?VzF1L0lIalJCMzNCSm1GdEkzK0tkZ0RjeTBZT3JSb2FMcXI1TGhwYU1WaVlB?=
 =?utf-8?B?ZWdlVXB5K044bmhUTWxzeG1qazdxWEtITGFWbk1YRUU1bjRPTjZoOGJjdkZL?=
 =?utf-8?B?S2dBOVRMU1pOWDJxaWYzTGUzaFQ3M0lKdjl3S0IwVTUvNlVzRXdsV1pxYnl2?=
 =?utf-8?B?RFUyUXRubi9YaW01QTBOd0xCK3ZWNXUwOHhtb0ZsOUFZelZxYjdOa3plZXVw?=
 =?utf-8?B?eGRPdUhsYndyS3YxVmtIS3FORjFCS0tNZldETXlNT3VxdDFnaEYydU9TSTdr?=
 =?utf-8?B?Nk43WVVYWU9MMzNZTk5DUk1QQURVQWdqOU9ZNytrc1EzTHpmdW9UUUc5ZTlj?=
 =?utf-8?B?V0lUSUZoMytuSVNxMzg5NTFHTFJXTE9DSEd3OTk1aVlvL0I2Rzkwak82UVVO?=
 =?utf-8?B?YXpCbXFvaDF3TDNyS1o0VHpseXdqT3lyaE9nZTRMVmk2RS83Q2xlY0MzTkRS?=
 =?utf-8?B?ZDRnOGV6WVk5WXlJMERxb2xnSE9uaGpodWZ5UVJManI1Zlp5RGZFMkdIeHNr?=
 =?utf-8?B?K1hBYlI3VDE1VHhtSzlPaGZ5L0ZtUjZPbW1HdnZVM0h5R3VocXdrd0tGQjJB?=
 =?utf-8?B?L01HSEpxeWJlbkxWOWZiRDNrelRORXR6SjdKWEtlcTEvSVNxN1lwbWZ6WXln?=
 =?utf-8?B?V1BicUFuN3dyRCtwTVRNdGFhVm5USDhqQXA2bkFPOVNLSUF0cFk3M3VIdWJJ?=
 =?utf-8?B?YjFCaDBibFVxeEFMbDJDeHMrYjQ0S2hxdXU2ZGpnZkFza1NBR3RLNllOdDJH?=
 =?utf-8?B?MUkyRWxvbEE5WG84SHBnT1RXeVg0V1l6cFQ1VkxvRUcrVWxUUC91VktVbDFj?=
 =?utf-8?B?bU5xQWhMaEllTUw3cFMyMExFK3NLQ21sWG9DbmZiN2Jnd1hwN1Y3b0FpNUk3?=
 =?utf-8?B?Nk9seWE5UDFOdStXZXRCTDRiQkRTa3lOTy95OWJZWm9UM1RjSUxIYVdsaFhW?=
 =?utf-8?B?ZjF3aVpGc0NvMGJLWXdqMW9tUVhsbmk5YkdqTm9ydUxpbGlteU40YmhVdWtu?=
 =?utf-8?B?V1dOcktNanUrc2h5alp6aWY1QTlzK2hjbkIyNFBIL2lMYVJJTmRCR2tmajBG?=
 =?utf-8?B?NWpJSmErNGpmcHJzZURYWVFKL0pRSithQjd6NTdtMnJLRkJ4Ujc0dUFMWU10?=
 =?utf-8?B?aXJmNkx5NXhQTnJpV0NsTDVRQmE3OE05WXBHK1NRR2ZNMlVqYS9FUFhjNXJT?=
 =?utf-8?B?VEJIUUNCVXJJRWVzblMvZzhXaFJxMHN1NFBVRmNkWTZMRXhyeXoybHlJMzBs?=
 =?utf-8?B?SEZ3NUpTVS9BK0xHWkh4cGdrVUs3WC9Dd0lFR3dZOGVsVjdLYWEvVW01VXIz?=
 =?utf-8?B?WHpnVS9TWklraWJYMVNoNUYwcFB6Z2swaEpocUJWdU5rR2drVlpidz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758df855-b486-4095-39d7-08de8b092458
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:31.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0KW8ouqPtzvaC5TkSAb9Ox64irah+4XsmWHF+S9JKqKlApsqUJMoL+fpJX5PvBn0/Q4/OgOeKvNZarKczQURw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_072758_875782_8115B912 
X-CRM114-Status: GOOD (  10.68  )
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

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: ab4d874c9f44e ("arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus ENC Carrier Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
index f658309612efff42e7b9e6789a27b164577271bf..8465b36d440ae39a752a6fc364c9746483fa13fb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
@@ -296,7 +296,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x41
+			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x1c0
 		>;
 	};
 

-- 
2.37.1



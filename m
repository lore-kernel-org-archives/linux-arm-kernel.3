Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509BE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xACPN5Bz;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vUZvMTAZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=85gy66KCSAlErNKHgfO2oIZQOBARYbPwDov2n55zZic=; b=xACPN5BzS8s70E
	831kctplJz2R2bqUhdho+XbdvTRhRQGA/r0HdhGVSnM1zUOJKP5MabcIvPABGms5/NdiYTbOAdNXo
	skVOyWToopg2OeGVF9g8W9sylcYFY9zG6L1UQDyMV59LeSqldzVY2FDqi+xGKNm1XFCilSufyOYqL
	2iqIhH+GNcDFWhAkxz9zbbrWLdcdeMjz3eq2Mr5X5RjeUx3p1QFR1sOVch6W8GkkCqzjSpKx4nj9E
	j8MK87WTP9saB+qH1AAhmd/TTgo45HRpxQUd+1sUqLOnSgpZBaUAD6EccU0jq6NzjZsyVbpNp/Y5n
	IuAgW0KikiCohyadb/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVa2-00000004Z2i-2kfq;
	Wed, 04 Nov 2026 07:38:46 +0000
Received: from mail-francecentralazon11013047.outbound.protection.outlook.com ([40.107.162.47] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZr-00000004YQ4-2j2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enSSaiEiCIuPBeO94OI/ImU2Jc2K5tBxIEo+w2h4UYagR7RXpnFnnsmbSIKyoJQ6+jOpta7oV1mG8sHNHErv+uT26+H++nOdH6c9R3iavVhPMWc1lwnGK9AvgyhyATihDsyUsX5zlp9+Z8LSAAPsTmrLImKo7E5lz9AXX1XL9CV3JOOtrwq1Xd3uNhYDAC4AExwXr8dq+rcvT3db8N5c23+ckuIx/FRrxwzN4ijegdmgv41LlTu+a+Z+1rg1Uxma+Bmo1j5w/zm+0LE488KRfMJ0zsVlpqDNdbriwGIVMSeTkvFVvQzsZjVrIgmPw3nTyzdZwGYRyGRKB0gh/HYPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85gy66KCSAlErNKHgfO2oIZQOBARYbPwDov2n55zZic=;
 b=AfL1NRvqbqQZ6QA5ruNSbpBgJnwcvsuSB32DgVaKD0UfcVOeeZM7bENSpHMm+pFgX1dm8x26ftuaHTlDQuJmIAz6om/I7v8DLVAUv5OUFw8X9hssCJ5rM8cQ1ScHfXpxp1YKTLJu2f3rEiRSyUnqQcNur2NIQ2izR3ADyGiXsno8XskxX9ATb5SZ6B7SfH884hTIS+jS2yt9Fxnc4sf/S+HGlFha6hQB48rbUkNLrIZP+3Loqwm/qgg2FedQM0WBdp1u9r464S//0HGGo6OJIKqGwk1ge6Ef6h4+m+8RCNBwFgOvhg86x1iD2GVXvBiFU6YLI7xISgPwgBMLrB2cfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85gy66KCSAlErNKHgfO2oIZQOBARYbPwDov2n55zZic=;
 b=vUZvMTAZA1k/turitDGq9cAUQm2olLD4Z7P5+GPySdsQv7M3c+ODD5nKLes0sL41DNQ2bwbFu3WU7D2Og2Db+CiNip9FN+BJ38p+/YfUewywsXTm36LKOqJdl6nMDtmz8hLt0XlDXZJbZ73NceHmKR1JQJWTMIns8OExt84HCmkPq+mPIHCom52DV5+hMzrZw/7vRH16T01Dx1YsJP4rAekykWT3LRFwUC06R7wKwyG9EDWZQXaBU2BYMlOz4FnQEIT29dwC1Mp1Ah0KY22X3I7AmpUx8bl8uBXoEV8x8QVgglt8pNbmhjNs4CefyVoYT7zCe69vzllVdY4A2KaCCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:26 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:26 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 03/10] irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
Date: Wed,  4 Nov 2026 16:37:51 +0900
Message-Id: <20261104073759.386777-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd35ce1-155b-4018-557a-08df3a469d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|10067099003|18002099003|22082099003|3023799007|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: pkCcvJfJIIEcbK8cA+tC9fZZ87ty7K0jfksG8pGMSrXtdg/OW48/WsRfIh6LfiIRys1HJVPj6QQBxujwNnmfGIhMz0A8fv5fgUHav0QtUqKhQi3st/JtS8s0s8pYnpx+tFdRwxyUQPlkm9L0vdgLUAprkTszmy3+9ztgZR1oML3rerXjWiKj0DVHWwCXlV1TvjZsmVG5k24Aiy9q8No1WAmbxFvQN2W6925gYm4X53Egx2wOfC8b/ue2xI/agNQtEx59XtduXJt+t1FZz/P5rlcCwwS9qtJRau7XNkGO7kc08RbLFo3zOyqkxg87uEKgmPgf7uRVy0JneURPPkguAGGj1IF7vhv+ytT2JsxJ89d76qhRKkPGfZcIHlOqoPv0Pbq1PLjTcI2+NFTXDb/piVvh6LOnlN5pl9mNh8kNzKM9BxSQ8+/937EMHK9fIqTzBQrzhYUwrhQ4MnHHUHWVdtvDFbo5+URiZOxPTde1ccjL0zAqAjg0+1BqE8hi3jj14KaQEfmnm1V3+m2Mni4aV4kgPyd/HOYmvAZjhj0ngm8TePxnoGx4RsjsUIOCUSf4gwPSb795wcazWzdVuv2GLRlvm7/3Y0ELcwGkojA+6GmICJVotfkgH10lsSRjTOPCsYUe7y+VA73VPyLM4o4alibfEKXiQZikr3KzboJr+5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqFpPPbXX/0WtRNYdVvEv/F4piJUuhPM5YTs0o99lHBvOeAoVX0FLEcG6UA4?=
 =?us-ascii?Q?Tt6Yv14IAMdjAGXUY7sHHsqcrsF4okO0PrA40b1kEhOJx74r64FD4LvzKfgb?=
 =?us-ascii?Q?fpaHCpjWA9DljEbD2LkoTie9pzBiHpUT+0tfqrXxXvaRd7A0md0B+7EIKtKY?=
 =?us-ascii?Q?6D+hKuIyoXXrOm/6tWI6UHp+LOX1vDw8C8dUSZeqQ+80CYrzzl9zrTvCWmj1?=
 =?us-ascii?Q?YPzBlrQ7QVG3eSmvpNjU8lK4TRjwHU9+DxGJ/vYGxxsWoO2wSa8WfXb2GyD8?=
 =?us-ascii?Q?7pOzj4+oT0y2Hxs8ULkA13fSAZARsIvzJGB+M87EL2UHJaqZRNDSnmmrVR34?=
 =?us-ascii?Q?CVZSEmLvYZOyMokx/z52VfwooLMkioX94k9HrZYyFJQ/OwPFyJpSjYrgB1ww?=
 =?us-ascii?Q?nfMXmTHT938LP8E0y3pV8sPT4csdmtrdxPrYweQaZqjl/O96UXBt+XLxRaU0?=
 =?us-ascii?Q?AmNOgy46MWGT+E+TTDbUivIaNY4oFdUbIjKBcwoqWIqJg2uvhenCdtQB0TK6?=
 =?us-ascii?Q?tqhAHzHRaij6ZKvBu4XUI1dvGnuXAF4DnsxMJ30nBOhQfC0V+xJehbyZDZc8?=
 =?us-ascii?Q?aZR+R3Iysp9ualVwtNAexA0ehs2cn0dvE1xqVEuM6oFpE5WbMEqngHZHHIFB?=
 =?us-ascii?Q?8IN09pCszvVG7AqupzoDOd0W8GQBSnHbJ2qvfOJhxhOS84UW1oC/ZtjJb9IE?=
 =?us-ascii?Q?oHOzWf2QKXPdzmxHDU8oYgiO119TEyJiTec8Vn+sQpVYaMBt+jiZzOZ/I4nF?=
 =?us-ascii?Q?lThTeLvM8BTOWxMSOzSmc6v/9O68qDc9/hy2iBukkJBHQIWLBCqy72Sswao9?=
 =?us-ascii?Q?xtQbp19SNhfDSb2Hac1Eg3ZMcroYxUB198uvyL72y6TVbjVG+2K14aVKctLD?=
 =?us-ascii?Q?UTn5xqW19Nz2mCmK/jL5Fi4lIVerbaf903+3QpWAywbcCbHpOVXid1Twd4cj?=
 =?us-ascii?Q?5eE3FyaUz1Dh+zupXl+TI4NzcQjjNOeTAPDgpp4YT4zRyLX23l9VS2dE/w6I?=
 =?us-ascii?Q?NrTvPTdTXCNx1lVUIz9f6wIe/+T1ii00itpRJzTUTbYiYtZjvXHZNUnutI/h?=
 =?us-ascii?Q?Do52Ko7ht5LS4IGZ1+LmrPVeHevczGycN1WpHYJk9aHHy5ekvna0Zz3dnW6p?=
 =?us-ascii?Q?51NdRjnGnv7q3ArVJLumLthPKtdF89ml5UMlXv0YBqeJsXRDrdpAC2KBnLQc?=
 =?us-ascii?Q?uE2+PYmyo3slMAMnf5DEzBvQpkBIj4rKiOhQjie0k7OZlE6yKq/nosJMuieO?=
 =?us-ascii?Q?Ppgmcpvr+B7ma1AAJWmAYK8Z64LrzUOZkd1JFL58ySnssGQ5LvQQbJzBQanB?=
 =?us-ascii?Q?FLkF1vAfOzdH7BZ3HKCi3V99pD/20YF7aJsr7Ew/n7oDrO8XvvWzF94bD99Z?=
 =?us-ascii?Q?QSS9Fijtoq2h5DXZfTcTryrk9l50E5DvbzjXXloK7/b3WzbIsUwvGwOeKvdm?=
 =?us-ascii?Q?NjhhpFle52Ry+qlsmJ2u+kpcuL/xwkhmNm6EQh24kR8PJnY/iVwtL5099Jm+?=
 =?us-ascii?Q?tQb1BHtIoSw3eVnNX4Qu3FNh3LUbSHQIEvJ/enKvXW66bCR5EsrxU1/qbNZh?=
 =?us-ascii?Q?nleet+h3qumYPZeSMuJKezgKt0g6F1U6SQ2KPK1R6p0+YWIouvU3HnNDZQaG?=
 =?us-ascii?Q?kltDggUapSPPx7XqEyUZC9Wvg+0pzPZQN+aDpJRZddYjqql+B0lXudcod/Fr?=
 =?us-ascii?Q?Mohl0zxhFdiEKeg9+rNbA048kqx4cD/rdNSSmbwWDnRZq3qMeNcviYqWDKP6?=
 =?us-ascii?Q?p1Zcuxf8gBH2Cm6df0FEg54LkdsIKT7Jbiw4t0ycahUlKyCMGFB9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd35ce1-155b-4018-557a-08df3a469d03
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:26.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tYEN9RFXsQEGj390Wjl3NOltGkRjPInBeUQw8+TGBqAiw93EobjajRVFtM9HOvzkuPf5rZjQCvnK9xKMzGhBMGXeR9Txh18Bbf7o4bg20t7mSC1Usj4wfBHQUxE2UrX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233835_727810_2DB11965 
X-CRM114-Status: GOOD (  10.69  )
X-Spam-Score: -1.9 (-)
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 766756e76c47..d05de3d26fb2 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -280,6 +280,7 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
 	irq_domain_remove(irqsteer_data->domain);
-- 
2.34.1



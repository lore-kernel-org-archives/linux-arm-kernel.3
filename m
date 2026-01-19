Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCFCCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tluLN3eK09GX2PcEzpjyDZoZ/309FhdSC0RKk3I2/o=; b=szarXAbzHt7KhFn+lIpJ8thvdg
	Xy4nK6DSePJFbBf1QJEOVR0yBd4zNN38cSem8CVuYBKdr75kzP74FuScCD/2qF5NyXAEFJc+u0ask
	lXUkIkNw0YuKKRV23vusJSu/RT2fhRH+eMhWudZG+OsGTqFcAfBikaYxpkJ4WRIHy6p0biyNog7kg
	UevGn/KmkFMGXb4Wb5Hk93MgpKyy8yZgxKdTLUPcv+DrtyRrUQ2yQpzywE4G84oXaNJ+idY9cIsps
	X/ewHUgkTUKqV0lR3bQ3PtF1+CfCPRvId3dudhb5UFqS1Cly3TEaomiTcxIbaIjYDHtQPhrn8v8Pn
	keiLmSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlzx-00000001gRp-0QnO;
	Mon, 19 Jan 2026 09:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlzq-00000001gPH-25QF;
	Mon, 19 Jan 2026 09:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9tluLN3eK09GX2PcEzpjyDZoZ/309FhdSC0RKk3I2/o=; b=NahMCdqacjH9nlTx8AJuxubrew
	CmCgbWYFnlxyJWASwAgW4LG0H2H6HZsY42bUdWGqM8pk+3ZZJcrjz53AlrjmoAR9tBYiCOCv2ANnP
	KaxhSiUOqfa0p+0uMCclKAqpU2TEAzE7rPPcB/tLsrgFT7llKYKk1IlrWDQHbGcCNp1iQyaKXK4E7
	ksstxWBujiDJajxhL0PoB491LBJ8MjXG700iy/NTp6ER/H+uIRLSoFhV2du3lBsJw8sw/gJoXtLx7
	c8ae/tHyYaTJtxG5/WrkOoSv6Fxq/sJBB7k4uyNnH1vx1PJ/AZ2VzbUwd7OUJnRA/CN8P9rZERl0i
	35xvCVYA==;
Received: from mail-westeuropeazon11010033.outbound.protection.outlook.com ([52.101.69.33] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlzn-0000000Bmco-2cNj;
	Mon, 19 Jan 2026 09:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr+QJzuqCVHQoPGe/5ExbVS8q3zx6ZmlGRa116rzQuN4h9NzKvLFlS4iza9UyIVQrLBel7ruYV1lUG1F2aOwC01027lQnQaUtElRkQFm26mRWbd5wlniCYQ77ce4xzSxp5e7yQhxx1RkbK28FnvQxvyO5sedgG/aNj1J8sKYswPxJIYltDcbKAFY64mHU2VlMV1R3LF93Mmfl8do0qSQL7tTRpDzfWvcnY+Ih0zrAFXD3mKEPDNgiBDIR1CK0QVBit0v+h1Dd/ow9wV6Si1tf84fOdbILnbrnG8a4D4YESAkxX84Tq2k6P/m80S5TQjS6xgLK/u4qz05M8H0xELsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tluLN3eK09GX2PcEzpjyDZoZ/309FhdSC0RKk3I2/o=;
 b=EWMQ5cYMGj+GFgnk+SVyJU5NVjO0tFDeMq/YaK/1ge/F/utC+JsuXb91ccgQrgcW2Q8kgCKdzCWcNxHsemSI73zRf29Wm6RRqKUvJRaxtliYLFRElCYJWS4/u/LKgKKsqhgFBrHnJq5NgPSojnBkktNoOP1IvJbgEskoUYd/OMLfiBhQklHLWNSPe2mdecwjS/q9KRWDNs9fYg08nuveGGSvjzahQyEaLMCwPfTzea2lf6EN6jkLgtPwOpMxU+0Mw4tQi8MqqCXbmdGJ23EqkXj2r94rUyXaTBip5Rhv58cSLtW5lNmTQjwu9o04ulupzpbevW0ncVedWA+ZgsZFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tluLN3eK09GX2PcEzpjyDZoZ/309FhdSC0RKk3I2/o=;
 b=mJchOwjsHNAbKemArN66WLa41k3q41Lvkf5ylXVLa8onF95MiGhMDpCCLoCLX4jOSY3TyB34d+jzpVMSm3zoEPWDHgepOSpAf77hp7CIGdsbN2+AVGmXJXwTpXAipl3BglzWWupNMXdaG5BFExqEHn1mgCmys+SGVcJcNRUQM7OWcFC/NbTKqfAkY34LYLTxDft7p2VD0BBfIZnnXRxsHJQoiiZCsFZRgfmRcGKIQTpyL6AFhs7Q+WWkGRReYvQGQ78oYB9Bi/fx04/EYVcV6AS6L2rk4g14VpOcfxbnc1y0ZALpl9e992NQ6lZWtAapYY7UoNnpIvxNEaishoaEdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:56:23 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:56:23 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
Date: Mon, 19 Jan 2026 18:55:11 +0900
Message-Id: <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb8f476-335c-4a80-3908-08de57410112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Z3s0vTlWPayqECOrnAr93Yv3+kGxuZWANDzc0nrHc//jH+Mmza+aGSKpzeA?=
 =?us-ascii?Q?HUR/d2QU1zGKttEhK0x3MCwOCG+G/aT+8g0SjrhDRzMolmwOMYrQYRaR261J?=
 =?us-ascii?Q?/JvVw+QT41tYO51TxbdHTCQq/eKh3BwQeoIZRAW/Qx5rDFDcDneTeEAoIDe7?=
 =?us-ascii?Q?EP+DrDK4lI/O93XACQCDGxtjhKG0s9/APHBUPOe3HF4g/mdWUuvLOWoBUIQY?=
 =?us-ascii?Q?r4t7DnJj/lybr7vjk+oQMg86Vo725plfBeeWfpuuN4I1wZTR7ghLqwhTWYVY?=
 =?us-ascii?Q?VgYzE7/V28v94WyCU9mHvq71c5TPyuryGFojc+c4UJIYZctZEZgSg13OJDdB?=
 =?us-ascii?Q?d1gNu+kTyPGhlUTWung/yRN9hRdvReTbt0KBv4fBKx8PhAQU3scyl3HkIicF?=
 =?us-ascii?Q?TTkCAnqk/X1jnGVwseNhH3Ft04xa8zMM1fC5J4W80TH92W0XjQRyppss/8zg?=
 =?us-ascii?Q?gz+RCTneRmzpypj9ikRRjj3cP9XQzXqKbbji+nlV5Al6cagbie2XbWS2ZzJC?=
 =?us-ascii?Q?og2X0U2HelkK4yX8uMAPEms4axWhYaquREfQFxcWjRd+saV4k8s+0aJRARlZ?=
 =?us-ascii?Q?9WUn+bE6A52VAzFvX4G/UCgNY4j17nZ7zeroieY6gPVCRLsnAZrC2M3Pa64x?=
 =?us-ascii?Q?ceLguB9S0FRayfAhHNSRaup0WQt85fR4wYIS+H5IbLCmG3VSbZ/vU1+nXqeX?=
 =?us-ascii?Q?zomU+zx6Nh+IuRvmpVLBBCI+qsjj04o0kfxDbOtstOb0ctuDc8yEr1j1C33b?=
 =?us-ascii?Q?f+rthV3QQ+hVqXD5t4pv4MSxlPhoOb+WdWE0yX3CNuzQ9R02s54TooKFe8dN?=
 =?us-ascii?Q?dwR00U5ZqHn+LVQiXJ+zSeVrf3Wm9ouQ1xnOJ54FTd+i0eLwfdL9toqz7v/L?=
 =?us-ascii?Q?xT75UDUiNlno3eFK7njyQ+abelWb97fKgp6ja7h0PVx6jGTpTgTQSUKmc1su?=
 =?us-ascii?Q?JPpF+JeOEYbogko65KBN9t1wBbL5MkoPpn/aCfeWCRfMijL17/o8l05zQ+Fv?=
 =?us-ascii?Q?EI5ye+2gwKlHAWRNR2JgFQSTcf/B4dQAyUoc0lhoWYt9i1TfgW6iOVvG5jWY?=
 =?us-ascii?Q?tQE+VmD+/XtTDmZovdZM+c2xzMLWlhFB/DF711pA1GcT/Eh5D3ZHkbqLwmwd?=
 =?us-ascii?Q?OD7ikuovBOYBcyFGhYWDqg1WDqMKxoPPEoStiIUlL3Navokx4xCuC2lGnRXC?=
 =?us-ascii?Q?pXLIawmeuF0Cv6GPkSEM8NZzlYrpse/MzBRqAU8yuAwdUrp6DsMFvD4ryQTy?=
 =?us-ascii?Q?RtZaN70Q3kiW3AeiaB/QSJ33PknVRJpo0gFuPgp1zaK56A7O2tcHFBsbtLA7?=
 =?us-ascii?Q?b5mTAxMJx0GkkkEuerkCmW5lUQY3Ls2M9/5fOn0PPSWnWMOhuSLIFEDeJFb5?=
 =?us-ascii?Q?F7GDT9qY7wcL6xG2WSEUN/VA4nkqihWbBoOiy/Bu8zQduNlnflzol0nUow+E?=
 =?us-ascii?Q?Lw03wPy5cTLJKhHZap+Iws8N9JiK6n03dYnkOWBpUYFKUYVnhXaudrDvr/iA?=
 =?us-ascii?Q?GSIk7u5oxPPX2BlGW885aRdesfeDdn1RAqVV3yjtwXbAMJBtHNtexKPX3vYj?=
 =?us-ascii?Q?Z56E9A6tqbD/eMSxxdJF08ZMhBr+uQk9FxGZrTd96xAm+w05DnSk4Jau3MHy?=
 =?us-ascii?Q?0K3MlMN8afekMgIq58R7mbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2EaNdaZ2RwOnCArvm7BLFZ4mizThGo91WDyJN1GgplRQI99AeDnDDUQr/Yg?=
 =?us-ascii?Q?b+CumKPQzvCBPWrFlds0fYgcAatsRHZ1XeAngPYmYuZIWm/MzHbZ3274Sk+Q?=
 =?us-ascii?Q?sKNCh82UUrfPwyBSdcyuZttH4IWPlSXtlgY+ZmyIUdeUua+ipoOdGjCCdKp5?=
 =?us-ascii?Q?YbtjNAlzmZesj/YIarBGKnM2FjYeua+AXYJy5lH1wrWJOqyJ28/8N7LTtB1s?=
 =?us-ascii?Q?lrijgnw9Ogg35Rlqx0kU0Iyd7+9uU5F50csa/Lx3hUwl+I5KapRrFpOfi/MR?=
 =?us-ascii?Q?iyiXl9TBxjjOw9WCAzsNSFc8qkIKr3V6eYM6dS8aG26TRGJly9mLB0Miffqp?=
 =?us-ascii?Q?F4J5BZRiWGYsjc/zuL1q/jYecdbP404Vx1SZUTLhnTHUS5mlpBFgpMaLoNok?=
 =?us-ascii?Q?MsNxL2kzOtz4Azzk06lPkEFmCj0Fc6SWstXRWzUb+5ATOOIjZuNgG9F9Crt6?=
 =?us-ascii?Q?5mTU0uRjV3pP0yPhx3XCIAJLQFslqQV/KuDmQRyfD2HKG3HVXqZyr5n52U1T?=
 =?us-ascii?Q?xGL5SZKJGw0FohrbF2+MINiSVVO9+pixdnBI0hbWU9/OsPBM8YsWzHK+bwk3?=
 =?us-ascii?Q?8FDj6CB9fswurSbh61i4YcrfNExSskIkTI5F8d26Mie++hiQcQooP7jg+EuF?=
 =?us-ascii?Q?kl09SX3VjHWsSBYjY/9S2UZNWU6WhoxcMpUk3Oc6Jk1UUw5FgcgO0uxqXBHe?=
 =?us-ascii?Q?z47nfHixYfPf2VNmDrbQs9XmKSGDQrjknP8ncQvUypI5MUGVDCeezkWmMavs?=
 =?us-ascii?Q?8TfPlLZo5aaHG1hgqA7Kxl8B9w1r5lTYKUzYdx02RXQ23L25utmQN2xhBRMg?=
 =?us-ascii?Q?5tHbzaqA1AhBc6pEKzouh/zjVViCx6Kbg3HemehAupcnLGAKtBwWQgv4g1en?=
 =?us-ascii?Q?7HP8aStlG9J9wM/FdSNDqgYUOk42N5s1ZPZ13I4+LK/Jw9PO64vQxu4riAGS?=
 =?us-ascii?Q?uhbwPKMeh+Vn8CDOlEMy+WabKDJ4fZaE+5sCzPKrgq0TI9ZpJHEvroxJnRir?=
 =?us-ascii?Q?pOa/lPiQoZvX0+lHxscxYrwhZKuVGT+UJq2o6MlZIaS8bj+jOoPi5Ik+OXbh?=
 =?us-ascii?Q?kwkeDuDyT2fw09gHD4V/qalrqWmWSm76SdKDP2lSIyneRLfYKVTVTbUFEMOa?=
 =?us-ascii?Q?mLVkbyZSlgziaTrOqmuEtfsnE+iUN+kxuv4PKfqR/Cu/e7HThjKv4mtAPXUx?=
 =?us-ascii?Q?UqGLYvqoLAmuRDC63DNNqMO/oi2LVDnUapyJHtFaeTNdc4yjOZTixBj6Uxh6?=
 =?us-ascii?Q?xNx+YbKLXUp+ovS9NSRmWHAxDRSUMoAKZqtwozch6AFwg8rm9+m9E1Ynyf1y?=
 =?us-ascii?Q?FXMlJhJEieUFHVT8LuWGwfCQppoT77HEPwhhRniI8X3gwEPKEHKtN94duQmw?=
 =?us-ascii?Q?wQoMXsA495jwhB96Pthem09xIzjpcdgc00Rt2E6sWlBupzlD4m3zgdnNOvW9?=
 =?us-ascii?Q?kU95NgViH06M0lpThRa8R2KqENXPnNbq7fmxkvGXcc/KTl5tHu7Git/cqVlg?=
 =?us-ascii?Q?VodVfTdA0ymWnoDNnpcz3v5rqvcOe7Gl/cDYWC4+763QQwqdCu2I5u9SSK+q?=
 =?us-ascii?Q?Idedu8uACaNJs4eITbGuMwo2MT3cK1S8+Aui4k5kR45OAqsBf2yKgGw+idbG?=
 =?us-ascii?Q?8x3no3fDUtqRknwtEgBHS4wJ8iQbx4Zt8nZ4qlLbfkP0BAbm4qpH2D1m8NE+?=
 =?us-ascii?Q?O0PCYvfQ/8B8Dc9P9PAH/1Aqz+VR4822EveHOSnAj4CRDdftQjtxBqqkiT/P?=
 =?us-ascii?Q?cfzNO0rGMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb8f476-335c-4a80-3908-08de57410112
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:56:23.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUbupXGmcm0ntMRjUV3ih/tsXWTZBtqtMsOM3EyZwaQwIjIt8a+uVL/z9x0emnb5wOe47nV5viGsdvh3JsubVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_095627_723900_8860FC48 
X-CRM114-Status: GOOD (  17.56  )
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

From: Jindong Yue <jindong.yue@nxp.com>

Change defconfig as tristate type and add platform driver
to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig         |  2 +-
 drivers/clocksource/timer-imx-tpm.c | 36 ++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 7d0d55c91c3f..511aedf52a32 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -612,7 +612,7 @@ config CLKSRC_IMX_GPT
 	select CLKSRC_MMIO
 
 config CLKSRC_IMX_TPM
-	bool "Clocksource using i.MX TPM" if COMPILE_TEST
+	tristate "Clocksource using i.MX TPM"
 	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 92c025b70eb6..419d094459b2 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -8,6 +8,8 @@
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 
 #include "timer-of.h"
@@ -152,7 +154,7 @@ static struct timer_of to_tpm = {
 	},
 };
 
-static int __init tpm_clocksource_init(void)
+static int tpm_clocksource_init(void)
 {
 #if defined(CONFIG_ARM)
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
@@ -171,7 +173,7 @@ static int __init tpm_clocksource_init(void)
 				     clocksource_mmio_readl_up);
 }
 
-static void __init tpm_clockevent_init(void)
+static void tpm_clockevent_init(void)
 {
 	clockevents_config_and_register(&to_tpm.clkevt,
 					timer_of_rate(&to_tpm) >> 3,
@@ -180,7 +182,7 @@ static void __init tpm_clockevent_init(void)
 					1));
 }
 
-static int __init tpm_timer_init(struct device_node *np)
+static int tpm_timer_init(struct device_node *np)
 {
 	struct clk *ipg;
 	int ret;
@@ -241,4 +243,32 @@ static int __init tpm_timer_init(struct device_node *np)
 
 	return tpm_clocksource_init();
 }
+#ifdef MODULE
+static int tpm_timer_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return tpm_timer_init(np);
+}
+
+static const struct of_device_id tpm_timer_match_table[] = {
+	{ .compatible = "fsl,imx7ulp-tpm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tpm_timer_match_table);
+
+static struct platform_driver tpm_timer_driver = {
+	.probe		= tpm_timer_probe,
+	.driver		= {
+		.name	= "tpm-timer",
+		.of_match_table = tpm_timer_match_table,
+	},
+};
+module_platform_driver(tpm_timer_driver);
+
+#else
 TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init);
+#endif
+
+MODULE_DESCRIPTION("i.MX TPM Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



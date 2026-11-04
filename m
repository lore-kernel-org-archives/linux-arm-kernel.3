Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C48606EEA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wVDKyTJu;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mXm+XufE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wf8G+EDMbK3WbK1JwnnNbeYNXKsIZqc+8B3kYyKVZnM=; b=wVDKyTJuBPrEc/ffISwOZywEQK
	JCGuePTNg5/01GN7+D6QBc8w+IrKMJ8/D6KRLU9NZevaHueHOz0BCLvjjlkRV5mMGKHoA2agMeKVF
	NpsR0rGWGj8+1NcqFEVM3wqk+jqqoHB1me7SNmr8O0SxXi+5QSKvUqKFhF69EzOVtP3vGVR/qjBNb
	McueJkfwFwUCgDWJe5OT+Mr4wVaZ8a9LQXUnuIDeY4e3cstEm/TLtsCVQa7lQIOyFzoAZNQe0pn1x
	mYBPNS0aSIGRoH6l0Xj9Da6KpJT2o7oKuAwVqQPDLsVqI155uJMtv/Y/C6B8sYWw8RMKE2YVyqN0I
	7fSpPoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIi-00000005BaF-0L2b;
	Wed, 04 Nov 2026 11:37:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIe-00000005BX0-1fsR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVp73mDtLVEYU+SBd16y0R2JmH0YkcbHaCbwTlcx3wV0kZm8X8B3X6oOFOwtdlB5XxokC87lq5ohH451em7YV8pgzAUaB278sEQPuThjvMI4/uNBeNa3g6b5QsosBhd4WYE20zS4HlO0tmzFRY+6nigigld5pmHE5XKRAN9SB8KuBSJ3w3h8CnWS9TXSwkQGnlGzYs6c7Wz24W6D62c6gAOXKIgTQeJkLzPTzpTHpOzpUTdsQaDMeJ6cPDKe5B7EDPKZR/3/6iSk1S3oFkmFVlES3jeSP+O0rIWwL7J4cPHQ2FyJUoHtqnPfWD/5V88pktKS18SkGa3dcZU9+4fFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf8G+EDMbK3WbK1JwnnNbeYNXKsIZqc+8B3kYyKVZnM=;
 b=dDlhWkSJ99VAZNFUv+2TSOiVD0nfAemlttZ4VZ3dq3k3mO6ixXyT2dcxx5vCzreeDOggOJm+kWzi9W6JWaRDFFYRtr3SZ/nbqS7MW5548R/aGumphqpf4cfsF4gui0iZnZ0bRb+1GyWBkWLrg1W4wgIRYchpvFSnHdV5KaaXsaVRctsCkJfcPqq7OaqZcBYgXa2xxW8OYIvbWHs8xJBwLcBGbhLk5bhi36oKZ1UedBDge8K9MGn3TcFjEhjX3ssOqE/YsRc/xsi1Tmhu4dkN1gJmqD/IkZzTXa1rhxeTfbjsuA7qM8X61bArkZQSoRcRN8aXwQlFf7Xen3GeO6jcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf8G+EDMbK3WbK1JwnnNbeYNXKsIZqc+8B3kYyKVZnM=;
 b=mXm+XufEXUhcnTkE4nmaWkOvQwl3+sIDBOsbRJDM5E+Pf1b7ScvaNjl9C7CKYfYGNMifL2gMd8/O1v8RhL5RnuqraSD1MV0/jTHFD5eV5OHlZ2/KYSZXCOP8LAdHbcVLAmiyz0rHjWoAT47OEIRs35grVZnMRzZh/dkbrMsjrqgGLXmb91oKo70llMSxRg6S4GUl/J+O9CmENfOrwx919bDKlJ7pl0xDPcJbF/fdvLqu4uh+GF22qwaRjZqKpeJq7A0SoiUvpftrTAYAJd/zsbf2YEJ3QLhQj1+d3qjgCCgybTAM78fBGuRRli6kX6+CZKKHr9ofD3lJ7yDxRGGRbg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com
Subject: [PATCH] gpio: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:09 +0800
Message-ID: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c41c0d4-b1ad-4659-0834-08df3a67dcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|23010399003|376014|10067099003|18002099003|3023799007|56012099006|11063799006|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: vxbeefHIdVPcOdiNAS+m7mhVNwoNXr4sSKR1T34OtFsKQ1D1nhiAJiSXV9QH02H6rKl9b3JE7nMezZPE8czNzv3JayNIvZvDhONhXPbWWhJ9KQq7pogDkpVC22e7Emks6/MJBq7eFLUUhmCA87QQIym35oasIhloETI11UoCqZaukWzm7D0fsMrJNWiSon0yTmPOR0hdPb3EF7uYbXxYVO4oJY6IBPIt9mnD6ZYfZP//i25EQp3g4JRZFU7guPTHD1D4Sser5RyqoT6HmqwWGZMF7fkNgDH4z3jYGZtAXhnGwhZ/cDfQtyli6ZBxIOqBWGruP2aWEK2r5SuH8CaZs43GqXRAL1Cj87X3xI+PRy7Q7vz+AeYSzC/cEOkKoJ+tEc9VsOEV1pZC9I80H5fWFFH5mGpATTa+zKeW6jaAih3b7byraGaPjcT0hYc4j1C+uwMIl+nTcvgDJjDtI9Cwxcr4WOG5nH8n0JaYHGvQuc5/tmIMDwMO5i2cCrHTTUoOi2h0lrj9OFqAZxLtoukxbqPgIrVy+cIIdFbaiUccme79jfsLkQAyryH9hIPzkwjd/edDypOVGzpbb5OQguxgSJY3wZcImX4UUdfwe8onNeQSzYvl6R7NsTagI+DVUbnp5DrjOqZPi5viTl/5kWXnLVHwXa4iPfLq/2gDYSpRayU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dHnTdGfwVexFPSa5Mpd2izRY2g/PcPktcjxqQt0fQHmXnqibfwc8iK0yOS+4?=
 =?us-ascii?Q?uTT9Sxrhy7msMQ3utTC4VWnF95+h3lsAsIjgq7J5oSMESPAgnOAM29Sg5Vwx?=
 =?us-ascii?Q?HrfwMlBxxgtqhzfmei3CHvzzUPGhDfrGoop4WPr2bF+qYUqHfuc1v4EsFhHh?=
 =?us-ascii?Q?mXkyacz8k9YxMjImL2tE2uBlyQFSlIdY7WmSjY4TntMA24I+HWijbQijnFm7?=
 =?us-ascii?Q?Y2KsjOi0y4avP3mqoEW0rVkf3H7QRDQ+yATltahNhgCI8710pSjja+1Sr6Ln?=
 =?us-ascii?Q?kiwkXsHPlrfRHzlhN4ImCZtjj9ItDeFu6PggFf+WXgqRhSmAJw87wTNv6bWw?=
 =?us-ascii?Q?T6OWiWffZFhkbiDHrNDF/G/9mFn81EI6xYP48/HMI0ngGPVDkcvzmUs5EY1M?=
 =?us-ascii?Q?dtJRHoHeA62pLVRa5ZaGocY04/fTyabJzDuct/ZnEksuo+iItdapqVMbOf1t?=
 =?us-ascii?Q?eorb7PVvOGLTNhCzToEsllc1ml5EfohTUd+YrDWj+apG5coNizM5+LdKqVF2?=
 =?us-ascii?Q?5obuy7vbzSrYNVSSoPUbzWa7S3U2oXvOWIdBLGirfTiBwbDrHB6MISq0JqBM?=
 =?us-ascii?Q?QIw6RatFye7Acmj98UFtCGHjckDschPo4HF2HW6/JLYHOqigsajLpJiCwNAh?=
 =?us-ascii?Q?xSBXxPdhXtyRZxChkJArPZOHgErrWbzIveYJstAQuvQAG8fChbBagnH1XNmC?=
 =?us-ascii?Q?qHJ2+sTHkNPpaMaqWeWNuHn6/ONzOcS4W+Gnem5T3K+mnoFZKvHGVh+sSqZG?=
 =?us-ascii?Q?hBworlFFrO+PT4zCO0iUicPgEE/cIm3BmlGFzE8xGh3rs6FSXC+EKQX2pqUF?=
 =?us-ascii?Q?Lzx5+nlVWxXyUDHaxi7ZVHDEMxbDELVCzgpP9rk1K2wyea2Qq86qBtOQq1NT?=
 =?us-ascii?Q?J4uFJLfOhzzxfX2bMehOMCoba3grKQhIzZXEKCpu3oonVxWckybqtRyrY7p7?=
 =?us-ascii?Q?06o9iv/Pa1B5EHKY2p3SOpQRkXTqPIh7K6KpCZqTAkWrGFVaaVRY9YGjnmQZ?=
 =?us-ascii?Q?d5HfvlctVXAfJu/IOTaWsktSNDle+1SjPb9gHkMPFjeJphujOuOPm+iIC91a?=
 =?us-ascii?Q?ZNs/RhetGsc88vVXPVZyrv54jxLbciuvsdF084TvK1vpE+pC7onKb/GQSjD6?=
 =?us-ascii?Q?xzifCaNlS2EHm9JkVo7Em2IQV8SD96GWRzKTU1rnUmaq2/KN77VtrU1PnYtP?=
 =?us-ascii?Q?Pt/LRiWUasyyts//fn75yv1EbuiLYII3B/q685wXd0H4QtYhwZpAL3svWA2F?=
 =?us-ascii?Q?2SVYwBp/da6OkcHb56gb7a5n1eTWAaes48WKXm3JAVOvAAgl3obybzxYZawR?=
 =?us-ascii?Q?R5mwQBNuBrGwtYJppBbHXMXmOXHAM5aZjHGlrcRh6phuDgFwM6r9d70ei9vn?=
 =?us-ascii?Q?GVfoM1ijWeRoBBkVsMjn7jnI1HWFwo8atDtO84g0iDx2FA7IASLTpXWax6tx?=
 =?us-ascii?Q?MQNH6fnHSlbK7r2h1oDUeOyyr5BE7wnn36LY4eYE65BwmUV8PLzmxcnPqN5D?=
 =?us-ascii?Q?VSN26m618qxUVkt9pW8ZOrlSDH890Vrs1XjWYrq5n1aO/7FUnoqkCVhj3P9a?=
 =?us-ascii?Q?5+PR2yZnrJX0pm+8MHclZQCEOteSE+b9xM6/wT5OdjgdDTKlzlPnpOz4haBN?=
 =?us-ascii?Q?QbB5svHQgplMyR5AC9dosB65diJxpb/jM/q0A/iRJud/baXS+niwAcCcES6G?=
 =?us-ascii?Q?9/z0p0U35Z/M53mIWKh00gK8qhpRTYyzjxMQBxyFU6FllQzdJdAnHv4M2jpA?=
 =?us-ascii?Q?e8E6ysSBXlvXZHEaBBBsdRjufjuKdvx/BUg30hKP0Yd6J4qSlizx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c41c0d4-b1ad-4659-0834-08df3a67dcfa
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:27.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAebueKOD3zdG53xawOQSYPwWeQzex1ArFMcgCqkTb2KgTuNu/wqSgtUawc871FgVaEX9hireHLJMADPcqRQdfFOylPO83xHuzByFGXSJmRbdOeu0Tg5bVb75UVMNWIW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_033704_585862_9471F324 
X-CRM114-Status: UNSURE (   9.59  )
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

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-altera.c    | 13 +------------
 drivers/gpio/gpio-da9055.c    | 13 +------------
 drivers/gpio/gpio-mm-lantiq.c | 13 +------------
 drivers/gpio/gpio-palmas.c    | 13 +------------
 drivers/gpio/gpio-stmpe.c     | 13 +------------
 drivers/gpio/gpio-twl4030.c   | 13 +------------
 drivers/gpio/gpio-wm831x.c    | 13 +------------
 drivers/gpio/gpio-wm8350.c    | 13 +------------
 drivers/gpio/gpio-wm8994.c    | 13 +------------
 drivers/gpio/gpio-xilinx.c    | 13 +------------
 10 files changed, 10 insertions(+), 120 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index a6ac9356229c..6c30608bff89 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -272,18 +272,7 @@ static struct platform_driver altera_gpio_driver = {
 	},
 	.probe		= altera_gpio_probe,
 };
-
-static int __init altera_gpio_init(void)
-{
-	return platform_driver_register(&altera_gpio_driver);
-}
-subsys_initcall(altera_gpio_init);
-
-static void __exit altera_gpio_exit(void)
-{
-	platform_driver_unregister(&altera_gpio_driver);
-}
-module_exit(altera_gpio_exit);
+subsys_platform_driver(altera_gpio_driver);
 
 MODULE_AUTHOR("Tien Hock Loh <thloh@altera.com>");
 MODULE_DESCRIPTION("Altera GPIO driver");
diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 1949a6ea8ec6..f9ff2f83ffed 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -150,18 +150,7 @@ static struct platform_driver da9055_gpio_driver = {
 		.name	= "da9055-gpio",
 	},
 };
-
-static int __init da9055_gpio_init(void)
-{
-	return platform_driver_register(&da9055_gpio_driver);
-}
-subsys_initcall(da9055_gpio_init);
-
-static void __exit da9055_gpio_exit(void)
-{
-	platform_driver_unregister(&da9055_gpio_driver);
-}
-module_exit(da9055_gpio_exit);
+subsys_platform_driver(da9055_gpio_driver);
 
 MODULE_AUTHOR("David Dajun Chen <dchen@diasemi.com>");
 MODULE_DESCRIPTION("DA9055 GPIO Device Driver");
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 1bd98c50a459..2ddf63357127 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -146,15 +146,4 @@ static struct platform_driver ltq_mm_driver = {
 	},
 };
 
-static int __init ltq_mm_init(void)
-{
-	return platform_driver_register(&ltq_mm_driver);
-}
-
-subsys_initcall(ltq_mm_init);
-
-static void __exit ltq_mm_exit(void)
-{
-	platform_driver_unregister(&ltq_mm_driver);
-}
-module_exit(ltq_mm_exit);
+subsys_platform_driver(ltq_mm_driver);
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e64ee0487718..da699c419823 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -210,18 +210,7 @@ static struct platform_driver palmas_gpio_driver = {
 	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 };
-
-static int __init palmas_gpio_init(void)
-{
-	return platform_driver_register(&palmas_gpio_driver);
-}
-subsys_initcall(palmas_gpio_init);
-
-static void __exit palmas_gpio_exit(void)
-{
-	platform_driver_unregister(&palmas_gpio_driver);
-}
-module_exit(palmas_gpio_exit);
+subsys_platform_driver(palmas_gpio_driver);
 
 MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
 MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index ccdf13a741b7..12b1778c4be9 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -545,18 +545,7 @@ static struct platform_driver stmpe_gpio_driver = {
 	},
 	.probe		= stmpe_gpio_probe,
 };
-
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
-
-static void __exit stmpe_gpio_exit(void)
-{
-	platform_driver_unregister(&stmpe_gpio_driver);
-}
-module_exit(stmpe_gpio_exit);
+subsys_platform_driver(stmpe_gpio_driver);
 
 MODULE_DESCRIPTION("STMPE expander GPIO");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index a851702befde..6ea0be23ae7e 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -619,18 +619,7 @@ static struct platform_driver gpio_twl4030_driver = {
 	},
 	.probe		= gpio_twl4030_probe,
 };
-
-static int __init gpio_twl4030_init(void)
-{
-	return platform_driver_register(&gpio_twl4030_driver);
-}
-subsys_initcall(gpio_twl4030_init);
-
-static void __exit gpio_twl4030_exit(void)
-{
-	platform_driver_unregister(&gpio_twl4030_driver);
-}
-module_exit(gpio_twl4030_exit);
+subsys_platform_driver(gpio_twl4030_driver);
 
 MODULE_AUTHOR("Texas Instruments, Inc.");
 MODULE_DESCRIPTION("GPIO interface for TWL4030");
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 489479d6f32b..b16aabcef57b 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -288,18 +288,7 @@ static struct platform_driver wm831x_gpio_driver = {
 	.driver.name	= "wm831x-gpio",
 	.probe		= wm831x_gpio_probe,
 };
-
-static int __init wm831x_gpio_init(void)
-{
-	return platform_driver_register(&wm831x_gpio_driver);
-}
-subsys_initcall(wm831x_gpio_init);
-
-static void __exit wm831x_gpio_exit(void)
-{
-	platform_driver_unregister(&wm831x_gpio_driver);
-}
-module_exit(wm831x_gpio_exit);
+subsys_platform_driver(wm831x_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM831x PMICs");
diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 46923b23a72e..30936ec32b05 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -125,18 +125,7 @@ static struct platform_driver wm8350_gpio_driver = {
 	.driver.name	= "wm8350-gpio",
 	.probe		= wm8350_gpio_probe,
 };
-
-static int __init wm8350_gpio_init(void)
-{
-	return platform_driver_register(&wm8350_gpio_driver);
-}
-subsys_initcall(wm8350_gpio_init);
-
-static void __exit wm8350_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8350_gpio_driver);
-}
-module_exit(wm8350_gpio_exit);
+subsys_platform_driver(wm8350_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8350 PMICs");
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index a0665cf3ff2f..d0c418bc6e03 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -288,18 +288,7 @@ static struct platform_driver wm8994_gpio_driver = {
 	.driver.name	= "wm8994-gpio",
 	.probe		= wm8994_gpio_probe,
 };
-
-static int __init wm8994_gpio_init(void)
-{
-	return platform_driver_register(&wm8994_gpio_driver);
-}
-subsys_initcall(wm8994_gpio_init);
-
-static void __exit wm8994_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8994_gpio_driver);
-}
-module_exit(wm8994_gpio_exit);
+subsys_platform_driver(wm8994_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8994");
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 9406ce85f933..e7c483f93d9d 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -676,18 +676,7 @@ static struct platform_driver xgpio_plat_driver = {
 	},
 };
 
-static int __init xgpio_init(void)
-{
-	return platform_driver_register(&xgpio_plat_driver);
-}
-
-subsys_initcall(xgpio_init);
-
-static void __exit xgpio_exit(void)
-{
-	platform_driver_unregister(&xgpio_plat_driver);
-}
-module_exit(xgpio_exit);
+subsys_platform_driver(xgpio_plat_driver);
 
 MODULE_AUTHOR("Xilinx, Inc.");
 MODULE_DESCRIPTION("Xilinx GPIO driver");
-- 
2.51.0



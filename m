Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F6606EEA7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0MYJqTz;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UAcsssjW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EwpRiMoqHUXYVfiQc9b+bRzERdvNt5hE0RxnPCcBvDE=; b=f0MYJqTz43Qio3DivaJrijh7S8
	dzqLQlS7rDN5Pt0tU2W7NXwrOkd+yJHKy3qGrwNy70+uYrbzUMg7ItTfuI2zIwgRkiOBAfQtQqpGN
	3TD2g/8Ce1RirfRe9xUM6DccHrEjZVT9YnrVLgtZ+hSnfxgDFVJxD2mc1NQJRyIVusCCg/dd2IIXG
	Xp/oks1kjikMpwF5nYjDTrQv4tjI9UXlT2sFi62Vz/x90ITETLII34h2hZmswVsDivM/SXUmt8YeD
	w15xUeW+xfwtvASVVFPiLkoAnSLmR4PGviCWej5eMRfPMpoKiZfkQ0RJ5whONodS0OyfvxlMcwvHc
	Mp5GQ7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIi-00000005Bac-0jpO;
	Wed, 04 Nov 2026 11:37:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIg-00000005BX0-0wgT;
	Wed, 04 Nov 2026 11:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js1S9JiR1oCmob6oyivZRZvFvDPpE50YASmmKwpNkOTPlXr/6JQejlNlrwPKMVHENOBTJ41+Gtf2EvHtC2lQrQPQ3h2lQbqyQQcRdHUpFejFxFjWFzi9L0e0kNmjB9Sy35d/fobDvJbz9G9dK0yShdUfFJhWSs/L2yZOhH3XwmbnMhsCAYsKZQajPWH48LghG2ghay5Fib15TQBMD4VjzsDjmhdTMD/tcjkwEVHD1gMDTo8DDmx8RNALZ1Adai9qYnZsZRcokyWMojN5X12jqlBDJHY+NexnJWojTrvkrOHseuhV324y0gGb61t0d/86yCI/6lynDmSogmWcM27NjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwpRiMoqHUXYVfiQc9b+bRzERdvNt5hE0RxnPCcBvDE=;
 b=pUwRH8epCNjB4mKOE1JsAz447qiWXe4R/g0yWjKyU+AM2Tqjigl/JqcUf7DSgUXH0XUrzyVVMducUiRb94bgRaA0qnjareD+lr+F5LyRxenHe3ne+ZuskAN6xfdfLsx2Fqdp7KnivXOLuFUxhLvHmvpHgrrEFq7xTRZQhL8y4E4/al9864N6xd6rMxBE1QC+MkaIjQAr1rMtVxbLzW4k0wUiXUcqZi8CSQV8G/C6EZWdFD+eFzoOhZ61O7okFuQGhMM7xcefbdTimeObpbxafBovHZtWiPXlfK9Q+PxryyyZ3qd/6Kv4WPQ0n7yEZggIG4busc09y6Kg+IMOO4K2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwpRiMoqHUXYVfiQc9b+bRzERdvNt5hE0RxnPCcBvDE=;
 b=UAcsssjW9R6nvKAGoHoA4pPnfy+by7Dzstt1xCsKY0Pcxm788d8jDRpNVqFotcFmPxV3+wVgNPxWkib6PjaiEXB6oFFmitgk5GdjtpBNd/cN6Eo72uBUYZd1ijETRMA1dHafNrqdZLRum0QS6cdVTsDECPb15qxJQFdERaATHdSsW6QnqdP5x/DU0W+Uoe4aDHS3xCpAs0EwH/f5TILbl3gML/yT/bo+KglIbm0NKPU3vyeov6x/QffKgGvFakD3B98r9M3xseB7dh0ozJahKrRyF8zyy5oZ/HhDb4GfyLXxLQkZAhRSJnGQqzWp80d3LNh59ntgzic9q+fo6tnQoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mailbox: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:24 +0800
Message-ID: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf924cb-fcca-4102-c8ee-08df3a67e588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261022105027099003|261009223027099003|261022075727099003|261028144727099003|261021123027099003|261026140227099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: o1RfgM5DTdgIeKM0pS+Io/QVlb7HokucnxDIewROAoWiNLKcbTX6H/0T+V4wWBWB3oh2GJa2teNHxsgToq4RNuGVi9JbEdUxTxMn8S4ueWyIcqbLffKIDt88Vjjmw0Go3Mm9dVNDP0OPwnX8jEvEo9lIecjTzts0Nok0cj/OGwwghUNFnIQLOvuQinRYtiRIM4L8ZfTqXuGQzS+272TtJKSEyvgIQ4g05tTA3LHvqNvwXpUiWjEWBpaJNvpkBeFvX1SGUOI3bXPkZQQD2VYo8gbYwrL1WwJrsCCRiLkIbEfZkcGRpCkILj7WYrKqnxKHWHS6N8EvR9HX/ahr8Z52oa70gdLFA5PnIKEeykDU0AWtt4eZYB3xTtcB6Nm9qa42srZ2ampXxbI8IEswIt9H4xF/nIC/0+Gs33RtcpU53jreBGFiD66flRiroxHIMhLQo2B2/xxlDa0HSpw8FRtOWSaRDc69L3yCJfiabzWxlqBdn5vJrGehHCUDp00sOkN7xDaY/PbMuWDhP5WIEq/nLa95crJYAqK2aYAMhEX3sLPCWV3NDNY77n6nksJM12JKOyKx/a4Vqc1MjzVt/rdpdqT7ScP28v1j2cdVBbdnVpgOSByEyQAsx0ETgQbzYi8ibwwPo2q8OTy2PuAz07LoTCnQyoqNBpFs1s2EqtfIHNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261026140227099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUHdTMfhcHNGjK7523F5VxKgS96ytABF84PsG/KNEDvxpAVzTX9lSJ2Xob5F?=
 =?us-ascii?Q?qmY+yvw2I9aeor5Z2a4fPGgzp7ayL/IhN3D4YLwFv/tB9IEdyMcKyKSdylx/?=
 =?us-ascii?Q?Yy8hVOV6DJxtObbtYyyrkdfOn3Ug+T4B+BU+2HHwbuRINJcAIour+2oBsvTM?=
 =?us-ascii?Q?TIwTWgypI7IHotHF3i1k88sDYnr0eTN8JnYUlIIpLRDEMSB7sNi4B5HDqcYi?=
 =?us-ascii?Q?gUdG+hGlCcVxoWkyQpgBQauJUoKVJHNvs7fthbBqNaOQVeF3uVq/ofKGBtAN?=
 =?us-ascii?Q?TCSkdL3pBcl1uRLiCqt9H58tclCW6TCjaMr4GLSkdt7AH/RsEf7kcp8AKtzS?=
 =?us-ascii?Q?pHNncYqMySbTeERLh8PuXOGDd17mgQ/gUUTGDN/bGtExUYFG/h7cWDAAdVCW?=
 =?us-ascii?Q?JmfMNmDX5v8TjSA1lCxUknvH0ivzapnvWXx9nYLx0hSjkAXqSb/V8Mwef5ub?=
 =?us-ascii?Q?SZM3xeTOBFsTwUnCGvl+KffDJM7UivmJy1XhTtdvlQVR1R/NPzDsDI/FXxiD?=
 =?us-ascii?Q?urtJf0piCpxdiSQuoZ8gOkpslcu0LsdE1US8k88feRQJfqXe/FSFhIWgHLT/?=
 =?us-ascii?Q?in40SbnUn4WUjIOxrowHLkUv8A9qbvIhqVuHPP82shV2G489PYNsIikl9A5K?=
 =?us-ascii?Q?jIRjKnMzzyIZhzQjtehtSPLejDyVOKLwPpLxcrpJ5eX/o8XdOG9SV2LCM9eA?=
 =?us-ascii?Q?8huqm66dxkB7XBEbPUWV9HUgyG/7ww/KLCkavLViUJCroKiaFdA/V12NE7TE?=
 =?us-ascii?Q?Zg7uzdG8Jk5K4aARkfU+L4WlvY+HRTuTXqztBC+23XKiF0b1TmaZ/DaTyDJS?=
 =?us-ascii?Q?tSAIi8XnmcnRosfwja6ZEVz3FK4GO2hKpsB6GSUpduvBi2Nhgr6+ueoTm0df?=
 =?us-ascii?Q?jhi98X5mXlmYtOuI9Ng5ehdWqHcQoaNKEVLg3JQtY853r2/NiXlA99DRhpir?=
 =?us-ascii?Q?Tpg18t5NOA1qpB2HWkMZqpdxgr39TWRX01rWXEfDgLa+FH6FK/DccGnIMWim?=
 =?us-ascii?Q?F8FeBfSE6J0PGBuUxEYowsG5DWEWsCzXcTZ1qadzxgXGPKcmSOWnX8r7i9/b?=
 =?us-ascii?Q?B/cWLFmlN2GNawmmb1bm6AurXxWwq8SDPbzHFVn6PUNvBcWyfZGb/1dWzfDd?=
 =?us-ascii?Q?icZAaXSLlrzhZxFUveC3XMySUs6b0hjHWsdqW2/jHMdVfa7TtNustkKPg6KP?=
 =?us-ascii?Q?+roK6ymWaSrFd/kaVEKyJiDgjpImpMak4CJ2EmzlsXw5r3kidU1XchgTf5R4?=
 =?us-ascii?Q?++iqah1QgjCIqV62uBo5QQw2urwJfHxNDjdmQ7LT5MWDlyobNqUYRMZmyHJ2?=
 =?us-ascii?Q?Ug3DSRmI3o4ysa4ig08CffbtzATfjXT4ta65ld9iGZENUukwCGXPZ3qaHl5l?=
 =?us-ascii?Q?52N+5Ix6G8SuYGZdKtJWX8q4Vi0g15QpCR9OFBwM5ME6bfkoVHc07q+DbuWe?=
 =?us-ascii?Q?KxNN1FOAZJqoOTKV88ZbTa8XRuiSDE8mGkcGnpzrnXbl5zJ2fHb/OcVhNhRh?=
 =?us-ascii?Q?82DyIZG0kNZ29pgpJO+5fFug0VCS9DYJ/MFh5TNw2YzRvmwPdadNqhZHyBB5?=
 =?us-ascii?Q?qSbXHtN8ZDa7ErUIWEBJ4YT/osuXUeE9racbXnHSyOP5HJNRrWG49+L2lgRV?=
 =?us-ascii?Q?ZHVy3lvwHTEJdu4xePU20poqu3ctMGQywzHz0LIeWohmv8QBM/VTBZWxRzP7?=
 =?us-ascii?Q?iMqqlaLSPo/QlhkBXYkQ9TbMrI4a3aOS/wc/8pcVUQ3y83YFNIJwKa1Fp9Op?=
 =?us-ascii?Q?vF/yrpHUY9eDsrZcHI4Ek0LQ+wLacQIiXPyskD1RijI+oFVBGuk/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf924cb-fcca-4102-c8ee-08df3a67e588
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:41.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IHkN/O04vwJebKV76pPgy7T+4WZvG+xbKaJtZhw/2C0LKSUrcVE3RXAmt6kF4rLC55vhdl6vu6Pv/Oy1UNG3zMkDy7qyvNewE8fH/y7/43hX1qLNBI1dR3/J8boJOco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_033706_284276_A5FD4DE0 
X-CRM114-Status: UNSURE (   9.96  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
 drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 13 +------------
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 1f87a84e5995..f489bcabceff 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
 	},
 };
 
-static int __init slimpro_mbox_init(void)
-{
-	return platform_driver_register(&slimpro_mbox_driver);
-}
-
-static void __exit slimpro_mbox_exit(void)
-{
-	platform_driver_unregister(&slimpro_mbox_driver);
-}
-
-subsys_initcall(slimpro_mbox_init);
-module_exit(slimpro_mbox_exit);
+subsys_platform_driver(slimpro_mbox_driver);
 
 MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 96462ca84471..262832753fa5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
 	}
 };
 
-static int __init cmdq_drv_init(void)
-{
-	return platform_driver_register(&cmdq_drv);
-}
-
-static void __exit cmdq_drv_exit(void)
-{
-	platform_driver_unregister(&cmdq_drv);
-}
-
-subsys_initcall(cmdq_drv_init);
-module_exit(cmdq_drv_exit);
+subsys_platform_driver(cmdq_drv);
 
 MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..da7d33435cdb 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1022,18 +1022,7 @@ static struct platform_driver zynqmp_ipi_driver = {
 		   .of_match_table = of_match_ptr(zynqmp_ipi_of_match),
 	},
 };
-
-static int __init zynqmp_ipi_init(void)
-{
-	return platform_driver_register(&zynqmp_ipi_driver);
-}
-subsys_initcall(zynqmp_ipi_init);
-
-static void __exit zynqmp_ipi_exit(void)
-{
-	platform_driver_unregister(&zynqmp_ipi_driver);
-}
-module_exit(zynqmp_ipi_exit);
+subsys_platform_driver(zynqmp_ipi_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");
-- 
2.51.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D96CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl1oXe440//sxdum7zOpEh241bWXp5tMGr4OeKibUT4=; b=XdZ09M1OhWXBg07x8yeYNR01nw
	R2VnqEcvx5pWW2cTW/XMqh+4NknZ0+A6X0eAxlli5fZz/wvjb4njZUVKJtobpEqNbbj3DHa8lcb5+
	qeeJlkVGkMzmfr7vPKBtyX9qevLuF3haR3RpfOjH+G3fJVjD2L/5HuoeLTxninOWzWXZoIqoL90QF
	WaVCeuSssnja/1u3cOw9HXQlu/vnelIjf3aKuVDwmb5ffuDS3f2SxmzcI7taZq6sSfSBLDqEmzfqH
	SHQUUR7PRgXngirXftyYWz5M8v9QwSKBuhhBuYCenFV9XYmdP4Cd0orpqTwJSZbJtAo1vhGgpTgbj
	U5ldKjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsLx-0000000Ea1e-0Y4c;
	Mon, 18 May 2026 07:25:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsLv-0000000Ea0d-2i9t
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pl1oXe440//sxdum7zOpEh241bWXp5tMGr4OeKibUT4=; b=IBHXorDOva52guzciUnBQ4+mwF
	ZCY9XimjE26/nJ8MHzhdcznqNGUY7vLnom8I7ibCLgjJyjdoLu/Jj6j0m7yZA8pLQ+P+vgJT3jBI5
	mszN/HT0PC36kivlnogSLF/HwO/Rr4THxmHPmsmKFRHyKzFI4QU34HcLRXLYxNKs3tBL4cpCzd5En
	Eaxa+Mud99kFNlGhEyb6TeahgZAG2KuAxDOug4CBhTi+RgUpIfTAFr9yEcPuA0VX0UG2Zj+6eaAXV
	5IwsmL1/QHjnboB+bn8Q0V3O+e8fnmQo7jkXjam03N4uKdJnfcE/AOUHvgJc7A4hwvW5uUIb6YOrE
	yo2c6lmA==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsLq-0000000A9yA-1Pii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2ZnsKjKdFHVSxmuz9zxOJODXSheyr2yq6xr1xpb4t+nJF9PNGBxOKv6FV2on6/ay42+oPerIxSsSx2wmUuWRQEWgKnHnALNf+jFv2VR8Vva2lJmzLrQYRm8bkAGPHq3r/1fdXORvIL0bGOhVe+J4fbfdQTchPlSiTjUKs3wcfEeT+AG7Rk2e70CKx0i+WTJkojhf6vv7+9psPHkLw+mHGkUqR6MQdT7oJVLf2aYIDHwh5K7Qyv+xpVqHbQU9s3ymA65+H6j8mMwvtZrxvArqb+9+6Nn4HncqZWxSQBVVqpj5bFW9eMfdZ86SMkX2CZLAP5HM30+UEV1HKEgBMPbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl1oXe440//sxdum7zOpEh241bWXp5tMGr4OeKibUT4=;
 b=beU0Erc4/oek+HgE6gh1qI5kvNGhOyeMqe/niMOU9K+W6ofs5FMZtqoGYnCZdY7Hnj9r+6uBqKJc7b72HQNCewZIKfD/0g8ymThE2h4Hvy8AqNBALIeDM1LK3GYabmj9CztY/NwIccuFwmFq7mH1euvu4UgK9Wu6eyMWJWO3ASzaH/d25Rz0qS8JV1G7t0YQqIFE5ariWVxLru8s+0gQq23eZ/+P6CbESsFPkUmvNgpjVx60qIXFdiKLNEzZKwjzt9dnWEk76EkoRScvfime2W5+hXNYrthl0hDxgVscVdZt7/jBpAK3EYrlTQKtiSBdMl3VYR+qCCe+wd2k45bh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl1oXe440//sxdum7zOpEh241bWXp5tMGr4OeKibUT4=;
 b=oX4eRUWtZbAtYofQsB1+sl5+IZ3/PMAY5M4kiW09sy5Zr3KPOc0ykGSZq7SM0hVcjKsjRqOKx0Jz+aeIhUd1Mi7E93+6j0AJUyUySZ37YaV1ZfvQLPUbvMbGEPoD7rTEnlQTuvjqdo7Oev9XVLATnr2IkZEM8qc5fNA87QfXMjW+RejSHtU3exlOAEiEoTaOTCXiu7lbwzhKzREmxof19LuRcg0VJtHgnWi5M0ZEb7XDZ3ZhUB22GQusgsM8WEGV/5fqkXldXhwXIGJQcsNshYu9fr4NUdR2CIiL84nZCs6jJWvj/s7TbAG0VHwrBWGtNEPip/XqOMK96QOHPZ3ciw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by AM9PR04MB8422.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ea::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:25:16 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:25:16 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] PCI: imx6: Assert ref_clk_en after reference clock stabilizes on i.MX95
Date: Mon, 18 May 2026 15:27:15 +0800
Message-Id: <20260518072715.3166514-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
References: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:990:76::24) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c81bbee-5b59-44c0-683e-08deb4ae9bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|56012099003|18002099003|22082099003|11063799003|3023799003|38350700014;
X-Microsoft-Antispam-Message-Info: V5ZOcU8Q+jWF5k0m8sOyrDv9IRGmieUoKa0mhSo5QCQIMHhW9dhCixkka/rETWO7wtAaw8KYuJZnKLxdywO0hmhRlfSkCK/eY/Iu+AIijuNtcWwEuPOIXhyzFgrhkW+XKVdeqt3CRyYwUhaiAWgHEwvYAB5OywDHYGNK6rOuZ0p6ECXUrIeFoCVGdtlL16jfhOlD2O/+NIaNX+iWbNVG/qGyMhnU2N4KDUrjw5NyDh6VhUINNCIZ2OR7SbfdDLLIXOC6c6XdvN06BdpBBDAsEeVGiqrmOowFWLg2gfeTVKXrh9e6GBWrsZtcPUfpJpK3td1g27F/B81V4LNydJUZI23GzrPaN/TycsHlouuEbTs8rfbJbKbHrNjnbXBuuNg81SzFwJgZVmjFWm7nL/5k/8p+AQzomcmITja2W3Tb7DYa36x9BR7DAPPsMfrFP4+YWwqHvuM4dwk+EIKXq0Jhs39Xv8MX9Hd8bkkA9sjvBwyYqyqTxyYuY5tL5pCmojAEdl6OZkzkxR/F4c1KM/jQ1o1AeArajES55kUtun2Ed5ytKO9ofCtjt4ob4OWx7R0e5cSZtDZpGrBLXTr92Jw94etcuUhcH3mzdRWEGjl9bhbPAEJg0tPpP2USTkE83SuxSSff/VHxg/3CJWNefr35bA+KSpqqqzLLMNiPaGpkGVwIgmwIhJU2eD43yZ9wfHr1wRuAx+lPl839xVWaW3gnOrIZNyru6A/YUcirH9vnJK6HCXsAsg6TuBD9FBCAP4fPs7SJ8DK2fbyjR7HpqDbKWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSl0iqeub/5FAvgkSIJ+oz8epT8dkPNdY8JME3E9gF4wZZuk3Y4kDGn92N74?=
 =?us-ascii?Q?9o6YLOrdEzX9xhjfCKQTF4A4mcLjHpJ+aS5ZTj8UtRU+GhwTxmPRw+8KUJ0j?=
 =?us-ascii?Q?oWPdW/BdtQRYlvBvUb9638hvKsmJ0kILhn16PMPfge7u7Wo/nc2oFTU8lhQH?=
 =?us-ascii?Q?KOPVn9Jsu7tYZeK+yLdynV28tR23tF887Yqqrbz69vMkkGnUq9bgfTJ/f6qp?=
 =?us-ascii?Q?OHKR5tr6NxRwXZ3uC7PefztIuWX7YImK0QC7Z2H6MwMdpWCmOSzPtR1NE2tr?=
 =?us-ascii?Q?U+0l7Mu2A+T7yVPiooTPmyT2eSqAQp97IuDY13+XyjG88uAD1pSMta4eH47I?=
 =?us-ascii?Q?n7wap8M71D0snRvzYbwRvB25t4yT+MEmMur0mjQIiZMH7R4sierBYAzxm00T?=
 =?us-ascii?Q?nzJQ7DtU2RF6CEob0o2ur2So70/eh6mcMicfOsTxG3GKkMHmZX8vTmDSjGyP?=
 =?us-ascii?Q?PXW7oJnmdiMHoOzpca37/q6cp3wexfZiyczrLG5DsoPb3kc8FiC2K6uZFBuD?=
 =?us-ascii?Q?CPLzfJ2sFNH/Ezi0NGcXbyJyL0Jxl2FTDg6AnLvJ4ZOMEc+PzSDK3s5q6bsG?=
 =?us-ascii?Q?odhozkSvL5R6PxJSjzVfH21QtIhZvNqz6NZCBqcKPePUK/I/WEn6Tig31JXb?=
 =?us-ascii?Q?WB8Lqwfxq1EzKLRdxigZ21+20s8hzUpYt+8KROKRuI72lGjBfvWIslz9poU2?=
 =?us-ascii?Q?zGX1a6Uv4Ru07JgKioh2Rxe4B0KtlnfwhhFSdey7vSENhg+Xd5tdz8/44zRS?=
 =?us-ascii?Q?hN0bJxrHMO582zWCpk3MOBTZGQEZYLv9fICcpROVekT/SZ3uYxvhMyhT3N2L?=
 =?us-ascii?Q?JLrj4rBHS0RzRsXw43xp/ZzhtvcXvXUrlFfon+y2ZhNHUi3wOQZoUq8vacK4?=
 =?us-ascii?Q?088OaCqnlr0V2qKvVOW7lEMtvs00dwJmJXpXL0LDSTig0wIlsm9LlX4KjTB8?=
 =?us-ascii?Q?MYpwPza8i9EU/WP1Pq8koEMOsSH6jt8Hfb3d/IABS3w/yNEc3BrDJ1eJXUN/?=
 =?us-ascii?Q?w4p+kbSYM6180iV4mOgnxGKw5rq54MyAObfDMJ2qNdiQj2rdf26GmvXzYczq?=
 =?us-ascii?Q?4AO//x9KICuobMD3YB3300pUrfAYQyziSsjn6MjQflIqNOX1PGzCY8WlnGNM?=
 =?us-ascii?Q?tTlukFEfQ2IdGG0p/gAoZ2160gplmMTMQwJSeil73XtppQCMB3mtHZjZluF8?=
 =?us-ascii?Q?BffGPr+kqe4+vBt+vp4y405oF4X1eKN0s/l4S6xbsushlu7TO1rDN5IKcQ6x?=
 =?us-ascii?Q?tK4XA1DL1c39+9dGJVvEu1Bl7Fa6IVDFwTpdW97/Tastczk4TuAZGy6LkWto?=
 =?us-ascii?Q?RRmZBrChpSuwlOAYp7LsNttbrgyiFk0416ATb1fIuz1tbWINrvDo4g4okfEr?=
 =?us-ascii?Q?MSAn9JhxkYkz7DP9DI/bLJjGYEWfdj+NibcN/NtlaIIum1uqzG1kbhQTpbil?=
 =?us-ascii?Q?7J8eTcMu/ItObg3Xw3xkjg0I8fKMHwmA7kjYNyikYGy6OvUat607XVyRUDsE?=
 =?us-ascii?Q?2SQTNqHHPcjOQe6hTR4Um/8SGYHfd7CDQYYxE+JkVk1OnvNtYBYpy4NXdGYd?=
 =?us-ascii?Q?bn7TDAEEa5du6BnhXKfVEfA/hUnEVigqMLGXbKSIYwF5C9WaLPDPzwqxqwls?=
 =?us-ascii?Q?YFtVW5Mna9s9m7y/lE1/HMJPEdu5SKeJD7O28m98bQGksOCrwyunMt0diehe?=
 =?us-ascii?Q?HyLLBEVayGmReqHfP2dWzTS4H2Kg72Wg2uL80AKjYGDAemKCSxVg8pVwBTRr?=
 =?us-ascii?Q?9KJGh2pWvg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c81bbee-5b59-44c0-683e-08deb4ae9bbb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:25:16.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GC77rakSVaxzBOGsd7+8RhhvNQ9WcCfSZ61+sC2hMJF3xZ1pXhObFrm7wzztGAfc/s6SJuaJL9oyoDq5wqAfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_082523_669692_1A4576E8 
X-CRM114-Status: GOOD (  14.70  )
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

According to the PHY Databook Common Block Signals section, the
ref_clk_en signal must remain de-asserted until the reference clock is
running at the appropriate frequency. Once the clock is stable,
ref_clk_en can be asserted. For lower power states where the reference
clock to the PHY is disabled, ref_clk_en should also be de-asserted.

Move the ref_clk_en bit manipulation into imx95_pcie_enable_ref_clk()
to ensure the reference clock stabilizes before ref_clk_en is asserted
and before the PHY reset is de-asserted. This aligns with the timing
requirements specified in the PHY documentation.

Fixes: d8574ce57d76 ("PCI: imx6: Add external reference clock input mode support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 66e760015c92..c4b079c93648 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -270,8 +270,6 @@ static int imx95_pcie_init_pre_reset(struct imx_pcie *imx_pcie)
 
 static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 {
-	bool ext = imx_pcie->enable_ext_refclk;
-
 	/*
 	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
 	 * Through Beacon or PERST# De-assertion
@@ -290,10 +288,6 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 			IMX95_PCIE_PHY_CR_PARA_SEL,
 			IMX95_PCIE_PHY_CR_PARA_SEL);
 
-	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
-			   IMX95_PCIE_REF_CLKEN,
-			   ext ? 0 : IMX95_PCIE_REF_CLKEN);
-
 	return 0;
 }
 
@@ -742,7 +736,29 @@ static void imx95_pcie_clkreq_override(struct imx_pcie *imx_pcie, bool enable)
 
 static int imx95_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
+	bool ext = imx_pcie->enable_ext_refclk;
+
 	imx95_pcie_clkreq_override(imx_pcie, enable);
+	/*
+	 * The ref_clk_en signal must remain de-asserted until the
+	 * reference clock is running at appropriate frequency, at which
+	 * point this bit can be asserted. For lower power states where
+	 * the reference clock to the PHY is disabled, it may also be
+	 * de-asserted.
+	 * +------------------- -+--------+----------------+
+	 * | External clock mode | Enable | PCIE_REF_CLKEN |
+	 * +---------------------+--------+----------------+
+	 * | TRUE                | X      | 1b'0           |
+	 * +---------------------+--------+----------------+
+	 * | FALSE               | TRUE   | 1b'1           |
+	 * +---------------------+--------+----------------+
+	 * | FALSE               | FALSE  | 1b'0           |
+	 * +---------------------+--------+----------------+
+	 */
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_0,
+			   IMX95_PCIE_REF_CLKEN,
+			   ext || !enable ? 0 : IMX95_PCIE_REF_CLKEN);
+
 	return 0;
 }
 
-- 
2.37.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A291FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UF0DShPB594xmXLdF+/XUGRl1VbjVyxijhtAnek4/uY=; b=ywUcRVM1WCT13q6O9y7MyJbX5L
	mzFbJ1fLhVNez+kN6fsxeoMKwFackl42/r+BrzrgFOh6C9ciVyMZSe+6j4sbPNY+PUvPFETTQHeaz
	GU0fHpyFawDXbczesXKxM/WAZRs9xCKSOkLOjTYz036gqYSAqJp2sACLA6JN+BbilY5M38fRC1JO8
	WjUR5bQYZe8/ckT1mOd1XLyC3no85XuA64Lrn3CtJE++NdYQ43ifgnhg+ZplAcT57TR/ig3AP/MRM
	HEiCJfA7m1MpktzqDewi6xAZZgFtFyfxwec+dQkrUb11hvOLZ9Yfm7vR9dYc3la/b+7FiZ+IcdWhe
	SZtTVzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJOW-0000000GIVo-02qk;
	Wed, 08 Jul 2026 03:56:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJOU-0000000GIVe-2AQ0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UF0DShPB594xmXLdF+/XUGRl1VbjVyxijhtAnek4/uY=; b=hZsfJnXngctyCsXlwWV+HGTYzE
	fPuVDQ5hRdmuzSPTLil9am+++R1Z231AihZELZZN3J9WsN1lirH8u1RT6cuEOaIPi8xm4M1h3Um/q
	uSvE5oBq1maOg/rGQMnViRgPrRUGbVO0Wo2gLtOCJ6EtPaI3n8IyQuyJq1RQyMb7b96y2rldRxqtL
	XYCAQTw5db4l10AJe4vpqoXlHrYL/1HuUnxGQwUYsRVmy7neFA6nBbwdPO2zmGNC7fQ0ZtLA9Ylot
	CAbI3YpkEVryKNwHiUkWPqYCJ4BtOXGTwlUkH80ePcalnoBfYqJ8QviGf9IBiMc/gK2HmGdGn8wdl
	Fib2ytdQ==;
Received: from mail-northeuropeazon11012055.outbound.protection.outlook.com ([52.101.66.55] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJOQ-00000007zK8-112I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jafiK/Q0H+tQa1OFkXfy5oqPDTPxlZh3ZutXvvCueue09jUwBfl6m4Zj1BeG+OdDfjNaWsENvZv/TBCpSjiX5khgRNYjjQS3+1hR8xEHXdkopVPiSENn/AUkAFbAvZs9h86jqZPNeu/mHhfMP1TOQYaRSCrnGnpCptcir+1x0TUL5duTqMnHT+F5onl3UsASCfMdPQh62KyvQ5BnKoR35PbTIYECO00q6dKblFv97I71ep+/BsPbC2zXSYRekOsuKYkdpU4sP4w2D5NpFQO/KmFMGUeudgaow0a/cGOE6FYhgmGbgmlm7OT/k9D58JB9Cvg9ma5GhELvCZquTFoAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF0DShPB594xmXLdF+/XUGRl1VbjVyxijhtAnek4/uY=;
 b=dx2+6/hI37UbrkrJyKVRUajQ2IghSoEOt/CRqaKHDAufZLzdXy129aBGZbhaJ+NCz6zl8gtNoaDqA2o0PigdvX68QWLQYWluBfLD++PC264rNco1/dJDrR5cah2i3YLNfPoOIhqVVCDBX06EAsgGjFencSu2AuGiJG3IGZjNLWm0Pbz8E7vE3nzvvZdEWtnpjw0vZijDFb9/sLNgL3gzmOoWKtQiaXVTjtVqb008uI5eWyswGIBpUw4LETRmMEI+BurkSc9u3dA1Mvacbhc6J3j9s0ez8hg0YTxITvW7ZGHbijS/Pmr6zvQpOT0ztAfTXhlIdbRSXjUv6ArzJrDb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF0DShPB594xmXLdF+/XUGRl1VbjVyxijhtAnek4/uY=;
 b=X6rb9GIS23GQclLA/eYNUMBzQxZIz+u9q3Fjy41VgTV0FGJbsZ6Ap6wqBNETMKqMIxgKBwUI9NG72OlZWlz03SMb8IClSNVLuRtLqZV6JoKKtlqWj5UgT891i+5J14uklbWahIqpsnNsOEf5qnunwEcRjChr8ves9n+rWYYd3EBByciwkmTFwe7YW6yPYWdffLuYCU7mF2sworaxKfnJ4/i9Sqje5TB8UZSoYI0NWKQXHfJxJ/anMb6BYS/c9XF5aPqVycwqn9fTfBDm1emPY/ttX81L23RdfOmGWZ+4xtBG8wt1Jvt+sARFmLQ4ZjjMPCmVccARf6QYYQ47WB+QAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by VI0PR04MB11768.eurprd04.prod.outlook.com (2603:10a6:800:2ee::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 03:56:08 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 03:56:08 +0000
From: hongxing.zhu@oss.nxp.com
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2] PCI: imx6: Add runtime PM support for i.MX95
Date: Wed,  8 Jul 2026 11:59:26 +0800
Message-Id: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To AM9PR04MB8083.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|VI0PR04MB11768:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fa8711-46a0-473b-8020-08dedca4d75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|19092799006|366016|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 8cvcZXGzYAJalQsQ4+aRgLVmsK0E1bx58376/9Z7lQkyiBAGO2Mi/2CdVilEkpWdVkaZ9z0O8omKLergBnkNE4f3bkLvIVfw877s9lJZFxn1MkpmfF36P7ebWorcznYt920z9VeMUi+aMRVESBnbxhXd9rFabEdCBe9XhXYNhmGiTK8Mcy8p+VQ8pKwHyUfni2kyJKT33F67MU17CJiq9zARFBXrXs7tGnbaurIAgeNnR1qjb7VyIrPZU3f3HpYNg4q8Fy7anKcuMHiTSIpVWpVUjdtrlb0tpVX4VLitZ5fPiv/QtKZbf9tJXG+xh7fLBmEdWrM3znhT7AVMneW9u9K02x0939X7Ikcyys8EqALMsytarP1W9jhcXq3XqY+Of6c0syzTrF1uwXfk84tLTsYnHn1PIe8lJmEzntUAZDGhcsOISqZEI6DjobJ7ZvVh3yrhgSZox0Sn2SmfLQq0ZQLXwr2nIyIwtl7GDmX0sqAKEai+4aVvcypMkIMTj+DwZzt7En5mb6O1/L1bDUFQtBoK4SNvdATLOI1mtXIGaL/Tm+HOxI0gda6jFfWUmLzY4GhlM5TGWXVCp35qwlx/7tJxgoUx1wCjhE3uwuwUUAngjV1e798Laobf0zkgYxARnNNhGBlCci3cGh8mKbGlCpw5+4LyGWiD75t7Drk9EtGYX9Tq9EGkRipylnzDSreJysafO2JXVgtZGKv4OhUZBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(19092799006)(366016)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ecse3Kf0pU5e6EjTIGZbXq90Qvw+NvpvMkDfdJ7QzGVoeZfZQeZlCsHZBJRS?=
 =?us-ascii?Q?I2ITXDGoK1iXe0lHQpMFuBIixVe8iRlSBUJK1wHCK9IdU93Xg5NdVCIyCn7v?=
 =?us-ascii?Q?qmPEo4YJsunRBPig/fG3g/ISdPgTHWXNAta1jNKK31rNI3Gm/2eSnj+hfGTk?=
 =?us-ascii?Q?91Y+SCmvnGckW7LEhPv+tQu/OVswtf8iPW4st2vRKz+QbKCwNCqTIDdW22zv?=
 =?us-ascii?Q?d6K6nFk/nsiJICPe8yjR1JFmmehM4SgpJ0UBDrKecs0hHrsvvCx94q4JjQ+Y?=
 =?us-ascii?Q?eyuw1H1gBoqr0S419w/y6po4U+2Suywq6nQO/Hh1++Y7kmC+pP8K/E2DEV1d?=
 =?us-ascii?Q?IS/87lHVDHo+6dHnIyohznLeSPlbljU1EgApQHXNkIXlKbeQ8HEdyKMhikv9?=
 =?us-ascii?Q?zDBsfXTEmzzQd48yNmlDXxj7xCPLEn5WAItA/KUD9cpWF6JdDGaK8wmbSNs1?=
 =?us-ascii?Q?NIPu//tCzeVp6jRwEXNviwsm5bjNUrr/UqbE30aH2DgjzpYozB+bXMdtrjse?=
 =?us-ascii?Q?sagRugNwjkEuUOTaV1fOgIHi4B1ouoTidehycfIcdU6r8GqVcDeEkJisvegH?=
 =?us-ascii?Q?A3T/DYWygt2CJV3+T1bW0lSQXXU5B4eZXjaO6GUU5Z2B9YkNZyuXDsv2iJjM?=
 =?us-ascii?Q?r/Jkf/C9NhEadzzlQK4u0bOkUSzhYjmxcwZUZ46pLKpcZ7x6fOSMC0Vw7rLQ?=
 =?us-ascii?Q?c4pvIVG3vIwbvBzjfjRhOj2hb0JZmZnaOWEI/WZw1Vqn6MvO34S1wBPT5BbY?=
 =?us-ascii?Q?oWaHcolNmknufsXoPLkI2289QsS00EzaX78qkwtEh0pjSWJmc5bms3oEd2CO?=
 =?us-ascii?Q?O45BBRMLnWOs1gdFPskKPRftx4SIbDA/UispIyUQMljxfUOkFWOWK6A8Ut5I?=
 =?us-ascii?Q?cD8LNFPSdTIyciFohoPjFmkSC0vgnSzwmbeoex511JnNgBHsYPnulvdkAqxT?=
 =?us-ascii?Q?LB2LhoAvhPLN5G2OPOyP9CbeHPt+YKVp0Td6kuvO94G+Ply1KW8PB3ScDzkW?=
 =?us-ascii?Q?UEBhVAbodYxCow0HcHsznJ2ST8pxItrzhpQi6Ic6BPWfMeLznklyjMGV2HUj?=
 =?us-ascii?Q?+7LYhJGXqtW5YHqJySU83m+sfB2055ByQmk81aSQF7WLSghc8j5RCyrwZDnD?=
 =?us-ascii?Q?6QXDxkudyYfkxIeHQDOIJrobjH1X3Qvq89WcVpgM2HM1KA6TDuUdj5vS/U0i?=
 =?us-ascii?Q?PcoEdBvsxh5hxS7XuDGdE9eNKYhHte6mryPdsKawkVQtvoTrmymxMFY9oDpW?=
 =?us-ascii?Q?xhWF8GyxnuDh0jZDG5M3/UYf33RMbAzrSZsI4NQEFktUoaV75OVRYvQHpv6t?=
 =?us-ascii?Q?zx3dm88DpvKAh3VINTOGVYvgsU3W2f0SEQS2f1XlIyAjfnR0nsD+MVTCXuHu?=
 =?us-ascii?Q?bylJ3vjmbf4PJzMypw6+MwtiVCiwqMc9LG9B0tCXBND1YLfC0lpmzWI7rJ0d?=
 =?us-ascii?Q?j9bbNzMWHcAOYszQl1DSp9+WhDRTnZgrd8+KElXUoEeVepSnqOf5usYu6Ex5?=
 =?us-ascii?Q?mLmXM0OecY39zVw4rpNSabcGTC94zA3QzgnR+ifJLnIJg3NEUbmp4yJE3Ng+?=
 =?us-ascii?Q?dTkTH54mu5Vc70/yhD9n2Vxs7sT8+zcZSM7KOc0xqL/Ys4NkTYqLbPeE5ixq?=
 =?us-ascii?Q?rCp0L1CgiKdCmJ2zveBKFomoDmfQJq7DD9Umimt843BDzbHzzeUji3txA0k/?=
 =?us-ascii?Q?RVDtZknrbnTyDgP30t19fNDSUmnVaXOMbtWXNCQX+gPW9FB1k24su6dL6oRq?=
 =?us-ascii?Q?SSkM+Nb3IWlqQqA13pokmJwzNWQ+YYeCoOa+Bw2K8Yv81JjRp5bP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fa8711-46a0-473b-8020-08dedca4d75a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8083.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 03:56:08.6120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zs0pvTVivPxR/jSEeGecsID0/Z2v8dX6cVvTmLqfNZ62n9Kng/aCE/BFShvjHWjjQ3TFTvcTEms3nXU3WPeaGc/4CgmNy8R1xmW6oisJiG0ZX0S2ZnNxomVAdml14xBK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_045615_322137_85FEEE1A 
X-CRM114-Status: GOOD (  13.39  )
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

From: Richard Zhu <hongxing.zhu@nxp.com>

Enable runtime PM support for i.MX95 PCIe Root Complex to allow dynamic
power management when the PCIe link is idle.

The i.MX95 PCIe controller supports entering D3hot state when PCIe
devices are not actively in use. This implementation uses
pm_runtime_no_callbacks() to leverage the PCI core's generic runtime PM
handling. The PCI core automatically manages D-state transitions based
on the runtime PM state of connected endpoint devices.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
Use devm_pm_runtime_set_active_enabled() simplify the codes and error
path.
---
 drivers/pci/controller/dwc/pci-imx6.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index eae495a1b7990..578410f262aed 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -130,6 +130,7 @@ enum imx_pcie_variants {
 #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
 /* Preserve MSI capability for platforms that require it */
 #define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
+#define IMX_PCIE_FLAG_PM_RUNTIME		BIT(14)
 
 #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
 
@@ -1973,6 +1974,13 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		 */
 		imx_pcie_add_lut_by_rid(imx_pcie, 0);
 	} else {
+		if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME) {
+			pm_runtime_no_callbacks(dev);
+			ret = devm_pm_runtime_set_active_enabled(dev);
+			if (ret < 0)
+				return ret;
+		}
+
 		/*
 		 * i.MX RC is powered off during suspend, force L2 entry to
 		 * ensure proper endpoint notification before power loss.
@@ -2121,6 +2129,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.flags = IMX_PCIE_FLAG_HAS_SERDES |
 			 IMX_PCIE_FLAG_HAS_LUT |
 			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
+			 IMX_PCIE_FLAG_PM_RUNTIME |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
 		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
-- 
2.34.1



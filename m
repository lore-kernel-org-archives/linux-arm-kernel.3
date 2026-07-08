Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07264C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6T2FV1ZxmbHH9+r/ZNQtE01qAkHo1a8g0WueaCv0p4=; b=OFkwSjoKJg4xUkAwhPK51p3zaj
	0kzmDa80V0fZdza55PGyi8qhyN/Hwylw55mocEIjQKZbJgXqUr/ECXG3Vh3luYsO5bZs9bNyeucqQ
	LKalW79PVvToredJev66IHIMYbd8TINj2ivwPuzzTaL/J9KgtRGpXNsOnm4bi+xkn2QB5oO7/e3k9
	yqYnyE5KowZ57Tpdye9VNJTg4TYeMJkBZNbmwPm13LwBWXc0hv2zkqHxXwxwZlDzIqrSr/XfaPIzD
	Q0eLCfmanWL2jaFAcBs41Rk6OKy3x8Rn77OdIKhHx4wJhCrHP0J6Humz9yXFeTyJFSHkiEcmUq9sL
	qxjmUynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJOZ-0000000GIWU-0uIC;
	Wed, 08 Jul 2026 03:56:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJOW-0000000GIVn-0sgw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M6T2FV1ZxmbHH9+r/ZNQtE01qAkHo1a8g0WueaCv0p4=; b=R2nNvR3QHzFtT4tyKS1KvKnpq3
	QfZbrtSZkI5+tBipg37rkgSS4vhSOGPLqCec4RNC+biB6PAvX5gS9KW0+hxWGFgK7iTBhJ/tK8B69
	ixxhHwI3S52xCTP+KM33yyZs7QnIDt0HhcJ1NcSS7m5PCq8/8/SMuz+hd0Xr3EZxYE48YNkodYhVz
	MTzH/TcDw9xNc0n67ruPKRfXh/OjccJPJdKaWJ4Iqe3AyxTZvovFBWfnxLi8V+1lYcLcsCF8daHxd
	+B/h0ZHSz66UeFOBNQPPeHm7O6/U4B+PBsNLpZxuiBdZ80Sr+XW2+Hj5L29LPSq5jkmCiPrN/BmsE
	k3cMVkMw==;
Received: from mail-northeuropeazon11012055.outbound.protection.outlook.com ([52.101.66.55] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJOT-00000007zK8-2Fpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMfjeyKyhB9ojQKkVF1xW10NzmpG+nb7/HaAy+fry38vHBA8U2bBIhWXlQp4SSDfermGMCqgI8vGMQ5LTdms5tZ9HGkugjAIRnEpvWEZ5HMmg6Xgyw1Nn/W5nABPdX55gfmmu1ptKSH0Y6v37aNBLlKr04CCQTjJ0dD5WYxOJ/623Jtze9UMp6gn/S3/5ku4aai1jnssAM3vApIbqyKhmEkJPOAakjjr2quB2cUPOpKe7D/V57cFqZ1tZ6kSi44KWXnvEQ7MSIY+2rYlnyPUBbUJ5J79jOmD4/4slvgZhfkRghvzqIq5Zvoz2RAJhDG7IOM66LNTIXOD/anRP8fcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6T2FV1ZxmbHH9+r/ZNQtE01qAkHo1a8g0WueaCv0p4=;
 b=t5GY7/B6IYy4HPo8wj7D6BeVgV1SFe1GuhSzOCOrF4iSMJ2x7Xu+Y24Z+IeVe3rnRQcG/JTJu6r/Sgqx1auluQx8e/6iVBO7w57AVqeIP7aFu6oHsOvzxrXGADHZM+VQ/csYsNHlQPyxlfzUSexOatJRCyErxRIU0ka8emAJzA7ncAciziHdoqtb/EY1buyclVpuHVf9AylwHVKbUtjmLqRi940cnyr7Kz+cpHsxH4w0LN32nYSNYsPN2OWY58JGux50T3IGiG6LkEUxAo5Jz8gNRa7WFL568FkRuN7ZF/nCcHwuq8GiU1Nnwlzpgi5ueNongCXhUnKzoZRsyoQsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6T2FV1ZxmbHH9+r/ZNQtE01qAkHo1a8g0WueaCv0p4=;
 b=dQG6h8+uBSKVJW83ZYbMxaec8nLybyrJZIfc8G8i57dIL1mHrYqdPKxuvqZTJQhtWENLP7EeIhw8wHgBPcgGeD7k2qftm56oht3Ql6erWZtUQKdcYHL59QG6ncUR0epQqMhFSauVWTh2zAr00wyOX82loBYMkDZnBkjNltm1XI0yrlKAw4PcqHhoV/ouQmeJ0aiN/KLGckK9xQq39rS7Mvm16GPXzJKtgl1LP/H0ZwYOIhFf+NP9o4z+jJWrNummLw0ICvgnFQmBciUHjWPwxak9BKmGWiN8omP+6ZXa+dH5ObAIPAwnvIO1EyMLBW2GStPfLkzvq7CzLytb3brxDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by VI0PR04MB11768.eurprd04.prod.outlook.com (2603:10a6:800:2ee::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 03:56:14 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 03:56:14 +0000
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
Subject: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY power and reference clock control
Date: Wed,  8 Jul 2026 11:59:27 +0800
Message-Id: <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|VI0PR04MB11768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4f3a78-734b-4d34-af11-08dedca4db22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|19092799006|366016|921020|11063799006|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JJKD6zi/0sBIjT0WUNjV3yFy9B7olS6NDwlFgtuJGPUMh24N5mgrf0hGd1wNwCPu+U8DwPO0zldyB6dYk/pNcH4nOfxkpgAXSA7HyF4NvZGTu53Ur2TFWPJWWHmJ80WIZmdZRT6nFOwYOheMvb5XhsUECgtPv5S43SYZwWuLQ9UKwJAZZoL2sQiWze3u/73rr/vg9sdxCAUmbJODgWJYvYHRIVljY+rCcJppMSnA60WGUH6yyn1T2VMDmfDFCOiVRjOHPS56bUVNK9zNi+0CJW9WoLplU2YDqYifvmmnBA8I1MaOeuuzB6wLpWv8ykB0DJAPZJnuJ/sQyjJgeLfwgVa9z/n6F64t+jv/XrD8Yy4j4Z1NvN9CcILPS8jDIbdzIgg6/8sju471quWCeKKI71q+IuFjlssCOs8r0fR0ysUDwabn5jOzgyYPwkyvT+isZHlJOVSnyQ/RRmuVTzo/8rTsQz3BF88pvB5N2Dy2Ay8h1QvRhs2Df1OpQW+cM9b5RfH9ESzhoxg8w23re6ARkv82N0VplONPliTEafvnUfvh4kxqoDO3l+CrIc6Ik8SvJ3jdx7ZwVIULV55kih/E3cWKEiRMO4Id3ZlURlOQJ5ItODZ+wLkxQxJnTZpDM/K5blPnbwhUn+VNeKlu7cVwZsHvLrUYBs9DVQojlmbfAWqYzrVZhe1VuOyEkS3hmKbDAH0jRTCJLjB6RkevZ+B30Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(19092799006)(366016)(921020)(11063799006)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlgVgBhzGy+bzFHim0/0OlbLKmHvp0kE61YZVxYMv6AKVeELX4VYhhCmSwhg?=
 =?us-ascii?Q?r43DmmomgP5axEekWSNujcBme1ZwApZglqpmR3bsnXPmpMDGhNTm5YKRGXfa?=
 =?us-ascii?Q?kVpMxdlBoPgiB0jBhJwPoLr0yAvOuYA6P7DEgJmTANlerau4xW+uYL0Vu6W0?=
 =?us-ascii?Q?Y0Cr2FSBvrLEHjEs3TBigfmJRpyKcbX8HERLTr8lGHGrQ0kJrzguR8i+7l7W?=
 =?us-ascii?Q?Jzzrttp4n2jgsSOu9cBXHIwKJMboJaq0s26BKYZKlEjNkiCeqdeISQsr5HcQ?=
 =?us-ascii?Q?tRMnLg1rS4qgRLlA9jGI5m5Yi1K91GwSEZTlOrLJZKkaJkEkKkFzTR1HP/ur?=
 =?us-ascii?Q?FBHNih9pywONHml4WSPjMAzKCfg8uurAVT+El/Z0Gz5lvWc4G/akoBgRYZ8Z?=
 =?us-ascii?Q?aPjW5IBX4DZB6sNHESo9Dmc8LHO+bGupW1cA6DGj+0tdldrPLr+anrbQalAe?=
 =?us-ascii?Q?Mgt2MnR5t+PcRb8f0+33xTaDvn16CzZVmC8N0Aoi8B/i19EB7Z4upg4hgheu?=
 =?us-ascii?Q?FXC7K+RxpnLC7yuRWwLvGtrd0OXiwj1J1SOWn/p9qHTP+NI7V7yi71ujqDh/?=
 =?us-ascii?Q?poSqSfvQhiQXodbJU1zYN/CNGvSwfYC1jaHFAAtLqaePwn2MrQnp0dadMcp/?=
 =?us-ascii?Q?eGuIT5EmxeVTUTXBmose5l+kFA2MWg/89Uqt+jawkJyRuFNC2RK6pQ0ASdFU?=
 =?us-ascii?Q?n1Bi2UNjAsDXahL/XJ64pQUn1XddA7Mxuo8tA9IsBy/vA55ATHDtSraFDOXh?=
 =?us-ascii?Q?N7II1BHlnUZ/mnOnWbNemLyfHAFGxprTTZxy2tHLIzLc7Sk6CsMRUHFgEMfc?=
 =?us-ascii?Q?/eOSibeBLewszevXN/ukw70J1Lzbjh60GEVkoI8OLQ4tqysHVuHxMvzCwKmF?=
 =?us-ascii?Q?enp+Sx2btVuSakAhG1O3vGbmmPNnWimbb6/81TFyMhM0M+6nlfXpi8pp7wI4?=
 =?us-ascii?Q?cM18YxpVnvdOtzNU52BwJyIauIhytEqdwQlat2O2nVwsHueHyaljw9qGu6ZE?=
 =?us-ascii?Q?M8IIRJQLvxAQuvNtMFmOM39JjBj8jWFZ3Y8DQdYbmcwkTf8frqtl8riHOMe1?=
 =?us-ascii?Q?2xIFEsactMvNSUMefcKPT1SYD/oDZ38gptY4Neyhiq1EsXYcePleVzHMqdKh?=
 =?us-ascii?Q?5ECVE71PDVcQsaQrD+DCYXO/FYDrv6oAClaOsTpsgtvMBSANsW8qs5Ozo9fQ?=
 =?us-ascii?Q?FJFQleHwH6x5yd5/oaGh2DayxWGteItNVLTHHPnIUjY+1BAyhRP31kjyPezN?=
 =?us-ascii?Q?aTW9lmrjee0WCRZg86+AaX34AUMLsR4vAdXruD6OjHpKMgqvosIPaZBYOnS8?=
 =?us-ascii?Q?jEieGbmq3/aGCRd3dZF3EWimGqSTi9+of4WqRYbw2f0zkvTwi5dkmcj91AKv?=
 =?us-ascii?Q?qpiQCMACgY2xbnsEv1PKdhdxm0j2AscD9vK29xfzIyOkfzD9MTe7dODAz/TK?=
 =?us-ascii?Q?Q52sA+kFm9VKpisu32/LyeR/rMMU7uo36XHrDKb7aIYs5wsQ+EqTINM02tqF?=
 =?us-ascii?Q?BpqpcvK20paTJHOpJMXk/XqnRn4XtljRZ9d7MFfWqDs/KXLt2wcrOuzMDHbx?=
 =?us-ascii?Q?EtPC8barbZSWK9TELO9bDeR66mcfTH9pESN56f2yBk4qi8e/BHRS7UBQObHw?=
 =?us-ascii?Q?DhRqYPq4F+AIeIs2UKS2A6AirbXsu6K0UnkIC0tvU9yKbvaf2Ro62WilyN4h?=
 =?us-ascii?Q?ptyCHgatrICd2lFPktC6QsV3n5jBLBj0A3vkR32utgJI1llgU+1u1odjRM3v?=
 =?us-ascii?Q?VsvU5+rEta6iT1ALxyfQq1rlc07BucNYX+FPmvOgH4dqEZapF1TK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4f3a78-734b-4d34-af11-08dedca4db22
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8083.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 03:56:14.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UblvtTdbztoxBpnbvValkr1cASv+IDRZY5j3Xk92M0dS3vFcB/pQyvj3Rgy6nZLewIt2wbXUe0rLX31yklwlIQHzHQybrmYDqrmFns/z5Dj8rdNzEgvVq/mH7TiCU+FB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_045617_703626_A0350599 
X-CRM114-Status: GOOD (  14.84  )
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

Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
introduced a boot hang on i.MX6Q/DL variants by changing the initialization
sequence.

The issue stems from coupling PHY power (TEST_PD) and reference clock
(REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
managed together, the timing between PHY power-up and reference clock
enablement cannot be properly controlled, leading to initialization
failures.

Fix this by separating the two concerns:

- Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
  logically belongs with reset operations. This ensures PHY power state
  is managed as part of the core reset sequence.

- Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
  shared PHY power management, avoiding code duplication.

- Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
  (REF_CLK_EN) control, simplifying its purpose.

- Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
  proper sequencing is now handled by the core_reset functions.

This refactoring ensures PHY power is controlled during reset
operations, fixing the boot hang while improving code maintainability.

Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
Regarding sashiko's reivew, invoke imx_pcie_assert_core_reset() explicitly
in error path of imx_pcie_host_init() and imx_pcie_host_exit().
---
 drivers/pci/controller/dwc/pci-imx6.c | 45 ++++++++++++---------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 9406bba36953f..53f3da6ab30d5 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -680,21 +680,12 @@ static int imx_pcie_attach_pd(struct device *dev)
 
 static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
-	if (enable) {
-		/* power up core phy and enable ref clock */
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
-		/*
-		 * The async reset input need ref clock to sync internally,
-		 * when the ref clock comes after reset, internal synced
-		 * reset time is too short, cannot meet the requirement.
-		 * Add a ~10us delay here.
-		 */
-		usleep_range(10, 100);
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
-	} else {
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
-	}
+	if (enable)
+		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+				IMX6Q_GPR1_PCIE_REF_CLK_EN);
+	else
+		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+				  IMX6Q_GPR1_PCIE_REF_CLK_EN);
 
 	return 0;
 }
@@ -823,23 +814,25 @@ static int imx6sx_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 	return 0;
 }
 
-static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
+static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 {
-	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_SW_RST,
-			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
-	if (!assert)
-		usleep_range(200, 500);
+	if (assert)
+		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+				IMX6Q_GPR1_PCIE_TEST_PD);
+	else
+		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+				  IMX6Q_GPR1_PCIE_TEST_PD);
 
 	return 0;
 }
 
-static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
+static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 {
+	imx6q_pcie_core_reset(imx_pcie, assert);
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_SW_RST,
+			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
 	if (!assert)
-		return 0;
-
-	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_TEST_PD);
-	regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_REF_CLK_EN);
+		usleep_range(200, 500);
 
 	return 0;
 }
@@ -1445,6 +1438,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 
 err_phy_off:
+	imx_pcie_assert_core_reset(imx_pcie);
 	phy_power_off(imx_pcie->phy);
 err_phy_exit:
 	phy_exit(imx_pcie->phy);
@@ -1471,6 +1465,7 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
 			dev_err(pci->dev, "unable to power off PHY\n");
 		phy_exit(imx_pcie->phy);
 	}
+	imx_pcie_assert_core_reset(imx_pcie);
 	imx_pcie_clk_disable(imx_pcie);
 
 	pci_pwrctrl_power_off_devices(pci->dev);
-- 
2.34.1



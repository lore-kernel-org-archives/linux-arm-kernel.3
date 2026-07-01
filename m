Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EBFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=; b=zm6ae052J2+BlnxiZveMtvv8Ac
	69VRNyMpk++kvSC0EFZR9ULJ4mFmdh48nwWroTbYaep9iweyrah8ma0Pd3i++YJBedYY/s6NamIsL
	Wyc3DWrbMrCjEDlxqkpLIRfeRKyo6WwYzp9FwOo1NwIUr/BSqtyRVcGHdyxq8T6ZqBfsdn7ixDDty
	gNhvHR7jgyHGcD/5IKxJSpb9SVXbbwVRuWu4Bd2U0TT8wCtwhu3VYa0MqYM783P6sKahLqEw+j1RY
	h0rG+UmWuir29+MEagXTdsLFFMy7uQKbcxGmdoa2ffnj8bt3IHY1r9HqpS9A12Y3vt9vaMTfWumNw
	q9k07Yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujV-000000028vb-3bej;
	Wed, 01 Jul 2026 13:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujT-000000028oz-2Khl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 13:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=; b=egfrkabMeqcN+O9xpjXpH2YDPc
	L1leI3W1j6L137VCOVS9lrGGZwxjFU1twIH+0h8O31G2NC1l68DfHRRKoxIeNQtj+ew4A4YKCFr10
	Q1NGdXul1caqUa9bzedVJiBUh+DNP3qUA5+A8AJ9SjYWgbLYHb2HtzoRGfB091OmAowjsprSMaTFq
	GnhIIgALmcE0iJc1a3M3zoyYXyyyQaE4t/BSXHyQSguFxoEIFCgIV//hlaXmJyf0RNh8giMeEVZWL
	b8Zb6/SgnCghmsbpXgEw3F7JPKAzT8N2FZ3/1Woj+nu4CweIdBTsKjmcGuR1x4SosgVPdlQB1JBY/
	fl18IrQA==;
Received: from mail-swedencentralazon11013000.outbound.protection.outlook.com ([52.101.83.0] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weujQ-00000002oMn-3U3D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es88qCoWfMQedP6vRQGI+NB3gn7YcBF2EcMTyxrRvnKWJiTOACq+/a15ArHeXCXIwZW7Vw/nYAeuJMLVL/Rn3E2bvb0tov03xMZkSM/PKcJzqbBOvPpUEymi2BsLXf8O6sVQFl3hVL8E9EsScxNCE7WpBcqBlZ/C+97XcCslUkeLpzdUC9hPQwXBdtHGh3tGOD79rvjaC8hyaiAx8c3bKhb0OsFUUH7tLRjmWBZSU6eBOQoZuMB9RiBdHquBamviq6CuX/w7EtkyXEPiRFrgAuvp1V3PQ7FCSoymo8W3SEJORNZZhlmwBmkHYm9IPcd3BgzLiDTFQio00rRonlvLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=;
 b=iYUoiNFPcEQxjT6R2PVDzvSmWKxy4VMx82J2jjva63U7o5FAQEhaESrHBoHMSL4So2bp/ngWP+KlrqFTXFnhVHCwYe2jpTfG5Ch6/H+nO3Bhkt8Jp9y5pl63VCrquD+IDgXaPihbc12GfeSQD8MfRcNkFRdykkta9CR9NSidZoz72hr7PXOEk3WSRKdzjKAVhiX1rYWENWGO2SEdXR8ImU12w7wox1PV6BPIjzlfgrl5IkSBDNp6+yUIAR2bRvOloZZkWrPhyBubIsg+aWRxUJ02CvfNSqltFiyi3erj+ylqaXGs4ynBbNPQwfI0Re/YD2mV13EwEmPfORrYHgxl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7ShsEg/HwDPIWbOOQkmyl//eqi4gSSSKJj3rCnsZYk=;
 b=G4FDXUKXomK1cQ3bIJEgK/1JI7PGn31j8tJ6Nzojb9TNOCpdMzfwVNuyS9kh1dUG0L1OXaq4EE8V18ZHJhaCiYZNJO7GIZPCWj99+vn3c3KeqricihxN6kgRuUIIuC4nh+NoLB61GjjYZXuf7r31S/XoIRvF357rec+KMTz2+mN2NbruFSfwLZ4d7iIGSxLcb3eEYrCRJPl+4g9mptnAT2gJ1gGqAuwR3SPQyj3tA+tS+KHw7+ISJXKQyEv9oyP1SCPt4cEeJvgzCOzZ9gsQ2YiNxlkVcXHRm9qypWDa6Ou7s8hgmiBZ5ErIxfqbNffN8JKVq+yXoFFsfKUeh80m3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AS5PR04MB10059.eurprd04.prod.outlook.com
 (2603:10a6:20b:680::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:49 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/5] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Date: Wed,  1 Jul 2026 16:11:34 +0300
Message-Id: <20260701131137.940145-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: b347d808-8dd4-40c1-219b-08ded7724f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0r3QlPAo2E2wAhq+9y0eOhAO3dfLHxNq/MEMObO94vq3zqvQ+UCMbyBdHxxfCZNmHBUt69vCx8KeHmyaT7WPKWTg/0BgcTCXY1delaTEEfutXzAXIg0UoXHYdlGR/oQuTF/gaEja3zyvg7ccog/q0RAFo9f6wzq2YJ1lQKHVSYQcI2843ppsFBkwOOyHm9o0zvisngIGWLxeexpIW5LUsbLH+a5vXkJZzyxLBMjLylPeM/fB5ZcM9e5GtF+88YM8bowxzRgM/qivyyFMs+CQF/gvTEy97nlAQiTxCFMW+HxbxY2a+vhTGLn0q+QVRp/DhkkIQTEtzvh0Vm9LOk9DHD4oVaxzCiSxNqfywGoQCZG++UXTiu261zJ7gHbRwCdbp74iJXxiVTqfTBNfinkPsP/wqFK6MdkV6bGWnWXamrdlNqUUxbEE4PvsxcYvGIfiBHCjdUNIJ6yfLEE5VI3+WYphybK7GCF1UQpO3MgOtU6GFqYEfuNeJNCLmw8NhLFHD8DVBNNnQgsyE9vqQXKlf6XqxoiTzwAv5bmFQs0dm/x6lhv7nQPnaJQ8tHb59ZjmWGaBSiEvGIz4FZ0IasDP8W1/CzqOQh+C6QR2Yt4zfMMULOZkBkQg7bMemmU3xPLSNNPxqWYkIkF/32Lo4/1NXBlOmDRJVHZdHD6K6ZoCSTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VkDXOouMDvlxI7XDkotEIuUs1A+OB2zD/gEDBum/Yhe4CWc6rCmmbn+0HvsE?=
 =?us-ascii?Q?L1xt/6TU5jQ99P+syf4sEPbYqvJv6gNGMHNYI6aL0Prg0oNpl73j1rnENWU+?=
 =?us-ascii?Q?AeZCB9bIZjuW8cvP+fILTlidn7w1eB6sy+fR+I9xdFES/nJTE2Gu1m8NG1tu?=
 =?us-ascii?Q?e4yP18TCEr/lN3nvCjU7PFN92dFFaiEfED/AQouUrNzcNYrBGGcBh9aMVj7P?=
 =?us-ascii?Q?Cf+ZcRgPFBKpnFpkKDzob+GgcRvzqU8mABthfDLR8PFwYZwSAQqXTAx0JGP1?=
 =?us-ascii?Q?5kTIjQbrNGMVTayFZ1YnpKrpnWj1c6JxBEpvherrka5ZjVuEzDSp3a1IUcTn?=
 =?us-ascii?Q?/A39DyxVbL7E1FNADkOGo1bmjVjsTaW7Ic8NPg4SZsYM+hFZNELRYYc+vfBk?=
 =?us-ascii?Q?ucFXdKG/a/nAHBGLDfzdFJNUjKYcsiu0+rXRO+n6DbRVAvE6e7MH2gBaSzIj?=
 =?us-ascii?Q?UCOVc4n3mZDl7bEbBpbJZl7VIiTpYFpoJu31L0y2KYHAbuC2w+jwCWBKLaRo?=
 =?us-ascii?Q?itqFRqv24g132KRxASV0kdcfdBzrNlDpSEkteQNDxbQN+1m1dQ/ElOoeVyoe?=
 =?us-ascii?Q?ouxq2c9n71ueuppmukO4kFNyxax2y/Zm0ItL5PUtGyhjR7/Gc3yYiEhgGQvO?=
 =?us-ascii?Q?BploHGjV78wyUWle0/HAKkm2jO6aidJnax6kXGnzeg2bkrcS8m3AiaBG5e9D?=
 =?us-ascii?Q?iAuS4zHCliORZ7R9tClUIyJ1JbVW3y99ZW7n/CP2v37gREdQ9N3/gsQyMn+4?=
 =?us-ascii?Q?j2hZNvKUHqbYtGLe5XO5uiTIQoR/7npv46Z3eUdNyzFqOmNRQ1w7v2Vj/9Hs?=
 =?us-ascii?Q?g1jd1ypFdNt8Ki1XG+jzIe1rgRg7VoTeH66hIPp/gglern2SYsy5aQScqVNC?=
 =?us-ascii?Q?Ar7ofriK+Cxp2H1Q9or7ggF7QFw3xBsYuyq/RKRGznNRBpy3+aJHTFjVKTpp?=
 =?us-ascii?Q?V/BbuPVlkQ+9fmyVQtjOfHOjlYsnL+zdHUoV+7hzqN8o0R1Az/jcaNetSs9m?=
 =?us-ascii?Q?yZrLlC7wlXnceOUcfidI5kQrc8e/mJJb//IGVVbHxbJpCz1L+Z0VHRbuzNao?=
 =?us-ascii?Q?MtBtmeiV5j7GGnrQedaqzphJN0YLXDnmr4zCN0tl9qDwftP+hcQJUSUXd6cb?=
 =?us-ascii?Q?8uYnU7RDEUmXe0Af8qNaAhK4qkd+nvR/UDAENzkSGxjBPaTPxILqF3hoTXA0?=
 =?us-ascii?Q?8SrMG3OIIjzM1TZkBSl1pXdq9jWJVhiL9n9IhO3Pduz/fIAWFKtwdIyOTA5R?=
 =?us-ascii?Q?8JeW8tGIquUfNB/cVqxWFU5fNspZqc1+19dA3+YPsq6ZJxAj08A+r/k98yxZ?=
 =?us-ascii?Q?LPae6Z63VWIcohAYJCCGEEjKAD2gjBlaKPuHtY2CPIL7z9WxoeFWyU3oXpAG?=
 =?us-ascii?Q?rPcCaxKQtksFfOOREEjaT/ayBi8msMLbIcaXdKV9iQVyuEct16d1PUr+VdbP?=
 =?us-ascii?Q?Yvdqhtm7iFTAJzBBbbrQZC1CIiAV0E6JsJLq1uTF/B2W9DZnS7AN5eXzOGdM?=
 =?us-ascii?Q?oqWALmkxVIP6rLXTlRdXzDUmrFFoDDOyt0nxkBwwVWO7tI/4dsNU9wNNFeWO?=
 =?us-ascii?Q?BxSifuh2sNb/6m5IC5UPxOhXAbDKN41d/y1QMBW/ocDccXg/zTGspWMxuRY7?=
 =?us-ascii?Q?VXK7qHRP6eqnVUXXZyOJskYMx3TJyb9TWC5U0g9+Oc7+QUoUgTN0gSEsgmHE?=
 =?us-ascii?Q?3IbVjybeusGVOfbUznvwaA0XgGgfGIf0AWxir/A4UKpLNM+RLRxGGqbgVG6w?=
 =?us-ascii?Q?0PPYoZX+4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b347d808-8dd4-40c1-219b-08ded7724f83
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:49.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqyr1QaM+F3XN2cDqY2FTMAiF38qGhTIL2uFVsOwlvqBISLwfFysSlbup19CPJFOFRjDCl7CTI3LZJ5sT35NSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_141200_956808_6C6CFF59 
X-CRM114-Status: GOOD (  11.41  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the Lynx 10G SerDes block and its 4 SerDes lanes found on the
LS1028A SoC. The node is left disabled at the SoC level; board DTs will
be expected to enable it once the consumer Ethernet nodes use it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index f4ba3d16ab86..ef62968590fa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
 			};
 		};
 
+		serdes: phy@1ea0000 {
+			compatible = "fsl,ls1028a-serdes";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		scfg: syscon@1fc0000 {
 			compatible = "fsl,ls1028a-scfg", "syscon";
 			reg = <0x0 0x1fc0000 0x0 0x10000>;
-- 
2.25.1



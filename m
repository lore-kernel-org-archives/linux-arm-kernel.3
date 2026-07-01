Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=; b=Aq7YO1aJFHzg4BWFrPLrsQE90F
	3OEB4iWt+zAk5JuMRJAOt5qU2DBDoYpQD7X4VvFEuIJuL5uklFUCT3pEC5xUwFA2qSj5X4Nqxbeuq
	Lyf+7R6XnzxV35VM+QcVuQBb5ozBTH7iihNwrhiHpaZn0D+rQzLSLCLDqrwMLvVJNEHYe3vHWs17j
	5JjObixY6ZCEIn/3Die9OcpwhKUaCJte7aTPxSL95PyczDE/Q/yCYG5n6oJSFfKclTzCaDwn1z1y0
	LWitCzgtT7Wt6GD/lgpmNhKVKXy3GOOLzxu7iIPJw78ZgIqaB2NObXNRmSNUERX9ygWC4g3hYes8k
	KAUcrwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujQ-000000028mM-3jhz;
	Wed, 01 Jul 2026 13:12:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujP-000000028jk-3vPn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 13:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=; b=aQZpLxrmU+EcwuiGCf08BdUeQH
	Qw/Q3uRHt7s9H6+xqrjbBUs2mXMNnl0pgd81nReLUfIkmTEIE8q0zNWZ4TP4LvM4heEWyfMl9/dak
	czzQl5vHHit0Y3mGhz/wILPg+WcyyzvDQooEnssbGOoBL1DZKNXaub/3gXvRcnCfT6EkzIndVYQ/5
	AVMQhLmxiaOLh4C7Rq//m3VNP+n4ZpIySONll9l/c5Q88AL8IxaWP5W+68pB4ZhIUS88iwITes94o
	3mdV/t06c3lkWCtrai0eOG3wudOSty49zYfjiuCnRmASk4/AG3RaBePSpnR0STXK12u3eVRqkPV8l
	CI5LsPyA==;
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weujM-00000002oPT-3FWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP+JlZZ0ex75/98qgMZFwYOImAM+afT/Gfa32hu5Z7JnzznHCkkCsNkgRUL8bL5qKE6OeWuaN6js2fJfYreD06HgAxCrknqiYVl1TmBwBqtB4R1srthjhHcvMRcFvs/BnChHR8/swHSrS+9ooVYLSJv5ZJOTT/sAdUPxp+EI3GCLnoVeTuJ/tZ+ub9YGtpFwbXW+qYtVU9mWvw/w30PW9A6YAEVSYOt5Zff6Sm6nsLY8PGp5NE5Hc1OZGwIly33tznLzPu9UuYjqtr44QJixCwZNZmH+VVS4Sun2A7kETveodw5BZ2rcNqqmRDZVsjRNEl/pxa8rKj5sjuVa/USgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=;
 b=m6fbE+DhI9InLxvdWdBh21ufoMumvjzlh6IbFZGtOeOr5IlN7hDaO7vlW/G5a7pR6W2Tt3b7i7Gvl/zi5EzVLUYBE2X3rnHWLyC2fe4LTlb4X9TWkI+2VGiBYgqTu9Y828j/0ZvxcwLbE/n02/MsoGY643UOPYjzMqIVux+39WxVWZg03+pmRRvnwwoCp9wnXrKgSDatVZzpWWPpBCCKoG2G0dUZ07PrkSaENmVQ83TJB1N6j4XwyxMrS/gkdG/E0DQRsbTUqDcE8f1WN+BKGyuseRML11Ni0t7d+MjqOsS7YXSPwCj5QxB7SLLU288QTivmqXIO8udqW1ghkbUssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=;
 b=oXD2px0c4p2qQm4YxVA1BfRAGPXcp3jEXleX8r2OBglG6eiX26LY6Xp2+RaIvPcN8M6RbyNHCapNtBJHq+0fg/OhFsBTioFSbfYTwECamdrCqIspr6mBrspk6YEJUoGbhxIGp5pd2tpifheus3EB3JDLSWM9iYiqCtXUTLa9c8FnNQvuYv/jFB/RAkdZsn0u9o8X1W256tN2aK4j5geHeA57VXuRAajCQXzCSSQ8QbHa5r7bIQj8YBx+YAOUcDstR7qCV83a9aigeLLnVTzsf28P3UQGOYm00GWlkj/KUiKVVEswRcI+sAtStSEokAOsiCAAf2uv4aJjnWdaUERbMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM9PR04MB7569.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:52 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:52 +0000
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
Subject: [PATCH v2 3/5] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Wed,  1 Jul 2026 16:11:35 +0300
Message-Id: <20260701131137.940145-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::9) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edb3c34-1eee-489d-a05a-08ded7725116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: KI8viLT6JKV1mWWJ5+3SjaDvZRXsA5AV/NZfqT4C5OAYQftYiigQJBKNmXsBTD0GKW1myyd51E4q1tneHdWOM+fbOLquau2ED92TMndWTMeh5oVO9Kx/Cl29M1uK2wJW4OhCeLAjCuKEhwFsRxPhxhNINP9vpZAP8hWC10e2TAbHViQ6b1O2QQw2n211Ut0g+Ltou+B46FhaKN+MKeC630eRpWFh+qGLGWIpEKIXfvXYCDUhHq7pzp0aRO84aEN193NWuSjSspz+UL2hzKe1JunSV01MSvK/cgICPOCJAerV7+tbEiQ/0FfSqnBAK2euVbtbSyd2r8f7xHFKBim91+beJ4p9hSCrIDABLyUt07+eZlSUfpW3VizOc3Mz7jURSbh2G1RM2NLRY8usOFQy7Oy98qU+DN4WOKHneHG/z4XUygoiSDpGH574fyykUwMVvztRN5dzy7g8tmSEktC7eoj8EO2v9xIdCNeDaa773taTfKKtxgCCdb3mHMbvz//ZhxtY7bnWKRbEJlKuHpXwbcEa+CxlrxWe98pIW9WL6iw+AWdOuyhytDiRkOGV9PS588TPaIV5HLzfPCJ4DzgLojt/DK6idrDJuV0Opd70/ouvqFsFZFCI/3NvcB5V4sPGXNkup0wAUIpnGE6T8CbrH/j9KvaiB/nFvDDxPTLnrhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6wqXjtWPy8NSbaAiBiBFwwUP1XjshvgMUCbJvICH6I3qpOtuNGAK0S4q6KIo?=
 =?us-ascii?Q?yNcNQkZyUEfKrZLZ+zAgMF/qkV6cdmN+r/QzZ7/u5GrylY1g5qcIFXTjhGup?=
 =?us-ascii?Q?/SG7UO/mJ/EDF+deMHRSIhcPzT4ah7tmIi55tr+FRMugZ/ffM2Fjn5o3dvsp?=
 =?us-ascii?Q?aAIWd2b1hjqOKSiqUv1a70iQ3K5/gze6Kd+N9VGEwZHdmHM034ccp7959wc1?=
 =?us-ascii?Q?cGSSeo0cG1TEUu9+8nCHgYkGnFG7qJUzJClbXAs3FzgmAySUd0xN8CT38h94?=
 =?us-ascii?Q?CV+Fj0mTBfAn9lLIBe+mygSNdr2oIZUzdAkqjTderp3iJ/jPVov5fVCkb2TR?=
 =?us-ascii?Q?VAmSPVkvB7qQlCofcnwW9JkaQX1DbvB4eOhyHmS/C+Vx4fhlceWgc1t2t8+C?=
 =?us-ascii?Q?gTSfwwo9mOSnjEaQTuzPFaCabfWtJ4yuSL0FpoSVIPxwztHF0bYBavqVhkYF?=
 =?us-ascii?Q?KALv6GgtMITdDpeo2grlDLez5mROpreQGhxl+8ivOfPp+WAYlosL2UFtdYl0?=
 =?us-ascii?Q?jSjZvdCposWMWkPw+9UdNYa+IUwmgob7fidOqdynIKk1GGHzJdIF/PP0zrBZ?=
 =?us-ascii?Q?jT3g9wsOqXzGsTK1nYatU/tvJ713MJZpFGxotMcAVsir4Us82lVsD1jClOKg?=
 =?us-ascii?Q?Xqz7DOm69MuYllQMyfUbC8T5CLDJ7isXH6ncxllcREmAuqbmkrmTnEk43B3S?=
 =?us-ascii?Q?fQka6vPwk+b1n02a20bCnG+x8BY4XZZzLwN75AJ0wvVQnqpzFmgB54n2d+/A?=
 =?us-ascii?Q?+vLMT4Yvm5wtyLYTfVsLKnghQji455QYdPZUdUMTeI45ERCFvk9rmqxZlTaE?=
 =?us-ascii?Q?hnoxsDCXSJnWZKmtzQvSSAodN7lkWoIV5CoPVziM13qVIjfRpMYxJcUYu3jG?=
 =?us-ascii?Q?6shYVzy7M+3HT4RMz71QY6qsQViwC5H6gNqVTNSuPKTc+Yx978EPCHIfeleH?=
 =?us-ascii?Q?vYK6Wfe6p9DlHNpouvexiHw6OhUEOcETrqVWgNNat2V0dM2ds/37zsCow8CF?=
 =?us-ascii?Q?A6s52Dsf3Vuk1fc6QrheZcbsulrfTM4CPy9Qda1jcYIVUtQVTtoo4oT96HtQ?=
 =?us-ascii?Q?F9NLYv1psrxauKD+i00FLvm2XMy3mSnnSwCCqgmkQMRywi/cGEupUdOkNLsQ?=
 =?us-ascii?Q?zDBfnHBCPtgDkdQpArgHununQPncn4n/jlm/A8LFpQZiEwvm22EllM9827MQ?=
 =?us-ascii?Q?DWcvLbyGn+oRqfmhZLor9EUygHd+YiuP/uIQhNDBRaBcp4qhacfsCkZph0Fh?=
 =?us-ascii?Q?7eyRduufcJIKvtXHKXCzD7ez9wT2cEb7P3xyACUbhaTlElxGkmlXPB5tB7mz?=
 =?us-ascii?Q?BLWBXRb26lmYG983L04K5vkpF6N0Rn2mud4NYXGXH9LW02VF7ykqU7QaXIbs?=
 =?us-ascii?Q?7T3YJdBJiTsLzJIcfN3DGMlMNX73C55OmL8NpY9AHLOKqrqvyS7hCWM2LTTK?=
 =?us-ascii?Q?xTBWtawnuVUKSzcZeemHOcX2xEVXc+g9ImzQ5R151q3bXxgl2DB9rz4Uxtlj?=
 =?us-ascii?Q?8ICIUSEKqvruV87b8QgS/DKnvVnnTjGwOEfvxXf2TJ/2BW8mpNhucfBG1WEF?=
 =?us-ascii?Q?ZVfDlxT3Kvz0M3Z1KKIc3cx8zak63Ym5N4K0RQr31My54e2XaDVlH90pU6Tj?=
 =?us-ascii?Q?KKzDn2/ut05TxuFNbAqRa6NEpWzbb7WnPwrNnf8WUgCO7qFK/qLgY05nlSll?=
 =?us-ascii?Q?bvjyp8lugk+w2SzE+j6aErlTvhQ3yY7nYPAp7g2+hY1S/xRosQKa8w/lkep0?=
 =?us-ascii?Q?FwzKPZsTIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edb3c34-1eee-489d-a05a-08ded7725116
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:52.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jwmsosr3ki2mUMwaKA9s8EnmvhEL0fMhD/4orMnx8i24jWNwg1ZX6RQ+WhL6ntd6hGtuCVwpPv72boniFBoA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_141156_985032_B0A6753A 
X-CRM114-Status: GOOD (  10.81  )
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

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..270a97711a69 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1



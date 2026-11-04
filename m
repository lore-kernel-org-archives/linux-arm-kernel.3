Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A98606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p19Zx14R;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Nt8Srcbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g8C+G+Wc9huW7wuqmBOo0eaM6fr8AkayIP23wiO0y/k=; b=p19Zx14RBXviAg
	sC5ClvSftpisEuWRuOSYkc3pVDILIM0QpxdioI/lcIgfdL145CmzCwHiRFCSs5ujYzEeCELtAkYTO
	e1L7Kf4xk9vWCh0Agp5y6WPll9Vlik7d7zmoRob8sQ6SPQXkghUAkM/ZS42yks7A1caN6LMiOJ+hh
	0yUY1uSjzoNYDHy/KvIO6vo3pl4t9t6piB/gorcJDOMQasn+ZnsyFYmjgkmoMk67IRInlcZmUCrx8
	i3rwT9BFUgDBRaPbPrSKJI7+7PyvMp8zY0VwQ2qf3NwgLi6Lu5Jsh+a1tAfEA8CrQvuh2y3Oxqev2
	OkDyjCUi6e/a7nqAFqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZQ-00000004YKJ-271r;
	Wed, 04 Nov 2026 07:38:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZM-00000004YCR-0Ohn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRInmeatqnVzhK5d1s9NV4iqgXXtcp0OsiGG3ZszR2ZZtC4MfdjQPgRJKCCqTp4O6QBEoJ5t7bOx5au/5HEiv0b2G+7iOs5RftLxgmO81cArUUkyMQCz0lp3X5XoA6eTsSejZBMgQnL+QH22+Cxz+xZaPcdLRucHqaQUMPFRXW6wCqFOHG3EG+kUe96bQzbgM3laxalUkFbw+Ha8BdOTSE3cY4FjnXKz47S4rKi/MwqxJw+QlihCpU9MueNjZyIl+YVx0XaimdoiH6DQH7yLq4RrE5kE63TqtbcMB/cthJoUey0WtaX/OXiY1gmVgmbbWpOv/UBIMn21axW0ZINDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8C+G+Wc9huW7wuqmBOo0eaM6fr8AkayIP23wiO0y/k=;
 b=evXLfyWssAMLIendmxVYkWJHRov4xhhWfSJWj0TUBdX1RrC7yOYNDRCXi/icP9Atkz/mn/TcPkfMkf0zJ8VJN7fNDoFdqhRbztXG6She4Pj9oUEukcsRtfimgqK9sSqqq7JiN70RF7ZM5zCf3CsaPjX9YwSJNvIYPkoKxFhsX+Ju+yME405MxXRBWdOhZX3pTFbcSdrXeV/rBkr6uMEfwgHeVITv9jafgPt+CO+aewY5qX8RQ1wkN4dEBYcldGxLuGA2n7GZLBiRP9vMs4sb2dQWl9mE1lAYIsE7mVujSK3Jxumhunw6HVKxdXjdsnrVh7/lhWLwHV+bLmFUVQkkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8C+G+Wc9huW7wuqmBOo0eaM6fr8AkayIP23wiO0y/k=;
 b=Nt8SrcbwGIEfSHctNsEpHLZq6psHjDPjUybbdKbc5uDl89BK81/1/JPYxAtflFFQAppQ5/AyQm9JruH9IipsxT3MH9orWG9MPMGCFxB49U4OXLFpGUlcfrmHyTSYD+C4BZaQgw9bMnYiJysZONWYNREXMi0s4HQLrRzJTekrbIJUd9ZXx+Mai1CIxIF4mmij3Lx+TPFG4oWcDlQbYg40Afta0DPbm4YTMQfx97L9e045mPsBNvBUp8ZVHe75JkPjTanFa6yCt2axjI9aJCmLO40gOj7l9ajpR+NfbYHRhlZZg8K5U7l3M7zvIRQI64UKWgBZ0LzTdvLpbaLt9kY1Pw==
Received: from PA7P264CA0383.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:399::19)
 by PR3PR10MB3804.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 07:37:57 +0000
Received: from MAD0EPF000008C7.eurprd05.prod.outlook.com
 (2603:10a6:102:399:cafe::36) by PA7P264CA0383.outlook.office365.com
 (2603:10a6:102:399::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:56 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:33 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:29 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:44 +0800
Subject: [PATCH 04/10] ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and
 Bluetooth pin settings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-add-bsh-smm-m2-v1-4-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Leonhard Hesse <leonhard.hesse@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=6IqqBcfhkwA+mFTpHng9fcUUfaTyfAELYShrY7f4ow8=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVh+8PZSlQVPk6dXrn+rwuVzWuVrwjnmPf/eXDBpF
 pnAP0PsVEcpC4MYF4OsmCKLaoL3WcmrAabTZlbDzWFlAhnCwMUpADfZn5Fh0sQzZ+2z/JrSzu20
 nGlm685bdVs2bkOxWYRM7q3NJ1fEMTLMqpiilFi28pC3wcJPtQV3tTJWX0nJCD3H7JUWNNPwnT8
 XAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C7:EE_|PR3PR10MB3804:EE_
X-MS-Office365-Filtering-Correlation-Id: 085306ba-cb5f-4451-786d-08df3a468aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|23010399003|10067099003|18002099003|22082099003|261102123227099003|56012099006|11063799006|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: qyXevKduLpAYSaJ6tFwqnzHNO5E82oJ2m4OEiubWNNGwtnfpHYzUvWM9lsr8+7WeD7ykSwXED4RunP2FNL0pSTC4Nzp4X/IQew92rmysDtVbQPqRh3/n20RMJLnN0U/2ZlZE4I9loNgn7C9kw76vNIrMP4iSV3mxcgSgkfOvx8hNkSXAvxcIkvJujD4ruSonS4GvFk0d+pxNMiN+yjSatQ00KJoLQWTsQPWAsF6n6GhZaCsLDcjbRB/5uqFcJrEro9PC6mPXVLUG1IiCENnBiyFfBOpWpcTT8Sus2v/j/u7BRqkIE7L1CuD4jOrZ4DYDO3dpESEueaucLlIu5sdlgu9zyzazozJwW+PSsFoOpwAWtW5TMpu+sLh/JnYgHR/8rkdEn/AdsVKHzUvMcr+1sDYhpQzX6d+PZzqE//oJ9SYjfsW60w8FtEdrWkUKt0eJcsNyzhJClGkmA8W48rhJ6okJ3dRLocfOLCpd0QTj3khwqVyAOUbHtXbMdSIBr1rICOf8a8ySzZ0cbLKezLMPVEOitVXoSi4XNumJc5mzKXzPTUaG7dqxXM49TUtzXeVDBpFHM36wgBA5JVYiBBC4Tud4PAXYUHp90KMtN04hRQ/VNPvdC6eBm9NYJB1BhOU7zJQWeLSG951oGyATtuy6VL4eeGq/+QTNaSVM/t7a2WY4Viv3smWIkRE2jrZn27mmLbAwNYSHtJ+imMYOUnpNdA==
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d3+mdiENc7iAxAbnyMs+ZiYGGLtbMX0H6xrx3c0V2GuuB1gCRh6NSZ6aqpl1bs7Ms+aRN6pj9qGnMsRqKBXYSOPN5y6viy2ADctvBCQzmz/IAE47XLpSGUhf5dflB/L0B/q4m3F34bnSOIQkRsixYPabXdpW7uH8ttPoiaJp1+2KfuOddejRIR7QzsMWi83wrMZ8FOEWI1Jg2sov2oqPYNQKNE0wRrHgQBMIP+wy0DrV5Lc7JGCvOc+4p5dlaCfanNifudR2Ip+saK8ldarFV2/8AuYL0LylANNytY5b6gw9RXZaJO+0hSgI2s73ngogqhLDTC6C40XBXOyJyqZ37tp9iudJ1t5nm/T/h3kTQRQ2Dk0hNXjPYnGaFfrUopTGrnwkmZsJE+tIeI17cURo5JKCyP61fUk6jPiHkChYSOwDdQlpcgtHeuDQ4UkZ0veS
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:56.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085306ba-cb5f-4451-786d-08df3a468aec
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233804_157520_05291A8E 
X-CRM114-Status: GOOD (  11.99  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjustment of wifi and bluetooth REG_ON pin settings.
Tests have shown that minor changes in drive strength, slew rate
and speed resulted in the best performance.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 39b7ee585860..792d23a39390 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -129,7 +129,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -150,7 +150,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */

-- 
2.43.0



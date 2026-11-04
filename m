Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RTXa95D/;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=HYu+LLyW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=82PBrT8GiewUmm8qTnXj6CHXuDY9tv+0OgwqybUdYOE=; b=RTXa95D/JjsDavjmqdlLij1+pM
	O9eG1dkxhGxIeo6yHAxkjZoM5g8pa+dHB8lO6FjkZLgw4g3pp5NQEc2B46OJG2w849mvT8F8CZnmo
	ZjsYlSN6KOoyb5mbekQOyDEhoyWm3vRbWNrOOAMt6EamZ7tQk+nhPSEQid803fgnpV67oGTJBTboA
	nYJm77mxlbMTcQhktGGtAbNPOukrDo631snuZ7SqK+Qz5cDnIC7GQyjney9sWeFyuKR4UAVb6+Pjv
	Ed6DXm33pjlhhsV6KfxcumrRJnYOYD+I2/pqHh4BmLckPtKcv4PVxlNG7WfnxW+KLOv4PwAry1uXC
	+DRImx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZV-00000005XoL-1Pzp;
	Wed, 04 Nov 2026 14:02:37 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZQ-00000005Xiw-3WYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAqmpwGVkKcahzIryK1USJCrZrFs95hM3JN9Gd70k39Qw5z4YydnF1Fq4/aG3/l6sYwhVSsCtQGRtbeWOIhEdM4B5C8VVqezo44srSeGFe8lHoqSVsi2pw6qn4hllQpYcAjB7WacDYHyE1xc7JRv/PWFLFdpQ5AbZBXc5URJwK4ywo4+EdGpA+ESt4VfdOEGGL9DRHl3h1Gs86MxgEf+KJVj1VSeqzfGpZRjrvOqzCRYVIiCum21gXXuwPbh66RLINSvvaOSEIU+wIrJQ6zV78uMRtUkDuLM5D5uwAWo8AmX9Tx4FJmj03b3qFIaopRTLcSYCxAeLiK6YGQk0ZSd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82PBrT8GiewUmm8qTnXj6CHXuDY9tv+0OgwqybUdYOE=;
 b=VnNmDciPVb7pkpjeHGjTPcLia+EzhTugher+fKBDvPnlAIw999ukQ1jhjq3Q8Kq7dzdKxXZ9AwqUz74krzU/uHhREXrTm5le976dSnHbZxwchqJoa3BHNYPU2krBB24nKlEScxHjZNzqUyGpMNJXkZX3WdKAKEpuhe4UPqVUQICbWE7k2GGylfh8x0KWt4/KRuhWXJVCcQGEoq1PHIBD9DnkeqJALWwKbreDU34Ttsn7ntPbhcdt1j/h9zwjuLC2B/v/lfSC6ZNt0qKAsAXorK4FfXfRffudG5XXZUMC5Ab+XSgE/Z2Y7Jwm+YDg61f+q+UqDgvGnRSPkdpcriWuiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82PBrT8GiewUmm8qTnXj6CHXuDY9tv+0OgwqybUdYOE=;
 b=HYu+LLyWwvC4Kqrj6+27N03C1sA2yyas0LyISOGBmzvZejncNxF4RGuqXMVvY5h0sUxDR5kx75NkwtB3kX65Gtgg09TPb2pmH+ijmXP2fvHAEIQCctK0GZ2T7IRpad1VlyLhyRtDnTHE0eSN2RLIZgv7txOusAumNTlJdzgIkesGX+y/1dLVp+zmHwbTdcWzFMMJSVqjJ5EPUF/LJp5OqGI+ct0AmSxG4Bdt+uu2J8zITTFZo8QZEWD6b2BwkWi7uznRSOPx7ezrdZAGgqpNCSMvU6LL49QcdV78fzx7Qn5DPwnfn4lA6tnDaeT4wuvqzGDV5B7Mw4w3SgzemH5HsQ==
Received: from PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12)
 by GV2PR10MB6090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:02:28 +0000
Received: from MI3PEPF00008551.eurprd05.prod.outlook.com
 (2603:10a6:102:19e:cafe::ac) by PR1P264CA0007.outlook.office365.com
 (2603:10a6:102:19e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008551.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:56 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:27 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/7] arm64: dts: st: add D1 domain for STM32MP23 family
Date: Wed, 4 Nov 2026 14:55:09 +0100
Message-ID: <20261104145502.6.I69d937a929c3e745f9d11db74298f0e1d91f0c2b@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008551:EE_|GV2PR10MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d69cf1-bec9-43f8-9f54-08df3a7c428b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|56012099006|11063799006|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|10067099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BrtStDP9fHFYzFU+ya2FvxSzNH2C9dOgqneoByX96x1q3YsFnw0VBwsv8bQk/4o0WbzSVAnYZhzCl7huy6pN6l8HsZB59Dr+jWIN3iVAOXddVPkNKZ4PGRNwfmCRmYXT+PdgZKw7nthsDsoy4KwBVfo+sqIwOg69f31Pla7WXiUU5723/ynwF17a6sRJYrzYgBGMlcL6zyHqTiJP/wQdh5qrpDZus6uCA7p4r/DovfK1B0SEyu5Nu4IkGpj9gnbB/Vcmmfae3TriN6zpndrb7r/aC2aPIV+CeJnufbNg6AAfK6x5QLYZ/F87ZFB1dHvZupLD8LzGe1wsqo9naP+YSBKuvAl8+8sljCDwR1b72wG5Vq7qSaN6HCTp72filGZ7s8M/ftROYnVa2eNk9qyEkYdQP2bpanekV1tIriZJHl0ft49emnRY3BqcgeBH+xy4HdP+xjhTrO5UEMzy/BRzOJ164Q+7Ulx7mx6hL2RpFM/Sc5BZRFwr3eE/7AhuB3DFAgDbjU9ZHvQQWLO9flBqyL5H7ERIOfeQaF1PYgDgEC9L5niLub2McvZy89OPoFsxbwdolmeG+Rs9bCq9E2RG9I2Ln3xdzF7gaseUxHhT2j6qzigoBT5TtpfrwSSpZnv/j6tsDKcZUDWKohL486YdTnH2ZwyOtPpM2L5e/vKjvo4RfkeG+l5RYQ07RJpEmZFtfE2rX+TgfaiJH57omFiJ+A==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(10067099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s77kGl+tJBiAIq9c4DbNabvNn2ev5eFcVnPMyIJpsZfJP9qPhd3yYYZuvi7OeCDP+ludPySbM2Ou+AuOq9rOW8iTpq89ZHHjtyZRukzcqerjLI9qG3+ie50SzAHZ0LQc9tzXnaGWC33ppPHJFYiPeFZHU3Ik8Uiz1yI94F72BqBoADfLOSq0JB0bJ2YM/NF532v8/VNCa2dvqYC/dIaihVueQWqpIiuqgmSzCOVI5ooiLcWMSu0hidtYJP9VsKiPr9+4/6Ev9JvP4bz/ccbbIAkCGBmLNp7PKAaxwVy2ALbAF4EA8+mYEn0igy57Zt1Z06qZelKmFgWHM5+aCNUw0FC6at5gCCPAAy4stUIjkXmVptkagtcHvijZM7H6t2BNToT7yFdXzcZUyT1CGCFpqzi9VJ8Z53hQXJG2kXJAk2I6bLB7oPSqFgU4297MZqBp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:27.6037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d69cf1-bec9-43f8-9f54-08df3a7c428b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008551.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060233_052588_DC805783 
X-CRM114-Status: GOOD (  12.23  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the D1 power domain for devices that require the Cortex-A35
cluster to remain in Run1. Keep S2Idle wake-up handling on the
EXTI1/ret_pd path.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 54 ++++++++++++++++++--------
 arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
 arch/arm64/boot/dts/st/stm32mp235.dtsi |  2 +-
 3 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 27231e140fbb..4075a9cf1d36 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -130,6 +130,12 @@ scmi_vdda18adc: regulator@7 {
 		};
 	};
 
+	d1_pd: power-domain-d1 {
+		compatible = "st,stm32mp-pm-domain";
+		#power-domain-cells = <0>;
+		power-domains = <&cluster_pd>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -187,6 +193,7 @@ hpdma: dma-controller@40400000 {
 				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA1>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -210,6 +217,7 @@ hpdma2: dma-controller@40410000 {
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA2>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -233,6 +241,7 @@ hpdma3: dma-controller@40420000 {
 				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA3>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -251,7 +260,7 @@ ommanager: ommanager@40500000 {
 				 <&scmi_reset RST_SCMI_OSPI2>;
 			reset-names = "omm", "ospi1", "ospi2";
 			access-controllers = <&rifsc 111>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&d1_pd>;
 			#address-cells = <2>;
 			#size-cells = <1>;
 			st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
@@ -268,7 +277,7 @@ ospi1: spi@0 {
 				resets = <&scmi_reset RST_SCMI_OSPI1>,
 					 <&scmi_reset RST_SCMI_OSPI1DLL>;
 				access-controllers = <&rifsc 74>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				st,syscfg-dlyb = <&syscfg 0x1000>;
 				status = "disabled";
 			};
@@ -284,7 +293,7 @@ ospi2: spi@1 {
 				resets = <&scmi_reset RST_SCMI_OSPI2>,
 					 <&scmi_reset RST_SCMI_OSPI2DLL>;
 				access-controllers = <&rifsc 75>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				st,syscfg-dlyb = <&syscfg 0x1400>;
 				status = "disabled";
 			};
@@ -325,7 +334,7 @@ spi2: spi@400b0000 {
 				       <&hpdma 52 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 23>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -356,7 +365,7 @@ spi3: spi@400c0000 {
 				       <&hpdma 54 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 24>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -383,6 +392,7 @@ usart2: serial@400e0000 {
 				       <&hpdma 12 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 32>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -395,6 +405,7 @@ usart3: serial@400f0000 {
 				       <&hpdma 14 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 33>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -407,6 +418,7 @@ uart4: serial@40100000 {
 				       <&hpdma 16 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 34>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -419,6 +431,7 @@ uart5: serial@40110000 {
 				       <&hpdma 18 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 35>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -435,7 +448,7 @@ i2c1: i2c@40120000 {
 				       <&hpdma 28 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -454,7 +467,7 @@ i2c2: i2c@40130000 {
 				       <&hpdma 31 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -473,7 +486,7 @@ i2c7: i2c@40180000 {
 				       <&hpdma 46 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -488,6 +501,7 @@ usart6: serial@40220000 {
 				       <&hpdma 20 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 36>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -518,7 +532,7 @@ spi1: spi@40230000 {
 				       <&hpdma 50 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 22>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -534,7 +548,7 @@ spi4: spi@40240000 {
 				       <&hpdma 56 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 25>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -550,7 +564,7 @@ spi5: spi@40280000 {
 				       <&hpdma 58 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 26>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -665,6 +679,7 @@ usart1: serial@40330000 {
 				       <&hpdma 10 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 31>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -711,6 +726,7 @@ uart7: serial@40370000 {
 				       <&hpdma 22 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 37>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -724,7 +740,7 @@ dcmi: dcmi@404a0000 {
 				dmas = <&hpdma 137 0x60 0x00003012>;
 				dma-names = "tx";
 				access-controllers = <&rifsc 88>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -750,6 +766,7 @@ spi8: spi@46020000 {
 				       <&hpdma 172 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 29>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -766,7 +783,7 @@ i2c8: i2c@46040000 {
 				       <&hpdma 169 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -781,7 +798,7 @@ csi: csi@48020000 {
 					 <&rcc CK_KER_CSIPHY>;
 				clock-names = "pclk", "txesc", "csi2phy";
 				access-controllers = <&rifsc 86>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -793,7 +810,7 @@ dcmipp: dcmipp@48030000 {
 				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
 				clock-names = "kclk", "mclk";
 				access-controllers = <&rifsc 87>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -809,7 +826,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
-				power-domains = <&cluster_pd>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -825,6 +842,7 @@ sdmmc2: mmc@48230000 {
 				cap-mmc-highspeed;
 				max-frequency = <166000000>;
 				access-controllers = <&rifsc 77>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -840,6 +858,7 @@ sdmmc3: mmc@48240000 {
 				cap-mmc-highspeed;
 				max-frequency = <166000000>;
 				access-controllers = <&rifsc 78>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -869,6 +888,7 @@ ethernet1: ethernet@482c0000 {
 				snps,tso;
 				st,syscon = <&syscfg 0x3000>;
 				access-controllers = <&rifsc 60>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				mtl_rx_setup_1: rx-queues-config {
@@ -900,6 +920,7 @@ usbh_ohci: usb@482e0000 {
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_phy1>;
 				phy-names = "usb";
+				power-domains = <&d1_pd>;
 				resets = <&rcc USBH_R>;
 				status = "disabled";
 			};
@@ -913,6 +934,7 @@ usbh_ehci: usb@482f0000 {
 				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_phy1>;
 				phy-names = "usb";
+				power-domains = <&d1_pd>;
 				resets = <&rcc USBH_R>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
index cebefd99906f..3fa91f7f2762 100644
--- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
@@ -70,6 +70,7 @@ ethernet2: ethernet@482d0000 {
 		snps,tso;
 		st,syscon = <&syscfg 0x3400>;
 		access-controllers = <&rifsc 61>;
+		power-domains = <&d1_pd>;
 		status = "disabled";
 
 		mtl_rx_setup_2: rx-queues-config {
diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 7a87c344a4fe..561b12ba74eb 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -20,7 +20,7 @@ lvds: lvds@48060000 {
 		clock-names = "pclk", "ref";
 		resets = <&rcc LVDS_R>;
 		access-controllers = <&rifsc 84>;
-		power-domains = <&cluster_pd>;
+		power-domains = <&d1_pd>;
 		status = "disabled";
 	};
 
-- 
2.43.0



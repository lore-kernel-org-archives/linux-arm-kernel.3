Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E4E606C93E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BklJ2jch;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cLvsDkd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=; b=BklJ2jchIGHv5ekUQ/D21ndqNP
	e/Qr28L5GCyoXOVQ0w+m9vdF+SEeKCvitFtSCAA+nmkgItpgpSi4l6Zzo5ETbK44FQ1aS90kJzXhW
	Q3BTFr39PR+onqWrQTHXCHu5GVaeRbTaeO8q+4O9dDiyjrg1B6feW9y6FVxS0/LGlj/7HPjuvCSJM
	cHLMtWpR4//c4L4OET93FC/diKo55GURvcHJOenPsS2fNiXjcnOG4Kf3O5hGXoZYKy35ZRpXP/1zX
	yNeyG8QcZGFzqWOnhsM7OgWnW/c36ZW9VY0J+nadjDY2N2aMsffg4B5tqqAMKmy7/Tz5zYiRUsfiu
	itmf3XcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcI-0000000G2sH-3XhQ;
	Fri, 23 Oct 2026 09:31:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcA-0000000G2kC-37A4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 09:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=; b=cLvsDkd82NHyxpv2s5yec2Xvgx
	wLCP9Pz3NcIqBCpmOnhiIQfeaIeW/ZzEECCbzn1gYpFG+7bJklXGg4DMGT2GxfTB9hJjp4x+ChDun
	aZcZGtn4CeCmRx6gTB53uGTuYXYIfVcRrlHHVueNxV77Rmm0/pPaSz286hcraR7Y8ilbZVsjbOV7J
	HoYzzCkPyiTrfishgVPSjMpe8JZqAdOEbKSYp5Qx+LTps5Z+UaEBh0xwZ8vmkVYrDFZhtmYThS2Cd
	Xuh9JR4sopkT6f0juNk+VQOItHCyMaMm2hjI43hV2yfYcIjYxqu0bLbfTifsOLpr6cARfifhmsRw8
	TGuUfQ5A==;
Received: from mail-japaneastazon11022115.outbound.protection.outlook.com ([52.101.126.115] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBc2-00000009FOW-0eXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:31:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK4wvSYgAPgAevDX4hCkVMyc8dor24Fk1HBkOCE5BmcuEvEVfQj5yhLTCVXs/4RI1D9xhbzp2LTZCfzdRTBBvI269dwyMORYY2ucSItN45gprrc/4H1FPWQTEVKlFg0o09inL+DriDAC+DwDZGPMlaKBY4m1efloF6k+rsoYXx7J5BAR1sgzsHuaWhcN958/bWKlovXeg0KTFZC8Quup8PVZe40fXis3QGzxHeqM1eCjXgjYRwK6k9ZHv9V1mrHDP/bI08X+eu0L0sgRrBsIiVJCk/Q0s18lbNqyn+OSa7QqKhjmb6f7CtrrJRa12dvIA80uJYJtSupYx2GAG2MS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVcNYcU/AT2kNVO+mwby0yuY6ThYwX6Op4c85Ipd3hs=;
 b=ds0SIhF7eRfsG0FWRRyGzZbjMk6Uh52+QJ9yGfboCWB0+4Z1lAGDcO78/bKDvOn+XbeP59z3VlYoyXbTd6sWOHskSRkXDojgmIulxqenJO63LlUg3PyhFQX6BDP5/XpXK174jQwc9I0rGtBJ+KqY5lVxwhKWVf7BUCoVhetfua2+U2PW29oiOoB9vURQ5VfvRr4Wgo84/huDWRWQg7EbA2G/f4oF7zczDL8r5rbrQsX9++zIkjhSk8efN5xKHx3iJzk4n7b+oh+d81TgZ21i1I14Rg696jrznkS45tRfFDHd33yhO1VehSw2ZSSsi+NA5XpGTIm/Ms2eYwgCKjl/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21) by
 TY8PR06MB9176.apcprd06.prod.outlook.com (2603:1096:405:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:49 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::9a) by SGAP274CA0009.outlook.office365.com
 (2603:1096:4:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:48 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B37C04102B4C;
	Fri, 23 Oct 2026 17:30:47 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v1 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration
Date: Fri, 23 Oct 2026 17:30:45 +0800
Message-ID: <20261023093045.3248630-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY8PR06MB9176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f66db195-85df-4c0c-5f1b-08df30e852ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|261021123027099003|261022105027099003|56012099006|261009223027099003|18002099003|10067099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: ZyU3UA7ZUBsD/7rfIT+NNNhlbVCGiH0QFo9n6AunEQAQAaiUZ9jlBZilpSEm9DHDO93pV6RYHVNXx1JCJGEDQAEsm4Y6bbTbeIhGH7UaRO6w6ddQVyk7yDi4l95NHAF7/eZJww/BhONU36nPajgWwlhPGHMU7UUcidXkgr9iaHFv1Vn3RHB/z2DRoF/GJbR0+B+0zSI4TerReTYYTyh3QAF2yDwJtedMD9y/108ZZoQMFns7TF0djLk2OepxAEB4X145KqIqm44FfH8kVV7aPTEHhNBzghKAq8OFE9U9RxbfC7xWsHMNHwt+djNcHYrF9J/+QLRmc62koDfUnRff10vq1a5IeejX9Y+Z3jgs//sOL6zjrWU8vB1x4acpEgjkv2rR9tjTuxf4VQUCZ/AaK3HtaEHiJb77GZyyFLEL7QYWRqHOjNW0i/KlCT3lfkoogskHADzFwcC8KCqvovPpDYG+5lEulZkUzgHhNl2YupPFl4qSu67f8zk9kuw0bc5Qd0e0PA8WGSp7JnZvFv0CgjF72Tr6y6tDGBGWXv3Y4kGx+HMf2HrJwrcv1AmsCMJ2g5YqwZs/res3IFlkPoCFElP7yk0F8PbK9u6AVAlzVw0JfH8Mc7xPyngjMRoYSd+n3oEsOgthIyzRj+TtIrju185oT4oglr0H8iHgtKNQqWjsImAdyapY7QSvoxfLrq7tlEURpuewvOe4AW+USL9lNQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6PMMj07rjp+jwHSBemNNzV0rsD++gNCe6Paqv7a1brk5FsHLQTUPgn6brEH/8zHnQlRE1CQ7++11hD+wVg8ruNK1NLsK6Mm+ZzsDdZb6OQUzBA5hl08F3xZFYSPAmaq1jkq73NGj55ROpnb9+zp9Lyicc8hKxAEXGAV17EYvAoxbuuYTWv/vlPg5qRs2iQMcEV5DW5KTjjZFunI794hf0bu3+bvGdTX49KX++UF1tl+5qK/18jWVAmGN617089y4tiw3EEyYK2WjtTjvP2JBLZoOqpsr3vWCfU2K04PC523wRk99AcPzjnr1P1lFkZI7LAp3owXY4kmtLX2knFyTdzuRBFy3A+g3SfXXRvfCac1P/tKAj57VCKXSZ+TvfqS6c7LHDAjJtfke8q6RuNtghaj4M3LuGY+tZ2AfrWGXXNvUbj7h3A/l5bmcjbJ5K7no
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:48.6750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66db195-85df-4c0c-5f1b-08df30e852ba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_103103_291628_51C55A20 
X-CRM114-Status: GOOD (  11.10  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUDSS DMA-350 master sees the CPU physical peripheral window at
0x07010000 through DMA address 0x20000000, and DRAM at CPU physical
0xc0000000 through DMA address 0x30000000. Describe the 1 MiB peripheral
window and 512 MiB DRAM window with dma-ranges on the parent bus, and add
the controller's clock and reset.

Route the eight channel interrupts through the AUDSS CRU, whose AP gates
combine them onto GIC SPI 230. List child interrupts in hardware channel
order and set dma-channel-mask to 0xff to make all eight channels
available to Linux.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index cd498ee7e9a7..6ca94f606463 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -588,17 +588,41 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+			#size-cells = <2>;
+
+			audss_dmac: dma-controller@7010000 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x07010000 0x0 0x10000>;
+				clocks = <&audss_cru CLK_DMAC_AXI>;
+				#dma-cells = <1>;
+				dma-channel-mask = <0xff>;
+				interrupt-parent = <&audss_cru>;
+				interrupts = <0>, <1>, <2>, <3>,
+					     <4>, <5>, <6>, <7>;
+				resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
 			#clock-cells = <1>;
-			#reset-cells = <1>;
 			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
 			clock-names = "x8k", "x11k", "sys", "48m";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			#reset-cells = <1>;
 			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
 		};
 
-- 
2.54.0



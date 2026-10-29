Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dr5Or6RG;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=HgaIctwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WlhMA+ZDlfAPFlDQJ8STO8ZyPTbu18NIbLTAtajN8kY=; b=Dr5Or6RGAaqb/A
	2Ze12jzW19cSo+eXTxE5RsGjR2aYVTYY4wfSWyv6eBf9p7ns8asHGKs78s4twZV97TML5kMwRfpmc
	ygmfY1sbR8VQI7T+/w9tiMpq+6jNZ26VNWfFCdxdjroSg5+h2DYPXHD2h3IDIMHCgp38e63yKRovG
	xWWpaZdn5gslOZAKYZDvXbDcrJH3iFSWB87tHrp9N8sJNS8sAUdjetLPWCVrufkJiuj0BssvE3sq8
	P8ecVp0m7I74Ef4rq4/olzyjszTHjJ6gjVQXUDjAJVAaODQT4OTiWWm3Oa0R4pFEbKZZpGRPhM0JX
	uDJ5fIIoUydPA2xm2ShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOm-00000009Nf2-44hk;
	Thu, 29 Oct 2026 13:42:32 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOe-00000009NVs-19QV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOViCfl0Y4Vq/CGHStZynPtg/I1vmBIRQ1rgokKbmf8G5IDzayQzSpRpfoa7Q027I1MVtvyNjJnFxAsbBTyVmfurIjY90Gg7GlxAmK1T/T9xe5s8Jo88PXpauy1n4OnmVgxhC9My/6j7QiCuue8EtzPb0RT3B3mRgbJ/x0n/spY2dsbLqmZkkyzKHga8eK3l5OdiXD80KNQ/GetWSAx/v7BnKx6X1KxGEsb4p4qXThGptKV0fbyxGAR3WTHSUnwLW4t2vrOXfsq0ETECTzgSg8L0KMl875nrSfXSyHC/fuxNtiRt62O6Z8EFT6E+iqyO98+XBOkkWShD++WT7984Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlhMA+ZDlfAPFlDQJ8STO8ZyPTbu18NIbLTAtajN8kY=;
 b=gPABleRBjRP9nnFlo9eQH3d9cn7XylW4E6HTGh9qaVuD2+WJKw6srkBc3T8Q8ebrbQfPjwPd8ojHtZxEtKQymKuXH+PBUKV/ksTHV5iAzn4/WIDBCAKMQ2hO+ECYSKE+HyUJmYOFWwDApikHeLFYvkpi80LClLvK4ENuajhFj/UdynEIKougCEYmoFHm2xloDyGZJnTuiy3cQZAJpMduQnROcN689cv3ROegYXRyMIeaUwmXdXP89ijiIuWTukK+jnOR1rSzIHxhwiRxrhyTmeUgJ2mqWlX1tty5uGXoaQUDZrd6LUJ5nzlN80WqYpqmPok6ewNty0eUZP8PuaOBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlhMA+ZDlfAPFlDQJ8STO8ZyPTbu18NIbLTAtajN8kY=;
 b=HgaIctwHHvSbif+BZL43u4fYf9QszIz7D/Q96cgt/KuidRoDVbGhfvsbyY9nhgdtNwvJG76C+QR+8TYHYPupm/fbFLoSr5VyMw3DE12ZJyT2v5yGG+NpsgDXZ/jnGdG0tCsDWAF4gNGPSQBB7q2epOcE6pYu2ZMK3Z9nbfsbZZbJSNPPphUXuY6FHBnGGFJTcWB/oIVMifLABwoIMWtXKeoFjY6ToFQ5V4RrJo5yt2n/yK7VBtgS+1yy8t7Rsjc47iXlcLUD+i/P366YrkxZlBUMd32yzMUGhI3j7kViEyJy06yb7mr2NsBrzpE3noeFsSsWI3FSD/YVdFYCf/Btqw==
Received: from PH7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:510:33d::35)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:42:14 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::33) by PH7PR02CA0026.outlook.office365.com
 (2603:10b6:510:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 13:42:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:56 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:53 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:41 +0800
Subject: [PATCH v10 12/16] ARM: dts: aspeed: anacapa: Add NCT7363 fan
 controllers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-12-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Carl Lee
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=3004;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=EoPr1aSRvbTxwXKGNXjM5OoMC9gmzjxA/4Buu1Z8hh4=;
 b=gdBU1PslOD+Ml8ck7XmgiFmDSeKdTwaFFlvQWt7Go8fVLqRvtCX6ejbHPThGZtB5o5nHwj1lH
 3fh1qGR2A/oDfuLj14qwadOjCsIKUXjWU93eFliupfC+ZydsGQLgl2j
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|SJ2PR12MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: 540957aa-cd16-4b08-ec16-08df35c270ca
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35950700016|61400799027|48200799018|7093399015|82310400026|7416014|56012099006|11063799006|261009223027099003|10067099003|261021121427099003|18002099003|4128699003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info: fOqHT5CPuesoLj0tyhGwpivBOxtpE3a0/4bqGPEEJSz822rMw+Idxa1AbL/NjrzB6Q+yVbx8cgEXf0hS5P8AHa17Nzk8GFVWtFaVOXOTEq75IM2sGRy8DJjV+08emSriA+B5AOE1ewDg1P0D9KBIWCBaLgV1kL5QJSh390MFMmXGWQiUqFtCjyeAGVNxHO7VkLaL5mwOTApuz8wotJUy3mL8lqWbuHua2HLolm0UcDv+FwG2WMKEMbtGq05foR3eB+PxtRWTIVokAUOMa9Q92ym2JZqUdzIUXr4NWZgSuAy2fMA+GEX6HjIh+/idiqKSvdVd0QEJtiJcXuzbml4w52UM76icA/q1lTMUSv6356zx/mfUvromL2PXmdxtE8aa+BNgV7LbhF+gUjDC9RE9yB+xjo1stxo1cM/zwwCLql74uiAQNHldjYyqi93mnuERuhgVIuJTgLoiGznJ+KKXqL630QkViTEuRUXEWrqxCdfSWsNIHSV+5besUMxjfhzg2zlYhK/Mlj9lKvZeiODJd1V1P+UOdFUPTK0qxyAvuP/yDuMl/M8kLs5i9pqiZ80JepSbRCwS7+PYcMaiikq9p+WVqXI6o+xVIQrVs4suzksXYFTAQ11uNi4Vz7oG/b9+mewGwoUs2tWFz2hRyIWDTV1zhLfb3lYaJgY8L+8zmemGEnOLyF8FVmjEY7XWn5hSuCoPuBzVGWKjn7jsvV3/fw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35950700016)(61400799027)(48200799018)(7093399015)(82310400026)(7416014)(56012099006)(11063799006)(261009223027099003)(10067099003)(261021121427099003)(18002099003)(4128699003)(22082099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +IQsBnKgN2tmhS0YlqwzfklK28Vf70x3URMrvkHdeSkapueStmsfWDPgrsD6VfafeV5/R/K2tQGACQE8uvu5Stuv3eMFJ0iaH6md8s03rrUw9S9I2oPH8+TLvjeYUIOBHSaKIWyTy15zItIbMCcegK1s5EKWHD1atp0/rn1JgYiKO1JR/ullfsTFGpOCo6yZMa72ziNwMYDL9d7uXcOaO33kXCjP6/RS7QOKIz4V2OwE+9I5Jd1pvLjk8Kkm+siMdhy5h9OoJc9/2W84Mh2BR2o+UxkTbVSpnTr620YTxNScZW0p7T71Gi9pGcMb2S72uDvEjzVjJ77wxGTTqBUGzx9VyvkkNK7ki+ZcN0bVUL6rdCZA2WQZId8HvoLexQPUrkePXPgJj3GiQAoWvLy0Higqd9japK4NbfBhK3FuGEcPHLPRg661IpMdH1KrXARl
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:14.1539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 540957aa-cd16-4b08-ec16-08df35c270ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064224_387812_8AAA550E 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.0 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Carl Lee <carl.lee@amd.com>

Add two NCT7363 fan-controller nodes on Anacapa I2C mux
channels and define their PWM/tach channel mappings.

This matches the fan-control hardware layout and allows the
kernel to probe the correct fan-controller devices.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 5f849bd21fe0..f546a7b5786a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -25,6 +25,52 @@
 &i2c8 {
 	i2c-mux@72 {
 		i2c@0 {
+			fanctl1: fan-controller@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-0 {
+					pwms = <&fanctl1 6 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-2 {
+					pwms = <&fanctl1 9 40000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-3 {
+					pwms = <&fanctl1 9 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+
+				fan-5 {
+					pwms = <&fanctl1 12 40000>;
+					tach-ch = /bits/ 8 <0x05>;
+				};
+
+				fan-6 {
+					pwms = <&fanctl1 12 40000>;
+					tach-ch = /bits/ 8 <0x06>;
+				};
+
+				fan-9 {
+					pwms = <&fanctl1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-10 {
+					pwms = <&fanctl1 0 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+
+				fan-15 {
+					pwms = <&fanctl1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+			};
+
 			gpio@24 {
 				gpio-line-names =
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
@@ -64,6 +110,62 @@ power-monitor@45 {
 		};
 
 		i2c@1 {
+			fanctl0: fan-controller@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-0 {
+					pwms = <&fanctl0 6 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-2 {
+					pwms = <&fanctl0 9 40000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-3 {
+					pwms = <&fanctl0 9 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+
+				fan-5 {
+					pwms = <&fanctl0 12 40000>;
+					tach-ch = /bits/ 8 <0x05>;
+				};
+
+				fan-6 {
+					pwms = <&fanctl0 12 40000>;
+					tach-ch = /bits/ 8 <0x06>;
+				};
+
+				fan-9 {
+					pwms = <&fanctl0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-10 {
+					pwms = <&fanctl0 0 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+
+				fan-12 {
+					pwms = <&fanctl0 3 40000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-13 {
+					pwms = <&fanctl0 3 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+
+				fan-15 {
+					pwms = <&fanctl0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+			};
+
 			gpio@24 {
 				gpio-line-names =
 					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",

-- 
2.34.1



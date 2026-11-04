Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYnNKl2O;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=O9tLqZRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O7Nmq+yq5I/rxKDA72nxHgloYX9kmAMN+pJZiFmDy/A=; b=DYnNKl2OgQz00pCQt7tlJYvvpD
	lw4OakZQgoQ9Bd/0JKUIo5hOD2Gqw3xPutk3vLdOUPXzGXRFQ001fGdcAWyRjmEM19U1fuMTVFFnA
	UAF3UaFpP6EnH3xLptqHq2w1OCnlcYhyJD5t6LbNfJYFv3sbRRlYJr+/5mzAwdfRFvisHfXzyWEIA
	gksxMOJw1Z610hb7kJa5bBnRxGdMrPo/UMF4qGNANGGJ62ppEe6EIncXitz9kD+u00L2XWGzrTmBd
	OzLMzwli9RlSVqEvYq4KMLzkIVlJkGCpfZP/An2RI/KRSbsAZkZXtUi51LmZKY+z40jYcYRmYKdus
	qX3AxPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZV-00000005Xp9-2ZJ7;
	Wed, 04 Nov 2026 14:02:37 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZS-00000005XkI-2CJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bm6nTGAq9m77Y7/8mVmvPO9Z3ig7aqGkoBtm5LSGd0tlaNuED6rJ/BcDHCgUDqdZfHMyx60oXFU1uK/SIAVLLX5SbtFbtkWsNlozbmDUhKBbhgJ/XP3LzjjVMF6DosrHFnHpYASyi3yhUCr8skdZnnLWhZ7YEjywG0IfTfBQKF5TjuKswZYHy0LQ7mq5HFyrnNEbK9mgdBsZYcXA3T/HXJdu0tkv5kRpVsiqG+L9ftET1wuO0MkMcawmjjj2ptVl2D/slxNSNCNFb8pvEne8gZs+am1P2IICCU+7e3FiyHiXD/fkmdF8071uAUlG2moLLD3Xo3gTU/KnJ3UG4qttDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7Nmq+yq5I/rxKDA72nxHgloYX9kmAMN+pJZiFmDy/A=;
 b=j0BU6a7iaSn7imHWPPn5yaaGc/GAfjefwYOwmJLRok+1pXzFUme72oQFJ6L/KMI/35Co0dUavEnw6GVNqDvZsReqkJavR6WW3mYDRoNZ4RcB5EIa6pGPamPi6f7x/SjFbXlU1gUN5J1pK2bwkRs/W0TX/7E+HuEHgbSyV0MxSjIHYe4RiXkV2R2DpOf2WIUMJFbPiGY+EWjWitMp3PncF/6O5Yr6xn6Z9eWtDfoG3zGGtgqcrytFiVxOTgN/4q+ibZ5sLylneS7pHwtExMXDLCaoi051o7TSxEKLSrFeKs79nOTiwHXenEcaH1gArti/FRgyF0EbPoYYeg6kmiMl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7Nmq+yq5I/rxKDA72nxHgloYX9kmAMN+pJZiFmDy/A=;
 b=O9tLqZRzxppOERcl1RjWOYhmsC0hjJiSUS2ao/Ja5PWZugWa4WH0Da+ppsT/+tsQFt5FK6XqDNI13SUQzsAqT0Olt5jEgzg0Uhce9hbdM26qIhD9EjJCWkkuBDLnm973PXzRyoDDpVJEm/AzusEFMsvQMzVlzGe4COZ5cFkmWvsUvuR6Bcxcz5UE+WsoziGF7Rq6poFScMXQrT+ujFPZ1d/YB3iOXt+H/h09GQ2FGT5yhtcIZpa4lGow5Yg+ht1p5/ZO7IHIeNEyEvXMB9MuMpDMwFxLO1zY1zJ+Bf80GgZGkViWiphqzG/dn/Cm8Ku/SVMNJFq9FzIVhw6Em3AG0Q==
Received: from PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22)
 by PAWPR10MB7865.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:359::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 14:02:29 +0000
Received: from MI3PEPF00008489.eurprd02.prod.outlook.com
 (2603:10a6:102:19e:cafe::27) by PR1P264CA0017.outlook.office365.com
 (2603:10a6:102:19e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 14:02:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008489.mail.protection.outlook.com (10.167.240.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:03:13 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:28 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/7] arm64: dts: st: add power domains for STM32MP21 family
Date: Wed, 4 Nov 2026 14:55:10 +0100
Message-ID: <20261104145502.7.Ibc243544a13186cabedd574e63a3a1f881f9fcad@changeid>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008489:EE_|PAWPR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: fa62000c-042e-4428-99ea-08df3a7c4364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: jBIEAYqteQAi1sR2Jo2hbM4viquWR7sXTzecWSByzZ7IXHGTXSYd1G6R2NeeBqXAWA60bMr6AHAE1BXAFEWhbHsCYIEodz0cqyhmkwTm6l1CbiueR41unO348PMo4cNWQsq34Q/HUoFjJE4adAy85jPI1a4d7ckbrBj6FlW1fYUX6OUOdthEvjLuJd1Ss+i/jV0UE8Df+S4SS4hvv9yZD5XjxqYDP8tBDRKe0gLJ1Dg+FwlbvA8E1NGcYy7t+aih5INuZrZ2KrweUYVtaTIZkVdDWoffhNMSh0i4I9l9Ld9sCrz2Sy3pbA4IR0FqthjaGjBSlg9PwhP8NjTD+kNsAnepNB+5uxF6mgjk8JuB01rpX1OgjlS301yaOuQUlqreTbQECpIYBugL3XlhnEwBgrH98OCIQAWgd5d/J/9cOf+4HsMV9wfhQHf/XvMmtod4sXk00lKTtdtTws+EBNewWkjM1UoSfNx7+gI1uweff/hhA4G8vM2Tv3EMmXQNuNokY7rd0LFN0dzXAdfzSo5d0tXLGhIPpJ0RaxiOjonmPbWxmhyen9bTbDrThH8EWUnoh4sArw7X7R0JXqff8b9/slZI08bC2u1a1N8HvD0gz+cjxIhVe9rEsI650Pn6mfDMpm04pucKmp1uQEsYf3pBU03dbDC0NR6ymqpW+R9xsdBGgg5bUzcvphCLAesE/TkSvpZf8oRicqgO/YwXD9+OOQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E0IA6/f8rAz0W4tSC1XMzWSv20kxSR3Th5umFIng0KEQ0AmQkd/jMVX8elrJ+MTK3KdZxEppBaKRMGPxlppeQgERb4SWxg+fIXaf+Z7DViZ0SUFn4qFx95iusRztg4TrBVl7bvFerYkc0XnxCQb1oOqc0noR4q9u/hrEwjgAYX2mJZIKQGu/Gh/j8ff5ldd5yWJPFBdkH38soNXfpu9YvaPVyE5OvaU44C2GI48CYh+GquflJrdNw/OOQ1/R1OjKfCffkDDegCE7uiWnyaqNfENvGvYsFF2/yMZjk2dfLS8P0vuLXKixrowZ1L6YL66k8klLy40dIJr2yt2jI51BSKlWJ/ZwJAsF37LnPw4W/SHrKbCZR/v8JUDV9A3MPdrZIrMyFBUkq1xUM/UiDekDSmy46VQW/Y4LwIhgfcd41tdiy3Qht7SUJ4ASUXAsqnx8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:29.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa62000c-042e-4428-99ea-08df3a7c4364
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060234_565695_E138B576 
X-CRM114-Status: GOOD (  11.09  )
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

Add the PSCI power domain for STM32MP21 family on CPU and cluster,
and the D1 power domain for devices that require the Cortex-A35
cluster to remain in Run1. The wake-up handling is only managed
by the PSCI power domain with EXTI.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..aad7c87dc8ca 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -18,6 +18,21 @@ cpu0: cpu@0 {
 			reg = <0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			power-domains = <&cpu0_pd>;
+			power-domain-names = "psci";
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00000002>;
+				local-timer-stop;
+				entry-latency-us = <150>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
 		};
 	};
 
@@ -70,9 +85,30 @@ scmi_reset: protocol@16 {
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
+
+		cpu0_pd: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
+			power-domains = <&cluster_pd>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			power-domains = <&ret_pd>;
+		};
+
+		ret_pd: power-domain-retention {
+			#power-domain-cells = <0>;
+		};
 	};
 
 	timer {
@@ -108,6 +144,7 @@ usart2: serial@400e0000 {
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
 				access-controllers = <&rifsc 32>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 		};
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96260606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rj9bbIMB;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Gc7mO5Yb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=; b=Rj9bbIMB47zltUy8Gq5hCsPKr4
	HwZ9RdB0lPOVN2wDfXlBIURGN+9CuLGPwpgZEdtWiA4urCibMPpcwDTc/eGfRKU0NafYFXIoYJREu
	gKGySSImt5Ykaq4nyKuYqmu8e3iqeGjnh1ytobhC99BgIid+ghcPVQGct/6nA3lLK0ZzzaPQMOcDf
	NbLjJS+VJ+t40HBMF4l7yS5Ymleacj/eMmNeHOk8RnkLLaVzHXTvyVeq60WRHxyvzqELk107Ws0nS
	pOMB34Uqmz0EIAFAqYxjJyi0cM5opS4Ftt9ekClMwjWnaI4bb29ir6LrWQGW81a3SjcDhAyq1LkjS
	caEeddcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa8c-00000005Ke3-0dzK;
	Wed, 04 Nov 2026 12:30:46 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa8Z-00000005Kdc-2hiq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVuTzr9xSSomF59jDZLQpzYWSKdu4vl8ObBUl58B53Q7v91nryZfLMMNH2l6Ou1mziXL/sxknOVbCjMrBP7PQNHnc8rXHFKyDhg0PSftm90CXHTvGEx45F4BSrr3DiLUcQowdQfvD7bm27lUPrJkvrtW1u/IA3Q5Ox2of+GPrKcWNZA283rYrE/NXDY71Kz02SFUOaq7utHDPYRtHVe9dIdTbwxA9Ea+YDJ2P2eZAfCgilp/DWBdd5ktxRNWMIYixjDqReM6J197+waNA02uzLLfrD75EZ+7D7ImVzeN3MHoSG61M40RGLlGjGh+l3aC+g/g590TFYx33h/aJEw2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=;
 b=hSUDrIEbVg0vkuRCGrRalENwUC+oPlaLn4AgSLRfeU0jLGN6MHRMjYbfV8+Ntvbe7ddxcj82/d9pd8Rc958zdRSasZSvHkmurQz00quqz6DUCIfYLjj0s5YMMioYz7+u2yX8ZfUT0US9b8Czgsp0yW9aTb0KDaR2opE/55Gl9DNVT7Z9iGMHrOpGW4O//0buiibRQJRKg/v2PEL3pMon/u4Yr0XYM8rJsBcYIjMB9OsqF/LzkQ4pRiI/XfPaB44qg1bFCVu4j7qwZ+cFABu52Fcq7gAVJDE3iJegGlDxb81K3xrVhd2cIgxu1jUigSVXFpyfy5tzUgOn9z9B+dn3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=;
 b=Gc7mO5YbdgY+z+PS8czdbIEn4JpOqCSuEZFZhh8RTbZcXp7jood2qHKzJXtKaYl9UgAfjR6iJRLVuMV3qdpCVPZWHmFDHgNOsKE0gnIzmtpgXdIH4MC8Os6Thdlb3bx7IfjjpMZLduozKLoVlIsZTq0VklSu1R/xAaIXEXwOw0hbT3/m8/p3ZBzpPCAGxONoAjfpk82Ii0eP+7hMs81s8FU+/r2obuZQBDOX8pay8c+kc0w6eWp1SbfqDQDIYHYnGejNEJAPQs50QW7hJgRr9C3b71Blkmb84C22rsz8Ml8nhkgli/l+FKrb5zzOfwwT0sLm5XOGQDRebc7jL2XHMg==
Received: from VI1PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:803:50::39)
 by DU0PR10MB6653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:30:38 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:803:50:cafe::9d) by VI1PR03CA0068.outlook.office365.com
 (2603:10a6:803:50::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:30:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:30:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 13:31:22 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 13:30:36 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
Date: Wed, 4 Nov 2026 13:30:25 +0100
Message-ID: <20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|DU0PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: c77cee8d-e871-4870-ab22-08df3a6f6e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|10067099003|18002099003|11063799006|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: DtDTCjRjimFGq3qhRmYZhRY06h+v+/RQUsLQSOpLUpRTwRepnHPB+w7xsMgxfm5QkgvHxP8zAf/+hqYuUdNslj43k9cOCSy/b5AjZVYQEpBn7FK7D7RxDyfD0BBBClxUgpfZEaQl6IkFp8dUjlfOiobFMxdF6jWFoaCJ5VZupp5XchyImEbxtIt00wU6g0H0LS7PN2QkPODaztG5AAUUq4UQeabQOiowa5AI1HTz/qTN7lvGyzW5n/3J3mWQTuvtagomEQ15b+YFPtcN9rwqkFF8pdRId1SJUFACalTkXBxC98Y7maoBq7SiLGr0IcuPWXn6QTdPzjT9eovWGuhypiWw0e/eATWSFjMBgi1mygaF66/GOtvhN4z9wjKllqNEJikpY+86Zl9DCzcQJhqwgPtgeROImi41K2BLktAn3HfjbU1BzrlRMNAI2rSoHU9Uh5c8788a1TUBW8DHDGX/AObPGMU3pKAHCr+erNKxM3mqp5IEuWY0kdYrvKJpbwvr9u8BC35YxmimGj/pVAQOB2IGk3dXCOn+KZ0qFx9YMRcQzSpwgny28vq3wz7cqXJT1vShvNdEUtrQmjIuyiUU9ubWNStTdCae75zXU0uljCnyB31gHXGTy7MuijR815/EY3LzWKCQJXMkYfP8Fxm+tvJS1qpZrHiWUzoc5OQIErtdZnTImUiOCvdW9t9fOGk1S/kyFJ4ERzexhbu99wpAww==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(11063799006)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PHj0AojaCJlXQSQgNHm9cdSaPKLJFfYCE6u8mQJ0pH3tCTN0iiX1pYwQIjcJhaR/LATnfwFkkZfCvS47x2DGMXFeF5YuuZ/iZmR7mN7uv7mL+jACEwVPB0hHsCw5MaCGQEPluD9S80VR3EmRpU6zPRJntoKSlJkMPi+hk9q7PlQ8POIuGLV5+gsq86M1lPQGjifMLPrmv2W8SukqDsQZ7eAz/9Zps9aWsilbJp8zWw0w1fxtMXVcaxLJtpOku6lL9Qa2u3d1MyPURX3N7dWh8ZQ1ul5nTx3Kxvy+7M8di5UO7mg5L/nqhMkD1OODeI7K5cj0ufkAy1g39XeISSIUnuU6KLhvmsXaHU4LdsiF8VrkEKjaMSl+j7bcPRrOBec8lPB+GGg1tEoHuzaN/qHo4fllxkDom1n1acVYLCzPXe1F/M++DekZjk7VGNn4/gHo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:30:37.5553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77cee8d-e871-4870-ab22-08df3a6f6e49
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_043043_919616_F0EE21FA 
X-CRM114-Status: GOOD (  11.43  )
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

Define a PSCI CPU suspend state and reference it from both STM32MP23
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..27231e140fbb 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -24,6 +24,19 @@ cpu0: cpu@0 {
 			power-domains = <&cpu0_pd>;
 			power-domain-names = "psci";
 		};
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
+		};
 	};
 
 	arm-pmu {
@@ -123,6 +136,7 @@ psci {
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
index 78f4059fca5d..cebefd99906f 100644
--- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		cpu1_pd: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 	};
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
branch: master

-- 
2.43.0



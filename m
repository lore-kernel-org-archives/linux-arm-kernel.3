Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742B60A2605
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTAwdkIJ;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=NzghQOaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=; b=QTAwdkIJ47PN8y
	e/gngUcYdl8svPnSDh0viplXHqwaPHM4/7IZCrlxFV8WBRDLEOwQ8y8QFEMPlh2yaCFNdoltZub2j
	kgObDEgFb2le+/ARQmNY/4i9/Lv/9nQdsXfqBV+g3SgHZcC50CB2HU/h31fXEmUurtUf2GJAfAs5Z
	v5uu+OOAJYbnd/g3PPjrdQm3laiEjRFG6YI78fDwOMb/2W8cazT+zwm7yu3+4YCpysMIXyrTYdAbm
	lf4yJKpoHKNuNU831Q8vumCFT0u6BWGsdVD4RpoLbz7o604RLzomEsVQWGxdprtIgAVowwLgW9kec
	mW6RhjE25+WfRj+3yURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMi-0000000Gfr4-1Lfk;
	Fri, 23 Oct 2026 16:43:36 +0000
Received: from mail-northeuropeazon11011046.outbound.protection.outlook.com ([52.101.65.46] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMe-0000000Gfpv-3nzd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4phVEkKtWKDrQ3/1dFdIYTMu97rsgvqVUTMtkzCxqN7W8v2kCUeXs16QEwEwPoqoEATmQqIxPi7TfK936VkI+MQhPN4BHHfpnPXJpPCBaQVihDqeAUbRAa+qpa8j0wkS2RunuwgM8+DJtRHBJ4SAeFuNftmcc5g4hHAdEeM9bwfx/OW1fjYyCuCE8vtZLqr+G0zD7Z4tLJI22DjW4bHaVIXJisHYzQ6fEJarsh7iD++uuEKKDDKwM7drwCi+uNtWcMaRRo2rqDa8oR3zHPdFIKdsI14FMNqlrEtRSHHUQHac954RWWFTeAI5eSxkIBGl9zlVBaougqYQVQzP893Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=;
 b=MRPWrGkYyEuNhQGvwabB/tnCWuClnmJNtp8Jv7HuntbITHR5c1C4CFqT67LsttCxU3sivK1sWg2XsXZ2i2Tem7zCTe7zZ9u5Dns58OMxyZHAQHNrYOS3xKRltCERl8AYqihfeMse4bx2BMjJhir1U50IgeckqAirV1PCbnqnRcNogbrcAxquBqk+k+YYDaftO1Za9lbFr59iXaB8XsbNLAYrd/FAmNsH8pzPF6RUV1WOfpSHs9SCT5ekHFXDIpCU1UJSdeU6sCRmD6QQWBGwqYrIjYwEevpOai4DU8wvQTQGLV2S/c7gu6NnbXc+bwWu/6QomH4zoPKjZ6raunHPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmxW++muCBoJP1KSzHZBk5/1E6g51EifKo5ZOv2LTxI=;
 b=NzghQOaQ0IqE62yZpSq/gXr3za1sNEArR/dJB/WcII1eBU4M8hwHLdbg3QVhAloYgxUToltfspoahzoODD1HJaAGDtWyiY3km7RNSOoW4bgUzWpBBm0JUyVma691oGD3zJWArWTUC6gtCxxEuYwFmAb/cCYWRM6igr7yq/0peISsfYl22kqxPfjuKLILx9vMh2wPLxI/FZTO+kjrQviOGJ4bwR8jqG8hGjBju8kgOmzZyV5r0uC+yhhoFq7zUByxC5N8zUoFzlisLwMjciN8P9HoAJItEID4nfFkET4MNPTpGP8gUeHqWmbd1K6qSAcRdKOMFDqpwPr3EV07/sC9Mg==
Received: from AS4P192CA0047.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::19)
 by AM9PR10MB3989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 16:43:28 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:658:cafe::a0) by AS4P192CA0047.outlook.office365.com
 (2603:10a6:20b:658::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 16:43:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:47 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:27 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:18 +0200
Subject: [PATCH v2 2/7] dt-bindings: stm32: add kernel clocks for ETR and
 STM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v2-2-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=1944;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=GSgOwjZDuhrIDIdVospjwtRBccbKbUndwKmf4/tHb7w=;
 b=vjoP4njWwHU9ZP5Kx2WE275Q6q+OwaKCxI74OZ7BBUwPbV/4Ur3QHKH/ibF4kD69bhn63X8FF
 g6t+j4hBlOZDXWifNJz0pisvuMNIk2NRYYGk/pYRjAhRSGXHHyy5HTq
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF2:EE_|AM9PR10MB3989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8999b2bd-9632-49e1-4667-08df3124c38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: pm/3D4cS7a+MZp24pkVrOfNXu7RTX0wQ2KpqiDnxb92iYdVkgSHTrSN9h1Dei0pxdDsiLKcymmiW8F7G3gJ8Jk7fo0c9AsGT0++wyekebhniBWMhvHzVsfwl16mkoUpTnlm579DbvWtIre/PlkcX/3gXitZslyUR65Pvo3H2oSXuIn4EpojDe7CvB9v3Ese2wQ71nZMPfTRbFihD0Xx1135hjR4/LY9EiDzsfTEfGED0uLM95Ugk2TZoRx0zACQ2nb1T61YFyRGZQ2jQeMqWWe//BYhMd1G5iXvlY7RaR7uIs2FADMxUjQS6nSiqd+0dV20kiO/dHfZMSDAHETs+5DY2vvW2MEYWuVHy2nYuaCoQsMib1bDIAOMUwRlpVVWP0MwJdNC9OZtDQD+fwm0ZvN1S3OTnf6+MpzUE2D0PW62qSlkll95Ty6GbIxp1jfr8Shuem8nGyImWjATwKgaDAIJS0RNySyDY+UBcV6h9HeRUv/Ci8o8NsprBmhrHJDCud4A8gNtCxxDIoWsT0b/4AdbVKe1hLo7dpcK4EtQsSLIdA2FUrd1i5o19rVRTT+sTts2NlTfHyqRyfZX+jpr96V0FpboFpsAPPohfXm+75QEOnF0Rkg7ObPt1HgGsC4ztqDUkapChiVu4DK4J0jmbX45vstbYVGui5B7ondJ0pEqpJTv5GMu1BlV4PiKc0SCgP0E6ol3do13R7Xa+royZ/g==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oGNf5NdoOvwfHrp1MlZ41qsLMs/lAs0IZ62wDUsxO67M5O/HjAL7R8Y27ToJtSnET2mntCBKxonzNs4t535V8Jd3jWZjRB4xR4q0FBY69G5zlIUImm5Q/b4BzNSkyZg3hthCgdGYkGmF/SoiZ+61fAV/CtFR6mGEgCQOQx6TJSfOwm9r3ElZRQ4ygm/pelx34TLz24qrKW2IMmYlj1+bjUXp+EZBFFcciNBBQPnknbine8db3Leox2sz4H+1WsKw9vzO6LOZToT5Pb8KS1/hgJY8kUzhx5tLvs6geA0uz987tqYEmJk5t7kf+2j86pOkM9dzWJgxJfHIKhk90OEGWaMj4YcM/o01j+pfd3dZ2Y0+EPR4/r6kbRB1YfwtqId49c2lOv7XP3PbNRwMCQsGSuBEyhSeKSuTqiCU1+qBGniT0qoTA1QB+slHTYhqdz5L
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:27.8203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8999b2bd-9632-49e1-4667-08df3124c38a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB3989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_094333_158933_8DA1C7F1 
X-CRM114-Status: GOOD (  10.15  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
(CK_KER_STM) for STM32MP25, with the matching SCMI clocks
(CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
These are the trace (ATB) clocks of the CoreSight Embedded
Trace Router and System Trace Macrocell, while the bus clocks
only provide register access (APB).

Also rename the bus clocks according to the reference manual,
without changing their values: CK_BUS_STM500 into CK_BUS_STM,
CK_SCMI_STM500 into CK_SCMI_BUS_STM and CK_SCMI_ETR into
CK_SCMI_BUS_ETR.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 242f61205a9f..cef997508b56 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -109,7 +109,7 @@
 /* LOW SPEED MCU CLOCK */
 #define CK_ICN_LS_MCU		88
 
-#define CK_BUS_STM500		89
+#define CK_BUS_STM		89
 #define CK_BUS_FMC		90
 #define CK_BUS_GPU		91
 #define CK_BUS_ETH1		92
@@ -363,6 +363,8 @@
 #define CK_BUS_ETHSWACMCFG	341
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
+#define CK_KER_ETR		344
+#define CK_KER_STM		345
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -450,7 +452,7 @@
 #define CK_SCMI_TIMG2		83
 #define CK_SCMI_BKPSRAM		84
 #define CK_SCMI_BSEC		85
-#define CK_SCMI_ETR		87
+#define CK_SCMI_BUS_ETR		87
 #define CK_SCMI_FMC		88
 #define CK_SCMI_GPIOA		89
 #define CK_SCMI_GPIOB		90
@@ -485,6 +487,8 @@
 #define CK_SCMI_SYSDBG		119
 #define CK_SCMI_SYSATB		120
 #define CK_SCMI_TSDBG		121
-#define CK_SCMI_STM500		122
+#define CK_SCMI_BUS_STM		122
+#define CK_SCMI_KER_STM		123
+#define CK_SCMI_KER_ETR		124
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0



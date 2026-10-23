Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14460A3811
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ud1ZVeZO;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P2VTr0Fg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=; b=ud1ZVeZO2uayUw
	sfnlPF92qHnae8AX3wcX8cf1INiD1yFTYf1FI02HKwACcd6LmqKPG3l02PCjyMeyNvrdS3tlgOdL/
	05UzGaO2bA3stnRbzmnh8g0FwZzVhZ9ajNLHOt/xW5/08vjO6FgbWN80JT4SaVQ0B14APdmHtbm3J
	FpdviZxAskOZ57XXcz2DLvm0QEdwzXBQcBww1Y2WIFfhdn7z53phDDM6KHh0Tezq76JKYvv+7rGsf
	KOHPzafMfWc+MnNcah3uIYRX/RWbLWgiNK9IYoc7J9m7sE5gf1kwx84Hav5JQeeBMXOPbulgRgIks
	je5EG8oU4/W+MIk61yBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIN0-0000000Gg0t-1aJd;
	Fri, 23 Oct 2026 16:43:54 +0000
Received: from mail-northeuropeazon11011067.outbound.protection.outlook.com ([52.101.65.67] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMq-0000000Gfv9-1iT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C09WCzlzNxQ0JWS5E5pdtGl2vPgh066+GF2/Bh4VsBtoMAq5TE8ZKdnONr0W1ttW2BzQn/plRmVAmfsdlu9r2HOS3ZXNCFh4joiYpC/fGLzGG6yUJBRTSeoR0Rbks3YRIcayj/7uvJ2gHzUByD43Ua+1KyNzjZFygpAcpUYHTEpbmYQ1W9UCn/GLX5rq4kTQwR+9MaYDTUVAtFOl9VV/GbB8TjFEwbLfa/qFJj0pb5QvlbFamYxryTlvbor1ZTUcl1/VXHCg+sbyU/Pxih5a9su2BoeOpiKYZ9wlr8Gew0874OwNW0eg7azvnJE2t4HbYO6MiyiKOPtQQaTtkjU9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=aonk0JQZ/mTzFRYfQ9faobjAaxnL78qvx+e/j+KLw0Sjx0e+AQmfnn/B2qZU3xW5ppwoyRbA2yNYsuiD7xvSuY+Cr2pm71nQ5NM0fc6r2uG0vG+246jj6U++omzNqOHR10EbyJeNC2q8DpR25Ryd7+dIWCLOOPJLkGoRgWvbjm5dMBuRBaT0I/LUQyFbm1PP3iIOsh4YAx8mB1p+j6DRABOc1+qTphLdrH3zhkRfqVk/Cwym2LagNOGmLBFrYnhqahsqQDEPB9hZqlMzCQO4th5nxVxQ7CX+Dr+2pbxKFKn8riMIpVkMJiNFT8jn0IJNsgeVeS5ZKpW0vxZ0mbVwhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=P2VTr0FghqZtJqQ313duhJWuCDDDr/JH/j9/AVubR3/fFvXKNLLDoXkezSjA6elmgDTsza+q3q3GOcAH/uPrRvIln8/Ac1dfJIpBvppLkmhmcuTBUx5B5LiE2ECMgcjHnZRb4OXb9MuPcEwOyoT8vaZ57BdsVfXxiHXopm9wCDNd+hufFoBzpxQk9bsG19KBBbjUwt8vHJC6RwN8KpntwqcJ5KyYlLqXpZ4P1wXSxs6sjFhXGRU5CNHJQIY6PQak4czBOIUTyO5Hto3hLX6yAkTqfq6XwH46H9NZEQCJxy37kdHKYjlmL5+Zcf39C1+YmxbwSalXb7RQz25vCMZe2Q==
Received: from AS4P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::7)
 by AM0PR10MB3682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 16:43:30 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::11) by AS4P195CA0007.outlook.office365.com
 (2603:10a6:20b:5e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 16:43:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:49 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:28 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:20 +0200
Subject: [PATCH v2 4/7] dt-bindings: stm32: add clock binding for
 Cortex-CM0 on stm32mp25 platform
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v2-4-398d348ea8fd@foss.st.com>
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=4216;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ihfuoPdN8mbPb8Kg/gwynWIfED3T6eWjZ6ZI4XBY7qQ=;
 b=+a8r673ds1Pa3+wFHNjEOlj3hHlpSV2zZdVppPwVz5jXMkhruss+iXy3jpPXRx6aiD0mMGehU
 WLYeu0PMz5DDv970/qXpH1C/N+6lVRkwWMPQ0lo3S6K5fgG4hrHHKVo
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|AM0PR10MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: 89aea6b7-ce1b-4378-be4d-08df3124c4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|11063799006|56012099006|22082099003|18002099003|10067099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 0cJf3f7tu7nhH4HfhS2yMGKgDSKqaIQKWNA2iqNOS1PEJsjiU2YHJsV/U3I9OAUTOkAfZz9yUmvlReL4IWsOZl3HiQt57ypb6Ezi232yuPrGESKVPMf6CgWoLAuHN1g3VXLW4ldfZvjquov4/zrlhFruH4s7QlD4FVfAKW/FKwMjANV6uKadiU+/3uKy/A5Nv+goE7KqxYopszXOWvr0Ni0H5AfaYf2HVCK0dJzyScBq10qoSz8SHX/mbk1uJtFAzbX+VtJSSvDcLrisfRhydZXTd4tkUBryb8sGiv4H+Qwm9I+QSOovdo+kK9dUEPNXHyT/7fiQiT6Ck5DXn1MV3ZzmFrLZj3tKHrOwXsL3F0uriN//S8SJUDrOPzFb5eQmNaJNxttAg5fDVFFWpEUVleD7f1YpB47GaO/bVw9QK4g/8o+sAzBy6mIOxLTwHXQFXH3DMtpguDnnM+bM9S/eIBoiRmycOO9gCnGz0mz3OqyEbu6YH7CNbYnkbc67saox0huk+Zq/AEI/ITmAHlLFUo41zwe4Tvw6LJ6TVl1k1p1NNOU6cxMSLtBE9pnNsD6j1WnulXUvTQLawygXtCajHA20Fz3SHbVMux8x7a+TrwQqezIVe5yf7ViUpY2+w8VRrTlX2wEoIpWo/tdrxOOKYV3T48Srh3+Y0hzO1FBFNjWwWOzx+zNjnOsu2OtitxrBS4gZpAT2c9kyFhl/JGrBtA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O3l6vOmqLifuGunHweba7wPd/A3MmRbQesZlvzGVKpv5vBKqM7G4rXCsn3qtRIkUyMQnPFX9LUp4hjndNrNr/30R/HCspypvIR34M49zkf8PMJgkDKmW6TzA8T7B9uJ3vGyxXTpm+0JpSsN/Buw+ADx6ZOvn1xCex3OwQBK8ahIoG4et1aPoeJHKtgLwsdvR9QL9IPLLUcqpHfMsySqBVEIE8GpSSMlVCyJk0/F9IB7/o9IgDkP0CDHZg5w9Cx1F2dd/rfYvbHSWi/OFQ8cp68F2fbNzaey4PTvFybI8z0JDsZeOGoOK5U0iRQD1KkLfq1QeJEGSE8NuDEupSh4ggJ9FGw/YTYGDDKQmCG0qPe2TxiN/wImntn4dMXyURQGapnYdvkedVrv5aHJCy9aN6xs8YnVOtBH1v8udh7GkXVMLTxGdbS+AXpF45Rpmfi2I
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:29.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aea6b7-ce1b-4378-be4d-08df3124c4a8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_094344_469183_2C031E7B 
X-CRM114-Status: GOOD (  11.76  )
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

From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>

Add the clock identifiers needed to allocate the D3 peripherals to the
Cortex-M0 (CPU3 domain) and to enable their autonomous mode:

 - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
   peripherals to CPU3
 - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
   the D3 peripherals
 - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
   HSI, HSE and MSI oscillators

Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
CK_SCMI_RTC_AM).

The three kernel clocks of the HSI, HSE and MSI oscillators are also
added at the end of the RCC input clocks. They are optional, so that
the existing device trees remain valid.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 3b7925d2c175..423016ecb602 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -32,6 +32,7 @@ properties:
     const: 1
 
   clocks:
+    minItems: 80
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
       - description: CK_SCMI_HSI High Speed Internal oscillator (~ 64 MHz)
@@ -113,6 +114,9 @@ properties:
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
+      - description: CK_SCMI_HSI_KER_ON Kernel High Speed Internal oscillator
+      - description: CK_SCMI_HSE_KER_ON Kernel High Speed External oscillator
+      - description: CK_SCMI_MSI_KER_ON Kernel Low Power Internal oscillator
 
   access-controllers:
     maxItems: 1
@@ -214,6 +218,9 @@ examples:
                  <&scmi_clk CK_SCMI_TIMG1>,
                  <&scmi_clk CK_SCMI_TIMG2>,
                  <&scmi_clk CK_SCMI_PLL3>,
-                 <&clk_dsi_txbyte>;
+                 <&clk_dsi_txbyte>,
+                 <&scmi_clk CK_SCMI_HSI_KER_ON>,
+                 <&scmi_clk CK_SCMI_HSE_KER_ON>,
+                 <&scmi_clk CK_SCMI_MSI_KER_ON>;
     };
 ...
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index cef997508b56..53c65e9a12f6 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -365,6 +365,34 @@
 #define HSE_DIV2_CK		343
 #define CK_KER_ETR		344
 #define CK_KER_STM		345
+#define CK_HSI_KER_ON		346
+#define CK_HSE_KER_ON		347
+#define CK_MSI_KER_ON		348
+#define CK_CPU3			349
+#define CK_ADF1_C3		350
+#define CK_GPIOZ_C3		351
+#define CK_I2C8_C3		352
+#define CK_I3C4_C3		353
+#define CK_LPDMA_C3		354
+#define CK_LPTIM3_C3		355
+#define CK_LPTIM4_C3		356
+#define CK_LPTIM5_C3		357
+#define CK_LPUART1_C3		358
+#define CK_RTC_C3		359
+#define CK_SPI8_C3		360
+#define CK_ADF1_AM		361
+#define CK_CPU3_AM		362
+#define CK_GPIOZ_AM		363
+#define CK_I2C8_AM		364
+#define CK_I3C4_AM		365
+#define CK_IPCC2_AM		366
+#define CK_LPDMA_AM		367
+#define CK_LPTIM3_AM		368
+#define CK_LPTIM4_AM		369
+#define CK_LPTIM5_AM		370
+#define CK_LPUART1_AM		371
+#define CK_RTC_AM		372
+#define CK_SPI8_AM		373
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -490,5 +518,12 @@
 #define CK_SCMI_BUS_STM		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
+#define CK_SCMI_HSI_KER_ON	125
+#define CK_SCMI_HSE_KER_ON	126
+#define CK_SCMI_MSI_KER_ON	127
+#define CK_SCMI_GPIOZ_AM	128
+#define CK_SCMI_IPCC2_AM	129
+#define CK_SCMI_LPDMA_AM	130
+#define CK_SCMI_RTC_AM		131
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0



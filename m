Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B060A262A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8cq/Ibv;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dXq6nKj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1lhd2SOwK6SeODQGTwX6DUT6/L647Ce6jeN+Ae+vPCk=; b=Z8cq/IbvMpBzP8
	GdRyIPWE/LOGxznGh/+FA1RbkSIzs8Z3tA3aSw0GKmLIQwtIOMVdbfyK/GgC4aUR4qZM0ImUJlowR
	jHSLu8BzaJZ5CT45fkYLorinXD6CzN2u2pIzW8+VB/K8s+nx/YWMzsqnZBHP0ggdRhWPTCBlZp8h9
	p52fUwVCfLztYSAuAGpY3YLDuaHPthqat9U7l7tug5edLJONqdeucT8fcDSDN/WZte8N8Vdv+2Ju0
	pzkMbjrMWZ8ntncCDnH9eUoy0QEXF5t5QSN56/h9D9L8JWZAILSFNldFtNtXbhnYVoWg/1C+otGXw
	x76cXLxEnTAGIIxg0wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIN0-0000000Gg0C-0vJk;
	Fri, 23 Oct 2026 16:43:54 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMk-0000000GfsJ-2Rhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGsI1ixRnJgMs3JYGig0I5MeAWNvlVucwa6WU2p0grLsxCMaMK13Y2nOKSJTvDkXzxrqbfhfrJUOd8g9khtrB5oP8T3tXXg8LnzCcWz6VHzoe3HkwTIDZ4ZW2ttq9Qa4cl7SpXYHD7PrgVZrCDzPUxDI6/Y5wenEOYaVFm52NkboHJnvYz3hxGc71dYzsDMO3QAXi9fDa0vyeQDIibrm3hAdcCS1EmA5PEc1DiyWPZK6/f/h9vcjtEQnXp+nHV2wu9T/EyeTjEWdswgbdiCAExoTYcaEqlxyyivjD/RxrRD9v5aFXOw8oyRjuoxYS+E5WUazg7CQmhlooUp5u9FQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lhd2SOwK6SeODQGTwX6DUT6/L647Ce6jeN+Ae+vPCk=;
 b=xYIdPe1svTCRUcnP1n1A8uVh6N2KdN3wbECohfPdjCJNseFFPVsoE6vNGYLITYvsYAzOdPGqUluAXYuu077eLcH/pDUuQtsR2WKh7INHw4oB6KUtuHuYfwrAzGuU1aHne3MFaazLeBMb//WdDKkRtfHcS93KIhJwgLWf2DYvORy8wcZDsItHztpPS2sRgNxg2hsiPV+uoHc1fsNhylAdygmhH4WXKyGIX+Oh+iq1bU0/5Ig5Jh4RVP8dxkiH/kr1I4ZERd2fxHDFq4w4fl6KLnXa7wEZlf6yqb+QmBoQZvxbUenBEDzDqn/dO9Z4//eCBH3imxDFDX0qkVkgtGfA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lhd2SOwK6SeODQGTwX6DUT6/L647Ce6jeN+Ae+vPCk=;
 b=dXq6nKj3+ITSh/GrTEmUukPDqBpf/i/8vyXICLG2zW//iFtQpE83oz0F5bXTLG+qD6b+mrgBa64ADb2e2BSIe1Uk0Hk9conAFu/Adu2yU4RWv7ZOFYHgdXs8ELNkMfUhbZxElt1umw5FencGukq8eCxYz7S4MVm9xNJGNDhmCWjDRlgKwP0wG7gJsvaSIYWD2C6dkq+vK1mAHP1mUStRghmheJlDcWQ1paMhKacbvXk7inIUvOd/OsSjui0HftyDQU1v8CAcEoZcEedQWD1no1V3lDCIK0olUdbf9TdjuaeuMDBgvCv5o39oK6O1g/ZrPJ36NISyJiBtYe5mJ1KGRQ==
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by DU0PR10MB6655.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:401::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 16:43:32 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::9f) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 16:43:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:44:04 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:31 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:23 +0200
Subject: [PATCH v2 7/7] clk: stm32mp25: add ck_ker_usb2phy1_stp clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v2-7-398d348ea8fd@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=2839;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=t2Rju7fXbf06jmvTssNBqtgbndd9pjy/tGMNYuKaQ0A=;
 b=NkOCV3lx4Ldms3ZAizFSAyMFiLkMrI1pJ3QsajVet0OeUwGIWHs2t1rHgEOgwZPI/WhSl0X2e
 r9Z3Ty2dB3jCQ7H3XrZRVSFQCk6vyUSDZ96bXAIjpBGhvwnd53PbDMh
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|DU0PR10MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 736d73a3-506f-4c2c-ee66-08df3124c661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|23010399003|261021123027099003|261022105027099003|261022075727099003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: owGzeKLaL0EDnVW9FBb6xrqvyfTsYEw0wdxbWVAzGhjUXl/iT5oTNtl1KMI5PkdUFmTxQhWX/OuAx0+O63sFji11P9vev/4Sb6UOfl2hXxVoDDiuFW2xz3I1P/gK+fldoRvbnTL4/KIgN5KkLMgSfXUG4Qpb0k+4pXFjUBqEr58IABKOjwKtgFFFSly/Ck1ZkMqp3ifmTaehumiznpUfULRWh+bLr30e392KLEaQHyi6WQ7sLXAvCS5CsON4k/eNeASU0m+Q++EhOzO0oKW/7Dwmq5F/azvATI15/mxEQ5VRMjBm3Ndr4Vxxu+Het/IXCV9IF/lCUKQ4kOOMedTqwith/xJAvTKpks1MSuhlHVMS0DVuKH6XLpvW1y/lDYUG1FiObuqvcUVWA5K6lyJfqxAf49+g8nPJaijLNxSMI0mekqim3Eiyp1j6qu69K+phsC3WOaXgyr4Cowd2yq9/O296jZRmaPQz/Xs9X/Dl9b9YkTWrHaOFppp8bQH5xqAVZy9LOWAQEkL7o5OGiBYxvRbHR8oR6V0baHxjeTXeRE9JkLfjq51K//sgL3whkIWSHnesMscmkTqUMWVfXyYubqQ8rDeFsSkxZjLzqtT5nZkzeRLfFyBBhmc9OUjEBaKK4H31XmwgnkMIbZ1KvCY/fQirMr1hYByy5HduSIwN0kZ7nr1WvBczI+ZgnkZApoju/Vsa2cxxAUV7xr7Hz80FhA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a+NjjbEA3XTxUZG5MsrMVNWjawRk+0/fVa/ErkO4E43z4mujMu326DNBeRGzbfhHMETA5YJt5OrnbRnV8urYiR9NZ9B/BEdI5D0edQLFySdUgU1s7B6Kwh7HRwDtCjNPSalCW6oMmNnbM5+cgRl1gdbKBZZVWaGkFCbKU79xDksy3perVmo34usgQ54J9B32pj8hPTBCjiTvpG0bBzcyKmyGuM2poFJe4g6BnPzKRN9nJntctK8VKNsy+CdeUC3yZtWv2n/rTK6B93Fsw6gYit5UNxaL+bXzLkIEnRzVbmEcRYLR77eW9pDTB/OcipJrebyRDHgplyk9vyNh+jDePE9tAKQHVriGAB7CCIfK37ZOuzfZu4zPvC1mlVGBKAEuMePJoTGD5icBsfpSsPwXE3Hf6CTXtaHYzFjW0/Ohim3KPkdym/GYToPJwJaNKcLO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:32.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736d73a3-506f-4c2c-ee66-08df3124c661
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_094338_668671_BD2B301C 
X-CRM114-Status: GOOD (  12.81  )
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

Add the ck_ker_usb2phy1_stp clock required for USB Host (USBH) low power
support.

Set hse_ker_ck as the parent clock of ck_ker_usb2phy1_stp to ensure it
remains active during the low power modes. As this input clock is optional
in the binding, it must be described in the device tree for the parent to
be effective.

Update the number of clocks of the provider to cover the new ID.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index a6a1293370eb..8bd9eaa42b5d 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -18,7 +18,7 @@
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
-#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
+#define STM32MP25_LAST_CLK	(CK_KER_USB2PHY1STP + 1)
 
 /* Clock security definition */
 #define SECF_NONE		-1
@@ -356,6 +356,7 @@ enum enum_gate_cfg {
 	GATE_USART6,
 	GATE_USBH,
 	GATE_USB2PHY1,
+	GATE_USB2PHY1STP,
 	GATE_USB2PHY2,
 	GATE_USB3DR,
 	GATE_USB3PCIEPHY,
@@ -506,6 +507,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
 	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
 	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
 	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY1STP,	RCC_USB2PHY1CFGR,	4,	0),
 	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
 	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
 	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
@@ -1635,6 +1637,13 @@ static struct clk_stm32_composite ck_ker_usb2phy1 = {
 					    &clk_stm32_composite_ops, 0),
 };
 
+/* Parent clock of ck_ker_usb2phy1_stp is HSE_KER_ON to ensure it remains active during low power */
+static struct clk_stm32_gate ck_ker_usb2phy1_stp = {
+	.gate_id = GATE_USB2PHY1STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usb2phy1_stp", HSE_KER_ON,
+				     &clk_stm32_gate_ops, 0),
+};
+
 /* USB2H */
 static struct clk_stm32_gate ck_icn_m_usb2ehci = {
 	.gate_id = GATE_USBH,
@@ -1993,6 +2002,7 @@ static const struct clock_config stm32mp25_clock_cfg[] = {
 	STM32_COMPOSITE_CFG(CK_KER_ADC12,	ck_ker_adc12,		SEC_RIFSC(58)),
 	STM32_COMPOSITE_CFG(CK_KER_ADC3,	ck_ker_adc3,		SEC_RIFSC(59)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_KER_USB2PHY1STP,	ck_ker_usb2phy1_stp,	SEC_RIFSC(63)),
 	STM32_GATE_CFG(CK_KER_USB2PHY2,		ck_ker_usb2phy2,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SEC_RIFSC(63)),
 	STM32_COMPOSITE_CFG(CK_KER_USB3PCIEPHY,	ck_ker_usb3pciephy,	SEC_RIFSC(67)),

-- 
2.43.0



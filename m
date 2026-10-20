Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jg8XbRH5;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LId3BN2A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=; b=Jg8XbRH5OQXdF1
	/EMp40Ux6KRHv/Aa7k8pK5+cz5Oa2S24sIwK17nK9iKi8x8GDiCeacEmXlj3Ntm7ofRDk7WGivhJe
	F08w2YPZRFvO3Fal31ztOCFdp282tXe+iYez+h04ehntH01mi1loG5m1YZxiumWGvQHGpSnCnZt4h
	yYq/hNZPJdauShXUufZ/RScaTmyXqF5YW5bDq8QnwFv29zatocmEVzHdM25jTSDaO8rMZLARudp6Z
	+c9aBtobx2O981z9FaXRiRhY1HRijeZ0xKgDLjy7MnJGWjEfgmFIrYAuq+7HSvWn8D+37jEVGWI/N
	wqT7os8J7XsTcQ1NY5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fe-00000009BXP-30BH;
	Tue, 20 Oct 2026 08:31:18 +0000
Received: from mail-westeuropeazon11011029.outbound.protection.outlook.com ([52.101.70.29] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fb-00000009BVm-2Hxp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKYzvLCj812TnDEqn8YAwqJFwCNilANQ10WGJHc/lP/oBgf31zW8FBtOn2IeqTJgBmhDn+mR4R4LqF2xi10ngmWLsd2Ufn8ga6mKRi57Xaa/iEQBrOSvUtxPVBzZxZ8DKn6QELkhw2wVugXcL1qWXoWpYUWbn/HVVv783JhnEmFK9DTqapph34V9ZiL7aHwWe1TtL0iwPTDTSb2ab10lDz1NuPLhu2dZ7CvPCKJZvnnuded7nfkHShCZyzzYFD7U9Dgaq37AfANdlfD+2F/5Av9XSi9ZpIBhjY2ekzJa/7DUu+K2O1JDxDDW0+agIZiqz3tH3qK3Y0rnrAhqm9HKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=;
 b=h9XByFlnZEOhyOIgNCMWr0kg1P1s87NxUot73ul4WvKlZWmZUCR0HlrfXp9bwWOPPA1nR0W+volE5Td7bNiEsTHbU9FXR542XDUKOAxfHD7jkiAbiwKFTRJCwRqTC/2Ej3aRK1zXAMRuE71s8ix2W+avV9GyuG6aLqfk9vI6QLOZP/UqmK2/yw8rkRZgTmJjtSJrq7s2XPJfF3GvwlLoMF60bQLlc2y7oJMwcUAVQw9V1WEgLBjheFmdQmP/6S0Ym9HEJS+7oPtjn9GQy8Aqup+xyPDj6cWw6vnzFznPq32yNKJ3KQYmLJAycFdul6UuQGzHZDrXz05MURCgkw0IMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lU08U14aXdgOwI/xI+P2RMBK07w/7d05nIDIjgd8RE=;
 b=LId3BN2AB0RrXsP720KBi3+i5BKpE48FYjLHpNDcFZiq28VKO3WDrXxAaYhnx0VaZaFHfXd/Z98wxUpQTM+Cb4Olev5cT4BaXJPo7Sr9TGWO3qMFwVtN5u4Bym4yQnZNyGyBdN24iqznvwJlFkxI0NvWWW+H5Mp44z1R6HPhTv7vXZIE8sgJF4RMd42cwbs2RNwjwz8sdk0o9/6O+j/9AwjQSDaX6PiM4nes5EB1TP1LIEJUrIFfD+T6DMYusuM0RkFilMkzqMFkiNxK8UijZNmxH1CS0cu7mfIIofLnJ/sLkbWIh8G13DHVBUrPeOsjm1P4h3gnIcC9A8ft9GteSg==
Received: from DU2PR04CA0222.eurprd04.prod.outlook.com (2603:10a6:10:2b1::17)
 by VI1PR10MB3982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:141::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:31:10 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::b) by DU2PR04CA0222.outlook.office365.com
 (2603:10a6:10:2b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:31:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:31:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:38 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:08 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
Date: Tue, 20 Oct 2026 10:31:06 +0200
Message-ID: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMom12oC/x3MTQqAIBBA4avErBOagqSuEiGiYw39iUMRRHdPW
 n6L9x4QSkwCffFAoouFjz0DywLcbPeJFPtsqKu6xQpbdUYxW8TGuHUxElk5h9Z3HoMmDTmLiQL
 f/3IY3/cD1oVWgGIAAAA=
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792485067; l=2056;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=BeJjrsdURT+qVZKvc2tcK3aL0zhGOGjP9XYAwjjNMzE=;
 b=UrP+lJohKx+eVKwHMQwsLw4+xoGe0dT88xrgHDgDzrJuhoh5d5GkhV0qXFc/IYGQSILYD4T7t
 +/LnH2mW1dGDlszlk2t7hC7CsgfySRJJzRpX+zTmwn2N8WcjktDQYt/
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|VI1PR10MB3982:EE_
X-MS-Office365-Filtering-Correlation-Id: 674740dc-4c15-4038-349c-08df2e847e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|7416014|6133799003|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 5sIuMV3fq+miJVuoj0jnjJRcZtOOHw5z/T3q/mffhTxP7CvYnHxXyo2mo/KO9ICNQyDwdX9Hxh+ES+w7h3QzugglnBk3cX//ytUWeZ40RKsOHCMtdMBFaXNvAiR7XdXVbXGPqGc4en1ZyswjVc+9nyxlP3H3zp5NNdcc/ynIbxeYb3e3sPtwLnZldlwjGsXCdpqALNb2n7+gaedTZtpAMUMzBWMWfz4LEKcC8fpFPWh0EcI1mkx8rE1iEWZUaxqO47e99SOQ/bJapQQ2AxHpranSmzzatrMUKO2nsTBevB8sq0j0yvWpBZxojw+cKcekctqvScwQRhcJQBUTt8rqYf6Xsyan2nW5b9LcOH33ovI69CgeFlD1SxHDLbOHo6BIIAI8B1Uy0WFkg5PitfKZWj8/DWxzmxNweme5yz97/mvPEtu1ZLv5/N/9fDv9Qr5E6WxDZztbTBE5dCkyci3kZD8EVKTFRxNNEoHng9Avzu0byXuXbqXr7bvmdzrdxYBxF+FFyAZUp1ua94Kv37LZxSZXf2q9PrVS3gbGl5PhL70f1yHhuY3v5NvP4r41PlsqqmQEqwf+TOHyHseHOgo0wejcE028pMCBotXxF8t+fEs1ulf9uiZz7y9iZZJDQBypOUMlutnuC3BWgKxVxMfTLL8N9O1Xk7Kk9dyf6n5lloxGm/te+70Cxm60XsqlEQOdOIP6knPFYi/q68G3Ozgl9g==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(6133799003)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TZnoaU9PCNMVZ2OlQB3yxVR7emzJTkoOmeq2JbkdPAGEdnfzpAQDZ87ZFXlb6xZdC1a2oZIhplCT3b51AOTuJ7NyWnn44LiJ9pOJAVNVmxUS8UqFq0ffwpqhYcrbXZjII/RwkcBGlWnQ7oCoN3p1DJEJDU4nALLeap5bqXQ5ODkYXEN+hQaBvC25myTq6WI4+va9/y+iYlw2fB08DLV/kT2JGKr7St+C2H0dHNnpLdcAqSkWh1z+5BqF52bVR5N/c2KJUfo2FeZ6y5LG4k5u0KexXirw7aNvv98lfeIQ1WfY9iBk/KdpCw+saXg5waxxJmGDvhheNmQ5yoH8YEsxcUUs1BUZc6bWefNAN84b0c56mRh8d4Iz0DMaIjHTqcJMI9EH/cxRmOsTj8wSNte23Ymv/y4Un1Cmneafzt29qs8Noij8xU55Md04vzSd1Ax
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:10.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674740dc-4c15-4038-349c-08df2e847e6d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013115_936638_4A45B7E9 
X-CRM114-Status: GOOD (  10.49  )
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

The STM32MP13 RCC provides the kernel clocks of the SPI/I2S instances
(SPIx_K) but not their bus interface clocks, whereas the STM32 I2S binding
requires one as its "pclk" clock (the I2S driver gets it with
devm_clk_get(dev, "pclk")). The STM32MP15 RCC already exposes them.

This series adds the missing bus clocks of SPI1 to SPI5 to the STM32MP13
RCC binding and driver. It is split so that every patch builds:

 - patch 1 makes the driver define the number of clocks of its provider
   (STM32MP13_LAST_CLK) instead of taking STM32MP1_LAST_CLK from the
   binding header. That value is not part of the binding ABI and would
   have to change each time an ID is added. This is already how the
   STM32MP21 clock driver does it. No functional change;
 - patch 2 adds the SPI1 to SPI5 bus clock identifiers to the binding
   header and drops the now unused STM32MP1_LAST_CLK;
 - patch 3 registers the corresponding gates in the clock driver and
   extends the number of clocks accordingly.

Each bus clock is a gate on the APB bus clock its peripheral is attached
to (pclk1 for SPI2/3, pclk2 for SPI1, pclk6 for SPI4/5). It shares the RCC
enable bit with the matching SPIx_K kernel clock, and the existing gate
enable counter makes sure the bit is only cleared once both clocks are
off. SPI4 and SPI5 remain subject to the RCC secure configuration, like
their kernel clocks.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (3):
      clk: stm32mp13: define the number of clocks in the driver
      dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus clocks
      clk: stm32mp13: add the SPI1 to SPI5 bus clocks

 drivers/clk/stm32/clk-stm32mp13.c          | 35 +++++++++++++++++++++++++++++-
 include/dt-bindings/clock/stm32mp13-clks.h |  6 ++++-
 2 files changed, 39 insertions(+), 2 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261016-ups_mp13_clk_spi-cc1ad9d1f7e7

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>



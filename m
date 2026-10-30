Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EF9606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=muqs5xFl;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Q7efuQPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=; b=muqs5xFlZua0s0
	v1UCFHGHPlQjm0SVaQpXr4NK0eIEGJS2tzw885hE8/7lWDWFW1+U1y+uAOaG5FpkQQREqbBUzT58d
	EJvbTBwvG2naJIUZ+wiMepWLdG1wBw4VOrGhd7ijDLYDD1TOMnxHmWTBy1pgFVKQK9CQYbfUMBRaq
	QIm4g+qh271jtJkCPYD3WpuPqTo1A8QFKRxew0sX2yIm7VUC7F57MsdR3a4zlPkGfDF+2RlbGGkZf
	msS0i06vf8CMl0p0+Wb4eHAuhMg3Us6/E5+/+KpQw0P9LqTD8kEM/bnHVimI9x9nKm4MOc0L8WOC3
	7FTxZFv+2xg4bAvyfz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmjY-0000000Bl3Y-0AZo;
	Fri, 30 Oct 2026 13:33:28 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmjO-0000000Bl0Z-3mWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL1FUzwLavYrqOIBM3RSCxC6NCkqZNXf/1X2KgmHlLiIaZTSF/+aKL0dPB84yBbKN/HMZcwou0MkunfTqLJ5WZylzx2PkXRRfbNFONQQUYwi8m+2G1kWQ6SsXBw988pnMAVfQRQGkiATB7cu1+pEwSiMWPtzk1IqX51OUe1WUZBzYtWW6+M6RqgmOS5aF0xaaqWBa838maDlamb39JuIvb2arQsFXKRFvyeHiXJJBkXs6eeoGVydz4AvyqBwNf0yfOI1H5C2mJMPFjMAmPqFxCIEy+lSQFrTYyLlYWNBdS52MExOO14BksRyPBPAQGJp5FXIpjsJO65As3SkSm35rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=la/eOB4eZFIgVlTx8By5MBJcQROC0Gm5l2aLgQ91vMjgIDpPaSvXK27OjbGZ78xSkyvRv7cR1I72kh37uA7GCBA9MiH7Sl4c1NqXNNG13s6lEB6fKWyGJLtdJ2AL/eGgMGmvbhTboSSh7rqYc8GzylCuUJ8v6XC5qFrtfZf6/YGo67Nk1ImQMyq0QJmeyGcnCTxGZov6da0UOpE66yDccQ6VVvtuPLxoOSc06k2ReN7IDrl2P7jWNEXUYI6tMCixOpUNVaj5qKb/UzJWAJxyj8tS96ipwW+Giy4Ez2lSzXnQ2ps2l8pM0zjn1Gq76/brhOzw7dl80OLUMq6/S8xZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=Q7efuQPs66dh7fsxkFzVuEdwIAol1ZgWgFnoRMTlaQJyOBFnA1eSIPFfldNX5efgPAujWlMEiqSi4XIwQfzCjwSvU4UArm7v0RdRRdYBeuviXpeZW3X3K0grVIp2i5vLMNOIjuZcaFEQC2n7PcgGRswtDZUSKIc8xVVKuxxIbEMCUutuoBJfIZZx/s/Sw2JXYgX/JNSVT+FWgL8xvaEzKABrPhQn8Oxd1QMnd+eQKI18+UEqCYS+lqElRSXz+Ku272RdmQRimdyg/JoxPrG0FKyZr59pmtdqh1U1mFfIprdbuXpJuRbJ2CJQa982u49wbjvdZdOWFiYzPkFTItslEQ==
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by DB9P195MB2107.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:33:09 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::65) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 13:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:09 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:06 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 30 Oct 2026 14:32:45 +0100
Subject: [PATCH 3/5] dts: imx95-phyflex-libra-rdk: Add overlays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-3-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=2932;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=yyUMmAcS+fsoF4I4KpuQmN3ekfD0a78Q1zK1IHyj3No=;
 b=JvI9HSy+ygqZL1p+BxwGEukXJNzzL0T+y+2tlfeHHuyXZJ3gEmrgyNVkojnX3G2U4MG5+ebGv
 vTUtLV8ZMrMBWuUKuKw+jh+weF/yrvUSWqSnqVypvxbDuyjRs5ZpmnJ
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|DB9P195MB2107:EE_
X-MS-Office365-Filtering-Correlation-Id: 92eb2c57-2c1d-4992-2070-08df368a5694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: YizzbzIfMsvtfIMcKnWlBmnDoT3VL4z3A2j8PNEHmKVao4c7chDMROaUE/inRlaZjBH7yYqzdMEjDq2AxM4Vplz2zA8H3JkWymUYFkNYoa8u1v5SnGuwM6f0LvKCwBsYvCoOoZVlX7hVMroWEOiHjGWNcw81c5bV+wowvpKJ28Ed0jsdkwol1TlqvvyanH05JZuaK6zrPSPuQUmCRnptSf9tbf7dtD2U2V8Yx5g4i7zUnMsWBLAgszHe2PCW6YLa33/g/BCXNxB6+skGWRiwi1F96KnmRo0f2f7zsh053eHUg6XHQF+GXfXDrgqe6qR7vQ+YCvPCrXu3HWyHA5wYdK6pbyHXcPvRp92j42qze5nbMzSk1o4xNfjl8fA8gT/oEucZe7bp9hdUjymeS6KZwD3FDatebHVRHsjHAKveEGtq/dOtKUGb8ssKdOFGR2BIckWtq+xipxgMBZjQNuc1k2sCvOhLIfFNciWNTQL0tOM4IlFlCVvEVvpbpD9QfYLD8b89WBV3vjw4kWiMprqLrQ10kN0cojDpF7Dl/6wUrrlZH55C9GLqDJCptNsv89dJbZu6PzfTSOxNYXExRUDIwUnVa1q6ThjPlpmi3opx0RDeL4dEMvtK2AF4DceC8QpqEboIkcekfYgkeiOrCXtX6Rgm1lbE+UsuvdL1lNWnmaXUy0xQdAYmVvo+tsnZkwx4Uf0qF8Qc+pgINOZL3fj+0g==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6mjsmz6hrOEzqnyaGXOXTAYr32VlefKBNd6y7xXz93Gw/Bnyhq2Lb6epIO4p0+GF85jeNinXQYgDN8ggvnqBIX+Ubl2F01NZXxAgFud397dPxHsEddWBFUQIBCoHgwqQHCccR5i3Y+rxrksoPHo8FcIc4RyH6GWW8HJ9Ehd5cQyU+f9VPYInh/ZuYhAmjuf3MTIIl3KiV/GTcYgnn3HxosAgLJO5RedskxSkn62KIeiA1/vBfUd0byjpa+QNuqbcyyNtYgRenRU2UXV03ZI9RJrp0Cu6W+BNz8KSUndqlz0KV+s95Hp5PJZHWTxud83eMHPWwV5Xp2/S4ynp+4UipxScNhLo/xDMWsDxXHbMZ7uuD++78buvJmwKSfB57kcJ+hLgVkElLAVnzbWxfTHOH9SV3yzXnSSCIsqgAOrJuVFP4pNuXzMfOyNoavwBC2rP
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:09.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92eb2c57-2c1d-4992-2070-08df368a5694
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_063318_949859_861668E8 
X-CRM114-Status: GOOD (  12.09  )
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

Add overlays for SoM temperature sensors and M.2 Key-E WIFI/BT cards
that need the nxp,88w8987-bt compatible in devicetree (tested on
IW611/IW612).

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  9 ++++++++
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 +++++++++++++++++++++
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso | 24 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4eb7508193e7..17b357f4886a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -739,7 +739,16 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
+imx95-phyflex-fpsc-g-som-temperature-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-fpsc-g-som-temperature.dtbo
+imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
new file mode 100644
index 000000000000..84afe1ff9f06
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dram_sense {
+	status = "okay";
+};
+
+&emmc_sense {
+	status = "okay";
+};
+
+&ethphy_sense {
+	status = "okay";
+};
+
+&pmic_sense {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
new file mode 100644
index 000000000000..1601e04b3940
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&lpuart8 {
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <115200>;
+	};
+};
+
+&gpio_expander1 {
+	uart1_bt_rs_sel: bt-rs-hog {
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		gpio-hog;
+		line-name = "UART1_BT_RS_SEL";
+		output-high;
+	};
+};

-- 
2.53.0



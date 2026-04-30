Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D858FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sVSNbjY/oNcejXLQ3GISldfbsuVHiXais2UP3zTn60U=; b=KeEyGqBYOFJDS8gSvxbgEA7X1s
	VCfEn12VFwAIXfIXhEtfvvAWUMHsc9UsKG+0+QINj8WlkQ9zDub+YVmGyGzuuwy7rCHuzszXZMDzJ
	a8yf3cfjilHegEo/EJEI7LSxzikeXiw/LPh5Iq8g/EbhlciDkqea7ss0c+gxriiWy4hC7jCBT6+rU
	0iPns8IfS20wJ/+BmFpgvjs0mzB3oLNvCy7GMhO41S9nbzIlf/vHSCaQd1HzVAOjIGr/Kdcmh3SnA
	JSZehNdErlhu65ZF9GPsHFxJzAWZ/atD2p5xfnppyiqEKgaWvXWXcXp2uj2s8N/824wXTBdv7KtpE
	0ugR0BYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR1P-00000005VHG-3GGg;
	Thu, 30 Apr 2026 13:01:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR1O-00000005VH7-1Kjo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 13:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=sVSNbjY/oNcejXLQ3GISldfbsuVHiXais2UP3zTn60U=; b=i2UKOMSg/nSdt7gsrcapgkRllE
	dMg7ldhhT1rxp9REUeJSVmgiEQEoj0mDSkBRUmhgM5TmP73TOhboX3V462xHGBSXc1JHo6EODwJH3
	xvyw9RJnMbRGfiWd0a5I18gX8EBBJx7iRnx8ETR1ujJB1GrkYYFCM1ZfW9Va8zI3zMOIw15JXVVMb
	0Xk9ep36BDuz9ZA98sM6zePJvn+CvmAeXR9T1vFDm4OrNTYGA4iFAnaf5rTnrZAL96bnLQ45PU1iK
	Myc71grBtpx8jPUhf4aUYgyWaB1cv3yPtTm35WX4TuSwYT24fSqYq/XeDRmyRwLndfKnuHiZBICYq
	AfgOe7Zg==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR1J-00000007P8N-18iw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Suzo07fLt2wViSHzw130BXC3+Htu8HRPGZMcZatc+wpEklTN0pp8c+z8ndfkLHvz6S1l93ylPEQIaKV8yk2od+VS8zAVRWQbJ4XDsNwpKe2PBIUrz+mBtmGDTO+YIQ7+RJxhkYPVSMjVKs/L7wue3qcdCxqj5xKXEBHBQwaBe8rfEg/3XIDbvrdmE5O/f/bwyqhCygVu31j3GZ6qzKHE8326fx7E1C8FgMtZleUAc6eN4n/Jqdm3/x/yDQjbl2ZF07wEaadNXHZIuXSjins4IjkxoOGyh88R4MDE4yt/3yNUMe6ZmnGn8OMvid8PvwUt+5GFaY6XArQRcXRc5f/tIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVSNbjY/oNcejXLQ3GISldfbsuVHiXais2UP3zTn60U=;
 b=Kb3uIjlYSNOYWY/kru5FALbt0WoYhY6TAkR2rpnjNCwl7UGRIP4xWCX9kkOdU4DbsVJ+psGjctfOu6mMbxZAT3jxtWo+KmdSZvR7oHBfh/AToA5AstECyFKzCwnPh9eWwggnkFRmZHwT7+5TeURGift7v//WJeBykPRMuF1WmQJjgWCGW466A+y+xTynEem6w3DlRBGxwhnpEqTCviUuvPrgPx4GOKAkWnjMbyaiqg4z4IPDEj9suL3v4EZd4wDPMJFt26aZU2CuCxGCtHybZecR1PH8/wAIBqif1NdjfENTmOAzvff7WHZCfn7WSBmouALgPdBD7xjQjg03d9EgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVSNbjY/oNcejXLQ3GISldfbsuVHiXais2UP3zTn60U=;
 b=TL73Hhm31M4SufW9xrnKQiAZSH1/6en8oxAs4bAT64bP6FXyzECOPKM/XCOUqIcM29dy0psBpIkVCKJVgLpZacdg1koyRXX9swydSpDynlXcwmcRA/bhT3qG8hMXAG8ab1p2RL1NdvirSt4KCh1jhr2IKCQmCqiJDQjFWco8oKEB45eV6iouKju6m1KffLuqcsdrVFLWi/CIV43vEc0/kMWJ6sEOCfVF+H8EpdfZUbQ5UaOIGusmkAq0x24k/PDsaLIfPJT9Mu+5D/9PGWQInBwhFkfwd8ReQMqliMVnaDIlksgkXb/kscoYq9fXsWLw7BtByP4wSR5ei7olHfdckg==
Received: from DUZPR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::28) by DB4P195MB2693.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:5e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 13:01:24 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::f3) by DUZPR01CA0133.outlook.office365.com
 (2603:10a6:10:4bc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 13:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Thu, 30 Apr 2026 13:01:23 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Apr
 2026 15:01:22 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v3] arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD185-101CT panel
Date: Thu, 30 Apr 2026 15:01:15 +0200
Message-ID: <20260430130115.2380887-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DB4P195MB2693:EE_
X-MS-Office365-Filtering-Correlation-Id: a53107c0-4c10-48d6-8d57-08dea6b894ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: N9eXmzlNy2LOykzayBeSZRX+vPWE9Arv5FXo9Z5B4bmMGq0wTaU5jX0IGlvDvP4KQnYmT5On+bT6MsLBXk4uz2OiQ/wGLDYljrFlDQ67DOpoRfUgtwptsXuNOClayPr/ZWQnlODYBAIQ9ufzpQUFn1JZmVAdzpRZKAcXb6mbfNh1MqRi4FZF6FzzeLiEXnJ6tmQlmDmp3COgUXrXSXTtEqhZoQl+GVK54qankJqKKmGiX7PIj3IYP43kfx6Lx5+9NBsDIEnSzWADnvWEPvVJ+FEVvb8rrWJnqOLUg/X8sj/ER/zHTEc6clmQPgRaOoxepcHPYmnyH2vP+9kGSZr5fAY2ebT5bAYFhTnppD6wyac+gdd7lJt4hDZ/QXr8M0rU6X453ILVvKECywckDw33sXX1Fda8MTakOqP518elDizwU9wWUQ0lSwylDfjjvSCTVEdm3cCV8VwOW9CS6MyT/F2OhiIruWNxLdpJKeLLF3v/zHR0QrkrqJ7/Zewoy6YKTPo2Kq0aKPRChrd4GX2eHZsDDlUuw/8hg05vG5wYbePHurvyv1kn216siAoiwfr88bu6FNQNANnIxxWokGlA5d6wVk7pzV5CT8GeUCNmGIZ/XiNCg5wzBcXnSPwXbW8eGhMRPw3VIuylmPS+35oo8QOjjzfvo5c6orG00TxsexHkxZDSTGpzOJEFn6QHKUXTz/q0oJ58glh4zkmKaO7sOMF6tmuGra3ZVuH7qkdtrI4=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U6KUiBl1D/pfbC8UQlQPCXpbctKFCNvu+z+yIOw2CBG9xP0vh35qHEmanYoGkXqeAItSh6gpLHnphYT8l9f8eNK0FoMKNEEDwao9aEUs8ANdL3FMQnMq5zOkyqg1m93ucFLbUC98OHrWMth1yrJqaUYgew6JciQkLILwaWvZ0C52aGVt5OGFI43u/j+lKdKCRPMbrFmHpzwOsY3mZBow5gfp7QEekCv7fL5dL6KD7T+Hz2kcXoUdm5ii7gmBgYx+O9Ap90DIPnGGxApbNw3aE+Tbfu+i2Vpz01tbr12OdKn/kXa0yHvXw74eiNJbhBWPb3bMO/UpJvJqVtSvdT0vkqeHkeo4FFWOsYMd5tJXsit55se50gTU71EVcNIGsiRUWxrKd1P9PbVyazBu3U6DTeGcIkp9EA9wkvAZjT3AxIITtlomxfGgXlvM8YeK21Ge
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 13:01:23.2978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a53107c0-4c10-48d6-8d57-08dea6b894ca
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB2693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_140133_511267_42715FF2 
X-CRM114-Status: GOOD (  14.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The panel is a Lincoln Technology Solutions LCD185-101CT [0]. It is
a dual-link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an I2C based touch controller: Goodix-GT928.

Add an device tree overlay to support the Lincoln LCD185-101CT panel
in combination with the phyBOARD-Lyra-AM62x.

[0] https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
I somehow managed to send out 2 v2s. And the last one came from an
internal tree which was tested on older Kernel. Sorry for that.

v1: https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1065767.html
v2: https://lkml.org/lkml/2025/9/25/644 / https://www.spinics.net/lists/kernel/msg6075571.html
v3:
  - Fixed all schema warnings
  - Updated properties order in nodes
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso | 185 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 5269c9619b65..6aaa4a2a7561 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-phyboard-lyra-gpio-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62-phyboard-lyra-oldi-lcd185.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am6254atl-sk.dtb
 
@@ -183,6 +184,8 @@ k3-am625-phyboard-lyra-disable-spi-nor-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-spi-nor.dtbo
 k3-am625-phyboard-lyra-gpio-fan-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am62x-phyboard-lyra-gpio-fan.dtbo
+k3-am625-phyboard-lyra-oldi-lcd185-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
+	k3-am62-phyboard-lyra-oldi-lcd185.dtbo
 k3-am625-phyboard-lyra-qspi-nor-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-qspi-nor.dtbo
 k3-am625-sk-csi2-imx219-dtbs := k3-am625-sk.dtb \
@@ -287,6 +290,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-phyboard-lyra-disable-rtc.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
 	k3-am625-phyboard-lyra-gpio-fan.dtb \
+	k3-am625-phyboard-lyra-oldi-lcd185.dtb \
 	k3-am625-phyboard-lyra-qspi-nor.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso b/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso
new file mode 100644
index 000000000000..ec1187d3b845
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2022-2026 PHYTEC Messtechnik GmbH
+ * Author: Wadim Egorov <w.egorov@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	display {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+		power-supply = <&vdd_usb_5v0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&gpio_exp 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bl_pwm_pins_default>;
+		pwms = <&epwm0 1 50000 0>;
+	};
+
+	vdd_usb_5v0: regulator-vdd-usb5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-usb5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&dss {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_oldi0_pins_default &main_dss0_pins_default>;
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* VP1: Output to OLDI */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpi0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi_0_in>;
+		};
+
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&epwm0 {
+	status = "okay";
+};
+
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_screen_pins_default>;
+
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
+		irq-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&main_pmx0 {
+	bl_pwm_pins_default: bl-pwm-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b8, PIN_INPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+
+	touch_screen_pins_default: touch-screen-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x048, PIN_OUTPUT, 7) /* (N25) GPMC0_AD3.GPIO0_18 - RST */
+			AM62X_IOPAD(0x04c, PIN_INPUT, 7) /* (P24) GPMC0_AD4.GPIO0_19 - INT */
+		>;
+	};
+
+	main_oldi0_pins_default: main-oldi0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0260, PIN_OUTPUT, 0) /* (AA5) OLDI0_A0N */
+			AM62X_IOPAD(0x025c, PIN_OUTPUT, 0) /* (Y6) OLDI0_A0P */
+			AM62X_IOPAD(0x0268, PIN_OUTPUT, 0) /* (AD3) OLDI0_A1N */
+			AM62X_IOPAD(0x0264, PIN_OUTPUT, 0) /* (AB4) OLDI0_A1P */
+			AM62X_IOPAD(0x0270, PIN_OUTPUT, 0) /* (Y8) OLDI0_A2N */
+			AM62X_IOPAD(0x026c, PIN_OUTPUT, 0) /* (AA8) OLDI0_A2P */
+			AM62X_IOPAD(0x0278, PIN_OUTPUT, 0) /* (AB6) OLDI0_A3N */
+			AM62X_IOPAD(0x0274, PIN_OUTPUT, 0) /* (AA7) OLDI0_A3P */
+			AM62X_IOPAD(0x0280, PIN_OUTPUT, 0) /* (AC6) OLDI0_A4N */
+			AM62X_IOPAD(0x027c, PIN_OUTPUT, 0) /* (AC5) OLDI0_A4P */
+			AM62X_IOPAD(0x0288, PIN_OUTPUT, 0) /* (AE5) OLDI0_A5N */
+			AM62X_IOPAD(0x0284, PIN_OUTPUT, 0) /* (AD6) OLDI0_A5P */
+			AM62X_IOPAD(0x0290, PIN_OUTPUT, 0) /* (AE6) OLDI0_A6N */
+			AM62X_IOPAD(0x028c, PIN_OUTPUT, 0) /* (AD7) OLDI0_A6P */
+			AM62X_IOPAD(0x0298, PIN_OUTPUT, 0) /* (AD8) OLDI0_A7N */
+			AM62X_IOPAD(0x0294, PIN_OUTPUT, 0) /* (AE7) OLDI0_A7P */
+			AM62X_IOPAD(0x02a0, PIN_OUTPUT, 0) /* (AD4) OLDI0_CLK0N */
+			AM62X_IOPAD(0x029c, PIN_OUTPUT, 0) /* (AE3) OLDI0_CLK0P */
+			AM62X_IOPAD(0x02a8, PIN_OUTPUT, 0) /* (AE4) OLDI0_CLK1N */
+			AM62X_IOPAD(0x02a4, PIN_OUTPUT, 0) /* (AD5) OLDI0_CLK1P */
+		>;
+	};
+};
+
+&oldi0 {
+	ti,companion-oldi = <&oldi1>;
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi_0_in: endpoint {
+		remote-endpoint = <&dpi0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi_0_out: endpoint {
+		remote-endpoint = <&lcd_in0>;
+	};
+};
+
+&oldi1 {
+	ti,secondary-oldi;
+	status = "okay";
+};
+
+&oldi1_port0 {
+	oldi_1_in: endpoint {
+		remote-endpoint = <&dpi0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi_1_out: endpoint {
+		remote-endpoint = <&lcd_in1>;
+	};
+};
-- 
2.43.0



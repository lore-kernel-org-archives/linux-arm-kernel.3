Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D83ECEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuvqirSUAkdQlFF2TKK6phUPh/Zi4mI9bnhvB2tTOaQ=; b=dJZBKM9t1bcA7H97t7SDyi/YHK
	P9PwasgfSVEMjikpWBy2k/gvmdenNpamQgONhtyAplIv2HGGVwaiNebmyvffN3TXXKJDjLT+1+f9J
	SUbhqwk2ERRrkJ2LAq4fyYOynABxTi7Lgiu+ToyFSfi5YYSW337KlJNlNT6K0D4NAv83z+rwvq/w0
	IBdy+gfPLcz1BoEb1PS4NHL+J/zVhWJLPCaeL2JNBstgeXDtx9fSm2s7yRkBQvo+YAeCGZuXzYvrX
	0d76eCfg2jj/NONHWuxetc7QidEZLkJDdZsZ+oy9rCd8QHdvC6mMUptdRWF0cyTwOo68AXz/6MkRq
	N5FhiZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0k4-0000000GIPx-2cCN;
	Mon, 17 Nov 2025 15:02:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0jx-0000000GILt-20qV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 767CF445D9;
	Mon, 17 Nov 2025 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6A65C19421;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763391720;
	bh=dishnhpIyUVX5yQhYLxxB6xJnZbh2r8lNrUrD3rpT2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FwT0gST0r5tLhoUfYRRmriojOOq+mzUBeYLNvnQS2Wuft2m7Fo0BONv9f9FhpH0Tu
	 /cFbcQSf2b+AoLCsp04U5+pEhOEdwcShzrDJ61pY7MwElu4fGw5WO+JNu4pIkH4hPz
	 GC6hWkEgBWc7vgJeXjjzffhOYDDpTbAlg+kVQ84ylQVo2+7MA7mthciC5zhme6G0WN
	 eFJmonvl/Ap9i7qKz3gCWfIryLU75dhOpYqnakGtUosXemYxQZHudxAocl13OUhS0J
	 VRi1m/6PlybPCDZyfiDzWHqRs/an8awNToLy6XGEmBh+zTfOoaOpgids+kGk/ePkc8
	 2m07+wkDkADYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8A0CEBF93;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 17 Nov 2025 16:01:28 +0100
Subject: [PATCH v4 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-mini_iv-v4-3-5aa63832f51a@gocontroll.com>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
In-Reply-To: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763391718; l=14104;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=mjriSpZmgbu/UaYCwVsIhhGQ6OxMDu5TRDcX+N5z58k=;
 b=MUsrKUehYKAgFc/1WyiJlKn5vigxJ9uiHgLjvxWqJtCOo2ZjjfHJ7CYliO8XllIox/drYcV6w
 j0K6Qfb0ZJ4Dm092bvvfDGEALK7K0js8M/bpojvFamKrVGGtGByxLaE
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_070201_577060_58FB5D2D 
X-CRM114-Status: GOOD (  12.31  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
1 GB of ram and 4 GB of eMMC storage on board.

Add it to enable boards based on this module

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 +++++++++++++++++++++
 1 file changed, 444 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
new file mode 100644
index 000000000000..44d863c8d930
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 Lothar Waßmann <LW@KARO-electronics.de>
+ * 2025 Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "Ka-Ro Electronics TX8M-1610";
+	compatible = "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
+
+	reg_3v3_etn: regulator-3v3-etn {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3v3-etn";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_1 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_2 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_3 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+	};
+};
+
+&fec1 {
+	assigned-clocks = <&clk IMX8MM_CLK_ENET_AXI>,
+			  <&clk IMX8MM_CLK_ENET_TIMER>,
+			  <&clk IMX8MM_CLK_ENET_REF>,
+			  <&clk IMX8MM_CLK_ENET_REF>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+				 <&clk IMX8MM_SYS_PLL2_100M>,
+				 <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>, <50000000>;
+	clocks = <&clk IMX8MM_CLK_ENET1_ROOT>,
+		 <&clk IMX8MM_CLK_ENET1_ROOT>,
+		 <&clk IMX8MM_CLK_ENET_TIMER>,
+		 <&clk IMX8MM_CLK_ENET_REF>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	phy-reset-duration = <25>;
+	phy-reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	phy-reset-post-delay = <1>;
+	phy-supply = <&reg_3v3_etn>;
+	pinctrl-0 = <&pinctrl_fec1>, <&pinctrl_ethphy_rst>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			clocks = <&clk IMX8MM_CLK_ENET_REF>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <28 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-0 = <&pinctrl_ethphy_int>;
+			pinctrl-names = "default";
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_152", "SODIMM_42", "SODIMM_153", "PMIC_IRQ_B",
+			  "SODIMM_154", "SODIMM_155", "SODIMM_156", "SODIMM_157",
+			  "SODIMM_158", "SODIMM_159", "SODIMM_161", "SODIMM_162",
+			  "SODIMM_34", "SODIMM_36", "SODIMM_27", "SODIMM_28",
+			  "", "", "", "",
+			  "", "", "", "ENET_POWER",
+			  "", "", "", "",
+			  "ENET_nINT", "ENET_nRST", "", "";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "SODIMM_51", "SODIMM_57", "SODIMM_56", "SODIMM_52",
+			  "SODIMM_53", "SODIMM_54", "SODIMM_55", "SODIMM_15",
+			  "SODIMM_45", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_103", "SODIMM_104", "SODIMM_105", "SODIMM_106",
+			  "SODIMM_107", "SODIMM_112", "SODIMM_108", "SODIMM_109",
+			  "SODIMM_95", "SODIMM_110", "SODIMM_96", "SODIMM_97",
+			  "SODIMM_98", "SODIMM_99", "SODIMM_113", "SODIMM_114",
+			  "SODIMM_115", "SODIMM_101", "SODIMM_100", "SODIMM_77",
+			  "SODIMM_72", "SODIMM_73", "SODIMM_74", "SODIMM_75",
+			  "SODIMM_76", "SODIMM_43", "", "",
+			  "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_178", "SODIMM_180", "SODIMM_184", "SODIMM_185",
+			  "SODIMM_186", "SODIMM_187", "SODIMM_188", "SODIMM_189",
+			  "SODIMM_190", "SODIMM_191", "SODIMM_179", "SODIMM_181",
+			  "SODIMM_192", "SODIMM_193", "SODIMM_194", "SODIMM_195",
+			  "SODIMM_196", "SODIMM_197", "SODIMM_198", "SODIMM_199",
+			  "SODIMM_182", "SODIMM_79", "SODIMM_78", "SODIMM_84",
+			  "SODIMM_87", "SODIMM_86", "SODIMM_85", "SODIMM_83",
+			  "SODIMM_81", "SODIMM_80", "SODIMM_90", "SODIMM_93";
+};
+
+&gpio5 {
+	gpio-line-names = "SODIMM_92", "SODIMM_91", "SODIMM_89", "SODIMM_144",
+			  "SODIMM_143", "SODIMM_146", "SODIMM_68", "SODIMM_67",
+			  "SODIMM_70", "SODIMM_69", "SODIMM_48", "SODIMM_46",
+			  "SODIMM_47", "SODIMM_44", "PMIC_SCL", "PMIC_SDA",
+			  "SODIMM_41", "SODIMM_40", "SODIMM_148", "SODIMM_149",
+			  "SODIMM_150", "SODIMM_151", "SODIMM_60", "SODIMM_59",
+			  "SODIMM_64", "SODIMM_63", "SODIMM_62", "SODIMM_61",
+			  "SODIMM_66", "SODIMM_65", "", "";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic: pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		pinctrl-names = "default";
+		rohm,reset-snvs-powered;
+
+		regulators {
+			BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <780000>;
+				regulator-name = "buck1";
+				regulator-ramp-delay = <1250>;
+			};
+
+			reg_vdd_arm: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <805000>;
+				regulator-name = "buck2";
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <950000>;
+				rohm,dvs-idle-voltage = <810000>;
+			};
+
+			BUCK3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <805000>;
+				regulator-name = "buck3";
+			};
+
+			reg_vdd_3v3: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "buck4";
+			};
+
+			reg_vdd_1v8: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1950000>;
+				regulator-min-microvolt = <1700000>;
+				regulator-name = "buck5";
+			};
+
+			BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <(1350000 + 100000)>;
+				regulator-min-microvolt = <(1350000 - 67000)>;
+				regulator-name = "buck6";
+				rohm,fb-pull-up-microvolt = <0>;
+				rohm,feedback-pull-up-r1-ohms = <2200>;
+				rohm,feedback-pull-up-r2-ohms = <499>;
+			};
+
+			LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1980000>;
+				regulator-min-microvolt = <1620000>;
+				regulator-name = "ldo1";
+			};
+
+			LDO2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <760000>;
+				regulator-name = "ldo2";
+			};
+
+			LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1890000>;
+				regulator-min-microvolt = <1710000>;
+				regulator-name = "ldo3";
+			};
+
+			LDO4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <855000>;
+				regulator-name = "ldo4";
+			};
+
+			LDO5 {
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "ldo5";
+			};
+
+			LDO6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1260000>;
+				regulator-min-microvolt = <1140000>;
+				regulator-name = "ldo6";
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_ethphy_int: etnphy-intgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_RD2_GPIO1_IO28
+				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
+		>;
+	};
+
+	pinctrl_ethphy_rst: etnphy-rstgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_RD3_GPIO1_IO29
+				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC
+				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO
+				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_ENET_TD2_ENET1_TX_CLK
+				(MX8MM_FSEL_FAST | MX8MM_SION)
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0
+				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1
+				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT)
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RX_ER
+				MX8MM_FSEL_FAST
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL
+				MX8MM_FSEL_FAST
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST)
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL
+				MX8MM_I2C_DEFAULT
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA
+				MX8MM_I2C_DEFAULT
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14
+				MX8MM_I2C_DEFAULT
+			MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15
+				MX8MM_I2C_DEFAULT
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3
+				(MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_TXC_GPIO1_IO23
+				(MX8MM_DSE_X4 | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
+				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
+				MX8MM_USDHC_DATA_DEFAULT
+			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
+				(MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
+				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
+				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
+				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA4_USDHC1_DATA4
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA5_USDHC1_DATA5
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA6_USDHC1_DATA6
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_DATA7_USDHC1_DATA7
+				(MX8MM_DSE_X6 | MX8MM_USDHC_DATA_DEFAULT)
+			MX8MM_IOMUXC_SD1_STROBE_USDHC1_STROBE
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+			MX8MM_IOMUXC_SD1_RESET_B_USDHC1_RESET_B
+				(MX8MM_DSE_X6 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
+		>;
+	};
+};
+
+&usdhc1 {
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC1>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	status = "okay";
+};

-- 
2.51.2




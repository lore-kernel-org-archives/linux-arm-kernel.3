Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDA3C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QSNI5jKSukDlBY44zrqT/o1KHjcyL6XC2Fc65csZBo=; b=e0hzQQ3s/ucYeAYPUtiB6VKPUh
	gokMAY5UCsmkqdV+DEC5F4tVNdQQLBRObLLBOKuOhCOXiqlTy2ezOxr/RiSlg5DScK5Rx6i41Q9NB
	4v/LrAlIn/82/7/Eez4K+f0bL5P+5P1SSmy+jwyWGeOYGO01kl16odCTyAoQtOG4IW7loFoaiiw1F
	gTRiKS4BDZKY+gN3FdIjElCnorM2T1j+++BxxK+CmyBg7ifBXpRO3Ax4cIImkff4jTwBcejwM5Zzw
	Bef3nr7ayvOLmPW7bnhls3IwMVi0ecIW2lP76ud7K+UjCI0ExLNnukL4RVJuHnAKlbmACnJVWQKLN
	c5RUh7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsL8-00000005LVA-0CLp;
	Wed, 02 Apr 2025 07:16:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC3-00000005JUO-1cum
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 124D0444D1;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4693DC4CEF5;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=4VAMU7Rh2uZKjDsyyiT8uWm7iUw0IOUprajDQ1stiSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V2ofK+Hc62gcdKuOiFAkEW/P9YKEIy8M09xr9JWeWYOE+/FHnlywNBXCOIqXyyz53
	 BikcchlaU3dw5rcA9Svign0l1wftlopTmIJYTTajnfNb1ohzzpzzs7zJlUKp7c361h
	 5kXNEDTNyHuuXsh38OBDkTVNSot7drZ00WyL0Z56m76ydtFbMLS5l2vC5fsQX7HTqP
	 uDJ784Pccj/ouy+vb4rKNat9e9v8h9Ea4myHn57NDN1h59qLPq9FGywSd5w6APc+TG
	 PbjHIvdY9FSGiXyFvTmLAPAgOds4yMPFg6/dzns0Ru1F66UOmCkBuwA7w511m4t/VP
	 ae7OGEfT4n3Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6B0C3601B;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:08 +0200
Subject: [PATCH v4 5/9] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-initial_display-v4-5-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=14458;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=cudiU7hAsaHOs8GIobDSXSg1ULYWxsZRdNKy6EyKiNE=;
 b=ZVtJStCtn7CqUKjFAsjWDaUjckRNbbCFbNySmkcn39lfWWxzv38KOinGIFA/2TtvsyVZC6zvD
 vQLoydGhheMDhakmf3zbj3BG0xJds33jPVCjxy4WTqaB/CVXbegbxvx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000723_726383_AD0966A8 
X-CRM114-Status: GOOD (  12.00  )
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

The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
2 GB or ram and 8 GB of eMMC storage on board.

Add it to enable boards based on this Module

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
 1 file changed, 548 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..9c69228a2cd28ce767fa4054d10b19a196668ea2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 Lothar Waßmann <LW@KARO-electronics.de>
+ * 2025 Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	/* PHY regulator */
+	regulator-3v3-etn {
+		compatible = "regulator-fixed";
+		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3v3-etn";
+		vin-supply = <&reg_vdd_3v3>;
+		enable-active-high;
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
+&eqos {
+	assigned-clocks = <&clk IMX8MP_CLK_ENET_AXI>,
+			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,
+			  <&clk IMX8MP_CLK_ENET_QOS>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = <&pinctrl_ethphy_rst_b>;
+		pinctrl-names = "default";
+		reset-delay-us = <25000>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
+			pinctrl-0 = <&pinctrl_ethphy_int_b>;
+			pinctrl-names = "default";
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_152",
+		"SODIMM_42",
+		"PMIC_WDOG_B SODIMM_153",
+		"PMIC_IRQ_B",
+		"SODIMM_154",
+		"SODIMM_155",
+		"SODIMM_156",
+		"SODIMM_157",
+		"SODIMM_158",
+		"SODIMM_159",
+		"SODIMM_161",
+		"SODIMM_162",
+		"SODIMM_34",
+		"SODIMM_36",
+		"SODIMM_27",
+		"SODIMM_28",
+		"ENET_MDC",
+		"ENET_MDIO",
+		"",
+		"ENET_XTAL1/CLKIN",
+		"ENET_TXD1",
+		"ENET_TXD0",
+		"ENET_TXEN",
+		"ENET_POWER",
+		"ENET_COL/CRS_DV",
+		"ENET_RXER",
+		"ENET_RXD0",
+		"ENET_RXD1",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names = "",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"SODIMM_51",
+		"SODIMM_57",
+		"SODIMM_56",
+		"SODIMM_52",
+		"SODIMM_53",
+		"SODIMM_54",
+		"SODIMM_55",
+		"SODIMM_15",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio3 {
+	gpio-line-names = "",
+		"",
+		"EMMC_DS",
+		"EMMC_DAT5",
+		"EMMC_DAT6",
+		"EMMC_DAT7",
+		"",
+		"",
+		"",
+		"",
+		"EMMC_DAT0",
+		"EMMC_DAT1",
+		"EMMC_DAT2",
+		"EMMC_DAT3",
+		"",
+		"EMMC_DAT4",
+		"",
+		"EMMC_CLK",
+		"EMMC_CMD",
+		"SODIMM_75",
+		"SODIMM_145",
+		"SODIMM_163",
+		"SODIMM_164",
+		"SODIMM_165",
+		"SODIMM_143",
+		"SODIMM_144",
+		"SODIMM_72",
+		"SODIMM_73",
+		"SODIMM_74",
+		"SODIMM_93",
+		"",
+		"";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_98",
+		"SODIMM_99",
+		"SODIMM_100",
+		"SODIMM_101",
+		"SODIMM_45",
+		"SODIMM_43",
+		"SODIMM_105",
+		"SODIMM_106",
+		"SODIMM_107",
+		"SODIMM_108",
+		"SODIMM_104",
+		"SODIMM_103",
+		"SODIMM_115",
+		"SODIMM_114",
+		"SODIMM_113",
+		"SODIMM_112",
+		"SODIMM_109",
+		"SODIMM_110",
+		"SODIMM_95",
+		"SODIMM_96",
+		"SODIMM_97",
+		"ENET_nINT",
+		"ENET_nRST",
+		"SODIMM_84",
+		"SODIMM_87",
+		"SODIMM_86",
+		"SODIMM_85",
+		"SODIMM_83",
+		"",
+		"SODIMM_66",
+		"SODIMM_65",
+		"";
+};
+
+&gpio5 {
+	gpio-line-names = "",
+		"",
+		"",
+		"SODIMM_76",
+		"SODIMM_81",
+		"SODIMM_146",
+		"SODIMM_48",
+		"SODIMM_46",
+		"SODIMM_47",
+		"SODIMM_44",
+		"SODIMM_49",
+		"",
+		"SODIMM_70",
+		"SODIMM_69",
+		"PMIC_SCL",
+		"PMIC_SDA",
+		"SODIMM_41",
+		"SODIMM_40",
+		"SODIMM_148",
+		"SODIMM_149",
+		"SODIMM_150",
+		"SODIMM_151",
+		"SODIMM_60",
+		"SODIMM_59",
+		"SODIMM_64",
+		"SODIMM_63",
+		"SODIMM_62",
+		"SODIMM_61",
+		"SODIMM_68",
+		"SODIMM_67",
+		"",
+		"";
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
+	pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		pinctrl-names = "default";
+
+		regulators {
+			reg_vdd_soc: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <805000>;
+				regulator-name = "vdd-soc";
+				regulator-ramp-delay = <3125>;
+			};
+
+			reg_vdd_arm: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <805000>;
+				regulator-name = "vdd-core";
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			reg_vdd_3v3: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "3v3";
+			};
+
+			reg_nvcc_nand: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "nvcc-nand";
+			};
+
+			reg_nvcc_dram: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1100000>;
+				regulator-min-microvolt = <1100000>;
+				regulator-name = "nvcc-dram";
+			};
+
+			reg_snvs_1v8: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "snvs-1v8";
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-always-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO2";
+			};
+
+			reg_vdda_1v8: LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vdda-1v8";
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO4";
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "LDO5";
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER
+			(MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleep-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_ethphy_int_b: ethphy-int-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
+		>;
+	};
+
+	pinctrl_ethphy_rst_b: ethphy-rst-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
+			MX8MP_I2C_DEFAULT
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
+			MX8MP_I2C_DEFAULT
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
+			MX8MP_I2C_DEFAULT
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
+			MX8MP_I2C_DEFAULT
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
+			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			MX8MP_USDHC_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <200000000>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_vdd_3v3>;
+	voltage-ranges = <3300 3300>;
+	vqmmc-supply = <&reg_nvcc_nand>;
+	status = "okay";
+};

-- 
2.49.0




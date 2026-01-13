Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70522D2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz/Ll9ghwmV1mMLr5f94o6CVbG9aX9BQ9L7ebvVm/xs=; b=i5Lbb77beIsu8bA1QFcuQ7sapW
	XNUED85e3fTPR7UG0kSryvHmQO5e9cSM0aUay/5CvbT9MvTRhimDJFPiHAg4Jpzjhg7Mwkw5TyrcR
	5/jsb/D4UamWORpyxjyuJFQ7/3qQ0iX9FVCBXIBND98gRVxY6uKGZKmNuaJz/KCRZTKP2R7Susqht
	eMnnSaf8gzlI3IUemnYcZHsh7gSVfvaowtBvGx/XwHvx6qn0K54MRft8Ri7L+3CO1ubVz3LYvwsdN
	N1f8Y/2KUqm/aPLe5QH6Xt7JFYuJ2nU3lkdg55VGOq51zCRUZkCF+/zQQ6wYJxivKFE3he8YzzWVa
	VRo1Vnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOg-00000007OCW-1uKI;
	Tue, 13 Jan 2026 15:33:30 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOb-00000007O9q-1Dyj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Qz/Ll9ghwmV1mMLr5f94o6CVbG9aX9BQ9L7ebvVm/xs=; b=dU2/1g8/HeJ4CdHdzRmZOHHEfS
	Hpi5mZqh8nLDtdEgu7SidTSc7p9Mcxvj7it44iicISBiKN66CyaDW02mGwAeV44w0CGb6r5qsvO8Z
	vzTfdfP5oshRft1qQ2gl0SAhJR8RLHFEZV1vz8qL0p0cJyRc4yY9O5PTC3GY03V6QiGYG4i+6o+ll
	KwtNjdl9SVJL6oiR3foHGlOGz2dk1jmo8l6JwkF8CpiRBI41XDOlEab4bfx8u+ajVhYg+qw1ORhht
	gp7hCxKA48pVpiXs1PjQw/c5OiyMQl6xi2Z9nOaXvgBjVdrUBAwWwiWdgcgy6bD2iCp53CE09wdHK
	QD9mWKdw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 13 Jan 2026 16:31:36 +0100
Subject: [PATCH 3/3] ARM: dts: imx: e60k02: add tps65185
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-tps65185-dt-v1-3-66d376ba5f65@kemnade.info>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5314; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=hYsyR4vSg3KkDsH/14JJzUlj+JNroWuLLkBbWg+BP40=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqbN/NEUY/Vou77z7tLtC1ZXDd5i6fmQkrv3KwHncV
 PtYcY1vRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABMRVWBkWJF2p/rDJLlF706x
 h1hmShsYpPkYBFS5Mv8IsrIynSB4iJFhe7aUm6Ps9BmGJc7mfZL2V2SWJR/ad0KDd8ak7ZuWiEY
 wAwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073325_333129_D3D5618E 
X-CRM114-Status: GOOD (  10.57  )
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

Wire up the TPS65185 regulator needed for the display.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 ++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 ++++++++++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
index 0029c12f16c8..aac7b9ef7627 100644
--- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = &uart1;
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
+
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 
@@ -119,8 +127,33 @@ touchscreen@24 {
 		vdd-supply = <&ldo5_reg>;
 	};
 
-	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+	tps65185: pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+		vin-supply = <&epd_pmic_supply>;
+		pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vcom_reg: vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg_reg: vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
 
+			v3p3_reg: v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
index 5ba6f15e9ed5..58b9ccd9b605 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
@@ -26,6 +26,11 @@ / {
 	compatible = "kobo,tolino-shine3", "fsl,imx6sl";
 };
 
+&epd_pmic_supply {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+};
+
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_keys>;
@@ -59,6 +64,12 @@ MX6SL_PAD_SD1_DAT2__GPIO5_IO13                0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epdc-pmic-supplygrp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14 0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD1_DAT1__GPIO5_IO08	0x17059	/* PWR_SW */
@@ -159,6 +170,16 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28                         0x1b8b1 /* ricoh619 bat_l
 		>;
 	};
 
+	pinctrl_tps65185_gpio: tps65185-gpio-grp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03	0x40010059 /* vcom_ctrl */
+			MX6SL_PAD_EPDC_PWRCTRL0__GPIO2_IO07	0x40010059 /* wakeup */
+			MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08	0x40010059 /* enable */
+			MX6SL_PAD_EPDC_PWRCTRL2__GPIO2_IO09	0x17059 /* nINT */
+			MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13	0x17059 /* pwr-good */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1
@@ -308,6 +329,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&tps65185 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tps65185_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 18c9ac8f7560..1000ee8b807a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -36,6 +36,11 @@ &cpu0 {
 	soc-supply = <&dcdc1_reg>;
 };
 
+&epd_pmic_supply {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+};
+
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_keys>;
@@ -69,6 +74,12 @@ MX6SLL_PAD_SD1_DATA2__GPIO5_IO13                0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epdc-pmic-supplygrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14 0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD1_DATA1__GPIO5_IO08	0x17059	/* PWR_SW */
@@ -169,6 +180,16 @@ MX6SLL_PAD_KEY_COL2__GPIO3_IO28	0x1b8b1 /* ricoh619 bat_low_int */
 		>;
 	};
 
+	pinctrl_tps65185_gpio: tps65185-gpio-grp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03	0x40010059 /* vcom_ctrl */
+			MX6SLL_PAD_EPDC_PWR_CTRL0__GPIO2_IO07	0x40010059 /* wakeup */
+			MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08	0x40010059 /* enable */
+			MX6SLL_PAD_EPDC_PWR_CTRL2__GPIO2_IO09	0x17059 /* nINT */
+			MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13	0x17059 /* pwr-good */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
@@ -310,6 +331,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&tps65185 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tps65185_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;

-- 
2.47.3



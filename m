Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E176CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zBfYtAuJkom4BOylkc8K6Uk6Zts+d4OHt0Hr7CWysM=; b=1yfNLf9rZho0yZUw6nVRcoSZU5
	Q8iZRVvhqkMzHSsKoyZayNhJDnk87TEihEMfp867TjBiglzGUy6G3cEe/LAQ2PDteNz+pYPAdtDrR
	mqOofcBBfjVhUTzmXNg6JTLvJdrw/6ERPxpBHCCBf7c9Kt/JzLw0JIcameGCsr3t/hCNV5Nboqhvl
	G1yveFnNq6AMvC4KOLDG5sO8J4ZE0wH2PTaCTpwkS9/Fb0lfUyj+1qvbaGULZZ2t5I2Zz85fq9Otw
	YQ4YVJuAymYwrVEYbUWC5VtMkfnMwHcVGiCJTxe4HQc8vwbTRrZnUnnRgL3B3VKfxDsJR9Jj9sIA7
	47Wyb26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52u-0000000A4ha-2SCp;
	Tue, 09 Sep 2025 20:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52t-0000000A4gU-3Z7R
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 20:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+zBfYtAuJkom4BOylkc8K6Uk6Zts+d4OHt0Hr7CWysM=; b=nEqIOSDXYEBjOqOUQlHKEtwjFP
	HVkCNHlsaEPjRwRLV0G3fEcfcVXQS82FYWrN2y20vMNUljWhn/M+3gK5ZJfjaQFMbO6XHBSnJOhUP
	Ke/3RimVfsUCzWk3mVo9iNOvU32DOZ5M5pHeXAM9gUaf4p362R7OsjRFfbDEIC4+62FXYWNPwdW+y
	jMSGzuQrLJgBYHBjbBLpDeqHcSpEGGC8HidfljsQFG7nBfi7pX16KeeNMjLgLC0X8YgGWATFdRbOF
	U975Ur9VlkjPC5T/vMxqH4ZcT91ab7z5LcgFiphKaITeCBmggSRQ18q2Pat4GR424Flazt8ZzYv/+
	eJOtKnYA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52k-00000005bQD-0Kzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 20:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D52D644B3D;
	Tue,  9 Sep 2025 20:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903FDC4CEF8;
	Tue,  9 Sep 2025 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757450057;
	bh=hdwNKGl7lx7063eJ2yiIHblOsSgC/pR1LbJ6lLkBads=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eQv2U/UeE/bjEFK3vU+6qVQEwjGD5nim1L/4Ln1UhO1QwHC6X1buEhiHGQchxU4y7
	 B3pWVa7H4Xw/8YeAB9G9qACjvy7X/VYIb7F+OfJG4cy71yeVK57Zl8DVCLaCOD8FYF
	 vg/p0hKqAm4WJs0JIVZUVO4MvDGwqtSPtnEPcikDkFUrNfSajUas1M3FP196j/4/XQ
	 oc5UdPl7n80sfgL1HzFMh1I/E/OZOAHn7TaZubs9ncVz7vF7Ns3XBbfqaDrEw/llvp
	 9NxwRtann1qA6WN9hyEfVCjJO1gj4jBxH9dsTt0rG5D48Ck0PtPdY4m000YycaJRUt
	 p2xCh4D8CEvwQ==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Tue, 09 Sep 2025 22:33:04 +0200
Subject: [PATCH v2 3/3] ARM: dts: imx: e70k02: add sy7636
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-sy7636-rsrc-v2-3-cfd9f44fd259@kernel.org>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
In-Reply-To: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=4885; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=hdwNKGl7lx7063eJ2yiIHblOsSgC/pR1LbJ6lLkBads=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBkH+q1PF74+IVA/1cjcZWn60ncPOTUqjoRejfhrtHhnl
 tOXn7uOdJSyMIhxMMiKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCR/jxGhikzDa5xJmX66kwK
 cNzEUVnkebjgiZvS1/4lqtuUz5nxz2b475O0zmqpflyX5n7LTn2uZ9/X70/acE2iLk5V/9utHdm
 qnAA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_213425_252206_BC16DE1C 
X-CRM114-Status: GOOD (  12.74  )
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

Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
support.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
Acked-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++++-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dcc3c9d488a88..b4f42f71c6c49 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -69,6 +69,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
 	reg_wifi: regulator-wifi {
 		compatible = "regulator-fixed";
 		regulator-name = "SD3_SPWR";
@@ -133,7 +141,22 @@ touchscreen@24 {
 		vdd-supply = <&ldo5_reg>;
 	};
 
-	/* TODO: SY7636 PMIC for E Ink at 0x62 */
+	sy7636: pmic@62 {
+		compatible = "silergy,sy7636a";
+		reg = <0x62>;
+		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		vcom-en-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		epd-pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&epd_pmic_supply>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			reg_epdpmic: vcom {
+				regulator-name = "vcom";
+			};
+		};
+	};
 
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
index a2534c422a522..f8709a9524093 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
@@ -26,6 +26,11 @@ / {
 	compatible = "kobo,tolino-vision5", "fsl,imx6sl";
 };
 
+&epd_pmic_supply {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+};
+
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_keys>;
@@ -59,6 +64,12 @@ MX6SL_PAD_FEC_RXD1__GPIO4_IO18          0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14    0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SL_PAD_FEC_CRS_DV__GPIO4_IO25	0x17059	/* PWR_SW */
@@ -159,6 +170,14 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28		0x1b8b1 /* ricoh619 bat_low_int */
 		>;
 	};
 
+	pinctrl_sy7636_gpio: sy7636-gpiogrp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03        0x40010059 /* VCOM_CTRL */
+			MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08     0x40010059 /* EN */
+			MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13      0x17059 /* PWR_GOOD */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1
@@ -329,6 +348,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&sy7636 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sy7636_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
index 660620d226f71..19bbe60331b36 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
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
@@ -69,6 +74,12 @@ MX6SLL_PAD_GPIO4_IO18__GPIO4_IO18	0x10059 /* TP_RST */
 		>;
 	};
 
+	pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14    0x40010059
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio-keysgrp {
 		fsl,pins = <
 			MX6SLL_PAD_GPIO4_IO25__GPIO4_IO25	0x17059	/* PWR_SW */
@@ -169,6 +180,14 @@ MX6SLL_PAD_KEY_COL2__GPIO3_IO28		0x1b8b1 /* ricoh619 bat_low_int */
 		>;
 	};
 
+	pinctrl_sy7636_gpio: sy7636-gpiogrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03       0x40010059 /* VCOM_CTRL */
+			MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08   0x40010059 /* EN */
+			MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13    0x17059 /* PWR_GOOD */
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
@@ -319,6 +338,11 @@ &ricoh619 {
 	pinctrl-0 = <&pinctrl_ricoh_gpio>;
 };
 
+&sy7636 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sy7636_gpio>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;

-- 
2.39.5



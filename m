Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/pyVUppt0BFBMcSoltADLxRkWMSzfBmiY9ZjSSVdXY=; b=iq/V8ea2u8Q2e6B1EvI6UNNkey
	u4dUfsC94pQ1WHAzFBqv7lGbfjPN0SiQAYpNba3zhaX2SfGNpLHBGfhp5MZGjU3uuaeyutmc7+afB
	/xZbnEt3lkPwmKX7hsxCltsJ8wRw8/XAWYLJT5R5eekYKJhz4n4gfFD8hIVQG1HCaKeIAVmYbWnGE
	DMdcpZ6PA8DToiko2RQoaNNzJpD0tEzB7aWYPGn9ub4eBGhpLMt2RRnIt4nVIk/Uu0y2oIYfNxigW
	eUKgoowm3u3B8AveVGD/lX2ru0JHWSiMZV8FXG9CKnSXrPy33nCRjVKFKq7+BWDBorCrCMmlLAeVw
	BxLNzr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlBw-0000000G8cB-0caT;
	Tue, 28 Oct 2025 15:00:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlBt-0000000G8bl-0Tv8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D7D440738;
	Tue, 28 Oct 2025 15:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F31C4CEE7;
	Tue, 28 Oct 2025 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761663652;
	bh=NqtS/vo6GQ9GLxrmrNCvwi9dCjnitvmWTlCDHG2vFA8=;
	h=From:Date:Subject:To:Cc:From;
	b=rMEBgbxbusNwEbZInt9zjNooDq+meSxtgQ68h+Jkz78I2Ubtptzeti7HdQOwvAm1n
	 RDw3ygBUsUEA6+64+Dgt8sd9jTO4LojiEoq4FybTCQrGsWSjMiLjErLZr2VCHxgsCM
	 G++aqXA7WQOQxpDeD5k2rU5yDHu1miBucR7BvfGRnSzp8wc0MA0+fkS4GTv55dZvgV
	 ySxDV3hmPrgqhkVjfZdcCQvnYCo3bliGtsF3n533HXQiIeYE9XkKjXoLkJhVuPu/Zc
	 TPyHurEXjQkzoWqTIDBrVGxy/kboYz505zk5LsYsDpKwzI7fTft9PBlSSEbcEfzo7c
	 6PugmvGO6srKA==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Tue, 28 Oct 2025 16:00:36 +0100
Subject: [PATCH v4] ARM: dts: imx: e70k02: add sy7636
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-sy7636-rsrc-v4-1-242ccfd3bc10@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJPaAGkC/23MQQ7CIBRF0a0YxmLoh0Jx5D6MA4RPSzStAUNsm
 u5d2lEbHb6XnDuRhDFgIufDRCLmkMLQlyGOB2I707dIgyubAIOaaSZpGpXkksYULbXAjJF3Y8A
 KUsQrog+ftXa9ld2F9B7iuMZztbz/O7mijCI0jTS6vEZdHhh7fJ6G2JIllGGL9R5DwdY77YXwD
 mr9g/kGV2qPecGcV8CVq5kysMPzPH8BeUugNyEBAAA=
X-Change-ID: 20250906-sy7636-rsrc-c20aa6baa2c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=6304; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=NqtS/vo6GQ9GLxrmrNCvwi9dCjnitvmWTlCDHG2vFA8=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJkMtxZUrd0wLUxqM4v+x1T1F68ObOl+dOGBWgqfpuHGm
 Owyh75XHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzktAzDP+2u4u/9V+J5DB1P
 uHJptmzvvG9772P21nr1C98um96xsGZkuHX+UOhis0f9eQ1TH3QcuX159hXLyKtpqxuF2hfq/Ju
 3jA8A
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_080053_224964_FAD482D3 
X-CRM114-Status: GOOD (  15.98  )
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

Acked-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
The SY7636A has some pins which can be hardwired or used to have more
more advanced power management available. As several devices containing
this regulator have these pins not hardwired, but instead connected to some
GPIO, enhance the driver to have them defined and initialized.
Also add the ability to power off the chip completely by defining some
input power supply.

Actually implementing better power management is planned to be
implemented as a second step. The regulators in the SY7636A should only
be on for a short time during display refresh, but currently they are
unconditionally forcefully enabled by the hwmon part of this chip.
---
Changes in v4:
- reorder enable-active-high property
- Link to v3: https://lore.kernel.org/r/20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org

Changes in v3:
- shorten descriptions in binding
- Link to v2: https://lore.kernel.org/r/20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org

Changes in v2:
- en[-gpios] -> enable[-gpios] in yaml/dts/driver
- fix en vs vcom_en in error handling
- comment delay
- drop applied commit (rebased to regulator/for-linus)
- Link to v1: https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++++-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dcc3c9d488a8..3bb11c5a6353 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -69,6 +69,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
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
index a2534c422a52..f8709a952409 100644
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
index 660620d226f7..19bbe60331b3 100644
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

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20250906-sy7636-rsrc-c20aa6baa2c4

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F8FC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryp3/PB4vcj0KtZaTMI5+VyehhpTjHATZ/hJV75Vuiw=; b=rou1Jwr/Uw2pSdiymfkseZU9Hp
	M3uIeRZy2UuwYgK6CeWHU5HijHiTBWA4phwz6ZwcL72+OTmHCVQrzJXqhZE6giJR8Of0unDunwqFx
	7bf8Ip/ik+Qw+t6s7xrgLjvEZH//qUgWn+zJ9fJp9Z8evsqsmABTzYeDj3bivXRzjLgDYP7MmA4Ov
	4/uOAH5ew5cIvwIIdcHIUqd8t7oxWlxB7cBD1bCzWgGyo4wli+CyZ8ZYDLBUK6dxRz8WlzhwolTqX
	9alZw/N2dxsGZ3pZFWpv3vKFF43TKQIdCdfrfptiT8JQ++k2axYg64fbhNH5dQeka952j12Tq1xwY
	Yx84/lSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXeX-0000000Cv0M-1BMA;
	Mon, 10 Aug 2026 21:35:25 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXeR-0000000CuyL-11tG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:35:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC97611B8AC;
	Mon, 10 Aug 2026 23:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786397713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ryp3/PB4vcj0KtZaTMI5+VyehhpTjHATZ/hJV75Vuiw=;
	b=YjGLapGB2AS4LGMSUTz3zNmU2ssjHIl9NOGVg6sqBmnrJYqqHUzdI/jTk3X4siHV0LmJBQ
	efz2VR1VcxIByepeXnnOubhja6DV4vXUxyULTpMB77zH5WeZEWKwn9vBsBipnvBQUsPLPM
	FOsyZnMGat+uXDyDk1+ry0CuU4gXS64KdsOnoQtaSET2haGU5+kbBncPFu4KOHzeLarIwN
	8aBoBUWYXnXXAU7f1rUbx/ANAW0tm/heb6oPYdp+aQBGTaraw0wwtQmG5Z2opjIWQmO9b6
	3fW5rTyYCMcf+pcZ4oLLpRQNJBGqJpamhDRzri7eIBQ0ZdvohAhCnPH0fMoQ2Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fedor Ross <fedor.ross@ifm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mn: Expand EEPROM description on ifm VHIP4 EvalBoard
Date: Mon, 10 Aug 2026 23:34:39 +0200
Message-ID: <20260810213456.1268831-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
References: <20260810213456.1268831-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_143519_590068_36A826FC 
X-CRM114-Status: GOOD (  12.47  )
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

Describe the EEPROM write protect GPIOs and labels on VHIP4 EvalBoard.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Fedor Ross <fedor.ross@ifm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../imx8mn-vhip4-evalboard-common.dtsi        |  3 +-
 .../freescale/imx8mn-vhip4-evalboard-v1.dts   |  8 ++++++
 .../freescale/imx8mn-vhip4-evalboard-v2.dts   | 28 ++++++++++++++++---
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
index aaf9761703aaf..73b1ed2632a39 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
@@ -142,8 +142,9 @@ &i2c1 {
 	pinctrl-0 = <&pinctrl_i2c1>;
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 
-	eeprom@51 {
+	cfg_eeprom: eeprom@51 {
 		compatible = "atmel,24c128";
+		label = "ifm-deviceinfo";
 		reg = <0x51>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
index a8f7c226a61f8..98dd241a9d5ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
@@ -13,6 +13,11 @@ / {
 		     "ifm,imx8mn-vhip4", "fsl,imx8mn";
 };
 
+&cfg_eeprom {
+	/* Shared with logging EEPROM on v1 hardware */
+	wp-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>;
+};
+
 &ifm_led {
 	pinctrl-1 = <&pinctrl_gpio_led_v1>;
 
@@ -90,7 +95,10 @@ temperature-sensor@48 {
 
 	eeprom@50 {
 		compatible = "atmel,24c128";
+		label = "ifm-logging";
 		reg = <0x50>;
+		/* Shared with configuration EEPROM on v1 hardware */
+		wp-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
index 43fd4d0041ef3..04fa43b12d2b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -20,6 +20,12 @@ multi-led {
 	};
 };
 
+&cfg_eeprom {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cfgeeprom>;
+	wp-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+};
+
 &ifm_led {
 	pinctrl-1 = <&pinctrl_gpio_led_v2>;
 
@@ -87,7 +93,11 @@ temperature-sensor@48 {
 
 	eeprom@54 {
 		compatible = "atmel,24c128";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_logeeprom>;
+		label = "ifm-logging";
 		reg = <0x54>;
+		wp-gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -103,6 +113,13 @@ &ifm_pmic {
 };
 
 &iomuxc {
+	pinctrl_cfgeeprom: cfgeeprom-grp {
+		fsl,pins = <
+			/* CFG_EEPROM_WP */
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0x140
+		>;
+	};
+
 	pinctrl_ecspi1_cs: ecspi1-cs-grp {
 		fsl,pins = <
 			/* KS8794 nCS */
@@ -143,12 +160,8 @@ pinctrl_i2c1_gpio: i2c1-gpio-grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6		0x56
 			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7		0xd6
-			/* CFG_EEPROM_WP */
-			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11		0x140
 			/* RTC_nIRQ */
 			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0x116
-			/* LOG_EE_WP */
-			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3			0x140
 		>;
 	};
 
@@ -166,6 +179,13 @@ MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0xd6
 		>;
 	};
 
+	pinctrl_logeeprom: logeeprom-grp {
+		fsl,pins = <
+			/* LOG_EE_WP */
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3			0x140
+		>;
+	};
+
 	pinctrl_mcp2518: mcp2518-grp {
 		fsl,pins = <
 			/* CAN0_CLKO */
-- 
2.53.0



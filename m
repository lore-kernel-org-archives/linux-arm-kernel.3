Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A49C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLdmF+7rGe4HYdKKcpIvoWZSwaNZfVJ3G2hMjd6o7Mk=; b=x2q+cNH5FuzzFtAuEuS9g8Zpph
	SmAewaAd956bumqfHEa+hRhYDyCHX2PNXPt+gsLVgeBWiF8HklOHkRqUYWfLwK/NGPK2neBb+nubB
	6CejJPSCE1W9qQDYd+SGcO6isrxcNx9IjUV2MgK8LZTb5GsG+MRCaIezZH7KOHPl+b5I+TtUxX6Zl
	wu1wFcJTUOPoq2ggOSNLt20p0/K2ockdrBr3HmuvsxxiROVZ/3ZyzGziWvj4irUj//UQdnJUw4JC3
	PIXkEhv6Z9iyMgVAHBzT/utELNcgsNL8ygJnTK0gMPu48/aXYmYGnyt1WHfpyuD7pSpu/skOXCdqc
	SKRNR8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfQl-00000004gLV-09W0;
	Mon, 09 Jun 2025 16:33:03 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOegl-00000004Z4R-2zGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:45:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43E161FD7B;
	Mon,  9 Jun 2025 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLdmF+7rGe4HYdKKcpIvoWZSwaNZfVJ3G2hMjd6o7Mk=;
	b=Csflvk9OJ170PPct5LgfqGxE3iCifi9LI5dnqPbXxCM8DJ0CZVscdt4kWZC2K9ibktaweX
	SSO9JJhVMVO+D98sD6UPSiq5fCl2MumLovbK/Qs215hhN3ynncjtwJpuD/JMDNoSqjPWrP
	3AR1Ao5OUwvMXLvWAsnrfq1PDimWPJuynO8XwbmzBEJ6k+0RiJbRKBlw8G/DzGN8gUTh7x
	mj5tu0X7kmXLqDR7sy9Gq5maFC1vPu4SokuCN050E3BjauPagyG/j707083StDstMvEc97
	cB0Ca2xTBiPTANB+D3hVXtW3cAT9ZmXmvzLYXH/xL5x9T5AxFpeQGwhwdaY8cQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:54 +0200
Subject: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-4-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
In-Reply-To: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhop
 ehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084531_906898_99C080E3 
X-CRM114-Status: GOOD (  13.76  )
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

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- Used generic pmic node name.
- Add regulator prefix to fixed regulator node name.
- Add the compatible to omap.yaml binding
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index c43fa4f4af81..774c13157caa 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -145,6 +145,7 @@ properties:
       - description: TI bone green variants based on TI AM335
         items:
           - enum:
+              - ti,am335x-bone-green-eco
               - ti,am335x-bone-green-wireless
           - const: ti,am335x-bone-green
           - const: ti,am335x-bone
diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 95c68135dd0c..1aef60eef671 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-boneblue.dtb \
 	am335x-bonegreen.dtb \
 	am335x-bonegreen-wireless.dtb \
+	am335x-bonegreen-eco.dtb \
 	am335x-chiliboard.dtb \
 	am335x-cm-t335.dtb \
 	am335x-evm.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
new file mode 100644
index 000000000000..f2592a3ddbbb
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Bootlin
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+#include "am335x-bonegreen-common.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	model = "TI AM335x BeagleBone Green Eco";
+	compatible = "ti,am335x-bone-green-eco", "ti,am335x-bone-green",
+		     "ti,am335x-bone", "ti,am33xx";
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&buck1>;
+		};
+	};
+
+	sys_5v: regulator-sys-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-always-on;
+	};
+};
+
+&usb0 {
+	interrupts-extended = <&intc 18>;
+	interrupt-names = "mc";
+};
+
+&baseboard_eeprom {
+	vcc-supply = <&v3v3>;
+};
+
+&i2c0 {
+	/delete-node/ pmic@24;
+
+	tps65214: pmic@30 {
+		compatible = "ti,tps65214";
+		reg = <0x30>;
+		buck1-supply = <&sys_5v>;
+		buck2-supply = <&sys_5v>;
+		buck3-supply = <&sys_5v>;
+		ldo1-supply = <&sys_5v>;
+		ldo2-supply = <&sys_5v>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <7>;
+		pinctrl-0 = <&pmic_irq_pins_default>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-name = "vdd_mpu";
+				regulator-min-microvolt = <925000>;
+				regulator-max-microvolt = <1351500>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <925000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-name = "vdds_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+			};
+
+			ldo1_reg: ldo1 {
+				regulator-name = "vdd_1v8_1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "vdd_1v8_2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&dp83867_0>;
+	ti,dual-emac-pvid = <1>;
+};
+
+&mac_sw {
+	pinctrl-0 = <&cpsw_b_default>;
+	pinctrl-1 = <&cpsw_b_sleep>;
+};
+
+&davinci_mdio_sw {
+	/delete-node/ ethernet-phy@0;
+
+	dp83867_0: ethernet-phy@0 {
+		reg = <0>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_8_B_NIB>;
+		ti,min-output-impedance;
+		ti,dp83867-rxctrl-strap-quirk;
+	};
+};
+
+&am33xx_pinmux {
+	cpsw_b_default: cpsw-b-default-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE2)
+		>;
+	};
+
+	cpsw_b_sleep: cpsw-b-sleep-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM33XX_IOPAD(AM335X_PIN_NNMI, PIN_INPUT_PULLUP | MUX_MODE0)
+		>;
+	};
+};

-- 
2.43.0



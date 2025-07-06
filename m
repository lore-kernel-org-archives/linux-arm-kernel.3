Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F400C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lb0D6uIH1pT+2b6K0Fe8p7uYcbSYVmUMEHxTXCcBaKw=; b=nU3lidUBd0V7bU8mmIB6toYDM2
	bIOcmH25abgwko2Oltmu79cmnS74BYNF6PjnVg2oMKyZKIE9XwNjK1nq7iKcnb5Qas5JEc/pXjMJ0
	xXPrfP1AnirALE7fYAiFoKkUjJFQzo4KMsh55BOGeUzKhkbZAEO4Wcaf3GKMKv2mP14dZ2XKPtHQm
	UQxRad1WWjxRn6Yo709wglm+UEnX4Fev9Uym1XFPslsSe0gji3d454MGChhUtVhegEz/QfLCtHvco
	2qkpRzln7lJ5lgX7iQmkUHR+Qc7DuRZ+f0S+JU2k4A/QoJK3ijdDIjiPE+rDTXQfR63ovphiFGk3o
	Q2tkmbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUoI-00000000i2P-2Okb;
	Sun, 06 Jul 2025 19:13:58 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUEG-00000000eMB-3KOM;
	Sun, 06 Jul 2025 18:36:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=Lb0D6uIH1pT+2b6K0Fe8p7uYcbSYVmUMEHxTXCcBaKw=;
	b=VJ9KQ/RF58iqfKh4NEupuV1j2CcWxq9PbwDHY9aZlVsNVzfrWwEDH/6PHUI92UXymCEelOpIhi0/OfP0Z4oKmQPmen3eQjCiB0VR38DbaOC9U9vKb15Lh3UUd73BUDXto3NDjcMxCQhuPLTbebCaMkyTGnVJV7pPnT/0caFGH70=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 6 Jul 2025 20:36:34 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/5] ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
Date: Sun,  6 Jul 2025 20:35:58 +0200
Message-Id: <20250706183601.157523-6-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706183601.157523-1-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_113645_149535_D24842C8 
X-CRM114-Status: GOOD (  13.81  )
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

The NetCube Systems Nagami Keypad Carrier uses the Nagami SoM and contains
a MCP23008 for connecting to a 4x3 matrix keypad and internal status led.
The I2C2 interface is connected to said MCP23008 and also a header for an
PN532 NFC-Module. It also provides a pin-header for a bi-color status led.
Ethernet with PoE support is available on a screwterminal after magnetics.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index af287bb32..a2137bbe2 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -259,6 +259,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-s3-pinecube.dtb \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
 	sun8i-t113s-netcube-nagami-basic-carrier.dtb \
+	sun8i-t113s-netcube-nagami-keypad-carrier.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
 	sun8i-v3-sl631-imx179.dtb \
 	sun8i-v3s-anbernic-rg-nano.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
new file mode 100644
index 000000000..7abecc355
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-t113s-netcube-nagami.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "NetCube Systems Nagami Keypad Carrier Board";
+	compatible = "netcube,nagami-keypad-carrier", "netcube,nagami",
+				 "allwinner,sun8i-t113s";
+
+	keypad: keypad {
+		compatible = "gpio-matrix-keypad";
+		debounce-delay-ms = <5>;
+		col-scan-delay-us = <2>;
+
+		row-gpios = <&mcp23008 0 0
+					 &mcp23008 1 0
+					 &mcp23008 2 0
+					 &mcp23008 3 0>;
+
+		col-gpios = <&mcp23008 6 0
+					 &mcp23008 5 0
+					 &mcp23008 4 0>;
+
+		linux,keymap = <0x00000201
+						0x00010202
+						0x00020203
+						0x01000204
+						0x01010205
+						0x01020206
+						0x02000207
+						0x02010208
+						0x02020209
+						0x0300020A
+						0x03010200
+						0x0302020D>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			gpios = <&mcp23008 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+
+		led_status_red: led-status-red {
+			gpios = <&pio 3 16 GPIO_ACTIVE_HIGH>;  /* PD16 */
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led_status_green: led-status-green {
+			gpios = <&pio 3 22 GPIO_ACTIVE_HIGH>;  /* PD22 */
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+		};
+	};
+
+	status-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STATUS;
+		leds = <&led_status_red &led_status_green>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	mcp23008: gpio@20 {
+		compatible = "microchip,mcp23008";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupts-extended = <&pio 5 6 IRQ_TYPE_LEVEL_LOW>;  /* PF6 */
+		interrupt-names = "mcp23008@20 irq";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	gpio-line-names = "", "", "", "", // PA
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PB
+					  "", "", "UART3_TX", "UART3_RX",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "eMMC_CLK", "eMMC_CMD", // PC
+					  "eMMC_D2", "eMMC_D1", "eMMC_D0", "eMMC_D3",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PD
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "LED_STATUS_RED", "", "", "",
+					  "I2C2_SCL", "I2C2_SDA", "LED_STATUS_GREEN", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "ETH_CRSDV", "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
+					  "ETH_TXD0", "ETH_TXD1", "ETH_TXEN", "",
+					  "ETH_MDC", "ETH_MDIO", "QWIIC_nINT", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "", // PF
+					  "", "", "KEY_nINT", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+					  "ESP_D2", "ESP_D3", "UART1_TXD", "UART1_RXD",
+					  "ESP_nBOOT", "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "",
+					  "", "", "", "";
+};
+
+&usb_otg {
+	dr_mode = "device";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.39.5




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11087CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi1EjpnU952nAuPQEW4DEtH+J8BzbGp6UANyoG9rvCc=; b=aLXqSbC4I0M98kkm7+HFVIEz3U
	CRhfy3+P2lAdvP6IckHmikGld/9XrGoT2gY2ePLdFj5eQAgzj//386DxNImwqmqwSMHQoskT0pIeX
	VnA4kcaZa2G+QPVjD6hgxcn6NVmY2MqIQPeIOyX77FLoSQbJSEnbTXRxcTMnaLL3hPMgVJTFAW9tr
	kwkjIOtEDFjhYkoZl5bMHuWFAZPXA4f4GdgLvkMZMDpiShrqavsuWDWgKtg9gQMAs1ESWj0npjECw
	ymMfJVdXtcCo8uDHlkYVoAi9QAwTmgCiInFkstsgrQve8SjlpYx1sAteAtsiFdhZmLEc7YfB/5oSa
	6czBIeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVy3E-00000001pSA-1atF;
	Sat, 06 Jun 2026 20:55:28 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVy3A-00000001pPC-1h25;
	Sat, 06 Jun 2026 20:55:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=hi1EjpnU952nAuPQEW4DEtH+J8BzbGp6UANyoG9rvCc=;
	b=a3fgLBZLemwO85EFhAMG1ZIqE3zRohJmgvfD264uDUySvOU2Lnan6mdb3ewn36cskUeL6d0lavASeFZOju+paCsx8r1UPd0slLlQAPEyEQIn2DDNu9DrG6TufYWEse0mJjkqg4W85nGFeQgIjXVsZjJx3rDTAz4N5JTLVWU8ikg=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Sat, 6 Jun 2026 22:55:17 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
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
Subject: [PATCH v4 3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)
Date: Sat,  6 Jun 2026 22:54:43 +0200
Message-ID: <20260606205452.2386930-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606205452.2386930-1-lukas.schmid@netcube.li>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_135524_737280_C6FD476E 
X-CRM114-Status: GOOD (  14.79  )
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

NetCube Systems OpenNMC is an open replacement for APC SmartSlot Management
Cards. It is based on the Nagami System-on-Module. It breaks out the
following interfaces:

- 10/100 Mbps Ethernet
- USB Type-C OTG using a TUSB320 (usb0)
- USB Type-C Console Port using a CH340 (uart3)
- USB Type-A Host with internal CH334 USB-Hub (usb1)
- MicroSD Slot with Card-Detect (mmc0)
- WiFi/Bluetooth using the modules built-in ESP32
- SmartSlot serial interface (uart4)
- DS3232 RTC with CR1220 Battery Backup
- Extension connector providing SPI,I2C,USB,CAN,UART for future use.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index f71392a55df8..0fc954d41595 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -201,6 +201,7 @@ DTC_FLAGS_sun8i-h3-orangepi-pc := -@
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
 DTC_FLAGS_sun8i-t113s-netcube-nagami-basic-carrier := -@
+DTC_FLAGS_sun8i-t113s-netcube-dobermann := -@
 DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
 dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a23-evb.dtb \
@@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-s3-lichee-zero-plus.dtb \
 	sun8i-s3-pinecube.dtb \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
+	sun8i-t113s-netcube-dobermann.dtb \
 	sun8i-t113s-netcube-nagami-basic-carrier.dtb \
 	sun8i-t113s-netcube-nagami-keypad-carrier.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
new file mode 100644
index 000000000000..d7765caffe2a
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-t113s-netcube-nagami.dtsi"
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "NetCube Systems OpenNMC (dobermann)";
+	compatible = "netcube,dobermann", "netcube,nagami",
+		     "allwinner,sun8i-t113s";
+
+	aliases {
+		serial2 = &uart4; // UART on SmartSlot
+		rtc0 = &ds3232;
+		rtc1 = &rtc; // not battery backed
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_heartbeat_green: led-heartbeat-green {
+			gpios = <&pio 6 14 GPIO_ACTIVE_HIGH>; /* PG14 */
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	tusb320: typec@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupts-extended = <&pio 3 22 IRQ_TYPE_LEVEL_LOW>;  /* PD22 */
+	};
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+};
+
+/* microSD Card Slot on the board */
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
+	bus-width = <4>;
+	cd-gpios = <&pio 6 15 GPIO_ACTIVE_LOW>; /* PG15 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	gpio-line-names = "", "", "", "", // PA
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "SMART_TX", "SMART_RX", // PB
+			  "EXT_IO3", "EXT_IO2", "CONSOLE_TX", "CONSOLE_RX",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "eMMC_CLK", "eMMC_CMD", // PC
+			  "eMMC_D2", "eMMC_D1", "eMMC_D0", "eMMC_D3",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", // PD
+			  "", "", "", "",
+			  "", "USB_SEC_EN", "EXT_SPI_nCS", "EXT_SPI_SCK",
+			  "EXT_SPI_MOSI", "EXT_SPI_MISO", "EXT_IO5", "EXT_IO4",
+			  "SMART_SEL", "", "", "",
+			  "I2C2_SCL", "I2C2_SDA", "TUSB320_nINT", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ETH_CRSDV", "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
+			  "ETH_TXD0", "ETH_TXD1", "ETH_TXEN", "",
+			  "ETH_MDC", "ETH_MDIO", "I2C3_nINT", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "uSD_D1", "uSD_D0", "uSD_CLK", "uSD_CMD", // PF
+			  "uSD_D3", "uSD_D2", "TUSB320_ID", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+			  "ESP_D2", "ESP_D3", "ESP_TXD", "ESP_RXD",
+			  "ESP_nBOOT", "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
+			  "EXT_IO1", "EXT_IO0", "LED_HEARTBEAT", "SD_DETECT",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+/* SmartSlot serial */
+&uart4 {
+	pinctrl-0 = <&uart4_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_otg {
+	extcon = <&tusb320 0>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	status = "okay";
+};
-- 
2.47.3




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABD0C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8+6sooNuI0u7KEgf5MNEekoUSrelX7lyNAPv8x0YD8=; b=D4nkRoWpwWiUUudIBUi8qMzADu
	y6gh8o36rBu666GP43CQlPv1pomk3lY3lkXEq+wXtub9mY9aXrdV0DELx3TRmlLGX816tMew0wIDi
	pheIxIzLobOCUGenalntHLQg72tk5cdprc4U5zSHFjwCL5Ej328mvUcl9tXtRRLxN1OVOslBPUm//
	ohpbWTMuLG3FP0Z+6yZb3TbS58ylPfbZV7ISus+TKiszn5mpmTh+pM0lNqJIxd+Si7/ivoEwlBLRJ
	mbTagbhUyBe8WR9uDuHYy7zz5XFwGwv7h1fatGgtu5ZBOcMsIPUn9EfMWw0OaQR3XlBJm4yb9p5Mf
	3yKaGQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrjR-0000000HCEX-1Saj;
	Thu, 08 May 2025 03:15:33 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrdX-0000000HBaj-2Fvy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:09:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54839KjF1716634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 22:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746673760;
	bh=e8+6sooNuI0u7KEgf5MNEekoUSrelX7lyNAPv8x0YD8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=kql4xARemmQFdN19EPHPGC2/0likhbFXuSaBgqjZJmuNwYrI8/YkT1KCq3SDIBGdD
	 03Z2r/BpJRk1r57coYPBBZNGJCCZwsV5AHjTDj/3PoSFEBec/PCLo1jq5JL/RtaINI
	 fK3ZVEMyF+UB4kv23L35XuSTAUThPK2VBI89hSgY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54839KKo102456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 22:09:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 22:09:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 22:09:19 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54839JI1020150;
	Wed, 7 May 2025 22:09:19 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 7 May 2025 22:09:21 -0500
Subject: [PATCH v5 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-am62lx-v5-3-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
In-Reply-To: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_200927_733427_F7CC2648 
X-CRM114-Status: GOOD (  15.37  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial board file for the AM62L3's Evaluation Module.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - removed current-speed property from main_uart0
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected main_uart0 pinmux

Changes from v2:
 - alphabetized phandles
 - corrected macros and node names for main_uart0 pinmux node

Changes from v3:
 - added and enabled more nodes that have been validated
 - added link to data sheet which is now public

 Changes in v4:
 - Corrected Copyright year
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 294 +++++++++++++++++++++++++++++++
 1 file changed, 294 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000..16efb60bf3260
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ * Data Sheet: https://www.ti.com/lit/pdf/sprspa1
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "k3-am62l3.dtsi"
+#include "k3-pinctrl.h"
+
+/ {
+	compatible = "ti,am62l3-evm", "ti,am62l3";
+	model = "Texas Instruments AM62L3 Evaluation Module";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_btn_pins_default>;
+
+		usr: button-usr {
+			label = "User Key";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 90 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_led_pins_default>;
+
+		led-0 {
+			label = "am62-sk:green:heartbeat";
+			gpios = <&gpio0 123 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			default-state = "on";
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	vcc_1v8: regulator-3 {
+		/* output of TPS6282518DMQ */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_sys: regulator-1 {
+		/* output of LM61460-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vmain_pd: regulator-0 {
+		/* TPS65988 PD CONTROLLER OUTPUT */
+		bootph-all;
+		compatible = "regulator-fixed";
+		regulator-name = "vmain_pd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+	bootph-all;
+
+	eeprom@51 {
+		/* AT24C512C-MAHM-T or M24512-DFMC6TG */
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins_default>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+	bootph-all;
+
+	exp1: gpio@22 {
+		compatible = "ti,tca6424";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "", "",
+			"UART1_FET_SEL", "MMC1_SD_EN",
+			"VPP_EN", "EXP_PS_3V3_EN",
+			"UART1_FET_BUF_EN", "",
+			"DSI_GPIO0", "DSI_GPIO1",
+			"", "BT_UART_WAKE_SOC_3V3",
+			"USB_TYPEA_OC_INDICATION", "",
+			"", "WLAN_ALERTn",
+			"HDMI_INTn", "TEST_GPIO2",
+			"MCASP0_FET_EN", "MCASP0_BUF_BT_EN",
+			"MCASP0_FET_SEL", "DSI_EDID",
+			"PD_I2C_IRQ", "IO_EXP_TEST_LED";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <91 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		pinctrl-0 = <&gpio0_ioexp_intr_pins_default>;
+		pinctrl-names = "default";
+		bootph-all;
+	};
+
+	exp2: gpio@23 {
+		compatible = "ti,tca6424";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_EN_SOC", "VOUT0_FET_SEL0",
+			"", "",
+			"", "",
+			"", "",
+			"WL_LT_EN", "EXP_PS_5V0_EN",
+			"TP45", "TP48",
+			"TP46", "TP49",
+			"TP47", "TP50",
+			"GPIO_QSPI_NAND_RSTn", "GPIO_HDMI_RSTn",
+			"GPIO_CPSW1_RST", "GPIO_CPSW2_RST",
+			"", "GPIO_AUD_RSTn",
+			"GPIO_eMMC_RSTn", "SoC_WLAN_SDIO_RST";
+
+		bootph-all;
+	};
+};
+
+&pmx0 {
+	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7)	 /* (B12) SPI0_D1.GPIO0_91 */
+		>;
+		bootph-all;
+	};
+
+	i2c0_pins_default: i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01cc, PIN_INPUT_PULLUP, 0) /* (B7) I2C0_SCL */
+			AM62LX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 0) /* (A7) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c1_pins_default: i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 0) /* (D7) I2C1_SCL */
+			AM62LX_IOPAD(0x01d8, PIN_INPUT_PULLUP, 0) /* (A6) I2C1_SDA */
+		>;
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0)	 /* (B2) MMC0_CLK */
+			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
+			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
+			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
+			AM62LX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (C4) MMC0_DAT4 */
+			AM62LX_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (B3) MMC0_DAT5 */
+			AM62LX_IOPAD(0x01f0, PIN_INPUT_PULLUP, 0) /* (A3) MMC0_DAT6 */
+			AM62LX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (B4) MMC0_DAT7 */
+		>;
+		bootph-all;
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0230, PIN_INPUT, 0)	 /* (Y3) MMC1_CMD */
+			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0)	 /* (Y2) MMC1_CLK */
+			AM62LX_IOPAD(0x0224, PIN_INPUT, 0)	 /* (AA1) MMC1_DAT0 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT_PULLUP, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT_PULLUP, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0234, PIN_INPUT, 0)	 /* (B6) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	uart0_pins_default: uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0)	 /* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0)	 /* (C13) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	uart1_pins_default: uart1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0180, PIN_INPUT, 2)	 /* (A8) MCASP0_AXR3.UART1_CTSn */
+			AM62LX_IOPAD(0x0184, PIN_OUTPUT, 2)	 /* (B10) MCASP0_AXR2.UART1_RTSn */
+			AM62LX_IOPAD(0x0198, PIN_INPUT, 2)	 /* (C11) MCASP0_AFSR.UART1_RXD */
+			AM62LX_IOPAD(0x019c, PIN_OUTPUT, 2)	 /* (A12) MCASP0_ACLKR.UART1_TXD */
+		>;
+		bootph-all;
+	};
+
+	usb1_default_pins: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
+		>;
+	};
+
+	usr_btn_pins_default: usr-btn-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01ac, PIN_INPUT, 7)	 /* (E12) SPI0_D0.GPIO0_90 */
+		>;
+	};
+
+	usr_led_pins_default: usr-led-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0238, PIN_OUTPUT, 7)	 /* (D24) MMC1_SDWP.GPIO0_123 */
+		>;
+	};
+};
+
+&sdhci0 {
+	/* eMMC */
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-names = "default";
+	non-removable;
+	status = "okay";
+	bootph-all;
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins_default>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pins_default>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+};
+
+&usb1 {
+	pinctrl-0 = <&usb1_default_pins>;
+	pinctrl-names = "default";
+	dr_mode = "host";
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};

-- 
2.49.0



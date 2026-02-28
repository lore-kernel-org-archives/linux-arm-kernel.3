Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B586A1048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgGK+vBDhQu7f18aXnBGn/NVn8kLUPrDOIZh/fi2Pvk=; b=oV80Wr4LoYPj0HfEBfuqmZaoEt
	7TLDpbLdeZ1EjrMUixUmzD6a+haJ0Gxl7GQgjRAaarEQ0TPS+5zM3qNNDK1gOlYF/hThK+OQHnmNV
	dISz6XtckplHdosXdR7xGNYK9XZASToaGB4oh/8du1s0pQvWyVgevNH9BOH3HhoUnu1mXUdiFWfkO
	EA515lHKlAdfwPT0qS4dBeN+jy/bD4p7cnULFzWDYMtRH7ANmlwVN3MgFR/egplsTlglBC0erauFV
	zohoS28V1ZG9gQw5EV1l415ablGD9o7fTL63TjFBSZr8j2XJyWXlDS5/TiqqqKrwMbWRsdBDVJrZk
	+mYFAseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qS-00000009IRO-3qMK;
	Sat, 28 Feb 2026 00:06:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qI-00000009ILj-2Ive
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 049346111B;
	Sat, 28 Feb 2026 00:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA65C19422;
	Sat, 28 Feb 2026 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237157;
	bh=9p7mEMFwI0uT2Kge54+JeVOVj4NaXv5pJH3iDDElDm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VpyGo/WSp31SO8i4d0ibydEtt8LJOJZhWgMMTau0GuL61wh8UK9Pks5GPJCs8+WBg
	 kJPogk7XxKw3t/kyy4EeTyQFPpKg0vzyGWfnaql16uGuh8l+gPfDE7xwAVS07nLIWt
	 MVW53oygyl94l76LclnB53KG56u++z+AC+5w9hdsW08aGbOMh+BFomxT/6PV36mIhk
	 GEe/UUILh/2c82GokebIDkHtkElK4DXZYV/lm1psXmoYktN6cnsqXlgSGC/voo1ioV
	 eyXUvCsYbUHWXqfNG5GmUcx+o4KFWu8BTUhs3mK7tJ+9qAm2FhPASvHHfHdV7//Pul
	 CgCqfx+mcPFUg==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:46 +0100
Subject: [PATCH 6/8] ARM: dts: Add a Verbatim Gigabit NAS DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-6-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This adds a device tree for the Verbatim S08V1901-D1 NAS
which also has the product names "Gigabit Network Hard Drive"
"Gigabit NAS" and maybe other names.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/Makefile                  |   1 +
 .../dts/gemini/gemini-verbatim-s08v1901-d1.dts     | 225 +++++++++++++++++++++
 2 files changed, 226 insertions(+)

diff --git a/arch/arm/boot/dts/gemini/Makefile b/arch/arm/boot/dts/gemini/Makefile
index f9f63ce3eb49..d5d32f02e232 100644
--- a/arch/arm/boot/dts/gemini/Makefile
+++ b/arch/arm/boot/dts/gemini/Makefile
@@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-sl93512r.dtb \
 	gemini-sq201.dtb \
 	gemini-ssi1328.dtb \
+	gemini-verbatim-s08v1901-d1.dtb \
 	gemini-wbd111.dtb \
 	gemini-wbd222.dtb
diff --git a/arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dts b/arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dts
new file mode 100644
index 000000000000..2a689d276863
--- /dev/null
+++ b/arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dts
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for the Verbatim S08V1901-D1
+ * on product packaging called "Verbatim Gigabit Ethernet Hard Drive"
+ */
+
+/dts-v1/;
+
+#include "gemini.dtsi"
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Verbatim Gigabit Ethernet Hard Drive S08V1901-D1";
+	compatible = "verbatim,s08v1901-d1", "cortina,gemini";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		/* 64MB SDRAM in 2 x Hynix HY5DU561622ETP-D43 */
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,19200n8 root=/dev/sda1 rw rootwait";
+		stdout-path = &uart0;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		button-reset {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <KEY_RESTART>;
+			label = "reset";
+			gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green-harddisk {
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			linux,default-trigger = "disk-activity";
+		};
+	};
+
+	/*
+	 * Fan control candidates: gpio0 10, gpio1 28
+	 */
+
+	mdio0: mdio {
+		compatible = "virtual,mdio-gpio";
+		/* Uses MDC and MDIO */
+		gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>, /* MDC */
+			<&gpio0 21 GPIO_ACTIVE_HIGH>; /* MDIO */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* This is a Realtek RTL8211CL ethernet PHY */
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+
+	/*
+	 * I haven't found a way to control the fan, it appears to be
+	 * always on.
+	 */
+	thermal-zones {
+		chassis-thermal {
+			/* Poll every 20 seconds */
+			polling-delay = <20000>;
+			/* Poll every 2nd second when cooling */
+			polling-delay-passive = <2000>;
+			/*  Use the thermal sensor in the hard drive */
+			thermal-sensors = <&drive0>;
+
+			/* Tripping points from the fan.script in the rootfs */
+			trips {
+				alert: chassis-alert {
+					/* At 43 degrees turn on the fan */
+					temperature = <43000>;
+					hysteresis = <3000>;
+					type = "active";
+				};
+				crit: chassis-crit {
+					/* Just shut down at 60 degrees */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	soc {
+		flash@30000000 {
+			/*
+			 * This is a Spansion S29GL128P11TFI01 852FB245 A
+			 * 128Mbit (16MB) Flash memory.
+			 */
+			status = "okay";
+			reg = <0x30000000 0x01000000>;
+
+			partitions {
+				compatible = "redboot-fis";
+				/* Eraseblock at 0xfe0000 */
+				fis-index-block = <0x7f>;
+			};
+		};
+
+		syscon: syscon@40000000 {
+			pinctrl {
+				/*
+				 * gpio0agrp cover line 0-4 as line 1 is used for the LED
+				 * gpio0hgrp cover line 21, 22 used by MDIO for Marvell PHY
+				 */
+				gpio0_default_pins: pinctrl-gpio0 {
+					mux {
+						function = "gpio0";
+						groups = "gpio0agrp", "gpio0hgrp";
+					};
+				};
+				gpio1_default_pins: pinctrl-gpio1 {
+					/*
+					 * Free up the TVC pins at GPIO1 offset 28,29,30,31
+					 * line 31 is used for reset key
+					 */
+					mux {
+						function = "gpio1";
+						groups = "gpio1dgrp";
+					};
+				};
+				pinctrl-gmii {
+					mux {
+						function = "gmii";
+						groups = "gmii_gmac0_grp";
+					};
+					/* TODO: investigate vendor registers on boot */
+					conf0 {
+						pins = "V8 GMAC0 RXDV";
+						skew-delay = <0>;
+					};
+					conf1 {
+						pins = "Y7 GMAC0 RXC";
+						skew-delay = <15>;
+					};
+					conf2 {
+						pins = "T8 GMAC0 TXEN";
+						skew-delay = <7>;
+					};
+					conf3 {
+						pins = "U8 GMAC0 TXC";
+						skew-delay = <10>;
+					};
+					conf4 {
+						/* The data lines all have default skew */
+						pins = "W8 GMAC0 RXD0", "V9 GMAC0 RXD1",
+						       "Y8 GMAC0 RXD2", "U9 GMAC0 RXD3",
+						       "T7 GMAC0 TXD0", "U6 GMAC0 TXD1",
+						       "V7 GMAC0 TXD2", "U7 GMAC0 TXD3";
+						skew-delay = <7>;
+					};
+				};
+			};
+		};
+
+		/* Both interfaces brought out on SATA connectors */
+		sata: sata@46000000 {
+			cortina,gemini-ata-muxmode = <0>;
+			cortina,gemini-enable-sata-bridge;
+			status = "okay";
+		};
+
+		gpio0: gpio@4d000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio0_default_pins>;
+		};
+
+		gpio1: gpio@4e000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio1_default_pins>;
+		};
+
+		ethernet@60000000 {
+			status = "okay";
+
+			ethernet-port@0 {
+				phy-mode = "rgmii";
+				phy-handle = <&phy0>;
+			};
+		};
+
+		ide@63000000 {
+			status = "okay";
+			/*
+			 * This drive may have a temperature sensor with a
+			 * thermal zone we can use for thermal control of the
+			 * chassis temperature using the fan.
+			 */
+			drive0: ide-port@0 {
+				reg = <0>;
+				#thermal-sensor-cells = <0>;
+			};
+		};
+
+		ide@63400000 {
+			status = "okay";
+		};
+
+		usb@68000000 {
+			status = "okay";
+		};
+
+		usb@69000000 {
+			status = "okay";
+		};
+	};
+};

-- 
2.53.0



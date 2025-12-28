Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE22E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWdq1121On+zHQXG6HCHDN0p8dszNV3x/qE2GRn9tLo=; b=DtblMbtHo1yyrNZzuWNBbOKP8M
	VcnmjUu1kq+LRqYfkcc7xMbQF8xVYo2MByryu9DsJzWZXwdvsan61rYZjS9F5Tc3DomO2KSJGf2qR
	na1T0aUoWtTFM5yNuMuN9+wTA8XJtwloY3LBNGt/pwZCZF36CYskbiKAcd3dQO1BjUZshuoUc8qSz
	tNh+p4218DbutLe6PA3Ih1Svn7AJL10w3r1Gxtd8O14ynOGKre4j4h6BXSYOEVOTesL/VpcFO5Gkg
	ZNwzRbk05stNOVtm3kZgl3MFJzYrD4jDCZoCv7l6hnz2ZhaU9YbwNQkV9vOlbJ2huQAOSsqyRiGAr
	ArTbxEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZohE-00000002erk-3eAd;
	Sun, 28 Dec 2025 11:12:24 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZohA-00000002erL-3Twu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 11:12:22 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:bcd2:711:8d84:5cfc])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id D143F19F733;
	Sun, 28 Dec 2025 12:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1766920335;
	bh=Fl5JxQlSG/4TBN+uloXQEyJwJmsC7jS4ncPBTO3NBFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FJEJJGAbXCI7+6xRIs857Wq5RWEOafAHQooOf5DVbDPi59bkGYihzlT/xRnoazKhs
	 7LzzJIOMkfpUrvJBxBfHYpzSZtKzhqHxkKWXf3hjQgFo5+al7GnJrS6snfmhfN6DVc
	 0mv4p6tEuBev4k4SWKXweikmQrSG2/It3PWU8aBE6j1j+czUmdLqtYXFGyf8Ux+cIN
	 0BACwgCY0MGaQUFkWbXUXfYFm3uJsvwBGO0fF/+4Qruv0WkrtdT9DxYeK+0hy4TJ7k
	 hx2mVHnnWONXwq4Tghi6uv82H5ekWm9gXA+DFeeIU8ZFQzyZc1Bkl6tkbwu47gFEAl
	 N7YywZkgZLHaQ==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Rob Herring" <robh@kernel.org>,  "Geert Uytterhoeven"
 <geert+renesas@glider.be>,  "Magnus Damm" <magnus.damm@gmail.com>,
  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  "Daniel Mack" <daniel@zonque.org>,  "Haojian
 Zhuang" <haojian.zhuang@gmail.com>,  "Andrew Lunn" <andrew@lunn.ch>,
  "Gregory Clement" <gregory.clement@bootlin.com>,  "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>,  Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
In-Reply-To: <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 17 Dec 2025 17:04:05 +0100")
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
	<35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Sun, 28 Dec 2025 12:11:59 +0100
Message-ID: <m2wm26lv28.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_031221_429119_EBC6F68B 
X-CRM114-Status: GOOD (  22.85  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> Robert, let me know if you or someone else is able to spend
> some time on sending (warning-free) dts files for pxa2xx
> machines soon. If not, I'd plan to remove whatever is there
> along with the board files and drivers.

Here is one attached, the previously mentioned mioa701 board dts 
file
I've been using for years (the date of the patch should be funny
enough). It was first submitted here :
  https://lkml.org/lkml/2018/9/15/321

I'm not very sure pxa25x and pxa27x should survive though. Lately, 
the
platform which I have left have 64MB of RAM, and cannot cope with 
recent
binaries sizes. And to my best knowledge, pxa2xx architecture are 
not
built anymore nor supported ...
The drivers might still be useful (the DMA, the SPI for intel CPU, 
...).

Cheers.

--
Robert

-- >8 --
From a3cbbe846c4651d71edcf36d114f5e48f4455347 Mon Sep 17 00:00:00 
2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 1 Sep 2014 13:26:56 +0200
Subject: [PATCH] arm: dts: add mioa701 board description

Add device-tree description of the Mitac MIO A701 board.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/intel/pxa/Makefile    |   1 +
 arch/arm/boot/dts/intel/pxa/mioa701.dts | 309 
 ++++++++++++++++++++++++
 2 files changed, 310 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/pxa/mioa701.dts

diff --git a/arch/arm/boot/dts/intel/pxa/Makefile 
b/arch/arm/boot/dts/intel/pxa/Makefile
index 24d5240f08e7..29670ec5861b 100644
--- a/arch/arm/boot/dts/intel/pxa/Makefile
+++ b/arch/arm/boot/dts/intel/pxa/Makefile
@@ -6,3 +6,4 @@ dtb-$(CONFIG_ARCH_PXA) += \
 	pxa300-raumfeld-speaker-m.dtb \
 	pxa300-raumfeld-speaker-one.dtb \
 	pxa300-raumfeld-speaker-s.dtb
+dtb-$(CONFIG_ARCH_PXA) += mioa701.dtb
diff --git a/arch/arm/boot/dts/intel/pxa/mioa701.dts 
b/arch/arm/boot/dts/intel/pxa/mioa701.dts
new file mode 100644
index 000000000000..b8a27e6db2b2
--- /dev/null
+++ b/arch/arm/boot/dts/intel/pxa/mioa701.dts
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright (C) Robert Jarzmik <robert.jarzmik@free.fr>
+ *
+ *  This program is free software; you can redistribute it and/or 
modify
+ *  it under the terms of the GNU General Public License version 
2 as
+ *  publishhed by the Free Software Foundation.
+ */
+
+/dts-v1/;
+#include "pxa27x.dtsi"
+#include "dt-bindings/gpio/gpio.h"
+
+#define PMGROUP(pin) #pin
+#define PMMUX(func, pin, af)			\
+	mux- ## func {				\
+		groups = PMGROUP(P ## pin);	\
+		function = #af;			\
+	}
+#define PMMUX_LPM_LOW(func, pin, af)		\
+	mux- ## func {				\
+		groups = PMGROUP(P ## pin);	\
+		function = #af;			\
+		low-power-disable;		\
+	}
+#define PMMUX_LPM_HIGH(func, pin, af)		\
+	mux- ## func {				\
+		groups = PMGROUP(P ## pin);	\
+		function = #af;			\
+		low-power-enable;		\
+	}
+
+/ {
+	model = "Mitac Mio A701 Board";
+	/* compatible = "mitac,mioa701"; */
+	compatible = "marvell,pxa270";
+
+	chosen {
+		bootargs = 
"mtdparts=docg3.0:256k@3456k(barebox)ro,256k(barebox-logo),128k(barebox-env),4M(kernel),-(root) 
ubi.mtd=4 rootfstype=ubifs root=ubi0:linux_root ro";
+	};
+
+	memory {
+		reg = <0xa0000000 0x04000000>;
+
+		reserved-memory {
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pstore_region:region@a2000000 {
+				compatible = 
"linux,contiguous-memory-region";
+				reg = <0xa2000000 1048576>;
+			};
+		};
+	};
+
+	cpus {
+		cpu {
+			cpu-supply = <&vcc_core>;
+		};
+	};
+
+	pxabus {
+		pinctrl: pinctrl@40e00000 {
+			status = "okay";
+			pinctrl_mmc_default: mmc-default {
+				PMMUX(sd-insert, 15, gpio_in);
+				PMMUX(mmclk, 32, MMCLK);
+				PMMUX(sd-ro, 78, gpio_in);
+				PMMUX(sd-enable, 91, gpio_out);
+				PMMUX(mmdat0, 92, MMDAT<0>);
+				PMMUX(mmdat1, 109, MMDAT<1>);
+				PMMUX(mmdat2, 110, MMDAT<2>);
+				PMMUX(mmdat3, 111, MMDAT<3>);
+				PMMUX(mmcmd, 112, MMCMD);
+			};
+			pinctrl_leds_default: leds-default {
+				PMMUX(led-charging, 10, gpio_out);
+				PMMUX(led-vibra, 82, gpio_out);
+				PMMUX(led-blue, 97, gpio_out);
+				PMMUX_LPM_LOW(led-orange, 98, 
gpio_out);
+				PMMUX_LPM_HIGH(led-keyboard, 115, 
gpio_out);
+			};
+		};
+
+		gpio: gpio@40e00000 {
+			status = "okay";
+		};
+
+		uart@40100000 {
+			status = "okay";
+		};
+
+		uart@40200000 {
+			status = "okay";
+		};
+
+		uart@40700000 {
+			status = "okay";
+		};
+
+		usb2phy: gpio-vbus@13 {
+			compatible = "usb-nop-xceiv";
+			vbus-detect-gpio = <&gpio 13 
GPIO_ACTIVE_LOW>;
+			#phy-cells = <0>;
+			wakeup;
+		};
+
+		pxa27x_udc: udc@40600000 {
+			    status = "okay";
+			    gpios = <&gpio 22 0>;
+			    phys = <&usb2phy>;
+			    phys-names = "usb2phy";
+		};
+
+		i2c@40f00180 {
+			status = "okay";
+
+			max1586@14 {
+				compatible = "maxim,max1586";
+				reg = <0x14>;
+				#address-cells = <0x1>;
+				#size-cells = <0x1>;
+				v3-gain = <1000000>;
+
+				regulators {
+					vcc_core: v3 {
+						regulator-name = 
"vcc_core";
+ 
regulator-compatible = "Output_V3";
+ 
regulator-min-microvolt = <1000000>;
+ 
regulator-max-microvolt = <1705000>;
+ 
regulator-always-on;
+					};
+				};
+			};
+		};
+
+		pxai2c1: i2c@40301680 {
+			mrvl,i2c-fast-mode;
+			status = "okay";
+
+			mt9m111: camera@5d {
+				compatible = "micron,mt9m111";
+				reg = <0x5d>;
+				gpios = <&gpio 56 
GPIO_ACTIVE_HIGH>;
+			};
+		};
+
+		keypad: keypad@41500000 {
+			status = "okay";
+
+			keypad,num-rows = <3>;
+			keypad,num-columns = <3>;
+			linux,keymap = <
+				0x00000067	/* KEY_UP */
+				0x0001006a	/* KEY_RIGHT */
+				0x000200e2	/* KEY_MEDIA */
+				0x0100006c	/* KEY_DOWN */
+				0x0101001c	/* KEY_ENTER */
+				0x010200da	/* KEY_CONNECT */
+				0x02000069	/* KEY_LEFT */
+				0x020100a9	/* KEY_PHONE */
+				0x020200d4>;	/* KEY_CAMERA */
+			marvell,debounce-interval = <0>;
+		};
+
+		gpio-keys {
+			compatible = "gpio-keys";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			autorepeat;
+			status = "okay";
+
+			button@0 {
+				label = "GPIO Key Power";
+				linux,code = <174>;
+				gpios = <&gpio 0 0>;
+				gpio-key,wakeup;
+			};
+			button@12 {
+				label = "HP jack detect";
+				linux,code = <211>;
+				gpios = <&gpio 12 0>;
+			};
+			button@93 {
+				label = "Volume Up Key";
+				linux,code = <115>;
+				gpios = <&gpio 93 0>;
+			};
+			button@94 {
+				label = "Volume Down Key";
+				linux,code = <114>;
+				gpios = <&gpio 94 0>;
+			};
+		};
+
+		mmc0: mmc@41100000 {
+			vmmc-supply = <&reg_vmmc>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_mmc_default>;
+			status = "okay";
+		};
+
+		pxa_camera: imaging@50000000 {
+			status = "okay";
+		};
+
+		lcd-controller@40500000 {
+			status = "okay";
+			port {
+				lcdc_out: endpoint {
+					remote-endpoint = 
<&panel_in>;
+					bus-width = <16>;
+				};
+			};
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_vmmc: regulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "vmmc";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 40960000>;
+		pwm-names = "backlight";
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <2>;
+	};
+
+	docg3: flash@0 {
+		compatible = "m-systems,diskonchip-g3";
+		reg = <0x0 0x2000>;
+	};
+
+	panel {
+		compatible = "toshiba,ltm0305a776";
+		lcd-type = "color-tft";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
+		};
+
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: 240p {
+				/* 240x320p24 */
+				clock-frequency = <4545000>;
+				hactive = <240>;
+				vactive = <320>;
+				hfront-porch = <4>;
+				hback-porch = <6>;
+				hsync-len = <4>;
+				vback-porch = <5>;
+				vfront-porch = <3>;
+				vsync-len = <2>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds_default>;
+
+		charger-led {
+			label = "mioa701:charging";
+			gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		vibrator {
+			label = "mioa701:vibra";
+			gpios = <&gpio 82 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		bluetooth-led {
+			label = "mioa701:blue";
+			gpios = <&gpio 97 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		orange-led {
+			label = "mioa701:orange";
+			gpios = <&gpio 98 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		keyboard-led {
+			label = "mioa701:keyboard";
+			gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+};
-- 
2.50.1 (Apple Git-155)



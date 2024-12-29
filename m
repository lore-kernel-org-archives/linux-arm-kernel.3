Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F841E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEKvlrGBfQ3i/toVzOy0uGRkS1fjYIOhUZvv0D44E2Q=; b=KiqnGRB64xUjWe4VWC52MRflfz
	SBU5tNd63i23L5DPqLKUPh3PM4YjhjEGLD6j9uTZAUsv40VADquPY00slzvGy8vS+xws0aWdqz++5
	2IeoH+BKCQy4faA3pnfrDbbIqcfjgr7GbbFv1qhs/lV9GljaGcIar5D4XyNHR67GThXNTSrhcBr5X
	pVtIsb5CeD/UUYg4jM81SsgvfjqQ4B5w5qlzmg4WFnSEn8qX3ymLVGaMN6r+nOr923wx2Wj4wjW5g
	9+kiqHySeSka2WRAgoJOruNXO3pNuhUoR8CULGR0P4Mnd+W7JLAuGTf1seBiugA6VbowwdofwA4FC
	LjoujZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyL9-00000003leH-11yl;
	Sun, 29 Dec 2024 18:48:39 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyH1-00000003l7j-1wLo;
	Sun, 29 Dec 2024 18:44:24 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3ebb1652729so4684848b6e.3;
        Sun, 29 Dec 2024 10:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497862; x=1736102662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEKvlrGBfQ3i/toVzOy0uGRkS1fjYIOhUZvv0D44E2Q=;
        b=mH6NlFFW9tL0K8gUmiFcLSScpjlUtukftqvjdKxLg9RCKhrh89rS8jqCayPTTaI/QA
         PLqGbMlpiK11yxmW/DgbMrJIzOwgceAgke3G3+5iN/r9+XjfEKPxrfYy7mUT0a7qGhbm
         hATnAmKQ1abD3mAOJJ6qyE1LKpPJ8Cd8+IscKXHMS4bH+T+UiAXvmzoN/S+of3vtY81G
         B6icv7jXPS7mChOk4GdRPtyHhYIBGiFzbD9lis6IieFYnlIx8uqSIRj/5nUuLUFPu3Sm
         heN8v5LRJ5WZAuA8e3gD75SWtp1cBHzdMj8yPkK1JVdeEWdygOZjn2uT16J3c9GyXynp
         2Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497862; x=1736102662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEKvlrGBfQ3i/toVzOy0uGRkS1fjYIOhUZvv0D44E2Q=;
        b=uSMjHZwNcxQm1rdQIZjDVbKY4iveEfCabqgz/lDu8ZHoyn5hR+yA9dOwQuRgdwkgb5
         0GtDuRObGdgopinrkIU54pkcqPjFeXQqQm7B4ScOK088WIZzzVreOvy299Cna8k81mWn
         i+dl36YZtF2TvmQjYFS/MI8+RjXUZoCIrHuwCIDlfDW1FBXDpVGAQ8GoOXj1crVXXTbz
         sZo6Z9wsxazmn49E3k0hO682bPGfrsfuxKjbiYgnR9kiaxqiRvzAXt1k+7wEkauv46rL
         c7KYCfXzc6KVouM3b6nOXAVHPdC4Wnr0zYX/UfP1KdNBaRhZdHhx1g2X8sy058TAikOC
         xE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0bTWLmzFw+mFl47lTSRoPOMTn2tDigRrPvEAL+cygGlF/qbTPvoVrHCkyB2IyC2NbyHNvTNhDGgq3jjorj/4p@lists.infradead.org, AJvYcCVPbaQa4pwSXs9eNIKRtiMY2zx3vysIs+ccI3ed8hJL4Q8LaA6sny8pyWB8vkyAB0NyUvdyNlBJOm+q81HlCQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtQxRNi7A+K24AwntwClMvsO4yfyfk9s1JlMExXwiwHVfHyL/0
	wXjwSc5vYfYq7rSvgwonzw1VPssVijdQBpwqZQupkEnbhr5osBES
X-Gm-Gg: ASbGncvWmyZjDwGbiCbO3eGLIMhaTQCfuKAxqQBa2EtqQL8QZmpI3TdBTyMKnzIenjC
	tNO+L7uoze8BGlSMtiCJCDf1yOkzpZh/YQxnt2dOMDUQdPE9+nnLZ0On++BUPpnJwsZgufU/+XC
	pOC1cq67onkmWXqV6FTEyZJcHRep4Sk/tTWPT1wxT+WYM9p51qg9V9FhojOJuSF4xEL5/pWOWko
	tHs4m5JBtINhLunITz34Lrn+1TIcRPRR+ptWAl9uvMavEPkCReiv0XqKnShge3A
X-Google-Smtp-Source: AGHT+IHXVoTWqslzerWOc8JEAEQJkAO4xaCucnBeWVbar8czJv7T/PY6AFVfzy0KwQ2g7QYNMUjZ9g==
X-Received: by 2002:a05:6870:ff84:b0:2a3:be8a:eebb with SMTP id 586e51a60fabf-2a7fb54149bmr18739636fac.35.1735497862315;
        Sun, 29 Dec 2024 10:44:22 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:44:21 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 3/7] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Sun, 29 Dec 2024 12:41:28 -0600
Message-ID: <20241229184256.1870-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104423_504604_17E2F14E 
X-CRM114-Status: GOOD (  16.40  )
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

The RK3588 Single Board Computer includes
- eMMC
- microSD
- UART
- 2 PWM LEDs
- RTC
- RTL8125 network controller on PCIe 2.0x1.
- M.2 M-key connector routed to PCIe 3.0x4
- PWM controlled heat sink fan.
- 2 USB2 ports
- lower USB3 port
- upper USB3 port with OTG capability
- Mali GPU
- SPI NOR flash
- Mask Rom button
- Analog audio using es8388 codec via the headset jack and onboard mic
- HDMI0

the vcc5v0_usb30 regulator shares the same enable gpio pin as the
vcc5v0_usb20 regulator.

The Orange Pi 5 Max and Orange Pi 5 Ultra are both credit-card sized
boards with similar layout. The 5 Max has an extra HDMI0 while the 5
Ultra has a HDMI IN instead.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 126 ++++++++++++++++++
 .../dts/rockchip/rk3588-orangepi-5-max.dts    |  60 +++++++++
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  |   8 ++
 4 files changed, 195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 86cc418a2255..83ad11650f0b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -142,6 +142,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
new file mode 100644
index 000000000000..205130a3efec
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3588-orangepi-5.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Max";
+	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
+};
+
+&headphone_amp {
+	/* PHONE_CTL */
+	enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+};
+
+&analog_sound {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hp_detect>;
+	simple-audio-card,aux-devs = <&headphone_amp>;
+	simple-audio-card,hp-det-gpios = <&gpio3 RK_PD2 GPIO_ACTIVE_HIGH>;
+
+	simple-audio-card,routing =
+		"Headphones", "LOUT1",
+		"Headphones", "ROUT1",
+		"LINPUT1", "Microphone Jack",
+		"RINPUT1", "Microphone Jack",
+		"LINPUT2", "Onboard Microphone",
+		"RINPUT2", "Onboard Microphone";
+	simple-audio-card,widgets =
+		"Microphone", "Microphone Jack",
+		"Microphone", "Onboard Microphone",
+		"Headphone", "Headphones";
+};
+
+&fan {
+	/* FAN_CTL_H */
+	pwms = <&pwm9 0 50000 0>;
+};
+
+&hym8563 {
+	interrupt-parent = <&gpio0>;
+	interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_int_l>;
+};
+
+&led_blue_pwm {
+	/* PWM_LED1 */
+	pwms = <&pwm4 0 25000 0>;
+	status = "okay";
+};
+
+&led_green_pwm {
+	/* PWM_LED2 */
+	pwms = <&pwm5 0 25000 0>;
+};
+
+/* phy2 */
+&pcie2x1l1 {
+	reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie_eth>;
+	status = "okay";
+};
+
+&pinctrl {
+	hym8563 {
+		rtc_int_l: hym8563-int {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4m0_pins>;
+	status = "okay";
+};
+
+&pwm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm5m1_pins>;
+	status = "okay";
+};
+
+&pwm9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm9m2_pins>;
+	status = "okay";
+};
+
+&sfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fspim2_pins>;
+};
+
+/* pcie eth. not a real regulator. 33VAUX */
+&vcc3v3_pcie_eth {
+	/* Ethernet_power_en */
+	gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+};
+
+/*
+ * Represents the vcc5v0_usb20 and vcc5v0_usb30 in the schematic,
+ * both regulators share the same enable gpio
+ */
+&vcc5v0_usb20 {
+	/* USB_HOST_PWREN */
+	gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_host_pwren>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
new file mode 100644
index 000000000000..ce44549babf4
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588-orangepi-5-compact.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Max";
+	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+};
+
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
+&pinctrl {
+
+	usb {
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index d72afd368d8b..df9b0fd18e24 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -83,6 +83,14 @@ fan: pwm-fan {
 	pwm-leds {
 		compatible = "pwm-leds";
 
+		led_blue_pwm: led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			status = "disabled";
+		};
+
 		led_green_pwm: led-2 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_INDICATOR;
-- 
2.47.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6427FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 02:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJQAy3BxAyAql6qJ6WyN7ZjWVDcE32LcZZWWfeBFk0s=; b=tnHBdcPDiNydd7a9RGlUYo1ZK3
	ejjqAUgCQE+o6E9RmO6mtiePEYlxZx3dRxHCk78leeZ8WeWhgTziMMn1ZDRE9Tv0Sp3Z3u+OZ2ITM
	oPof/g9skfNJTL+OMTJIUV/pPOgMS0ge2sCiovuYDr6slIOHIb6mIr3iaAgud4JrEg/7F6h2AjTr2
	dVMiQsjgMUxS9MXqp+CE4YddU2DHUUn5AO46mqOmKUNInHsyYtWuJ5GrOe0qnjndxEChLLSEuTElT
	H2MJrvLouMBGRMCXb4sLirgC35Epw40h2DJx7vOMtHPutR2MSmvOQOMvi531MkWO5rrUSCTn0EOzA
	FzZeeFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtdV-0000000ELnM-2N6T;
	Sat, 04 Jan 2025 02:11:33 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtYV-0000000ELEG-3936;
	Sat, 04 Jan 2025 02:06:24 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e2764aa46so7654600a34.2;
        Fri, 03 Jan 2025 18:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735956382; x=1736561182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJQAy3BxAyAql6qJ6WyN7ZjWVDcE32LcZZWWfeBFk0s=;
        b=IzVkJZauyerCrgqSJmKzl25xpl1V2MPF7vMqr/RFKDHpGwp0oBFgB8RHerFS6HjkIS
         FWFtNHeoa/b5YKgLlsg78iy/E5oBHUWbPThkOn8IUNhiN021bCP795zHip6ZGNSpQVPp
         AaakPDaO2oLxWR2HKC8GV4Yq+kV17sjQLTogdekxv3T0yr33jD3VJvWihiFss58PeJcR
         3AwuRHHGvc1QltR43pgMJ6vWSLznlrkw7G+HiSMV43Y8qvwHfahLgsvClgBjDLEvID0o
         tYGLVYjxW2HadQMaTb9Tuum6bGJKHCqfweqh9nrSpgsEQ4qkJbBgYfPP9MNmIsscdU5d
         pUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735956382; x=1736561182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJQAy3BxAyAql6qJ6WyN7ZjWVDcE32LcZZWWfeBFk0s=;
        b=eRTAOQ9v0m9ehkguCsQUXv3+rqtym6Qg1tHXFEgs8A9Ifa4RcIpd/Pbc7cpIAFB464
         nCP5TIpQTkamCkz5TsiInLLGAezjcnPzW0msoXkxP+3kObJXSnqGODafhPLJwfVKZ2jA
         VG1PkJpLA/6nIOQZvzlccY5NuRmzXoUHs9CbkuZz3CI3zqiLcP5TwL2JYIJQuglJ+yN3
         y+4YoKYSOg6d2p5t3S3B2kLFhBaIP10HmICnzCz9SQYP25c6n2BUsJ6moNuyjY/xKZ6/
         Gf4SlIzMiB2U+41LyOcXe8QT74b2B+FMg4aiBWcDVUOtMmyeETYlNx9gu02Whwgyn/Xz
         KjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8eI58kKE0IK4K+ZaukPIu/4lhTj3XXQe1CCuyNVCRs1+qvOYkjE4UYbgFkWMhfcSkCcgqLu5LpRflC/w/pkU=@lists.infradead.org, AJvYcCXy37kVuukwh2MGHPlmdtZ/4t1K2hpp2NuHJA1lNSInR5g3PZbERaH7oqCNP0xdFcKuOmold6WIk0aCar/kTNxH@lists.infradead.org
X-Gm-Message-State: AOJu0YxFOYw3ejcdZJ5Qg1uLzPQF+VUua17y/cfwLD1X1fncNzALNyep
	BCszkSwyj+ubOaFwd7WyqMewCK6DC5eMs8AtM7gICFxhsE2ZuhcF
X-Gm-Gg: ASbGnctwzb+AjbYHwK71MgKjMN76/FlgtrJiNpi1yWgt2X7ORmuPd+o0zhCQxvI5Qfz
	WHPV6Q5Sfte0wxZyxibf+z5g86t6PtIia0MrNTDh1KgSjoCnQ8Uk0cwOH0+8t57I4PF7nFQJGvM
	fBq0iZ483rSOAJkxNgfjWlV56QdqaPCchik5rGy6TAImTmauvIENkuL1Q4DN9c7RmMXfMfFLAky
	tY7WI1Fmnfl4U6VAz3ESh1PPdedouRMIcNoBlinrAfAgn2JX2xxHPWcfgTkp1S8kQ==
X-Google-Smtp-Source: AGHT+IFxla2wi9+2MZLYqLfEmIzn0x25ZZtaA9kejf6IB3lsqJBdpsCHEKJJJ9C03V+ZEBoQ080kzw==
X-Received: by 2002:a05:6830:2115:b0:71e:240a:4828 with SMTP id 46e09a7af769-720ff7fc514mr32937721a34.16.1735956382636;
        Fri, 03 Jan 2025 18:06:22 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:7057:8598:1940:24f4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc998ef6asm8406568a34.50.2025.01.03.18.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 18:06:21 -0800 (PST)
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
Subject: [PATCH v6 3/4] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Fri,  3 Jan 2025 20:05:39 -0600
Message-ID: <20250104020544.6777-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104020544.6777-1-honyuenkwun@gmail.com>
References: <20250104020544.6777-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_180623_788649_6A4B7B41 
X-CRM114-Status: GOOD (  16.39  )
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
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++++++++++++++++
 .../dts/rockchip/rk3588-orangepi-5-max.dts    |  60 +++++++
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  |   8 +
 4 files changed, 220 insertions(+)
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
index 000000000000..b5bf5e5bc5fb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -0,0 +1,151 @@
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
+
+	vcc5v0_usb30_otg: vcc5v0-usb30-otg-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* USB_OTG_PWREN */
+		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_pwren>;
+		regulator-name = "vcc5v0_usb30_otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+       };
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
+&u2phy0_otg {
+	phy-supply = <&vcc5v0_usb30_otg>;
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_usb20>;
+};
+
+&usb_host0_xhci {
+	dr_mode = "host";
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
index 083d7f78b19a..a98e804a0949 100644
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



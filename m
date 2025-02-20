Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B741C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM0rzE+8fltEX9kN3V0aSjtxrQePtogKtfnuFFchkdM=; b=FreBt3i5BvWy1q1OtwlYlSxvZ2
	Xrf2R7N74pEbitPlJqo4d3Kq8qVILhrLOGcW1kXBa1+jTpdFf3Hgjo5QQyeJmTfs1nP/n9+/509WV
	lrlp2aRjJFBBduGOcDnlQtED7Jxe+01EcN7bh096hkVXfny2LzUsUFxHSgS4K2Q6jpTVL5fgKIGdw
	B1iD/eIAQb5cT8Gx9uI+QFb/0FaQHSUjc2NV8piWWyv+PQ+BA4Bg3+aS9/wAo1mCyYJr6R5eCNJ0Q
	JSeXQODtgaMuWvpFAVQ0hs4cr//S6y9CPZ8zyWb7HGdHm7iDv4Y7M8wMKrzjFJu4ZocIi4Gkyd2CN
	VL2NqDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5kl-00000000pEH-1AJg;
	Thu, 20 Feb 2025 12:34:07 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Xk-00000000koh-0QCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:20:42 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YzC5d0BYnzmGV;
	Thu, 20 Feb 2025 13:20:37 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YzC5c2rkSzGKM;
	Thu, 20 Feb 2025 13:20:36 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 20 Feb 2025 13:20:12 +0100
Subject: [PATCH 3/5] arm64: dts: rockchip: add support for
 HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-ringneck-dtbos-v1-3-25c97f2385e6@cherry.de>
References: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
In-Reply-To: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042040_304673_DDDB55C1 
X-CRM114-Status: GOOD (  14.41  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The HAIKOU-LVDS-9904379 adapter is an adapter for PX30 Ringneck with the
Haikou carrierboard. It is to be inserted in the fake PCIe slot labelled
Video Connector.

This adapter expects an Admatec 9904379 1024x600 LVDS display with
backlight and touchscreen. An EEPROM is also found on the adapter.

This adds support for this adapter on PX30 Ringneck when inserted in
Haikou carrierboard.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../px30-ringneck-haikou-lvds-9904379.dtso         | 130 +++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e4d9c48b95bba204f50697480d06e9a4071e56d3..b40b82bd07223f542c17704e7844f002bb31e1c5 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2-of10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-firefly-jd4-core-mb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-lvds-9904379.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-bpi-p2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
@@ -191,6 +192,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
 # result of the application of <overlay-1>.dtbo and other listed overlays on top
 # of <base>.dtb.
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-haikou-lvds-9904379.dtb
+px30-ringneck-haikou-haikou-lvds-9904379-dtbs := px30-ringneck-haikou.dtb \
+	px30-ringneck-haikou-lvds-9904379.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-lvds-9904379.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-lvds-9904379.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3fc088a5636a24b40a8536b28a210fce79f6d333
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-lvds-9904379.dtso
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ *
+ * HAIKOU-LVDS-9904379 adapter for PX30 Ringneck and Haikou carrierboard.
+ *
+ * This adapter needs to be plugged in the fake PCIe connector called Video
+ * Connector on Haikou carrierboard.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 255>;
+		default-brightness-level = <255>;
+		num-interpolated-steps = <255>;
+		power-supply = <&vcc3v3_baseboard>;
+		pwms = <&pwm0 0 25000 0>;
+	};
+
+	panel {
+		compatible = "admatec,9904379", "panel-lvds";
+		backlight = <&backlight_lvds>;
+		data-mapping = "vesa-24";
+		height-mm = <126>;
+		power-supply = <&vcc3v3_baseboard>;
+		width-mm = <224>;
+
+		panel-timing {
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			hback-porch = <90>;
+			hfront-porch = <90>;
+			hsync-len = <90>;
+			vactive = <600>;
+			vback-porch = <10>;
+			vfront-porch = <10>;
+			vsync-len = <10>;
+		};
+
+		port {
+			panel_in_lvds: endpoint {
+				remote-endpoint = <&lvds_out_panel>;
+			};
+		};
+	};
+};
+
+&display_subsystem {
+	status = "okay";
+};
+
+&dsi_dphy {
+	status = "okay";
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* EEPROM and GT928 are limited to 400KHz */
+	clock-frequency = <400000>;
+
+	touchscreen@14 {
+		compatible = "goodix,gt928";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&touch_int &touch_rst>;
+		pinctrl-names = "default";
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		AVDD28-supply = <&vcc3v3_baseboard>;
+		VDDIO-supply = <&vcc3v3_baseboard>;
+	};
+
+	eeprom@54 {
+		reg = <0x54>;
+		compatible = "st,24c04", "atmel,24c04";
+		pagesize = <16>;
+		size = <512>;
+		vcc-supply = <&vcc3v3_baseboard>;
+	};
+};
+
+&lvds {
+	status = "okay";
+};
+
+&lvds_out {
+	lvds_out_panel: endpoint {
+		remote-endpoint = <&panel_in_lvds>;
+	};
+};
+
+&pinctrl {
+	touch {
+		touch_int: touch-int {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		touch_rst: touch-rst {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
+
+&vopl {
+	status = "okay";
+};
+
+&vopl_mmu {
+	status = "okay";
+};

-- 
2.48.1



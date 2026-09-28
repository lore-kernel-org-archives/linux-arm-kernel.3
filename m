Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B06CA5FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuyZUjLenwsCfwS9QKli7wzxywUnFb57xoXkqL2ZFHg=; b=XMk8JGK8xVtPO6ZCovmcg+VJAj
	Zmc3fGOly2m5C4VSCWLpDucTCYOr+std0JyUHA4QnZSUTtjINSuV5lfdXl8qOUUWELHM0ufG2j0w1
	4jtSabNm6TPrOmT3EQCHLtgniEKHdp98R0LkXNWis62nbHdmSBPyQG6T1gqF/WgtkulVdE1pMhssO
	63vVrpcL0pbff+RE9Co7xzt4YFP3p8ZDMEq6fwqT8FOB0JIfaU/iOv7f6MGb7b1lG/x+o1IRNdMqL
	vAlna/ijKT1mcsTvj1omoQI+DMzRevmkPdNCh+Zcqd/HxnSYnpyixxy7NwPyX8LHn00SWEcR2fj4N
	uTbdTOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE8E-000000010uj-3Zfc;
	Mon, 28 Sep 2026 16:23:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7i-000000010cQ-0jIR;
	Mon, 28 Sep 2026 16:22:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5B17415AE;
	Mon, 28 Sep 2026 16:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243E21F00893;
	Mon, 28 Sep 2026 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612557;
	bh=WuyZUjLenwsCfwS9QKli7wzxywUnFb57xoXkqL2ZFHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exUCF+uoC3LJPEFvKkr/Iyg+urdpecMJmq7SPUSTT5u92JP60c4PWpugRa0IgDGSF
	 wun3g+u/KBxDs1HuGZcR2mE01wHfBRE3ulSnkwPsj6lYbwQXmX12FqM2pSshmzJ8CH
	 s9G351I/gGdlu/uSY0hop3Lv0NdBwkm9JgliyyP5KXPcfzv6nNpnkRUJ4vodk+X+Bl
	 g6SkFxdgjDohjlrXzzOP0z68xkaGHWjdZtpTUQhcAoUOTzxmrAdm6ZcYqTl5o8n8qG
	 U2jmlW8PLPGNpG7/IYBhw1abW6NZP4kRCxkh+NJKE85073awxYlqp0W4Ijn9YctkHo
	 4IHKt3sA3IwLQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 28 Sep 2026 18:22:06 +0200
Subject: [PATCH DO NOT MERGE 6/6] arm64: dts: broadcom: Add Raspberry Pi
 ILI9881C DSI panel overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-drm-mipi-dsi-panel-ebpf-v1-6-5244926aace4@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Albert Esteve <aesteve@redhat.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Maxime Ripard <mripard@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZYgZYD7JpbqT97KHtSk4iVbtoENcGyke2ICgcF7Yk+A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm7phj/0Lt4cMNSEx3jk6zlPks2G0z0vnmIvUGP9Z7fy
 u3s8zU/d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJrBRnrI88+bCp864+x7H1
 ngWGbVyysas3C8hxqfK0afGeXl0ayPK67Ze6Lf8hHq365hWSQvrTGesUvyR/Eo1k/vPO/Xgg178
 qFr+C+UuPxSmxPjELvb1vUjnbtLn7JudIzVA/1Kq82yigzwEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Add device tree overlays for the Raspberry Pi 5-inch and 7-inch
MIPI-DSI panels (ILI9881C) on the Raspberry Pi 4 Model B.

Both panels share the same I2C-connected display MCU at 0x45 on
i2c0_1, which provides GPIO and PWM for reset and backlight
control. The common parts are in a shared dtsi. Each panel overlay
includes it and adds only the panel-specific compatible string, physical
dimensions, and timing.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm64/boot/dts/broadcom/Makefile              |  8 +++
 .../bcm2711-rpi-4-b-dsi-ili9881-5inch.dtso         | 22 ++++++++
 .../bcm2711-rpi-4-b-dsi-ili9881-7inch.dtso         | 22 ++++++++
 .../dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881.dtsi  | 65 ++++++++++++++++++++++
 4 files changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 01ecfa304184..d717dc8c4071 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,8 +13,16 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
 			      bcm2837-rpi-zero-2-w.dtb
 
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b-dsi-ili9881-5inch.dtb
+bcm2711-rpi-4-b-dsi-ili9881-5inch-dtbs := bcm2711-rpi-4-b.dtb \
+	bcm2711-rpi-4-b-dsi-ili9881-5inch.dtbo
+
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b-dsi-ili9881-7inch.dtb
+bcm2711-rpi-4-b-dsi-ili9881-7inch-dtbs := bcm2711-rpi-4-b.dtb \
+	bcm2711-rpi-4-b-dsi-ili9881-7inch.dtbo
+
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
 subdir-y	+= stingray
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-5inch.dtso b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-5inch.dtso
new file mode 100644
index 000000000000..99aac1105ac6
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-5inch.dtso
@@ -0,0 +1,22 @@
+/dts-v1/;
+/plugin/;
+
+#include "bcm2711-rpi-4-b-dsi-ili9881.dtsi"
+
+&panel {
+	compatible = "raspberrypi,dsi-5inch", "panel-mipi-dsi-bpf";
+	width-mm = <62>;
+	height-mm = <110>;
+
+	panel-timing {
+		clock-frequency = <83333000>;
+		hactive = <720>;
+		vactive = <1280>;
+		hfront-porch = <110>;
+		hsync-len = <12>;
+		hback-porch = <95>;
+		vfront-porch = <100>;
+		vsync-len = <2>;
+		vback-porch = <100>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-7inch.dtso b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-7inch.dtso
new file mode 100644
index 000000000000..809d9b354b89
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881-7inch.dtso
@@ -0,0 +1,22 @@
+/dts-v1/;
+/plugin/;
+
+#include "bcm2711-rpi-4-b-dsi-ili9881.dtsi"
+
+&panel {
+	compatible = "raspberrypi,dsi-7inch", "panel-mipi-dsi-bpf";
+	width-mm = <90>;
+	height-mm = <151>;
+
+	panel-timing {
+		clock-frequency = <83330000>;
+		hactive = <720>;
+		vactive = <1280>;
+		hfront-porch = <239>;
+		hsync-len = <33>;
+		hback-porch = <50>;
+		vfront-porch = <20>;
+		vsync-len = <2>;
+		vback-porch = <30>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881.dtsi b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881.dtsi
new file mode 100644
index 000000000000..bd08e22581a3
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common DSI infrastructure for Raspberry Pi ILI9881C panels
+ * (backlight, i2c mux, display MCU, DSI1 port wiring)
+ *
+ * Each panel overlay includes this and extends &panel with its own
+ * compatible, dimensions, and panel-timing.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_backlight: panel_backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 31>;
+		num-interpolated-steps = <31>;
+		default-brightness-level = <15>;
+		pwms = <&display_mcu 0 200000 0>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c0mux {
+	status = "okay";
+};
+
+&i2c0_1 {
+	status = "okay";
+
+	display_mcu: display_mcu@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&dsi1 {
+	status = "okay";
+
+	panel: panel@0 {
+		reg = <0>;
+		reset-gpios = <&display_mcu 0 GPIO_ACTIVE_LOW>;
+		backlight = <&panel_backlight>;
+		dsi-lanes = <2>;
+		mode-video;
+		mode-lpm;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi1_out>;
+			};
+		};
+	};
+
+	port {
+		dsi1_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};

-- 
2.55.0



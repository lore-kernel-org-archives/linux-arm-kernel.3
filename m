Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J30PzzH/ymMvg6EB5Q5aq50msc8+xbb8Pfo6Dk6cxvo=; b=0RZvDHl3mX6NRHvuPDUVo8FdfV
	11mT8qBem5CYuM4Bu4AFAYQdN5aJ+C7z2mTmtkD90/MS80O0wXy9iBPz6wRvrKleBOfCbLrLd1gKj
	Hs+tSeI2WI0c9IQk77gy4FRIsvHqg5pCATfxiFT8/CLxSwlqxLgXzcM/hw+W5luZdt8Bm7++lowNe
	qOa1BU5ZqrdL4r4+rW9vAFZPcMGDodvfn7NVYGgsVI0V7GhlzRttn8BkJpNE4YqRIbbIUoEypQEwC
	py5acJZSYVmo8rP/+t66y93/n4jnStNTGalZ5sUbDUnLoE9Lt5LRz1NP2svhv3/ijOMNnQ5XKaybC
	/jFzD7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP02l-0000000GBsW-1Tsw;
	Mon, 18 May 2026 15:38:11 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP02i-0000000GBrd-1I2h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:38:09 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 307E51F8004F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:38:06 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B417BB40803; Mon, 18 May 2026 15:38:05 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5EED7B40804;
	Mon, 18 May 2026 15:33:48 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v9 8/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
Date: Mon, 18 May 2026 17:33:37 +0200
Message-ID: <20260518153339.619947-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_083808_667356_713001CC 
X-CRM114-Status: GOOD (  17.78  )
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

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Add an overlay supporting the OV5640 from the BananaPi Camera v3
peripheral board. The board has two sensors (OV5640 and OV8865)
which cannot be supported in parallel as they share the same reset
pin and the kernel currently has no support for this case.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 115 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index f71392a55df8..6975df9d7b46 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -221,6 +221,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a33-vstar.dtb \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-bananapi-m3.dtb \
+	sun8i-a83t-bananapi-m3-camera-ov5640.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
@@ -270,6 +271,8 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-licheepi-zero-dock.dtb \
 	sun8i-v3s-netcube-kumquat.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
+sun8i-a83t-bananapi-m3-camera-ov5640-dtbs += \
+	sun8i-a83t-bananapi-m3.dtb sun8i-a83t-bananapi-m3-camera-ov5640.dtbo
 sun8i-h2-plus-orangepi-zero-interface-board-dtbs += \
 	sun8i-h2-plus-orangepi-zero.dtb sun8i-orangepi-zero-interface-board.dtbo
 sun8i-h3-orangepi-zero-plus2-interface-board-dtbs += \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
new file mode 100644
index 000000000000..0d4de0027fea
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2022 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/sun8i-a83t-ccu.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	/*
+	 * These regulators actually have DLDO4 tied to their EN pin, which is
+	 * described as input supply here for lack of a better representation.
+	 * Their actual supply is PS, which is always-on.
+	 */
+
+	ov5640_avdd: ov5640-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov5640_dovdd: ov5640-dovdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-dovdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov5640_dvdd: ov5640-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-dvdd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&reg_dldo4>;
+	};
+};
+
+&csi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi_8bit_parallel_pins>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi_in_ov5640: endpoint {
+				remote-endpoint = <&ov5640_out_csi>;
+				bus-width = <8>;
+				data-shift = <2>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pe_pins>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640: camera@3c {
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi_mclk_pin>;
+
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&ccu CLK_CSI_MCLK>;
+		clock-names = "xclk";
+		assigned-clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clock-parents = <&osc24M>;
+		assigned-clock-rates = <24000000>;
+
+		AVDD-supply = <&ov5640_avdd>;
+		DOVDD-supply = <&ov5640_dovdd>;
+		DVDD-supply = <&ov5640_dvdd>;
+
+		powerdown-gpios = <&pio 3 15 GPIO_ACTIVE_HIGH>; /* PD15 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+		rotation = <180>;
+
+		port {
+			ov5640_out_csi: endpoint {
+				remote-endpoint = <&csi_in_ov5640>;
+				bus-width = <8>;
+				data-shift = <2>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
-- 
2.54.0



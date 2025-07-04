Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED2FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8sPcZjKUdUBDWpvEshAPyOhZ/0NuBS4zgSCgP9w7a4=; b=UESPL706O3pADQev7dfnUtKkAW
	nPr+CJeB4JfG2McOcvZ6/q8xd1dj7mzlTAi4y88xPohSFBeQhFyGB5nSSdGXsczMkeUSZn8Lc4681
	WISN6hIkhWBx+/bIQUcGGKqqFR5kdlNgH0mQROcYahbeBiKnQ8q736Gyecvcth4bau5ixeIvPGB/Y
	5VjrgA7kC6K/lUseEw+bbiY5IbAJH0IcI1W/3yJRRnmWcKAEqGZElsxvVSzkS25YxT3FcOKpYqqV3
	fQ248FIMi3+QEu/igpPInhe5nCenA12jznsJ6k4aiUCCVeeRqNOXu3Cuaa3tRM6VegajQ4Nx9/U7Q
	3PQeLsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjAi-0000000Ewdt-1Bwx;
	Fri, 04 Jul 2025 16:21:56 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXip7-0000000Etdy-0t4Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:59:38 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 32C941F0007E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 15:59:07 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4A964ACA6B8; Fri,  4 Jul 2025 15:52:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id AD114ACA65D;
	Fri,  4 Jul 2025 15:46:45 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 8/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
Date: Fri,  4 Jul 2025 17:46:25 +0200
Message-ID: <20250704154628.3468793-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085937_576449_49A8867D 
X-CRM114-Status: GOOD (  18.00  )
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
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 7318ce6d7fa3..de13da013732 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -219,6 +219,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a33-vstar.dtb \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-bananapi-m3.dtb \
+	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
new file mode 100644
index 000000000000..469faf8cd2c4
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
@@ -0,0 +1,117 @@
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
+	compatible = "sinovoip,bpi-m3";
+
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
2.49.0



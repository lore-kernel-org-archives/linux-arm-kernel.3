Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D8ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpovwenXPDOa/CzlL9Tb6pvO6bb3yMG0I4srjw+nzys=; b=J7duWInFe6p18yjdRqXtagxpMm
	t4B8j4sd0udZcuYoYJOEe3MUAXujIvsIWf55/qono2Si4LlVrHH4zK1DOTNfTiUBv+LMPThqCvsjJ
	JEewCKxYf9OjkJk3LyYf+ABH1/7PYelSe/3ODzjPpLsFZPTuK4br4KDIBu/NHaGQSGjt19HF98J/c
	nn1q5gSEH0MyMe9eQWtv1zJr7+s9hr6zd0NXRztPZp8sSLzAAnDTLlA1OUzlde4X7sSVaC5CBpc3y
	9vBHqsBRGv0+usur3B8f1VVBDJ8Yf/i7QJrUHGzuAjxnjk3Scd1odXcQLN0tLkg0x5eRYIVrVGvk2
	ODbxnj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKug-00000009u8h-25Bo;
	Thu, 01 Oct 2026 17:49:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u1h-3fES
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:41 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 985DB2039F;
	Thu,  1 Oct 2026 19:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876976;
	bh=TpovwenXPDOa/CzlL9Tb6pvO6bb3yMG0I4srjw+nzys=; h=From:To:Subject;
	b=Az21ypb2ppPYsw7tCj0wC3qzExydj67M83JxIZ5X5MnuG3W8z4yhdKDgOUpQhU+Rh
	 XKcuTKYJNLFr25o/1OTtoXX+QjY80n7S5hCnUhapChLZef34pmFGISdMsf4YLFcrPi
	 9BZdsvSrz1TEFh4XnCPV9SLIi8b1up/q9sDIrqLnQPYYkEqiVqJZJf/4SbjXP032v3
	 /SM8Gf/MaGAFSMoydXbubqpukR6Ol8Hz8rrWOIH/5dA9TdB/Kgda4OGPSORlh7RNE7
	 Wk3bGcFOctVTlu3Wknkt2xsm6CScTFRM/YrUcHMObUbZDoDKa7b9hJJxytSXjx4ycy
	 BNVxWDzArxcvQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] ARM: dts: imx6ull-colibri-emmc: Add VGA overlay
Date: Thu,  1 Oct 2026 19:49:16 +0200
Message-ID: <20261001174924.3831455-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104939_245715_5CAC09EA 
X-CRM114-Status: GOOD (  17.20  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6ULL eMMC
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX7.

The overlay content is identical to the Colibri iMX7 eMMC one, only the
GPIO driving the DAC power-save input is SoC specific. To avoid
duplicating it, rework the Colibri iMX7 eMMC overlay moving the common
part to a new dtsi shared between the two modules, and include it from
both overlays.

The overlay is also combined with the Aster, Evaluation Board v3, Iris
and Iris v2 carrier board device trees to provide ready-to-use DTBs.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++++
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 +++++++++++++++++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 52 ++--------------
 4 files changed, 112 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 83f65b031e55..fa2a6dd82385 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -369,6 +369,22 @@ imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
 
+imx6ull-colibri-emmc-aster-vga-dtbs := \
+	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-eval-v3-vga-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-vga-dtbs := \
+	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-v2-vga-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -398,15 +414,20 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-aster-vga.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-eval-v3-vga.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-iris-vga.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-iris-v2-vga.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
+	imx6ull-colibri-emmc-vga.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
new file mode 100644
index 000000000000..4ecf221de27e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx6ull-imx7-colibri-vga.dtsi"
+
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
new file mode 100644
index 000000000000..7e323698f338
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector, shared by the Colibri
+ * iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71, the
+ * SoC specific pinctrl and GPIO are described by the overlay including this
+ * file.
+ */
+
+&{/} {
+	vga_encoder: vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&vga_enc_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index 363c0c2cc43e..ae3d8da02e67 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -14,51 +14,11 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	vga-encoder {
-		compatible = "dumb-vga-dac";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+#include "imx6ull-imx7-colibri-vga.dtsi"
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				vga_enc_in: endpoint {
-					remote-endpoint = <&lcdif_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				vga_enc_out: endpoint {
-					remote-endpoint = <&dvi_connector_in>;
-				};
-			};
-		};
-	};
-
-	dvi-connector {
-		compatible = "dvi-connector";
-		analog;
-
-		port {
-			dvi_connector_in: endpoint {
-				remote-endpoint = <&vga_enc_out>;
-			};
-		};
-	};
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&lcdif_out {
-	remote-endpoint = <&vga_enc_in>;
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 };
-- 
2.47.3



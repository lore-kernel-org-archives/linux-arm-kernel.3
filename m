Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482AACA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CbGzjZDEuvfS1hDG8xap3PyrkQLtw5CVs8OYL2VVXM=; b=YjFW83lHgPk4QdpZfdIzD53QTj
	6FaRy3sZXT4HvJEsbVQX7o1zBnABHstw3hDyyeQ/8/KK7To6xWl/LjgRWpBYtoAQrePwbDaTH9emN
	l9Wyr0XxyoSc+S7VmcjQcCi4Yf+nhYedBc4Km2lujOv3HopizrDhyBusX9k7vn7mZr7Ihc+m3/KW8
	8bKbuZ92cpMkFJAC+NsyOgIuo9MIgEr8GIQMljvRsGVCC5bpP64SXuIyIfmvQQOyJq0W509bXMGzU
	ONTmY5z5vV/KZx76HQX1YFy/y8m7WtQyESPnDSsjZcyybcWWAaZQkHr3PFzIiS4Yc722DfgcRlf9l
	f9ZW2Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuZ-00000009u3Z-3FtN;
	Thu, 01 Oct 2026 17:49:39 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuV-00000009u0g-45uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:38 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A783E2016D;
	Thu,  1 Oct 2026 19:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876974;
	bh=9CbGzjZDEuvfS1hDG8xap3PyrkQLtw5CVs8OYL2VVXM=; h=From:To:Subject;
	b=sQUD6SVXytBx/qHqzZ9kGiofyCz+q93MtbMk4w/EkUBbPNcQs4WcwV3zJ4EYo3BFS
	 gmuTP/lvWFx98qT5qNcEahtKaUHgmQiZSeZuTnq9CqsbKIxvDXg+Hpcqc4eum5HxEk
	 O1ppL5exYxCpvo2/TmV3UKRqh6yXSCNeQQDdhS5fyMcSkyI8at3AwO2uxjLt2DR1ki
	 Q3STjXan1eVokDtADaBNjCPJaK0G+7wIqb6ec3fBTpqIxHwZmHzzpBCkHrfw2cD+fT
	 CAzaf8E3jsPATdkpa9sdieGTznETcmbRtkMvkx5DJlEX4+Y9rrd6RM/+DsHAEtB++q
	 uPPNUVZeHbSmQ==
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
Subject: [PATCH v1 4/7] ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 19:49:13 +0200
Message-ID: <20261001174924.3831455-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104936_340891_4C9120F2 
X-CRM114-Status: GOOD (  16.94  )
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

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6ULL eMMC parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The panel, backlight and LCDIF configuration is identical to the Colibri
iMX7 eMMC one, only the Atmel MaxTouch controller wiring is SoC
specific. To avoid duplicating it, rework the Colibri iMX7 eMMC overlay
moving the common part to a new dtsi shared between the two modules,
and include it from both overlays.

The overlay is also combined with the Iris v2 and Aster carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 31 +++++++++++++++++++
 ...olibri-panel-cap-touch-7inch-parallel.dtsi | 29 +++++++++++++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 16 ++--------
 4 files changed, 74 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 0aece8cc9fe4..eee3f4e8e7c0 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -352,6 +352,15 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-udoo-neo-basic.dtb \
 	imx6sx-udoo-neo-extended.dtb \
 	imx6sx-udoo-neo-full.dtb
+
+imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+
+imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -380,9 +389,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..2edf680b1884
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi"
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_conn &pinctrl_atmel_snvs_conn>;
+	/* SODIMM 107 / TOUCH_INT# */
+	interrupt-parent = <&gpio5>;
+	interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 106 / TOUCH_RST# */
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
new file mode 100644
index 000000000000..21688c63d11f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Panel, backlight and LCDIF part of the Toradex Capacitive Touch Display 7"
+ * Parallel overlays, connected through the 40-way Unified Interface Display
+ * connector, shared by the Colibri iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
+ *
+ * The Atmel MaxTouch controller wiring is SoC specific and is described by
+ * the overlay including this file.
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
index f336f7b05a2b..211acf11e438 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
@@ -17,6 +17,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include "imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi"
+
 &atmel_mxt_ts {
 	pinctrl-0 = <&pinctrl_atmel_connector>;
 	/* SODIMM 107 / TOUCH_INT# */
@@ -27,17 +29,3 @@ &atmel_mxt_ts {
 
 	status = "okay";
 };
-
-&backlight {
-	status = "okay";
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&panel_dpi {
-	compatible = "logictechno,lt161010-2nhc";
-
-	status = "okay";
-};
-- 
2.47.3



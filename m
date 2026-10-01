Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A42CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxoOG7MFq3WIPfCECZKdzzAWFlj3gAqNV/14P5SZDYY=; b=1Gd+WoL5P8DlqTdFAZc8RYPfA4
	dizUhZYY5tZhgOeIgC5zqokb6dGBMaNMMMJ9tl4hpw5AdvrFayaBJXdLqHdYyfc0qCiQMO+bahSAp
	Pd2jcRYBSd9MaXhce35CFYXCsmzxtSxIiK059iLUhFbWutX1CupJr3lZFNUPRMvCHRqW8N4iv4/0/
	6MwgdW+L53BMTR5lEifKGzfJCMmQ2NwBrE4Kjz+xtLJz5TtGtsc0nsGnIY0zil6VltZBuD/rDNBv/
	+Np9OR7ALbHWeIYWhFShuOVXNXvS9qGVZnz6GQ3kc+zpxXZUTxaT5Kx5jEp3XkyGRjKWLo1RPO+Yb
	3oEi7CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKug-00000009u8K-1OHk;
	Thu, 01 Oct 2026 17:49:46 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u1c-3C8X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:41 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6045F20174;
	Thu,  1 Oct 2026 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876974;
	bh=qxoOG7MFq3WIPfCECZKdzzAWFlj3gAqNV/14P5SZDYY=; h=From:To:Subject;
	b=hZWAa5835PxLRDHb9X8Za1GmIaJsyz0u9SX262yi6blgQyJxul6t3wZrxdI7O9KFI
	 WjZhv3vhOPFsrcE8+44ZlAji8olpgngrL1ZA8V1UOzGRiMG0N0HCiF4JBw9aBc6zbU
	 bObT/dfpPqZFD80USN2Q7Kcv8zaZXhtiHIgYuKMZsWXeMfGkcm21OlYBWqQnwiAY0O
	 P+8gha5jvNe5S5LGdFAMH2Szt8Xwq/+hleitCDa0h9emQtofUd4CP/VsuitIdQnriR
	 GUGl/lR8xLRXVkI9yakcaqZkVXY7GhPNpXfGU51+A+En73gsbVnIKr2wf/HJJ+16J7
	 UhZKZMhElPUyQ==
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
Subject: [PATCH v1 5/7] ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
Date: Thu,  1 Oct 2026 19:49:14 +0200
Message-ID: <20261001174924.3831455-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104939_124499_6B13BD14 
X-CRM114-Status: GOOD (  17.37  )
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

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The panel, backlight and LCDIF configuration is identical to the Colibri
iMX7 eMMC one, only the Atmel MaxTouch controller wiring and the
conflicting PWM channels are SoC specific. To avoid duplicating it,
rework the Colibri iMX7 eMMC overlay to include the dtsi shared between
the two modules, and use it from the new overlay as well.

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 46 +++++++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 16 +------
 3 files changed, 54 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index eee3f4e8e7c0..d7639ef9ab44 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -361,6 +361,10 @@ imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
 
+imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -391,10 +395,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..50162ba0ec9c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
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
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* SODIMM 28 / TOUCH_INT# */
+	interrupt-parent = <&gpio4>;
+	interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 30 / TOUCH_RST# */
+	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+/* Conflict with SODIMM 28 / TOUCH_INT# */
+&pwm5 {
+	status = "disabled";
+};
+
+/* Conflict with SODIMM 30 / TOUCH_RST# */
+&pwm6 {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
index 890461f92442..8f1335afd149 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -22,6 +22,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include "imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi"
+
 &atmel_mxt_ts {
 	pinctrl-0 = <&pinctrl_atmel_adapter>;
 	/* SODIMM 28 / TOUCH_INT# */
@@ -33,20 +35,6 @@ &atmel_mxt_ts {
 	status = "okay";
 };
 
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
-
 /* Conflict with SODIMM 28 / TOUCH_INT# */
 &pwm2 {
 	status = "disabled";
-- 
2.47.3



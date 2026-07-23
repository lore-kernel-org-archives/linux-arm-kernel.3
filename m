Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6388EC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEefO5HnPSQ3Kak6C4/A3JjED/ouocrTu89BGKOl+pk=; b=H/oUD3xyFFXjQqCHmTyNxkYmWy
	xeoKCz4+gb+sU5c2IthcAnZPfRk/qyMv8Nyd5BNiWOlzXIjakSB9WDGhs0XnQXpoL+Xkcoa976526
	kXB9Bq8nvVI5YmhhMQoK6hl0esjX3hn0oVnXv4Kmcg9WItX0zhNReJ3y1gtG/3pUxJz8y4k8TEtPx
	zV/V2h+anSJo6yiXE43lE9YHLw8GxIAcdHcRfqAjBFMBCXjjxiNDpE1PtQz+Sz8DILQjQa/a725h/
	yjnnvs5kNhaWSDCK+XwXYRKJbYrIsHvh0r4qZVz9Oh97vzcUSfo9Z/ubbERLNAaNqQcd2ON3Eu1IC
	1OoeIS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2x-0000000E4Vl-47EY;
	Thu, 23 Jul 2026 10:52:59 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2q-0000000E4Sr-24rv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:52:54 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F040C22817;
	Thu, 23 Jul 2026 12:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784803970;
	bh=hEefO5HnPSQ3Kak6C4/A3JjED/ouocrTu89BGKOl+pk=; h=From:To:Subject;
	b=L9jBVNTcWj2FiQVSypBm3sJr9IxGvG+FpFFVB38gzwyZ+PGkAgEjAy+INBU/sMNf0
	 n0qBp0TMzkl9HaNt7AYJxmWqVLm3SV5Lxi8kNMTS2relbBCxetX2hlHHXaVTyOSUt5
	 k8oia7axuP/ZEeg6rcHI2Msg939G2681hw7vvvl9SB532DQFNU2JYewQaEyGdRkdjj
	 xMwVtSVP2eadmiTWAxH4uDwp7ZSsK24bCDPVZ6+1H2UhJYN1umaEHK70NUUyD7Srmf
	 STzwDx3K7vdRHaNpmb2MzM7dP6UQVLXJATJH7TTiMijV3UdLii2uN3aqfmsVrAS6KZ
	 56RhxI7UEZ8jw==
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
Subject: [PATCH v1 2/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
Date: Thu, 23 Jul 2026 12:52:18 +0200
Message-ID: <20260723105225.194366-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723105225.194366-1-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_035252_863330_186D73B3 
X-CRM114-Status: GOOD (  13.88  )
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
on the Colibri iMX7 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  5 ++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 58 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4d2730000202..3c16843c3071 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -428,6 +428,10 @@ imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-iris-v2.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
 
+imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
@@ -437,6 +441,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-iris-v2.dtb \
 	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..890461f92442
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adapter>;
+	/* SODIMM 28 / TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 30 / TOUCH_RST# */
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
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
+
+/* Conflict with SODIMM 28 / TOUCH_INT# */
+&pwm2 {
+	status = "disabled";
+};
+
+/* Conflict with SODIMM 30 / TOUCH_RST# */
+&pwm3 {
+	status = "disabled";
+};
-- 
2.47.3



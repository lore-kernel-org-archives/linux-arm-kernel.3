Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8969C531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPZjx6385XfTl3lCsc9LZtaK8ZER/FanQYRqnLJaM3o=; b=GKjbL4ow/NcNw0egFuVM1oYCGV
	st40bKLLJv6c/Rn6BwvlHzkCVewp8Y1kvNTuEipH0zzWrC4GN7D7/tCvz4iQqN0l+/YPEa6A6Qe9i
	hmR5PfnvIIhg+XXXFl5ECfFEGgcX3kRHkx/PzitT2xRIpThlj768oKXijOC2UosDz+aSgDr/Ahy0u
	/cXazuypcNK6QwXJmcAZZVnRqaZvHvP6eOUG4K+MA17+iaoYdSh8VlqMrCfJdaByhPYg7jHBBQNrH
	hh7FipGw+XCueLbaeio+u3T22qzOemf5s516KFx+yMOtxJLMGhQTaKAvcKyBL9M+QTMJbP+MNbg4J
	wO4E0+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2x-0000000E4VT-3gRm;
	Thu, 23 Jul 2026 10:52:59 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2p-0000000E4Sj-1scH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:52:53 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 28C8A1FFD4;
	Thu, 23 Jul 2026 12:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784803969;
	bh=UPZjx6385XfTl3lCsc9LZtaK8ZER/FanQYRqnLJaM3o=; h=From:To:Subject;
	b=hYrnhnIcLEuDEwl94B/+pQzyVSMnmax9MYVnqPBHIAmDqmCjg8b3Cl9JPMQD6ltpP
	 Cb219Q2q3/Jyu0QZS0XJAwmi/EhB/PrXfMY39DHgjocNP5cbJSu9Qt0m+hbMLBV2/r
	 dP7i83p12A0sEAHlQZWMVATXK3YbHaOIMhpCAz5bMoouj3aLSX2huSBIts6qNMuiot
	 8fzmIgi4ITkW0+q5aIysVqv/yhu1FdH+4XJoDWXq49LUR44Xy237OBDobxFFDOOxXC
	 SPYpvr+Gn8lTEkgaXeXXCmfCMRFkNW0lN5SoOqqf5DOdVWrKCkMupDZAjRQwKxSWid
	 Qf5ZZCN7ZQVfw==
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
Subject: [PATCH v1 1/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu, 23 Jul 2026 12:52:17 +0200
Message-ID: <20260723105225.194366-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723105225.194366-1-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_035251_793366_5CAFD7D2 
X-CRM114-Status: GOOD (  13.23  )
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

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The overlay is also combined with the Iris v2 and Aster carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 12 ++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 43 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..4d2730000202 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -419,13 +419,25 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-var-som-concerto-full.dtb \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
+
+imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx7d-colibri-emmc-aster.dtb \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+
+imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
 	imx7d-colibri-emmc-aster.dtb \
+	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-iris.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
 	imx7d-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..f336f7b05a2b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_connector>;
+	/* SODIMM 107 / TOUCH_INT# */
+	interrupt-parent = <&gpio2>;
+	interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 106 / TOUCH_RST# */
+	reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
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
-- 
2.47.3



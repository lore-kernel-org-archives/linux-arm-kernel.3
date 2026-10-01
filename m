Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C1CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2NgTG7rGsXdrhvndHhrNaNnf4uSsVGwv9jNiMemkYI=; b=e8/wK9S7eiSalDM2MtLXnWhm62
	ZLwcr4QIgtIJL/LprelqseUUDRRAvxL6foJzJMEUsa+RRbI23xlMtxiQu2nVrjAgAXiDDSFtOldqP
	JeRb4xYQxQDqQeybIcDwhzNJRbU5SRz6kx2dWf5cSyg6jdbZXHTpbD7XopIJR0c1rLodqZmrzU62h
	P4abZnLP/A7yVUqX1ll+kOsWQRqFYYOzOiTdtSA8pML2VD9TLhYPEAf/jEbtI4nHBfQfILWLW646h
	qwNDfyc523vswxZvQZqJSoyOyA4M9aSvDASmq6NjElxtaBQK4X+3dyxuliubmzXC/jOLCsd9ZOi1F
	2xzx9DLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKue-00000009u70-0gpN;
	Thu, 01 Oct 2026 17:49:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u1a-2rjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:40 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 01B5C201A7;
	Thu,  1 Oct 2026 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876975;
	bh=y2NgTG7rGsXdrhvndHhrNaNnf4uSsVGwv9jNiMemkYI=; h=From:To:Subject;
	b=ZTezjDHBzJ448GbiP2Ec+BWGCsQIt9rNVwunWB+WZ+e38oqyea2nHcSM/MUGn4WVF
	 SIj3DdbYHFSoltrFTH+EQ1IXlyxmCDYnM8+FRC9shoeh6ZQlmLTisL+TFABJibI/Ew
	 O3lACCfv6fYx7kVAbPgschCHD9G37mB+vgYFDrOe7Bqsw2WkMBfCWablnbTjht26Vc
	 8IYw+NzebsWmTwyqgFDy+PimN5UW5ugojSUDDxcfw4Dz9eKAhwX2oxr3iYG4G+hhIK
	 N4qScQXbKL4JRSRbsNVNbWbsNgjq+GBymXo5o3TT9fb+eBztmiXIwqRPxozqvBoBpr
	 SLuB/E5lDW9OA==
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
Subject: [PATCH v1 6/7] ARM: dts: imx6ull-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 19:49:15 +0200
Message-ID: <20261001174924.3831455-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104938_883101_C6F9F303 
X-CRM114-Status: GOOD (  13.67  )
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6ULL eMMC parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay content is identical to the Colibri iMX7 eMMC one. To
avoid duplicating it, rework the Colibri iMX7 eMMC overlay moving its
content to a new dtsi shared between the two modules, and include it
from both overlays.

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 16 ++++++++++
 ...olibri-panel-res-touch-7inch-parallel.dtsi | 30 +++++++++++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 18 +----------
 4 files changed, 53 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7639ef9ab44..83f65b031e55 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -365,6 +365,10 @@ imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -396,11 +400,13 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..b8bb86809031
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
new file mode 100644
index 000000000000..2159b9788064
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector, shared by the Colibri iMX6ULL eMMC and
+ * Colibri iMX7 eMMC overlays.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+&ad7879_ts {
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
+	compatible = "logictechno,lt161010-2nhr";
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
index b926cc020e62..4ff1ae821967 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
@@ -13,20 +13,4 @@
 /dts-v1/;
 /plugin/;
 
-&ad7879_ts {
-	status = "okay";
-};
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
-	compatible = "logictechno,lt161010-2nhr";
-
-	status = "okay";
-};
+#include "imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi"
-- 
2.47.3



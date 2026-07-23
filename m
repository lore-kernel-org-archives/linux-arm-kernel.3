Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFB4C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpfgjpmbWEvJpnbRaKNJI1gY1e5+GVRgVOkxtwDXyA8=; b=IVD6got0mkSml0tDH6K+I+gfDR
	Q2vD5R1NYHkskpvh/JeNCGw8lpEyjzOH20rdbRuiW5iw3m3nZXX5+VoyZUOpjjYyORvZsmJKQjwfR
	oTPa592mhqi5z+E9v0mlvczAJEINAIwFb2MX+Bq/UY/2Lf9oXkcjyfAH+oij7tL1pG90Ag/dkbfXN
	XqDzuwZY5yVguVgTCdAbblIMRUPYH4mlWxM4mXAoqZNu7z35MPyQYuf2B3ROPoNQtKozJNt8RdU0Y
	LSU2Pa4Y7EmJPaXoTSMWZo9TYb3f0Sr7Ag846nj9jBz0YblKhq2Tj2Y4Qg4yXaTVV9ZvLQQyat5N9
	NH+vpR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2y-0000000E4W2-0IjQ;
	Thu, 23 Jul 2026 10:53:00 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2r-0000000E4T3-022C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:52:54 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C43A222840;
	Thu, 23 Jul 2026 12:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784803971;
	bh=kpfgjpmbWEvJpnbRaKNJI1gY1e5+GVRgVOkxtwDXyA8=; h=From:To:Subject;
	b=nYiQCa4PGfBaNzzBsjOKBhdewqe3G1roXV1HZnqTwO4IcegYLe8AiKH/SOT72akNp
	 k3u68JdR7pwPEUKo6l4/ApJVl1GDsakjXl5oVpm3E1ZY68zEUO7g9ZKpukSgcik+1S
	 3wKbpQsm3xk2mX/lnLcVyS3alffUznO67NUeQO3VVKf+iObEiDeDr2sZ08BWc2k5MZ
	 zZP4PxdP/kp3LQhrIbuByo3+LAamfqHAkqVVYfIZR5w9uDZP/3LsHHFULt30gf+SSC
	 7wrHr9lTuTKbqbh8zaDPm5Aqw6QdDj3CelarWfHkLOaVoPnjox84b6NZT3lhU/iPmi
	 pR4lQl2O0NrZQ==
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
Subject: [PATCH v1 3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu, 23 Jul 2026 12:52:19 +0200
Message-ID: <20260723105225.194366-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723105225.194366-1-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_035253_208343_DC78076A 
X-CRM114-Status: GOOD (  12.72  )
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
on the Colibri iMX7 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  5 +++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 32 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3c16843c3071..e9f95c3b8353 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -432,6 +432,10 @@ imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :=
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
@@ -442,6 +446,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..b926cc020e62
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853A6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEEkyg+NivPrqbklBvzyR4E3EkaU5i/fDbC4zIipOTM=; b=cwY/Bscn5zltgYBw5G8Q0DyTqF
	B2aD8QmOQGsvE5XV8Klq3g2RTROcbpTZKFDaI7EPBE3nTUhDxHmwqJnE5ztH3Wj4inJRDrPMUNsnZ
	scaVBLGNNzvJfpjpDcvCjN+VM7P9WJOnGzczimSdZaT6zdI22BB6fSWCADCReye3jaHgINW76LSUd
	NO6tVYaCxrXvlftfE8KgmzRgcTQS2/bDp+GTDbTBA+1yKPIJs8gLML8FiUB0hahIKJaYqN2N5zi9M
	RSsvy5cV56IhHX9QJQEItG89zULVwWKXBNPhkqVDsHGM6CEMonnzcxPHGERDkeLtnfDxcRg0SvCRH
	OVjInzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MUh-0000000Cdi7-0wJ9;
	Thu, 17 Apr 2025 10:29:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MG6-0000000Cah4-12qa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 393DA4A415;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38880C4CEF5;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884850;
	bh=2Dlsbp2ZQp0mKlkOG0l2HB/A70QyxJouIcLTcNaKU4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rySPy2+XkmyDlnb8+lbfad2sx0VycN09sDEt+MzqJMuKoWgsfBY2ZwvKhFbthn5fw
	 a7DVRO9RnmmOFSCaHEGATGLowndtNQa1yVtie9QgwER9r3LYwXJw9mTY8iU40CY+n0
	 2vvKEro2ALeJwiLlffF987c2gj4bRnSZhRj/PS6aKAFqvzzIJ/r9wNfL59qMU/UzuQ
	 jIVvwvoMhi86ZaC1JxOzXw7MH1LNULo9fA3IPbQnT/MF359d/PoXWHIBdWUjkuQcX1
	 j1dCZiTJ+gjU2OutfopTLMc4CjPoY7Rq+4XbXnvoNAhfbMtluF7J4MWiYFrUHuD8es
	 nM4ZFt00M48MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D1EC369B2;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:08 +0200
Subject: [PATCH v6 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-7-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=4149;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=h0JRl/H1jAeQCWzYy2uEVhxYBS57hFbIJlyMQEJFcGI=;
 b=BQLNwPAQ/bZpmpmIO1+dtEy30HavvccIhjQE7zWaBj+brScjCpkz73uD2xfY8jdtW4kj0c167
 unS8nYCn38sB4/eQinUYqJ8WbOBwk76PugzlkYwK3bLbc09M0xHPrLR
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_031414_363114_0245CADA 
X-CRM114-Status: GOOD (  13.75  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
comes with a 10.1 1280x720 display with a touchscreen (not working in
mainline).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.

The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
I know is not supported upstream, the driver we currently use for this is
a mess and I doubt we will be able to get it in an upstreamable state.
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 94 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621234ab84353165d20af9d2536f839..ca3255aa9e18187b33d54c836992aca5dd5d0465 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -214,6 +214,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
+
+imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..b3bbbd69f671493c809bbf043807a22adda5024a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
+
+	panel {
+		compatible = "boe,av101hdt-a10";
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_panel>;
+		pinctrl-names = "default";
+		power-supply = <&reg_3v3_per>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
+	reg_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		power-supply = <&reg_6v4>;
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "usb-c-vbus";
+	};
+};
+
+&iomuxc {
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07
+			MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09
+			MX8MP_DSE_X1
+		>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1054620000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+
+	connector {
+		compatible = "usb-c-connector";
+		data-role = "host";
+		pd-disable;
+		vbus-supply = <&reg_vbus>;
+
+		port {
+			high_speed_ep: endpoint {
+				remote-endpoint = <&usb1_hs_ep>;
+			};
+		};
+	};
+
+	port {
+		usb1_hs_ep: endpoint {
+			remote-endpoint = <&high_speed_ep>;
+		};
+	};
+};

-- 
2.49.0




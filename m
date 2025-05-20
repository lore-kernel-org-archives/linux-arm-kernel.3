Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979F9C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 06:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4VmZnAWe91I1zv+kH9o6v1V3Wyv/Y/7rKPlV/OXNHo=; b=HEG7GtB/TwXB1nA8o0bMOVAiQI
	6JSZOpfT/B4ynDE9OYsBIGpnuKuBtNLA8Md7WMs7kojTXehtTC+d2DZnL7Ki4PylRs/YxN/EHuwgl
	t0Fg0YkeSqqNu5l5uIUa6tNEm1CmbhRlgCqz1Q+V3gPbGV6ppHvRLRLTzigesP/eRg5HgJB2Isovp
	0V2C93TrWwuvoZSiE1oJEPB0PiVkMwGoIeQmH2aQWnmXjT+kcwbe4AJOxrk2ungjI/YhQ8Ef7lBaF
	5iT7cFC0rMMineB4lyRXjAdgw1fOnWTB5LvewzMMH9moKvpXixJvKaJR+n3Vnctg5oYEeVqkMpYOU
	WhnukBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGb6-0000000Bj1t-147d;
	Tue, 20 May 2025 06:37:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGYy-0000000BiVL-0xZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 06:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81B2A61155;
	Tue, 20 May 2025 06:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2292DC4CEF9;
	Tue, 20 May 2025 06:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722894;
	bh=XNZwlIgBkETjMefqm5oN+G/jvU1gUxJXmVuGN6RmC18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RUE8XaKCcX/fLXciPr5NkbkaFOHp6t+r1CarXo28/oVOO5+5SHOx3JXRBr6UqtLEc
	 6ImfOVb3n+x+hw+9XFSSzyr/TeyDin9VbFf0c+W9vBkD9l0F+nvDv/ON/XY/fDDrcV
	 un7L7I9O2AjZdNbmC+e5gLarCLNH2rtENCJQAcHytmlVNZuWbO5UT4v5AD0iB+yA6P
	 b3alc5bJPaWrn5LkQmCi5qxRP52LjGEc4bqqSW0v8DqkvF8E1dHSYOKKiK8/8SygPJ
	 BNWXqfq24YkIzR564yVc52w3QM9sVOjRHlhfIJTeDPXewuLKwf3qIi7rGCq2JWNPLi
	 djGpM1D2taUqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184F6C3DA6D;
	Tue, 20 May 2025 06:34:54 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:57 +0200
Subject: [PATCH v7 8/8] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
In-Reply-To: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=4679;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=I/kM7mq422c2Dzz64Wk+UlUYxhJAYXnl08GlpuY0xJQ=;
 b=Em3JcLOF+AZcj/cesIFFGxpJJRk1UgQymUG4lIianmNrvpJdleBXisY/97A6ncutLANGLCgje
 /8fANl3HpxyDoezIs2hkH7J1pTVoxnZF4KnEZ+YGOWhI1AOuFtuhHMZ
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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

Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
comes with a 12.3" 1920x720 display.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.
---
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 +++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ca3255aa9e18187b33d54c836992aca5dd5d0465..c821f9eda332abd1db1867dab196c09929316728 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -217,7 +217,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
+imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3eb665ce9d5d2a1c742ffb4feca046e406e29956
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "GOcontroll Moduline Display with BOE av123z7m-n17 display";
+
+	panel {
+		compatible = "boe,av123z7m-n17";
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_panel>;
+		pinctrl-names = "default";
+		power-supply = <&reg_3v3_per>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in0: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in1: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* sn65dsi85 */
+	bridge@2d {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2d>;
+		enable-gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_lvds_bridge>;
+		pinctrl-names = "default";
+		vcc-supply = <&reg_1v8_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lvds0_out: endpoint {
+					remote-endpoint = <&panel_in1>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lvds1_out: endpoint {
+					remote-endpoint = <&panel_in0>;
+				};
+			};
+		};
+	};
+
+	/* max25014 @ 0x6f */
+};
+
+&iomuxc {
+	pinctrl_lvds_bridge: lvdsbridgegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14
+				MX8MP_DSE_X1
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07
+				MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09
+				MX8MP_DSE_X1
+		>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	/*
+	 * burst has to be at least 2x dsi clock that the sn65dsi85 expects
+	 * display pixelclock * bpp / lanes / 2 = dsi clock
+	 * 88.000.000 * 24 / 4 / 2 = 264.000.000
+	 * range gets rounded up to 265.000.000 - 270.000.000
+	 * 267.500.000 * 2 = 535.000.000
+	 */
+	samsung,burst-clock-frequency = <535000000>;
+	samsung,esc-clock-frequency = <12000000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = < &dsi_lvds_bridge_in>;
+			};
+		};
+	};
+};

-- 
2.49.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3B5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKMXzpnv1lIq4fFbiBP2CWxq/VgdeA3T7yPqW95u3ls=; b=tzbGxM319sFphhInU/qJKFbRdQ
	zOYRlrgjtjA+qSU/LgRjZ91R1V6aBfruYsPpM1bbXR7MpEn9a6KZTcy8bt2IN0G+8ortFIqUB4MwG
	MBkwQEnRn6eTCTgCjtAAZOR+QGl2tE1cIj7L3Tp04rlyfo5sSe4Qbd4Jxvyf9DLr6dW8G4zmF9lHA
	kD8lK/B/R516HAMORuaEqJSqKf1zkLdva4dt4IhM/eJQxu+CCatF/uZPopKcqvCg/UzsVTlfW5xCE
	6fliyb26HM3rxRyFJTHgj2Ev5HpAPqJxEItR5j2b64P2iFz7z3UuNG4XwkFyNwQeho+Ahr7OvtWrK
	mKCxX8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsJP-00000005LFD-1NK9;
	Wed, 02 Apr 2025 07:14:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC3-00000005JUT-1ps3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1601A61364;
	Wed,  2 Apr 2025 07:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CEB6C4CEF8;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=KQPS6VWIqoxUGIKzjCtZEAGsIFKddMASPAKvXmPDqkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPIu8fRCdKGZ4SCQXSx0nNK4SaEP8/kXlrnUsGiLxlbSPNWU6xYrClQ+gnXS955i9
	 H8/HbUWnLFWjI7KE9avYlT+F0mUtkCsVQfjKWkPWJBwL5435qWdXack2DFMAK+fhNX
	 S6FUI7mk/QECJPsd3g3KXRH1cpjl+TSz/iDhsRlBQluM7T5EFx0ZmyQCpn566rQdP/
	 EUzbh7LsSO9PFE5k2ovs6gCJrvmiYfu5r3uNkeKK0g/2vtd49VagznwT3tXMtktPdU
	 d9ENL1JpWoT2j3jvRRfz6rrr6KXto+YdRlDYWrCNEpaj/+1hyYu6VLG80h6+7o4umd
	 aSkNpKHD5WXVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138CC3601A;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:10 +0200
Subject: [PATCH v4 7/9] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-7-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=3168;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=yMRGcv4NDxS5f4RsDG3jcavLTc/4v1Vp9+gfvWITjSE=;
 b=z4V7FjLBhfDWvAK/MPeeswhO81HB045jAmWcR+8c6a2MVouD2w2CViqc93BqeR+zHQkWgrggA
 7OZrXST1CVIC3ObQ+viIuz8r0VqgOEi3VQPBwWr7d1JCsZB+S0OA1Ji
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

Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
comes with a 10.1 1280x720 display with a touchscreen (not working in
mainline).

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.

The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
I know is not supported upstream, the driver we currently use for this is
a mess and I doubt we will be able to get it in an upstreamable state.
---
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..2855d7090988380ca0d4df8459cd1a67049f1080
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -0,0 +1,102 @@
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
+/ {
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
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
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




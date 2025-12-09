Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF08D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6shSwz4IpN5lEF2wDNyGOg4pv2r7dNRE25sfJ205Z+U=; b=Js9Awz7/7D7Pkxut5BNz4TV7t5
	vIjGdAhCTQBC3fAmbIVlp7a9HYX5EiQDDTfvAHy1PXz8uDVQUOTb6KmhD0g4BS6jrDOR06IPKWENy
	j//aL+GHclO/MB6kZD0jHzKCM9ZJkCeDysjgJpTi20DjLxonvuHmZT6SypVLgeTyzzKcqEpEzgWLF
	VizKbWFXlrDkEXXfyc2VIleuBDThSRDwcFDAO/v6FxWvRnr5BtsiterFy0wKcY/vYWrcQ0/yvfVu/
	hT4byMjl70cNcFE3DBHrCdA3EfBu6WC5+gMWb2Tny+qgRIIxfXeITgqz/F98/lsI9Ny3Ycrmu4hS6
	MN4Op7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4nO-0000000En2R-0yst;
	Tue, 09 Dec 2025 20:58:54 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4nL-0000000En20-3nb9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:58:53 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vT4n7-00DO8D-8x;
	Tue, 09 Dec 2025 20:58:37 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH] arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer
Date: Tue,  9 Dec 2025 12:58:28 -0800
Message-Id: <20251209205828.689999-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125851_941900_7E19200B 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

Add support for the optional LIS2MDL magnetometer on GW71xx baseboards.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi  | 15 +++++++++++++++
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi  | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
index 429be2bab8a2..320806d3d073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
@@ -92,6 +92,15 @@ accelerometer@19 {
 		interrupt-parent = <&gpio4>;
 		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mag>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 /* off-board header */
@@ -174,6 +183,12 @@ MX8MM_IOMUXC_SAI1_RXD3_GPIO4_IO5	0x159
 		>;
 	};
 
+	pinctrl_mag: maggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_RXC_GPIO4_IO1		0x159
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x19
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 4bf818873fe3..9317e62304e3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -101,6 +101,15 @@ accelerometer@19 {
 		interrupt-parent = <&gpio4>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mag>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
 
 &pcie_phy {
@@ -198,6 +207,12 @@ MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x150	/* IRQ */
 		>;
 	};
 
+	pinctrl_mag: maggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25	0x150	/* IRQ */
+		>;
+	};
+
 	pinctrl_gpio_leds: gpioledgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01	0x6	/* LEDG */
-- 
2.25.1



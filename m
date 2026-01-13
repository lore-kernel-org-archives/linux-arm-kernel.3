Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773DFD2F35E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qx/w58a1c0nZPY0yFwoJNc8sLtjs4xEeceZzD03KrHY=; b=W2gfvmrztdQs89/7NwDgdd2YXA
	l1AjkckYa/aVvh8DbggBGQLtIlIZk3OsTF1XU54HeF31mAspoAFrCDsroelYp1cTgld5JTq4dxt/E
	tVprPI8n87s3+tOOh3XPV6iVSz1lQVGyMbqPJcFGDiCWyT8KCQvNhGPtWpumAzhi8/LRSOBhP7Q3b
	1jOc7ssIppAx/pOxsPtRDW8RQFabszWh4TudM3Sx1HLZACucd4cHN/X2BqpOAwvE/Bd8rpnT3bMWb
	GdGe2XD/9Cmxh0Dys99Jcgd8sq/PPy6ZH7BrkuPg27y1LrvOThxxl5314Wcxu7mgVDlFGH4aCgc6K
	iDiqmqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjk7-00000007bsT-2HBc;
	Tue, 13 Jan 2026 19:07:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfjk4-00000007br7-0CXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:07:49 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfjjn-0008Q2-SD; Tue, 13 Jan 2026 20:07:31 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 13 Jan 2026 20:07:29 +0100
Subject: [PATCH v8 3/3] arm64: dts: imx93: Add parallel display output
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-v6-18-topic-imx93-parallel-display-v8-3-4abccdc473a5@pengutronix.de>
References: <20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_110748_087219_53934195 
X-CRM114-Status: GOOD (  11.47  )
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

Add required OF nodes to support the i.MX93 parallel output (DPI) path.

On the i.MX93 a single LCDIF is connected to three bridges: DPI, LVDS
LDB and the MIPI-DSI whereas the i.MX91 support only the DPI bridge.

Map endpoint@0 as DPI bridge output since the i.MX93 TRM (Figure 485.
MEDIAMIX block diagram) doesn't mention any port-number <-> bridge
combination.

Set the MEDIA-AXI and MEDIA-APB clocks to the overdrive (OD) values
since the i.MX93 and i.MX91 use the overdrive (OD) clk settings per
default.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 54 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 12 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index 7958cef353766a430df5e626ff2403dc05a974b1..5a8813df6bc993d559fb0b20fc742a106bfe6315 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -1122,8 +1122,62 @@ media_blk_ctrl: system-controller@4ac10000 {
 				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
 			clock-names = "apb", "axi", "nic", "disp", "cam",
 				      "pxp", "lcdif", "isi", "csi", "dsi";
+			assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+					  <&clk IMX93_CLK_MEDIA_APB>,
+					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+						 <&clk IMX93_CLK_VIDEO_PLL>;
+			assigned-clock-rates = <400000000>, <133333333>;
 			#power-domain-cells = <1>;
 			status = "disabled";
+
+			dpi_bridge: dpi-bridge {
+				compatible = "nxp,imx93-pdfc";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpi_from_lcdif: endpoint {
+							remote-endpoint = <&lcdif_to_dpi>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpi_to_panel: endpoint {
+						};
+					};
+				};
+			};
+		};
+
+		lcdif: display-controller@4ae30000 {
+			compatible = "fsl,imx93-lcdif";
+			reg = <0x4ae30000 0x23c>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_LCDIF_GATE>,
+				 <&clk IMX93_CLK_MEDIA_AXI>;
+			clock-names = "pix", "axi", "disp_axi";
+			power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_LCDIF>;
+			status = "disabled";
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				lcdif_to_dpi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&dpi_from_lcdif>;
+				};
+			};
 		};
 
 		usbotg1: usb@4c100000 {
diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb564650882dc8c40e836e797b2fda1..5436b48b30e89eb1f939b398ce1bf105abe7e34b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -150,6 +150,18 @@ l3_cache: l3-cache {
 	};
 };
 
+&lcdif {
+	port {
+		lcdif_to_ldb: endpoint@1 {
+			reg = <1>;
+		};
+
+		lcdif_to_dsi: endpoint@2 {
+			reg = <2>;
+		};
+	};
+};
+
 &src {
 	mlmix: power-domain@44461800 {
 		compatible = "fsl,imx93-src-slice";

-- 
2.47.3



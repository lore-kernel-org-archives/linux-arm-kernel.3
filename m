Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F02EA794B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNveEdcWkqZy0//v4/AVZBspu+t1ixuAVjlYnG33EcQ=; b=I1iNWVEi3N6R4A+UluM67Y4C/U
	AKAuXzQhbDMHslFLis8pN/RnV22nedlOGt5tNA4GRl2tmeh9LpTOH7Z5tWsx7lEY3MzCgKrnGIZdy
	aLIOQy7S1xEd8bcXyO1HnL/NJ74e8VT+zq4ZXq/etsbcZXpcRy5RuxpwBzOytDnOlAq6/HMSyeFdR
	MnszJiE1P7PDn/dMpc2qz4VtnzdWzjs3w2BWZDfqcRnK140dK6Mgn6eR52tOnOSwb+If4YED1mpGW
	QNSiZOlFJhaJYAI1aQMtCOiOfHIP6aEh1iGHGi+eC1/OKE51Vb4VFqNK6ASWKjdSUaWVl+oPw4uST
	QwwTSzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnlhp-000000099EN-1mIW;
	Wed, 04 Feb 2026 22:50:41 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnlhm-000000099Dj-0fyR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 22:50:39 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vnlhX-00EvLM-C7;
	Wed, 04 Feb 2026 22:50:23 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
Date: Wed,  4 Feb 2026 14:50:20 -0800
Message-Id: <20260204225020.2039367-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260204225020.2039367-1-tharvey@gateworks.com>
References: <20260204225020.2039367-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_145038_193512_392F57DB 
X-CRM114-Status: GOOD (  15.20  )
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

The GW7906 is based on the i.MX8M Mini SoC featuring:
 - LPDDR4 DRAM
 - eMMC FLASH
 - microSD connector with UHS support
 - LIS2DE12 3-axis accelerometer
 - Gateworks System Controller
 - IMX8M FEC
 - software selectable RS232/RS485/RS422 serial transceiver
 - PMIC
 - 1x isolated RS232 UART
 - 1x off-board bi-directional opto-isolated digital I/O
 - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
   (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)

The GW7906 has much in common with the GW7903 so it is used as a base.
Differences include:
 - different GbE PHY
 - a couple of new GPIO's added
 - removal of uart1
 - removal of io-expander

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2:
 - ran through dt-format
 - use gw7903 as a base due to little difference in boards
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx8mm-venice-gw7906.dts    | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..83fc7faf81d8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
new file mode 100644
index 000000000000..c4d0610e34ab
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Gateworks Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+
+#include "imx8mm-venice-gw7903.dts"
+
+/ {
+	compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
+	model = "Gateworks Venice GW7906 i.MX8MM board";
+};
+
+&fec1 {
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_AMBER>;
+					default-state = "keep";
+					function = LED_FUNCTION_LAN;
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+					default-state = "keep";
+					function = LED_FUNCTION_LAN;
+				};
+			};
+		};
+	};
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
+		"dig1_out#", "dig1_in", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio5 {
+	gpio-line-names = "iob", "ioa", "", "", "", "", "", "",
+		"", "", "", "", "pci_wdis#", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&i2c1 {
+	/delete-node/ gpio@27;
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x40000041 /* RS422# */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x40000041 /* RS485# */
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x40000041 /* RS232# */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x40000041 /* DIG1_IN */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x40000041 /* DIG1_OUT */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x40000041 /* DIG1_CTL */
+			MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12	0x40000041 /* PCI_WDIS# */
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x40000041 /* IOA */
+			MX8MM_IOMUXC_SAI3_TXC_GPIO5_IO0		0x40000041 /* IOB */
+		>;
+	};
+};
+
+&uart1 {
+	status = "disabled";
+};
-- 
2.25.1



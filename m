Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1697CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEmTtuQ5MAiksNWo4fQktLs4V05ofQrIWqIwKTyIPDc=; b=faK0BiSJziPz8Wu/HCEkTJ7lHU
	nqIFMb9Wa/6Bh1Rs4iXdCH+pN/hfl7UKDnpxBiJHWiHg8a1/y06KnKufT7+fIbysoqHhmeImjrfJO
	DuCj7nq+rhahicou9TsZWGC1f0G8kN4rJnIlQB9Y1WUt7dC4Wd9qYShe91Q0OKVvc41NQVBtx7c7n
	ldWB9nNe0MyIZgnlyEnlqvRtEF//NejtwbaM6qNaDuLvFnzqT/pAmmxETVSFboEeCJ8Lie4DkgbBZ
	zyaG3IGenshbKH7YzqSLrdjJHBgAWUXC+PDJ+p5nYvZNDIgD9u98IyPf3kCt3Nili5eVHxOn3IZS5
	/JdWiAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBP-00000006zSi-3EHU;
	Fri, 15 May 2026 01:17:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBN-00000006zQq-2rHq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:17:42 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 724EC63C;
	Fri, 15 May 2026 03:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807850;
	bh=+KqnwulYH6hpoJDyC9v5o1KP7sG7cWLIcC3K7xBK6b4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jvgdupWPy7U5n9Sunh7dhHNA5yaiufDPgfP3I6HqD1+qFG7fX2iEDfv+g+EauvwXb
	 ezCZqjyaq3tBNisv3z6LqN3s88G1rm8D2/MtOrrjgvYNSOZWTX493MOsCv3DCmL/LS
	 7S9GuRZLZGtrQvrWtkVRsgzwAbVUdi4vnDwI1QR0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:38 +0530
Subject: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
In-Reply-To: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4872;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+KqnwulYH6hpoJDyC9v5o1KP7sG7cWLIcC3K7xBK6b4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQbQt3ZGd7EjcYIlnt8M0EzIwvDIJo4/Mm9g
 vFEqB+8+ISJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0GwAKCRBD3pH5JJpx
 RWKBD/9SBoXMvxwdXtmX8TXGZKa/xnqG8hByBG3YE9l6Cac0BmmehgzbvQVvwc4mvkAdOaAmJi/
 t7dQzrUw+YLiyJyBMOwm0OYn9GOAF5yHHyQzR9zM0UDrDBk2oAgyHr25e2GU5i2O9NHvtwe8aHe
 Iogv62QCyBdhUyBOv0rTv5uJWIRIzyIcoQkdMvhG4ey7BSOaRj8F0otoG1+KedsdCltkJRebstT
 iQSzDuKTXREdIwYfE83tERiHfX6xjt0BqzGps8NcZcb/x8siqIuK0rQm0+U8kuNFklokHkD26K1
 EOsJ8LkwZXHl42DWZtuFqZDrIQykFDkwttJ+g22O9zqMn2/4YFcezdSKQlDSSfCw7r35ax35DkI
 hPIrmljmvmyvR7BS1d3NAhCnd/KXDpvtzMk8u1FCXJLQG0FN/DBEQMi8c/HSJeJnBcc6rfmq/yy
 lTTxSDxXzsgKpQUBH728kuHHCJ4vNmSr8jhiMptsco25QRkuzUUlkF8/qbxf/03UIrYW29vAweL
 bi7X9YfLIv3AzFEYRhBARU2t9sS0/t8ipsXzdOM0d0j/ZjbH6e/VTXgbNNCma2To+eapVTLFTd6
 Q8IVJdoHPiQxT2ZOnE/N4giqx6z8lDj+3EAF+NfC+d0tfGa4vkvHKm6d+bgfLRevgA21AOrf+bE
 5IsYRsoBTcBC7UA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181741_874725_962A37E1 
X-CRM114-Status: GOOD (  11.91  )
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

RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
this camera sensor through the CSI0 connector.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 5269c9619b65..68a82e161c20 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -152,6 +152,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -245,6 +246,8 @@ k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-sdcard.dtbo
 k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
+k3-am67a-beagley-ai-csi0-imx219-dtbs := k3-am67a-beagley-ai.dtb \
+	k3-am67a-beagley-ai-csi0-imx219.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -318,6 +321,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
+	k3-am67a-beagley-ai-csi0-imx219.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
new file mode 100644
index 000000000000..998e178d8d1a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * RPi Camera V2.1 on BeagleY AI CSI0 port
+ *
+ * Copyright (C) 2026 Ideas On Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_imx219_csi0: imx219-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v_csi0: regulator-2p8v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V_CSI0";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_csi0: regulator-1p8v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V_CSI0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p2v_csi0: regulator-1p2v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V_CSI0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+};
+
+&mcu_pmx0 {
+	cam0_reset_pins_default: cam0-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x003c, PIN_OUTPUT, 7) /* (C1) MCU_MCAN1_TX.MCU_GPIO0_15 */
+		>;
+	};
+};
+
+&mcu_gpio0 {
+	status = "okay";
+};
+
+&main_i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	imx219_0: sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_imx219_csi0>;
+
+		VANA-supply = <&reg_2p8v_csi0>;
+		VDIG-supply = <&reg_1p8v_csi0>;
+		VDDL-supply = <&reg_1p2v_csi0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_reset_pins_default>;
+
+		reset-gpios = <&mcu_gpio0 15 GPIO_ACTIVE_HIGH>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				link-frequencies = /bits/ 64 <456000000>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};

-- 
2.54.0



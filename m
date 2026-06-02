Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252B9CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wV2y4+eb+55tnXDaxY1QNTYCn9WmVIQ1E1aWHXqQ+WQ=; b=e7+Co1OeCWaUtJcXb0d4tH+ARo
	uRGByIDtP0aosZE5G4r1Oa1DbtzGAqmZJqY+cpnPefma6zZW6SLP2AoXMgDEkoKg8GaaNCcSz1NPp
	Jmv1S5ssW6/XCsTQBRUujGSaDNOfcq8rWB0m0/ZfiNKehWShdofM77luBp1IWzlbT7YxbFCtT6rmL
	5z6xW9DPLXfNiZRJdLUgZT9Ct5Qlf1LJLZXMpItnkbf6yEbBd1nG4KvPWg8+Htuoen8gWwQmLb7HN
	GiR+TpsSQEVNDXDgOoOVP7IE2jGPnA3UlWFnEJ5uCXfCLNg9k94Smg/AvWwjpeKXYkJ9RqAW3kvKb
	iPJYXW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOkC-0000000D2Ez-0Pwd;
	Tue, 02 Jun 2026 13:01:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOk9-0000000D2Cy-194c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:01:18 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C26D103F;
	Tue,  2 Jun 2026 15:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405252;
	bh=YxVQ1DUhT9+NRjCyoBIkk+IeqRLqbHraYqHIX2FNh3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vNpJMMBca+4N+qhegxxijA+iPxPeOIbDIgUslddGJtj3SkftekrYK72XTvp3i5lRK
	 OQig0Tk729+aX+HSOIW+d+8okK6RU8t7OD36ZmI8GI+L2Rg0W9r++H5q3OTyulrul3
	 7K4DVQykUZDwfM0dfrzjeQzhf5YtSrR6vdzjcbmU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:29 +0530
Subject: [PATCH v3 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-3-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5087;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YxVQ1DUhT9+NRjCyoBIkk+IeqRLqbHraYqHIX2FNh3I=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQESKhJcNzc0bN0O2IwLsK0sG+XVmiQ6DKJ1
 hZBFN40YvmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UBAAKCRBD3pH5JJpx
 RRZpD/0YevXomcTEv+IZWNQ86LAU/aIs3JoCLlz2LWviqVO6UU26KbweKK+t/KeORRGh2CmfNPU
 F2BBqCVdcyIvYNrTobitdRgsLwNxhOzbtFNS+iyHc5nU2WO5erSBUaTW2xRYl2L55GJzWW3edCT
 9KZO7UIZfWv4oJ22nwhcHvkljXwR89iu1KG1ZKOaNcAnnvkT2qcGRLdSoS4WuoiSKkz66Odgfx7
 mSqXfKxPqUTVrrak3XH8YtVis2bENb34Bm5IHvR4uO7rL4LFcJwlQQ+xa5VW5M32SNrnOfF8KOV
 EpHvsUtdoPZ4P/KQKeJM1Mic4Q5fpnWM5cZaK9QnObFWdPyu5oBjCEy8yb32Sp46scVSCAjX0L1
 cttLi+s/6CTp8THQdljcgul8eoKhVAganFLUE3pIjBCxlHB98loVUiT9CpChDDw+h++muuLBSFW
 r78fgDBOQYvIF6toFbi5LHdlYwLGPQmncs++5uWpmlVddZT7zlc0SDnE44q+Cof9OCHsXt7ufZp
 uMgWYnnu6LeOWlqDp6tbyPcu8OHh6QS+KaQrCbOJRJ40hgsKEsP7u4jSD2goASntZ+7jRxIbIsy
 Nc5a23BRA7Z//1AyjnF+rbbDiYfnG8BBs6IxFDluDIIe11s0/qHUqs+q4aFtT+U36qaieWkEX5m
 qjgOs/9he195m9Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_060117_463811_A46A1874 
X-CRM114-Status: GOOD (  12.51  )
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

Link: https://pip.raspberrypi.com/categories/1205-drawings-and-schematics
Link: https://docs.beagle.cc/boards/beagley/ai/03-design.html#csi
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Now that I2C node is defined by the board DTS, only set status = okay
  here
- Add schematic links for the v2 camera module and BeagleY CSI connector
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 118 +++++++++++++++++++++
 2 files changed, 122 insertions(+)

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
index 000000000000..1b1c68f23cc3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
@@ -0,0 +1,118 @@
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
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



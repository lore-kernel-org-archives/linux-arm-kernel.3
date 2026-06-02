Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DDCCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6ojnK/p24Xb/0ipCtTz4E7/ADrSvh526j92eTYmzh8=; b=tkey2XNVfyx6IO4MzNbtRZREiZ
	AUCqIBpn7w+dCokgZW61hdEfFFXHKaaa8spmpZWimscCurlgXnkEMcH5bRRPYkETBKM0zITtrLP/B
	AtiYmY28kyVCd0FaNaaThvwBRp6s9yi3eU7NCqN2GudkKIs7wUxnMeQo6BjaPfBLes3GZcGJWyeYK
	7uh7Bl+EYUp3hChzWIR5DdOEIBrBlLc4Pyw+p3XGMfUsIqw3VqTPthfMLhfhrhZexAVf+Vg8oXTRs
	pVt+0jyKWa4lS0yILvmcJdhx8kn+xFi0atMw9cPBe5pjvIgYNQZrqpg28zEj3vDy00Xl0HxxsGpQP
	cghntIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOkI-0000000D2IZ-1EwN;
	Tue, 02 Jun 2026 13:01:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOkE-0000000D2Ft-3XWF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:01:24 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF5E1103F;
	Tue,  2 Jun 2026 15:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405258;
	bh=GT4w4gtqjY0VcKrqe3C/0fAMkIWcAPHxwpTVBPjzcFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BZ1bk+L5g++f6XN/GdgcDpbdkMt3+UDubkBAyMBUhopJIC6wB+YDXk4GNod6PHxOx
	 B+SPQqiWRWFVbXLx3rj8YUf4B+ZpZ5oee0PdDgtC1Bp1unLFgWd1MppUl4/eVhncC8
	 2kahMMTkpPnlX3iWezrCWXt7SeNmaQ207wG7Ej8g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:30 +0530
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-4-fe6ae35b7eda@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5227;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GT4w4gtqjY0VcKrqe3C/0fAMkIWcAPHxwpTVBPjzcFk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQF+YigSfKXhmo/zTgVNURHOJLZRcBFCEobz
 iUQLVMzBqCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UBQAKCRBD3pH5JJpx
 RVfUD/0QcIz4oS625+mHXIKUYRDlZBuUfPmyKToyu/5xjsI5v5+hnL0XzxeEjaqc5oQSxZ3DwSk
 QC6894WggPjApQH8sInFdtpaBnKEVoR7c5ZbrJ9WLhxV+z1pu4QhRIflk1qlfI0ueTy7nw54T8Y
 lqlnSS1pF8OWUtPVUbIrlF+2rYO/IWzqQk7c+5FaCXNyimpngFW1zUWZpQ5iCzTBqWCJFoU/jgL
 Ycmsz1bg2/M9fWIRfReZcBawF1s/KRELHPMB/zRSSuV/28scptanXoSI+qF+At9yWnSIgFvsNsn
 peQeOivC8QC1+L5CYuVd3IikIqZg8+Dw3NGbiAUrkWfMnljOW0Zw4niUR9r0aCZdje1S2TPM66s
 P5t8cWKF8eoYakgc0vOOnFAkG6k/Vomzo7Ub8ldefChXqOl4fMsiuACP8ileuaIDVt4zMPVU92M
 5ioZqL/QSa5ljUSk/ZnySVqir3/1peFJ22CvIcy8EO/cO5f/Oc5ZYEjav7iP+ZsdoR0FqzjxBtF
 6jQQ45L4lSNMC+1TGyCl9ZrBG6GU00DxTzv7wGuTRhuFXetZ+x3L6ARQyjYIfZfjUSaNZqYbr4F
 a13fl4cDpepEQPYw4+VOEQA+UxF4n57PKGMz9YX11ZSaj46W6OmZ7deGMTE06swWUvDHZSVik9U
 j7cbhA9F+/MN9pQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_060123_038981_D761CE20 
X-CRM114-Status: GOOD (  12.88  )
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
this camera sensor through the CSI1 connector.

The CSI1 connector is muxed with DSI0, so ensure that we route it to
CSI1 (DSI_CSI_OE=0 and DSI_CSI_SEL=1).

Link: https://pip.raspberrypi.com/categories/1205-drawings-and-schematics
Link: https://docs.beagle.cc/boards/beagley/ai/03-design.html#id60
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Now that I2C node is defined by the board DTS, only set status = okay
  here
- Add schematic links for the v2 camera module and BeagleY CSI connector
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 118 +++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 68a82e161c20..51e74f26c803 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi1-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -248,6 +249,8 @@ k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
 k3-am67a-beagley-ai-csi0-imx219-dtbs := k3-am67a-beagley-ai.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtbo
+k3-am67a-beagley-ai-csi1-imx219-dtbs := k3-am67a-beagley-ai.dtb \
+	k3-am67a-beagley-ai-csi1-imx219.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -322,6 +325,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtb \
+	k3-am67a-beagley-ai-csi1-imx219.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
new file mode 100644
index 000000000000..cf3729f5ae60
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * RPi Camera V2.1 on BeagleY AI CSI1 port
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
+	clk_imx219_csi1: imx219-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v_csi1: regulator-2p8v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V_CSI1";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_csi1: regulator-1p8v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V_CSI1";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p2v_csi1: regulator-1p2v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V_CSI1";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+};
+
+&main_pmx0 {
+	cam1_reset_pins_default: cam1-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01d8, PIN_OUTPUT, 7) /* (D22) MCAN0_TX.GPIO1_24 */
+		>;
+	};
+};
+
+&dsi_csi_mux {
+	idle-state = <1>;
+};
+
+&main_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	imx219_1: sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_imx219_csi1>;
+
+		VANA-supply = <&reg_2p8v_csi1>;
+		VDIG-supply = <&reg_1p8v_csi1>;
+		VDDL-supply = <&reg_1p2v_csi1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_reset_pins_default>;
+
+		reset-gpios = <&main_gpio1 24 GPIO_ACTIVE_HIGH>;
+
+		port {
+			csi2_cam1: endpoint {
+				remote-endpoint = <&csi2rx1_in_sensor>;
+				link-frequencies = /bits/ 64 <456000000>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx1_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam1>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};

-- 
2.54.0



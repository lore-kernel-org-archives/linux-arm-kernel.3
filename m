Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE07C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77aEx/djcIVNMiFEfEXiQXFN8cf54JEqS+P/6rsE/QY=; b=NMeltFU1AAxdn4hF/mzDa3jsK/
	YDwfDwbBfGlLr65mOJgXYi6woZuM+HpiIDBAJC5o4eYU+N1fppdL0j+v1oxaSRgKR/vQtaY6MOmSS
	QYpIuFfbPZkpQG7AoQBtsNPLQDHAHrEHAT36UEpnv90cY9Mf+oVdntRJ4Dw73vvUYkj+JcioKnLHJ
	vKthQg2g7Oe3K+j0izJKJvHOCNLQxfaBQ2A3Ueye7DS9+2H3QY7jGv8W9RxzAC1AV+if42xMfDL8O
	c3HyHZ6g6RrGqxIgf7Q4PqyCx6RqfXwVv6C+rlxiw1qYaXUB13xygshp5jjKmD8W4UznoEZscE3zL
	xOYQ0NCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyct-0000000FGfj-0vqy;
	Wed, 12 Aug 2026 02:23:31 +0000
Received: from mail-m16023652187.xmail.ntesmail.com ([160.236.52.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyck-0000000FGct-2cCp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 02:23:25 +0000
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49a56c4be;
	Wed, 12 Aug 2026 10:23:16 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 12 Aug 2026 10:22:39 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786501394; l=7609;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=WvBb4enhOmm2D0QOA844ugJYPtnmrDyFbejX+Dw2N4A=;
 b=geBxUgCFxyo2pnYhuLw2TG3jUPQTSTDkYeuiQ9/FL1HYDzZlCSZrYLTizp9SSf+G9uAqbysy3
 ScXM5BETmDpB50+cIfZAuqQ3oyE+EwtoZqzjMVyubxSmoFwGPBCHn7x
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff3c7f9f409d5kunm2a4e641d37f4a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUJNVhpMGRodSkseQxpKGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=WwlIp6BzyTSjvK5yBQHRNpHtUXoXZelY+nIYaNyO2QhAynLmjNo3onxTMlFOv/us2NCfZrEz4cMJaDzP4jHb12rNKomZ2YAwrWQqNbdIlfC/oYLjfhdAC3k5VshvNtqwb7fpPnuw/zh2wMYsQeifJg/u023ZRn+93P9Pr2HU/NI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=77aEx/djcIVNMiFEfEXiQXFN8cf54JEqS+P/6rsE/QY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_192323_050945_472A8A88 
X-CRM114-Status: GOOD (  12.48  )
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

RUBIK Pi 3 ships without camera sensors, and its two connectors support
multiple modules. Keep module-specific nodes out of the base board DTS
and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
sensors.

CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
overlay describes the 24 MHz sensor input clock and models the module
power domain controlled through the connector PWR_EN signal. The
baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
regulator.

Describe each connector CAMERA_GPIO signal as a privacy indicator LED
and associate it with the corresponding sensor. This lets the V4L2 core
control the LED while the sensor is streaming.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 115 +++++++++++++++++++++
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 115 +++++++++++++++++++++
 3 files changed, 245 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..c4afe71436c4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -186,6 +186,21 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
+
+qcs6490-thundercomm-rubikpi3-cam1-imx219-dtbs := \
+	qcs6490-thundercomm-rubikpi3.dtb \
+	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo
+qcs6490-thundercomm-rubikpi3-cam2-imx219-dtbs := \
+	qcs6490-thundercomm-rubikpi3.dtb \
+	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
+qcs6490-thundercomm-rubikpi3-dual-imx219-dtbs := \
+	qcs6490-thundercomm-rubikpi3.dtb \
+	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo \
+	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam1-imx219.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam2-imx219.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-dual-imx219.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-vicharak-axon-mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
new file mode 100644
index 000000000000..b6d7a8235720
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Thundercomm All rights reserved.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+&{/} {
+	cam1_imx219_clk: clock-camera1-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	leds-camera1 {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam1_privacy_led_state>;
+		pinctrl-names = "default";
+
+		cam1_privacy_led: led-camera1 {
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	/* Camera module power domain controlled through connector PWR_EN. */
+	vreg_cam1_pwr: regulator-camera1-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera1_pwr";
+
+		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_pwr_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_vcc3v3_output>;
+	};
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam1_imx219_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&cam1_imx219_clk>;
+
+		VANA-supply = <&vreg_cam1_pwr>;
+		VDIG-supply = <&vreg_cam1_pwr>;
+		VDDL-supply = <&vreg_cam1_pwr>;
+
+		leds = <&cam1_privacy_led>;
+		led-names = "privacy";
+
+		port {
+			cam1_imx219_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_privacy_led_state: cam1-privacy-led-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	cam1_pwr_en: cam1-pwr-en-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
new file mode 100644
index 000000000000..ff1ccf965df8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Thundercomm All rights reserved.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+&{/} {
+	cam2_imx219_clk: clock-camera2-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	leds-camera2 {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam2_privacy_led_state>;
+		pinctrl-names = "default";
+
+		cam2_privacy_led: led-camera2 {
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	/* Camera module power domain controlled through connector PWR_EN. */
+	vreg_cam2_pwr: regulator-camera2-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera2_pwr";
+
+		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_pwr_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_vcc3v3_output>;
+	};
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@4 {
+			reg = <4>;
+
+			csiphy4_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam2_imx219_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&cam2_imx219_clk>;
+
+		VANA-supply = <&vreg_cam2_pwr>;
+		VDIG-supply = <&vreg_cam2_pwr>;
+		VDDL-supply = <&vreg_cam2_pwr>;
+
+		leds = <&cam2_privacy_led>;
+		led-names = "privacy";
+
+		port {
+			cam2_imx219_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam2_privacy_led_state: cam2-privacy-led-state {
+		pins = "gpio19";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	cam2_pwr_en: cam2-pwr-en-state {
+		pins = "gpio58";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.43.0



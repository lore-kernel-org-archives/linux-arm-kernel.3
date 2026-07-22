Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50369C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWKg1OcG8yy6zm9ENl1TpleNXXVl9wMChbj1z8MRdUI=; b=Axa3LxUzmwYHBjKNLa2PXmM0E9
	603FvsCpklrRKfTOvPHcbEaiZBLuHcz99eGKFid0Qk7dUtx6e8EIKeNFqHJBs+1XKwwLcBb9loTN0
	TySn6jB8nckBNtLo+/yNrNnu8P5KBHMM+subUCkf5agBTk8PQVN6rTjPUZnu6rT9Rcv/2dYVacauJ
	QauxaWbXzCHcNkcmt7xFM4umtuyDjWSA0NxnnkrR5hgRFlS/ZhBNQxnqUtjJkrpz/Zr/GUhdBSzVD
	eW5gLJWb7Xki2DpbX1VEcnEEkhmTOJWIXKojtFZ/pR23oLepxbsgsPWs741ZFXxGMjZ8/wtEKE48l
	rCjl5zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZZJ-0000000CISR-3VEX;
	Wed, 22 Jul 2026 16:13:13 +0000
Received: from mail-m25482.xmail.ntesmail.com ([103.129.254.82])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZZH-0000000CIQe-0Ohu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:13:12 +0000
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 472ee9f2c;
	Thu, 23 Jul 2026 00:13:04 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 23 Jul 2026 00:12:40 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784736781; l=7630;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=w8vi2Qu6Lg0xl9BcJ4k/gM3jWdZL5xhUg9zN5K+724I=;
 b=aA7fHvrjJqDmZOEtCl+XGBz0VDT3sBBHviSc9zQWx5oo1P23VlV7XRDzTkpXuU34vZAzAw8Qm
 En6UY1WVnm3DnVF4UP/eofqACociTQs8/927XlKNa+RuOjNE9FCtu2i
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8a9a1f5909d5kunm8c572dff4a6e6f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDThhNVhpCS0tDTE1NQk9OQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=GsJZMn1QIczUiS9Z0aMfLZpMAImK5xfZw8w30iaKn0ituKXE7iHE0k2L0CEd5VytSVMkGBGzDMenaXrgbG/gxc0W3TbqoAk/2KCCgd9+7ZxeJikQD+TrPjPpPntyEq2Y+RGVqJrpE0A1hxzccpsXiGlYx6ZNX/Y6pxt9tmlfD3Q=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vWKg1OcG8yy6zm9ENl1TpleNXXVl9wMChbj1z8MRdUI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_091311_408543_F7BD6B56 
X-CRM114-Status: GOOD (  11.72  )
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
overlay describes the 24 MHz sensor input clock and the three sensor
rails derived from the switched 3.3 V connector supply.

Describe each connector CAMERA_GPIO signal as a privacy indicator LED
and associate it with the corresponding sensor. This lets the V4L2 core
control the LED while the sensor is streaming.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 117 +++++++++++++++++++++
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 117 +++++++++++++++++++++
 3 files changed, 249 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..89c1d12ed299 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -185,6 +185,21 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
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
index 000000000000..620b4b3463b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
@@ -0,0 +1,117 @@
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
+	/* The module enables its three sensor rails together through PWR_EN. */
+	vreg_cam1_pwr: regulator-camera1-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera1_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
index 000000000000..80479fffcdcb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
@@ -0,0 +1,117 @@
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
+	/* The module enables its three sensor rails together through PWR_EN. */
+	vreg_cam2_pwr: regulator-camera2-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camera2_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71456C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgvszO+wBSoNEU81A+0QJdcuc4DFD07r00+GydE6Hv0=; b=NaiACB9346jpoyRxockvf7dP7i
	WA1MbkRBXxH+9oGPzTSi17/ExifS/fUUEN1n0HZnLRAFeGeSRUMptecibXDR3L/j3iNPOwmYPZCbA
	ZfPizgC7ri3IfzCGjsM/Ng0HnOnltabVI9M5r9WBkqYBCp8XiaCUcezJbDgfixhFje7N2le6WR8cX
	ccxs3kKZusx9WI3wPynGWSE/xe3FFCDXoyOQC5rr7eQgTHnDr30LT2yNyCncMJQvpwu7ZTjASCVf3
	rcc2hSrSWvMEnS3UM+2H9DvCSViiH6VzSBSYhEBS+orw7qqo5V/XjyBCybFFRFyKI3jjiyelpgXhc
	jY4SeMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqid-00000009yDq-47L5;
	Mon, 04 Aug 2025 08:38:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqFC-00000009u9N-1zz6;
	Mon, 04 Aug 2025 08:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72C2FA55589;
	Mon,  4 Aug 2025 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1944BC4CEE7;
	Mon,  4 Aug 2025 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754294909;
	bh=lpMnSBw5eXCFVEZ77Jf4N2uMk6YKZK4ppHKLrkinK64=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NHEBBC0PhuMqHUT4z3zhOU8n5GSfIe7Bc1sbw9xgcguxIeP6n9ioJvn9ErK0G1Ffp
	 X+XR9ITRy7HF7Qw7ebDkREj95pfoGYQHNP6S6f/p9ul9lo6NoR6iwRwPnAoEF9hO/z
	 0tGtfZ2brjWfXxy1nZGGmoXT0nWmhxJszbuvF33cQiWM+OmuHcj+KkUkQcFa/DHoOC
	 U9GfwBuezTiB0FZ+yc9jNHqSDsSeGVaR7WDISaeJF29EfQCkX8OYp8XOclPkVyyinh
	 2kKy+5jcNhXeYyMKPPMBs/30JNsq5mptNb4U427tYsQ83g9Yz4GJITvVUKMces2MkV
	 kw9KLsRj1nQ7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CAEC87FCB;
	Mon,  4 Aug 2025 08:08:29 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 04 Aug 2025 16:08:26 +0800
Subject: [PATCH] dts: arm64: amlogic: Add ISP related nodes for C3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-b4-c3isp-v1-1-adb39bd3b0d9@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAHlqkGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2ND3SQT3WTjzOICXUMzU2NDY0vDRMPkJCWg8oKi1LTMCrBR0bG1tQB
 OizK4WgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754294908; l=5995;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=UmVS1PU/90tdLntCDKm08KbbQoIVC5jklVv6ZZ2RpE0=;
 b=CvaC63kuttoGnMbyky21IYl3jG9Guba6QMeoAelHvvIp0BG+sfdGPKvnArm8bjK3hM8FrSTmt
 KPoQEpgIYRZAYamkC2ngCW/PV8qn6YUkkaZPtZ+en+sx374PACLBJ4w
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_010830_657774_B4FBC4B2 
X-CRM114-Status: GOOD (  10.05  )
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
Reply-To: keke.li@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Keke Li <keke.li@amlogic.com>

Add the IMX290 sensor node description to the device tree file,
which will be controlled via I2C bus with image data transmission
through MIPI CSI-2 interface.

Add CSI-2, adapter and ISP nodes for C3 family.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
The C3 ISP driver and device-tree bindings have been
submitted. To facilitate using the C3 ISP driver, the
related device nodes need to be added.
---
 .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 84 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 88 ++++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
index 45f8631f9feb..e026604c55e6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		serial0 = &uart_b;
 		spi0 = &spifc;
+		i2c2 = &i2c2;
 	};
 
 	memory@0 {
@@ -146,6 +147,36 @@ sdcard: regulator-sdcard {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	camera_vdddo_1v8: regulator-camera-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDDO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	camera_vdda_2v9: regulator-camera-2v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDA";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		vin-supply = <&vcc_5v>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	camera_vddd_1v2: regulator-camera-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDD";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &uart_b {
@@ -258,3 +289,56 @@ &sd {
 	vmmc-supply = <&sdcard>;
 	vqmmc-supply = <&sdcard>;
 };
+
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins1>;
+	clock-frequency = <100000>; /* default 100k */
+
+	imx290: sensor0@1a {
+		compatible = "sony,imx290";
+		reg = <0x1a>;
+		clocks = <&clkc_pll CLKID_MCLK0>;
+		clock-names = "xclk";
+		clock-frequency = <37125000>;
+		assigned-clocks = <&clkc_pll CLKID_MCLK_PLL>,
+				  <&clkc_pll CLKID_MCLK0>;
+		assigned-clock-rates = <74250000>, <37125000>;
+
+		vdddo-supply = <&camera_vdddo_1v8>;
+		vdda-supply = <&camera_vdda_2v9>;
+		vddd-supply = <&camera_vddd_1v2>;
+
+		reset-gpios = <&gpio GPIOE_4 GPIO_ACTIVE_LOW>;
+
+		port {
+			imx290_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <222750000 148500000>;
+				remote-endpoint = <&c3_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			c3_mipi_csi_in: endpoint {
+				remote-endpoint = <&imx290_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&adap {
+	status = "okay";
+};
+
+&isp {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..a62fd8534209 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -992,5 +992,93 @@ mdio0: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		csi2: csi2@ff018000 {
+			compatible = "amlogic,c3-mipi-csi2";
+			reg = <0x0 0xff018000 0x0 0x100>,
+			      <0x0 0xff019000 0x0 0x300>,
+			      <0x0 0xff01a000 0x0 0x100>;
+			reg-names = "aphy", "dphy", "host";
+			power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
+			clocks = <&clkc_periphs CLKID_VAPB>,
+				 <&clkc_periphs CLKID_CSI_PHY0>;
+			clock-names = "vapb", "phy0";
+			assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+					  <&clkc_periphs CLKID_CSI_PHY0>;
+			assigned-clock-rates = <0>, <200000000>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					c3_mipi_csi_out: endpoint {
+						remote-endpoint = <&c3_adap_in>;
+					};
+				};
+			};
+		};
+
+		adap: adap@ff010000 {
+			compatible = "amlogic,c3-mipi-adapter";
+			reg = <0x0 0xff010000 0x0 0x100>,
+			      <0x0 0xff01b000 0x0 0x100>,
+			      <0x0 0xff01d000 0x0 0x200>;
+			reg-names = "top", "fd", "rd";
+			power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+			clocks = <&clkc_periphs CLKID_VAPB>,
+				 <&clkc_periphs CLKID_ISP0>;
+			clock-names = "vapb", "isp0";
+			assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+					  <&clkc_periphs CLKID_ISP0>;
+			assigned-clock-rates = <0>, <400000000>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					c3_adap_in: endpoint {
+						remote-endpoint = <&c3_mipi_csi_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					c3_adap_out: endpoint {
+						remote-endpoint = <&c3_isp_in>;
+					};
+				};
+			};
+		};
+
+		isp: isp@ff000000 {
+			compatible = "amlogic,c3-isp";
+			reg = <0x0 0xff000000 0x0 0xf000>;
+			reg-names = "isp";
+			power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+			clocks = <&clkc_periphs CLKID_VAPB>,
+				 <&clkc_periphs CLKID_ISP0>;
+			clock-names = "vapb", "isp0";
+			assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+					  <&clkc_periphs CLKID_ISP0>;
+			assigned-clock-rates = <0>, <400000000>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+
+			port {
+				c3_isp_in: endpoint {
+					remote-endpoint = <&c3_adap_out>;
+				};
+			};
+		};
 	};
 };

---
base-commit: 84b92a499e7eca54ba1df6f6c6e01766025943f1
change-id: 20250731-b4-c3isp-16531391a1cb

Best regards,
-- 
Keke Li <keke.li@amlogic.com>




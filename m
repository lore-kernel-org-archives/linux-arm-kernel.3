Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60518CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgvszO+wBSoNEU81A+0QJdcuc4DFD07r00+GydE6Hv0=; b=QJS+PDmmWxooq9/HHIphAnBqEi
	sewMkIsH0YcoTEtlNPzpJi67yDEryalOurXaM/N+Rxkcdb3XSOqE1wY8LyzGqqsUh1fPfV98rodSX
	lgt4mgj0lF4fXkvLmpjM7Rhr2+XLs7czdNKlj9KRf+P9oGbza1gtTzVI84ptarcZ48P2Ud5BO3pkc
	/gaBd+XbDZ3bC17oksm4FiYnbtFuZiTqwdMTEFWAYHTm5k3o3mUalgdukOh7Yjn9ILdW3AUarG5PU
	LrSc+AK5xYD/cTD2/1d9H7SrTk68zLevVHqVuTtSl/11bTjhEML7lsg6OslmQHChy5qcPc+FltESA
	JZfo4wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA6p-0000000Gif0-2AH3;
	Thu, 18 Sep 2025 08:35:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA6o-0000000GieT-09Wx;
	Thu, 18 Sep 2025 08:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59536601FC;
	Thu, 18 Sep 2025 08:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00F32C4CEE7;
	Thu, 18 Sep 2025 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758184517;
	bh=lpMnSBw5eXCFVEZ77Jf4N2uMk6YKZK4ppHKLrkinK64=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cRJKn1RH/+X2dxtSg2ezHCIjH8dJoJ2gMmAjFXF3xzY8LmnmQrLmM3HNgOsO9Pdu8
	 cFXgMnDwM0w+IUiFlBENbF5KJOit6j86lC3kr5Kka6ezL8FzTKzJOG6h7qJlGZw0RE
	 MRifjO3AHzqyxG/NJYdcC84xIF2oa9geajtb1IVsNRFXM1Ka1X96vNr304J2y/kO0j
	 EAQf/2KoXFDZzBXQvnzGwpQyCM5zudKZa4Czu9NuEo5j6bBK2xQvcjWEvugxa9yDtf
	 +i+PgjLla+XqQu6i8/ABBPKelqUwGj/V/YO45TvgJjtYiUUCkkCHm+vDLd+FJidl06
	 pHsY6CRzKMwAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1098CAC59F;
	Thu, 18 Sep 2025 08:35:16 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 18 Sep 2025 16:35:09 +0800
Subject: [PATCH RESEND] dts: arm64: amlogic: Add ISP related nodes for C3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-b4-c3isp-v1-1-5f48db6516c9@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758184516; l=5995;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=UmVS1PU/90tdLntCDKm08KbbQoIVC5jklVv6ZZ2RpE0=;
 b=rOF2nql3OL4yABLAuC+LQqHynH/oDDl+RTCOUrGInFY9HEDC/KN8vaRuOultWR8rlGgKKIJWT
 mzviPpJYSmBA10Cqza6TcVMTR41EHARbh2ZWa72nAbwjbMEmcFmKK6j
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
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




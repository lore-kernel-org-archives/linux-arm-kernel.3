Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1107C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCTfjr+f1FafIc1yYmGfv3Kx0C4OjTm44rD+bxKZn5Q=; b=rnfMnLlQEApSvEw65ngU03GR9x
	6px/48mMOaRizNni7BFTSg43T53UY0X1PaGt5VRNd7ZfG1zHBvbLXatwUEhG2EAJF88vWs2rkQgo3
	3Gccxx4FtUd1xKN10hmhLBGw487ehJ/1iSv/+zZ1ZuCTYJ2PclRQOo/LtzP9a7QEePh739g1BRSGh
	wbeHSSBad8CjTK67gDfbK+oPJ8QnW90HWeGHM952oJPImLgzYmmtmZePKN3Bup92PKUDpP9jX23M5
	gP4722VRAtySFFhD616csATO/au2nAXTxivVMPo7xdATQf+FvW0aL0YGAUcJyyDx7p9Hynz5wLASW
	8mMyWZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOr9-00000009k3W-0ylQ;
	Fri, 07 Feb 2025 13:57:19 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOpE-00000009jW2-01uj;
	Fri, 07 Feb 2025 13:55:21 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id F0F5F100901;
	Fri,  7 Feb 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1738936516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wCTfjr+f1FafIc1yYmGfv3Kx0C4OjTm44rD+bxKZn5Q=;
	b=ghrDFjIX48psAkBcd6Y88E++Na1OEarqQ/AzlreK1r8oK7UWtxLys6BMoiQjeoExuiQZ5s
	tn+lY+GtEQowoZ3/WDJkYPE1nfkjsOKvF9gqc4002smsB//vmPW+fbizLlcpWIxiBUKw6F
	cBnVmVdYxNLLKWAZ2mw4Aj1hfDGBubs=
Received: from frank-u24.. (fttx-pool-217.61.148.125.bambit.de [217.61.148.125])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 2EE5810010F;
	Fri,  7 Feb 2025 13:55:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
Date: Fri,  7 Feb 2025 14:54:59 +0100
Message-ID: <20250207135501.30741-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 50e4dac5-3d8a-4e0c-87d8-2e55e4fd535c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_055520_377673_DE7CBDEA 
X-CRM114-Status: GOOD (  13.73  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Sinovoip has released other variants of Bananapi-R4 board.
The known changes affecting only the LAN SFP+ slot which is replaced
by a 2.5G phy with optional PoE.

As the SFP-Ports are not upstreamed yet this patch simply renames the
current board dts to dtsi, creating new dts for the board including
the new dtsi and move i2c-mux channel for sfp lan to board dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
 2 files changed, 407 insertions(+), 400 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 6623112c24c7..431bf066fffb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -2,408 +2,12 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+#include "mt7988a-bananapi-bpi-r4.dtsi"
 
-#include "mt7988a.dtsi"
-
-/ {
-	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
-	model = "Banana Pi BPI-R4";
-	chassis-type = "embedded";
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	reg_1p8v: regulator-1p8v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-};
-
-&cpu0 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu1 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu2 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu3 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu_thermal {
-	trips {
-		cpu_trip_hot: hot {
-			temperature = <120000>;
-			hysteresis = <2000>;
-			type = "hot";
-		};
-
-		cpu_trip_active_high: active-high {
-			temperature = <115000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-
-		cpu_trip_active_med: active-med {
-			temperature = <85000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-
-		cpu_trip_active_low: active-low {
-			temperature = <40000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-	};
-};
-
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins>;
-	status = "okay";
-
-	rt5190a_64: rt5190a@64 {
-		compatible = "richtek,rt5190a";
-		reg = <0x64>;
-		vin2-supply = <&rt5190_buck1>;
-		vin3-supply = <&rt5190_buck1>;
-		vin4-supply = <&rt5190_buck1>;
-
-		regulators {
-			rt5190_buck1: buck1 {
-				regulator-name = "rt5190a-buck1";
-				regulator-min-microvolt = <5090000>;
-				regulator-max-microvolt = <5090000>;
-				regulator-allowed-modes =
-				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			buck2 {
-				regulator-name = "vcore";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			rt5190_buck3: buck3 {
-				regulator-name = "vproc";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-boot-on;
-			};
-			buck4 {
-				regulator-name = "rt5190a-buck4";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-allowed-modes =
-				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			ldo {
-				regulator-name = "rt5190a-ldo";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-};
-
-&i2c2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_1_pins>;
-	status = "okay";
-
-	pca9545: i2c-mux@70 {
-		compatible = "nxp,pca9545";
-		reg = <0x70>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+&pca9545 {
+	i2c_sfp2: i2c@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			pcf8563: rtc@51 {
-				compatible = "nxp,pcf8563";
-				reg = <0x51>;
-				#clock-cells = <0>;
-			};
-
-			eeprom@57 {
-				compatible = "atmel,24c02";
-				reg = <0x57>;
-				size = <256>;
-			};
-
-		};
-
-		i2c_sfp1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		i2c_sfp2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
+		reg = <2>;
 	};
 };
-
-/* mPCIe SIM2 */
-&pcie0 {
-	status = "okay";
-};
-
-/* mPCIe SIM3 */
-&pcie1 {
-	status = "okay";
-};
-
-/* M.2 key-B SIM1 */
-&pcie2 {
-	status = "okay";
-};
-
-/* M.2 key-M SSD */
-&pcie3 {
-	status = "okay";
-};
-
-&pio {
-	mdio0_pins: mdio0-pins {
-		mux {
-			function = "eth";
-			groups = "mdc_mdio0";
-		};
-
-		conf {
-			pins = "SMI_0_MDC", "SMI_0_MDIO";
-			drive-strength = <8>;
-		};
-	};
-
-	i2c0_pins: i2c0-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c0_1";
-		};
-	};
-
-	i2c1_pins: i2c1-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c1_0";
-		};
-	};
-
-	i2c1_sfp_pins: i2c1-sfp-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c1_sfp";
-		};
-	};
-
-	i2c2_0_pins: i2c2-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c2_0";
-		};
-	};
-
-	i2c2_1_pins: i2c2-g1-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c2_1";
-		};
-	};
-
-	gbe0_led0_pins: gbe0-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe0_led0";
-		};
-	};
-
-	gbe1_led0_pins: gbe1-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe1_led0";
-		};
-	};
-
-	gbe2_led0_pins: gbe2-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe2_led0";
-		};
-	};
-
-	gbe3_led0_pins: gbe3-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe3_led0";
-		};
-	};
-
-	gbe0_led1_pins: gbe0-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe0_led1";
-		};
-	};
-
-	gbe1_led1_pins: gbe1-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe1_led1";
-		};
-	};
-
-	gbe2_led1_pins: gbe2-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe2_led1";
-		};
-	};
-
-	gbe3_led1_pins: gbe3-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe3_led1";
-		};
-	};
-
-	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
-		mux {
-			function = "led";
-			groups = "2p5gbe_led0";
-		};
-	};
-
-	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
-		mux {
-			function = "led";
-			groups = "2p5gbe_led1";
-		};
-	};
-
-	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
-		mux {
-			function = "flash";
-			groups = "emmc_45";
-		};
-	};
-
-	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
-		mux {
-			function = "flash";
-			groups = "emmc_51";
-		};
-	};
-
-	mmc0_pins_sdcard: mmc0-sdcard-pins {
-		mux {
-			function = "flash";
-			groups = "sdcard";
-		};
-	};
-
-	uart0_pins: uart0-pins {
-		mux {
-			function = "uart";
-			groups =  "uart0";
-		};
-	};
-
-	snfi_pins: snfi-pins {
-		mux {
-			function = "flash";
-			groups = "snfi";
-		};
-	};
-
-	spi0_pins: spi0-pins {
-		mux {
-			function = "spi";
-			groups = "spi0";
-		};
-	};
-
-	spi0_flash_pins: spi0-flash-pins {
-		mux {
-			function = "spi";
-			groups = "spi0", "spi0_wp_hold";
-		};
-	};
-
-	spi1_pins: spi1-pins {
-		mux {
-			function = "spi";
-			groups = "spi1";
-		};
-	};
-
-	spi2_pins: spi2-pins {
-		mux {
-			function = "spi";
-			groups = "spi2";
-		};
-	};
-
-	spi2_flash_pins: spi2-flash-pins {
-		mux {
-			function = "spi";
-			groups = "spi2", "spi2_wp_hold";
-		};
-	};
-};
-
-&pwm {
-	status = "okay";
-};
-
-&serial0 {
-	status = "okay";
-};
-
-&ssusb1 {
-	status = "okay";
-};
-
-&tphy {
-	status = "okay";
-};
-
-&watchdog {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
new file mode 100644
index 000000000000..1ab09ed2f151
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+
+#include "mt7988a.dtsi"
+
+/ {
+	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
+	model = "Banana Pi BPI-R4";
+	chassis-type = "embedded";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu1 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu2 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu3 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu_thermal {
+	trips {
+		cpu_trip_hot: hot {
+			temperature = <120000>;
+			hysteresis = <2000>;
+			type = "hot";
+		};
+
+		cpu_trip_active_high: active-high {
+			temperature = <115000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_med: active-med {
+			temperature = <85000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_low: active-low {
+			temperature = <40000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	rt5190a_64: rt5190a@64 {
+		compatible = "richtek,rt5190a";
+		reg = <0x64>;
+		vin2-supply = <&rt5190_buck1>;
+		vin3-supply = <&rt5190_buck1>;
+		vin4-supply = <&rt5190_buck1>;
+
+		regulators {
+			rt5190_buck1: buck1 {
+				regulator-name = "rt5190a-buck1";
+				regulator-min-microvolt = <5090000>;
+				regulator-max-microvolt = <5090000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			buck2 {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			rt5190_buck3: buck3 {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+			};
+			buck4 {
+				regulator-name = "rt5190a-buck4";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			ldo {
+				regulator-name = "rt5190a-ldo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_pins>;
+	status = "okay";
+
+	pca9545: i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			pcf8563: rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+				#clock-cells = <0>;
+			};
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+				size = <256>;
+			};
+
+		};
+
+		i2c_sfp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+};
+
+/* mPCIe SIM2 */
+&pcie0 {
+	status = "okay";
+};
+
+/* mPCIe SIM3 */
+&pcie1 {
+	status = "okay";
+};
+
+/* M.2 key-B SIM1 */
+&pcie2 {
+	status = "okay";
+};
+
+/* M.2 key-M SSD */
+&pcie3 {
+	status = "okay";
+};
+
+&pio {
+	mdio0_pins: mdio0-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio0";
+		};
+
+		conf {
+			pins = "SMI_0_MDC", "SMI_0_MDIO";
+			drive-strength = <8>;
+		};
+	};
+
+	i2c0_pins: i2c0-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c0_1";
+		};
+	};
+
+	i2c1_pins: i2c1-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_0";
+		};
+	};
+
+	i2c1_sfp_pins: i2c1-sfp-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_sfp";
+		};
+	};
+
+	i2c2_0_pins: i2c2-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_0";
+		};
+	};
+
+	i2c2_1_pins: i2c2-g1-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_1";
+		};
+	};
+
+	gbe0_led0_pins: gbe0-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led0";
+		};
+	};
+
+	gbe1_led0_pins: gbe1-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led0";
+		};
+	};
+
+	gbe2_led0_pins: gbe2-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led0";
+		};
+	};
+
+	gbe3_led0_pins: gbe3-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led0";
+		};
+	};
+
+	gbe0_led1_pins: gbe0-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led1";
+		};
+	};
+
+	gbe1_led1_pins: gbe1-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led1";
+		};
+	};
+
+	gbe2_led1_pins: gbe2-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led1";
+		};
+	};
+
+	gbe3_led1_pins: gbe3-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led1";
+		};
+	};
+
+	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led0";
+		};
+	};
+
+	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led1";
+		};
+	};
+
+	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_45";
+		};
+	};
+
+	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_51";
+		};
+	};
+
+	mmc0_pins_sdcard: mmc0-sdcard-pins {
+		mux {
+			function = "flash";
+			groups = "sdcard";
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		mux {
+			function = "uart";
+			groups =  "uart0";
+		};
+	};
+
+	snfi_pins: snfi-pins {
+		mux {
+			function = "flash";
+			groups = "snfi";
+		};
+	};
+
+	spi0_pins: spi0-pins {
+		mux {
+			function = "spi";
+			groups = "spi0";
+		};
+	};
+
+	spi0_flash_pins: spi0-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spi1_pins: spi1-pins {
+		mux {
+			function = "spi";
+			groups = "spi1";
+		};
+	};
+
+	spi2_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+	};
+
+	spi2_flash_pins: spi2-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi2", "spi2_wp_hold";
+		};
+	};
+};
+
+&pwm {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&ssusb1 {
+	status = "okay";
+};
+
+&tphy {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAv9LHzPhDuEDnPtN4vBSHMXl+c54VL0gQuDxBYtkT0=; b=Z2tQPav6EKtoV5Ip7r1FEuYdzo
	CcAAhe7+xSMpgIectBRlIkPqio8/X4vSskhpxw477QfvDBMnaTMYVZpY+e9kqn8IM/MKwr7GE2rwu
	bW62NW7F9q3xQsTMhZ01eDC1RC8sOmK283JFkuGn/4E56U9sLy/rgBgcy+NkOZB9q1C2KQ194dmjh
	urQZO10pKU/lNDoWOyHp/emtiV3FlzbxX2YYNLVx1AdKvYSZeSCQ5HwUMczS66/m25z79i/fKzKEK
	izr9W111JsVdy2Ew/tQjRH5JsToGSb01EKGPNxeGEDjtYaNDDlcmojEHxcxzzZZ+UmwnauO8kmuCx
	xaynN5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvb0-00000002oYE-233h;
	Fri, 02 May 2025 18:58:50 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvZ2-00000002o5s-1TLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:56:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746212204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAv9LHzPhDuEDnPtN4vBSHMXl+c54VL0gQuDxBYtkT0=;
	b=Fq0JpV6Dz1DZX3LY2L5FoSzPdL26JnzXANesMQqrgN0ZRtV3Q4oXbMcVWbhfJkzO3DhOHX
	/G4O/5l/0mVdINaSUK49Mg1H9mt9CSCagWRG6vk4BA5jdPYqczu9iFz8ZCmrqiMP+uSotO
	l/NMQxF50SZrVJY2LST0QRJeixmPi5iNAsPFaNfHv8lYMbKYtb4fXXk0o9zm8qwdPpot6f
	pQIwligPkrelrGKwMuHxBxKKbsBcLVPUt8pxmTrHPeaRbmo6h2FrqiuP67RXSXpXi/XXt0
	LAvIyvpBTOLf1wRvzSc4rhY/6+xEYtcV8KCt8/c4F/UNgqXJE1kAC/6izxBORQ==
From: Ferass El Hafidi <funderscore@postmarketos.org>
Date: Fri, 02 May 2025 18:56:06 +0000
Subject: [PATCH v6 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-aquaman-v6-2-f1af347d9709@postmarketos.org>
References: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
In-Reply-To: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Ferass El Hafidi <funderscore@postmarketos.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=8298;
 i=funderscore@postmarketos.org; h=from:subject:message-id;
 bh=okoZzeFXWvall2TucRORWIwb0RbaqeyVRbDXmyDqWno=;
 b=owEBbQKS/ZANAwAIAYSvy9DXiZoDAcsmYgBoFRVR0fOv7YEmV0Bi7PIAMKJuDU+yswvGiTcPa
 lEyQ2Hu1eqJAjMEAAEIAB0WIQQDAbw3+1VcrP15i+6Er8vQ14maAwUCaBUVUQAKCRCEr8vQ14ma
 A97jD/0T23Mx6nmpCLVCyT9gNQMgLiAd9pdFbPQxN8a4kJ8J90BZxcTQgGiLsWmw9bepU/ESB5Q
 MprBzeRqrp51ZXKoihasVCU/8MsPrjdsWfxE8sQ5RacT5sduV5WWJUyWmpXb2jLIcRs+VArQFKX
 YMQQ29xRzVlqFyyUU2J9QHAbh5lZ53L+bqUQM7TffuJCNIhwkDqZhqpznWslimZVZgmz6VOHdTJ
 caihELDPdZQbb0TC0T47iVzKuWD6sQ0IQlCGURmXlSo4Pd6Jhz7G+/a3Uj/PEGkQbzTksJkQ/KR
 6qSZuMG1VSm3wwDvqtdQ6r1ruUO2J9gnnQqDulCaTfT9qkvCbFsCO37L8E848iL3QIAXY2sGU0I
 JXXQ+1n5pmKCwQ/aJb9OExj+2U4+0uWHEddnGoPkBweb0UCS4jWujqxPe6eNDV4Ph2UQI72N1eG
 un+8VjrSyGvBKMrBf89wdaf+EettbUQzMhVftBqnR240GsAFhWCJ9rJ87j9v5ch/WOmawSW8HJX
 iC7PAdu0R772hkrAtcuiBENM6pZatcUbR6mEFyMZQeyEw/SE2hM/EwvfFEJddUdDJdosZp+oVgm
 ucxyUwImchkArfj35EjovatO3AqyWXXF4nNPdVsYOqok6k0lqqYdd5vCx/qDs0YqstKMMNrHus6
 h7+5HDvUz/Xmv5w==
X-Developer-Key: i=funderscore@postmarketos.org; a=openpgp;
 fpr=0301BC37FB555CACFD798BEE84AFCBD0D7899A03
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_115648_538609_31FDCAC6 
X-CRM114-Status: GOOD (  15.81  )
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

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
2020.  It is known as `xiaomi-aquaman` internally.  Specifications:
 * Amlogic S805Y SoC
 * Android TV 9, upgradable to Android TV 10
 * 8 GB eMMC
 * 1 GB of RAM
 * Wi-Fi + Bluetooth

The devicetree is based on p241's DT, with some changes to better match
the Mi TV Stick:
 * there is no Ethernet port, no IR, no CVBS connector on the stick
 * a white LED is present
 * adjust memory to have 1 GB of RAM available

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi   |  10 +
 3 files changed, 273 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 8c16c22c7b8ebc5b1884675fc93182591b394dc2..15e7901c126876964b858d2afaaaa5a5c86f1c22 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -52,6 +52,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805y-xiaomi-aquaman.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
new file mode 100644
index 0000000000000000000000000000000000000000..cac15b89c573924f84877deeb2c31b20b0c3cae6
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
+ * Heavily based on meson-gxl-s805x-p241.dtb:
+ *  - Copyright (c) 2018 BayLibre, SAS.
+ *    Author: Neil Armstrong <narmstrong@baylibre.com>
+ *    Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
+
+#include "meson-gxl-s805y.dtsi"
+
+/ {
+	compatible = "xiaomi,aquaman", "amlogic,s805y", "amlogic,meson-gxl";
+	model = "Xiaomi Mi TV Stick (aquaman)";
+
+	aliases {
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-white {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	vddio_boot: regulator-vddio-boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vddio_ao18: regulator-vddio-ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "XIAOMI-AQUAMAN";
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&vcc_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* Wireless SDIO Module (Amlogic W155S1 / Realtek RTL8821CS) */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+
+	non-removable;
+	disable-wp;
+
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	sdio: wifi@1 {
+		reg = <1>;
+	};
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+/*
+ * This is connected to the Bluetooth module
+ * Note: There's no driver for the Bluetooth module of some variants yet.
+ */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "otg";
+	vbus-supply = <&vcc_5v>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..49b29b71f732000070a0f67b2041c87db438475b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
+ */
+
+#include "meson-gxl-s805x.dtsi"
+
+/ {
+	compatible = "amlogic,s805y", "amlogic,meson-gxl";
+};

-- 
2.49.0



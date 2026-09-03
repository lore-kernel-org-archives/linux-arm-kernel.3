Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB53C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swNDdtld3sr85eCSNU1fBAmMorL2yCMF9hsu500mgX0=; b=NfxBizhIkB2lJXmnYx9mPkv0q/
	Ma043tYRCswPlCOZf87bwIv1AN1KzFa9OLdOBrFx+KA+5t/wJkibximNZy2YxzqLs3wKCY4hQe/If
	d9SWeKkP0n4qVQxNcDvdjuUjdALgqIsSGRMfTZOdteNcE1eJYPhAiSIqRMiPHfUdvpRU+lkoABK9W
	V1xBAA9RS+xN4ZPetKTG6Z84KCrjMgilrRHalEVz5cmuveECLx3ITXf5E3d2bSBdygMt40lqvIMsC
	Fe7J2UAiaYPLTcZI143nWrf1xoUzW45yYuSc5OYt50CGvDOdyWwBIU6jK8im17Q3AfB6TF/nYmDGK
	g97wig5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21bG-0000000GXHp-23gj;
	Thu, 03 Sep 2026 07:11:06 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21bC-0000000GXFu-3Cgy;
	Thu, 03 Sep 2026 07:11:04 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gD3WtpGHZlqUQYHAA--.14782S4;
	Thu, 03 Sep 2026 15:10:02 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 15:09:55 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8885;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=UXwxek9vOEREqFF91y9TgablJcud4dvLtHRh17qK3kw=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmR1HTvcioUX+7nSReVrknMGCBPXz6L6oDu+Cg
 wOKJXBpuHqJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapkdRwAKCRCaDXJbsSLV
 B6s0D/4wVgpMMQK3vrnDM0OyYi4VBYpGxVxVjXuj+eKQCbcKpObgH8aORxvASp6oV0RGvkuVgsA
 P5rKOs1cVUclSj7HdWe+IapM9OtnOAcFPGSblILICnrOchPXJS1fspXu+jAoSpS/O8e9CRuRbjx
 g3Ow0I9Rtjr14Zw7YdFQsVw+vNjSfyHjc4p1hWNQojI1srtnTRa1aSwZUaaKIHdDvJdST0Nz01m
 m6Nn9kISthjLKLXv6ZXCsXfKKiX3w7VCSOBjglwj6woQFtkJphGBBi08sTrGIaWBl0cnwFEKy6q
 dLsIN5/fL1coEISjp9uFIiGSx6c6SSKZf2pUXD5TTTCieiQqpf5AImG+/CZlMX4oFpccj+EqmIG
 SZ/VAAMOBdfd5aUpM7d7ydsmlhIg9AoETpYAkjvRnKDvAzfxpLHM0gHngbyl8mepvUTaYTlescR
 Eoe10tDYtomQ94hzUKv37NXSSPFQPoPw3QbakOBHKwAj1Mvrx3SdZMM4CQmkGqped8MYVkdS1i1
 zkZXUMVxSflI8obYO5tKGI0EBq0hIiO2gpKRcPijvJqIZMlEF7RfjIfyCecE9KPbgzSzbsnyM6Z
 mDlGUz4J3UrbNyf5GvOGQ8R3LqwIotqrkUDUCh49XNG95/qk9EmZODVbb0PueTerggFsMjGowrB
 Gm+7WBqutT+9f9g==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gD3WtpGHZlqUQYHAA--.14782S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw13GFW5ur4kWF1UZryxKrg_yoWfGFy8pF
	n7Crs8WFZ3Xryjka45ZayIyFs5Jw1kCFZ7Cr1DWFW8GrWvga4q934xtr9avFn3Wrs7X3y3
	JrWkCry3tF1agw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUUTGQDUUUUU==
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCFAADso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001103_291757_B07CD904 
X-CRM114-Status: GOOD (  11.19  )
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

Add initial device tree support for the Xiaomi Mi Box 4
(MDZ-21-AA), based on the Amlogic S905L SoC.

Enable the main on-board peripherals including eMMC, Wi-Fi,
HDMI, CEC, USB, IR, audio, power LED, GPU and video decoder.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 arch/arm64/boot/dts/amlogic/Makefile              |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts | 340 ++++++++++++++++++++++
 2 files changed, 341 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..9f357df5fc54 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
new file mode 100644
index 000000000000..db774efb2898
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2026 YuChia-Kan <mail@raspberrykan.dev>
+
+/dts-v1/;
+
+#include "meson-gxl-s905x.dtsi"
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
+
+/ {
+	compatible = "xiaomi,mibox4", "amlogic,s905l", "amlogic,meson-gxlx";
+	model = "Xiaomi Mi Box 4 (MDZ-21-AA)";
+
+	aliases {
+		serial0 = &uart_AO;
+		mmc0 = &sd_emmc_c;
+		mmc1 = &sd_emmc_a;
+		/delete-property/ mmc2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	av_mute: analog-audio-mute {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AV";
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	hdmi_connector: hdmi-connector {
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
+	cvbs_connector: cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi_usb_5v: regulator-hdmi-usb-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_USB_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
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
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_9 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+		post-power-on-delay-ms = <200>;
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		power_led: power-led {
+			label = "mibox4:power";
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "Xiaomi-Mi-Box-4";
+		audio-aux-devs = <&av_mute>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AV INL", "ACODEC LOLN",
+				"AV INR", "ACODEC LORN",
+				"Lineout", "AV OUTL",
+				"Lineout", "AV OUTR";
+
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-rates = <294912000>, <270950400>, <393216000>;
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
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
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
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&apb {
+	mali: gpu@c0000 {
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp", "gpmmu", "pp", "pmu",
+			"pp0", "ppmmu0", "pp1", "ppmmu1",
+			"pp2", "ppmmu2";
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
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
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+/delete-node/ &eth_mac;
+/delete-node/ &sn;
+/delete-node/ &bid;
+
+&efuse {
+	wifi_mac: mac-address@c {
+		reg = <0x0c 0x06>;
+	};
+};
+
+&ethmac {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_usb_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	max-frequency = <50000000>;
+	non-removable;
+	no-mmc;
+	no-sd;
+	disable-wp;
+	keep-power-in-suspend;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	rtl8723ds: wifi@1 {
+		reg = <1>;
+		nvmem-cells = <&wifi_mac>;
+		nvmem-cell-names = "mac-address";
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOX_7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&sd_emmc_b {
+	status = "disabled";
+};
+
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
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
+	dr_mode = "host";
+};
+
+&usb2_phy0 {
+	phy-supply = <&hdmi_usb_5v>;
+};
+
+&vdec {
+	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
+};

-- 
2.53.0



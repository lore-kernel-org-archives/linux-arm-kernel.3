Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F2EC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PPiEA1FGyaFHtzx0qxn1LM8VQhVacT/5QWpKmp70MI=; b=bFyKmeDZfob4legCKPQZaDaUzu
	xxblgJmlZyG0dQfyE8XjSaWweDERiiNnj+TPAZnWIuHuIOzYIQRARSFr5cBnirpFE81+CftoilPdL
	FIlxSd8+avEx/pp39KsYyh1im35htL+Jcv5+6ti7uVXIVKBCBr+Uxq/gS8q4ePRZgoWZvdMmMGxzo
	pkSDNsVafhiGW3Oia6wkTlnIs0I0GeKfBCjgXYL//aUKbAPAAsC4YAlUnJhF1LvQzZeEzbtclLKX/
	izRfyiSxyxWCNYXealVr+IJ2pRNyWVXBykkmeqErQ1mabwbj9psURKmXk4F5ukPW4lyFMIZl1embU
	6MvBQzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hDW-00000001ZY6-0KT5;
	Sun, 13 Sep 2026 10:13:46 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hDS-00000001ZX2-0gCN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 10:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789294421; bh=/PPiEA1FGyaFHtzx0qxn1LM8VQhVacT/5QWpKmp70MI=;
 b=uFiPfTm1b45p5sUFBQ51SMKISE7djZ6ZTquk5YnoQZTu+oYkWfydeUPeXHGACoBIDRJNdAlCl
 KdT1TmY5qXHEOhG10BT8+SaRAwkR5PjISbFVmdptq+WeGMUfD1IlMvN9Tl1i0FQ+57/LtOuVM8t
 pe38PicvMYajWiEOf5qw648=
X-Forward-Email-ID: 6aa677545d6bf3657bd82aa0
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 11:13:31 +0100
Message-ID: <20260913101331.198835-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913101331.198835-1-tturner@lineageos.org>
References: <20260913101331.198835-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_031342_294773_7BA7BC1E 
X-CRM114-Status: GOOD (  18.20  )
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

Add initial support for the Samsung Galaxy A21s (a21s) phone. It was
launched in 2020, and it's based on the Exynos 850 SoC. It has multiple
RAM configurations: 3GB, 4GB and 6GB.

Since our bootloader does not set up memory nodes beforehand, default to
the 3GB variant. Custom bootloaders can be used to initialise other
nodes per RAM configuration.

The Exynos DPU clocks required by simple-framebuffer are not kept
enabled during boot. Add the DECON, DMA, DPP, PPMU and SSMU DPU clocks
to the simple-framebuffer node so simpledrm maintains references to
them. Without these clocks, the framebuffer fails to remain operational
further into boot.

This device tree adds support for the following:

- SimpleFB
- 3GB RAM
- Buttons
- Ramoops
- MMC
- USB
- Watchdog

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 193 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 3 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 76cc23acb9b2..f197f8eb633b 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
+	exynos850-a217f.dtb		\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos9810-starlte.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos850-a217f.dts b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
new file mode 100644
index 000000000000..f1d11f91a353
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-a217f.dts
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy A21s (a21s/SM-A217F) device tree source
+ *
+ * Copyright (c) 2026, Thomas Turner <tturner@lineageos.org>
+ */
+
+/dts-v1/;
+#include "exynos850.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy A21s";
+	compatible = "samsung,a217f", "samsung,exynos850";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer0: framebuffer@fa000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfa000000 (720 * 1600 * 4)>;
+			width = <720>;
+			height = <1600>;
+			stride = <(720 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&cmu_dpu CLK_GOUT_DPU_DECON0_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_DMA_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_DPP_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_PPMU_ACLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_PPMU_PCLK>,
+				 <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c900000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe0d00000 0x1f300000>,
+		      <0x8 0x80000000 0x20000000>,
+		      <0x8 0xa0000000 0x20000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown &key_volup>;
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@f0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xf0000000 0x200000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x100000>;
+			pmsg-size = <0x20000>;
+		};
+
+		cont_splash_mem: framebuffer@fa000000 {
+			reg = <0x0 0xfa000000 (720 * 1600 * 4)>;
+			no-map;
+		};
+	};
+
+	/*
+	 * RTC clock (XrtcXTI); external, must be 32.768 kHz.
+	 *
+	 * TODO: Remove this once RTC clock is implemented properly as part of
+	 *       PMIC driver.
+	 */
+	rtcclk: clock-rtcclk {
+		compatible = "fixed-clock";
+		clock-output-names = "rtcclk";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&cmu_hsi {
+	clocks = <&oscclk>, <&rtcclk>,
+		 <&cmu_top CLK_DOUT_HSI_BUS>,
+		 <&cmu_top CLK_DOUT_HSI_MMC_CARD>,
+		 <&cmu_top CLK_DOUT_HSI_USB20DRD>;
+	clock-names = "oscclk", "rtcclk", "dout_hsi_bus",
+		      "dout_hsi_mmc_card", "dout_hsi_usb20drd";
+};
+
+&mmc_0 {
+	compatible = "samsung,exynos7-dw-mshc";
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-highspeed;
+	non-removable;
+	mmc-hs400-enhanced-strobe;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	bus-width = <8>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_clk_pins &sd0_cmd_pins &sd0_rdqs_pins &sd0_nreset_pins
+		     &sd0_bus1_pins &sd0_bus4_pins &sd0_bus8_pins>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
+
+&rtc {
+	clocks = <&cmu_apm CLK_GOUT_RTC_PCLK>, <&rtcclk>;
+	clock-names = "rtc", "rtc_src";
+
+	status = "disabled";
+};
+
+&timer {
+	/*
+	 * Non-updatable, broken stock Samsung bootloader does not
+	 * configure CNTFRQ_EL0
+	 */
+	clock-frequency = <26000000>;
+};
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
+
+&watchdog_cl0 {
+	status = "okay";
+};
+
+&watchdog_cl1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..8de135807aa7 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -147,7 +147,7 @@ psci {
 		method = "smc";
 	};
 
-	timer {
+	timer: timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-- 
2.47.3



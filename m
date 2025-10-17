Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A4CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DiF4Bzd539JkQzAKdR9fq/9SgMckCW94tBSFmf7J1Y=; b=DMUjMTimgWX3nABHmums9dAl/B
	5v/XetAANArQ/cpQBW6PSGSvtlWiy0G1X55/fD+7qpSUahgCvH1V+6Dpx08DeptqFrZEUX7zDf4jM
	WWfrlqcp7NiKQ9sTyidKmU0fJY/I4qDp+s7aXG6blwVlizBFWnl/WO/A3NoRKmdibfvFVWibha1oH
	aZ4rA+7OGenig7AAf0Y/OChttnbCv3EQFWmpD13OMCsNgOOA35EU5hmKd44+D9FNaaO3M9+iAQbes
	VfT3+mtACN5ErU9ht2ELB+KR3PTN2gKOOfKD+eyBFkBbTrvKjNohxbaGNIAaobNPN+nck04rDR35G
	r+kAX6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9krv-00000007zXt-1fpL;
	Fri, 17 Oct 2025 13:51:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9krq-00000007zUF-1TGX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1244345E98;
	Fri, 17 Oct 2025 13:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01BAC4CEFE;
	Fri, 17 Oct 2025 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760709097;
	bh=OI0g2/UqjmcUlkl6DGs+ZqjVWYf3Fa7orcd/oXwaD0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aAOFxsJEH144q3EGWYihdVzz90mCfRgjCTiPbgUQ3sPAfGbgoRZ5ANNk5TZdcAOeV
	 R6KnyKp4UM/3J2S45YDX5wdwZKgSOnLYulzcYpUUJXL7AB/L/59k5Mrq09gAYZxvu3
	 Hgiaxxi7Zu51Zee0VhWeGoFSUfUi2QO3+GPfQ0BFI7hbbd6Lo4pyM4jMIJAJeipRMF
	 pAlT3eWtSYSJP1HYtUgVpLXNepRn2tuN1nk85euVJJihmgKGdULmAIhKxc/i11AeXQ
	 a1PvrezZv5oXbvH1lM20Y3AkLcpKE2zVpGSIQ19ukeqmEltvkc9GU1KOxm+0Kw3TWB
	 ZT+E4AY76NWAQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 3/3] arm64: dts: ti: sa67: add overlay for the ADS2 carrier
Date: Fri, 17 Oct 2025 15:50:46 +0200
Message-ID: <20251017135116.548236-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017135116.548236-1-mwalle@kernel.org>
References: <20251017135116.548236-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_065138_434825_F008C680 
X-CRM114-Status: GOOD (  15.11  )
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

The SMARC module can be used on the Kontron SMARC 2.2 Evaluation carrier
(ads2). Add an overlay to enable all the devices found on the carrier
and enable the corresponding peripherals of the SoC.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    | 146 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index d2a40ea642c4..361248dcfff4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -139,12 +139,15 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 # Boards with J722s SoC
 k3-am67a-kontron-sa67-dtbs := k3-am67a-kontron-sa67-base.dtb \
 	k3-am67a-kontron-sa67-rtc-rv8263.dtbo k3-am67a-kontron-sa67-gbe1.dtbo
+k3-am67a-kontron-sa67-ads2-dtbs := k3-am67a-kontron-sa67.dtb k3-am67a-kontron-sa67-ads2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-base.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gbe1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gpios.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-rtc-rv8263.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-ads2.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-ads2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
new file mode 100644
index 000000000000..ae5e2b52594b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Kontron SMARC-sa67 board on the Kontron Eval Carrier 2.2.
+ *
+ * Copyright (c) 2025 Kontron Europe GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm_fan_pins_default>;
+		interrupts-extended = <&main_gpio1 7 IRQ_TYPE_EDGE_FALLING>;
+		#cooling-cells = <2>;
+		pwms = <&epwm2 1 4000000 0>;
+		cooling-levels = <1 128 192 255>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Out Jack",
+			"Microphone", "Microphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,routing =
+			"Line Out Jack", "LINEOUTR",
+			"Line Out Jack", "LINEOUTL",
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN2L", "Microphone Jack",
+			"IN2R", "Microphone Jack";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink0_master>;
+		simple-audio-card,frame-master = <&dailink0_master>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		dailink0_master: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+			clocks = <&audio_refclk0>;
+		};
+	};
+
+	cvcc_1p8v_i2s: regulator-carrier-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8_S0_I2S";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	cvcc_1p8v_s0: regulator-carrier-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8_S0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	cvcc_3p3v_s0: regulator-carrier-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_S0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&audio_refclk0 {
+	status = "okay";
+};
+
+&epwm2 {
+	status = "okay";
+};
+
+&main_pmx0 {
+	pwm_fan_pins_default: pwm-fan-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1ec, PIN_OUTPUT, 8)	/* (A22) I2C1_SDA.EHRPWM2_B */
+			J722S_IOPAD(0x194, PIN_INPUT, 0)	/* (A25) MCASP0_AXR3.GPIO1_7 */
+		>;
+	};
+};
+
+&mcasp0 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&mcu_i2c0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wm8904: audio-codec@1a {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		clocks = <&audio_refclk0>;
+		clock-names = "mclk";
+		AVDD-supply = <&cvcc_1p8v_i2s>;
+		CPVDD-supply = <&cvcc_1p8v_i2s>;
+		DBVDD-supply = <&cvcc_1p8v_i2s>;
+		DCVDD-supply = <&cvcc_1p8v_i2s>;
+		MICVDD-supply = <&cvcc_1p8v_i2s>;
+	};
+};
+
+&mcu_spi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+		m25p,fast-read;
+		vcc-supply = <&cvcc_1p8v_s0>;
+	};
+};
+
+&wkup_i2c0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* SMARC Carrier EEPROM */
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&cvcc_3p3v_s0>;
+	};
+};
-- 
2.47.3



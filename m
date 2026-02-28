Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C92B1048926
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr2baW9Tg6QswMVJtRYTr/gGNMGvzf+M+QQS/nmpcQQ=; b=yAPXOOo2T20ImEFt2MrDtl1ysu
	CaDVRnRSw/KHhMBbramSdDrqdnFJfgQog/VHEIHt+wZGxIuE6SDMVvlT3VAZGss1/nGt+2jqtUWzd
	hCIt/whNTSK2zgcAcP8/m1sGjcu5hcoSu7bSqzhEWq9OKAxhBN4BdP04CTS/X4zPdqrlleRV+x+Xj
	FMkSA6j9e7lb2RnqOSd8KN0fTNfZMyAfjr9da+O2gfmjcns/4HDWuBeklnRacjgPvpqIyIDhNGpyw
	uX2I6Wstx43FGYkpmrzIopDecpDui8lcmC8VCO+TvUehCW+09R6+yFa/0my0z6PemH/X+JPsg0DKY
	ReWNgLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qT-00000009IRj-0rNk;
	Sat, 28 Feb 2026 00:06:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qK-00000009IN5-1U4P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9D7161333;
	Sat, 28 Feb 2026 00:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244A0C116C6;
	Sat, 28 Feb 2026 00:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237159;
	bh=iXGcciF5FWuc8KXZydCTrE3B2rTksJ1Sr2bCyRyg7Og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t/Kt7/rVa234/k5yEYQM1UPupzHfPo20y2qjrssKdyIFM1wDT9w/cyWezd7HTIOgw
	 g6JmElM/wvGiGpA34OXFwH5Tuf3oyMOBsWP/L9bNjjxnIzRzJj+NPI4CQtGHk82nVx
	 SK8NvOEAvDDNeH3d2RzK6v60o87pGMu3DyymO6cmsy+kPJzJJ1PavKNdFFU9YoS1mA
	 0mXRVjL9A5sy57IN7vFj7wRjp5rlaIG5vMJdfBpAyuh9wHaGGVGtaSOdjAOH+VntQO
	 9THLdB2nL9sW95+n8ZSt+dknfoWG55te8/r0aG/MYarHecirHGOnG6xBUfN2Ug6fID
	 BK217xnCuHb+Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:47 +0100
Subject: [PATCH 7/8] ARM: dts: Add a Raidsonic IB-4210-B DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-7-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This adds a device tree for the Raidsonic IB-4210-B NAS, a slightly
under-powered version of IB-4220-B with half the memory and
the cheaper version of the SoC.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/Makefile            |   1 +
 arch/arm/boot/dts/gemini/gemini-nas4210b.dts | 205 +++++++++++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/arch/arm/boot/dts/gemini/Makefile b/arch/arm/boot/dts/gemini/Makefile
index d5d32f02e232..4722fb1bac49 100644
--- a/arch/arm/boot/dts/gemini/Makefile
+++ b/arch/arm/boot/dts/gemini/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-dlink-dir-685.dtb \
 	gemini-dlink-dns-313.dtb \
+	gemini-nas4210b.dtb \
 	gemini-nas4220b.dtb \
 	gemini-ns2502.dtb \
 	gemini-rut1xx.dtb \
diff --git a/arch/arm/boot/dts/gemini/gemini-nas4210b.dts b/arch/arm/boot/dts/gemini/gemini-nas4210b.dts
new file mode 100644
index 000000000000..8bec57c8b7b1
--- /dev/null
+++ b/arch/arm/boot/dts/gemini/gemini-nas4210b.dts
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for the Gemini-based Raidsonic NAS IB-4210-B
+ * Based on the NAS Forum experiments by user "CptSpock".
+ */
+
+/dts-v1/;
+
+#include "gemini.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Raidsonic NAS IB-4210-B";
+	compatible = "raidsonic,ib-4210-b", "cortina,gemini";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 { /* 64 MB */
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,19200n8 root=/dev/sda1 rw rootwait";
+		stdout-path = &uart0;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		button-setup {
+			debounce-interval = <100>;
+			wakeup-source;
+			linux,code = <KEY_SETUP>;
+			label = "Backup button";
+			/* Conflict with TVC */
+			gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+		};
+		button-restart {
+			debounce-interval = <100>;
+			wakeup-source;
+			linux,code = <KEY_RESTART>;
+			label = "Softreset button";
+			/* Conflict with TVC */
+			gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-orange-hdd {
+			label = "nas4220b:orange:hdd";
+			/* Conflict with TVC */
+			gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			linux,default-trigger = "disk-activity";
+		};
+		led-green-os {
+			label = "nas4220b:green:os";
+			/* Conflict with TVC */
+			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	mdio0: mdio {
+		compatible = "virtual,mdio-gpio";
+		gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>, /* MDC */
+			<&gpio0 21 GPIO_ACTIVE_HIGH>; /* MDIO */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Realtek RTL8211B */
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			device_type = "ethernet-phy";
+		};
+	};
+
+	soc {
+		flash@30000000 {
+			status = "okay";
+			/* 16MB of flash */
+			reg = <0x30000000 0x01000000>;
+
+			partitions {
+				compatible = "redboot-fis";
+				/* Eraseblock at 0xfe0000 */
+				fis-index-block = <0x7f>;
+			};
+		};
+
+		syscon: syscon@40000000 {
+			pinctrl {
+				gpio0_default_pins: pinctrl-gpio0 {
+					mux {
+						function = "gpio0";
+						groups =
+						"gpio0egrp",
+						/* Used by MDIO */
+						"gpio0igrp";
+					};
+				};
+				gpio1_default_pins: pinctrl-gpio1 {
+					mux {
+						function = "gpio1";
+						/* Lines 28-31 used by LEDs and buttons */
+						groups = "gpio1dgrp";
+					};
+				};
+				pinctrl-gmii {
+					mux {
+						function = "gmii";
+						groups = "gmii_gmac0_grp";
+					};
+					conf0 {
+						pins = "R8 GMAC0 RXDV", "U11 GMAC1 RXDV";
+						skew-delay = <0>;
+					};
+					conf1 {
+						pins = "T8 GMAC0 RXC";
+						skew-delay = <10>;
+					};
+					conf2 {
+						pins = "T11 GMAC1 RXC";
+						skew-delay = <15>;
+					};
+					conf3 {
+						pins = "P8 GMAC0 TXEN", "V11 GMAC1 TXEN";
+						skew-delay = <7>;
+					};
+					conf4 {
+						pins = "V7 GMAC0 TXC", "P10 GMAC1 TXC";
+						skew-delay = <10>;
+					};
+					conf5 {
+						/* The data lines all have default skew */
+						pins = "U8 GMAC0 RXD0", "V8 GMAC0 RXD1",
+						       "P9 GMAC0 RXD2", "R9 GMAC0 RXD3",
+						       "R11 GMAC1 RXD0", "P11 GMAC1 RXD1",
+						       "V12 GMAC1 RXD2", "U12 GMAC1 RXD3",
+						       "R10 GMAC1 TXD0", "T10 GMAC1 TXD1",
+						       "U10 GMAC1 TXD2", "V10 GMAC1 TXD3";
+						skew-delay = <7>;
+					};
+					conf6 {
+						pins = "U7 GMAC0 TXD0", "T7 GMAC0 TXD1",
+						       "R7 GMAC0 TXD2", "P7 GMAC0 TXD3";
+						skew-delay = <5>;
+					};
+					/* Set up drive strength on GMAC0 to 16 mA */
+					conf7 {
+						groups = "gmii_gmac0_grp";
+						drive-strength = <16>;
+					};
+				};
+			};
+		};
+
+		sata: sata@46000000 {
+			cortina,gemini-ata-muxmode = <0>;
+			cortina,gemini-enable-sata-bridge;
+			status = "okay";
+		};
+
+		gpio0: gpio@4d000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio0_default_pins>;
+		};
+
+		gpio1: gpio@4e000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio1_default_pins>;
+		};
+
+		ethernet@60000000 {
+			status = "okay";
+
+			ethernet-port@0 {
+				phy-mode = "rgmii";
+				phy-handle = <&phy0>;
+			};
+			ethernet-port@1 {
+				/* Not used in this platform */
+			};
+		};
+
+		ide@63000000 {
+			status = "okay";
+		};
+
+		ide@63400000 {
+			status = "okay";
+		};
+
+		usb@68000000 {
+			status = "okay";
+		};
+
+		usb@69000000 {
+			status = "okay";
+		};
+	};
+};

-- 
2.53.0



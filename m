Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C153D35664
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T6QnvioEAXPy/LTiOQAeKcnIAykdQxgXZDbFaA+d1WE=; b=fxqsGoQqT9zV6RAlhGxRxRE59O
	bHsmXid24WDUkGtyXL69kB2gmVWs3mdWYIj0siwqjzddRlZ/1Hu4h7jBAqjYWcQ1hkqHnj/OtqPI9
	XIrm4B6uz05DeGIZ6OJyRetgCUaDzjlpjJy8jy/dSsybvZDIyQN5/oH8G9BQewuFtwPJHteH1LuBC
	AEV5g7CS9nyebPQYFf+OTdmzupogAnRw0+WXYSSn4zbm0BQTrtdVVpXtu7+mPvfQgs0J2dw8X3rrT
	nUoUBk/RobRen0x6CdScH/6rOqWLLnz7Y92yzs2XkbyyjnB8ajv2YjnPJhuptsihbmrJOU+olgHkP
	ZeIig/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkumO-0000000FH9i-3xhu;
	Wed, 28 Jan 2026 01:55:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkumN-0000000FH9a-2dBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 01:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96D60600AA;
	Wed, 28 Jan 2026 01:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31507C116C6;
	Wed, 28 Jan 2026 01:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769565334;
	bh=CP/qnvB6fXOxVLAIQC9mjygAeI/xPgo7d+fUUVeDfKo=;
	h=From:To:Cc:Subject:Date:From;
	b=FVyxCgwPXJrlaMWB4T5cTDCSpuj4TlfoPEmeYd0jetk9q6NjTz2UhPfMxzo0WRoeo
	 SCrtXVLFyEPzKl4ffv6QPcTd5QNetW3iMCbtv0/QTl8VYFzXzGHp/6ycgNfKlj2CjU
	 RUfBOKDt/sItxsq05wvH4OSNkZFyi0oTQR6eh/7a8S+cj/qljlPKbzQd18KUMxlukg
	 JPllKMscdntViFRqlQ/TmUT5JSVAavP34GKnwymsDRKlST2cYyKEIC0UdT7zKFhPyu
	 JslZO5gi971aqdKHeAXOzhk8AHE888EqxZE7LPK/PQWToJrjp4gj2S9t4OPflrQ+5g
	 qw4Bvya7VAwNQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Elad Nachman <enachman@marvell.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm/arm64: dts: marvell: Drop unused .dtsi
Date: Tue, 27 Jan 2026 19:55:20 -0600
Message-ID: <20260128015521.3694910-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Keep armada-7020.dtsi and armada-ap806-dual.dtsi which now
   have a user.
---
 arch/arm/boot/dts/marvell/armada-380.dtsi     | 148 ------------------
 arch/arm64/boot/dts/marvell/armada-8020.dtsi  |  20 ---
 .../dts/marvell/cn9130-db-comexpress.dtsi     |  96 ------------
 3 files changed, 264 deletions(-)
 delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi

diff --git a/arch/arm/boot/dts/marvell/armada-380.dtsi b/arch/arm/boot/dts/marvell/armada-380.dtsi
deleted file mode 100644
index e94f22b0e9b5..000000000000
--- a/arch/arm/boot/dts/marvell/armada-380.dtsi
+++ /dev/null
@@ -1,148 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Device Tree Include file for Marvell Armada 380 SoC.
- *
- * Copyright (C) 2014 Marvell
- *
- * Lior Amsalem <alior@marvell.com>
- * Gregory CLEMENT <gregory.clement@free-electrons.com>
- * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
- */
-
-#include "armada-38x.dtsi"
-
-/ {
-	model = "Marvell Armada 380 family SoC";
-	compatible = "marvell,armada380";
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		enable-method = "marvell,armada-380-smp";
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			reg = <0>;
-		};
-	};
-
-	soc {
-		internal-regs {
-			pinctrl@18000 {
-				compatible = "marvell,mv88f6810-pinctrl";
-			};
-		};
-
-		pcie {
-			compatible = "marvell,armada-370-pcie";
-			status = "disabled";
-			device_type = "pci";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			msi-parent = <&mpic>;
-			bus-range = <0x00 0xff>;
-
-			ranges =
-			       <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
-				0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
-				0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
-				0x82000000 0 0x48000 MBUS_ID(0xf0, 0x01) 0x48000 0 0x00002000
-				0x82000000 0x1 0     MBUS_ID(0x08, 0xe8) 0 1 0 /* Port 0 MEM */
-				0x81000000 0x1 0     MBUS_ID(0x08, 0xe0) 0 1 0 /* Port 0 IO  */
-				0x82000000 0x2 0     MBUS_ID(0x04, 0xe8) 0 1 0 /* Port 1 MEM */
-				0x81000000 0x2 0     MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 1 IO  */
-				0x82000000 0x3 0     MBUS_ID(0x04, 0xd8) 0 1 0 /* Port 2 MEM */
-				0x81000000 0x3 0     MBUS_ID(0x04, 0xd0) 0 1 0 /* Port 2 IO  */>;
-
-			/* x1 port */
-			pcie@1,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82000800 0 0x80000 0 0x2000>;
-				reg = <0x0800 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie1_intc 0>,
-						<0 0 0 2 &pcie1_intc 1>,
-						<0 0 0 3 &pcie1_intc 2>,
-						<0 0 0 4 &pcie1_intc 3>;
-				marvell,pcie-port = <0>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 8>;
-				status = "disabled";
-
-				pcie1_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-
-			/* x1 port */
-			pcie@2,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82001000 0 0x40000 0 0x2000>;
-				reg = <0x1000 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie2_intc 0>,
-						<0 0 0 2 &pcie2_intc 1>,
-						<0 0 0 3 &pcie2_intc 2>,
-						<0 0 0 4 &pcie2_intc 3>;
-				marvell,pcie-port = <1>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 5>;
-				status = "disabled";
-
-				pcie2_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-
-			/* x1 port */
-			pcie@3,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82001800 0 0x44000 0 0x2000>;
-				reg = <0x1800 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x3 0 1 0
-					  0x81000000 0 0 0x81000000 0x3 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie3_intc 0>,
-						<0 0 0 2 &pcie3_intc 1>,
-						<0 0 0 3 &pcie3_intc 2>,
-						<0 0 0 4 &pcie3_intc 3>;
-				marvell,pcie-port = <2>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 6>;
-				status = "disabled";
-
-				pcie3_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-8020.dtsi b/arch/arm64/boot/dts/marvell/armada-8020.dtsi
deleted file mode 100644
index b6fc18876093..000000000000
--- a/arch/arm64/boot/dts/marvell/armada-8020.dtsi
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2016 Marvell Technology Group Ltd.
- *
- * Device Tree file for the Armada 8020 SoC, made of an AP806 Dual and
- * two CP110.
- */
-
-#include "armada-ap806-dual.dtsi"
-#include "armada-80x0.dtsi"
-
-/* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
- * in CP master is not connected (by package) to the oscillator. So
- * disable it. However, the RTC clock in CP slave is connected to the
- * oscillator so this one is let enabled.
- */
-
-&cp0_rtc {
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
deleted file mode 100644
index 028496ebc473..000000000000
--- a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2023 Marvell International Ltd.
- *
- * Device tree for the CN9130-DB Com Express CPU module board.
- */
-
-#include "cn9130-db.dtsi"
-
-/ {
-	model = "Marvell Armada CN9130-DB COM EXPRESS type 7 CPU module board";
-	compatible = "marvell,cn9130-cpu-module", "marvell,cn9130",
-		     "marvell,armada-ap807-quad", "marvell,armada-ap807";
-
-};
-
-&ap0_reg_sd_vccq {
-	regulator-max-microvolt = <1800000>;
-	states = <1800000 0x1 1800000 0x0>;
-	/delete-property/ gpios;
-};
-
-&cp0_reg_usb3_vbus0 {
-	/delete-property/ gpio;
-};
-
-&cp0_reg_usb3_vbus1 {
-	/delete-property/ gpio;
-};
-
-&cp0_reg_sd_vcc {
-	status = "disabled";
-};
-
-&cp0_reg_sd_vccq {
-	status = "disabled";
-};
-
-&cp0_sdhci0 {
-	status = "disabled";
-};
-
-&cp0_eth0 {
-	status = "disabled";
-};
-
-&cp0_eth1 {
-	status = "okay";
-	phy = <&phy0>;
-	phy-mode = "rgmii-id";
-};
-
-&cp0_eth2 {
-	status = "disabled";
-};
-
-&cp0_mdio {
-	status = "okay";
-	pinctrl-0 = <&cp0_ge_mdio_pins>;
-	phy0: ethernet-phy@0 {
-		status = "okay";
-	};
-};
-
-&cp0_syscon0 {
-	cp0_pinctrl: pinctrl {
-		compatible = "marvell,cp115-standalone-pinctrl";
-
-		cp0_ge_mdio_pins: ge-mdio-pins {
-			marvell,pins = "mpp40", "mpp41";
-			marvell,function = "ge";
-		};
-	};
-};
-
-&cp0_sdhci0 {
-	status = "disabled";
-};
-
-&cp0_spi1 {
-	status = "okay";
-};
-
-&cp0_usb3_0 {
-	status = "okay";
-	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
-	/delete-property/ phys;
-};
-
-&cp0_usb3_1 {
-	status = "okay";
-	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
-	/delete-property/ phys;
-};
-- 
2.51.0



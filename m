Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD97C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MYdzoSewcFcQWVr1xi0SARyuuH/Y7lXURwUtog43pY=; b=vJdvO2GDNth2ACoLJ1Lu2jIx/+
	SZgYqeVpcw9dgFWToWjn9PHytIlytlJ4J8SrXGRSnAL3ovZR6PD36n1KctSQzUCAuUx+1Umfrc/yM
	fFRTk/0SPV6/RpJBlCqmjoEXJU9FlrjiosKhv/wVux18Tp1JHJqzhZ8l8wbhRHQtXa5JDtdJIK1qO
	ULq3y50dZuW9lpQXt8keK5zV2jZwEm6qkR1auLj0khteCeDLOqHMsPD3S7KBFGaFLmsEWF0a99Jif
	ixOAygWAd1aF+nrSI3bREa+TvbqjvVGnnR/Zi/y6vUBr+wFyjWux5Y1Iy2ohPY1vIkQcxJ8kgaEbT
	N4Uvk0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxg-0000000Djgj-0Nar;
	Mon, 06 Jul 2026 22:38:48 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxc-0000000Djeh-0vuO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:38:45 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783377522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MYdzoSewcFcQWVr1xi0SARyuuH/Y7lXURwUtog43pY=;
	b=ogXyt1qeaC0mL0e/L8Uq+VzkHdS7iKaPeWOctmTgKN4+XG+0TRitSM359QiWNzhBDfA9Td
	IoaXjAe+NJ04ZV2xVxK0VRqaexmDFiPis0Le4g7gAd8qhfuatgVL5ICvRJm387y/gzh1pi
	9l+NQxDg9U984Yh6P4dDezjV5bDJXCY=
Date: Tue, 07 Jul 2026 00:38:28 +0200
Subject: [PATCH 2/2] arm64: dts: apple: t600x: Add PCIe pwren gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-apple-pcie-pwren-v1-2-5a281b182fe2@cyberchaos.dev>
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
In-Reply-To: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_153844_465802_8360A204 
X-CRM114-Status: GOOD (  11.91  )
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

For the MacBook Pro and Mac Studio devices using the M1 Pro/Max/Ultra
SoCs, add the appropriate fixed regulators for enabling the peripherals
connected to the PCIe ports (WiFi, SD card reader and USB xHCI), which
are controlled by GPIOs connected to the SMC.
Set the regulators as the power-supply of the respective PCIe port, so
that the endpoints are powered on before probing the ports.

Add the 'pciclass,0604' compatible string to the PCIe bridge nodes in
the SoC to allow the pci-pwrctrl-generic driver to bind to them.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 16 +++++++++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 27 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..53a633a3c652 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -449,6 +449,7 @@ pcie0: pcie@590000000 {
 		pinctrl-names = "default";
 
 		port00: pci@0,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 4 GPIO_ACTIVE_LOW>;
@@ -468,6 +469,7 @@ port00: pci@0,0 {
 		};
 
 		port01: pci@1,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x800 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 5 GPIO_ACTIVE_LOW>;
@@ -487,6 +489,7 @@ port01: pci@1,0 {
 		};
 
 		port02: pci@2,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x1000 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 6 GPIO_ACTIVE_LOW>;
@@ -507,6 +510,7 @@ port02: pci@2,0 {
 		};
 
 		port03: pci@3,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x1800 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 7 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..7954cbbe4514 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -55,6 +55,20 @@ led-0 {
 			default-state = "keep";
 		};
 	};
+
+	vreg_pcie0_port0: regulator-pcie0-port0 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwren-pcie0-port0";
+		gpio = <&smc_gpio 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_pcie0_port1: regulator-pcie0-port1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwren-pcie0-port1";
+		gpio = <&smc_gpio 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &serial0 {
@@ -176,6 +190,7 @@ &nco_clkref {
 /* PCIe devices */
 &port00 {
 	/* WLAN */
+	power-supply = <&vreg_pcie0_port0>;
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
 		compatible = "pci14e4,4433";
@@ -195,6 +210,7 @@ bluetooth0: bluetooth@0,1 {
 
 &port01 {
 	/* SD card reader */
+	power-supply = <&vreg_pcie0_port1>;
 	bus-range = <2 2>;
 	sdhci0: mmc@0,0 {
 		compatible = "pci17a0,9755";
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..412b2fe109be 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -42,6 +42,30 @@ memory@10000000000 {
 		device_type = "memory";
 		reg = <0x100 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/* WLAN/BT */
+	vreg_pcie0_port0: regulator-pcie0-port0 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwren-pcie0-port0";
+		gpio = <&smc_gpio 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* SD card reader */
+	vreg_pcie0_port1: regulator-pcie0-port1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwren-pcie0-port1";
+		gpio = <&smc_gpio 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* USB xHCI */
+	vreg_pcie0_port3: regulator-pcie0-port3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwren-pcie0-port3";
+		gpio = <&smc_gpio 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &serial0 {
@@ -356,6 +380,7 @@ &nco_clkref {
 /* PCIe devices */
 &port00 {
 	/* WLAN */
+	power-supply = <&vreg_pcie0_port0>;
 	bus-range = <1 1>;
 	wifi0: wifi@0,0 {
 		compatible = "pci14e4,4433";
@@ -375,6 +400,7 @@ bluetooth0: bluetooth@0,1 {
 
 &port01 {
 	/* SD card reader */
+	power-supply = <&vreg_pcie0_port1>;
 	bus-range = <2 2>;
 	sdhci0: mmc@0,0 {
 		compatible = "pci17a0,9755";
@@ -397,6 +423,7 @@ ethernet0: ethernet@0,0 {
 
 &port03 {
 	/* USB xHCI */
+	power-supply = <&vreg_pcie0_port3>;
 	bus-range = <4 4>;
 	status = "okay";
 };

-- 
2.54.0



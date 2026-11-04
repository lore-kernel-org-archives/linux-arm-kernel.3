Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DAC606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BhkGyjV3;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=oCERtlr5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b8gdt5Gsl7of0UCwZA1LRvMWZqGY7tF4209QTmH/GcI=; b=BhkGyjV3Z5nY/V
	dResl4rxXM30gKBXBSTo9rHSN/LlKqyTj5caTX3uG/HYK03D4+lfZkO1uh3/33t/dynFgm+PsoRjg
	9gE8lrhya0ydMtJOK56uY7CmyjDRzDnHDaFCRDoy1nd4EhE12FErIo3H8aWqr/VuC/OOcX8si7pX8
	c8CZGj6WPmfrNxlidAK47xjtLBsiAd29cGnbasfo1A2tf3nxTwg2tp8ct3ZFs+IH+gBhcvBNcHYwb
	BGMIZi/MgDQHn3gvQxlV+ni1qBQlbXo5CG9xVXao2nkL8H+4aaDCShxohpXv+ojlBRDEBW67Mzwp5
	iuXcd2lR6ubeCZZ9b43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMG-00000005CbB-4AwQ;
	Wed, 04 Nov 2026 11:40:48 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMD-00000005CZw-4AZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:40:47 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793792441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8gdt5Gsl7of0UCwZA1LRvMWZqGY7tF4209QTmH/GcI=;
	b=oCERtlr5rn8ngX0o9/IKhBD/Jw7b3jjwg1rmVSJ4QVDmkg7lj+zyv62AhgGsw0OQzhx+3y
	CykiD1aHGSyrAQou3Nw/TbbxBFIfi9y+gIeidxEnRzUWi5q5v08DYKvtAhM7IYX4cDT+FZ
	gBIiy/tLWikwG522MzWTdtNUHfqhMgE=
Date: Wed, 04 Nov 2026 12:40:31 +0100
Subject: [PATCH v2 3/3] arm64: dts: apple: t600x: Add PCIe pwren gpios
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-apple-pcie-pwren-v2-3-216a4066965f@cyberchaos.dev>
References: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
In-Reply-To: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_034046_217901_72B5478A 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 122a566e75d1..635635c4bfbd 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -460,6 +460,7 @@ pcie0: pcie@590000000 {
 		pinctrl-names = "default";
 
 		port00: pci@0,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 4 GPIO_ACTIVE_LOW>;
@@ -479,6 +480,7 @@ port00: pci@0,0 {
 		};
 
 		port01: pci@1,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x800 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 5 GPIO_ACTIVE_LOW>;
@@ -498,6 +500,7 @@ port01: pci@1,0 {
 		};
 
 		port02: pci@2,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x1000 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 6 GPIO_ACTIVE_LOW>;
@@ -518,6 +521,7 @@ port02: pci@2,0 {
 		};
 
 		port03: pci@3,0 {
+			compatible = "pciclass,0604";
 			device_type = "pci";
 			reg = <0x1800 0x0 0x0 0x0 0x0>;
 			reset-gpios = <&pinctrl_ap 7 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..4f9dccf839ad 100644
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
2.56.0



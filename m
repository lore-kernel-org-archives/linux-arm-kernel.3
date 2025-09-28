Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC3CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyjdLey8fJK1LFH+bnPBqPmLLwL1sGliTY8VPETdlyw=; b=nERli98m6Td8OXpS3RBrSDmsIs
	lc+B+jSYhdoMjHcDhctC8C/7sSUcPXWtulJoEpEhDZZIWl0iyH82VLrgfENCk+JJpkXp/7HF2J2Jy
	Gqw3YIpAeMUvm2yhJeQlSLbAMq7nkFfNIs64MN72lyfb9Z5kLKRfnKfKfhyU2RPwZtS/uU70tcvQ4
	wvfKVPdfrtloM67nzijw204FNt6Fr/hDY6tkBNIS2KDKZjbjD3SAZf0xnDFpmZYog0B8QjnAdVJI3
	0KcYcyWIRpXe+opQJGj4sV0U84J6IRkKj97HtQh3vFbw+y87b724nRb7tl1giESwnAIOZ25FesL1a
	8zyeju6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVY-0000000Gedw-1ynG;
	Sun, 28 Sep 2025 16:44:20 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVR-0000000GeaG-0tqS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F7EC25DD1;
	Sun, 28 Sep 2025 18:44:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytEBsTR3oVOJ; Sun, 28 Sep 2025 18:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077850; bh=COATQ0Ql12ldgC+RxZNV2cbbhQkM0zUgDAXRcSBHY9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iR3DBstFZNILUfe1yubvC0+k/mnLr0B0GKtazmOgGcjtBSAzNUILV6z76yeYcV+QL
	 RJ0htHXjUEhMszfNHlQrAFAkidms4/+kcj+0JxuIsajXo7e/Iweaj8o7HEyG1C7q+w
	 +7TfKjoDnQaxCjy+NRUXg0qGZaNhqh1MfVFASNVJqfOImhS3Fi7mAn4I7KXrwTcMLt
	 GmdJWRLSCRpbyDKV9DxwF9fQgF/PlOFper6HjgWIxmnyN44LvihjYmR8xXSxpJZ+Uh
	 5nGcJfVvzvirHXp6HR44Aev2Bap3upHoAiHDs9yFSfvvoKDgKM64wvD0iq1Li/KHDa
	 Kntr19BZE5Cdg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:52 +0530
Subject: [PATCH 1/7] arm64: dts: exynos7870: relocate ${x}-names property
 after ${x}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=13693;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=COATQ0Ql12ldgC+RxZNV2cbbhQkM0zUgDAXRcSBHY9Y=;
 b=+ez2Gb/x7Ge5AVpIm82geksnMvxaMRqg/0kcGQ5AJW0n6jE/J+M+gWz8ewiIs5mtnO1te15jy
 jwmG96Jro/mBO/ab63lshhoo/ue9fqMppP1hCRgtGT7Cgm6RboQ+CEg
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094413_528712_88B55782 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

All ${x}-names properties are conventionally placed after their
corresponding ${x} properties. For instance, 'clock-names' must follow
'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
changes to follow said convention. No functional changes made.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870.dtsi | 108 ++++++++++++++---------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index d5d347623b9038b71da55dccdc9084aeaf71618c..48ace70fb958edd28d758f4afea52bc4c7192001 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -150,8 +150,6 @@ cmu_peri: clock-controller@101f0000 {
 			reg = <0x101f0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
-				      "spi3", "spi4", "uart0", "uart1", "uart2";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
@@ -162,6 +160,8 @@ cmu_peri: clock-controller@101f0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
+				      "spi3", "spi4", "uart0", "uart1", "uart2";
 		};
 
 		cmu_mif: clock-controller@10460000 {
@@ -169,8 +169,8 @@ cmu_mif: clock-controller@10460000 {
 			reg = <0x10460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk";
 			clocks = <&oscclk>;
+			clock-names = "oscclk";
 		};
 
 		pmu_system_controller: system-controller@10480000 {
@@ -206,11 +206,11 @@ hsi2c0: i2c@10510000 {
 			reg = <0x10510000 0x2000>;
 			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -224,14 +224,14 @@ pinctrl_mif: pinctrl@10530000 {
 		gpu: gpu@11400000 {
 			compatible = "samsung,exynos7870-mali", "arm,mali-t830";
 			reg = <0x11400000 0x5000>;
-			interrupt-names = "job", "mmu", "gpu";
 			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
 
-			clock-names = "core", "bus";
 			clocks = <&cmu_g3d CLK_GOUT_G3D_CLK>,
 				 <&cmu_g3d CLK_GOUT_G3D_ASYNCS_D0_CLK>;
+			clock-names = "core", "bus";
 
 			status = "disabled";
 		};
@@ -241,9 +241,9 @@ cmu_g3d: clock-controller@11460000 {
 			reg = <0x11460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "switch";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_G3D_SWITCH>;
+			clock-names = "oscclk", "switch";
 		};
 
 		cmu_mfcmscl: clock-controller@12cb0000 {
@@ -251,10 +251,10 @@ cmu_mfcmscl: clock-controller@12cb0000 {
 			reg = <0x12cb0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "mfc", "mscl";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MFC>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MSCL>;
+			clock-names = "oscclk", "mfc", "mscl";
 		};
 
 		mmc0: mmc@13540000 {
@@ -262,9 +262,9 @@ mmc0: mmc@13540000 {
 			reg = <0x13540000 0x2000>;
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC0_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC0>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -274,9 +274,9 @@ mmc1: mmc@13550000 {
 			reg = <0x13550000 0x2000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC1_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC1>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -286,9 +286,9 @@ mmc2: mmc@13560000 {
 			reg = <0x13560000 0x2000>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC2_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC2>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -298,9 +298,9 @@ usbdrd_phy: phy@135c0000 {
 			reg = <0x135c0000 0x100>;
 			#phy-cells = <1>;
 
-			clock-names = "phy", "ref";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER>,
 				 <&cmu_fsys CLK_GOUT_FSYS_MUX_USB_PLL>;
+			clock-names = "phy", "ref";
 
 			samsung,pmu-syscon = <&pmu_system_controller>;
 		};
@@ -311,10 +311,10 @@ usbdrd: usb@13600000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			clock-names = "bus_early", "ref", "ctrl";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD>,
 				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK>,
 				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL>;
+			clock-names = "bus_early", "ref", "ctrl";
 
 			status = "disabled";
 
@@ -323,8 +323,8 @@ usb@0 {
 				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
 
-				phy-names = "usb2-phy";
 				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
 
 				usb-role-switch;
 				snps,usb2-gadget-lpm-disable;
@@ -336,10 +336,10 @@ cmu_fsys: clock-controller@13730000 {
 			reg = <0x13730000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "usb20drd";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK>;
+			clock-names = "oscclk", "bus", "usb20drd";
 		};
 
 		pinctrl_fsys: pinctrl@13750000 {
@@ -354,12 +354,12 @@ serial0: serial@13800000 {
 			reg = <0x13800000 0x100>;
 			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART0_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART0_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <16>;
 
@@ -372,12 +372,12 @@ serial1: serial@13810000 {
 			reg = <0x13810000 0x100>;
 			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART1_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART1_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <256>;
 
@@ -390,12 +390,12 @@ serial2: serial@13820000 {
 			reg = <0x13820000 0x100>;
 			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART2_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART2_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <256>;
 
@@ -408,11 +408,11 @@ i2c0: i2c@13830000 {
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -423,11 +423,11 @@ i2c1: i2c@13840000 {
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -438,11 +438,11 @@ i2c2: i2c@13850000 {
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -453,11 +453,11 @@ i2c3: i2c@13860000 {
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -468,11 +468,11 @@ i2c4: i2c@13870000 {
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -483,11 +483,11 @@ i2c5: i2c@13880000 {
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -498,11 +498,11 @@ i2c6: i2c@13890000 {
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -513,11 +513,11 @@ hsi2c1: i2c@138a0000 {
 			reg = <0x138a0000 0x1000>;
 			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -528,11 +528,11 @@ hsi2c2: i2c@138b0000 {
 			reg = <0x138b0000 0x1000>;
 			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -543,11 +543,11 @@ hsi2c3: i2c@138c0000 {
 			reg = <0x138c0000 0x1000>;
 			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c3_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -558,11 +558,11 @@ i2c7: i2c@138d0000 {
 			reg = <0x138d0000 0x100>;
 			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -573,11 +573,11 @@ i2c8: i2c@138e0000 {
 			reg = <0x138e0000 0x100>;
 			interrupts = <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c8_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
+			clock-names = "i2c";
 
 			status = "disabled";
 		};
@@ -588,11 +588,11 @@ hsi2c4: i2c@138f0000 {
 			reg = <0x138f0000 0x1000>;
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c4_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -603,11 +603,11 @@ hsi2c5: i2c@13950000 {
 			reg = <0x13950000 0x1000>;
 			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c5_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -618,11 +618,11 @@ hsi2c6: i2c@13960000 {
 			reg = <0x13960000 0x1000>;
 			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c6_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
+			clock-names = "hsi2c";
 
 			status = "disabled";
 		};
@@ -668,11 +668,11 @@ cmu_isp: clock-controller@144d0000 {
 			reg = <0x144d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "cam", "isp", "vra";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_CAM>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_ISP>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
+			clock-names = "oscclk", "cam", "isp", "vra";
 		};
 
 		pinctrl_dispaud: pinctrl@148c0000 {
@@ -686,11 +686,11 @@ cmu_dispaud: clock-controller@148d0000 {
 			reg = <0x148d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
+			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
 		};
 	};
 

-- 
2.51.0



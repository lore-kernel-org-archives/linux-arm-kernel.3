Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E948DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9aOiH2fRvjFqeyi6vwDLjeFwLu5aT2MQJ43D56+WII=; b=grhujUZBH3Bqse9LMCxbBMkb/K
	6G4rwsJz21gi5/O5cRgHdjQ96YczMSpEkTLE4VvWmgzY0zstg4Uma7bskJGwep5osRrHNrvpnBKiE
	FWzw37RSMYZcwdCkvtAAgBqJMWad7GDTgFezursL9Zv54KjfHaz898qHPiar799kqga143WfqWrbE
	rLf8NV/1lrduXxHSIIewwbfm5DXxYrXhe1ZvCJoxawi8XZtErIQSs+IET+WnD26yeZdpzFeXdNMGl
	tVq3zFlsy7ERKONRLLunNo8GhYqWPJYSmC6EEBl9/tP0dbOf5C4zpXho/4kCUra9Kqmf/fTZQs+wP
	AMyXWd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB7x-00000002KUN-1Mgr;
	Thu, 20 Feb 2025 18:18:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAuz-00000002H9Q-2V4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:05:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A40E1BB0;
	Thu, 20 Feb 2025 10:05:19 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30A973F59E;
	Thu, 20 Feb 2025 10:04:59 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v6 08/10] arm64: dts: morello: Add support for soc dts
Date: Thu, 20 Feb 2025 18:04:26 +0000
Message-ID: <20250220180427.3382482-9-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_100501_735588_D990E6C1 
X-CRM114-Status: GOOD (  15.54  )
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

The Morello architecture is an experimental extension to Armv8.2-A,
which extends the AArch64 state with the principles proposed in
version 7 of the Capability Hardware Enhanced RISC Instructions
(CHERI) ISA.

Introduce Morello SoC dts.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm64/boot/dts/arm/Makefile        |   1 +
 arch/arm64/boot/dts/arm/morello-sdp.dts | 157 ++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index d908e96d7ddc..869667bef7c0 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -7,3 +7,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb
diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
new file mode 100644
index 000000000000..cee49dee7571
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+ */
+
+/dts-v1/;
+#include "morello.dtsi"
+
+/ {
+	model = "Arm Morello System Development Platform";
+	compatible = "arm,morello-sdp", "arm,morello";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	dpu_aclk: clock-350000000 {
+		/* 77.1 MHz derived from 24 MHz reference clock */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <350000000>;
+		clock-output-names = "aclk";
+	};
+
+	dpu_pixel_clk: clock-148500000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+		clock-output-names = "pxclk";
+	};
+
+	i2c0: i2c@1c0f0000 {
+		compatible = "cdns,i2c-r1p14";
+		reg = <0x0 0x1c0f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&dpu_aclk>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clock-frequency = <100000>;
+
+		hdmi_tx: hdmi-transmitter@70 {
+			compatible = "nxp,tda998x";
+			reg = <0x70>;
+			video-ports = <0x234501>;
+			port {
+				tda998x_0_input: endpoint {
+					remote-endpoint = <&dp_pl0_out0>;
+				};
+			};
+		};
+	};
+
+	dp0: display@2cc00000 {
+		compatible = "arm,mali-d32", "arm,mali-d71";
+		reg = <0x0 0x2cc00000 0x0 0x20000>;
+		interrupts = <0 69 4>;
+		clocks = <&dpu_aclk>;
+		clock-names = "aclk";
+		iommus = <&smmu_dp 0>, <&smmu_dp 1>, <&smmu_dp 2>, <&smmu_dp 3>,
+			 <&smmu_dp 8>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pl0: pipeline@0 {
+			reg = <0>;
+			clocks = <&dpu_pixel_clk>;
+			clock-names = "pxclk";
+			port {
+				dp_pl0_out0: endpoint {
+					remote-endpoint = <&tda998x_0_input>;
+				};
+			};
+		};
+	};
+
+	smmu_ccix: iommu@4f000000 {
+		compatible = "arm,smmu-v3";
+		reg = <0x0 0x4f000000 0x0 0x40000>;
+
+		interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+		msi-parent = <&its1 0>;
+		#iommu-cells = <1>;
+		dma-coherent;
+	};
+
+	smmu_pcie: iommu@4f400000 {
+		compatible = "arm,smmu-v3";
+		reg = <0x0 0x4f400000 0x0 0x40000>;
+
+		interrupts = <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+		msi-parent = <&its2 0>;
+		#iommu-cells = <1>;
+		dma-coherent;
+	};
+
+	pcie_ctlr: pcie@28c0000000 {
+		device_type = "pci";
+		compatible = "pci-host-ecam-generic";
+		reg = <0x28 0xC0000000 0 0x10000000>;
+		ranges = <0x01000000 0x00 0x00000000 0x00 0x6f000000 0x00 0x00800000>,
+				<0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0f000000>,
+				<0x42000000 0x09 0x00000000 0x09 0x00000000 0x1f 0xc0000000>;
+		bus-range = <0 255>;
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		dma-coherent;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic 0 0 0 170 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic 0 0 0 171 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic 0 0 0 172 IRQ_TYPE_LEVEL_HIGH>;
+		msi-map = <0 &its_pcie 0 0x10000>;
+		iommu-map = <0 &smmu_pcie 0 0x10000>;
+	};
+
+	ccix_pcie_ctlr: pcie@4fc0000000 {
+		device_type = "pci";
+		compatible = "pci-host-ecam-generic";
+		reg = <0x4f 0xC0000000 0 0x10000000>;
+		ranges = <0x01000000 0x00 0x00000000 0x00 0x7f000000 0x00 0x00800000>,
+				<0x02000000 0x00 0x70000000 0x00 0x70000000 0x00 0x0f000000>,
+				<0x42000000 0x30 0x00000000 0x30 0x00000000 0x1f 0xc0000000>;
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		dma-coherent;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic 0 0 0 201 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic 0 0 0 202 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic 0 0 0 203 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic 0 0 0 204 IRQ_TYPE_LEVEL_HIGH>;
+		msi-map = <0 &its_ccix 0 0x10000>;
+		iommu-map = <0 &smmu_ccix 0 0x10000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.43.0



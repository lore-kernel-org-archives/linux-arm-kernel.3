Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMTKhEcP3uMWKeVOXcR9DOJRK+ciajgLKw8oaadmbQ4=; b=kQY1NGN4DsxZDHyTLnO2t4GHio
	NPBwzJXI4TQoloDpPnG4K5TgvGY4JMYSPA3qdWhVfwdxmeM4PSdRpvCblS50KcE/hV0cidGkU4m3o
	veJWfEqAettRsS47lwMrTxUKyfwZLVREHy9bzSSryIARMt6cD3tkEX+saxsgprfVRt9LMdb1IuLPZ
	usWtFKw+k9GjaPYJfO3rjKCCfYDCQM9LdSoS2tVcqusftd7MAM6WpaX9dp5nu+wal3HkHJPufiD7G
	yujfF+zaZ2M6jFjPtbQfSQMY5BJO3iLz9kTfU8emTU4Pvpun9zEqSntm4cYZe66kWIfIYHnHj1nYr
	QYcc9OZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNav-0000000AlbW-3g5r;
	Thu, 02 Jan 2025 15:58:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNWu-0000000Aks6-3JE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:54:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A0211FB;
	Thu,  2 Jan 2025 07:55:04 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B9483F673;
	Thu,  2 Jan 2025 07:54:34 -0800 (PST)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 2/4] arm64: dts: morello: Add support for common functionalities
Date: Thu,  2 Jan 2025 15:54:14 +0000
Message-ID: <20250102155416.13159-3-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102155416.13159-1-vincenzo.frascino@arm.com>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_075436_932165_E6619587 
X-CRM114-Status: GOOD (  14.09  )
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

The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
some functionalities that have conveniently been included in
morello.dtsi to avoid duplication.

Introduce morello.dtsi.

Note: Morello fvp will be introduced with a future patch series.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm64/boot/dts/arm/morello.dtsi | 341 +++++++++++++++++++++++++++
 1 file changed, 341 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi

diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
new file mode 100644
index 000000000000..67bc960f4596
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/morello.dtsi
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	clocks {
+		soc_refclk50mhz: clock-50000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+			clock-output-names = "apb_pclk";
+		};
+
+		soc_refclk85mhz: clock-85000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <85000000>;
+			clock-output-names = "iofpga:aclk";
+		};
+
+		soc_uartclk: clock-50000000-uart {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+			clock-output-names = "uartclk";
+		};
+
+		dpu_aclk: dpu-aclk {
+			/* 77.1 MHz derived from 24 MHz reference clock */
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <350000000>;
+			clock-output-names = "aclk";
+		};
+
+		dpu_pixel_clk: dpu-pixel-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <148500000>;
+			clock-output-names = "pxclk";
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu0@0 {
+			compatible = "arm,neoverse-n1";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+			clocks = <&scmi_dvfs 0>;
+		};
+
+		cpu1: cpu1@100 {
+			compatible = "arm,neoverse-n1";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			clocks = <&scmi_dvfs 0>;
+		};
+
+		cpu2: cpu2@10000 {
+			compatible = "arm,neoverse-n1";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			clocks = <&scmi_dvfs 1>;
+		};
+
+		cpu3: cpu3@10100 {
+			compatible = "arm,neoverse-n1";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			clocks = <&scmi_dvfs 1>;
+		};
+	};
+
+	firmware {
+		interrupt-parent = <&gic>;
+
+		scmi {
+			compatible = "arm,scmi";
+			mbox-names = "tx", "rx";
+			mboxes = <&mailbox 1 0>, <&mailbox 1 1>;
+			shmem = <&cpu_scp_hpri0>, <&cpu_scp_hpri1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_dvfs: protocol@13 {
+				reg = <0x13>;
+				#clock-cells = <1>;
+			};
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
+	/* The first bank of memory, memory map is actually provided by UEFI. */
+	memory@80000000 {
+		device_type = "memory";
+		/* [0x80000000-0xffffffff] */
+		reg = <0x00000000 0x80000000 0x0 0x7F000000>;
+	};
+
+	memory@8080000000 {
+		device_type = "memory";
+		/* [0x8080000000-0x83f7ffffff] */
+		reg = <0x00000080 0x80000000 0x3 0x78000000>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure-firmware@ff000000 {
+			reg = <0 0xff000000 0 0x01000000>;
+			no-map;
+		};
+	};
+
+	spe-pmu {
+		compatible = "arm,statistical-profiling-extension-v1";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic>;
+		ranges;
+
+		dp0: display@2cc00000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "arm,mali-d32", "arm,mali-d71";
+			reg = <0 0x2cc00000 0 0x20000>;
+			interrupts = <0 69 4>;
+			clocks = <&dpu_aclk>;
+			clock-names = "aclk";
+			iommus = <&smmu_dp 0>, <&smmu_dp 1>, <&smmu_dp 2>, <&smmu_dp 3>,
+				<&smmu_dp 8>;
+
+			pl0: pipeline@0 {
+				reg = <0>;
+				clocks = <&dpu_pixel_clk>;
+				clock-names = "pxclk";
+				port {
+					dp_pl0_out0: endpoint {
+						remote-endpoint = <&tda998x_0_input>;
+					};
+				};
+			};
+		};
+
+		i2c: i2c@1c0f0000 {
+			compatible = "cdns,i2c-r1p14";
+			reg = <0x0 0x1c0f0000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dpu_aclk>;
+
+			hdmi_tx: hdmi-transmitter@70 {
+				compatible = "nxp,tda998x";
+				reg = <0x70>;
+				video-ports = <0x234501>;
+				port {
+					tda998x_0_input: endpoint {
+						remote-endpoint = <&dp_pl0_out0>;
+					};
+				};
+			};
+		};
+
+		gic: interrupt-controller@2c010000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#interrupt-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+			interrupt-controller;
+		};
+
+		smmu_dp: iommu@2ce00000 {
+			compatible = "arm,smmu-v3";
+			reg = <0 0x2ce00000 0 0x40000>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "cmdq-sync";
+			#iommu-cells = <1>;
+		};
+
+		smmu_ccix: iommu@4f000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0 0x4f000000 0 0x40000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+			msi-parent = <&its1 0>;
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		smmu_pcie: iommu@4f400000 {
+			compatible = "arm,smmu-v3";
+			reg = <0 0x4f400000 0 0x40000>;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+			msi-parent = <&its2 0>;
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		mailbox: mhu@45000000 {
+			compatible = "arm,mhu-doorbell", "arm,primecell";
+			reg = <0x0 0x45000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			clocks = <&soc_refclk50mhz>;
+			clock-names = "apb_pclk";
+		};
+
+		pcie_ctlr: pcie@28c0000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			reg = <0x28 0xC0000000 0 0x10000000>;
+			ranges = <0x01000000 0x00 0x00000000 0x00 0x6F000000 0x00 0x00800000>,
+				 <0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0F000000>,
+				 <0x42000000 0x09 0x00000000 0x09 0x00000000 0x1F 0xC0000000>;
+			bus-range = <0 255>;
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			dma-coherent;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 0 170 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 0 171 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 0 172 IRQ_TYPE_LEVEL_HIGH>;
+			msi-map = <0 &its_pcie 0 0x10000>;
+			iommu-map = <0 &smmu_pcie 0 0x10000>;
+		};
+
+		ccix_pcie_ctlr: pcie@4fc0000000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			reg = <0x4F 0xC0000000 0 0x10000000>;
+			ranges = <0x01000000 0x00 0x00000000 0x00 0x7F000000 0x00 0x00800000>,
+				 <0x02000000 0x00 0x70000000 0x00 0x70000000 0x00 0x0F000000>,
+				 <0x42000000 0x30 0x00000000 0x30 0x00000000 0x1F 0xC0000000>;
+			bus-range = <0 255>;
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			dma-coherent;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 0 201 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 0 202 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 0 203 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 0 204 IRQ_TYPE_LEVEL_HIGH>;
+			msi-map = <0 &its_ccix 0 0x10000>;
+			iommu-map = <0 &smmu_ccix 0 0x10000>;
+		};
+
+		uart0: serial@2a400000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x2a400000 0x0 0x1000>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&soc_uartclk>, <&soc_refclk50mhz>;
+			clock-names = "uartclk", "apb_pclk";
+
+			status = "disabled";
+		};
+
+		sram: sram@45200000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x06000000 0x0 0x8000>;
+			ranges = <0 0x0 0x06000000 0x8000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpu_scp_hpri0: scp-sram@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x80>;
+			};
+
+			cpu_scp_hpri1: scp-sram@80 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x80 0x80>;
+			};
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE6CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbJvQNoMk0M26ZBdseS2QniM8fkIrDzbqeeY6sFe2X4=; b=yN5M41tc7Gi62TwOptL2bTMclj
	OC6CTP2+FlIg1kbMD5NaAnSYZjkUJWEz96MOi1cowYMTvK8qh/fzfuGJGpiJGRCRJdEgs2lOYwaOR
	un1JjaYZ+Dv5CMeLf+F4QttXe3IbE+0fAsChKFvXr9LgMvfniZjebw7ZbYnu6HeXGDynsDC8zpMk+
	ykGJe09KeDrgeybIAzPfWMu8lgM7a+1X95oi8yWn6GC9dH9WijhKPwSjXtP3H6GenDS+xlDc9Hqpc
	4BrnF5sEDMicku09x9Vl0xxWOJRvQI6p+j+YtXBPQfqFF1eQ1B7rVa9ZgfEI+J1NEoHAKjsCcP9vc
	c+pys2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjY-000000008Vf-07zT;
	Thu, 15 Oct 2026 12:38:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjU-000000008U8-0CAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67BB4601EF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845051F000C7;
	Thu, 15 Oct 2026 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067931;
	bh=MbJvQNoMk0M26ZBdseS2QniM8fkIrDzbqeeY6sFe2X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gTah6e8+FzUBaxCmFMoYG4zWBhgVicBJDtfDjH8DTjmFlpLovRxMcTTU3VamEfIxy
	 lzxLL0PydBpADiVmapduP/c6BITOBQr7QvmSGx6V2VmSyOj0gz0TGGUE19/PZqQL5p
	 DJWFXKB2RkNsNqu3nC0B7Ce8d8VOGd0swbrNFCXliFTmt3qUJfUyswQ4R/xvGhv1qA
	 i5P+8wjUP/XxYcGpxWRcjHGPSGZGdHNzg5m4i+/LIajXvvF6EE9iQZgvs4nKiYEqYG
	 Q8AOaGnsoulhpEyG/EH0TwVCHOg9omo0nx0G4t4vENpQAQgl+JBPa3y+oaNy2797K6
	 7n3M9v6CSCYPA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCHv2 2/2] arm64: dts: altera: Add support for the Agilex27 platform
Date: Thu, 15 Oct 2026 07:37:00 -0500
Message-ID: <20261015123700.2137706-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261015123700.2137706-1-dinguyen@kernel.org>
References: <20261015123700.2137706-1-dinguyen@kernel.org>
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

The Agilex72 platform is being rebranded to Agilex27. The Agilex27 is
exactly the same as the Agilex72. Add the base DTSI and the devkit's
DTS.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: leave the agilex72 files
---
 arch/arm64/boot/dts/altera/Makefile           |   1 +
 .../boot/dts/altera/socfpga_agilex27.dtsi     | 156 ++++++++++++++++++
 .../dts/altera/socfpga_agilex27_socdk.dts     |  27 +++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 8f41349103b80..14e260fb16f3b 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
 				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex27_socdk.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
new file mode 100644
index 0000000000000..369981fe85e38
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "altr,socfpga-agilex27";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		atf_reserved: atf@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x100000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		service_reserved: svcbuffer@80100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80100000 0x0 0xf00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x0>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x100>;
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x200>;
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x300>;
+		};
+	};
+
+	clocks {
+		uart_clk: uart-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	intc: interrupt-controller@7000000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x7000000 0x0 0x10000>,
+		      <0x0 0x7080000 0x0 0x100000>;
+		ranges;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x40000>;
+
+		its: msi-controller@7040000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x0 0x7040000 0x0 0x20000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xffffffff>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		interrupt-parent = <&intc>;
+
+		smmu: iommu@c100000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0c100000 0x30000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
+		ocram: sram@0 {
+			compatible = "mmio-sram";
+			reg = <0x00000000 0x80000>;
+			ranges = <0 0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
+		uart0: serial@9038000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x9038000 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart1: serial@9039000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x9039000 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
new file mode 100644
index 0000000000000..15d331cdeeb47
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex27.dtsi"
+
+/ {
+	model = "Altera SoCFPGA Agilex27 SoCDK";
+	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.42.0.411.g813d9a9188



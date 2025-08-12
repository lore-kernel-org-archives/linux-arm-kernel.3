Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E214CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HpFPSzH5BMSx25qJxY63JWzAKDMBMOt+NibaE+k1AM=; b=JakAwZHVArny1ecLM6y2GjVUdA
	oc6BY831acSL6ZmTUyIFXD1xzRP6R6voNlMAfBRBYsVQWpOULJnqEd5Fs70f5MruDzKX+kaN7AWSf
	PCEl2q6hBVGLYz+jgUtzGt5nPMUynAXaPC+I6MmawbRFCr8TzC2Epmtibp1fpt+xinFqjGfqFFyQJ
	8yiUE+S/T6uxKC1GGmAbSGw3lfynryfajJhFo6TLgaRKblwEtS9uDBhjDwevm5cntOGQ9J5h5jjdQ
	E9maAjGePAwy9Z6pG5fz71s4moEZ0u/MSJlx9R8Dcdd8VUfQYk8roEbPzvheaPD4tXnHcfa0F0x6g
	HHtAINgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlq-0000000BNJU-2nsp;
	Tue, 12 Aug 2025 16:22:42 +0000
Received: from mail-m1973177.qiye.163.com ([220.197.31.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloAF-0000000Ah3l-31dt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:31:41 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f211b6d5;
	Tue, 12 Aug 2025 20:31:34 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	adrian.hunter@intel.com,
	robin.murphy@arm.com,
	ding.wang@bst.ai,
	gordon.ge@bst.ai
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v3 6/8] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Tue, 12 Aug 2025 20:31:08 +0800
Message-ID: <20250812123110.2090460-7-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989e43b80909cckunm52c5de628443a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR9KVktJTU1NTR5CQk0ZH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UnZiAkF8OZuGRlSIc/9rcuYUmjLpOaGzWqjjZ+VMUbMY60dk0SAsuqK3rftpJuMaihQKuktXid82Ej+jPJGizcoRQJehqNmcQ2LWlpXuL8PoCSNHGWXjs/Ecp1Y7mwmM6s+7CcQgpJLqOLKfqCopZLsIiN9ZPkbavdYOclX5bpw=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=3HpFPSzH5BMSx25qJxY63JWzAKDMBMOt+NibaE+k1AM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053139_953190_4468AE08 
X-CRM114-Status: GOOD (  15.85  )
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

Add device tree support for the Black Sesame Technologies (BST) C1200
CDCU1.0 ADAS 4C2G platform. This platform is based on the BST C1200 SoC
family.

The changes include:
- Adding a new BST device tree directory
- Adding Makefile entries to build the BST platform device trees
- Adding the device tree for the BST C1200 CDCU1.0 ADAS 4C2G board

This board features a quad-core Cortex-A78 CPU, and various peripherals
including UART, MMC, watchdog timer, and interrupt controller.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v3:
- Split defconfig enablement out into a dedicated defconfig patch
- Refine memory description: consolidate ranges in memory node and
  delele unused memory ranges
- Adjust the order of nodes
- remove mask of gic

Changes for v2:
1. Reorganized memory map into discrete regions
2. Updated MMC controller definition:
   - Split into core/CRM register regions
   - Removed deprecated properties
   - Updated compatible string
3. Standardized interrupt definitions and numeric formats
4. Removed reserved-memory node (superseded by bounce buffers)
5. Added root compatible string for platform identification
6. Add soc defconfig
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bst/Makefile              |   2 +
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  42 +++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 117 ++++++++++++++++++
 4 files changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..a39b6cafb644 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -12,6 +12,7 @@ subdir-y += arm
 subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
+subdir-y += bst
 subdir-y += cavium
 subdir-y += exynos
 subdir-y += freescale
diff --git a/arch/arm64/boot/dts/bst/Makefile b/arch/arm64/boot/dts/bst/Makefile
new file mode 100644
index 000000000000..4c1b8b4cdad8
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_BST) += bstc1200-cdcu1.0-adas_4c2g.dtb
diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
new file mode 100644
index 000000000000..d8fb07b0bc80
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "bstc1200.dtsi"
+
+/ {
+	model = "BST C1200-96 CDCU1.0 4C2G";
+	compatible = "bst,c1200-cdcu1.0-adas-4c2g", "bst,c1200";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@810000000 {
+		device_type = "memory";
+		reg = <0x8 0x10000000 0x0 0x30000000>,
+		      <0x8 0xc0000000 0x1 0x0>,
+		      <0xc 0x00000000 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mmc0_reserved: mmc0-reserved@5160000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x5160000 0x0 0x10000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&mmc0 {
+	status = "okay";
+	memory-region = <&mmc0_reserved>;
+};
+
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
new file mode 100644
index 000000000000..5e9ca0ee17cf
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "bst,c1200";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk_mmc: clock-4000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <4000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x100>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x200>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x300>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-parent = <&gic>;
+
+		uart0: serial@20008000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <25000000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@22200000 {
+			compatible = "bst,c1200-dwcmshc-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>,
+			      <0x0 0x23006000 0x0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_mmc>;
+			clock-names = "core";
+			max-frequency = <200000000>;
+			bus-width = <8>;
+			non-removable;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@32800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			ranges;
+			reg = <0x0 0x32800000 0x0 0x10000>,
+			      <0x0 0x32880000 0x0 0x100000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		always-on;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.43.0



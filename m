Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51A1CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/wIjlORwMfAe2A8lh3D4l0PcZesLECFnhFcbmUELsc=; b=c62DKAp8oa0lynGnkaZDI3ujgK
	EUDPh1xsM3M9Scq5ECBr/sY2fjNFJCBR4C80OxTNhE9F6NceCd1lu7EI3yKEBwmMGkFyJL1UhqUgS
	uaj3DN66s3gU4BnL8Fko56QIw+25YkesZaMppjRgs9lZ6YYyHr1vRlr4UBU65GZNY6vFX4fHz0kXG
	FzczhJSxws6mmpLHmXCT0407VybfDUvh53nLcNz/emq8J7qFKqIHjHIkb66BtuwI5MuZtwFV9IWKR
	1/hWrT8MM0cpw2ornqYj33rm7oXqW5oDT0EkBmU4wE5o+MkeDn7hkEvRKcZmj51Tb20M5HlMwETsR
	r1aA34Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEp-0000000CWmt-43mY;
	Tue, 23 Sep 2025 06:10:55 +0000
Received: from mail-m3289.qiye.163.com ([220.197.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEb-0000000CWfU-0CEA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:42 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdec001;
	Tue, 23 Sep 2025 14:10:37 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:13 +0800
Subject: [PATCH 7/9] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-7-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=7150;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=6Om2WbeIVDWsvp3M13b/4u8GU7cNdXlbfg/+WQNQPgc=;
 b=8T7fIxj2geu2rwMom6GwylX9JLZEEmL1CziNr5UJRypzXX/ic+FXHrtwhuLcv0Q1j0qZv47Hm
 vcgzwed+H07A7LOuuMNXObeDOnAAPsxS3EJkJTGgmBxD+7dMDXm0p6S
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a9975320ab509cckunmfc27e25b4e0345
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH00dVkMfGElMSh1NQx1OGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PxBbLtuqRJBw1EWduNdiVCU44E7LHoAlnUToASDVhd8K6Kienw66ZmKjrnNy5oB64PcCiIfi4Ietq3niO1rIZzVrLmSxRPrjiZCobyGdNctSPVwtITdx9NJV3j9/1xJSkAwG2E7GNsRKTTJ3X/283yMqmdGKoLPYq2I7Ks+BnPI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=D/wIjlORwMfAe2A8lh3D4l0PcZesLECFnhFcbmUELsc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231041_659255_965F3E94 
X-CRM114-Status: GOOD (  17.27  )
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

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v4:
- Remove Signed-off-by line for Ge Gordon
- Reorder device tree node properties for better consistency
- CPU nodes: move `device_type` before `compatible`, add explicit `reg` values
- MMC node: change compatible from `bst,c1200-dwcmshc-sdhci` to `bst,c1200-sdhci`
- MMC node: remove `bus-width` and `non-removable` from SoC dtsi, move to board dts
- SoC node: reorder properties (`ranges` before address/size cells)
- UART node: reorder properties (clock-frequency before interrupts)
- GIC node: reorder properties for better readability
- Timer node: reorder properties (always-on before interrupt-parent)
- Board DTS: add `bus-width = <8>` and `non-removable` to MMC node
- Board DTS: reorder MMC and UART node references

Changes for v3:
- Split defconfig enablement out into a dedicated defconfig patch
- Refine memory description: consolidate ranges in memory node and delete unused memory ranges
- Adjust the order of nodes
- Remove mask of gic

Changes for v2:
- Reorganize memory map into discrete regions
- Update MMC controller definition with split core/CRM register regions
- Remove deprecated properties
- Update compatible string
- Standardize interrupt definitions and numeric formats
- Remove reserved-memory node (superseded by bounce buffers)
- Add root compatible string for platform identification
- Add soc defconfig
---
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/bst/Makefile                   |   2 +
 .../boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  43 ++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi              | 115 +++++++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index b0844404eda1835d7f3112a1250dde74ac251c50..98ec8f1b76e4753257e8678c6db918053e9c528d 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -13,6 +13,7 @@ subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
+subdir-y += bst
 subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
diff --git a/arch/arm64/boot/dts/bst/Makefile b/arch/arm64/boot/dts/bst/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..4c1b8b4cdad893df0cc47d81a64d9cbc7a60a9dd
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_BST) += bstc1200-cdcu1.0-adas_4c2g.dtb
diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
new file mode 100644
index 0000000000000000000000000000000000000000..178ad4bf4f0aacf831a61af07ad151a70e075749
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -0,0 +1,43 @@
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
+&mmc0 {
+	bus-width = <8>;
+	memory-region = <&mmc0_reserved>;
+	non-removable;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..9660d8396e275945b27846c80dde79478c16ae76
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -0,0 +1,115 @@
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
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
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
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic>;
+
+		uart0: serial@20008000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			clock-frequency = <25000000>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@22200000 {
+			compatible = "bst,c1200-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>,
+			      <0x0 0x23006000 0x0 0x1000>;
+			clocks = <&clk_mmc>;
+			clock-names = "core";
+			dma-coherent;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@32800000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x32800000 0x0 0x10000>,
+			      <0x0 0x32880000 0x0 0x100000>;
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		always-on;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E31C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v5zGpkPvGr84zpKybTIRBthxazxJeY+bSbl9s+aYKIc=; b=ypWrU2Luu0Wbz7rqU5rLFWWlu9
	zlQxwwffbhBI0LxPyVmkv8JG61D/P/fik5j61VIKNaN+sj+ueyHMd4Jgy+vxHXEeGfwuRKchy+omJ
	ogVk3i0gg7WHijksNZAZpTTVXwQU35CWHo2IAK3ztQRHWGtOe3C0th/6rPdgErYNIrzBk+T2y+u92
	HlzQREMJx5foGLQZcxEFSob3jKt/IlfO/RaHqms3BkxRwIPq9Bjj1eUfkWVBGKzlnATxNn3i1lRIs
	ZCGWkVNsHVHQ1bgSrJVgrsVajZJgCJuZzLvmUz0XweXqOwmcU5dBqxpp5d+CtOMEZBGYzUyu1xhjU
	gZxXKTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD2f-0000000CioB-2RHd;
	Wed, 28 May 2025 09:25:45 +0000
Received: from mail-m3290.qiye.163.com ([220.197.32.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYx-0000000CdfI-16yt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:55:04 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a630;
	Wed, 28 May 2025 16:54:58 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 6/9] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Wed, 28 May 2025 16:54:57 +0800
Message-Id: <20250528085457.481372-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUwYVkgfSkwYHh0aHhpKHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a17fe09cckunm6c18a290397e60
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OS46TAw*STE0CEgrLg82OS0c
	ThMKCzRVSlVKTE9DT0lJT0JCTkpPVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUxIS0k3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Rm6aSCfCg9tITzi1S3kXi7EX034ErJavdpJzIxWyKhvkxdB+hxQbMVe7ahf2zwc9+PfQaRbTMOvKVw1WrH4o2VGk/FMDztY3pv3qnrYu3iLTfnlNoxq44mnuUVlC5J41oZv/onbOGt8UN7I5wO79OoGT0qgs9D/OE6tKaJ3ZYVw=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=v5zGpkPvGr84zpKybTIRBthxazxJeY+bSbl9s+aYKIc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015503_491427_1E5E1E9B 
X-CRM114-Status: GOOD (  14.73  )
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
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bst/Makefile              |  10 ++
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 ++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 ++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..135965288100 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -35,3 +35,4 @@ subdir-y += tesla
 subdir-y += ti
 subdir-y += toshiba
 subdir-y += xilinx
+subdir-y += bst
diff --git a/arch/arm64/boot/dts/bst/Makefile b/arch/arm64/boot/dts/bst/Makefile
new file mode 100644
index 000000000000..64fd43c98275
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/Makefile
@@ -0,0 +1,10 @@
+ifeq ($(CONFIG_SECOND_KERNEL), )
+
+# Enables support for device-tree overlays
+DTC_FLAGS := -@
+
+dtb-$(CONFIG_ARCH_BSTC1200) += bstc1200-cdcu1.0-adas_4c2g.dtb
+
+endif
+
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
new file mode 100644
index 000000000000..92915e7630ff
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "bstc1200.dtsi"
+
+/ {
+	model = "BST C1200-96 CDCU1.0 4C2G";
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0x20008000 console=ttyS0,115200n8 rw";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@8c0000000 {
+		device_type = "memory";
+		reg = <0x8 0x10000000 0x0 0x30000000
+		      0x8 0xc0000000 0x1 0x0
+		      0xc 0x0 0x0 0x40000000
+		      0x8 0x254000 0x0 0x1000
+		      0x8 0x151000 0x0 0x1000>;
+	};
+
+	reserved-memory {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges;
+
+		mmc0_reserved: mmc0_region@5160000 {
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
index 000000000000..6ed2d8cbd720
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+/ {
+	compatible = "bst,c1200";
+	#address-cells = <0x2>;
+	#size-cells = <0x2>;
+
+	cpus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x0>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x100>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x200>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x300>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		l2_cache: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	misc_clk: misc_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0x0>;
+		clock-frequency = <0x3d0900>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		always-on;
+		interrupts = <GIC_PPI 0xd (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xe (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xb (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xa (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges = <0x0 0x0 0x0 0x0 0xffffffff 0xffffffff>;
+
+		mmc0: dwmmc0@22200000 {
+			#address-cells = <0x2>;
+			#size-cells = <0x0>;
+			compatible = "bst,dwcmshc-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>;
+			reg-names = "base";
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 0x90 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "IRQDWMMC0";
+			clock-frequency = <0xbebc200>;
+			max-frequency = <0xbebc200>;
+			mmc_crm_base = <0x23006000>;
+			mmc_crm_size = <0x1000>;
+			fifo-depth = <0x400>;
+			bus-width = <0x8>;
+			non-removable;
+			sdhci,auto-cmd12;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		uart0: serial@20008000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 0xd3 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <0x17d7840>;
+			reg-shift = <0x2>;
+			reg-io-width = <0x4>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@32800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <0x3>;
+			#address-cells = <0x2>;
+			#size-cells = <0x2>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			ranges;
+			reg = <0x0 0x32800000 0x0 0x10000 0x0 0x32880000 0x0 0x100000>;
+			interrupts = <GIC_PPI 0x9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			status = "okay";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+		cpu_suspend = <0xc4000001>;
+	};
+};
-- 
2.25.1



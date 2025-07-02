Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A6CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zX9xAz2D0jYqJzruhcDB4kWgwhYwe/xmi9zdJYXp4s=; b=eXh2yI/LedyOwlV0WgEMoXBPmg
	hGtTlqo+dyJyOUZhE5TK+PzVJLqOBaxFZmnfmzX4FyTS+e81A9PsuuRbz7QOLkdXZ98vCLpGcBizR
	AD5jx94ov3y/w1EqMQ5T6eOQMQG7e13Oogp9MUYwdOIweB3MOh6xtdLh+w/DdwHzkjLbnUyXUhTDq
	Z0l0fpk/+2Syqx6Vd9j6Ot09updfo9sKDiHVpTwkiuwKIDkw9s3KLr1shTS6W33M1GBRgRcuu/DHC
	N6ACGfwlAK7uTFZXKwq2081pqnEqLJWh6FzUZr7luafECwX6QKkEZy8GaPf1uhNrGRfVaBYwsVS1C
	IQmIt6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWumW-00000007xuo-0eS4;
	Wed, 02 Jul 2025 10:33:36 +0000
Received: from mail-m3290.qiye.163.com ([220.197.32.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu3A-00000007pff-0zmr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:46:45 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1aaa9ed5f;
	Wed, 2 Jul 2025 17:46:39 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	catalin.marinas@arm.com,
	geert.uytterhoeven@gmail.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	bst-upstream@bstai.top,
	neil.armstrong@linaro.org,
	jonathan.cameron@huawei.com,
	bigfoot@classfun.cn,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	geert+renesas@glider.be,
	andersson@kernel.org,
	nm@ti.com,
	nfraprado@collabora.com,
	quic_tdas@quicinc.com,
	ebiggers@google.com,
	victor.shih@genesyslogic.com.tw,
	shanchun1218@gmail.com,
	ben.chuang@genesyslogic.com.tw,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v2 6/8] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board and defconfig
Date: Wed,  2 Jul 2025 17:44:42 +0800
Message-Id: <20250702094444.3523973-7-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702094444.3523973-1-yangzh0906@thundersoft.com>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGh1KVhkZSh5IShofGEIZQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSk
	tLVUpCWQY+
X-HM-Tid: 0a97ca87fe7709cckunmee1cabff3ebbc1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6FRw6ATE9S082Kxo#HU4K
	SktPChJVSlVKTE5KT09CTUtKTkhLVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUNOSEg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=LcD177pCHl9iMO/5tUAt9Aup0ONwc3+JngKUJx11307DXxj7xrMMLTfrkru6dy9fG5OqClUhFsen0OXjZr3TQkj6TkPZbRato/YtS6S3q4HxRwn3mjk/5qP8dqv6YM2UrPx63HayhL6GMD7TkHzCDa5meJI89+FfSMnivNyI5SM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=7zX9xAz2D0jYqJzruhcDB4kWgwhYwe/xmi9zdJYXp4s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_024644_430274_8F4ED041 
X-CRM114-Status: GOOD (  15.98  )
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

---
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

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bst/Makefile              |   2 +
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  60 +++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 117 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 5 files changed, 181 insertions(+)
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
index 000000000000..4036e0ac2e1d
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -0,0 +1,60 @@
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
+		reg = <0x8 0x10000000 0x0 0x30000000>;
+	};
+
+	memory@8c0000000 {
+		device_type = "memory";
+		reg = <0x8 0xc0000000 0x1 0x0>;
+	};
+
+	memory@c00000000 {
+		device_type = "memory";
+		reg = <0xc 0x0 0x0 0x40000000>;
+	};
+
+	memory@800254000 {
+		device_type = "memory";
+		reg = <0x8 0x254000 0x0 0x1000>;
+	};
+
+	memory@800151000 {
+		device_type = "memory";
+		reg = <0x8 0x151000 0x0 0x1000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mmc0_reserved: mmc0@5160000 {
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
index 000000000000..ddff2cb82cb0
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
+		l2_cache: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	clk_mmc: clock-4000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <4000000>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		always-on;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x0 0xffffffff 0xffffffff>;
+		interrupt-parent = <&gic>;
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
+		gic: interrupt-controller@32800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			ranges;
+			reg = <0x0 0x32800000 0x0 0x10000>,
+			      <0x0 0x32880000 0x0 0x100000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+};
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..0a1cfaa19688 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1



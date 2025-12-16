Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97BD5E13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=poNDl4Id6GeoX66ol2tQt+W7e38iijiinu0vHS2hLdY=; b=ahhOBCKbRpgAA1yNaB9jMMJwBt
	flKEc2b1Jkc8ZfzDwzbY524yVzf/xPNE6xmpa99Kqpt45/U8kCrlrWGKD8Vos9pO3WVl067vW9g7t
	5DYGVorN5lnTKywFLP+cO3NZFnansKX8kqmD/t5gtpwa0gjWzgsmMUWxiDkeMScrcD47+dGq30+0v
	2TJI/sLaWTxzom5yJiMzcWzEvDyH3JVGROglaJTv4QWCy+6whJgxdKF5PSQspjUOQpCYVobIDE7Kx
	UYbaBYlLQlQ9XMsGhStGOsxKbt8AKoxABcR0shqbOmughHtdfGzW+ML1tjsMvT466Fl8VVrN60qWP
	6Ahm88DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZNX-00000005gY1-2CnF;
	Tue, 16 Dec 2025 18:02:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZNR-00000005gVN-0JUq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D5B1409D4;
	Tue, 16 Dec 2025 18:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B87BC4CEF1;
	Tue, 16 Dec 2025 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908144;
	bh=LmeiEpnSJeBrZO0QwzigFE8VOOmE1+L3zO4uUl7fGnk=;
	h=From:To:Cc:Subject:Date:From;
	b=PjfnS/FtSC+LtHr2tDmh7Z2yxYgG/YC5EKoKV0wYr/LBSNfllwvDINSlmAvj6fjG8
	 w1k5Hb+y59A5DcBjBTinlDGl3KeKrB73NzqtwCD/5arcUEbwHG0RjVKlxvnDRDZ3qh
	 kSt5CoVBgSmc15mXTCHWyGv6DFCgBMGwM5hVdizf1i8KYY3vxUUo3aRn4pGS/kS7At
	 R+KY5szd+ovfvqXnkvoVHrc50Ztkhb+viqf6WfknQ2g5gsOwOYBAwI1j9cKRJwI9zQ
	 rieMHGp4HIgk576paViMN5dbGP2G8rPN8UslUPewhWicJ9ilz7FAczcJVV9wFzulQY
	 aCeenXAQWcrAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Richter <rric@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: cavium: Drop thunder2
Date: Tue, 16 Dec 2025 12:02:02 -0600
Message-ID: <20251216180202.2794695-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_100227_517819_D3A2FB4C 
X-CRM114-Status: GOOD (  12.59  )
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

The Cavium thunder2 DT support
 is incomplete. It consists of 4 cores
(out of 128) and only a serial port. The thunder2 specific drivers in
the kernel don't have DT support either. The few remaining users of
this platform likely use ACPI.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/cavium/Makefile           |   1 -
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts  |  30 ----
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 144 ------------------
 3 files changed, 175 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dts
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi

diff --git a/arch/arm64/boot/dts/cavium/Makefile b/arch/arm64/boot/dts/cavium/Makefile
index c178f7e06e18..8a1854380993 100644
--- a/arch/arm64/boot/dts/cavium/Makefile
+++ b/arch/arm64/boot/dts/cavium/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
-dtb-$(CONFIG_ARCH_THUNDER2) += thunder2-99xx.dtb
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
deleted file mode 100644
index 89fc4107a0c4..000000000000
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * dts file for Cavium ThunderX2 CN99XX Evaluation Platform
- *
- * Copyright (c) 2017 Cavium Inc.
- * Copyright (c) 2013-2016 Broadcom
- */
-
-/dts-v1/;
-
-#include "thunder2-99xx.dtsi"
-
-/ {
-	model = "Cavium ThunderX2 CN99XX";
-	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
-		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
-	};
-
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
deleted file mode 100644
index 966fb57280f3..000000000000
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ /dev/null
@@ -1,144 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * dtsi file for Cavium ThunderX2 CN99XX processor
- *
- * Copyright (c) 2017 Cavium Inc.
- * Copyright (c) 2013-2016 Broadcom
- * Author: Zi Shen Lim <zlim@broadcom.com>
- */
-
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-
-/ {
-	model = "Cavium ThunderX2 CN99XX";
-	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	/* just 4 cpus now, 128 needed in full config */
-	cpus {
-		#address-cells = <0x2>;
-		#size-cells = <0x0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-		};
-
-		cpu@1 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-		};
-
-		cpu@2 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-		};
-
-		cpu@3 {
-			device_type = "cpu";
-			compatible = "cavium,thunder2", "brcm,vulcan";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-0.2";
-		method = "smc";
-	};
-
-	gic: interrupt-controller@4000080000 {
-		compatible = "arm,gic-v3";
-		#interrupt-cells = <3>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		interrupt-controller;
-		#redistributor-regions = <1>;
-		reg = <0x04 0x00080000 0x0 0x20000>,	/* GICD */
-		      <0x04 0x01000000 0x0 0x1000000>;	/* GICR */
-		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-
-		gicits: msi-controller@4000100000 {
-			compatible = "arm,gic-v3-its";
-			msi-controller;
-			reg = <0x04 0x00100000 0x0 0x20000>;	/* GIC ITS */
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	pmu {
-		compatible = "brcm,vulcan-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>; /* PMU overflow */
-	};
-
-	clk125mhz: uart_clk125mhz {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk125mhz";
-	};
-
-	pcie@30000000 {
-		compatible = "pci-host-ecam-generic";
-		device_type = "pci";
-		#interrupt-cells = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		/* ECAM at 0x3000_0000 - 0x4000_0000 */
-		reg = <0x0 0x30000000  0x0 0x10000000>;
-
-		/*
-		 * PCI ranges:
-		 *   IO		no supported
-		 *   MEM        0x4000_0000 - 0x6000_0000
-		 *   MEM64 pref 0x40_0000_0000 - 0x60_0000_0000
-		 */
-		ranges =
-		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
-		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
-		bus-range = <0 0xff>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map =
-		      /* addr  pin  ic   icaddr  icintr */
-			<0 0 0  1  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  2  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  3  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-			 0 0 0  4  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-		msi-parent = <&gicits>;
-		dma-coherent;
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		uart0: serial@402020000 {
-			compatible = "arm,pl011", "arm,primecell";
-			reg = <0x04 0x02020000 0x0 0x1000>;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk125mhz>, <&clk125mhz>;
-			clock-names = "uartclk", "apb_pclk";
-		};
-	};
-
-};
-- 
2.51.0



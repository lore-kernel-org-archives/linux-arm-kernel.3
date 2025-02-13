Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5DDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBP4dFXGP81bP2r+ApYOIPnO8FLrT7+vtreTR/XAU24=; b=suXgzIenNjZ7gJ1zWC5xrAegeD
	jMV+U83HpoJs9iSBynSUfwPJyaCTS6g5bDCrzGB2XROJ8ltt4fQfecuBOnuoGZcEBHCbpb0wQp9TM
	g87KsASbOmPoLpKz3TMW9zWIotMisrFXoPxBC3kDrV+G5nBiyEPbC6iZ8y8l4gH+/EOZeBziFfW3f
	Ty5UyDCRc3HfA+Ozf3E+/FmbUTLUE6IqkWKo34OY7d3Daymvt84v53mUs2CmWmZK9ctT9qz/ANMWJ
	BMojHrxI5Pl/Z1MOp8NZ7yauQCkczWhxnvhnYrirzdvCjyfdJ0XamdYCydUzsskRbFZOHbHAeszjf
	yzAhC0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieE3-0000000CIAJ-3NXw;
	Thu, 13 Feb 2025 18:46:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidYq-0000000C814-3X5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:03:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B0A113E;
	Thu, 13 Feb 2025 10:04:01 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 824643F5A1;
	Thu, 13 Feb 2025 10:03:38 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 7/8] arm64: dts: morello: Add support for fvp dts
Date: Thu, 13 Feb 2025 18:03:08 +0000
Message-ID: <20250213180309.485528-8-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213180309.485528-1-vincenzo.frascino@arm.com>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100341_012965_53BD68C2 
X-CRM114-Status: GOOD (  13.87  )
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

Introduce Morello fvp dts.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm64/boot/dts/arm/Makefile        |  2 +-
 arch/arm64/boot/dts/arm/morello-fvp.dts | 78 +++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/arm/morello-fvp.dts

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index 869667bef7c0..f30ee045dc95 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -7,4 +7,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
-dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb morello-fvp.dtb
diff --git a/arch/arm64/boot/dts/arm/morello-fvp.dts b/arch/arm64/boot/dts/arm/morello-fvp.dts
new file mode 100644
index 000000000000..c8d38bebd1ec
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/morello-fvp.dts
@@ -0,0 +1,78 @@
+
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+ */
+
+/dts-v1/;
+#include "morello.dtsi"
+
+/ {
+	model = "Arm Morello Fixed Virtual Platform";
+	compatible = "arm,morello-fvp", "arm,morello";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	bp_refclock24mhz: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "bp:clock24mhz";
+	};
+
+	block_0: virtio_block@1c170000 {
+		compatible = "virtio,mmio";
+		reg = <0x0 0x1c170000 0x0 0x200>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	net_0: virtio_net@1c180000 {
+		compatible = "virtio,mmio";
+		reg = <0x0 0x1c180000 0x0 0x200>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	rng_0: virtio_rng@1c190000 {
+		compatible = "virtio,mmio";
+		reg = <0x0 0x1c190000 0x0 0x200>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	p9_0: virtio_p9@1c1a0000 {
+		compatible = "virtio,mmio";
+		reg = <0x0 0x1c1a0000 0x0 0x200>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	kmi_0: kmi@1c150000 {
+		compatible = "arm,pl050", "arm,primecell";
+		reg = <0x0 0x1c150000 0x0 0x1000>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bp_refclock24mhz>, <&bp_refclock24mhz>;
+		clock-names = "KMIREFCLK", "apb_pclk";
+	};
+
+	kmi_1: kmi@1c160000 {
+		compatible = "arm,pl050", "arm,primecell";
+		reg = <0x0 0x1c160000 0x0 0x1000>;
+		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bp_refclock24mhz>, <&bp_refclock24mhz>;
+		clock-names = "KMIREFCLK", "apb_pclk";
+	};
+
+	eth_0: ethernet@1d100000 {
+		compatible = "smsc,lan91c111";
+		reg = <0x0 0x1d100000 0x0 0x10000>;
+		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&uart0 {
+    status = "okay";
+};
-- 
2.43.0



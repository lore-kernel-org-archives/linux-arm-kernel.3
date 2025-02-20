Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC64C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=618WdqtSInPKewHFHxaMK0rsKajJ0ITY/YZTkGGYczU=; b=eLhkni1JfCvRMRCb+k+la3SUE3
	3SfMaL3XQcZtxvWFC5jYQmncj8liaGbBD0ragvjhAIuGA0jUVC9SeIUQB+Ys4he4RKFbSFMeXHLte
	YOF2Ll2H8K7+s3VKZWkj07WW9a1umIOYK1xI3tspF4CXme99ssmAln1h+OKzJttIy8vEHNcpIEA18
	JMZhtloARUpoJd864EiOzHNerwRhS47lejoZU72JfSDBqWI79Yrl5fIbP3c6JiNLBHxpCNhoYQ+oz
	S+Tk/Wy2dxYRwclKDMReXmyTzGH2d328yfmLZqn1uq7vDfS0mBNZJPNq4alCmbS4Zrdo05L8kuQV1
	i244y8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB9P-00000002Kkx-42JT;
	Thu, 20 Feb 2025 18:19:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAv2-00000002HAf-0euM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:05:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C204F16F3;
	Thu, 20 Feb 2025 10:05:21 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97C743F59E;
	Thu, 20 Feb 2025 10:05:01 -0800 (PST)
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
Subject: [PATCH v6 09/10] arm64: dts: morello: Add support for fvp dts
Date: Thu, 20 Feb 2025 18:04:27 +0000
Message-ID: <20250220180427.3382482-10-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_100504_278408_9FC201A0 
X-CRM114-Status: GOOD (  14.59  )
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
 arch/arm64/boot/dts/arm/morello-fvp.dts | 77 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
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
index 000000000000..2072c0b72325
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/morello-fvp.dts
@@ -0,0 +1,77 @@
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
+	status = "okay";
+};
-- 
2.43.0



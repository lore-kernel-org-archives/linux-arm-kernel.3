Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4771610987B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuacsvF4xEf8cMhxQo+6d6VdG/+cZbcsx5CLZlOSpEs=; b=QmsgQ/hicl9Rsd9CpG8uc71VOn
	5/Q1oKRtsL2SaFxzJk3GDTl2/rUNYr3nAwklI2BqAH8zqqlRuHsFpOVsjEBcz0jboXaNp/LM0k3Vt
	Jbm1N3eE1j48rwZystzlOsuDD/A+brGgEZeqfBMOQsva5YLkZCemEvQim+WhSzgBmd7gmVYNZ71CM
	lvtuwkuiy93xI4JPvqtZDRQBXxmOlBoVE0uPpPG/6PI7ZXjkAGNisCmlooae5LiOblGfp2qjbnMAR
	bjw5yu8D4kGI+yh2Y+D9erwZ9f2FmKyuvRhONSVEZhq7tBDxT9LVUzWiDMsL7PyrSoERl99GliQXe
	9f84zoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d12-0000000DBuE-1OjN;
	Fri, 20 Mar 2026 16:48:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0e-0000000DBXt-1lh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19DC74428C;
	Fri, 20 Mar 2026 16:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8372C4CEF7;
	Fri, 20 Mar 2026 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025260;
	bh=+jSC2BcOr5bTFiGTzqJGWVjWkhUc4jNiP7GFwpFjfWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E96bmnpfmHgxHqt2Jnj7OMb8dMAA7xDxsiR2OZLPBhUKCaJVA55ysug/aHl7DoFK9
	 4LgEqs4ZbThdc9M1y/zRpGMV4mumK7L4hmMtnS+RFJ2yWZpLAaRSrIs1aG3Wbrxls7
	 Flkb1fkPm4srpes/8FVDPN9yVja8QZSZ4+i6tancyVPg+wjDzbntznboIN6skpvxaj
	 kZ7i8OEv3yZGGjd1IRFRNW9RBEXrlGH/uFYNylE2FVuICOKXyVNmSeQlXsaqkFWchZ
	 UHkFmTuQv42HlT12WlLJaKr4GloKp+dVRMQ0zZ9z5Gq/p7GaOD8qP/w4e5z0OClH/U
	 P3+qWdojv7/xQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Mar 2026 11:47:18 -0500
Subject: [PATCH 5/5] arm64: dts: arm/corstone1000: Add corstone-1000-a320
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dt-corstone1000-a320-v1-5-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Frazer Carsley <frazer.carsley@arm.com>, 
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>, 
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094740_523944_1549BA45 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

The Corstone-1000-a320 is a Corstone-1000 derivative with Cortex-A320 cores,
GIC-600, and Ethos-U85 NPU.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/Makefile                  |  1 +
 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts | 15 ++++
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi    | 91 +++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index f30ee045dc95..fa035c68991a 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -7,4 +7,5 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-a320-fvp.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb morello-fvp.dtb
diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts b/arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts
new file mode 100644
index 000000000000..0f72af78b5e1
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2026, Arm Limited. All rights reserved.
+ *
+ */
+
+/dts-v1/;
+
+#include "corstone1000-a320.dtsi"
+#include "corstone1000-fvp.dtsi"
+
+/ {
+	model = "ARM Corstone1000-A320 FVP (Fixed Virtual Platform)";
+	compatible = "arm,corstone1000-a320-fvp";
+};
diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
new file mode 100644
index 000000000000..f0937914350c
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2026, Arm Limited. All rights reserved.
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "corstone1000.dtsi"
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus: cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a320";
+			reg = <0 0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a320";
+			reg = <0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a320";
+			reg = <0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a320";
+			reg = <0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	sram: sram@2400000 {
+		compatible = "mmio-sram";
+		reg = <0x02400000 0x200000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+	};
+
+	gic: interrupt-controller@1c000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-controller;
+		reg = <0x1c000000 0x10000>,
+		      <0x1c040000 0x80000>;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+
+	soc {
+		npu@1a050000 {
+			compatible = "arm,corstone1000-ethos-u85", "arm,ethos-u85";
+			reg = <0x1a050000 0x1400>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&refclk100mhz>, <&refclk100mhz>;
+			clock-names = "core", "apb";
+			sram = <&sram>;
+		};
+	};
+};

-- 
2.51.0



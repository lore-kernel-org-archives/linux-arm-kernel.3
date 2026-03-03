Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61074EC048A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MR6MYyVL+/PdfyOO+ji4xQYPHzKA2WcH/ZMIWPbyoo=; b=EfgGAD6iaqzMJx8JnMLENxns+E
	fpDMKROLWuet56kNfjmdNdJoHp9YU2N+yqTajT/MraHWqgIZkZG8L3DnxTMXKbF4GUTzM0rSj3rSZ
	w/KWqYGhDqWkqDBqI0V6QhogwBpPBqsYlsLbu8NKgmGQnmIFe0Kveo3e45OpAtDgYW3wT9kU4/IGA
	c60raZafRP7y981zEqKdcXDF2kBC8AIj1KjvGsdRZyG01yo3uC+DuK1JLZQjK0tK2kFXFzydaTTpk
	/LieSa3cd0KQKy8FvEGXCMPJldGK/mMILcwUlO2Bxwr0fMu85YZIPtgGjbhapIDUMXAIvZAXq42Wi
	GILo93sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMeA-0000000Evq6-22LC;
	Tue, 03 Mar 2026 10:06:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMe5-0000000Evma-29T1;
	Tue, 03 Mar 2026 10:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37D8444388;
	Tue,  3 Mar 2026 10:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14F8AC2BCB2;
	Tue,  3 Mar 2026 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532389;
	bh=eO9gr/Eb4XIsWl7Ozofk85fAxnL6mM1g0zjcZLACG1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QwvAnL8s3kUVS+Wkay3SZrBGweoFZp3/PWltmdmzr3P2yx+KYDH5vHkNUpFLOZGmN
	 RfpyhKzW67qb+r0uHikBeRF2v+QsdIszX7XSGw4nUGTop1sOa8aDcTtv4V+WdUsEJF
	 3sqW2SIV4epMyUuQuwCgyYBZRnMoLJkyoe0VvS6d8gLF1BjkAjLRKuLYz8+BS2xWHt
	 kZTnuUm5itoZseg7Wu4jI7llZwLAKGFalxiDgK4rAI1uzaKaaqPyl6MyaQNsHfSkl5
	 1xH+E9vi4cW9kmzyGxsljBYvqhtff2a8CIegC6M3kpmG4WGJNzZcUE+Issc0O6bBZS
	 TvB6QzSky/JNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057C9EC048C;
	Tue,  3 Mar 2026 10:06:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Mar 2026 10:06:26 +0000
Subject: [PATCH v3 2/2] arm64: dts: add support for A9 based Amlogic BY401
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-a9-baisc-dts-v3-2-4bf21001f05c@amlogic.com>
References: <20260303-a9-baisc-dts-v3-0-4bf21001f05c@amlogic.com>
In-Reply-To: <20260303-a9-baisc-dts-v3-0-4bf21001f05c@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772532387; l=5530;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ngLHAW867mRhs8VNuDyRiFbWtUBMBRBgKcYsKwXWGTI=;
 b=kq1gPymBgUjE80ZPXYiIBeePFG1tvPtkAA8t84W83cJvSsI3hfikZCueSKu36A9ph/RI/kl2Y
 Q0Nz3CBc3xFDXQNXy5ghHTlta4obN0SEoYDW4603aJu4AW+BdkKtEKv
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_020629_597564_FEAB295E 
X-CRM114-Status: GOOD (  13.61  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add basic support for the A9 based Amlogic BY401 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART.
These are capable of booting up into the serial console.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-a9-a311y3-by401.dts   |  40 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 128 +++++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 15f9c817e502..57bc440fa55c 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
+dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-by401.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-s6-s905x5-bl209.dtb
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
new file mode 100644
index 000000000000..a6b380ca47a5
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "amlogic-a9.dtsi"
+/ {
+	model = "Amlogic A311DY3 BY401 Development Board";
+	compatible = "amlogic,by401", "amlogic,a9";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 35 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x05000000 0x0 0x2300000>;
+			no-map;
+		};
+	};
+};
+
+&uart_b {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
new file mode 100644
index 000000000000..d957c8ad1d86
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@ff800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xff800000 0 0x1000>,
+			      <0x0 0xff840000 0 0x8000>;
+			interrupts = <GIC_PPI 9 0xf04>;
+		};
+
+		aobus: bus@ffa00000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xffa00000 0x0 0x100000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xffa00000 0x0 0x100000>;
+
+			uart_b: serial@1e000 {
+				compatible = "amlogic,a9-uart",
+					     "amlogic,meson-s4-uart";
+				reg = <0x0 0x1e000 0x0 0x18>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+		};
+	};
+};

-- 
2.52.0




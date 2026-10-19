Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D75CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFXunORW+PuRObaULoq61sL3kviCqA/X6v8YIlM+9ns=; b=re1CeV/1vDhXjMJZtSw/Wb8Y3o
	aJTKYVDuLhn01PtJ9cG+sdkJeN3HjdXF0Esfuw5Q7Jl5H4MJ96ihQKoCdgXfuILK7gkvTw7VHiTCh
	1mOfYVYqNW89Je0VR/G4HG+ISOEH8n8KwBAg5g+zvDQzdjQrXevAOf/WFcy860wcHdjo4HSxM5qyl
	eyFh50P7jo07rjk/idAaHjrfaiimdy3qVENaNPkrydHpSchnvDLyfLXvRjUaRlKZTSPxfr+/DoQ/X
	D8u9WBpBAyJ1kKuJGPxv5Ub8PYHGZLyR9oShXkHjWaSDmbdtYcqbC/hwqdmD2VCI7Zti5LAhKDlZT
	UEsje1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQj-00000006LFP-3Tet;
	Mon, 19 Oct 2026 00:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDf-2Zyr;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA0154481B;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9532DC4AF18;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=2biNqTgx6GKcm2ZuGZkX3oe3+Xu7ZjTG2TOGNp+Rkio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vsb/wMbgcFl5kyhKosVTvyuIJqJMhavV71+mT9N12komtV6Pdgzatp3clo77EcVPg
	 li0CwGuJwsPkE6HvSw0UBi80nMul9e9wPep6nb3chAu7HSrKoMxbQ06h4nYVjALEcl
	 9bUaGS/kY8GmSGZGMxRfrYVs6R+aXvT42WPH6ykv8sKik2s5vSZYsYvw8aKcJYqTfo
	 xUslbBXvYkl470bRZdX4PKeL/WAL8YnEcS0SDlfGr3s/xnBDtWArxcT8cLcSxJz++Z
	 UssXuNWXlFj+ao/RF80YgjX0comefLNGB3WczMdyWW8dqr5PlOkhma3uzNsCWGqQyd
	 xADby74x4FB2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB8ECCF2D8;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:40:03 +0100
Subject: [PATCH 7/8] arm64: dts: mediatek: Add basic support for MT8163 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-7-f2462b2d2437@protonmail.ch>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=6537;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=14rHWBooScrYpq6ceUihMici2wAk5TROgmMtstlnlWA=;
 b=O/LvnHeIwaBISkVpf3b2vuHO9KT7c+PAwIFrHTDsGNzferf+r+Bb9ZE2A8EzOVZuV1Sahwk32
 xXAMJwZJnB1BZ1/7nQ3ojNRvPF6m/MgxkQfo3c0RoYDZ+qq0zXox+Nb
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ben Grisdale <bengris32@protonmail.ch>

Add a basic dtsi for the MediaTek MT8163 SoC, describing the CPUs and
caches, PSCI, interrupt controllers, timers, PMU, watchdog and UARTs.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 arch/arm64/boot/dts/mediatek/mt8163.dtsi | 243 +++++++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8163.dtsi b/arch/arm64/boot/dts/mediatek/mt8163.dtsi
new file mode 100644
index 000000000000..645f4e15587b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8163.dtsi
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) 2026 Ben Grisdale <bengris32@protonmail.ch>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt8163";
+	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk32k: clock-32768 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "clk32k";
+	};
+
+	clk13m: clock-13000000 {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
+	clk26m: clock-26000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
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
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8163-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_FALLING>;
+			#reset-cells = <1>;
+		};
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt8163-timer",
+				     "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x1000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk13m>, <&clk32k>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		sysirq: interrupt-controller@10200620 {
+			compatible = "mediatek,mt8163-sysirq",
+				     "mediatek,mt6577-sysirq";
+			reg = <0 0x10200620 0 0x20>;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+		};
+
+		gic: interrupt-controller@10221000 {
+			compatible = "arm,gic-400";
+			reg = <0 0x10221000 0 0x1000>,
+			      <0 0x10222000 0 0x2000>,
+			      <0 0x10224000 0 0x2000>,
+			      <0 0x10226000 0 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
+				      IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt8163-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt8163-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt8163-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		uart3: serial@11005000 {
+			compatible = "mediatek,mt8163-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11005000 0 0x400>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13
+			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,no-tick-in-suspend;
+	};
+};

-- 
2.56.0




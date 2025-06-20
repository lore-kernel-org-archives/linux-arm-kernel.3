Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24129C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY1mHwx6w9cN5PYK5fbP/Y9hpTAtCz9TenBS5OG2QPM=; b=LC9SNfQuaDybbjOtEo7nY0L6uk
	5DwdrugAZpejgrrRokbfkPlaaw1SWTZ799ixMq2HRSByECdy3I9f7nmIrdUP0p32WdgEpCJG+0jPA
	mcn60N3IT+rnO6eugXmetLJp1mWHWPUZBmI6dTI9wD1v3d0JHkT08mxHQkOXrMv7DOMv9dn2E0Cza
	Origj8R0uFdWO8K5wrKiKPJ3knN60Kzk9BKbw9DqBEELeAzvQ+adVlextKjaKIL8ylRyIg8E2yhGi
	PzjQQx1vcKStfsGftDE3uqZig+JD+WxxmZwcbf1dfXdMnJSosxxQdK8ESZQlfWsY3ngXxrsWyvigP
	VjxNGZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeJH-0000000G62T-0XOh;
	Fri, 20 Jun 2025 16:09:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSduF-0000000G1RJ-2kVP;
	Fri, 20 Jun 2025 15:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52ED14AF8E;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07377C113CF;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434234;
	bh=3FBI0Jwg53Z+q657ZRTd9Kza++11o1eGhB+nORUB1cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gjvhrv7HjrQ4v4aqIMxviFUFTCTY4GDzOfNBDprYAYl+TBrexIxB7HDQQNbENt5sv
	 BgAy8+GpK/WAAUieQSqS3GX+TT6yZwgvTpHPJjwbECJt44vNOlhtzEi38Gzl/77NK1
	 R36TtrHiKtt6npiOi76218owif+h7gidYVyIZUCsUwrPXMn/ESFe7SYGimrgN6a30c
	 yOEVOsQHHOPBDgsEGPMI1WgRZuBf1alZbaPl6IJbAiHLbB4q+N2FGIKnNNVASAKUKv
	 0V6pN4ffnKTSEIba/BI6JdtbBRvTKB5EuCRePtLQbIAXhbqAR+30lS9jjx9vCxbiLU
	 GdM5U9xoTwMUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE75EC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:48 +0300
Subject: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-9-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=3093;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=yLz+8+oRVysKR8AFBuER+Y8kTu+TRBNb+mijfqNvpZQ=;
 b=bCdHvRnt9g7pM6K/Ch8qxCTRPC38eiYofcpVy4YvxOPA4ID6G44+elWtfszhzVGa1ZXYT7DJs
 kT9NpWpkFrmDlt9SWyPb/lyzmJm32pt4TRwrG0EeUR4ebCiFm0wdJGp
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084355_737190_FDA2DF18 
X-CRM114-Status: GOOD (  11.73  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add basic support for the MediaTek MT6572 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 +++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..dd12231ca745be7455e99391abd2d708f2f1a8a9
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "mediatek,mt6572";
+	interrupt-parent = <&sysirq>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "mediatek,mt6589-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+	};
+
+	system_clk: dummy13m {
+		compatible = "fixed-clock";
+		clock-frequency = <13000000>;
+		#clock-cells = <0>;
+	};
+
+	rtc_clk: dummy32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32000>;
+		#clock-cells = <0>;
+	};
+
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	watchdog: watchdog@10007000 {
+		compatible = "mediatek,mt6572-wdt",
+			     "mediatek,mt6589-wdt";
+		reg = <0x10007000 0x100>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
+		timeout-sec = <15>;
+		#reset-cells = <1>;
+	};
+
+	timer: timer@10008000 {
+		compatible = "mediatek,mt6572-timer",
+			     "mediatek,mt6577-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc_clk>;
+		clock-names = "system-clk", "rtc-clk";
+	};
+
+	sysirq: interrupt-controller@10200100 {
+		compatible = "mediatek,mt6572-sysirq",
+			     "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10200100 0x1c>;
+	};
+
+	gic: interrupt-controller@10211000 {
+		compatible = "arm,cortex-a7-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10211000 0x1000>,
+		      <0x10212000 0x2000>,
+		      <0x10214000 0x2000>,
+		      <0x10216000 0x2000>;
+	};
+
+	uart0: serial@11005000 {
+		compatible = "mediatek,mt6572-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11005000 0x400>;
+		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart1: serial@11006000 {
+		compatible = "mediatek,mt6572-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11006000 0x400>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+};

-- 
2.50.0




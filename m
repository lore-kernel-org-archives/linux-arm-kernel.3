Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62429C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfhPLoLdX/LgiQk8xr3kSlB5qx6+hpzPpvP1CMR+AZs=; b=eLDrlPtNkHT4vC4fUzdC5iTKsw
	fow9IZ+t+yqQMs1gOarbnK+BwbuvXVmB+BlN/lwFbSYmM+rlVyg7+b1uXFXMi+6fKYAHqXGvRNS9S
	mEnZ0r4vQMHfqrfAUPcE+fOqw9yD3laDP3zLs9UWD2zjqe4qbf15uy5DeFxrGcHjjAf+nqRt//9P4
	h63RmfY119qIKD2np2H8MjA98nkej0ZFneR9R5X8EcK2Wbvubq8naU5WZ02IdndWQxLM6yJUJgF5g
	p1mf91zOmHu2g/fHRfYsocDlbpr3w09cxQGNBw/zU4V/ct6PN7T8j5Gt0QQioQbfqIYoMcqYX86jz
	X0auN04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUj3j-0000000BAGb-14JT;
	Thu, 26 Jun 2025 09:38:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMp-0000000B3Ah-0rjt;
	Thu, 26 Jun 2025 08:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B3D649FFF;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6600CC16AAE;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=Q/oC3zAG5KSN+jRgxPkjrdrrhA9oMSUJGmc6UdOHebg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uFQ4EGWWcpqmu3aL4iMLriMbueqRHnRdW64rh7ti3Ju1wFt2pwUUV8LgEKsvKg+CO
	 bMDb01ENdoG7P0mUdQCOGs815y/aHeDR/9DvnEl9nzkbAPxBZ7zHNUQHu9+t/UDbxo
	 njGO0JLqULpB1LJnMYWBG+NLsjqIdIVa4mJX5OEfKBQuoCnTq5p685G9aBbboyjZWG
	 JDOCrf0dDSuF/oBjk+VpKBtbWqxkc1MHjfA+dAOKbaxxkOeIk0fT067mNmF77SqnAW
	 r7fM07JWdqmDTwa9ACTDJ8Dlphqf/STHSwcY40cKLvYM4o3TWoXxxgbFWhEkDjwtI4
	 171ytHOsZ+eiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A93BC7EE3A;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:54:02 +0300
Subject: [PATCH v2 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-9-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=3252;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=hAnQxIQ8SeGexEO8sfAsSw3VUgYtgiPEA7IZtJQPS8E=;
 b=fXRu+D73NvKFA1xTqPyyae1NO8hDozktu9LMwheATwyUV5SzQ/ph/3T+pZrlO7TcENUFf4iEk
 hfYp6CbwCM8B+0o54gtMuLtKn0xUVENMvE5l4AQbefaqeRKzHSENGgo
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015359_296554_0AF4C84E 
X-CRM114-Status: GOOD (  12.09  )
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
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 109 +++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b4fa376619a58cacd33ef556f80c1a4f7126c4f5
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -0,0 +1,109 @@
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
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
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
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
+			reg = <0x10007000 0x100>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
+			timeout-sec = <15>;
+			#reset-cells = <1>;
+		};
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt6572-timer", "mediatek,mt6577-timer";
+			reg = <0x10008000 0x80>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		sysirq: interrupt-controller@10200100 {
+			compatible = "mediatek,mt6572-sysirq", "mediatek,mt6577-sysirq";
+			reg = <0x10200100 0x1c>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
+
+		gic: interrupt-controller@10211000 {
+			compatible = "arm,cortex-a7-gic";
+			reg = <0x10211000 0x1000>,
+			      <0x10212000 0x2000>,
+			      <0x10214000 0x2000>,
+			      <0x10216000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
+
+		uart0: serial@11005000 {
+			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
+			reg = <0x11005000 0x400>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+
+		uart1: serial@11006000 {
+			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
+			reg = <0x11006000 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0




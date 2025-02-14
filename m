Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7uFMSiJ/m2vVenrxcmKOqs0qVZgFe8Xk6N2ZQYSbew=; b=DTysfs5znVQB4KfmsHsQCCVwUj
	3NhdO5ygNDXt2kaQJOQvxqyx7ruFrZ/q/gZmpKHcm3Pns4QkQuoDjYd1u5FfYtvS1MfilPYY1D64w
	7rhbynTsT0Ft9MF8ysCeVieCjrs1TXjvPccNDGWA7H+b5AockfScGWGEcUBbAEETqcoLFLB9F9+DH
	OcuS2uXjO6OHAK4+nmb9GQG6bDvd2eUPl0CEUNR/BEg+tVKXHA6HrLGtv5IAOVmwPcNsX6IjnCDAZ
	35sjVdo2XYZH4clgtt1ozutG2ndGxX+1lZwNIek56JhhIS8DU5Ay3H+aDFh/Y6sG+BChJbZF8teEB
	mkJlimPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiva1-0000000EyG9-2zBJ;
	Fri, 14 Feb 2025 13:18:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivFB-0000000Etge-1z8g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 12:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76C13113E;
	Fri, 14 Feb 2025 04:56:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495F73F58B;
	Fri, 14 Feb 2025 04:56:31 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/15] dt-bindings: clk: sunxi-ng: add compatible for the A523 PRCM-CCU
Date: Fri, 14 Feb 2025 12:53:58 +0000
Message-ID: <20250214125359.5204-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214125359.5204-1-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045633_603867_ECA6AD7A 
X-CRM114-Status: GOOD (  13.92  )
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

The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
the PRCM R_CCU.

Add the new compatible string, along with the required input clock
lists. There is now an extra input clock (PLL_AUDIO), so add this to the
list of allowed clocks and required it for the A523 PRCM CCU.
Also add the DT binding headers, listing all the clocks with their ID
numbers.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        | 76 ++++++++++++-------
 include/dt-bindings/clock/sun55i-a523-r-ccu.h | 37 +++++++++
 include/dt-bindings/reset/sun55i-a523-r-ccu.h | 25 ++++++
 3 files changed, 110 insertions(+), 28 deletions(-)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 451a18de1b6c1..791dc333be74d 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -46,6 +46,7 @@ properties:
       - allwinner,sun50i-h616-ccu
       - allwinner,sun50i-h616-r-ccu
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-r-ccu
       - allwinner,suniv-f1c100s-ccu
       - nextthing,gr8-ccu
 
@@ -59,6 +60,7 @@ properties:
       - description: Low Frequency Oscillator (usually at 32kHz)
       - description: Internal Oscillator
       - description: Peripherals PLL
+      - description: Audio PLL
 
   clock-names:
     minItems: 2
@@ -67,6 +69,7 @@ properties:
       - const: losc
       - const: iosc
       - const: pll-periph
+      - const: pll-audio
 
 required:
   - "#clock-cells"
@@ -80,54 +83,71 @@ if:
   properties:
     compatible:
       enum:
-        - allwinner,sun8i-a83t-r-ccu
-        - allwinner,sun8i-h3-r-ccu
-        - allwinner,sun20i-d1-r-ccu
-        - allwinner,sun50i-a64-r-ccu
-        - allwinner,sun50i-a100-r-ccu
-        - allwinner,sun50i-h6-r-ccu
-        - allwinner,sun50i-h616-r-ccu
+        - allwinner,sun55i-a523-r-ccu
 
 then:
   properties:
     clocks:
-      minItems: 4
-      maxItems: 4
+      minItems: 5
+      maxItems: 5
 
     clock-names:
-      minItems: 4
-      maxItems: 4
+      minItems: 5
+      maxItems: 5
 
 else:
   if:
     properties:
       compatible:
         enum:
-          - allwinner,sun20i-d1-ccu
-          - allwinner,sun50i-a100-ccu
-          - allwinner,sun50i-h6-ccu
-          - allwinner,sun50i-h616-ccu
-          - allwinner,sun55i-a523-ccu
+          - allwinner,sun8i-a83t-r-ccu
+          - allwinner,sun8i-h3-r-ccu
+          - allwinner,sun20i-d1-r-ccu
+          - allwinner,sun50i-a64-r-ccu
+          - allwinner,sun50i-a100-r-ccu
+          - allwinner,sun50i-h6-r-ccu
+          - allwinner,sun50i-h616-r-ccu
 
   then:
     properties:
       clocks:
-        minItems: 3
-        maxItems: 3
+        minItems: 4
+        maxItems: 4
 
       clock-names:
-        minItems: 3
-        maxItems: 3
+        minItems: 4
+        maxItems: 4
 
   else:
-    properties:
-      clocks:
-        minItems: 2
-        maxItems: 2
-
-      clock-names:
-        minItems: 2
-        maxItems: 2
+    if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun20i-d1-ccu
+            - allwinner,sun50i-a100-ccu
+            - allwinner,sun50i-h6-ccu
+            - allwinner,sun50i-h616-ccu
+            - allwinner,sun55i-a523-ccu
+
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+
+        clock-names:
+          minItems: 3
+          maxItems: 3
+
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          minItems: 2
+          maxItems: 2
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/sun55i-a523-r-ccu.h b/include/dt-bindings/clock/sun55i-a523-r-ccu.h
new file mode 100644
index 0000000000000..365647499b9ab
--- /dev/null
+++ b/include/dt-bindings/clock/sun55i-a523-r-ccu.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Arm Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN55I_A523_R_CCU_H_
+#define _DT_BINDINGS_CLK_SUN55I_A523_R_CCU_H_
+
+#define CLK_R_AHB		0
+#define CLK_R_APB0		1
+#define CLK_R_APB1		2
+#define CLK_R_TIMER0		3
+#define CLK_R_TIMER1		4
+#define CLK_R_TIMER2		5
+#define CLK_BUS_R_TIMER		6
+#define CLK_BUS_R_TWD		7
+#define CLK_R_PWMCTRL		8
+#define CLK_BUS_R_PWMCTRL	9
+#define CLK_R_SPI		10
+#define CLK_BUS_R_SPI		11
+#define CLK_BUS_R_SPINLOCK	12
+#define CLK_BUS_R_MSGBOX	13
+#define CLK_BUS_R_UART0		14
+#define CLK_BUS_R_UART1		15
+#define CLK_BUS_R_I2C0		16
+#define CLK_BUS_R_I2C1		17
+#define CLK_BUS_R_I2C2		18
+#define CLK_BUS_R_PPU0		19
+#define CLK_BUS_R_PPU1		20
+#define CLK_BUS_R_CPU_BIST	21
+#define CLK_R_IR_RX		22
+#define CLK_BUS_R_IR_RX		23
+#define CLK_BUS_R_DMA		24
+#define CLK_BUS_R_RTC		25
+#define CLK_BUS_R_CPUCFG	26
+
+#endif /* _DT_BINDINGS_CLK_SUN55I_A523_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun55i-a523-r-ccu.h b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
new file mode 100644
index 0000000000000..dd6fbb372e190
--- /dev/null
+++ b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Arm Ltd.
+ */
+
+#ifndef _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_
+#define _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_
+
+#define RST_BUS_R_TIMER		0
+#define RST_BUS_R_TWD		1
+#define RST_BUS_R_PWMCTRL	2
+#define RST_BUS_R_SPI		3
+#define RST_BUS_R_SPINLOCK	4
+#define RST_BUS_R_MSGBOX	5
+#define RST_BUS_R_UART0		6
+#define RST_BUS_R_UART1		7
+#define RST_BUS_R_I2C0		8
+#define RST_BUS_R_I2C1		9
+#define RST_BUS_R_I2C2		10
+#define RST_BUS_R_PPU1		11
+#define RST_BUS_R_IR_RX		12
+#define RST_BUS_R_RTC		13
+#define RST_BUS_R_CPUCFG	14
+
+#endif /* _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_ */
-- 
2.46.3



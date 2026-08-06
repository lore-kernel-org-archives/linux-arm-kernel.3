Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E39C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98v7qI7YiKy+WmaXuUDe8OgZlfONMNyblT7s24R6lRY=; b=JO3ABWaymMd86hFNMsdOLpIoN4
	HeyqfqQLhw2T7r/nqBc3GvNNCdOfWxfCwjHz6eoLB9NQ32eRHZdMAKPJi59q6ncRv39LoZSlPkUAn
	rSnWJtL256PfI9Kl8m1ZohSXqZm7t1AnQgHZTISELnNee3PgmeSLkfZjdMX5hz5yr9I/LW1s6R6N1
	6EG2DL73eGhme4+X1mbz0ifSLDat0bs6zDIU+rXtPKMSR0IaqhV2ByhhbgQn18m15/9z4neesIyjN
	XJ6ds4lew9fur/o2/STMLc7nb968kSmIBWEjaACK6bVzRi0M2OfJyrb/DZlotlWoVXYqxzq6ZDu3R
	HQZJKOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005ON2-2IT1;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUc-00000005OM1-474f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A7DB43F7C;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63AE3C2BCFA;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008866;
	bh=cYPUiIG3WZWc0vigCV8eiQKRpmmNx1zWV9ouQXuS/WA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hDenrtRNO4HIiFS1TA7HWICQN8rL+9XKi6FrcZMPjS+T+aW1SMINJNUYMWl+bLkDQ
	 nnb8/6ebOAXkMDZoFM4EGBy+l27I9OJ+3jpyEmzCBxUlb4Nrpgc2tzALtKWXK1YR7U
	 QTt/ru7NdZWm/hVv3FuAapYkQuw1UH5gvL5cFzo64ZWRGFVkCaOsNT03Hy4haKJSGL
	 RBHHW2cWSHelzEZkSYnXm5Cb4QvAB5hvtBoOdAV7dDit7kmoOsvnz8pnRJ1dp38aSO
	 SsoGYeUU3CW1dsprzk1OvcE4QIhjf2OXxykrmZ29mXF0pdzW5Ddy7wh9m/u5JnVjKx
	 6PuTr5kq4Gt1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44722C5620A;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 06 Aug 2026 17:34:11 +0800
Subject: [PATCH v2 03/10] dt-bindings: clock: add Ambarella CV75 RCT clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=2901;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=DFTGZ4uvV0RkAC0IaZusCfnS/KQPHA8JTNal3McD4Z4=;
 b=Ah0cJCSIxUfLesXH+5wJqawUNYqeT3CHVWMhVZ3L9xjHidofApA7nryJBlzdK0oeAKN8oDxl6
 4jX8eBz5WTTAlazq5AfOS+U4V6k8iQeARuAXWgCN2XNKZ8drYBFZ7qA
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add the CV75 RCT clock controller binding and clock ID header.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/clock/ambarella,cv75-rct.yaml         | 66 ++++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-clock.h   | 17 ++++++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
new file mode 100644
index 000000000000..aa96533bab9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ambarella,cv75-rct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 RCT Clock Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description: |
+  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
+  PLLs, clock muxes and dividers for on-chip peripherals.
+
+  The same register region is also exposed as a syscon for other SoC
+  blocks (e.g. pin drive-strength), hence the "syscon" compatible.
+
+  Clock indices are defined in
+  include/dt-bindings/clock/ambarella,cv75-clock.h:
+
+  - CV75_GCLK_UART0: UART0 mux/div clock
+  - CV75_GCLK_CORE: Core PLL (gclk_core)
+  - CV75_GCLK_AHB: AHB bus clock (core / 2)
+  - CV75_GCLK_APB: APB bus clock (core / 4)
+
+properties:
+  $nodename:
+    pattern: "^clock-controller@"
+
+  compatible:
+    items:
+      - const: ambarella,cv75-rct
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference crystal oscillator (typically 24 MHz)
+    maxItems: 1
+
+  clock-names:
+    const: osc
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ed080000 {
+        compatible = "ambarella,cv75-rct", "syscon";
+        reg = <0xed080000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/ambarella,cv75-clock.h b/include/dt-bindings/clock/ambarella,cv75-clock.h
new file mode 100644
index 000000000000..3d3314446e75
--- /dev/null
+++ b/include/dt-bindings/clock/ambarella,cv75-clock.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMBARELLA_CV75_CLOCK_H
+#define _DT_BINDINGS_CLOCK_AMBARELLA_CV75_CLOCK_H
+
+/* Boot / bus clocks */
+#define CV75_GCLK_UART0		0
+#define CV75_GCLK_CORE		1
+#define CV75_GCLK_AHB		2
+#define CV75_GCLK_APB		3
+
+#define CV75_CLK_NUM		4
+
+#endif

-- 
2.34.1




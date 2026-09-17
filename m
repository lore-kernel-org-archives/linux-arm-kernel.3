Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3292C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/fo/AmYqKbKhklFGHHhsYxlkRwHwFsJf/YT8JkMzRw=; b=KufNXUxI2Yu7xayEjU4vhMaGFD
	IkzqmgIXkZJFQ2nS6HjY8UImwNRuO59YFM8ytZZtfH6ho1HF0HwMtEVNll0CFCML6OHLSXtCqYHQf
	0mqPxi5a+ooT9vldMroqnv22pYR/Pxnb8RW9anxDeJMNoRD5FjIvOibF6Gt/0DH/1ZqaO/6gHycWU
	Ij2HSKllc3pGcwtBefFRwKqer4i8Z0dayQI18ztDMDFnlq5FeqGj5+zvczhG/pAUA7ctTilBEMAhC
	a+ehnL3qHreh48S2Mq2X3csVHMW1VcougO/2ZJQCkUZdgBvfVMXZUeYUs0INbhKhCcRd+qM4cm+8O
	Etqj/j2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kla-0000000CgV7-2thQ;
	Thu, 17 Sep 2026 22:39:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KlW-0000000CgSI-0Tsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:39:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF7CB1FCD;
	Thu, 17 Sep 2026 15:39:33 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 294793F86F;
	Thu, 17 Sep 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684777; bh=XhPxgdjfEdMHC4xLaVcPDWmXzJE+5sKEFFSnTlkds94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8aEccB5pv2ol4YC3waxP1igpqz5tknY473X/PnN9eP979RMm3b8+XyAoxvan1tOV
	 mZ0JYTaj+cvCtO8S9QWBMLFQaBk6pkClF7GijSHotUtQwbtUHuduQ6kOw8Rvua1mPZ
	 xm3pPZQE277pkmV7Hzhih24GjNN+ZdTG5ixTHkK8=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
Date: Fri, 18 Sep 2026 00:39:11 +0200
Message-ID: <20260917223913.1855301-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_153938_223778_2B8E97EA 
X-CRM114-Status: GOOD (  14.11  )
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

There are four clock controllers in the A523 SoC, but only three are
described in the DT binding so far.

Add a description for the CPU CCU, which provides separate clocks for
the two CPU clusters and the DSU interconnect.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
index 58be701a720ea..98d47d2aabc48 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun55i-a523-ccu
+      - allwinner,sun55i-a523-cpu-ccu
       - allwinner,sun55i-a523-mcu-ccu
       - allwinner,sun55i-a523-r-ccu
 
@@ -64,6 +65,30 @@ allOf:
             - const: iosc
             - const: losc-fanout
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-cpu-ccu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: High Frequency Oscillator (usually at 24MHz)
+            - description: Low Frequency Oscillator (usually at 32kHz)
+            - description: Internal Oscillator
+            - description: Peripherals PLL 0 (1200 MHz output)
+            - description: Peripherals PLL 0 (600 MHz output)
+
+        clock-names:
+          items:
+            - const: hosc
+            - const: losc
+            - const: iosc
+            - const: pll-periph0-2x
+            - const: pll-periph0-600m
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
new file mode 100644
index 0000000000000..042f2310f64de
--- /dev/null
+++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 Arm Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
+
+#define CLK_CPU_L		7
+#define CLK_CPU_DSU		8
+#define CLK_CPU_B		9
+
+#endif /* _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_ */
-- 
2.43.0



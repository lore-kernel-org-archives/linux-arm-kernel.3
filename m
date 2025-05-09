Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB7EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0P3Xhjo1z5/h5CawYyKXnfUd/6J/Zf3SpOYknI7iSk=; b=Q880EtK997xNS3l1lsOiz/zS90
	qNrxjwjK5VCozvOpPe0YfWerloirYx/lqA9dBPmGW+FhrAianj5GJ+d/Uk0irSrDS8mMCemddP6qI
	lvFF8pvBEN2SzfnaTbSXW3BTlNKZnS5aGa3q1eufd6eVxCSoZirvS0DQjsHNqCKQo/A4nirT4uIpq
	7oRxpe/W9MjNwforFNuLrcXKf8G4QY0UJmsxdyt6y4CqmDBpp9EFR9Z5Jh15RbJ/KeJODOHI14yr9
	GPLEQjUf2XwXi4y8uSjN1nM5UHNLDtp9FMk93SM0Qn4mZARmGSfOcw46uqbKxISeoB5xrJ1tT8i63
	BGiiJtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ8u-00000002vpy-1Nac;
	Fri, 09 May 2025 08:31:40 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDITS-00000002oM6-3KHQ;
	Fri, 09 May 2025 07:48:51 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 9 May 2025
 15:48:42 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/6] dt-bindings: clock: add Amlogic T7 PLL clock controller
Date: Fri, 9 May 2025 07:48:19 +0000
Message-ID: <20250509074825.1933254-2-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250509074825.1933254-1-jian.hu@amlogic.com>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004850_830118_B21EBAB2 
X-CRM114-Status: GOOD (  12.67  )
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

Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 114 ++++++++++++++++++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  56 +++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
new file mode 100644
index 000000000000..aea3763616a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 PLL Clock Control Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,t7-pll-gp0
+      - amlogic,t7-pll-gp1
+      - amlogic,t7-pll-hifi
+      - amlogic,t7-pll-pcie
+      - amlogic,t7-mpll
+      - amlogic,t7-pll-hdmi
+      - amlogic,t7-pll-mclk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: mclk pll input oscillator gate
+      - description: oscillator input clock source for mclk_sel_0
+      - description: fixed input clock source for mclk_sel_0
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: in0
+      - const: in1
+      - const: in2
+    minItems: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-pll-mclk
+
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,t7-pll-gp0
+              - amlogic,t7-pll-gp1
+              - amlogic,t7-pll-hifi
+              - amlogic,t7-pll-pcie
+              - amlogic,t7-mpll
+              - amlogic,t7-pll-hdmi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8080 {
+            compatible = "amlogic,t7-pll-gp0";
+            reg = <0 0x8080 0 0x20>;
+            clocks = <&scmi_clk 2>;
+            clock-names = "in0";
+            #clock-cells = <1>;
+        };
+
+        clock-controller@8300 {
+            compatible = "amlogic,t7-pll-mclk";
+            reg = <0 0x8300 0 0x18>;
+            clocks = <&scmi_clk 2>,
+                     <&xtal>,
+                     <&scmi_clk 31>;
+            clock-names = "in0", "in1", "in2";
+            #clock-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
new file mode 100644
index 000000000000..b0cb5892ac34
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __T7_PLL_CLKC_H
+#define __T7_PLL_CLKC_H
+
+/* GP0 */
+#define CLKID_GP0_PLL_DCO	0
+#define CLKID_GP0_PLL		1
+
+/* GP1 */
+#define CLKID_GP1_PLL_DCO	0
+#define CLKID_GP1_PLL		1
+
+/* HIFI */
+#define CLKID_HIFI_PLL_DCO	0
+#define CLKID_HIFI_PLL		1
+
+/* PCIE */
+#define CLKID_PCIE_PLL_DCO	0
+#define CLKID_PCIE_PLL_DCO_DIV2	1
+#define CLKID_PCIE_PLL_OD	2
+#define CLKID_PCIE_PLL		3
+
+/* MPLL */
+#define CLKID_MPLL_PREDIV	0
+#define CLKID_MPLL0_DIV		1
+#define CLKID_MPLL0		2
+#define CLKID_MPLL1_DIV		3
+#define CLKID_MPLL1		4
+#define CLKID_MPLL2_DIV		5
+#define CLKID_MPLL2		6
+#define CLKID_MPLL3_DIV		7
+#define CLKID_MPLL3		8
+
+/* HDMI */
+#define CLKID_HDMI_PLL_DCO	0
+#define CLKID_HDMI_PLL_OD	1
+#define CLKID_HDMI_PLL		2
+
+/* MCLK */
+#define CLKID_MCLK_PLL_DCO	0
+#define CLKID_MCLK_PRE		1
+#define CLKID_MCLK_PLL		2
+#define CLKID_MCLK_0_SEL	3
+#define CLKID_MCLK_0_DIV2	4
+#define CLKID_MCLK_0_PRE	5
+#define CLKID_MCLK_0		6
+#define CLKID_MCLK_1_SEL	7
+#define CLKID_MCLK_1_DIV2	8
+#define CLKID_MCLK_1_PRE	9
+#define CLKID_MCLK_1		10
+
+#endif /* __T7_PLL_CLKC_H */
-- 
2.47.1



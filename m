Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E380C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QND2PN7GauJiMGSoPO2cqo2UANUsLq4XSYhctLbUmp0=; b=SVW6YTFShocOv/1/LTiCmPgQlP
	QbZMYMIyYEl7SwOpbtsVdJim/sXLGaqfOI1ekvBlTabjealJPm3WAZqx2m1q9TsbdJBqUwzJ7gW2A
	Y2znysep8ztGMbuSxoIfkvDRCXiTUI5FI82PUeKwBN6GeXmgt5bA+7q3r5hl2ZqeaBBOKs/7mkL1Z
	dQ5cQmtat6Ep+BXivRMC1SmGhAA2AW5cBmTpCgHVHj7uxP2OVleslBfGe95PQjvAIt9efp8vqho/T
	4muyNyCJnrQt2GuNPrQP00rrpvQpu7ctz6g+pSwLXnSNdRYuM4E1fwbbCwpgdWBFRZJx26A6AOBEz
	muKtf2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1L6-000000040La-2QOW;
	Fri, 10 Jul 2026 02:51:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1L3-000000040Jc-0lyI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:51:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Jul
 2026 10:51:36 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Jul 2026 10:51:36 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 10 Jul 2026 10:51:35 +0800
Subject: [PATCH v2] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIADZeUGoC/yXMQQ6DIBCF4auYWZcGqBXtqvdoXAgMZRYVA4bYG
 O5eqsv/5eXbIWEkTPBodoiYKVGYa8hLA8ZP8xsZ2doguex4J1u2eUNM9Hfn7ICu1xbqdYnoaDu
 Y11jbU1pD/B5qFv/1BBRXJ5AFE0zXTQ/6JlWLzyktiHZF468mfGAspfwAHLZtUp0AAAA=
X-Change-ID: 20260624-xhci-185ffd9ef8bd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651895; l=3993;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=do+Sg8cAREeCQ4d4ZCPhx6v05K6G0pm+XApZl1MMIaA=;
 b=89QHRlgQ9hjs0p/czsnJcovOWdx2SKke/7VpY9lqq+YCYnsx3QvZ7QEOtIggXYVMGXqpElOvG
 mjKsZ3PWLrhDmFu/xLUlpOBU/siyU9AbzXc0mTQ1ITOndf6LmIHDykV
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_195141_229353_205F9DD8 
X-CRM114-Status: GOOD (  13.27  )
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

The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
no vendor glue logic: it is functionally compatible with snps,dwc3, uses
the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
that is handled by a separate driver.

Add a dedicated binding document rather than adding the compatible and a
conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
the generic schema.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v2:
- Constrain clocks and clock-names in the binding rather than leaving them
  to snps,dwc3.yaml.
- Link to v1: https://lore.kernel.org/r/20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com

The common DWC3 node properties are inherited from snps,dwc3.yaml via the
allOf $ref, so this schema only defines the AST2700-specific constraints:
the compatible, the clocks, a single interrupt and the USB3 PHY. reg is
required but not redefined here, as snps,dwc3.yaml already constrains it
to a single region.
---
 .../devicetree/bindings/usb/aspeed,dwc3.yaml       | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml b/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
new file mode 100644
index 000000000000..fff5a200f8c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description:
+  The common content of the node is defined in snps,dwc3.yaml.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-xhci
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: aspeed,ast2700-xhci
+      - const: snps,dwc3
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller bus early clock
+      - description: PHY reference clock
+      - description: Controller suspend clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb3-phy
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed,ast2700-scu.h>
+    #include <dt-bindings/reset/aspeed,ast2700-scu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@12030000 {
+            compatible = "aspeed,ast2700-xhci", "snps,dwc3";
+            reg = <0x0 0x12030000 0x0 0x10000>;
+            interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon0 SCU0_CLK_GATE_PORTAUSB2CLK>,
+                     <&syscon0 SCU0_CLK_U2PHY_REFCLK>,
+                     <&syscon0 SCU0_CLK_U2PHY_CLK12M>;
+            clock-names = "bus_early", "ref", "suspend";
+            resets = <&syscon0 SCU0_RESET_PORTA_XHCI>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_usb3axh_default &pinctrl_usb2axh_default>;
+            phys = <&uphy3a>;
+            phy-names = "usb3-phy";
+            dr_mode = "host";
+        };
+    };

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260624-xhci-185ffd9ef8bd

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>



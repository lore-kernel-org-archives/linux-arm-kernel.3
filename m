Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE2C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 03:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt2IIDVM6+U5cUTpdOyoV20KGSd22stNZ1+aNx10gA0=; b=nv+MZ63AsqIs/a3HaeW76s/hD8
	RqaVQqNLNiaMsUQXtYqMsGFjtl+uBx0xO4unJzeZThXS9LAiklOzmAOjgmbOEB0LcaAhVDbOa9jsl
	CP08gSqFHqj2SxfXXjTzNvh+AdfLxPwbwpvct2kBeVLtPfNCPNep506NVaOVIWd5UzDI8X/vnXjKn
	RGbAqI5EB078y4GiFQfInY5MwiAim/8qMhPOQHSwBFLd+MFHY/X5l7ghgYJ4yDkp+WvYFp8d6Gt9f
	I9XkrkIY4kaz+KjbAZJ6AvdZ/T3aO/ExZBnABV+5sBImLM2ux8I9XeYfhgWBKJmaWNZI4DKkcQEzC
	b7avrHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPvGI-0000000FFEc-0is3;
	Fri, 13 Jun 2025 03:39:26 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPv7X-0000000FEOC-0DaA;
	Fri, 13 Jun 2025 03:30:24 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:02 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Date: Fri, 13 Jun 2025 11:29:57 +0800
Message-ID: <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_203023_097165_EADFE31B 
X-CRM114-Status: GOOD (  11.60  )
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

Add device tree binding documentation for the ASPEED PCIe Root Complex
controller. This binding describes the required and optional properties
for configuring the PCIe RC node, including support for syscon phandles,
MSI, clocks, resets, and interrupt mapping. The schema enforces strict
property validation and provides a comprehensive example for reference.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/pci/aspeed-pcie.yaml  | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
new file mode 100644
index 000000000000..5b50a9e2d472
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/aspeed-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe Root Complex Controller
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description: |
+  Device tree binding for the ASPEED PCIe Root Complex controller.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie
+      - aspeed,ast2700-pcie
+
+  device_type:
+    const: pci
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    description: IntX and MSI interrupt
+
+  resets:
+    items:
+      - description: Module reset
+      - description: PCIe PERST
+
+  reset-names:
+    items:
+      - const: h2x
+      - const: perst
+
+  msi-parent: true
+
+  msi_address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: MSI address
+
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED AHBC syscon.
+
+  aspeed,pciecfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED PCIe configuration syscon.
+
+  aspeed,pciephy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to ASPEED PCIe PHY syscon.
+
+  clocks:
+    description: PCIe BUS clock
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-pcie
+    then:
+      required:
+        - aspeed,ahbc
+
+required:
+  - interrupts
+  - bus-range
+  - ranges
+  - resets
+  - reset-names
+  - msi-parent
+  - msi-controller
+  - aspeed,pciephy
+  - aspeed,pciecfg
+  - interrupt-map-mask
+  - interrupt-map
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    apb {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pcie0: pcie@1e7700C0 {
+        compatible = "aspeed,ast2600-pcie";
+        device_type = "pci";
+        reg = <0x1e7700C0 0x40>;
+        linux,pci-domain = <0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+        bus-range = <0x80 0xff>;
+
+        ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+                  0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
+
+        resets = <&syscon ASPEED_RESET_H2X>,
+                 <&syscon ASPEED_RESET_PCIE_RC_O>;
+        reset-names = "h2x", "perst";
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pcierc1_default>;
+
+        #interrupt-cells = <1>;
+        msi-parent = <&pcie0>;
+        msi-controller;
+        msi_address = <0x1e77005C>;
+
+        aspeed,ahbc = <&ahbc>;
+        aspeed,pciecfg = <&pciecfg>;
+        aspeed,pciephy = <&pcie_phy1>;
+
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                        <0 0 0 2 &pcie_intc0 1>,
+                        <0 0 0 3 &pcie_intc0 2>,
+                        <0 0 0 4 &pcie_intc0 3>;
+        pcie_intc0: interrupt-controller {
+          interrupt-controller;
+          #address-cells = <0>;
+          #interrupt-cells = <1>;
+        };
+      };
+    };
-- 
2.43.0



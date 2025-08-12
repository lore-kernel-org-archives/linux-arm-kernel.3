Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A8ECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ri6zMj/+h5ih+JWU6WL0UfhfS5rxCY0NiL6EaniZCg=; b=BcJ9lm+0TH3NCpv+o16SWO2BH2
	ocFJs74YjyeQoOiKu26StICn0tRrx6wEOUtBZ1AZ6g3f3rfmlMKqfgPNgg0HISUYHUf7ZwZcKUCUl
	0nYxusQS49aXTgoB2M5/pZEWa0U/H1BX1AeK01hjStFh2p2aPtFfpZYF7xdMqQgh4sg7WO4DpzaM5
	oqILJRgZqyMexFk18oMr27EEa648eFloq6RfyrxXAkt7AbAkTnq2pA3MaRsVwbaubE5lFQSenI6hG
	Iv+c2ln5ik1sS04m/byKV1qzd5n90DbUGHi1jBjrxuEmPMJ9wM/IeGSCnanR3GqHXjQmgfhliAcIl
	nqq4Eazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlm-0000000BNBh-3kIC;
	Tue, 12 Aug 2025 16:22:38 +0000
Received: from mail-m1973188.qiye.163.com ([220.197.31.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloAA-0000000Ah27-35rR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:31:36 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f211b6d1;
	Tue, 12 Aug 2025 20:31:30 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	adrian.hunter@intel.com,
	robin.murphy@arm.com,
	ding.wang@bst.ai,
	gordon.ge@bst.ai
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v3 4/8] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
Date: Tue, 12 Aug 2025 20:31:06 +0800
Message-ID: <20250812123110.2090460-5-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989e43a55a09cckunm52c5de62844361
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGEgeVk5OSR4ZSEIZSUpKHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ipb3Z4arhnKQUWgsF0SV/Ku9sNBABtr9l7gIr5DIQvM30KBARP5eZo9LkmQQixWbV63qMbl/KmEM6TSmxE4UcJNUUjohqnatIW3gnCFo+NzBYMYyeYZ0TcYXS5ycZ06Ng95gmad6+ZisOLyAjK0EwVwL8vAK4iDRsWyNVyt+U/I=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=0Ri6zMj/+h5ih+JWU6WL0UfhfS5rxCY0NiL6EaniZCg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053134_968084_F6A89A01 
X-CRM114-Status: GOOD (  12.84  )
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

Add device tree binding documentation for the Black Sesame Technologies
(BST) DWCMSHC SDHCI controller.

This binding describes the required and optional properties for the
bst,c1200-dwcmshc-sdhci compatible controller, including register layout,
interrupts, bus width, clock configuration, and other controller-specific
features.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v3:
- Switch reg schema from maxItems to explicit items with per-entry
descriptions
- Improve example: add irq.h include and wrap under a bus node with
address/size cells
- Drop status = "disabled" from example; keep example concise
- Add Signed-off-by: Ge Gordon

Changes for v2:
- Simplified description, removed redundant paragraphs
- Updated $schema to reference mmc-specific scheme
- Corrected compatible to add soc name
(bst,c1200-dwcmshc-sdhci)
- Removed all redundant property descriptions
- Dropped invalid mmc_crm_base/size properties, use reg for all address
ranges
- Cleaned up required properties to only essential entries
- Standardized example DTS format, fixed reg syntax and property
ordering
- Removed additionalProperties: true
---
 .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
new file mode 100644
index 000000000000..aa72ce60259f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/bst,dwcmshc-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Black Sesame Technologies DWCMSHC SDHCI Controller
+
+maintainers:
+  - Ge Gordon <gordon.ge@bst.ai>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    const: bst,c1200-dwcmshc-sdhci
+
+  reg:
+    items:
+      - description: Core SDHCI registers
+      - description: CRM registers
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: core
+
+  memory-region:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mmc@22200000 {
+            compatible = "bst,c1200-dwcmshc-sdhci";
+            reg = <0x0 0x22200000 0x0 0x1000>,
+                  <0x0 0x23006000 0x0 0x1000>;
+            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk_mmc>;
+            clock-names = "core";
+            memory-region = <&mmc0_reserved>;
+            max-frequency = <200000000>;
+            bus-width = <8>;
+            non-removable;
+            dma-coherent;
+        };
+    };
-- 
2.43.0



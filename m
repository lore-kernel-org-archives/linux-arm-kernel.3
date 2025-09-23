Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9361CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzr6ecyyae77VtZYq1ReJ86cHFdZjbBe3GMXfzbB9gc=; b=VQZlEbhNbZ27BaQtQ8Y8y9fQZe
	H9/4WowKtMCSLw1B4qCW8F3q4WU4izIlpokrAi3/opqbGzfj398xCInaie31Iln2kUjGAxoXzzWN7
	28w+PS7gtW8G+lg9ZHbo1iUG7KoGGxX/A44jjHWczSDZVXDqfecPu7PFs7cEIPXjPNAM0yeO2OFKW
	pT+b1ukJGq6ciW0Ty+E9Mz3zy0g0Rf2fsS/6B5+NQ+YP1iIu+mLm69PaLWMNDnP1NVmGrEDqihpRd
	8+EvlPKhcuERbS+Wo1s/PNB8hsUZV8DsX9Z87sVyuJRpWMuhBI0Ew46NSO/XeoP3lQMjmDPHCJtx/
	JOXaEMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEp-0000000CWmQ-2ptH;
	Tue, 23 Sep 2025 06:10:55 +0000
Received: from mail-m32123.qiye.163.com ([220.197.32.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEZ-0000000CWeJ-0wXg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:42 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdebfe3;
	Tue, 23 Sep 2025 14:10:33 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:10 +0800
Subject: [PATCH 4/9] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=3433;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=D/w1Y1iVuxoaJKfCtX6pNsQnKymjUqB4eNMUUWKvWCY=;
 b=9y70kes2Rz0dOny17wbciJHU43o4HZRoaSvtxFBCTfTF8Op4ezQn9gcxOb/9g/ZNiWUhalM15
 /1e4NP9405iBEucV5VDbo/AwX6oWNbK08gxPo3Jc9fit8GlVXsHzjIK
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a997531f9c209cckunmfc27e25b4e0298
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkIYVh1PShpNSk0dSBoZHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=mDWxXO5fUcYrzXAEpL6WHUPc1f8Y4Pa3BHfM/c7I4NxLWGD3shbVqN5OsblcVlLmcrFGBjHYKXHzgAAdhTnI8Ekci5CYMf+9zNK0eRVIkGLUHVYTxipu1cbbZ4j+RtywhMO0mpMzoKzjULkNTWR7wW+ZA5wN/rjhl99EQmwNRUI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=kzr6ecyyae77VtZYq1ReJ86cHFdZjbBe3GMXfzbB9gc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231041_644222_0BAAD107 
X-CRM114-Status: GOOD (  13.46  )
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

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v4:
- Remove Signed-off-by line for Ge Gordon
- Change `$ref: mmc-controller.yaml#` to `$ref: sdhci-common.yaml#`
- Change compatible string from `bst,c1200-dwcmshc-sdhci` to `bst,c1200-sdhci`

Changes for v3:
- Switch reg schema from maxItems to explicit items with per-entry descriptions
- Improve example: add irq.h include and wrap under a bus node with address/size cells
- Drop status = "disabled" from example; keep example concise
- Add Signed-off-by: Ge Gordon

Changes for v2:
- Simplify description, remove redundant paragraphs
- Update $schema to reference mmc-specific scheme
- Correct compatible to add soc name (bst,c1200-dwcmshc-sdhci)
- Remove all redundant property descriptions
- Drop invalid mmc_crm_base/size properties, use reg for all address ranges
- Clean up required properties to only essential entries
- Standardize example DTS format, fix reg syntax and property ordering
- Remove additionalProperties: true
---
 .../devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7f16e6db39690cb7621d167bf7bc492f814ea693
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
+  - $ref: sdhci-common.yaml#
+
+properties:
+  compatible:
+    const: bst,c1200-sdhci
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



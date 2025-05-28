Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FF5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vb4BX0UJyLUvKF4fET6nq/FFfA6w/RMSx8v+7CHMEsA=; b=NWajbPtHecbWrAo/+GJRbummlZ
	np/r/3qzIuHNmSaqtSKaXBAev6ElzJuPFcVj2s36cKwIn/OAvYAfeDDZ1KT3bPqBYyp1it3xyq/jj
	D8G9zzqE8kSGD5ev7tYXFAXoIi6UNvscj79rsPHrP/s52fCIAUirlosTE3/yfZGUgaL5OjJuY7l33
	kUbzfZTd/snA9ewASF2vLCjql5zeymSHrGMkPCo4VnX11CDSwP8I1QPSAlBqGLKF5inZ0HQjO5ILl
	ImrCsF+R1cmKRBt0hUveJQT1bGwp8pqa8k6uQCgcei5hxTB/4sxhTr+yZrT+IiPGKicqk0S6gRgOX
	BrsJ5Bow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCyS-0000000Ci1v-0IQb;
	Wed, 28 May 2025 09:21:24 +0000
Received: from mail-m21471.qiye.163.com ([117.135.214.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYr-0000000Cddg-036o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:54:58 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a60d;
	Wed, 28 May 2025 16:54:52 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 4/9] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
Date: Wed, 28 May 2025 16:54:51 +0800
Message-Id: <20250528085451.481267-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTB0ZVksdSUNITR1DTxgeGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a016709cckunm4606c7f3397dab
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxw6LCo6PjE#PkgKLg5COTIR
	LEkKCUJVSlVKTE9DT0lJT0JITUJKVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQU9MSUk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=bAE0mei3mJMwcZJl4gdhGUEj8pKxMfbikNhy9hrQxxV+RXQM3X6pjhUaT4rl1GO7WzNyaAXsEWIteJjFR37b6ZNSu+XH1aiXTsJlNfuGgHMrtkSALTXadz7fKJfSCk1BtkKd8LiveB4cailNM1bioJtJRmLqqgez7ULqVmeKLqg=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Vb4BX0UJyLUvKF4fET6nq/FFfA6w/RMSx8v+7CHMEsA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015457_319502_9CAE53F6 
X-CRM114-Status: GOOD (  14.06  )
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
bst,dwcmshc-sdhci compatible controller, including register layout,
interrupts, bus width, clock configuration, and other controller-specific
features.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
new file mode 100644
index 000000000000..429e7f50cdec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
@@ -0,0 +1,115 @@
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
+description: |
+  The BST DWCMSHC SDHCI controller is a Synopsys DesignWare Mobile Storage Host
+  Controller IP integrated in BST SoCs.
+
+  This documents the differences between the core properties in mmc.yaml and the
+  properties used by the sdhci-bst driver.
+
+properties:
+  compatible:
+    const: bst,dwcmshc-sdhci
+
+  reg-names:
+    const: base
+    description: Specify the register name
+
+  reg:
+    maxItems: 1
+    description: Host controller base address
+
+  interrupts:
+    maxItems: 1
+    description: One MMC interrupt should be described here
+
+  interrupt-names:
+    items:
+      - const: IRQDWMMC0
+
+  non-removable:
+    type: boolean
+    description: Non-removable slot (like eMMC)
+
+  bus-width:
+    description: Number of data lines
+    enum: [1, 4, 8]
+
+  clock-frequency:
+    description: Base clock frequency in Hz
+
+  max-frequency:
+    description: Maximum clock frequency in Hz
+
+  fifo-depth:
+    description: |
+      FIFO depth in bytes. If this property is not specified, the default value
+      of the fifo size is determined from the controller registers.
+
+  mmc_crm_base:
+    description: Base address of MMC CRM registers
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mmc_crm_size:
+    description: Size of MMC CRM registers
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  memory-region:
+    maxItems: 1
+    description: Specify the MMC DMA buffer range
+
+  sdhci,auto-cmd12:
+    type: boolean
+    description: Enable auto CMD12 support
+
+  dma-coherent:
+    type: boolean
+    description: Enable coherent DMA operations
+
+required:
+  - compatible
+  - reg-names
+  - reg
+  - interrupts
+  - interrupt-names
+  - non-removable
+  - bus-width
+  - clock-frequency
+  - max-frequency
+  - fifo-depth
+  - mmc_crm_base
+  - mmc_crm_size
+
+examples:
+  - |
+    dwmmc0@22200000 {
+        status = "okay";
+        compatible = "bst,dwcmshc-sdhci";
+        reg-names = "base";
+        reg = <0x0 0x22200000 0x0 0x1000>;
+        interrupts = <0x0 0x90 0x4>;
+        interrupt-names = "IRQDWMMC0";
+        #address-cells = <0x2>;
+        #size-cells = <0x0>;
+        clock-frequency = <200000000>;
+        max-frequency = <200000000>;
+        mmc_crm_base = <0x23006000>;
+        mmc_crm_size = <0x1000>;
+        fifo-depth = <0x400>;
+        bus-width = <8>;
+        non-removable;
+        sdhci,auto-cmd12;
+        dma-coherent;
+        memory-region = <&mmc_dma_buf>;
+    };
+
+additionalProperties: true
\ No newline at end of file
-- 
2.25.1



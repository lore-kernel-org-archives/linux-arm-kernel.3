Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213B0C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfcFw4Er+lRQGjZg8dmF9mso3a6O4zW0NF5yIyCmuEU=; b=mOqldc78FHltZD8ddSFjkxI+UJ
	ITU2+wLFMa8J87oxVS0YeldLSiRG79ro69F6v1JhWx4EJK0XccNSX5usvlc0+NkNfZSYUS3s+7T0Q
	PVFeMfPTddsZnINtes+9XE+y+0QG6BgjdyW8z/NwNv3bLaEG6WkQC8qOA4WvP5ENKmwN8q+EiNmHE
	EkYvO6ecvnznFkpNUsPe7hsvOZ2B8xfRvE9akVCl+gd/myeTzZIyyctYIlOAT/UNrdQH/k8jFWsIg
	KUasfCrO54hBAjwGdlBTQ+iIwBGifgkHOg79hwpHc8VIW4cWh4Y432pSzRgi3iwO8RDVwkUESgmDX
	Q/IQcWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuy6-00000007zVL-017q;
	Wed, 02 Jul 2025 10:45:34 +0000
Received: from mail-m49222.qiye.163.com ([45.254.49.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu7w-00000007qjx-3zZf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:51:42 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1aaa9ed49;
	Wed, 2 Jul 2025 17:46:35 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	catalin.marinas@arm.com,
	geert.uytterhoeven@gmail.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	bst-upstream@bstai.top,
	neil.armstrong@linaro.org,
	jonathan.cameron@huawei.com,
	bigfoot@classfun.cn,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	geert+renesas@glider.be,
	andersson@kernel.org,
	nm@ti.com,
	nfraprado@collabora.com,
	quic_tdas@quicinc.com,
	ebiggers@google.com,
	victor.shih@genesyslogic.com.tw,
	shanchun1218@gmail.com,
	ben.chuang@genesyslogic.com.tw,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v2 4/8] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
Date: Wed,  2 Jul 2025 17:44:40 +0800
Message-Id: <20250702094444.3523973-5-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702094444.3523973-1-yangzh0906@thundersoft.com>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhhKVkgdS08YGExNTk5IQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97ca87ec9609cckunmee1cabff3ebb45
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6Ejo6LDE3Ck8iHSE0HQIC
	NQwKCzNVSlVKTE5KT09CTkJMSk5CVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQU9ITkw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=joicoOyLfPcI5Htb1jQL3vfoaIeY1lc6q9SmjGU0vYGNsKgX5FlzEe//fUMFt+F2Dt5msY0bIJHRnbNv2d+Ki7OV8xn3wNKMXXvBaG4Q66kys7HQLCJrgjS6tDstwINmLA7RWk/T5myjQBO8memOyK9cx2gDTqhwHD5Wld7+YVM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=TfcFw4Er+lRQGjZg8dmF9mso3a6O4zW0NF5yIyCmuEU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_025141_208584_23562253 
X-CRM114-Status: GOOD (  13.33  )
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

---
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

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
new file mode 100644
index 000000000000..699dc404caac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
@@ -0,0 +1,67 @@
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
+    maxItems: 2
+    description: |
+      Register base addresses and sizes for the SDHCI controller.
+      First entry is the core SDHCI registers, second entry is the
+      CRM registers.
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
+
+    mmc@22200000 {
+        compatible = "bst,c1200-dwcmshc-sdhci";
+        reg = <0x0 0x22200000 0x0 0x1000>,
+              <0x0 0x23006000 0x0 0x1000>;
+        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_mmc>;
+        clock-names = "core";
+        memory-region = <&mmc0_reserved>;
+        max-frequency = <200000000>;
+        bus-width = <8>;
+        non-removable;
+        dma-coherent;
+        status = "disabled";
+    };
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7735105F78B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3am9h0UreIAmfBcg5OY6/nPf9X32cvawrvLxpyxPi3Y=; b=iff5jwwzdUngP+rDysnPhPHqf9
	q+Ug8goCnzhEnXJpHEEtg3ZjMfv/JYLMv0mvrdJsevoX2PUka7i5g2B0/nBo+CVVC9k3a0e4vhdEy
	eZajzyzGB3UKp+OU+5ozXRlGep1CBQ4FcglMbGDvZi19JxTwlAMmFbsHtjZ97TOiS8yDD8yhnl3U+
	1MSCHi13eK38Vg3KGe1+qNoReqHspcByvwY+xHJnGn2093RNkWr8Gi7WFRRVlhl3pL7LMuXZhN4D7
	LjrkS7NMvYBfWksI/ic7Fjnvzxk6esFPjvxz06DkpFI+M/Bl4dGl86BXPlkguc9TxD1QemARgjIkS
	w0Y0W2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRP-0000000HTeQ-3wCI;
	Fri, 13 Mar 2026 10:08:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRJ-0000000HTbv-2ZZX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:18 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:07:36 +0800
Subject: [PATCH 1/7] dt-bindings: soc: aspeed: Add AST2600 eSPI controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-upstream_espi-v1-1-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
In-Reply-To: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <maciej.lawniczak@intel.com>, aspeedyh
	<yh_chung@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=2633;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=cX0+TYSUBKoylJRqFstuVfh4bOO8RZJolgiew1xGVtM=;
 b=PUEJ+M2Nits91wx+TswvF6gJSlfKAGjDKkzDIcVwArjw8jrWaV+Qx8qHXzgwlBTNIAeAVoX78
 8knw1gDRx/oA4BXT+fpRLDOVbo/5ZHo24B5cj88KAVBN4vOp/TH3apZ
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030817_655992_E3C9A846 
X-CRM114-Status: GOOD (  10.50  )
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

Introduce the device-tree bindings for the Enhanced Serial
Peripheral Interface (eSPI) controller found on AST2600
BMC SoCs.

The controller operates as the BMC-side eSPI slave and provides the
peripheral, virtual wire, out-of-band, and flash channels used for
host-BMC communication.

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
 .../bindings/soc/aspeed/aspeed,ast2600-espi.yaml   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,ast2600-espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,ast2600-espi.yaml
new file mode 100644
index 000000000000..e22a10111138
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,ast2600-espi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,ast2600-espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 eSPI Controller
+
+maintainers:
+  - Yun-Hsuan Chung <yh_chung@aspeedtech.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description: |
+  The ASPEED AST2600 BMC SoC provides an Enhanced Serial Peripheral
+  Interface (eSPI) controller used for host-BMC communication.
+
+  The controller supports the eSPI channels used for peripheral,
+  virtual wire, out-of-band, and flash communication.
+
+properties:
+  compatible:
+    const: aspeed,ast2600-espi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt from the GIC for the eSPI controller.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  pinctrl-names:
+    const: default
+
+  pinctrl-0:
+    maxItems: 1
+
+  aspeed,flash-dma-mode:
+    type: boolean
+    description:
+      Enable DMA support for eSPI flash channel
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - pinctrl-names
+  - pinctrl-0
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/aspeed-clock.h>
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi";
+        reg = <0x1e6ee000 0x1000>;
+        interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+        resets = <&syscon 57>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_espi_default>;
+        aspeed,flash-dma-mode;
+    };

-- 
2.34.1



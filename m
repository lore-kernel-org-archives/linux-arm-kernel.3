Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55193E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kaF5tNMBN6R7KAucRu1XrV4n/h7v2QSAKRQ5x5/dKRs=; b=cBYKcpSYaHn0y/EdqU812I4ZhS
	4HdfhDM5+xkc0Msgf0riTRHBHA/PelDmAZ459NuJpysiMnL3WNnyGaijVD2uNEWNEuOef7vtpJhQG
	EiWNTgThB/smSUaoRjQ8vlHFcgeG9BXpxsbYH06495FqYKkCFNJsO8+yNFou9RsSvNQ0hewWVik02
	akp3De1fdDIr+pJT577bEZbpwekj1daO+mMRzLJefCX4GHQTORl0GPa18UI8FJ7wGuKsXWVzSISuR
	XRa4t7nUDA5f6egY58Q0Fi2QVz7FTI4By4oktYprQp/M3HNcAXXzXDTzJglXUftm4DR29KcHDtalu
	FWcEVA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVTC-00000006Q2l-49Cm;
	Mon, 09 Dec 2024 04:34:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVS9-00000006Pvw-30xz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733718781; x=1765254781;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=LY3RsQ2MtH1nNBWndK3puTnO5aAq4/wJBReWAMNoQbQ=;
  b=xY6o+J39apQ8OYT2eNLwDvCc4NkyRdPkac9/yTtJViJni63mQgRVRsd/
   TN2tV7ZNa4pGj27Qrmjk95+BvH24zJtba2BqEY9Ou+rZRt/yGXCXzPa3N
   Z+Ajz8HPfXde920TqTiSjv2iIs/PJDFkTMc39SPH5VjmbniujlgsTmNhZ
   dc9aZaf0njkjAZZriBLJpSC/tfS8aZe3yal5SZxQXr2MBbmVPj+3oH5Ic
   vMXdS9vfC6SvWhvZmZ0RpNqe00BL/uD/Qa5BLbYfuHqsbW2528iQ7SkJD
   6/qNrUQsvLcrlcWdSUiik9uxTLAE+6MfK0z78lcCRmNUWGuUGMCwVoFvZ
   g==;
X-CSE-ConnectionGUID: 72IB33lgRjS11USK+WrWBA==
X-CSE-MsgGUID: mBb2+HZpQcCgbtECVkhTjQ==
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="266487019"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2024 21:32:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 8 Dec 2024 21:32:38 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 8 Dec 2024 21:32:34 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 9 Dec 2024 10:02:30 +0530
Subject: [PATCH v2] dt-bindings: mmc: atmel,hsmci: Convert to json schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-hsmci-v2-1-b5a6d7c59b67@microchip.com>
X-B4-Tracking: v=1; b=H4sIAN1yVmcC/13MQQ7CIBCF4as0sxZTRpHoynuYLsgwlVlQGjBE0
 3B3sUuX/8vLt0HhLFzgNmyQuUqRtPTAwwAU3PJkJb434IhnjaNRoUQSZR2d2F21sdZC/66ZZ3n
 vzmPqHaS8Uv7sbNW/9V+oWmllHBq+IPqZ/T0K5URB1iOlCFNr7QvoOxkSngAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aubin Constans <aubin.constans@microchip.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733718754; l=5160;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=LY3RsQ2MtH1nNBWndK3puTnO5aAq4/wJBReWAMNoQbQ=;
 b=wul3xm8moixq7EJMj3Cr78cgKF6RGexFxWRTaDK16ghCA6IYsyHDynh8McreBentzrQrXVIWF
 0NkUoX9qcPMAHu4NGQFOig6bdl/dT9XYfkkcU8p9opbEZr+d/vdPwbw
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_203301_781078_DA8865BE 
X-CRM114-Status: GOOD (  16.18  )
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

Convert atmel,hsmci documentation to yaml format. The new file will inherit
from mmc-controller.yaml.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v2:
- Drop the duplicate properties in the slot node.
- Link to v1: https://lore.kernel.org/r/20241205-hsmci-v1-1-5a25e622dfed@microchip.com
---
 .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 110 +++++++++++++++++++++
 .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
 2 files changed, 110 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
new file mode 100644
index 000000000000..26686ada6288
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel High-Speed MultiMedia Card Interface (HSMCI)
+
+description:
+  The Atmel HSMCI controller provides an interface for MMC, SD, and SDIO memory
+  cards.
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Aubin Constans <aubin.constans@microchip.com>
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: atmel,hsmci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mci_clk
+
+  "#address-cells":
+    const: 1
+    description: Used for slot IDs.
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^slot@[0-9]+$":
+    type: object
+    description: A slot node representing an MMC, SD, or SDIO slot.
+
+    allOf:
+      - $ref: mmc-controller.yaml
+
+    properties:
+      reg:
+        description: Slot ID.
+        minimum: 0
+
+    required:
+      - reg
+      - bus-width
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+
+anyOf:
+  - required:
+      - slot@0
+  - required:
+      - slot@1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    mmc@f0008000 {
+      compatible = "atmel,hsmci";
+      reg = <0xf0008000 0x600>;
+      interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&mci0_clk>;
+      clock-names = "mci_clk";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      slot@0 {
+        reg = <0>;
+        bus-width = <4>;
+        cd-gpios = <&pioD 15 0>;
+        cd-inverted;
+      };
+
+      slot@1 {
+        reg = <1>;
+        bus-width = <4>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
deleted file mode 100644
index 07ad02075a93..000000000000
--- a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Atmel High Speed MultiMedia Card Interface
-
-This controller on atmel products provides an interface for MMC, SD and SDIO
-types of memory cards.
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the atmel-mci driver.
-
-1) MCI node
-
-Required properties:
-- compatible: should be "atmel,hsmci"
-- #address-cells: should be one. The cell is the slot id.
-- #size-cells: should be zero.
-- at least one slot node
-- clock-names: tuple listing input clock names.
-	Required elements: "mci_clk"
-- clocks: phandles to input clocks.
-
-The node contains child nodes for each slot that the platform uses
-
-Example MCI node:
-
-mmc0: mmc@f0008000 {
-	compatible = "atmel,hsmci";
-	reg = <0xf0008000 0x600>;
-	interrupts = <12 4>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	clock-names = "mci_clk";
-	clocks = <&mci0_clk>;
-
-	[ child node definitions...]
-};
-
-2) slot nodes
-
-Required properties:
-- reg: should contain the slot id.
-- bus-width: number of data lines connected to the controller
-
-Optional properties:
-- cd-gpios: specify GPIOs for card detection
-- cd-inverted: invert the value of external card detect gpio line
-- wp-gpios: specify GPIOs for write protection
-
-Example slot node:
-
-slot@0 {
-	reg = <0>;
-	bus-width = <4>;
-	cd-gpios = <&pioD 15 0>
-	cd-inverted;
-};
-
-Example full MCI node:
-mmc0: mmc@f0008000 {
-	compatible = "atmel,hsmci";
-	reg = <0xf0008000 0x600>;
-	interrupts = <12 4>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	slot@0 {
-		reg = <0>;
-		bus-width = <4>;
-		cd-gpios = <&pioD 15 0>
-		cd-inverted;
-	};
-	slot@1 {
-		reg = <1>;
-		bus-width = <4>;
-	};
-};

---
base-commit: feffde684ac29a3b7aec82d2df850fbdbdee55e4
change-id: 20241205-hsmci-7ac3ea915777

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>



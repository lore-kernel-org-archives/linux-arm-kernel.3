Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256BBCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUoufof+xiSghyfwImQeSvSHtrRwrNiMMyeUkOy2c2Y=; b=lD4NKqIdpQd3EWCmOWc3Nq/Ay/
	EoX5IsMPgsygaxAM0nogOPsczdwnLk7gjHNVlAmiQ2MGvR01098+3aka0+JoDAm7530DiHz3DRZk1
	1ZbwadvcH4M2LRdowlPwaXzuoKekfAKIScKn+3ObFCWKCzVj7VWkn6jUEH5mugIglCYUXDk1gle3f
	u4IQrErujNwwgRC2qt0wnlCcrulsa9F6RaOWEXS5M5MEeUj56EHrVHDmcoF4/0xGh0KOAp8Ys0KR6
	KkoAs1rhoA8diK49GjiiPBPX3IeVmK6TxRFdhNZLRY+btKbBJ2T+Wh7ezhEHzsTFyi587fNERrliZ
	F/pbV2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIg1T-00000006dl4-0KhV;
	Mon, 19 Oct 2026 05:34:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIg18-00000006daS-3gud;
	Mon, 19 Oct 2026 05:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 151EE444E9;
	Mon, 19 Oct 2026 05:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C911EC2BCF7;
	Mon, 19 Oct 2026 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792388077;
	bh=ub4tN8CDOzTWXwitiSfIoHILwvi6zI1K3GTKHFvE3pQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cQXYs9G3ki/E9FmiSaegeX83zjsCon32/m+v1xxRFPDJnCyNmpaywuqjgTGf2c6vZ
	 bVYoaaFEtD9HypgetEwIi8izQwEgDG2aAsvJk0EWNjwf982YsYWpBWjE6LrwaIIgMb
	 IDqM3aVmR7GXr0r39jRa/6HTteMsn0iQCAPbGUFAj86HBQWMZGNzdONqGL27UZZ5TW
	 5n49sP7SGFk6A7daoVZjT6iRHqkdYaZNQEZGrhT1fw5MVkAvpVScC2Yba1xXBgBxzA
	 YUqA5Dcbk5sCN7Vl1ePg8kqxlkqPdV2T1CFbxxN6IAuN2ry5+SIL+sQIyro/0HTMCZ
	 TPgS6VZyAv4OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC67CCF2DE;
	Mon, 19 Oct 2026 05:34:37 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Date: Mon, 19 Oct 2026 13:34:27 +0800
Subject: [PATCH 2/3] dt-bindings: i3c: Add Amlogic A9 I3C controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-a9_i3c-v1-2-329d819d621f@amlogic.com>
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
In-Reply-To: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792388075; l=2990;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=TBTUobdGBphIyuXd0LiPQLPuirtquJsAagN7tB4GVFk=;
 b=FQzwECiEVC4Sh2/3SId2SPXHjsgKXTeAMF04+38WwljJbpDkzhX1U7JvEvgVR9VWQQ333MhDA
 6vKe+i6wcuRBUtietraOkYp97rgRhfCQbs2bCrVJD775Mf4MMGddFOp
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
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
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Junyi Zhao <junyi.zhao@amlogic.com>

Add a devicetree binding schema for the A9 I3C controller.

The binding describes the controller instance and its bus-specific
properties required for driver probing.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
 .../devicetree/bindings/i3c/amlogic,i3c-a9.yaml    | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/amlogic,i3c-a9.yaml b/Documentation/devicetree/bindings/i3c/amlogic,i3c-a9.yaml
new file mode 100644
index 000000000..8e25122c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/amlogic,i3c-a9.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/amlogic,i3c-a9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 I3C master controller
+
+maintainers:
+  - Junyi Zhao <junyi.zhao@amlogic.com>
+
+description:
+  The Amlogic A9 SoC family embeds an I3C master controller based on the
+  Silvaco I3C Dual-Role Master IP, with Amlogic specific glue logic.
+
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,i3c-a9
+      - amlogic,i3c-ao-a9
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
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
+if:
+  properties:
+    compatible:
+      const: amlogic,i3c-a9
+then:
+  properties:
+    clocks:
+      items:
+        - description: APB peripheral clock
+        - description: I3C fast clock
+    clock-names:
+      items:
+        - const: pclk
+        - const: fast_clk
+else:
+  properties:
+    clocks:
+      maxItems: 1
+    clock-names:
+      items:
+        - const: fast_clk
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c@3a7000 {
+        compatible = "amlogic,i3c-a9";
+        reg = <0x3a7000 0x10000>;
+        interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        clocks = <&clkc 15>,
+                 <&clkc 16>;
+        clock-names = "pclk", "fast_clk";
+        status = "disabled";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c@22000 {
+        compatible = "amlogic,i3c-ao-a9";
+        reg = <0x22000 0x10000>;
+        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+        clocks = <&clkc 17>;
+        clock-names = "fast_clk";
+        status = "disabled";
+    };
+...

-- 
2.42.0




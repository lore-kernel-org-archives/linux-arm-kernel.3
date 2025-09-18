Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588E9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jb1pRnQYPxbV6CCIi5ryq04r8KcK0UIvbIOR3Rk09w=; b=hPYKH29135fxJ03rJtJfG6mXas
	1fdv7GB7j9UVixrWdXZuVWPpw6yE6WhUkDuNPLHATslMOK9ZMhVI5u88crMC5tQoabKCE+ikDG2Wc
	/MvJZGsbf2LpSPos3WcWwuQgnTogNxL2ioHGyUB7uOim/pmzImYCoVxx/Vkoor58LaUp2q3kxZjZ7
	Hr8xiKn85+fE/PQXHB1SM9p9wHk0rfs0PFyObDZU93G5VpVkHQEnRAQTmRBH+VE3Wwz5orVrhNdVn
	xLn5YS5MYrzcBDWl4hNGrilXG/M0LQeVQHmBCHj4FPO9CdNUFXDeSCsPRUg8okBBoG0Mt4xk/ozok
	KBEhj72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJho-00000000ulT-1xlz;
	Thu, 18 Sep 2025 18:50:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhf-00000000uf6-1d6F;
	Thu, 18 Sep 2025 18:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DF486026C;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17B7DC4AF13;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221398;
	bh=KkndGZ2cFeTM19fVBhPaNoLbiQh6UVaVfyXkJUdBXsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q+G1lq5eX76T2uqv5/HptLwuHYisvdH2xVJ/ZCMJJY6xr2aJTQXo9pEOxrZnnjCIS
	 4Jcyw/H5/f1UeJ0rIJ+Isukjgkqa6HA7uhIjZIn3KtTAJk8CS/F4A32JKiKo2NEBSj
	 NjEjRSWTo/j1UwN6t5HQhkjaXOwZtYrFJrO186EFXZ8UeYsCKYC52J9VGlbkrnLrM9
	 R1myopw6va0UYQlS1Aiiun+qE8l3JmQ3vz41yX+kjaWgjBbtd+/4ZCXsMNCfBYdtCh
	 nG5Y1pYE8wXAmoaASW2Xp+nMDEYtmrAMLaXpt9fjKXmapvLMRRqfWQhXKAMTWv9FHN
	 T7PiVg/UCQfWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F57CCAC59A;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Fri, 19 Sep 2025 01:48:44 +0700
Subject: [PATCH 04/10] dt-bindings: mmc: Add RDA SDMMC controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rda8810pl-mmc-v1-4-d4f08a05ba4d@mainlining.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758221395; l=2667;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=AsSx2jfyiIl9tD1PzUkU8B/80/dNLISAbs6T475/JWo=;
 b=m1jZ5iiJdDLR2oNGhbZc1KvGaZ/RhK/lM0bAsauM7cx684WiuGLwZlK4HFh7moDg6YJ4FQU+R
 ttMceldPwaYBD+EGfHCFOX0uBSgU42qv2H8yNPUABQPx0Skg+RH4jnz
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Add documentation describing the SD/MMC controller in RDA Micro
RDA8810PL SoC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/mmc/rda,mmc.yaml | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/rda,mmc.yaml b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f3cda38abd66023ca9bc94d1c29df5ae9e211e7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/rda,mmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Micro SD/MMC Controller
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rda,8810pl-mmc
+      - const: rda,mmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  rda,mclk-adj:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Some board need MCLK output to be delayed for the card to work.
+      If not present, MCLK output is not delayed.
+    minimum: 0
+    maximum: 255
+
+  rda,mclk-inv:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Some board need MCLK to be inverted for the card to work.
+      If not present, MCLK is not inverted.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - vmmc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/rda,8810pl-apclk.h>
+    #include <dt-bindings/dma/rda-ifc.h>
+    mmc@20950000 {
+      compatible = "rda,8810pl-mmc", "rda,mmc";
+      reg = <0x20950000 0x1000>;
+      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ap_syscon CLK_APB2>;
+      clock-names = "mclk";
+      resets = <&ap_syscon RST_APB2_SDMMC1>;
+      dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
+      dma-names = "tx", "rx";
+      vmmc-supply = <&vdd_sdmmc>;
+      rda,mclk-adj = /bits/ 8 <1>;
+      rda,mclk-inv;
+    };
+
+...

-- 
2.51.0




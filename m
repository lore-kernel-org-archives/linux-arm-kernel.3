Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C3CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k3O+JkpnPob3q37P/OzDl70xaW01JrVQW7Z43ta6+Q=; b=3+dedpNmm+6PRkdz7AwOEojFzX
	8joiwA3nBtbULWEz3HfRW0wIvMR0L/+M56enU+VdielRK/bF1YjpZteEgYdW2BLNysxonKqTPxRJh
	FqFp27yuzfcsG7kknzxtuK4ThcIQtuqM8LTihyyOiNMuSPnhTaW9m+BjbT1sE/j4UmPih0+r2ZEic
	ffSrqyWdPh9ZvhCo0BCVePFPBGLjMT8Ro+67LtvXmliBVAhq8tdnW9bJ1oWdwCx287PoZoE9cgNRe
	thYh3TWo0O5/w2KJeU4qMA8vYKmLX4z3DM0mVHJHbo8IGZ/BKex3kKriLZvSCvbBaXnkUx7V4iAaz
	Lobau4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFX-000000091UD-2UZq;
	Tue, 16 Sep 2025 20:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEz-000000090nZ-2d59;
	Tue, 16 Sep 2025 20:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74D6544DD8;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46689C4AF16;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=0qQ2udejKRpnAkPOswtIFiUwzLjnAo9WAbKFCWb8urc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nqg+epgsHlJCi+v9o8ZDI7/WOr2tRhadQ1OmeKJ+oOqpGrEIAzHHvj4abZaUsZKbA
	 yZvrtnwcN73RtvXF+U8Cu/qiaytS0G9WytGPaEvGGL1Ued4PZPR/Pn+gFR/lRkLad/
	 Ea232PZn3+Az7M9qxo25p8q4nRhRDrnDosHb28e5B8PmTWQqN1sZ0JSKz1Gb+Svf1+
	 6Hn5/n6WquGODZXGOQx3ae2G/doiiGBS1RC1XdrMDM6oNPHGl/W0QbKdRK02j6WtfL
	 ddwDL2RAmIc10ywIeYSXEbgR+ARBHdKRF870hz9J1E7KNVSysJ1T3tq6m8AEBvbtOf
	 wpTIUU+rp3vnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325ABCAC5A3;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:18 +0700
Subject: [PATCH 21/25] dt-bindings: mmc: Add RDA SDMMC controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-21-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=2660;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=a7tWvRJrTe69IGooiZ71r/xi++8VSr6BRQfhXkmhSjs=;
 b=k9ixwP93FswHA/DrqLQ0P+MKSIOY+R6N2rR/lW85K10mMwhxbS5PTIcRSPQbX5tIUM/Jvx8fC
 bD1/vTTKisDBkP3s5XNIBTbp0zTXkiqVGSf6Gx20RppETLe39/re5tT
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132529_818420_2C4116F6 
X-CRM114-Status: GOOD (  12.29  )
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
 Documentation/devicetree/bindings/mmc/rda,mmc.yaml | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/rda,mmc.yaml b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dfdd9c6d3044061c342519e35e39c7751874bb03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
@@ -0,0 +1,91 @@
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
+    const: rda,8810pl-mmc
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
+    const: apb
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 2
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
+      Some board need MCLK to be adjusted for the card to work.
+      If not present, MCLK will be handled by an external PCLK.
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
+    mmc1: mmc@20950000 {
+      compatible = "rda,8810pl-mmc";
+      reg = <0x20950000 0x1000>;
+      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ap_syscon CLK_APB2>;
+      clock-names = "apb";
+      resets = <&ap_syscon RST_APB2_SDMMC1>;
+      dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
+      dma-names = "tx", "rx";
+      vmmc-supply = <&vdd_sdmmc>;
+      rda,mclk-adj = /bits/ 8 <1>;
+      rda,mclk-inv;
+      status = "disabled";
+    };
+
+...

-- 
2.51.0




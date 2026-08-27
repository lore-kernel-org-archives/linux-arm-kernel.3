Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE08C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3TMbZ8cEVPxUBqVTxCZEWCnEpCI4XyDGDZ0sdi5n8s=; b=3FoxdmOcs+ft9978hVrvPyZPFz
	gk7XySh0ziA7rPhUGFGc2VkMLAfTLcSDxVNgp3666eM3tyuPC2a7gtVepy72rAu45lRIBfsdRbopP
	3u5do3q5cJojqT2AFrrNfCjp3vdnAxFhzKxQSgQs+QqCYj9NR41N90EL5pXR8Zso8cgS9qXTsiTYt
	9+LT5jy9HmLgpT/ubF2jFQnVwvKe4SwIA3rt/mMJU+c/s+ObTI4iSy/D8lL/tFVVVno862Ro2RT7D
	6KWyF8ZkmboqBIAx1+nHAqxM0LQJFqfhGU3NkAFSJkzJfCzRAhAf5++BbOmE4emGLe91ML69oCXC7
	8jxfJIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXfd-00000003qdw-0y3W;
	Thu, 27 Aug 2026 10:49:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXfU-00000003qVt-2HN3;
	Thu, 27 Aug 2026 10:49:13 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:306c:5b5b:3c7f:eabd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3E05C1;
	Thu, 27 Aug 2026 12:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787827664;
	bh=yMUcHa3/s68pnJKlAYgv+xVwb+t/cMWwna4xXfRlR4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAfoQRzLDZv+zWtxes8F+HfqHFr/8SCuwivvbI8nMoACOHQyxi1DpCIJ52wwuOcsY
	 XjS36gR+iyL/7PUrK8svo0+WifH4ea67mze9v18xceIkFex6p68OPS373rGWe75gyC
	 9EieVrMUI2TskzKPonasa2Ueos4r1efsHxDTTMAk=
From: Paul Elder <paul.elder@ideasonboard.com>
Date: Thu, 27 Aug 2026 19:48:33 +0900
Subject: [PATCH v3 4/5] dt-bindings: media: Add rockchip rkisp2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
In-Reply-To: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com, 
 stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, 
 xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_034912_771204_FA69168E 
X-CRM114-Status: GOOD (  13.14  )
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

Add documentation for the Rockchip rkisp2 bindings. This is meant to
support multiple versions of Rockchip ISPs going forward, including the
2.x series and 3.x series. The current version only adds the compatible
for the RK3588, which is a 3.0.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- reorder patches

No change in v2
---
 .../devicetree/bindings/media/rockchip-isp2.yaml   | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b85c28e4d7aa8ceb5db55b49b4de10ef8ed704ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-isp2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC Image Signal Processing unit v2
+
+maintainers:
+  - Paul Elder <paul.elder@ideasonboard.com>
+
+description: |
+  Rockchip ISP2 is the Camera interface for the Rockchip series of SoCs which
+  contains image processing, scaling, and compression functions.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-isp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: isp_irq
+      - const: mi_irq
+
+  clocks:
+    minItems: 3
+    items:
+      - description: ISP AXI clock (aclk)
+      - description: ISP AHB clock (hclk)
+      - description: ISP core clock (isp)
+      # for rk3588
+      - description: ISP core clock (marvin)
+      - description: ISP core clock (vicap)
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: aclk
+      - const: hclk
+      - const: clk_core
+      # for rk3588
+      - const: clk_core_marvin
+      - const: clk_core_vicap
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: ISP power domain
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for VICAP in inline mode
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-isp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+
+    parent0: parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp0: isp@fdcb0000 {
+            compatible = "rockchip,rk3588-isp";
+            reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "isp_irq", "mi_irq";
+            clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+                     <&cru CLK_ISP0_CORE_VICAP>;
+            clock-names = "aclk", "hclk", "clk_core",
+                        "clk_core_marvin", "clk_core_vicap";
+            power-domains = <&power RK3588_PD_VI>;
+            iommus = <&isp0_mmu>;
+        };
+    };

-- 
2.47.2



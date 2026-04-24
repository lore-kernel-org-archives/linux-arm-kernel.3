Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8D5FED3F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laP+gPfvBlWlsPLNYSWFj0wJqjaXNbpNdOKgSDyC/+Y=; b=NLO7/eC8ZEMbPw/PSjWctcYAxd
	3XACjT5Q/5oWt4N/wgtCi1I+5Yg8IBeKL6VJwC2Q+7UjqvQEWQ8Zg96P6Qy59z5a8RL0+P3/omAMK
	DJwYtNAsImpoU1OFd88uEfyN94NvV/2Mmgo0fqZn2OyCHVZbuxL7BJGeMJeAA1P8czrjggrjNcvno
	ONnAzp+ldWtyjCuEWfSuDtT+DmXTI/4LAuGlKlkinQ31cX8sFKPuGQ8UuxgWGbMnTo6mSfNDzKWtb
	dthWzZtyCiMV31GUbyVCg+iQuQmPafNj2sLPhM7GXhw5hK00xNH7TSI7nzw7R/4g/BuVsGdQga/oN
	UcUfT2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKoI-0000000DcAO-20Qk;
	Fri, 24 Apr 2026 17:59:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKoE-0000000Dc96-3rbX;
	Fri, 24 Apr 2026 17:59:24 +0000
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9577D1E3E;
	Fri, 24 Apr 2026 19:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053460;
	bh=PWyHHqPGJo0i+5WLQBkcXXN9K4zpJRtULYXRlbKnC7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ij7jB+JhpDntyOa9QMqRkzTN/QMUZ0uzIO+QvOxDAxJ0mc7b3vleLYXpFZbJcI3vI
	 BlQDNJfeMsSH0PW2UMZ4X0y2khGQdCHLhmnCNkRt4cXVHntZzG/t8W/XDSlc2GsCfH
	 NRYz61iSqXNOUkg3r1+14DzVw3PeZrKo9LL96RMs=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
Date: Sat, 25 Apr 2026 02:58:46 +0900
Message-ID: <20260424175853.638202-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260424175853.638202-1-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_105923_186648_DE9A7EC5 
X-CRM114-Status: GOOD (  13.21  )
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
 .../bindings/media/rockchip-isp2.yaml         | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
new file mode 100644
index 000000000000..f4ef089adf6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
+    minItems: 3
+    maxItems: 3
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
+    minItems: 1
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
+                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
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



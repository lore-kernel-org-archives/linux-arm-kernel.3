Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81979CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weRUGf2i/cx//TxNbecoQj/vSazzlYsyA8IbJzyWfYA=; b=T/L55eZKM4x2VCDQvDG6VM53LG
	mMMfRQ0d6yryN8osdILzHeoF/FA+Kp9PEen9QQZ5HQW4aLxCQytOQXlSMeGiJOusBU+XxymX6NAd4
	bbEFsd6ISSbVzAi+QAfwBwBDiGCbtycUm1MGzut1IlZnBGVZzoOARCgTrrkazPedcLVz8r0dY3n8p
	kEuLpW4V/dQNuQzA0mF/E1E7CRYincN//D5K1Oku1sYxxRjgb38BWDl+1ivYKgbroq0iM0ndsBjVK
	O3WGX8X/4lKhTa5akoajlkWQ5BjtN+a2oQV63HbC5GP9uN17+Z+2pCCUP2egkAEpA5kxpsDEgP+z1
	QKY94glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2S-00000007RNE-45lT;
	Tue, 11 Nov 2025 16:16:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2R-00000007RLs-1Ucs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:16:12 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D76491E53;
	Tue, 11 Nov 2025 17:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762877650;
	bh=jAJ2eu48I5oAuQiJD9svJrov/FQNTulmO0GAoCJbmq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jkAgw7Fdgsj3ZUhFjeMlytHsJRMGIOGjgSdXZ2vNYuAjHvtjnRbLSbgNOGc9GjmD4
	 UGlAUM2nh4tr0+dJJ8QP8gkRgdHjyrTIyeYm5R59sZx1JZ0kHmZqflaahZMxrsFOHA
	 qXh7awwufa9YtifP6GfQ+/1SXIAxrep8xWrUIO7Q=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 11 Nov 2025 16:15:47 +0000
Subject: [PATCH v13 03/15] dt-bindings: media: Add bindings for ARM
 mali-c55
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-c55-v13-3-3dc581355e3a@ideasonboard.com>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
In-Reply-To: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4229;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=jAJ2eu48I5oAuQiJD9svJrov/FQNTulmO0GAoCJbmq0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpE2FCMXKZZLHT+1MZP6qkzXHbUG1hyWVVx96ZJ
 eQRA1GH9iuJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaRNhQgAKCRDISVd6bEV1
 MtqiEACx9FJ5S/jXroMQsTHPrhnmLYa93trCwZ8CxEjF8MEX+kRTGg4prTPqOOogv+Y0UBnBhOM
 LY8gXshlejDD7FQwycHYpipFp8I/UXWVtmGzfVUUnMJUmj+jhIGLNXUl0GiABEFB8Pmn9NtogSo
 qo7R8qNW+WGN+Y655T9buYiDEN7ww3iAgh5StTMPCNfl7xu2xxuz98R+Za/ALFlexYxoQWMcJEf
 BalzAsM41XfgKxcG2T32ZDl9qhp7/l4sjyuocznoGFNtHxUsbl3/awgJa9nDY2VM9QplIEI9JdY
 XTYORRb8MiEAC68qh3bcs4s+Ea6DhDrlK78DWoHbtEz9yLuqpnvEv/5vW5YZkwOt5XyFSwWsYv3
 T0wUf8fbw2lHGCLpnUNUZ0YWUTBIQmcxgMvKynZwHnyf1Z8CEZJJymkerua985Sv5gKYdeh/s22
 B43HvnEQbyA4ShrsASVy7AtGjOK0hcPzHwDeB+9qeY3pOz8OHJvGCfPwEs5fzVrEmDAj8SqqZLW
 1rdCxAXjN70WlrNR+a5z87PBzecJF63TQvczbCQGG5sOIBLcPw+O6ixjRu5sbpYACEtB07SRWU6
 sniPCbSJQbLjkiD6OLwJfL+jKn34ltr41fH+U6g7DLFnlhVTJC+526RVslwn785oE7mj3b8TlBn
 0lHMsEGv8AXxH7g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_081611_540884_40BC60C9 
X-CRM114-Status: GOOD (  15.86  )
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

Add the yaml binding for ARM's Mali-C55 Image Signal Processor.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v13:

	- Added resets and reset-names to required properties
	- More realistic interrupts property in the binding example
	- Dropped the mali_c55 label from the node in the example

Changes in v12:

	- _Actually_ dropped the arm,inline property mode, having forgotten to
	  do so in v11.

Changes in v11:

	- Dropped in arm,inline_mode property. This is now identical to the
	  reviewed version 8, so I have kept the tags on there.

Changes in v10:

	- None

Changes in v9:

	- Added the arm,inline_mode property to differentiate between inline and
	  memory input configurations

Changes in v8:

	- Added the video clock back in. Now that we have actual hardware it's
	  clear that it's necessary.
	- Added reset lines
	- Dropped R-bs

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- None

Changes in v4:

	- Switched to port instead of ports

Changes in v3:

	- Dropped the video clock as suggested by Laurent. I didn't retain it
	for the purposes of the refcount since this driver will call .s_stream()
	for the sensor driver which will refcount the clock anyway.
	- Clarified that the port is a parallel input port rather (Sakari)

Changes in v2:

	- Added clocks information
	- Fixed the warnings raised by Rob
---
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fc4fcd19922aad510ac40a02a53c3c098af9f6a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C55 Image Signal Processor
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+properties:
+  compatible:
+    const: arm,mali-c55
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ISP Video Clock
+      - description: ISP AXI clock
+      - description: ISP AHB-lite clock
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: aclk
+      - const: hclk
+
+  resets:
+    items:
+      - description: vclk domain reset
+      - description: aclk domain reset
+      - description: hclk domain reset
+
+  reset-names:
+    items:
+      - const: vresetn
+      - const: aresetn
+      - const: hresetn
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Input parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+      clock-names = "vclk", "aclk", "hclk";
+      resets = <&resets 0>, <&resets 1>, <&resets 2>;
+      reset-names = "vresetn", "aresetn", "hresetn";
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+      port {
+        isp_in: endpoint {
+            remote-endpoint = <&csi2_rx_out>;
+        };
+      };
+    };
+...

-- 
2.43.0



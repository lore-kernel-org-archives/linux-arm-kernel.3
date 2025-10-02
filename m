Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7245ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YginrIfpkhObvHhxsPUQUih11UwHwFKS9YybQnjO4bQ=; b=T4BqnBlrDUIgyZXtqkzoBrOuM7
	bZp9nEuA8WrTwxZFVIMrvxEO3vZOM1u6z1d3ElXvkwGKC8G0aoHQinZLMDcUBUK4ptkVuVyHzXuY0
	RQSYN2+7q/z1VuL/Pl1gppQwOYuTgbDN5YVNMKdcS3hXqqPJQ5Lvlv2PPeQrTZ2S40T9P8npVJ5qn
	wKQctsi+Ihc+NFDvw4b3COc+XMy7Mdow5fy3JS/GzqR3gEvbyq7lfghVbeMdmjOOnwTyq0x1jmy5H
	5RLEGJcjkxz5CpshwXf1SgUD0dH00udkuswmkDcUG3V3SrHUyYP0Vs6wp1JrJdExPzaPGrBuGacMQ
	baYCIRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOc-0000000AEaq-1lRl;
	Thu, 02 Oct 2025 10:18:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOX-0000000AEWD-0za1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:18:43 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 909111E58;
	Thu,  2 Oct 2025 12:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400229;
	bh=huI9NGMHhjilU8hzFl4BxgCz0EZYiafuaLX6yqNZWx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XEveLhWg//wcUg25qy4JPFIagl0e5RCPtOLdGuDsnavIBL09UEMh/2S8Se7/Krtkn
	 4ZpgHoBKsHUdAOfbjbtjIQxYYCC4b2+BzZgKiscnQvERFo0i07myvrbZPdJ7LDGD+P
	 hFM20Mvb34zO+J1/89s+Qb8Cs/IxQeHIxDZGQCvA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:22 +0100
Subject: [PATCH v12 03/15] dt-bindings: media: Add bindings for ARM
 mali-c55
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3847;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=huI9NGMHhjilU8hzFl4BxgCz0EZYiafuaLX6yqNZWx0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF4btZ8hcIpmMuY2MhjTFGGTxykjy6KfHoHE
 skrTpw1CByJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5ReAAKCRDISVd6bEV1
 MomzD/4uS20rB9hXrQKhBthc3UX3e7dfOmv+xd0mwXtCVoGtk3178t9i2YI2z+1tUZOh+6b7hnx
 WlYlLdfZPo4yx4AsTuZx9u39uqFQ4XgvoF3st8h63O39ihSIYLAd4/LRy+TZoxDkul1yPrDIWIl
 wZhSc6QQatQnTTn/LPdioyUQWzzWvseI+ONYE8H+qNF0XwLkdnVsxmO4lprUADAq9SFBLTjHPaD
 ESepo+wnOrbP/CCXcewLLzU+HHXTxKcmBPZwjimfWTuSwUCPnfYNSqaGz0Dowcy2kv0edSU/iBx
 DvPxldLtL/JHYTjsPcrrzjd6tBMsh2h8YEA9OqkiYroFTvm6b9EIAetYpttXxkFWm0+QAEiBtby
 62xcX3RCWl9sCOH8zSYNKn1kPGd9/FNQMSYLkFrUjyqz2NgyAp/HX+uy4hBbve84ND2YaI9hVZL
 I5af5qO0tGnq9M9/jI16xpRFS5nM0tgMMApVbdxgqbvwman2c9+48dimcj4Cbobrb6D1WL0nCnv
 yQun41vZQC675sMHw59npxDqxEX+b9NxkvBqt1DNQ7CCPZlXud0+kIN4AFh8miGS6VJ9LuuSkVS
 GrqJ/VUeGs+pg1dAv5W1fTHuyD4D0CfiVfJPfs0KzIuax14BCEkjNzVtqIRAyzwHGyI5yHgy3Di
 SseuOYrp9UlSH6Q==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031841_451362_73D68048 
X-CRM114-Status: GOOD (  14.73  )
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
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
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efc88fd2c447e98dd82a1fc1bae234147eb967a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,82 @@
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
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c55: isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+      clock-names = "vclk", "aclk", "hclk";
+      resets = <&resets 0>, <&resets 1>, <&resets 2>;
+      reset-names = "vresetn", "aresetn", "hresetn";
+      interrupts = <0>;
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



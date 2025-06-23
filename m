Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643D1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwBecsBOmSGFA7pjl9BOc8j0DYs8Wz1q3M+NxfVNGzo=; b=gf/hpBGWzbBn5OCdNjwpmNMzvb
	OS17b7lpn5DHh4uVoNN2evggPH6K6d3mg+tco/19ojDgqZliq/VkGC/PTiwBzX/J654Duzcr5OLjN
	mTBx0eQ0sb7kuoL1hEvz1rkc2geB3QiZRCUQuGYSAmZzeOA6BaAkwgWHQFafhjDWBygFVHZTI9dNA
	aqk0D8DXSm+y81lk14MLU2yuFwBFTtGpCB3K7pcXtGyCi7+7QaPKPpBPYC8M3vcqe1Xo9r7ci+8Vb
	ZSPLg4cPrbmaxpgaNmLlA54EcZL/o6tN9FwpHtaDVUEplJFfq0QCFf8tXVeb61Dh1fCzfsb5AGmcC
	irdJO0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThas-00000002w2q-3JGm;
	Mon, 23 Jun 2025 13:52:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqu-00000002ahO-3ca0;
	Mon, 23 Jun 2025 12:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680043;
	bh=2i9D/Zo0bHCIzZwFD7oHDpeE4683Ra7aYgCvchcNmYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VuJYd0GUJ9t58nxH7UOPVMBpXr/qFGoqikuKtWiTa+MMmn6HOJMvr7W7J+ZbqeVtv
	 GZFm09BhnQnmSAnuDi9cF04YhMeENegB5j0likr0F67ctOPm/XsQ5IpM8LWKOHt/pq
	 dTI7s6Tozlp8ldhSAEFpu84at9FU56wnAc/f9FITtt4RaA5TBz77YlS9xts3qBDRqX
	 nnwV3Jb7H4zafw/HbJGqMU9jfs27k7pj3GGp/DRHzRkLA3UaJaly26LoyOPkHJN3XJ
	 Hc918klkBYx6BJ9Ma424yZRdCU59Dlrvg3F0Hp0VtOoLAbuxvtEqgXL1bw3j7TCg0d
	 m21tIXKPNO9uw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DED9617E0EC0;
	Mon, 23 Jun 2025 14:00:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
Date: Mon, 23 Jun 2025 14:00:37 +0200
Message-ID: <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050045_043179_EACE7826 
X-CRM114-Status: GOOD (  13.32  )
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

Add a binding for the MediaTek MT6363/6373 (and similar) multi
function PMICs connected over SPMI.

These PMICs are found on board designs using newer MediaTek SoCs,
such as the Dimensity 9400 Smartphone chip, or the Chromebook
MT8196 chip.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
new file mode 100644
index 000000000000..2ce57e659d12
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6363 series SPMI PMICs multi-function device
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  Some MediaTek Power Management ICs (PMICs) found in board designs with
+  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
+  the chip via the System Power Management Interface (SPMI) bus.
+
+  These PMICs are multi-function devices with various sub modules.
+  For example, those may include one, or more of the following:
+  - Auxiliary ADC Controller
+  - Clock Controller
+  - eFuses
+  - GPIO Controller
+  - Interrupt Controller
+  - Keys
+  - LEDs Controller
+  - Regulators
+  - RTC
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6363
+          - mediatek,mt6373
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 0
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+    unevaluatedProperties: false
+
+  regulators:
+    type: object
+    oneOf:
+      - $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
+      - $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#
+    additionalProperties: true
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@4 {
+        compatible = "mediatek,mt6363";
+        reg = <0x4 SPMI_USID>;
+        interrupts = <4 64 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #address-cells = <0>;
+        #interrupt-cells = <3>;
+
+        regulators {
+            compatible = "mediatek,mt6363-regulator";
+        };
+      };
+    };
-- 
2.49.0



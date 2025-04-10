Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A960C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDJ8tvozqzSJqZbem7hhgW62fw+HeqUgDvuXcqvBKT4=; b=kKdTG6nPotCNv3/gjHjyrjZLs3
	2dFsmHASMHiJO6prVacLRyyT9oofHioTufNEm45WPnsNynEfmxi+bhI9/4KMwcHzFb022P55DH9Vo
	tPWVQqaz8RODZB5v23EAWJtvmbFy0y4vZ4iTyetPX83ECCRpFYKV1MdciBiv4Zzcyc2jtgyVO0vdy
	MEWbZXBIvgF1qvBwUK6jVsLXxgIjpoDPpg6KvlLGHaalv4I4Z0S6iRN4iV20SHPNaYLAkqDr8fxs0
	utwV/I9s+pz42rS9t2wYrwDLD6shF85LYBfK89RCfY3SxBgtX5S469ScY2PRjwHguo7oc8Is5l4Ur
	NaS+KmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tai-0000000AyTp-1NhK;
	Thu, 10 Apr 2025 15:13:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t5K-0000000AsZ2-08iB;
	Thu, 10 Apr 2025 14:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296052;
	bh=oB91cXMm1Tzc2hrifejWNjhZiJO4j88K+VH6BqBA11s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7O0GMrQ8lM0yky0xkknlf/3jPUnTkN7VPHoiAPRKRYN1r73hxRXED4Y+yM6d8zEQ
	 3GIRf5gjFrMtwe0EydvqboJtUvuQxSm1fjIRz7OOBjHt0LRLwhE4byZdommL57ei7q
	 TZ7fB2PW3+O7vnsmCQTFC9/FELxSxYSvJjiTBwp/0J+6L3HOtWWNHAZ2HGBejeg6Kj
	 k1HD4+sBSa9KNDJ8P+/flAAegNOZ/723LK37jAiyibZy4yqEdS7iq42D3+z5uUheuI
	 6RQwyfEpNh47tHv5NnBJqs0Xx6Mc6xLa/1ZdR4CyGusAlXvmLN3LSd7+uvkWTeGlqZ
	 SshxyuD/WD57A==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29F2B17E1072;
	Thu, 10 Apr 2025 16:40:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: mediatek: Add support for MT6893
Date: Thu, 10 Apr 2025 16:40:42 +0200
Message-ID: <20250410144044.476060-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074054_221293_73D51435 
X-CRM114-Status: GOOD (  14.87  )
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

Add bindings for the pin controller found in the MediaTek
Dimensity 1200 (MT6983) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6893-pinctrl.yaml      | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
new file mode 100644
index 000000000000..fa189fe00624
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6893-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6893 Pin Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek's MT6893 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6893-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: rm group IO
+      - description: bm group IO
+      - description: lm group IO
+      - description: lb group IO
+      - description: rt group IO
+      - description: lt group IO
+      - description: tm group IO
+      - description: External Interrupt (EINT) controller base
+
+  reg-names:
+    items:
+      - const: base
+      - const: rm
+      - const: bm
+      - const: lm
+      - const: lb
+      - const: rt
+      - const: lt
+      - const: tm
+      - const: eint
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+  interrupts:
+    description: The interrupt outputs to sysirq
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [75000, 5000]
+                description: Pull down RSEL type resistance values (in ohms)
+            description:
+              For normal pull down type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull down type a resistance value (in ohms) can be added.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [10000, 5000, 4000, 3000]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
+    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6893-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x0200>,
+              <0x11d10000 0x0200>,
+              <0x11e20000 0x0200>,
+              <0x11e70000 0x0200>,
+              <0x11ea0000 0x0200>,
+              <0x11f20000 0x0200>,
+              <0x11f30000 0x0200>,
+              <0x1100b000 0x1000>;
+        reg-names = "base", "rm", "bm", "lm", "lb", "rt",
+                    "lt", "tm", "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 220>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up = <4000>;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
+                         <PINMUX_GPIO100__FUNC_SDA0>;
+                bias-pull-down = <75000>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };
-- 
2.49.0



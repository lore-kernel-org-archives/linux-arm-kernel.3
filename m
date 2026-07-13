Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AF0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chu1bysWCBjaCyygae1pMHR3JU0M95s/7QC8bH3uMGI=; b=IVu32zhIJgZRLbpMtyBPICIcqb
	Xy+1FKzhNZGoOqJ0weyRp9y8BZIoOlVuj+d9TvO+MNwUEWGM8pw26BUy+vZFxJumSSv0a2i/OysRJ
	/VHrJzyjbhXFGhR0CoR98hTrpNx0/qrXR2WQTxvmmGLKHI8RjJm6WCPwr3Kmpxm3KuulKEgHKMoCE
	zmHSqeEWtbdoWmCIzUdr7FcGup+7R6unLUbWozAmU0fKJAcAyLr69HUoquXtEN+YBNEnovDCAW21m
	SekCit1EFvlCB8pkyM8LpU41Ehg3gVaVEG33i4rrlNzBuLb/rQOUEcsqt3k/fP3Razw8O2opHq5PG
	tBOnaugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIGE-00000009jr4-0T1x;
	Mon, 13 Jul 2026 15:07:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIGA-00000009jpM-1To8;
	Mon, 13 Jul 2026 15:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB889601D9;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C65C2BCB9;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783955273;
	bh=pWuRmK/lvCohXgAZnOXGTEEgVS8UJF27uDGMTJ9a2Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GABsGShKY9RyB+crazCaCxFiTyJyvOLdU7zOdxwilN+9SkJEgrEOmxCIO+VoQiL/o
	 mHWOzsdTy6CTdGwAETi3WaMA0mSIidRRj/KC27wsuQo52hxd294S0jZDr7m506XGzs
	 f5/HR8AuIpCDahQ3psd6JhRaNNHZtnLKOHadAj4M9tzYdAolNrzsdW5cqsM0y2Xhvc
	 49BKpWzExT+WwLUVh2SZ0nLeZB6jza3Y2famF52WUHYMkmvaBGMMLv3kHw6GVrN1Ns
	 MK+tb6nHwydY1emRh2SB6PDD+BBuxo2yasmuFu+bOCeD56HeyNFJ2miauJQQXbe32w
	 81qqEaX7NB7wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05AC44501;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Mon, 13 Jul 2026 18:06:21 +0300
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-mt6858-pinctrl-v2-1-1bd072e3206c@jolla.com>
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783955270; l=6302;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=TxSc8fJL7HQZpyDdZ/01rMbgxyEamqNF+r+0Zh0YQ4s=;
 b=Zzq7ZEcY/26R8jSsDZTbjJKeEeDgJLQJSj6ogHIxBeLq25+vbLGu9tcfZEQe1Q+ge6FjZfujh
 zmmV/SpCGJ2B90dThTIZ0bLAs6ajtBlz+0lsBseVINPBeyqdjHNHycP
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolai Burov <nikolai.burov@jolla.com>

Add new DT bindings for the pin controller found in the MT6858
(MediaTek Dimensity 7100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
new file mode 100644
index 000000000000..9b834e87afde
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6858-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6858 Pin Controller
+
+maintainers:
+  - Nikolai Burov <nikolai.burov@jolla.com>
+
+description:
+  The MediaTek's MT6858 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6858-pinctrl
+
+  reg:
+    items:
+      - description: gpio base
+      - description: lm group IO
+      - description: rb group IO
+      - description: bm2 group IO
+      - description: bm group IO
+      - description: bm1 group IO
+      - description: lt group IO
+      - description: lt1 group IO
+      - description: rt group IO
+      - description: rt1 group IO
+      - description: eint south group IO
+      - description: eint west group IO
+      - description: eint east group IO
+      - description: eint center group IO
+
+  reg-names:
+    items:
+      - const: base
+      - const: lm
+      - const: rb
+      - const: bm2
+      - const: bm
+      - const: bm1
+      - const: lt
+      - const: lt1
+      - const: rt
+      - const: rt1
+      - const: eint0
+      - const: eint1
+      - const: eint2
+      - const: eint3
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
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
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
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
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h
+              for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
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
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #define PINMUX_GPIO149__FUNC_SCL5 (MTK_PIN_NO(149) | 1)
+    #define PINMUX_GPIO150__FUNC_SDA5 (MTK_PIN_NO(150) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6858-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11b20000 0x1000>,
+              <0x11c10000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e30000 0x1000>,
+              <0x11ed0000 0x1000>,
+              <0x11ee0000 0x1000>,
+              <0x11b00000 0x1000>,
+              <0x11e60000 0x1000>,
+              <0x11e80000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1",
+                    "rt", "rt1", "eint0", "eint1", "eint2", "eint3";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 197>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        i2c5-pins {
+            pins {
+                pinmux = <PINMUX_GPIO149__FUNC_SCL5>,
+                         <PINMUX_GPIO150__FUNC_SDA5>;
+                bias-disable;
+            };
+        };
+    };

-- 
2.54.0




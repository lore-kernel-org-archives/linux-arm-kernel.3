Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE437CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObrmtIP9vHxqt0LaPksCVLeekhNp83FlaPCvzDPS4t4=; b=z6uUSQg0Oo0DyNNndMJtGMo4vu
	xVZlSvjCBTBrERFG/ckFPOFxV4pYqkkN7X2oPhXGqxBuprBHrNZL3ta1WSTEtw9aAYhCbMgN63wc2
	kBttjRH5UQGZAyqFFL7x1igOl4by5vTrkq3wjnygMkmgYhsodkAwieMcE3QBYX2NmgOWMSJe7QZOW
	Yh2XAPZcAK3IswTge2xtcfWegBgJRSZyRYrcoG3LqNEp3+If9jpqKNkG3oGdF4ekmh7OYZCtTE8k+
	N4EJ4Qhga0nqIh/7DdgXxPaP5cbYMrYDccO9zPI/pJc3bvNDFcafjL3nVZfHex6eq/+K58ogFLHEZ
	JZSk45gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo8E-00000001ae5-3n9a;
	Sun, 14 Sep 2025 14:55:10 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo8B-00000001acW-3xpz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:55:09 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=MgP7kGtrISMFbZAsWjTSeRT1vwOgBIEf6ktAskJ5OxeDath7FJc0N+BwVJ1Bwjv0o9WUymdT6KOVPo5qzFqZBd0OqxCd69AiTXmXaxrl/zqW2gKe7JpoAEMxL/aVNM6lpAk0LyhhL/mre5JxQ3qYv4dYo6nVCjy5fMiJPDGBdV22MUJ8kUJB0C7DTPKIgDXG3BLCkL46/O1QwkoDUEtttIU6VRMrQdq0MVtkXQUcR5dlpLhIbk1hyYcN/900z1DMvrKz3eZ2AWtXmANfTe8OjZGET2FlkxibwLjN6dJTes8o7ml5HdpGCsy8HoLVa7r9jEY6VK8iIsWFrEOWph0c2Q==; s=purelymail3; d=purelymail.com; v=1; bh=WI48CM360KIfbNhUXM00goCNm6mNavrLlc7SiCAABo4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1880024390;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 14:54:31 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 14 Sep 2025 16:51:59 +0200
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: mediatek: Document MT6878 pin
 controller bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-mt6878-pinctrl-support-v2-1-254731aa3fc2@mentallysanemainliners.org>
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757861668; l=7144;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=WI48CM360KIfbNhUXM00goCNm6mNavrLlc7SiCAABo4=;
 b=2LeIywSTwed3WLzS+Hvz2SFZluEpuShOwZvfeFiyVLcoyTvy77Ss5gVO9GFgRFO0s3t8n2gyD
 JgdsRjAP30ZD/3Kby6a0VsmgEVSLtyyxcuIUIy+n5ilIcPkBaPo3v8v
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_075508_056083_4269D5CF 
X-CRM114-Status: GOOD (  14.67  )
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

Add device-tree bindings for the pin controller and the EINT controller
found in the MediaTek MT6878 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 210 +++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f320d286ad2155bc4aa449c195ddff3a8686204c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6878 Pin Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
+
+description:
+  The MediaTek MT6878 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6878-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: bl1 group IO
+      - description: br1 group IO
+      - description: lm group IO
+      - description: lt group IO
+      - description: rm group IO
+      - description: rt group IO
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller W block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: bl
+      - const: bm
+      - const: br
+      - const: bl1
+      - const: br1
+      - const: lm
+      - const: lt
+      - const: rm
+      - const: rt
+      - const: eint-e
+      - const: eint-s
+      - const: eint-w
+      - const: eint-c
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
+        compatible = "mediatek,mt6878-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e30000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11ec0000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11e60000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "bl", "bm", "br", "bl1", "br1",
+                    "lm", "lt", "rm", "rt", "eint-e", "eint-s",
+                    "eint-w", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 220>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
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
2.51.0



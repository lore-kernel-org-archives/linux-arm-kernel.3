Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2Taj42nDdvvX3gp0DWDvHZtRkwBup4EDwqKHkMzvOw=; b=ndX5LB7qKWkmPGe6XTUjCIL+fQ
	P+O76iC1G1kL3STjMsf1Jdck3QLCjZ0BPb7QiN1XeptDxew6nU0SL8MyUYw9fuBvlIOo5hu37j5HZ
	zZ+E3H1X5f08vtQOWMboThytr9FItaUxCNW4inXIPXnLccLPcxGKEurkehYevT4JlWe8TbejOXvSB
	g+ZBjlydZzopFnUiAUWwLugO4ooi1jpK4EX/H3wPi15Q/8eSo8hTUeg2sJ5Xajx0iLkitjXy3avnk
	zNm4v+F7VhEIJQhN4BaUUfmwDPH+E5Kg2C5fcU9sn57sjF2QWrJ7AEr19aD5LaR+rOmqiXNqlNEPB
	rJWg0Hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB2w-0000000EByn-3i3p;
	Fri, 25 Sep 2026 18:53:22 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB2u-0000000EBxi-1cue;
	Fri, 25 Sep 2026 18:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362396; x=1790621596;
	bh=G2Taj42nDdvvX3gp0DWDvHZtRkwBup4EDwqKHkMzvOw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=M9mlzOAlY+dWLJEdBAHGaoIFGAkJ7XBlD/wFkDw3I1hbdho8CjwrqSlhiEuStaM4V
	 c3tw8AUIdv22Cz6r+7dnQBaPALVrMd8Hicg9VM6fh0FrFc9oPBJTR6hNarCR2V+dSk
	 MhW5xq+kLWYxcgmcTB3XfodenKZ8OMFrHWjXTNeSXb9WtMbPZ+nEKM/mSXXk7wGf9J
	 yk7qMNg0Y+z/M8myDXgp/5Xt21po/aa39AxP+dHvv7QMDzlyGH+pRfxNim0bq+rNzr
	 g/KkKZRZR72A2xBqB+iWKMBSc+IjVJ/PHxWq1yR7PL/Eem/OXemCRTa6jr2ESzrPUe
	 43DEAwg+KJPoA==
Date: Fri, 25 Sep 2026 18:53:10 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
Message-ID: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: d0377850c742b5021f63e0b6a857a8bdb774d4b2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_115320_585281_ADAAACA4 
X-CRM114-Status: GOOD (  14.13  )
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

Combine MT6795 pin controller document into MT6779 one. In the
process, amend the example with comments and additional pinctrl
nodes from the MT6795 example, replace the current interrupts
property description with the one from the MT6795 document since
it makes more sense and define its items using conditionals
as they now vary between variants. Also use conditionals to define
valid values for the drive-strength property as well as items of
the interrupts property for each variant since they are different
on MT6795.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  72 ++++++-
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  | 236 -----------------=
----
 2 files changed, 70 insertions(+), 238 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 4dc9504e24ad5..4df6971030416 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -8,6 +8,7 @@ title: MediaTek MT6779 Pin Controller
=20
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
=20
 description:
@@ -18,6 +19,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-pinctrl
+      - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
=20
   reg:
@@ -81,6 +83,45 @@ allOf:
             - const: iocfg_lt
             - const: iocfg_tl
             - const: eint
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6795-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: base
+            - const: eint
+
+        interrupts:
+          minItems: 1
+          items:
+            - description: EINT interrupt
+            - description: EINT event_b interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
   - if:
       properties:
         compatible:
@@ -99,6 +140,15 @@ allOf:
             - const: iocfgb
             - const: iocfgr
             - const: iocfgt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
   - if:
       properties:
         reg-names:
@@ -170,10 +220,14 @@ patternProperties:
=20
           input-schmitt-disable: true
=20
-          drive-strength:
-            enum: [2, 4, 8, 12, 16]
+          drive-strength: true
=20
           slew-rate:
+            description: |
+              Set the slew rate. Valid arguments are described as below:
+              0: Normal slew rate
+              1: Slower slew
+            $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
=20
           mediatek,pull-up-adv:
@@ -263,5 +317,19 @@ examples:
                     mediatek,pull-up-adv =3D <0>;
                 };
             };
+
+            /* GPIO0 set as multifunction GPIO0 */
+            gpio-pins {
+                pins {
+                    pinmux =3D <PINMUX_GPIO0__FUNC_GPIO0>;
+                };
+            };
+
+            /* GPIO52 set as multifunction SDA0 */
+            i2c0-pins {
+                pins {
+                  pinmux =3D <PINMUX_GPIO52__FUNC_SDA0>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctr=
l.yaml
deleted file mode 100644
index 9a937f414cc98..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yam=
l
+++ /dev/null
@@ -1,236 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek MT6795 Pin Controller
-
-maintainers:
-  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
-  - Sean Wang <sean.wang@kernel.org>
-
-description:
-  The MediaTek's MT6795 Pin controller is used to control SoC pins.
-
-properties:
-  compatible:
-    const: mediatek,mt6795-pinctrl
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    description:
-      Number of cells in GPIO specifier. Since the generic GPIO binding is=
 used,
-      the amount of cells must be specified as 2. See the below mentioned =
gpio
-      binding representation for description of particular cells.
-    const: 2
-
-  gpio-ranges:
-    description: GPIO valid number range.
-    maxItems: 1
-
-  reg:
-    description:
-      Physical address base for GPIO base and eint registers.
-    minItems: 2
-
-  reg-names:
-    items:
-      - const: base
-      - const: eint
-
-  interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 2
-
-  interrupts:
-    description: Interrupt outputs to the system interrupt controller (sys=
irq).
-    minItems: 1
-    items:
-      - description: EINT interrupt
-      - description: EINT event_b interrupt
-
-# PIN CONFIGURATION NODES
-patternProperties:
-  '-pins$':
-    type: object
-    additionalProperties: false
-    patternProperties:
-      '^pins':
-        type: object
-        additionalProperties: false
-        description: |
-          A pinctrl node should contain at least one subnodes representing=
 the
-          pinctrl groups available on the machine. Each subnode will list =
the
-          pins it needs, and how they should be configured, with regard to=
 muxer
-          configuration, pullups, drive strength, input enable/disable and=
 input
-          schmitt.
-          An example of using macro:
-          pincontroller {
-            /* GPIO0 set as multifunction GPIO0 */
-            gpio-pins {
-              pins {
-                pinmux =3D <PINMUX_GPIO0__FUNC_GPIO0>;
-              }
-            };
-            /* GPIO45 set as multifunction SDA0 */
-            i2c0-pins {
-              pins {
-                pinmux =3D <PINMUX_GPIO45__FUNC_SDA0>;
-              }
-            };
-          };
-        $ref: pinmux-node.yaml
-
-        properties:
-          pinmux:
-            description:
-              Integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and =
are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h dir=
ectly.
-
-          drive-strength:
-            enum: [2, 4, 6, 8, 10, 12, 14, 16]
-
-          bias-pull-down:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull down PUPD/R0/R1 type define value=
.
-            description:
-              For normal pull down type, it is not necessary to specify R1=
R0
-              values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
-              will set different resistance values.
-
-          bias-pull-up:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull up PUPD/R0/R1 type define value.
-            description:
-              For normal pull up type, it is not necessary to specify R1R0
-              values; When pull up type is PUPD/R0/R1, adding R1R0 defines=
 will
-              set different resistance values.
-
-          bias-disable: true
-
-          output-high: true
-
-          output-low: true
-
-          input-enable: true
-
-          input-disable: true
-
-          input-schmitt-enable: true
-
-          input-schmitt-disable: true
-
-          mediatek,pull-up-adv:
-            description: |
-              Pull up settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described =
as
-              below:
-              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 disabl=
ed.
-              1: (R1, R0) =3D (0, 1) which means R1 disabled and R0 enable=
d.
-              2: (R1, R0) =3D (1, 0) which means R1 enabled and R0 disable=
d.
-              3: (R1, R0) =3D (1, 1) which means R1 enabled and R0 enabled=
.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          mediatek,pull-down-adv:
-            description: |
-              Pull down settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described =
as
-              below:
-              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 disabl=
ed.
-              1: (R1, R0) =3D (0, 1) which means R1 disabled and R0 enable=
d.
-              2: (R1, R0) =3D (1, 0) which means R1 enabled and R0 disable=
d.
-              3: (R1, R0) =3D (1, 1) which means R1 enabled and R0 enabled=
.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          slew-rate:
-            description: |
-              Set the slew rate. Valid arguments are described as below:
-              0: Normal slew rate
-              1: Slower slew
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1]
-
-        required:
-          - pinmux
-
-allOf:
-  - $ref: pinctrl.yaml#
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
-
-    soc {
-        #address-cells =3D <2>;
-        #size-cells =3D <2>;
-
-        pio: pinctrl@10005000 {
-            compatible =3D "mediatek,mt6795-pinctrl";
-            reg =3D <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-            reg-names =3D "base", "eint";
-            gpio-controller;
-            #gpio-cells =3D <2>;
-            gpio-ranges =3D <&pio 0 0 196>;
-            interrupt-controller;
-            interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-            #interrupt-cells =3D <2>;
-
-            i2c0-pins {
-                pins-sda-scl {
-                    pinmux =3D <PINMUX_GPIO45__FUNC_SDA0>,
-                             <PINMUX_GPIO46__FUNC_SCL0>;
-                };
-            };
-
-            mmc0-pins {
-                pins-cmd-dat {
-                    pinmux =3D <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
-                             <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
-                             <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
-                             <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
-                             <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
-                             <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
-                             <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
-                             <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
-                             <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
-                    input-enable;
-                    bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
-                };
-
-                pins-clk {
-                    pinmux =3D <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
-                    bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
-                };
-
-                pins-rst {
-                    pinmux =3D <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
-                    bias-pull-up =3D <MTK_PUPD_SET_R1R0_10>;
-                };
-            };
-        };
-    };

--=20
2.55.0




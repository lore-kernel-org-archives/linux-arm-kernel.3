Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6502BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xR7Qwp0o8G+y7oSeBf74kipM/J3H4hlNEeshGOMywQ=; b=0tZ7bdBxtNdbMAmuecBO7qfUqC
	H75iiZ5NkdfUugEXndWjnnK8unoRy77+pkmo4L+SMsUZki2+Rks/3GoFi/CdDvyGg/+r4Fya6WbWe
	WiDs3ttg03yWqW6LfEIKTJSB8PiwRsMAIZPQKAONpFaeLQ6zWvRoBrwnnx8Mk3xb/0B3w4qAN4NSz
	Tq5+AjXesRre6DIXQSCpKBRq4cZ7dofo/2/u0SZgLYZo8MUj8RxPCjGKhTaY3ij2w7phqY9JF5m9T
	DDZKW0iNpIPhVIYOuvDHGodZ1394Cr3Fdz6YD5nEqFq2z5CBes4LIB018Qx/oSJ/JI42DMfMeOeAW
	8eztB6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA88d-0000000DqIR-1QER;
	Fri, 25 Sep 2026 15:47:03 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA88a-0000000DqGE-4151;
	Fri, 25 Sep 2026 15:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351217; x=1790610417;
	bh=2xR7Qwp0o8G+y7oSeBf74kipM/J3H4hlNEeshGOMywQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JZdZReZrRtLvRhr3dzfhbj593yln4+WvrZCCHw3TYpOE2LkpfEgX9q+MAv8GQ5BrC
	 r4rWVvAn2pi7PMUmPczdg7mB0SgAeQyGpJO/YY+3jGsT2jn1Aim/AIrGhexpgyJKp1
	 mcAiXJqNADRnP+xDzL3C1mODTTHHTDkbKzjfqRGpzJTAraDPQDqWdjCJRNtUdrEYjx
	 g8U97RZ7562fFZVNiRObatp0G2lo+32SSR4itG8wzSGsTvsUKU7MU8E+LINv4IDLRt
	 xWyi+bMBcbb4zd2ngEt69Pue1vb/3GB+SICQ/MYb9BrwXiiguS5l8ebgc/hf3HquwV
	 egtHf43kgIHDg==
Date: Fri, 25 Sep 2026 15:46:52 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Message-ID: <20260925-mt6735-pinctrl-v9-v9-1-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 08ffe5e4ed76914d2d2bb7dad90e84e09f586bdc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_084701_151754_03057402 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 38 ++++++++++++++++--=
----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index f4bab7a132d3c..0dcbca5ca8f92 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
=20
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
=20
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing=
 the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to=
 muxer
           configuration, pullups, drive strength, input enable/disable and=
 input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
=20
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
=20
           bias-disable: true
=20
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1=
R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
+              will set different resistance values.
=20
           input-enable: true
=20
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells =3D <2>;
             interrupts =3D <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
=20
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux =3D <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv =3D <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux =3D <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv =3D <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux =3D <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv =3D <0>;
                 };

--=20
2.55.0




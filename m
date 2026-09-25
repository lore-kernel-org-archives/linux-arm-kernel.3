Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30CCC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=; b=UIY/XjpND1NKccC1PWCMkpubXl
	WPrAv+vHZFN4Bz08T0WeLGde5+npV4lvvJhv4UjpeXA+eb9C5IT0zXvmdL5pj9OhXg6n5GvDZ6Ac9
	iHgw3Bpz5YjIIDGtxYrP05afOHeFYEV3FMWe0QnhKLyMRTb7r87UH/dPIBr6xvcnRdA1/zH6mQ/TA
	RSJ6XmFNgx5QvnSBzolo0HwHkPAeXvAw5/mR1NYuO7cCL0KyR4AH9gWJBIDIRD+/te/rHfh902dnj
	M3hA3PJIzg0bB9/jRL0ztNk8RAPad3JcVP1ccq5xm+zjsSyU3ZUICGTYS1S0AY9FraxUKpXJpfv8S
	qx+OO19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB2i-0000000EBtY-2y5o;
	Fri, 25 Sep 2026 18:53:08 +0000
Received: from mail-10699.protonmail.ch ([79.135.106.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAB2g-0000000EBsg-1EC3;
	Fri, 25 Sep 2026 18:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362383; x=1790621583;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zCUACAccINOUkL4zC1sZ5TLXTZrXfu6qReT8Z2XHv19SPjiF6uvxeR3J42mjfNPVA
	 Q+uRi+uEyflx2vmU12TO6E7lulAd8k5yZxPPPW5WIy3fv7SkU9vqFbH/akojEOcyOF
	 g2QUK+eKJhvHgOgffIwRlapxUVJcwYXdAfWVIC2XmOhae9lZqfe9euVRA+df1yisLy
	 3qIFeDGwQTnDYcmZbzRnES4qd5clSGQ5C0kub4iNXboHhn12wVSekwOHQtewgmzJw+
	 x6uyHNgT9uwYa84sOWcvg75Q0lAuMyHIS3QJ71IgjAGv9DstBCfIp6SD4XBpGnYKy4
	 FEtV3egc/Xofw==
Date: Fri, 25 Sep 2026 18:52:57 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Message-ID: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 47a0544b51a3a5be9418fa196cf84e2ced4cd6e4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_115306_491074_B9BEF045 
X-CRM114-Status: UNSURE (   7.40  )
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

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, wrap all descriptions at 80 characters, and remove
literal style indicators from descriptions that don't need their new lines
preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 ++++++++---=
----
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 0dcbca5ca8f92..4dc9504e24ad5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing=
 the
+          A pinctrl node should contain at least one subnode representing =
the
           pinctrl groups available on the machine. Each subnode will list =
the
-          pins it needs, and how they should be configured, with regard to=
 muxer
-          configuration, pullups, drive strength, input enable/disable and=
 input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disab=
le
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and =
are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h dir=
ectly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
=20
           bias-disable: true
=20
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1=
R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
               will set different resistance values.

--=20
2.55.0




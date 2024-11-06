Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EE4D44D4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rDU23pzf+q4Fq/p7WgWy753TjJNM/Py3tStVTK1u3U=; b=30TBML19yqPxhZiAnMWwlj9q1z
	1zrQ9qgecClfdDy04OMxBouDeqZM3d4WLCIhw78Vg+rWKm9OiEMqXRGjgktH9bkCpR/xx5kzbjoMz
	oED4JmIO58CHZHavir8Zy9HAXtlm+w5IvV3/E3kD2hsnHY/iimGGgkv4TIsU27rPEtrfC7niiHLe8
	Pksx9xf4x0L3AzNF075It3gaUyp3U47KE6z9Pg8Rg5sBsPCU0FCEMTJojdLTuHUUKtLPdt2fPJ5ut
	Ouze2KX7VlA/z/dv9+Pfvr88BJXZz8r5KnfIwwWtrUIhR4/k8U2evQW7UGvecECCbseR0fubHshq0
	5G0og2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8e8k-00000002uYb-19uD;
	Wed, 06 Nov 2024 11:23:58 +0000
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cyW-00000002h45-0ChO;
	Wed, 06 Nov 2024 10:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887758; x=1731146958;
	bh=4rDU23pzf+q4Fq/p7WgWy753TjJNM/Py3tStVTK1u3U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=q3x//zedOaDsIApgZSXVhf9alKkEswwgiIWag4AqM8gGNjuDJ2nFNE4FFbDg4ePK/
	 sSQiI0pVrUzOjXPgykwuI/kEMn4TZW120aCDN1VpcpRxK6YRssszNpEV071NpcOP7a
	 iei0aCor2ExrULaGJiBnuHw39rdEiwXZiq3DsicwB0zg87FOdY5XMHWIloluBspFav
	 AHPR136u1Qnuk+XYdf7fSDc5nxWKWhDeE57XmdnC1B5QmoT07VD0bcXapbqSGnAAhi
	 Qr31IH4vBfGC4vtX6bW4F3YKZ+NgJAPSO91HBYpXIxHSU8l/x+4CsxeCyimFo+ykej
	 82QZ8vgdyB1UA==
Date: Wed, 06 Nov 2024 10:09:11 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Message-ID: <20241106100741.173825-6-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-1-y.oudjana@protonmail.com>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 0cb5cae7981533bf96445ccd341cf792997e4428
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_020920_269963_80B6EB5E 
X-CRM114-Status: UNSURE (   7.09  )
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

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 7ac1a85f822f1..4bfbaebb790c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
=20
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
--=20
2.47.0




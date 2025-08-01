Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82FC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8VdbJBOlXoBkF3uqt8fJExAcNTDFto3gONgI5UEhY4=; b=d09Pew2LB55Wm6pNDIFrhHVSVn
	RkClZmQ2aPQLPSslFRy0IZJlCc+kCL6bLmqBE2ThfOinGmSoxOofBUEIpqlGv636PpSmCHqaZNbHE
	NzHs1T1xv9V01q4A3oifeubmsJzhleySjxj/j48ylBAqOi9GPg7In1lHsq7zR1hknYY4Gtmzit8ud
	ejYx/QcNNzl1HKaymMUX8DRVGZyUX6gksyCJjrnb6aB3rM5I3k8w0VvpwfQeWepOCwNMCRtw2u5sQ
	WSOMihmeSratYuixRDmpWGwXaj/c22aGMW3lI8ucVvq14Fom1LRKvZeUWGSZKj5Q7Ie8pWtDKTEDi
	jT1sFWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhntm-00000005YPv-10le;
	Fri, 01 Aug 2025 11:26:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnm5-00000005XGv-4Bij;
	Fri, 01 Aug 2025 11:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047088;
	bh=6cjt0RITd8PmIpdtTTBLHZ2ZTTTpYhzzJb6BLpwZh+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jmGmIrJS3e5pChQTvVi5scTvwvM7afYI+62XhozBmkcRfHYLNDIhvwQuAlxTenMxd
	 FxVgvptrDfhW8UHdl4o9CX3C56CYQnaL5N06SDl68G+QuWERExyCYHsbq4N9WsVlJX
	 dQkhojh7eI3p6UW/9PSa/j3UQCWX3jgN7ORpVELQ4oPnA2HrIXgWW6QUxVGa8ptdso
	 9ilL6lJ8PgCHcQw2CvFTUjdwEAPzIlF8QBKVXPv7M3eqQEWQh7dm+lKqDC7XQ/UiqY
	 0F3khhYJ+z+tBsiy6cwuTQy7niyzDhqtuP+r81J4JxQMC1FPjLc6dQ9lyUg/JEKV4s
	 gYLd8wuL5ACwg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 498CE17E061F;
	Fri,  1 Aug 2025 13:18:07 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:04 +0200
Subject: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041810_183394_A7425997 
X-CRM114-Status: GOOD (  11.11  )
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

Update the mediatek,audsys binding to support the mt8183-audiosys
compatible, which uses a different audio controller binding
(mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411c5632ae6663d15f29 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -23,6 +23,7 @@ properties:
               - mediatek,mt7622-audsys
               - mediatek,mt8167-audsys
               - mediatek,mt8173-audsys
+              - mediatek,mt8183-audiosys
               - mediatek,mt8183-audsys
               - mediatek,mt8186-audsys
               - mediatek,mt8192-audsys
@@ -41,7 +42,6 @@ properties:
     const: 1
 
   audio-controller:
-    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
     type: object
 
 required:
@@ -50,6 +50,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-audiosys
+    then:
+      properties:
+        audio-controller:
+          $ref: /schemas/sound/mt8183-afe-pcm.yaml#
+    else:
+      properties:
+        audio-controller:
+          $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

-- 
2.50.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C1CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCycB3V0dBNDfIMtD00zqUYBVMETl1EkStw7dZvRNFk=; b=OgU+NW/aQ2imCierMn3p+OzD+t
	ALiGYbsE/tUjEB7wXNbAl1zMKvgqrJubw34I6XXbpeFxrx55yRO6GxnjGOoZnR6IsJWxH+qsQ91Mc
	byGpsfasQHE8Ohumf9EvU4ZtiasxBr881eSZUhRYH3pWvfKjo5Zg99bAtO0UhTZxfdLD51qzajg3l
	T264i00r889sI5ORwUjJYhHyuPwEY9r7VxC6WdNHC5XNAcwqK4bOvro1iJ/Z8XJwfpC+XN724+SsC
	2dLi/Fd4jRyv410qKfDSeMCjQx4dJJ68a0RUvuqZmblg/erRdC4QF6VLly7P1UMnYivDzeCreikB1
	NQ2Do1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokFP-0000000EA5i-0KL8;
	Wed, 20 Aug 2025 14:57:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7i-0000000DsVc-0NQa;
	Wed, 20 Aug 2025 13:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697504;
	bh=kAfaoM+sI7FQ9MCblVppc0VqNecjv7SuoMhbMLV6t1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5WeazqwT4f0T3N3ttOnDzmvLGw0+33ceE+5j3YRyJ79JYwkhtMFfn4XdsiUCQqe6
	 JDgyApF4rqMCbbyIdxeoaAJNQut6E1rq27AxTg9SGyD2Y/t3u40tO1c/o4Y+K8bY0u
	 JxSkumEIc/2ihT1IH/bdHC/kQoEg2iBdF8kOA7s+qArSgcV7FNPSxu4GiSCd6umCpA
	 HmUwBbZ+Ubof3KEigAJ21NUmkYrWeI+0xsEbFOFN4IHRpwYV+FBfLnRfJhpMFNfMXR
	 N/68tLQcVwGi5+/R4d9Safpogj1jDQOu4kk5De2OxLKfcYJgj6w0cyU3elOHQx3RBU
	 YeUVXXFwUTBYQ==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6490817E12FF;
	Wed, 20 Aug 2025 15:45:03 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:54 +0200
Subject: [PATCH v2 3/6] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
In-Reply-To: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
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
X-CRM114-CacheID: sfid-20250820_064506_310109_6A68F310 
X-CRM114-Status: GOOD (  10.51  )
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
(mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..f3a761cbd0fd44e2f7ff35c274dd170bbb177e96 100644
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
@@ -41,13 +42,26 @@ properties:
     const: 1
 
   audio-controller:
-    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
     type: object
 
 required:
   - compatible
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-audiosys
+then:
+  properties:
+    audio-controller:
+      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
+else:
+  properties:
+    audio-controller:
+      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
 additionalProperties: false
 
 examples:

-- 
2.50.1



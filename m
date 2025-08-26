Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF717CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UTVoplzqJ2TSk2GcGNuEOA5hD8DQhqiQw/f480VKg4=; b=nbKZCYUq8jCDP/W0wrat77rPOS
	37wLh+g3WgRdl793PlgelSg2GeQSsLdnLeZfqpq1R8/Cd4W1vDH9l5lf+R+wIT8nZtTCeRPEZLFIF
	bktjMXZx2t7rWaYaYwE9dfcZKehkvKb/VRP6xJXTZmROjD+8oyJVDxBvV8IGpDesG3kYo7w69VbkJ
	a9Qf4NoyRUgmtRrak1VxCWH8PthJM+vExkmqLO4EOUYnrC9w0GtEJzLccJDoa9YrbqA9o7gRzJrFm
	LZz9IUCT9oIEFDwfSxfn39kfbl9IsR+oiKy211IwIAVzCnqXu19LZfzpqBOCYGNAyymGSkGUcbTRA
	WfKhYaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoT9-0000000AuHq-3x5q;
	Tue, 26 Aug 2025 07:51:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoHP-0000000AsOm-0agH;
	Tue, 26 Aug 2025 07:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193981;
	bh=LEBE+u6su4OUjp/iX5IT72269Q3HZyrx6finusqhxQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAJscegZkucOQeKW+iD2MQoqT2xV+k5eW6TTNZRc8ZBqBD+4Tt21JzcqzCJ4RRaxu
	 C1Z5wEOkScnt8vSCu2wL7w/qP7xilKyipBxXJ0JfduAVrcFCmWPBmiAHWQilFZE7Ua
	 fqU5jagKzj+f7R6nelHlDmJHyvnFncdApD3QoBjLTxWxjuHCWW5yKrf772dTK3dJ08
	 W2+DugtCECFkTyySmD+xK6qIffGx01cWcJYgHBIgHR5VkT9q+CnNCFdLo6xpxXjVew
	 XWvDfGfLktzqadpUiCHyRinE3NSEnSCC0qvxx0fB6Ypn1Kpu5/GthU4huk7rr4dtvt
	 VJ5Dz2dyP9qSw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EF1417E0A2B;
	Tue, 26 Aug 2025 09:39:40 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:36 +0200
Subject: [PATCH v3 3/6] dt-bindings: arm: mediatek: Support mt8183-audiosys
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-3-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
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
X-CRM114-CacheID: sfid-20250826_003943_334052_192BC6EE 
X-CRM114-Status: GOOD (  10.20  )
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
compatible, which uses a different audio controller
(mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E4ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqmP9vgg2YTWAUuE8YE8aiTjhe6juTxiIV2rXz3Bw1k=; b=ckF3Tnsft9a+h3O1YELM34dhFN
	wXzczdL44Mil70zUM6W+vmPuDpWpY2M7zfGzguL5iCl9aXd6ZmN35xKFSS/r2b12PjFkhu4rHxPMm
	fw50DqtYeCn38vpf7E06H8g2n6ZeCJqhCppZRWjCCZV0TSF1h4ELntLxwvATKHtW5AbZO6yh5leB+
	xA8Ls/8zRiDaSvBOJHcfW4z9RkMMbGscjSyflX8oNN4TYfq9OUQSUnkM8Wx+rYkmDexrTBQ9tiopJ
	Z31wHhCRaF/qkrVI4ODGO7r7z+SzkZwEmwn5BC2ltqoct9z9dSJWVo8xb+ZO//REWpFNYkmyFd/aA
	uEz8xyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojzr-0000000E84L-2WPz;
	Wed, 20 Aug 2025 14:41:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7l-0000000DsXm-2nxZ;
	Wed, 20 Aug 2025 13:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697508;
	bh=USQrAZZJj10MR5a19PgXs2S92DCFQyDjwkKul1A2/QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V+ACyZEeuzaNAus8J+TTuv3/kSXjuUTRWqt2YJhX28Fu/ocqChkEESUuwNvexKYvu
	 uFTfvMwN5FX12IBFr+W/iGQZ6KVG9lJMbu8pq7KmVaEK9MkQNqF+il2DUWwXnuNTVz
	 fbJdNJWeI0JiQxFuQ9PZwwJkrNLOP2WXd0D8ryHB5HB76nIWIn8+jKpCBofN2ZHk6d
	 MfwHTkX1F2D/CAuBtShAvxpjkNYsCsWdEYBVZZ8X8XQkBRq9hZDxwjsal+e9HmzUnp
	 Vh9pOrZbiHSQ9vrTU9H4fW95oS9qZHzBqHjAX+m3ui9FCiIL9/0CWdz0f3r8VLg7Ju
	 QCY69rb1HpHTQ==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2905F17E0483;
	Wed, 20 Aug 2025 15:45:07 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:57 +0200
Subject: [PATCH v2 6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
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
X-CRM114-CacheID: sfid-20250820_064509_861439_21900018 
X-CRM114-Status: GOOD (  15.10  )
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

Convert the existing text-based DT binding for MT8183 sound cards using
MT6358 and various other codecs to a YAML schema.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../sound/mediatek,mt8183_mt6358_ts3a227.yaml      | 59 ++++++++++++++++++++++
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
 2 files changed, 59 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..048fe62715d67d44daa08e75a63c782238815689
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8183_mt6358_ts3a227.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
+
+maintainers:
+  - Julien Massot <julien.massot@collabora.com>
+
+description:
+  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,
+  with optional TS3A227 headset codec, EC codec (via Chrome EC), and HDMI audio.
+  Speaker amplifier can be one of MAX98357A/B, RT1015, or RT1015P.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183_mt6358_ts3a227_max98357
+      - mediatek,mt8183_mt6358_ts3a227_max98357b
+      - mediatek,mt8183_mt6358_ts3a227_rt1015
+      - mediatek,mt8183_mt6358_ts3a227_rt1015p
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MT8183 ASoC platform node (e.g., AFE).
+
+  mediatek,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the TS3A227 headset codec.
+
+  mediatek,ec-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Optional phandle to a ChromeOS EC codec node.
+      See bindings in google,cros-ec-codec.yaml.
+
+  mediatek,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Optional phandle to an HDMI audio codec node.
+
+required:
+  - compatible
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
+        mediatek,headset-codec = <&ts3a227>;
+        mediatek,ec-codec = <&ec_codec>;
+        mediatek,hdmi-codec = <&it6505dptx>;
+        mediatek,platform = <&afe>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
deleted file mode 100644
index ecd46ed8eb98b99d0f2cc9eeca5f6d0aef6a5ada..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
-               "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
-               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
-               "mediatek,mt8183_mt6358_ts3a227_rt1015p" for RT1015P codec
-- mediatek,platform: the phandle of MT8183 ASoC platform
-
-Optional properties:
-- mediatek,headset-codec: the phandles of ts3a227 codecs
-- mediatek,ec-codec: the phandle of EC codecs.
-                     See google,cros-ec-codec.txt for more details.
-- mediatek,hdmi-codec: the phandles of HDMI codec
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
-		mediatek,headset-codec = <&ts3a227>;
-		mediatek,ec-codec = <&ec_codec>;
-		mediatek,hdmi-codec = <&it6505dptx>;
-		mediatek,platform = <&afe>;
-	};
-

-- 
2.50.1



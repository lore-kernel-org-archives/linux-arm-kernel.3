Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AEFD65531
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIrSIEvISs8p+aTeBxzsXU3bpz4L+sq/iNIWj/xdYl0=; b=Y8R9yWK4G54i+m45IWjAYKrU6Q
	/S6z2fM+97ukp7tEh60C3u0LVu0hNLxKs8EvNCyt4hHps07jd0BtBQH7+jqvWozPYUDB5xFp+q5Xb
	gKyxmmIxAjDBxkYWLC/EFAy8cY2DMSriqDQMIXdCn2cb7U+6rOghL58bnX/OwpzgNOta3XIsikSmt
	rkuq+SO0zkvjxNN8VpimuYjHM8/NecgoOnErtg/6EN3KwXWHAY3S3bmAwQScpF58E3yHAZzw+1WCK
	ErxShU+UbkangrdLUMkxjwDc5k5XazP2mAbZYNO57/jwPOt8StcPlAq8wDaS1tIwcvzqK4Ub45dqz
	xpqxEYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodD-00000006bDK-1dkG;
	Wed, 17 Dec 2025 10:19:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodB-00000006bC2-1SgK;
	Wed, 17 Dec 2025 10:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966777;
	bh=jC5+KdoqdVFQgOtEPuJi4tXUBsXqvexvaZVlr3SvnWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ex1cl9zt4oNB1mZRj71tqKXBm5P6l4YZBNlQFq++F5h+dSdYv64BisGlDZdUgfrg4
	 lmqEKxzzT3jtuS+eCr3GMJ8aqzmIp2N/l6HkmfmFUVtRC7D56j7hCyxUZM3nQrKXu/
	 KUopx29a8BN9IP5awepcrcINOar/XLveipnVP1YdToMjuA78a3Uida0nDe4tgH3jrl
	 a78ANREO9FuU7c7X/X76SZz2ct5UntR4PGr5yjzbNeOFTl/HEipzrnWuymbEHmCrbX
	 dimDKyfYRVQRmg9CCVNL261tfNB4X6XMxlHnRUmlxyBKZweL/4uQ8POqzxMoxBgRZm
	 Yb3SsifrLu71g==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D081617E0C87;
	Wed, 17 Dec 2025 11:19:36 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:00 +0100
Subject: [PATCH v2 01/12] dt-bindings: phy: mediatek,hdmi-phy: Fix clock
 output names for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=1504;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5dxyFZEQPilPUnhA9Vm4qAcH//F/AqE/9KWYhCVl0Bk=;
 b=wS0uVYdevYYtQ8TODoFfPoPGRP5o7SOOEkQHWpg1mS2iAd6rda4UuotYnJ4+CwPRRIcfZVGJX
 ZFM2kG2w3tJCKjYEgxxibCz1gfseUEqSqQE/fT5/r5uo1sqeryX/plD
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021941_548528_EBBBFF6A 
X-CRM114-Status: GOOD (  10.01  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

For all of the HDMI PHYs compatible with the one found on MT8195
the output clock has a different datasheet name and specifically
it is called "hdmi_txpll", differently from the older HDMI PHYs
which output block is called "hdmitx_dig_cts".

Replace clock output name string check by max item number one to allow
the new name on all of the HDMI PHY IPs that are perfectly compatible
with MT8195.

[Louis-Alexis Eyraud: split patch, addressed previous feedback from
mailing list, and reworded description]

Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index f3a8b0b745d13ffc55d391570bff20830d925ed3..10f1d9326f18dba85b92b4c88f4c0f6cdddc4c25 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -42,8 +42,7 @@ properties:
       - const: pll_ref
 
   clock-output-names:
-    items:
-      - const: hdmitx_dig_cts
+    maxItems: 1
 
   "#phy-cells":
     const: 0

-- 
2.52.0



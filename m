Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA42CAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+AV/Eunw0tJQala37bhVxAo3l0XB6/2PLn9CWY/9Ow=; b=y3kJZTNxdA4lhpj/ndep3dz+Ya
	Iwu6tvPl94VXD9oSVqVhS+7YM8H2EhdJ+2AlIE9y0zZatXpBiOZcM9hw2XJ4fWCDvQzk2DGuXa92W
	DtvB4ojl55sH8A87m60R+Gr1d73ILNiKxSNG8BFfE9kMsf4hq92oOgeFCxpvtjMK2KQLloJGF8G2X
	5egYQdHgQJYTgeaZDySHJeRaHb2Xk3tRTjDITMc245u5KJ2g0cDaZy8eLz82gTWPm/ZTkIAaAVAH7
	MspfmGGRDYu5jyFntyQAEo3tL16B405KcNIKpx29XCWepjZ47dQgx65w58+zGKxoY3hKjl9d+ISCG
	4kNI4DvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNX-000000013XY-26LH;
	Mon, 08 Sep 2025 17:10:07 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbaP-0000000HG48-21ae;
	Mon, 08 Sep 2025 13:07:11 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (9)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id 9916F1BE932;
	Mon, 08 Sep 2025 15:07:04 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	mateusz.koza@grinn-global.com,
	andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
Date: Mon,  8 Sep 2025 15:05:35 +0200
Message-ID: <20250908130620.2309399-3-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.46
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060709_693893_B39C272B 
X-CRM114-Status: UNSURE (   8.45  )
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

Add device tree bindings support for the Grinn GenioSBC-700, a
single-board computer based on the MediaTek Genio 700 SoC.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-700
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 19ed9448c9c2..448241939a75 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -436,6 +436,7 @@ properties:
           - const: mediatek,mt8188
       - items:
           - enum:
+              - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390
           - const: mediatek,mt8188
-- 
2.43.0



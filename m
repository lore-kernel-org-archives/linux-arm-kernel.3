Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRpcqk0xCASnwn+EVRipsj7W0eLdA4Q9OX3OoHH5Phw=; b=X5jy8koOxJF8PSKb422PY/c1zN
	d/KEUwZCaXelME3mew6cT12BoUmNoaJqd9KgTMcvnggBukQnCLVelImM6udsC5NzQUwhze7wsyD7O
	BlbcwP5LdW6VkwdsAnvQdkQ/1E6dyBVy46ML8zSXyzn/QtQuon7O7XgO7qNd+l0FSxkYUoEkco/DU
	vCQQyUCaox0FGxKLue54zJjTqUKIVGzHPPHIYLqper5oHijMpvXrJjzkPbD8tF+XgesXuFPLENvy+
	S+iYKAGmlCrYt8WsX51HEwRK6ZEtP1/ZlHHtCKwwtBB5MVtksd34OqSe82G7IdX3RnR8qGwRX6i9b
	4PAQEc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyV8-00000003AD3-18ux;
	Fri, 15 Aug 2025 17:46:02 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx0n-00000002wAf-3HZq;
	Fri, 15 Aug 2025 16:10:39 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from mateusz.grinndev.ovh (79.163.192.75.ipv4.supernova.orange.pl [79.163.192.75])
	by server220076.nazwa.pl (Postfix) with ESMTP id 4442C1BBD46;
	Fri, 15 Aug 2025 18:10:35 +0200 (CEST)
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
	Mateusz Koza <mateusz.koza@grinn-global.com>
Subject: [PATCH 4/4] dt-bindings: arm: mediatek: Add grinn,genio-510-sbc as a valid platform
Date: Fri, 15 Aug 2025 18:08:37 +0200
Message-ID: <20250815160837.371592-5-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
References: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.48
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_091037_994231_4582D5EA 
X-CRM114-Status: UNSURE (   9.08  )
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

Add device tree bindings support for the Grinn GenioSBC-510, a
single-board computer based on the MediaTek Genio 510 SoC.

The new compatible string "grinn,genio-510-sbc" identifies this board in
the device tree bindings, enabling future board-specific adjustments if
required.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-510
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ad7fb85e3559..92ecc689430f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -426,6 +426,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8370-evk
+              - grinn,genio-510-sbc
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
-- 
2.43.0



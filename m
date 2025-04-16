Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61310C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3634VeLPM5qoZtuCKKA7Dd+qTqLQZlJeDhL6dOyGrKM=; b=j1XGaaRfrvW9hesnZFhP60G1dk
	7X5tzQwG/b5cz78ZunxDCXkwOUpaxj3bQiPRny7+ctCk/dNvelbw2nKjIRyiFZhHVnhA8wr8jLLze
	QohstGE8t1RAUVhNVSEDwWvsAi/x7yOrMecAvb4dPOzj+2kipK8yBr3oDnjkxBRWEe7998Mmk1lgq
	15kWVDQ39euoEWcvDJ3SmFA9OikfW2P5F98R05LGAvCDft9Uw0ibSX/wIY3I8SFKXHHVJDx+DK4ny
	tOLH0ENa6fGx/tRgEHtey3Hyd8GnOg+UPo/W52LDO6RHViE+V6sG+KfxYbjFFF14J2CdEdTWrxZXD
	fauzeXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51gI-00000009TdM-0TOQ;
	Wed, 16 Apr 2025 12:15:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Tc-00000009QUO-22wv;
	Wed, 16 Apr 2025 12:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804967;
	bh=2lD/ft0CpNxmzJrbrqzSOdijVqDR3GRIlsEJ5QJz18I=;
	h=From:To:Cc:Subject:Date:From;
	b=MGKOQyMfSZq2dVPxH2P3SEffDZWZUoUxkeOtuEml3PPr7ceMJgm+l9bKNGjaC8Sry
	 FkgQ699ZSSUUtqlT34KBbGbPfPYU/Dv8VeDNg+xATD4CGOgqyMheHEHddMiTb9oUQI
	 kuxRf/p4YQHGYaW/qpflFAvY6tgIT2S+pk/BSAHfUfFY4PQiDhEX6jrBEwrwUkEDEw
	 jiybXZnoBHM134OW3CihDZ42dIFfdw6lz9WUZRo2wKbU1rD2LybIZJXO3LxZsehPso
	 hUqFNYbDPSKX1gF7xJFq0iXXCEz+YwR+0gwKWyJd2FHyt97Q7GPsIzNWfq9v4uaH8f
	 6/YWJ7G1ba4eQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6602E17E35EB;
	Wed, 16 Apr 2025 14:02:46 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenbin.mei@mediatek.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200 MT6893
Date: Wed, 16 Apr 2025 14:02:45 +0200
Message-ID: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050248_671452_94227310 
X-CRM114-Status: UNSURE (   9.02  )
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

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
All of the MMC/SD controllers in this chip are compatible with
the ones found in MT8183, but do also make use of an optional
crypto clock when enabling HW disk encryption.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 0debccbd6519..6dd26ad31491 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -32,6 +32,7 @@ properties:
           - const: mediatek,mt2701-mmc
       - items:
           - enum:
+              - mediatek,mt6893-mmc
               - mediatek,mt8186-mmc
               - mediatek,mt8188-mmc
               - mediatek,mt8192-mmc
@@ -299,6 +300,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - mediatek,mt6893-mmc
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
             - mediatek,mt8195-mmc
-- 
2.49.0



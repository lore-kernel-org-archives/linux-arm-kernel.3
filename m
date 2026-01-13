Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B1D0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpdPJlRLguyulKvYugy3oju+RfACCEjowv0htHrCY8k=; b=ve90V43tAKjBGgTwAIynVBF1tU
	4iURD6Ydo0llccBM+UQV0TIvQl9Tr/Vq3eowRIqKFxH0rd+YLRwshL4h/yQMhyXAG+hx/9cRgVH5g
	+3ClzYkxxNQcgwwpCNr8oKk/a6KSjk+Oj2fMEk6X35nkHIUzs6/bUFo1C2/BlWcFsBFOmDDAIUOAp
	p54nvZC3/gxr+UCZ8f/hc8aULOquBU/BcY4UiCDqP2RZEBuXW++yDiBQYV+vK4DBNikY0SCPY362i
	RAaeNjhCtKZyJTD0BUEzam/y+JrO52VjthnK/zyhXHCmhpKBM3QkGbGLny+9RywIjOZFekurFrORm
	++tbogqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8V-00000006xEJ-41cx;
	Tue, 13 Jan 2026 11:00:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8B-00000006ww1-2c31;
	Tue, 13 Jan 2026 11:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302007;
	bh=f/A/I/VodskiOgbzllbCrqIcjWpEWW93JtNibaeAlv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mc+Pm4+befzqQwqspF5nC4T6pKeG5ShW1g6eENK5nAMUVoeBkTeeB2EQ1bTA1LB1g
	 BCSxDZTRpMyCp+DZukMIY4Iup9LBI7lF2ieqsOwNxrcwiUL8KOd8iRn9+MOXqS2YOf
	 MI/ZPQc4kCCf1O44KU/KD+Q3f8mFCtT0//JUzO1xgim8eePhRTylKIgTuTRstJw0W/
	 5sAdg8NxeV0vIM/+KHMcg6a9Kqgs4+0wTypuvxobO2Cy6KWksAzl9qbGYiUMm6uNkP
	 nRgUL2FAw9tK1HX9ElhObXOAHPcr9U/QjraIM6W6trWWgKKJpG75nR7/C/8S5ZTPKn
	 mtE5jKA6QLVMQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2037D17E150D;
	Tue, 13 Jan 2026 12:00:07 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/6] dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
Date: Tue, 13 Jan 2026 11:59:57 +0100
Message-ID: <20260113110000.36953-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030011_820867_F798D452 
X-CRM114-Status: UNSURE (   9.63  )
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

The MT6331 has a "ldo-vio28" regulator but this was missing in the
list: add it to resolve a dtbs_check warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6331-regulator.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
index c654acf13768..eb16e53cb5bf 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
@@ -40,13 +40,13 @@ patternProperties:
 
     unevaluatedProperties: false
 
-  "^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$":
+  "^ldo-v(dig18|emc33|ibr|io28|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$":
     type: object
     $ref: regulator.yaml#
 
     properties:
       regulator-name:
-        pattern: "^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb)$"
+        pattern: "^v(dig18|emc33|ibr|io28|mc|mch|mipi|rtc|sim1|sim2|sram|usb)$"
 
     unevaluatedProperties: false
 
-- 
2.52.0



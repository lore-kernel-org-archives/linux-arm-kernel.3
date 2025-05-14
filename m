Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E72C54755
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oUr7nOFcRyK/M34smua52KHb53tyeHekgw/2YxwB/IY=; b=CRY/P3rOgFe2yY7hAjUx1xpZeN
	oZO6XT1VqqIcjp/k5ICDb/Faf8qXJmJFDDPuxBryeoAKslCgNbXdQzs13/IUIz3wNG/0zqx1HRAwu
	CQv811ECBlll0OVugbQjSD1VJFgpDR3BzfWvm31CdLOTwTa6TEt+o7QNulBZVyCMbp7Tbu9Wh72Oz
	QsMQ8Emz96HZ2TekMntnsfhY89FD/88RCPBb06FuZ/DHAe6sURoGsi1SJAHwwpViKPjplJWpG9Ihi
	ris2JDdngil4w1+Hov8DqQcuV9IK8QrDdtEKgS7gU0K90+72yiUuwZg/oZQEoNSm+QlHLrsphKjgE
	juJZq7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3q-0000000F0FI-10HZ;
	Wed, 14 May 2025 12:18:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8KS-0000000Eebm-3j3A;
	Wed, 14 May 2025 09:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747214587;
	bh=+1pbbQr6IhaWYuDDxWS5O5XFpl8IElD/YxVqY/H8a60=;
	h=From:To:Cc:Subject:Date:From;
	b=Wh4sc9Qa05xj4yd8MmneyFPg0FeSVWh+s//2l7EzCfr2FlhjG6lYhSXwNQ6xDkdgq
	 mQN/iujkehU5CGmkaIFjS3COdJDeqDdSPGOjwbDoRYSSfHkEAcprTHep4lk68ODHlE
	 ZWExgB1bdfoyMTfKW38EP+egdGFv9wJQnOJ0sCcldJCp/ZaH7UTUA+qq45S2oKlQqU
	 cPmXRma/D8g8kHkyskyvC0cftGa2qj0zi7i+NxODCKXxexOOlwyNa59H2/P3L7WhDq
	 e93+p/pdbx2EL2Q9avwLFq/70Ag5V/7V3wKFdEqh7a2sChQKNDRMW2PK9XLJvPVvhA
	 4K+LqYTed8WXQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAD5217E04C0;
	Wed, 14 May 2025 11:23:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
Date: Wed, 14 May 2025 11:22:57 +0200
Message-ID: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_022309_076935_4611BE4A 
X-CRM114-Status: UNSURE (   8.73  )
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

Add compatible strings for the AAL, COLOR, MERGE and PADDING
hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
 .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 5d2089dc596e..daf90ebb39bf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
           - mediatek,mt8195-mdp3-aal
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-aal
+          - const: mediatek,mt8195-mdp3-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 6160439ce4d7..5564f4063317 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -27,6 +27,10 @@ properties:
           - mediatek,mt8167-disp-color
           - mediatek,mt8173-disp-color
           - mediatek,mt8195-mdp3-color
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-color
+          - const: mediatek,mt8195-mdp3-color
       - items:
           - enum:
               - mediatek,mt7623-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 0de9f64f3f84..3798a25402d3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-merge
           - mediatek,mt8195-disp-merge
           - mediatek,mt8195-mdp3-merge
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-merge
+          - const: mediatek,mt8195-mdp3-merge
       - items:
           - const: mediatek,mt6795-disp-merge
           - const: mediatek,mt8173-disp-merge
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index be07bbdc54e3..86787866ced0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -20,9 +20,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8188-disp-padding
-      - mediatek,mt8195-mdp3-padding
+    oneOf:
+      - enum:
+          - mediatek,mt8188-disp-padding
+          - mediatek,mt8195-mdp3-padding
+      - items:
+          - const: mediatek,mt8188-mdp3-padding
+          - const: mediatek,mt8195-mdp3-padding
 
   reg:
     maxItems: 1
-- 
2.49.0



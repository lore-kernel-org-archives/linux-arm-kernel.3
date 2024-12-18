Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CED6E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RZv5OeXRENVX3UzOWhQ4paK8gFX9BFqRtwkFFfiNDE=; b=aYMCiv2B/PlOlsso/BQa9QEMqQ
	qULXzj74pjmTDGTQ10cQ9rgp6cqTJMZUSpb2v7q4NOXeXEfsiJehitmBCRjhmfBuy9dY+MLPKS2JV
	NvngTQRQOt5ldKLlr8f5wS218r5qHoV/0RiVU0n6NJfsnDPa40dqhj8JuDXTw+PMCDnFi9/+S2xrZ
	w15caBeaBVZD5IET2AiuDLclFsGG8F1+jotbc/5x2SBzLeObOQxh6guKIjzmjD3yubEkfluXhgj2M
	I4fa1WUI0seAjRwvohORqXTs7g9/Ue1osDtZ4b6WszIlVubSAk8Fbl1WeH86wD0dwe6iDLIXjXeZ+
	92LnzufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNssS-0000000GYIa-2ejz;
	Wed, 18 Dec 2024 12:10:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrgL-0000000GL4i-3mDJ;
	Wed, 18 Dec 2024 10:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519212;
	bh=N3yE4+/zUzwrZLGitsLbjb1957m/tWo8jToq6NvN4nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dsqlH2sqPyC5sMeSdb2HtWuMk8PfpABN0cFtmBSr5jxlJkyu+KbdCvyuLt30cUfBD
	 cDpqob/Bq7y000yGqhTzmF1j6B10Wgwo/tZbMt4nVlgeCDGXmVta9t5JqqHlZeKsu6
	 9luviBTwwQKo5ArPLUgv/o0KEB8tDavGN4u7jtnwgOhN3Fq6lBn8mjQN6RTUmQ4SEV
	 vXH7RyBRYUhIGsKs1yNiMO6ENfEdG06yM2DqVQMOAMZhT3jDZm0BxXSRcGIvYa1oUM
	 eEfWQbdECOxhs5JPUB7qvAr6NQjLAOIoCuYBo/GYqtMjpMaSq/E4BltP05fVFCvk5c
	 1rRA1If0ACoPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3752617E3613;
	Wed, 18 Dec 2024 11:53:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
Date: Wed, 18 Dec 2024 11:53:18 +0100
Message-ID: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025334_079141_E46BE43E 
X-CRM114-Status: UNSURE (   8.62  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
 .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cf24434854ff..1479035da409 100644
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
index 7df786bbad20..799c0b8fc1f9 100644
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
index dae839279950..415a25bc18fa 100644
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
2.46.1



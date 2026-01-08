Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C93D1D462
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pqLMZprS9Lh8um2sDWgM7NkPtgJjadk/qSLU6PlKLQw=; b=Id2+wacL77Yjeh02suOqFVJSCu
	4RNI5W2Lg95ldU3iDRqKCUG634avXRw1tsuC2Cp3wgJiH0/vDZciFmp+WILG8OrP2g039CcpA7xBv
	SX1d5figTpD6ZlMUIV/wHjfE+eAk9zYlBV8E8shx3JjSQ3SkL7ntxJ791s7GP2m0dPg2cFMOwa53j
	X1dDUDy9lckjJGeidz50FLitc6ZCSSR+aBB7HwMHxo6jGCLOx5YftatPniErveCbzu0a0yQ2w2gdZ
	XQOuTzDvVOGvDugf4pXEMIkrCU6eiE9Uw63US7TUUuE27HqVGEL9WhsiIA56slhYP4+U1l7ykOVdk
	5GfB6vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrB3-0000000HNXO-0C87;
	Thu, 08 Jan 2026 14:39:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrAz-0000000HNVc-3iz7;
	Thu, 08 Jan 2026 14:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767883185;
	bh=agnSqIfYliSvLE9YUhD+lK5INFWHtuSZ4n6ap2I4S3M=;
	h=From:To:Cc:Subject:Date:From;
	b=li5YM2FGifvQsvcVelBQ5kIkEJRTeOZmzw1+u0rGvxNe89HEDa1QpSwVY+W6jGwJw
	 9ExY5C2jQn/0ubuxWqAsCaC+Tw37WisvspGuNu7u5nSwE1UB1y6Nmw6X7w4CbBgtcJ
	 rcF0LwbcKikPAXr9lVFtfyVOnZGDZUmubMmA86qbdJwo2oVszvdR/fFNg0y3WhxNyp
	 WwwaFbMmj4fVf2lMYKRiDBEO8kQtVZwb3hnoh+DYX5hidy5BybMJVsxGMIfL57EgM7
	 YLW+8YoEGjXQaYIh5WovfL1QMHqyt6WZbRjME7tCXK+f5D6hmhcz/p37p5CLwU4DxI
	 RA71I8bmskwEw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 612A317E0FF0;
	Thu,  8 Jan 2026 15:39:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: Allow single vdo/mmsys endpoint
Date: Thu,  8 Jan 2026 15:39:32 +0100
Message-ID: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063950_084056_A5A9A1B7 
X-CRM114-Status: UNSURE (   8.68  )
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

The hardware supports using just a single output while leaving all
of the others unconfigured (disabled), but the binding did not
really allow specifying a single endpoint@0, because in this case
one must either:
 - Call the subnode `endpoint` and not declare any address and/or
   size cells; or
 - Call the subnode `endpoint@0` and have at least one more other
   endpoint(@1 or @2), and declare address/size cells.

Allow specifying a single `endpoint` subnode, without the `@0`
implicit suffix to suppress warnings happening on this kind of
valid usecase.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml        | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c78..e3ef7540c24f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -100,11 +100,12 @@ properties:
       the first component of one display pipeline, for example one of
       the available OVL or RDMA blocks.
       Some MediaTek SoCs support multiple display outputs per MMSYS.
-    properties:
-      endpoint@0:
+    patternProperties:
+      "^endpoint(@0)?$":
         $ref: /schemas/graph.yaml#/properties/endpoint
         description: Output to the primary display pipeline
 
+    properties:
       endpoint@1:
         $ref: /schemas/graph.yaml#/properties/endpoint
         description: Output to the secondary display pipeline
@@ -114,8 +115,11 @@ properties:
         description: Output to the tertiary display pipeline
 
     anyOf:
-      - required:
-          - endpoint@0
+      - oneOf:
+          - required:
+              - endpoint
+          - required:
+              - endpoint@0
       - required:
           - endpoint@1
       - required:
-- 
2.52.0



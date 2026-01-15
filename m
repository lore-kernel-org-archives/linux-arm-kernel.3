Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94D7D4116C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EX2/pdJmOHGJyOPWOoO/jYiC22gEmhP8fRpbvVz1tbA=; b=0zp/SiEU5NmEfbqZknseVZwXY4
	EvozT2R1IyYAUy4lui0f8sL8gWI/Slj32mR3pFcwlfqOv6YIhstTjj+Lh2G15t7Awp2CoLxNs+0kt
	6CcNq1eMWj0GpaqTXccI5r+LjVQjR80oi8sij6W749BHW7IT7ORVwBamFwXnQif7ibk48bqxCXtff
	ruUhJft7aPVSlFlAlhxsJ95jvS1k6Jf6Rf5dWjBvqjyzkIjuyqcKjS7JEHcPFmjtRGl9dw4Nok+dE
	Zr7qebHPCLTCMu1Qe/SyhdsNiEN5HKwL1RrJpnhtehHIAdiNNy1KNhfZf92IJtzF4gl1JOGDJgF/F
	H7j9X9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLLU-0000000CCse-30mj;
	Thu, 15 Jan 2026 11:16:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLLS-0000000CCrp-1CU8;
	Thu, 15 Jan 2026 11:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768475810;
	bh=gDZnxx6q0qOAWO0hBNhp6yUK/DLiEBqTd5LIFfrJ1sQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gTE6zypqItfbmjm4GsreCssgWqf+84qPC4TokgTWJNKpwq5RYs5tHiEH3uJn/m99u
	 AH8FwNMvh1YyfIWI/e2MusG9Djm3r6VBt/kXeR6jfYjiSWu+F0gYX2M20ZicFEK680
	 0u0w4kedPWkziui13uMLqPQWmBJOIDj3whkJRnySwQvPozQ5pQh4O8G+2ABsWhZE3y
	 cxukh4oKq8JUJxKdQPzTM6LvMKqT5JEdYZUj4MmNjiW3YRsH1RYzZc/sLCMWXnXibJ
	 ymJ35HYNQasnzrxYo96OvH82COZ8Hs4YMvhpFGZFOhrmDPriEA6S/FHmj1DplKK1n8
	 Ef25U81+5sVXA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E019717E10C8;
	Thu, 15 Jan 2026 12:16:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	olivia.wen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
Date: Thu, 15 Jan 2026 12:16:45 +0100
Message-ID: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_031654_483498_10073060 
X-CRM114-Status: UNSURE (   9.13  )
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

Even though the MT8188 SoC's Dual-Core SCP IP is practically the
same as the one found on MT8195, it doesn't have a dedicated L1
TCM and relies only on SRAM.

Set reg/reg-names minItems to 1 globally and override it in all of
the conditionals for the SoCs that require more, and then split
the mt8195/8188 conditionals to allow specifying only the cfg MMIO
on MT8188.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
 - Fix dtc warnings and validate again

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/remoteproc/mtk,scp.example.dts
  DTC [C] Documentation/devicetree/bindings/remoteproc/mtk,scp.example.dtb
Done.

 .../bindings/remoteproc/mtk,scp.yaml          | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..f0cae3e4bc78 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -185,7 +185,7 @@ allOf:
     then:
       properties:
         reg:
-          maxItems: 3
+          minItems: 3
         reg-names:
           items:
             - const: sram
@@ -196,11 +196,22 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
-          maxItems: 2
+          minItems: 2
         reg-names:
           items:
             - const: cfg
-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0847CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1piNjmrlWSwikIHnqy+RsZoVhgioTg2emaClTHlJItE=; b=O5CkUsQfCaLV319CZSLBNC885O
	POo1GG81WA6RZ2p8xR6TjD6onwvM4GpspqKGYVYVYOjy7JD0rBN1A8H99uepY2tZrkR2nt6LnNwou
	ShQ47BUlwB3Re3iGMIIeNGsvwsmTX1R1uCF4Whal9CyR3LshFyiBp++zhDhn8laxEBgf2JJGyyCC0
	U5CaXSaa1zJol4UQJ0uY94iAJGS3PuEgkvu5Q2089oj+n1ddi0WzUM1zb20dxRCg+OiCGEfn87bgH
	py/TH1KQlO9qz0dpXo8nXj+Z8ntZ5/wMYiEnJZ2Opmt51QScijKI62PpUt0y+/41peLigbuh23Es0
	uJS1vEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf4Z-00000004RmX-0RmY;
	Wed, 20 May 2026 11:26:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf4W-00000004RlP-3sqk;
	Wed, 20 May 2026 11:26:46 +0000
X-UUID: c4cff374543e11f1afed4741b24580c9-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1piNjmrlWSwikIHnqy+RsZoVhgioTg2emaClTHlJItE=;
	b=LN20goIK3JgYnXxlMPdzdH6bYrvYZJEVLJxKPeyzmRgqbGFIEuCI6v4kAVw0pBFz/6ChRXNuL3r8ATRkmEgtmGgoIs0skvGNzpRg+Hu3xDDyDdnk6X/xgbQ1o9FRrhXYgU/QgGViwt+dc/WiPVLofD0nIw8aQklGgP6y8tQDOIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:fbff9736-af0d-47bd-8d41-a72721cc6acf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:08752b46-e650-4d81-a877-d298d8f44b5d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4cff374543e11f1afed4741b24580c9-20260520
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 721780380; Wed, 20 May 2026 04:26:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 19:26:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 19:26:36 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v4 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Wed, 20 May 2026 19:26:29 +0800
Message-ID: <20260520112629.3420612-2-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260520112629.3420612-1-arnab.layek@mediatek.com>
References: <20260520112629.3420612-1-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_042644_969470_68CA1234 
X-CRM114-Status: GOOD (  11.11  )
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

The MT8188 SCP can use either one or two reserved memory regions:
- Required: Main SCP SRAM memory region (mandatory for SCP operation)
- Optional: SCP L1TCM memory region (Level 1 Tightly Coupled Memory,
  used for performance optimization when available, but not required
  for basic SCP functionality)

Other MediaTek SoCs (MT8183, MT8186, MT8192, MT8195) use only a single
memory region and must remain restricted to one region for backward
compatibility.

Update the base schema to allow 1-2 memory regions (minItems: 1,
maxItems: 2), following the pattern used by other MediaTek dt-bindings
like mediatek,vcodec-encoder.yaml where the base property defines a
permissive range accommodating all device variants.

Add two conditionals:
1. Explicitly restrict non-MT8188 devices to maxItems: 1
2. Document MT8188's two regions with descriptions (minItems: 1 makes
   the L1TCM region optional, allowing boards to specify 1-2 regions
   based on hardware configuration)

This approach maintains backward compatibility while enabling MT8188 to
specify 1-2 memory regions depending on board design and performance
requirements.

Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..fca9b0675eae 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -55,7 +55,8 @@ properties:
       initializing SCP.
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   cros-ec-rpmsg:
     $ref: /schemas/embedded-controller/google,cros-ec.yaml
@@ -123,7 +124,8 @@ patternProperties:
           initializing sub cores of multi-core SCP.
 
       memory-region:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
 
       cros-ec-rpmsg:
         $ref: /schemas/embedded-controller/google,cros-ec.yaml
@@ -205,6 +207,45 @@ allOf:
           items:
             - const: cfg
             - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8183-scp
+            - mediatek,mt8186-scp
+            - mediatek,mt8192-scp
+            - mediatek,mt8195-scp
+            - mediatek,mt8195-scp-dual
+    then:
+      properties:
+        memory-region:
+          maxItems: 1
+      patternProperties:
+        "^scp@[a-f0-9]+$":
+          properties:
+            memory-region:
+              maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        memory-region:
+          minItems: 1
+          items:
+            - description: Main SCP SRAM memory region
+            - description: Optional SCP L1TCM memory region
+      patternProperties:
+        "^scp@[a-f0-9]+$":
+          properties:
+            memory-region:
+              minItems: 1
+              items:
+                - description: Main SCP SRAM memory region
+                - description: Optional SCP L1TCM memory region
 
 additionalProperties: false
 
-- 
2.45.2


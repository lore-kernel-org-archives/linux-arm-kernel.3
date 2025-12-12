Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC9D43365
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oF16yjec0U2hPWO234TiLbnbeacjQRJiyg4yfuPwCmk=; b=bxPKL0L7Z92XVCIJ8t7365hykJ
	4OuO//6HUZGMRgdqg/286uk/uSX9Dkj1LQiSN5C9G8gpKA01iSkZeFrnAWIuJQIxNB1xnU7ndldtK
	CvIySQziZoiKVyEVAoj9ODkxJq2uB7zyf13GdY7OwRuS1ZrxVvgjGeR9TtBmG7Y7maGnOyy8bcBo+
	Rlt8wOJzHHlupQqN39IoXLNe6wrSoKs2fpSNiajn0dQEDSlrYK1VxBR8C0rdI8dYMIspxT+2seUaj
	lSNkA0XbIixoxxUpY72GRWCvmqSXFSYMmx+XpRdcAbB28dvmmVWrDTGO+4UI6hEwjXcwzKs+1Wo+A
	gmeOEJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsNs-0000000HVNy-1cQZ;
	Fri, 12 Dec 2025 01:55:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsNq-0000000HVMq-0u4P;
	Fri, 12 Dec 2025 01:55:51 +0000
X-UUID: ac6b71aad6fd11f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oF16yjec0U2hPWO234TiLbnbeacjQRJiyg4yfuPwCmk=;
	b=JAKG7Qa/dwisk5SURwRqDWSrhYi8ypeUXKy3KPp/+GGrKb6v+XI5yhiHT8XXS8DMHtq/QHDCe3ReuJr+knHVKNUYswdcGkoc3A0Euj5TB85V7eSWibyF3K8ysiOXxHP/BB8JZbhxBX9pEO3gGK2SHJOaq6cKIPzjylMXKzOo8Nw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ef270a5e-b8df-41c0-9647-3318d3e20eae,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a6f419aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ac6b71aad6fd11f09f706fa2197c6ceb-20251211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 285107495; Thu, 11 Dec 2025 18:55:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:42 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH 2/4] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Fri, 12 Dec 2025 09:52:16 +0800
Message-ID: <20251212015218.4689-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251212015218.4689-1-jianhua.lin@mediatek.com>
References: <20251212015218.4689-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_175550_257670_C1758638 
X-CRM114-Status: UNSURE (   9.23  )
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

Compared to the previous generation IC, the MT8189 uses 34-bit
iova address-space. Therefore, add "mediatek,mt8189-jpgdec"
compatible to the binding document.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 46 +++++++++++++++++--
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..935a908465c8 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -19,11 +19,15 @@ properties:
           - enum:
               - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
+              - mediatek,mt8189-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
-              - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgdec
+          - const: mediatek,mt8189-jpgdec
 
   reg:
     maxItems: 1
@@ -32,13 +36,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    minItems: 1
+    maxItems: 2
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
 
   power-domains:
     maxItems: 1
@@ -51,6 +58,35 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-jpgdec
+              - mediatek,mt2701-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec-smi
+            - const: jpgdec
+
 required:
   - compatible
   - reg
-- 
2.45.2



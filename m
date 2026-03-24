Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4502CE9A755
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fBSZMb7Iwfd/5tDgwiZaN3Gwe32gMWlhzgFDOwLlKY=; b=bvAbUSS3l1hDEgbvnrCnJBXlfv
	NsMz3D//g/OelziXL5IFjgKV63V2dR4MAY58iST/t4X/rhVYRL8F7FzAriHt7ZiBKovRhIDLCDtM2
	jf85a7XRoXnIIxF/8aH59AKqaZtUA43AClfAov6r1/ZoSBa+3oMrIIFWQeAOAuuYx77p6NvuMpKtY
	8+xFZwCoEKJH3A8QBteX5FpqSuevCK+mbjLn1V8IxRZcqOt0xca/D2E9aHfv7w4/+MRF4pE6wQATl
	ESkaal4MvNPiZYddfFLOGNpDj70cXVm+OS4mw0king/sdVil4oz6Mm2YhemgRhxrnz8pYqoXOQINB
	FSwoR76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUY-000000019W1-3oKh;
	Tue, 24 Mar 2026 09:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUM-000000019PF-0Wi3;
	Tue, 24 Mar 2026 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/fBSZMb7Iwfd/5tDgwiZaN3Gwe32gMWlhzgFDOwLlKY=; b=Si3dMtZrQDMtJ1CeC2ofeALEPE
	RyfOgKwN+as1wDrEls8hD7G1x5wCrr21g9VQKknQ4mVX0j6nnfFzsbZZGusoHsRfTb8KZaYDAgOlu
	lDl988SM32j1/Si0R588IdIzUieosfi2vmDBSuPqow9s1ytbQrkcHK64F7Q0Z1tpgmDe5pOUZAgqg
	d6AHipRN1t+X5Jxcp7FbRltl/H6BdsVJ0hfJavOji4/S2i++4Wuwg+teqoTW1R4NKBu+8D1OxjS8v
	hQ3alg30RBCY2CFDmy7h2cj+o/0KK7QnYodLkZA4EY+wVZms5AcuR8s+67hoU3SGBmTIdlVttIIdI
	sN9DP9Vw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUI-00000003iLD-0K2H;
	Tue, 24 Mar 2026 09:55:52 +0000
X-UUID: 9906d450276711f1a6de359d7043e138-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/fBSZMb7Iwfd/5tDgwiZaN3Gwe32gMWlhzgFDOwLlKY=;
	b=SyFfQfjbH+EqHN0UKCfYmciNbKRiNlJBwcb02ZwYk5hvjyLUN2Oq5Z+gNgXS/7zXL4MCmaKgVnBnpFfEA2M3APHWSfYOVyL6znrrBEI1x7cWfwqK6TZG+uf3t1ZcHXvwY1MqNJdKguueg+Wy/yK8RbgBo3yhs1iaOKoohvfDE6o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d54fd357-0b66-4cfe-bd43-240f08e0178c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:5ac364e0-cf51-4058-942d-ef4f058f9afa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9906d450276711f1a6de359d7043e138-20260324
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 604977717; Tue, 24 Mar 2026 02:55:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 17:55:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 17:55:29 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Tue, 24 Mar 2026 17:54:53 +0800
Message-ID: <20260324095455.1437-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260324095455.1437-1-jianhua.lin@mediatek.com>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095550_555665_F3917381 
X-CRM114-Status: GOOD (  11.43  )
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

Add the compatible string for the JPEG decoder block found in the
MediaTek MT8189 SoC.

Compared to previous generation ICs, the MT8189 JPEG decoder requires
34-bit IOVA address space support and only needs a single clock
("jpgdec") instead of two. Therefore, it is added as a standalone
compatible string without falling back to older SoCs.

Update the binding schema to include the new compatible string and add
an `allOf` block with conditional checks. This enforces the single clock
requirement for MT8189 while preserving the two-clock requirement
("jpgdec-smi", "jpgdec") for older SoCs.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 39 ++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..91c9b2a4687b 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -17,13 +17,14 @@ properties:
     oneOf:
       - items:
           - enum:
-              - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
               - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
+      - const: mediatek,mt8189-jpgdec
 
   reg:
     maxItems: 1
@@ -32,13 +33,22 @@ properties:
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
+    oneOf:
+      - items:
+          - const: jpgdec
+      - items:
+          - const: jpgdec-smi
+          - const: jpgdec
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
 
   power-domains:
     maxItems: 1
@@ -60,6 +70,25 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgdec
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.46.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A2C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBckLV6jNByzkSdMQw8AHIGDrw+A/A7qK4UW3zfX+Kk=; b=hGsKjEv2AvFr8eNv/GmX3Wd13p
	3tb0TpYRHwRh/VkTYcNJmbPPGk3l/t+Tw8h7tSkpQVImxeAJG4FaT2AyinvrKc66cV22mQtMUPzk5
	9aGoDGAuH2+fTxSmMi9vGBd68rfWpmtjBArpzX3XbKLIN+IrHv0zhW3FgkHcVuDj/cBdi69idrj5N
	bQGJiilgrAAtDZBnXvERURtTmGOf7rNOZ15R0qGBLD6xDl9Z8Gf2Bugj/HwZaO9hGRXIhFNWBAiM1
	4jdOl12wc43kMa5qLnnsikBkDPdlsl08S8lR4uG2n4+RxeFCKkSl/PgwYfBe2OzEHWvw3Mb5bW3o6
	CiCGrvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0VY-00000003FnY-0WbU;
	Mon, 16 Jun 2025 03:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR02N-00000003Cw9-0XWJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 02:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VBckLV6jNByzkSdMQw8AHIGDrw+A/A7qK4UW3zfX+Kk=; b=Om4D2VN92cUGQ3c/f176qsYCXm
	3wb9GLI8VRG+ElstE93H1tX12YYDGD0KzGJJccJCIluJY862QPy+JsRKrKP9VNhGl7dBM+vyaONl1
	n3obIUlHliCvJppqrsyGQLdmLhIklStBpYEW3KHPMi4LpqoNSctm1gMzYAnOGtQI0h8sKAMDuTkjt
	aP1aGB/FxiOBspmBWFN1YvK2fuv38Yt3UN1bbTrIzRRH4lKw87bp7v783SIXW7fEnnkLLrXXvzRV5
	s1+bcmqRSINVizpcoNIadA0r/BPW/QLqWzPQzyGpnLfE8ClWloQXDVxM8R/XDqlgWraKBHevwuXH+
	qQKxyhJg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR025-00000003TVp-1KN8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 02:57:19 +0000
X-UUID: 858726884a5d11f09f706fa2197c6ceb-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VBckLV6jNByzkSdMQw8AHIGDrw+A/A7qK4UW3zfX+Kk=;
	b=lF+ViI/Q55Q68ANrrcMRpas9q+fzGc4+qK7bItFPOojM6rJTXxnLHkMgLRojTMmCUrhN9mpNykZ8z+GmelHdJ1p7tpkqAkNL2ahA5yeFeGVQyx574RJp0xgRVPt+e0ZCSP28KeG30ZdK3mjmzv1fVo0jA7ZBzmgRkgwbs8w189I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:fe324a1d-9c95-4b75-920d-ef8fe25e30dd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:b893b703-0d95-4f6b-a95f-3c560ebcf3ab,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 858726884a5d11f09f706fa2197c6ceb-20250615
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 984824708; Sun, 15 Jun 2025 19:56:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:33 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 1/8] dt-bindings: iommu: mediatek: Add mt8196 support
Date: Mon, 16 Jun 2025 10:56:07 +0800
Message-ID: <20250616025628.25454-2-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_035715_398384_A6A68617 
X-CRM114-Status: GOOD (  10.20  )
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

1. Mediatek has its own implementation for wrapper interrupts and
power management. Add the SoC specific compatible for MT8196
implementing arm,smmu-v3.
2. APU SMMU need wait until its power is ready, thus add a phandle
smmu-mediatek-parents to its power node.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 .../bindings/iommu/arm,smmu-v3.yaml           | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 75fcf4cb52d9..c9a99e54de69 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -20,7 +20,12 @@ properties:
   $nodename:
     pattern: "^iommu@[0-9a-f]*"
   compatible:
-    const: arm,smmu-v3
+    - description: MediaTek SoCs implementing "arm,smmu-v3"
+      items:
+        - enum:
+            - mediatek,mt8196-apu-smmu
+            - mediatek,mt8196-mm-smmu
+        - const: arm,smmu-v3
 
   reg:
     maxItems: 1
@@ -69,11 +74,28 @@ properties:
       register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
       doesn't support SMMU page1 register space.
 
+  mediatek,smmu-parents:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SMMU's power node. The SMMU should wait until its power
+      is ready
+
 required:
   - compatible
   - reg
   - '#iommu-cells'
 
+allOf:
+  - if:  # for SMMU need to wait its power node
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-apu-smmu
+    then:
+      required:
+        - mediatek,smmu-parents
+
 additionalProperties: false
 
 examples:
-- 
2.46.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE19CCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzRjl0wuxO05mFaAmxgC9m8FQ896f26iiNfacinIM/I=; b=UahLfci7IIWEuE67SZUlSGwWKU
	2LfzCTU64b5fczvoQRTchdc22xPMFlpw2nolF6n+6kyjZzcyUVhU2azzakkYqwdNaDGdufZUSGdf8
	7oVAXu2ANjbx132IxdZd7R7W3vW4ZVBDAnaLCB1YZRD4DHmWV39c8r5NNPIVGCPd/4qKyu/jfTtS1
	Qty4L35ve+Jo4AMmPQigya9mBiujo+hrAQMyh7Nlrhhlh2q7v4n0A21VUtfs8Ro7Oi88dHJhGZnr/
	Ur2iyyor2J2aIHzrKSETahUdUzb1fRjqFxVqWGg+W2PBawyQQ4o7BtGkazAgvTKOyfctqcZEDFrpY
	e7N8UZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqwq-0000000BE9R-2lIQ;
	Wed, 17 Sep 2025 12:07:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqwk-0000000BE4k-432J;
	Wed, 17 Sep 2025 12:07:40 +0000
X-UUID: e3305e1c93be11f09eb0dd999d3936bf-20250917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RzRjl0wuxO05mFaAmxgC9m8FQ896f26iiNfacinIM/I=;
	b=jHbDbfflYFXVLDYswj9M4IoMedHtwugDjp3yJh8LhZe3ZhuCofXWoE0pcq5FOAFi+uEZmLxK5hPpiQ8TYcWUWzRS7FHlyI1t/Qb6HP6QDKqE7KL65ISWs59gGqBlFabeAjAM22UALiXm2/MqwyDieVhtcBZtUL8+i4+TK6yiHzk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:7c0b0f2b-8746-40c4-82f3-f2063f38d21e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:c69566f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e3305e1c93be11f09eb0dd999d3936bf-20250917
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 938536249; Wed, 17 Sep 2025 05:07:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 20:07:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 20:07:27 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 1/2] dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
Date: Wed, 17 Sep 2025 20:07:16 +0800
Message-ID: <20250917120724.8650-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250917120724.8650-1-friday.yang@mediatek.com>
References: <20250917120724.8650-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_050739_005516_BC51E2B8 
X-CRM114-Status: GOOD (  11.06  )
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

Add 'resets' and 'reset-names' properties for SMI LARBs to support
SMI reset operations.
On the MediaTek platform, some SMI LARBs are directly connected to
the SMI Common, while others are connected to the SMI Sub-Common,
which in turn is connected to the SMI Common. The hardware block
diagram can be described as follows.

             SMI-Common(Smart Multimedia Interface Common)
                 |
         +----------------+------------------+
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
       larb0       SMI-Sub-Common0     SMI-Sub-Common1
                   |      |     |      |             |
                  larb1  larb2 larb3  larb7       larb9

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../mediatek,smi-common.yaml                  |  2 ++
 .../memory-controllers/mediatek,smi-larb.yaml | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..3d98c08b2149 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -40,6 +40,7 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8188-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..fc5feb2eac1f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -70,6 +70,12 @@ properties:
     description: the hardware id of this larb. It's only required when this
       hardware id is not consecutive from its M4U point of view.

+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: larb
+
 required:
   - compatible
   - reg
@@ -126,6 +132,19 @@ allOf:
       required:
         - mediatek,larb-id

+  - if:  # only for image, camera and ipe subsys
+      properties:
+        compatible:
+          const: mediatek,mt8188-smi-larb
+        mediatek,larb-id:
+          enum:
+            [ 9, 10, 11, 12, 13, 16, 17, 18, 19, 20 ]
+
+    then:
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false

 examples:
--
2.46.0



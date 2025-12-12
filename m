Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15950D43368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDC7m+06mQh8yQh6GlFbl6oC9uWmVHm9kFi/RDwNFDs=; b=4frwVUaYuDWQCxhMEttlSJkSCm
	gbELztccY34ZldgJ+TBMOzv8pSK44jyiAVlDC4XvaDXUMLfb2nckQIpg/5gJjBdqa94MmwXimQnEX
	nnBTbPiV/0YQUaauAAK9wmnPJAdpVBfww20b8n6LgSNGA8y9JGmvn8gWD/ZQliUM2gJkwEWCnDDLO
	mOUxtVXuKmQIncsIWiN1amps3IO077FGEB4eCqNVHOSu6AkxKFzMgJXZYVNCypHE85df1pXf7ziPT
	pdi2xrSDKYOJ9+pK8NjyssPV9RWh9In5xOKM8PDSlM3SPknqJ5NYxXGSXldHKD48guWcDh6cDmYgW
	3FbKFnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsO3-0000000HVT5-0pvA;
	Fri, 12 Dec 2025 01:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsO0-0000000HVRW-0qQ1;
	Fri, 12 Dec 2025 01:56:01 +0000
X-UUID: b28ddd20d6fd11f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jDC7m+06mQh8yQh6GlFbl6oC9uWmVHm9kFi/RDwNFDs=;
	b=mfOjvhgi0wiffoRDzUxRKbcqIsx0g2CYTR1gt310auIeEc4AyrfNOu+Pr7/5BHeEqKfm0FDm3JWCesYA7SDrPJWJQi2lgFCxCZtnFBe3gj1QapZgJ+D4BmiVxk9Np2ipMR5pC1/5FunIGsFEsDeIq+3uj/zXLmtuiqMVOXbYHlk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0c5cc8b3-aba8-4264-9711-3d3df950beb3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:56dead02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b28ddd20d6fd11f09f706fa2197c6ceb-20251211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1658835036; Thu, 11 Dec 2025 18:55:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:52 +0800
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
Subject: [PATCH 3/4] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Fri, 12 Dec 2025 09:52:17 +0800
Message-ID: <20251212015218.4689-4-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251212015218.4689-1-jianhua.lin@mediatek.com>
References: <20251212015218.4689-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_175600_253571_ACB157FE 
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

Compared to the previous generation IC, the MT8189 uses 34-bit
iova address-space. Therefore, add "mediatek,mt8189-jpgenc"
compatible to the binding document.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..3044c7fc5c18 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -14,13 +14,22 @@ description: |-
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt2701-jpgenc
-          - mediatek,mt8183-jpgenc
-          - mediatek,mt8186-jpgenc
-          - mediatek,mt8188-jpgenc
-      - const: mediatek,mtk-jpgenc
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mtk-jpgenc
+              - mediatek,mt8189-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt2701-jpgenc
+              - mediatek,mt8183-jpgenc
+              - mediatek,mt8186-jpgenc
+          - const: mediatek,mtk-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgenc
+          - const: mediatek,mt8189-jpgenc
+
   reg:
     maxItems: 1
 
@@ -34,6 +43,10 @@ properties:
     items:
       - const: jpgenc
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
+
   power-domains:
     maxItems: 1
 
-- 
2.45.2



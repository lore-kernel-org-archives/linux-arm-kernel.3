Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D9C624C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+vdg/ANl9hM4UoEQDU2MPAZDj4pi2+lQdUsMylOutY=; b=4Kbv4MTZPtgeFK66FVOfD0ZJLr
	RTro6Vl+4iwLgnX7gAyIQIwAnSga+PMorPVcRPo3uaJnIZWxYPoQlCmh1LILEp0w+4+mDnnDYcPNG
	lrNcG3g+GkmdSN0LRQpkYyfUXc3Dv4CLvgeFDYMTtE0O0VvmVde7hAiKmfCpeU1PotBdoY6YkF/N/
	em0PJH/iguCSvHYD6cZGUejk6mzYzy4Sfr6FgdAE+ic8iGYpbqqcJLCrTVmGy0pZo+73HpbNRkO+r
	ePozRnIVt6BEu277f3ePhBlpspXLo0oHt4+qHXGRrcHFLTb3tqDzh3UFo+PIR9Kh8JzaukX2GJy0d
	V12t7H9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vsK-00000008egd-3PUZ;
	Mon, 31 Aug 2026 06:52:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vsJ-00000008eg1-2aEo;
	Mon, 31 Aug 2026 06:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29AE9439ED;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0337BC2BCF4;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788159131;
	bh=qMmsDNh6HE/JXh1j0Z6LUrZIrSkIc8Sgl8/m315HZEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PRrjnjTQ0gmGnSF9CISiNkhi9sxOiG4x6A8RBhyNcsgRYvF3dxNqSomdA19ocHgId
	 nQhjuMARfVNOySevWpgmfgPVGa+gRfxZqvEnTsCJ83rk54XbnBo4EXMfe7Bg2FvrTl
	 vy2ejKyQcmhr37GlcIGbrtmWH0u/pQ4vm4kMmB0XCmvT/1eYZOptBpHpVGDWOJQDfn
	 jU9zPBThACiaUXM10PgtzCvs/1/i0BslUIuk78gMrz0SG0S4MzlLz8YuVEjOIEpg+e
	 jCbq9+Z+h9y61e6tM1iYZ6tOwF2qGVNXAXvi735s7e6TaMum98+LHmRhn2/YhpzVYm
	 WyQDy7kPwGnTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4A1C61DD3;
	Mon, 31 Aug 2026 06:52:10 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Mon, 31 Aug 2026 14:52:06 +0800
Subject: [PATCH v4 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-8189-smi-support-v4-1-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Congcong Yao <congcong.yao@mediatek.com>, 
 Zhengnan Chen <zhengnan.chen@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788159129; l=4285;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=ZF8KkSLsu9zOPR4yaUhFcqIyHzmeP14MmlF5WXU/Mkg=;
 b=w6tfEJj1nGx+w3aW53I4RyfZzi8umc3Td7D9o1Y6YQHDeHdqJubX3vaGIgAmy9Dh5dBMIMxbB
 pO8Ok1iYfGKCUOC37ZrtK1ChYIzqbXUXBjTtYwYuhx1pYG++/8MR9dx
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
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
Reply-To: congcong.yao@mediatek.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add the SMI LARB, common and sub-common binding descriptions for
MT8189.

MT8189 adds an SMI sub-common block. Document this topology in
mediatek,smi-common.yaml.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
 .../memory-controllers/mediatek,smi-common.yaml     | 21 ++++++++++++++++++++-
 .../memory-controllers/mediatek,smi-larb.yaml       |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..33c989f7fc33 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -16,7 +16,7 @@ description: |
   MediaTek SMI have two generations of HW architecture, here is the list
   which generation the SoCs use:
   generation 1: mt2701 and mt7623.
-  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186, mt8188, mt8192 and mt8195.
+  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186, mt8188, mt8189, mt8192 and mt8195.
 
   There's slight differences between the two SMI, for generation 2, the
   register which control the iommu port is at each larb's register base. But
@@ -25,6 +25,21 @@ description: |
   SMI generation 1 to transform the smi clock into emi clock domain, but that is
   not needed for SMI generation 2.
 
+  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
+  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
+  In this case, we use a smi-sub-common to merge some larbs.
+  The block diagram something is like:
+
+                          IOMMU
+                           | |
+                       smi-common
+              ---------------------------
+               |          |           ...
+              larb0   sub-common      ...  <-max number is 8
+                   ----------------
+                    |     |    ...
+                  larb1 larbX  ...  <-max number is 8
+
 properties:
   compatible:
     oneOf:
@@ -40,6 +55,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
@@ -157,6 +175,7 @@ allOf:
             - mediatek,mt6795-smi-common
             - mediatek,mt8167-smi-common
             - mediatek,mt8173-smi-common
+            - mediatek,mt8189-smi-common
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..9a5dafd7c07e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
           - mediatek,mt8188-smi-larb
+          - mediatek,mt8189-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -85,6 +86,7 @@ allOf:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
             - mediatek,mt8188-smi-larb
+            - mediatek,mt8189-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -119,6 +121,7 @@ allOf:
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
               - mediatek,mt8188-smi-larb
+              - mediatek,mt8189-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 

-- 
2.43.0




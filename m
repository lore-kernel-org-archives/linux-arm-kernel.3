Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VB/PnLSy1Qmjr5GM8tF6ove7cL99TMo7OZ29mqGEy+A=; b=M/OE0LyDHaEhx6AC5iCLgtH/GZ
	wDJIfG/jfmOeQCKWjB32NJRCCGlDhhoBSWe4yHGCVj1SlxeixCPkwRTslbPxYDAtnViKPpP16Jpai
	v1/YTP34RWQy8ZkaOMyDIHhASzHshCaGi6PqAFtsaHNQAP0OYf2xY/9BrE81+/wf2EsnbDlfx1aiV
	4gLadjrTI7MBUzA+c8qZZidSVEQvoS6yksO7yoA0WZVIs4ExiAkHQB0m3a1aMRHi5jK/j2rB210KW
	XVzVVeOCUTLCTsu10Bk3bZ2Kyx7wCBH5j2y93CDGk+MyKNKyyvFlKqxIZ3lXbDooa8t3eGMT+67jw
	IzqwJ9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Cy4-00000006y1x-1TSi;
	Wed, 23 Sep 2026 02:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CxD-00000006xTr-0Ij3;
	Wed, 23 Sep 2026 02:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VB/PnLSy1Qmjr5GM8tF6ove7cL99TMo7OZ29mqGEy+A=; b=GGWuTbei4JpTAR/d2UnKVqmV7U
	zX6+hJCenN6WQF+avZ/Gk6NWP7C+78K2Ost1xOTENJdhzMy6jzhNHmWmcJcdZCiHjFHWeHH0/IrYa
	jlNehBowPs5HD/mgCgyED/siGpw/2iN7Lx2Qvber8/KiqhO670rki8FfK8QHAm4m4m+QjwddRdcvm
	eCa01FgUh7DYjwvnFa07B21gY6gMNzQXpDL7kVhi/dvjCgOwvCTcByw7zWvTXwFCqzaQkh5N6GbOL
	PWV22JCT1ZKbHERd5xdn1KmldLVgyI1QKpo55dVddaUBLLtCKecMBVLSvU4+IihwZIcHXhRrxx73D
	WCMzNK8A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Cx9-0000000EIAU-3ped;
	Wed, 23 Sep 2026 02:43:25 +0000
X-UUID: 87ad22f6b6f811f1afed4741b24580c9-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VB/PnLSy1Qmjr5GM8tF6ove7cL99TMo7OZ29mqGEy+A=;
	b=aMm4x5rfE/pn5k0VSFy1EtfmZAQgt5ue4ZhulMQY/m3gJRqQxSW69uNCxvdRhz8IWNVBY2mqJCCI4/ncT7Yw7mTpEFrH2frenE5PboF8Aw842cs7oLx0UHBxYO4IjI1zZrEAW1BOXaE6WBpqN6bQh2jv8ItiZ+tnDtVDCqJeDjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:567cd535-a6eb-464a-9ee5-b8a272de4381,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9ab58794-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87ad22f6b6f811f1afed4741b24580c9-20260922
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1660965234; Tue, 22 Sep 2026 19:43:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 10:43:14 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 10:43:12 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 08/14] Add the MT8196 compatible string to the MediaTek vcodec subdev decoder binding.
Date: Wed, 23 Sep 2026 10:42:51 +0800
Message-ID: <20260923024258.257846-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923024258.257846-1-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034324_466095_8CFE65A4 
X-CRM114-Status: GOOD (  11.63  )
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

Compared to previous ICs, the MT8196 supports a 10-bit decoder
and has a decoding capability of 4K@120fps. It also supports
36-bit DRAM IOVA address and Video Power Control to optimize
bandwidth and voltage usage.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d1d209cbb..618be8c52 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -76,6 +76,7 @@ properties:
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
       - mediatek,mt8195-vcodec-dec
+      - mediatek,mt8196-vcodec-dec
 
   reg:
     minItems: 1
@@ -96,6 +97,12 @@ properties:
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The node of video companion processor (VCP), using
+      the remoteproc & rpmsg framework.
+
   "#address-cells":
     const: 2
 
@@ -163,7 +170,6 @@ required:
   - compatible
   - reg
   - iommus
-  - mediatek,scp
   - ranges
 
 if:
@@ -179,6 +185,48 @@ then:
     - interrupts
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-vcodec-dec
+
+    then:
+      required:
+        - mediatek,vcp
+
+      properties:
+        mediatek,scp: false
+
+      patternProperties:
+        '^video-codec@[0-9a-f]+$':
+          properties:
+            compatible:
+              enum:
+                - mediatek,mtk-vcodec-core
+                - mediatek,mtk-vcodec-lat
+
+            clock-names:
+              items:
+                - const: sel
+                - const: vdec
+                - const: lat
+                - const: top
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec
+              - mediatek,mt8186-vcodec-dec
+              - mediatek,mt8188-vcodec-dec
+              - mediatek,mt8195-vcodec-dec
+
+    then:
+      required:
+        - mediatek,scp
+
   - if:
       properties:
         compatible:
-- 
2.51.0.windows.2



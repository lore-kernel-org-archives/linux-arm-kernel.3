Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187F0CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3VPvRSdYuSWm5k/oAdKI8FbgeswWe8hFqnm53gZ7iY=; b=IUHoKusBcj0o9Z5YmMzT5cdEFn
	iWNyjA7vhtuXr2GTTfh61kmMUEZ/nAkZ8ahoFUh/MrH6YOmthHhH03l34XOcNLPrXnXVfAEtij3c1
	jOi6MCN2ydtMQFznyoxXkfcD2b6ZxoPNQugwgNQH5X1DdRrXLYlSXSO9yL84sL3epyDPwOQkauoDs
	0pr4JEavyEgyNCyULqnvCVDYN3jCCfRvOuuzYlNV7bOUNFhSpF395bsxEanjy9ijYOIEzI+LAg4uO
	lqeCy/UsuyUmdMYbXTueEV8nudk8Bl0BgJoZ6fciw2D0WGETp7ZGpBbZGMF9sX4KxinVChgVDTSYL
	ijUcuh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7p-00000007dhl-2Msa;
	Sat, 10 Oct 2026 08:08:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7Y-00000007dJc-2FSW;
	Sat, 10 Oct 2026 08:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/3VPvRSdYuSWm5k/oAdKI8FbgeswWe8hFqnm53gZ7iY=; b=MbroaWrrgKF2dQXuMU5WeD2MKA
	aAzzINAxoOR+DVWkqzhIyFnqvvHcPxwRQfcI2XWOdT0+ODMeEBqaItEGcgJswHMe7LL0UK3G1mxsS
	UzYbh7eB5MahXN54nTq6sREPDChB+ar4iwpkiT9nHKPktZAgGU2vgyacJzSFJFjOQ0s0v+o6mm6MQ
	+QLikuC7T0rfEkIAoioRm9S1/7aUra2jVkwV+kJ6RdeuNU5dnvXneVa2btprXxh1d9RmfQRdTt0Ib
	qXLNtnUjAJBzHwpyFLE05elPVC8MsbbYZ9MjFdvx+qcl9tOC002Fiz8IxOcIHbX7YKaN2p9CcYLNo
	b/W/XNkQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFS7U-0000000BvVg-45Qg;
	Sat, 10 Oct 2026 08:07:55 +0000
X-UUID: a7bc1c46c48111f1acbe4559397dec65-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/3VPvRSdYuSWm5k/oAdKI8FbgeswWe8hFqnm53gZ7iY=;
	b=hmcko8UGWDT5n1TerB0lHdwzG8TeUK3eFbYP9cYE9YG7ivjrSS1cA/xqgnrAH1YmlfhuQF7R1b1ovhyX7ozeNU4638dkTflXouAUW9ru04TRPr8fHOoI5YOnPd9owE2Tkafdih+fm0B7b2HmvpG8GiCSPYHe4QQJ8roezhyV6/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:e6789c4e-d4fc-40a6-9b75-445637c573a7,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:291e20b,CLOUDID:c6882e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:97|99|83|106|11|81|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a7bc1c46c48111f1acbe4559397dec65-20261010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1311231139; Sat, 10 Oct 2026 01:07:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU bindings
Date: Sat, 10 Oct 2026 16:07:16 +0800
Message-ID: <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_090753_668737_95FCECF8 
X-CRM114-Status: GOOD (  17.98  )
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

Document the decoder and encoder phandles and describe the dedicated
JPEG SMMU configuration syscon for MT8196.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 16 ++++++++
 .../media/mediatek,mt8195-jpegenc.yaml        | 16 ++++++++
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index 28a9a9b..b1dccc3 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -73,6 +73,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this decoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgdec-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index e2d772e..f099b5f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -73,6 +73,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this encoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgenc-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
new file mode 100644
index 0000000..2bc67a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 JPEG SMMU configuration registers
+
+maintainers:
+  - Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description:
+  The MT8196 JPEG SMMU configuration register block contains the GUSER_ID
+  fields used by the JPEG decoder and encoder hardware.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8196-jpeg-smmu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpeg_smmu: syscon@38d0000 {
+            compatible = "mediatek,mt8196-jpeg-smmu", "syscon";
+            reg = <0 0x38d0000 0 0x1000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cc6a2d0..6e20f06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3164,6 +3164,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
 C:	irc://irc.libera.chat/linux-mediatek
+F:	Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
 F:	arch/arm/boot/dts/mediatek/
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
@@ -16665,6 +16666,7 @@ F:	include/dt-bindings/memory/mt*-port.h
 MEDIATEK JPEG DRIVER
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
-- 
2.51.0.windows.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6914C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NARwVylGfizLd3XVx9Ze8dRNa153/I6PhonXyOONLqg=; b=z9HWJR1ZqSIPaEKXw6ll+hqwvM
	AGRHTkBIdlxluMa11f/4qTQMVMmS/TUk9hFs8EjaDYv3zS/7I3AzKXdfNbIE522WHsfZ1rlURQbw1
	J4bTVBkC0xVf+TO1QoXwF6/Vc9y1FEH2VQxDCmIaCEwN26kZfynkbDR0zknMRG98WSkT53hWeScGL
	jcAPuPcalzOJxXfk6Ipzq7K0+BB70LpK3TwMtpDJsqnqYJsNfpfRCuFWIN0IkDP2cP7jYhjqALzef
	lZc8EhlpkIjXHRcXM7/kVLK62JQMHUqw3hWC+78fB92fWcefV2FtvOY28t9Cr+0YxUG3E0TKVEMEW
	WYEK0w6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8ln-00000001YvQ-1oqE;
	Thu, 22 May 2025 16:27:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7TQ-00000001N8Y-3JpU;
	Thu, 22 May 2025 15:04:46 +0000
X-UUID: 149b0de2371e11f0bed96b30c12bc3d6-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NARwVylGfizLd3XVx9Ze8dRNa153/I6PhonXyOONLqg=;
	b=ld9u9aJjMxI2CVXUVYm4mBW9+b3zVKs4kSnIJ0t6W14rHqyYikUuJ960eirnxE5SdXAGE5aLBT2dfBRLaxuIGLVMImeTCiWcgO90ru+NIZ91vuvQbQNFUfnjDiXbGUYVf9vyVhPFJ30vIpGu0HpcvhFbylDsnWWF5zktgInD3HU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ef4fe0e4-73dd-4c01-b487-1ecb284f64ed,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:8f9bdd57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 149b0de2371e11f0bed96b30c12bc3d6-20250522
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1063282152; Thu, 22 May 2025 08:04:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 23:04:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 23:04:34 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm controller
Date: Thu, 22 May 2025 23:03:33 +0800
Message-ID: <20250522150426.3418225-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250522150426.3418225-1-nancy.lin@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_080444_837241_9708CBCD 
X-CRM114-Status: GOOD (  15.47  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add a device tree binding document for the MediaTek MT8196 VMM (Vcore
for MultiMedia) regulator controller. The VMM controller acts as the
main power supplier for multimedia power domains, such as those used
by display, video encode and decode subsystems. It provides virtual
regulators that serve as the power sources for various multimedia IPs,
and coordinates with the hardware common clock framework (hwccf) and
the Video Companion Processor (VCP) to manage the power domains of
these components. The regulator is controlled by the VCP firmware,
and the operating system signals its requirement through a voting
hardware block (hwccf).

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
---
 .../mediatek,mt8196-vmm-regulator.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
new file mode 100644
index 000000000000..a50e35c2e238
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#"
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 VMM (Vcore for MultiMedia) Regulator Controller
+
+maintainers:
+  - Nancy Lin <nancy.lin@mediatek.com>
+
+description: |
+  The MediaTek MT8196 VMM (Vcore for Multi Media) controller acts as the
+  main power supplier for multimedia power domains, such as those used by
+  display, video encode and decode subsystems. The VMM hardware block
+  provides virtual regulators that serve as the power sources (suppliers)
+  for various multimedia IPs. It coordinates with the MediaTek hardware
+  common clock framework (HWCCF) and the Video Companion Processor (VCP)
+  to manage the power domains of these multimedia components.
+
+  Each child node under the VMM node represents a virtual regulator
+  (e.g., vdisp, vdec-vcore) and must specify a 'regulator-name'.
+
+properties:
+  compatible:
+    const: "mediatek,mt8196-vmm"
+
+  mediatek,hw-ccf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the hardware common clock framework syscon controller.
+
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Video Co-Processor (VCP) node.
+
+patternProperties:
+  "^(vdisp|vdec-vcore)$":
+    type: object
+    description: |
+      Virtual regulator for a specific multimedia domain.
+      The node name should match the supported regulator (e.g., vdisp, vdec-vcore).
+    properties:
+      regulator-name:
+        type: string
+        description: The name of the virtual regulator.
+    required:
+      - regulator-name
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,hw-ccf
+  - mediatek,vcp
+
+additionalProperties: false
+
+examples:
+  - |
+    vmm: vmm {
+      compatible = "mediatek,mt8196-vmm";
+      mediatek,hw-ccf = <&mm_hwv>;
+      mediatek,vcp = <&vcp>;
+
+      vdisp: vdisp {
+        regulator-name = "vdisp";
+      };
+      vdec_vcore: vdec-vcore {
+        regulator-name = "vdec-vcore";
+      };
+    };
-- 
2.45.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D329FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjBoE/eELfGcy+c4cqtV+JxXHfww4jP3U0dh+zL8bEA=; b=oHv/YyKWUJNXG3N9YEnxdz9jK3
	ta4//VOOwtJemcoC/HcRtyDWXrMILlp64tmQcdxO7VBTcmdvT8r0uYLetWry1zHzXz40a2tGaqvzV
	Ce9xNzpF4wKqjpMjO+gPI8Px83LSI+okQdPjJTLKZU1Y0req0biziWGMNZ0y9djPvyRUXxkc687Tm
	7bsu8Uk3zv6s7XbY9NXvPiS8wfgPOQMwb1J8BgKU+IwW6EPf64YiUFp9tuCL599MZpvop0F4Lvyfv
	FeEcnY5eEXEesjIn+u9aT8fhNVWL4vtvSHBxo3MDplDY48EVOsgJluF2xMOh4BB45AB75Br2YdXr8
	kAOMi0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvo-0000000Gl8e-2idr;
	Mon, 27 Apr 2026 11:15:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvl-0000000Gl68-0pHY;
	Mon, 27 Apr 2026 11:15:14 +0000
X-UUID: 57f26b7c422a11f1a6de359d7043e138-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BjBoE/eELfGcy+c4cqtV+JxXHfww4jP3U0dh+zL8bEA=;
	b=u4yKOCo+okjuEMBzPvVm8jfnU0M2kRxI1axXdPPQsg0UjW+jLJ927FFY+VWJsEKXyJC8oPwOJuRZQZPnx3DLv3jVNiRWOYx4a+nKWvp18WFTmKAs9cwkgmvJwgWPT4llHey84RZDLiYyeUUZEeJV0x3Xq+kTIhZ8LMVbBvPQZAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:caac60aa-b11f-4ffc-806e-9b4cc2a52945,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:fc1dab64-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57f26b7c422a11f1a6de359d7043e138-20260427
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1773422070; Mon, 27 Apr 2026 04:15:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:02 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, Vince-WL
 Liu <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 1/7] dt-bindings: remoteproc: Add MediaTek mt8196 VCP binding
Date: Mon, 27 Apr 2026 19:04:40 +0800
Message-ID: <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_041513_294612_7290F924 
X-CRM114-Status: GOOD (  16.04  )
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

Add device tree binding for the MediaTek Video Companion Processor
(VCP), a RISC-V based coprocessor used for video processing and
multimedia tasks on mt8196 and future MediaTek SoCs.

The VCP is a heterogeneous multi-core processor that can contain
multiple RISC-V cores with different hart (hardware thread)
configurations. Key features:

- Supports both single-core and multi-core VCP configurations
- Each core can have 1 or 2 harts (hardware threads)
- Shared SRAM memory space partitioned among cores
- Communication via 5 dedicated mailbox channels for IPI messaging
- Integrated with SoC IOMMU for multimedia memory management
- Boot and power management coordinated with ARM Trusted Firmware

The binding defines both the top-level VCP device (with mailboxes,
interrupts, and power domains) and child nodes for individual VCP
cores (with SRAM allocation and hart configuration).

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 .../remoteproc/mediatek,mt8196-vcp.yaml       | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
new file mode 100644
index 000000000000..8ecb643cbdc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Video Companion Processor (VCP)
+
+maintainers:
+  - Xiangzhi Tang <xiangzhi.tang@mediatek.com>
+
+description:
+  This binding provides support for the MediaTek Video Companion Processor
+  (VCP), a Risc-V coprocessor found on some MediaTek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-vcp
+
+  reg:
+    items:
+      - description: sram base
+      - description: cfg group IO
+      - description: cfg core group IO
+      - description: cfg sec group IO
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: cfg-core
+      - const: cfg-sec
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 5
+
+  mbox-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+      - const: mbox2
+      - const: mbox3
+      - const: mbox4
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Using MediaTek IOMMU to apply larb ports for Multimedia Memory
+      Management Unit and address translation.
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+patternProperties:
+  "^vcp@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek VCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address
+      space for the processor.
+
+      The SRAM is shared by all cores, each VCP core only using a piece of
+      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
+      The size of SRAM varies on different SoCs.
+
+      The VCP cores have differences on different SoCs for Hart support.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,vcp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      mediatek,vcp-core-harts:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Number of harts in this VCP core.
+        enum: [1, 2]
+
+      mediatek,vcp-core-sram-offset:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Offset of the allocated SRAM memory for this VCP core.
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - mediatek,vcp-core-harts
+      - mediatek,vcp-core-sram-offset
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - mboxes
+  - mbox-names
+  - power-domains
+  - iommus
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    vcp: vcp@31800000 {
+        compatible = "mediatek,mt8196-vcp";
+        reg = <0x31800000 0x60000>,
+              <0x31a04000 0xa000>,
+              <0x31bd0000 0x1000>,
+              <0x31a70020 0x100>;
+        reg-names = "sram",
+                    "cfg",
+                    "cfg-core",
+                    "cfg-sec";
+
+        interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        mboxes = <&vcp_mailbox0>,
+                 <&vcp_mailbox1>,
+                 <&vcp_mailbox2>,
+                 <&vcp_mailbox3>,
+                 <&vcp_mailbox4>;
+        mbox-names = "mbox0", "mbox1", "mbox2", "mbox3", "mbox4";
+
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
+        iommus = <&mm_smmu 160>;
+        memory-region = <&vcp_resv_mem>;
+
+        vcp@0 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x0 0x31000>;
+            reg-names = "sram";
+            mediatek,vcp-core-harts = <2>;
+            mediatek,vcp-core-sram-offset = <0x0>;
+        };
+
+        vcp@31000 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x31000 0x60000>;
+            reg-names = "sram";
+            mediatek,vcp-core-harts = <1>;
+            mediatek,vcp-core-sram-offset = <0x31000>;
+        };
+    };
-- 
2.46.0



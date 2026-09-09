Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468B7C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lrBoUhe8c92RFVt7BarrL2vc2hWEd4/QGKzzBwuzow=; b=qBTH9dERa+R6wpMjeVO89Pk0Kz
	m62wZCYvRX4Uf4bPkKXG6/SMWPU/qnUyUbnxmGv8Wjo89a/gl7HKAjcDXqzH7nuMbkWXnLNNffHsC
	uwXfm7X2Ubv7OnrTkRdAV/qzJIlG9GVcR1RwzV6hWRJRHbr/vF6y2+Xvt/up1TqdvkUWEe/pC/Vw2
	FRxMQz7sguGx1hKXKRGwtB0+1yI+uVhJvlh8Iqo2h7Ym1F4X4UJhROXplVsl9g2eFX8Qf5JcrbK3D
	xQxeA+wmmSHWmTTEMuJzhCAUOukUEnKLjjg52Zj0mRo70mf5vPsLgAyQqs4FCKqQGbS9gg7jRLuWt
	SDUXYtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J4J-0000000BvXU-0hEo;
	Wed, 09 Sep 2026 14:14:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J4C-0000000BvRL-1a0M;
	Wed, 09 Sep 2026 14:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A09EA6022C;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4564FC2BCB9;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788963263;
	bh=9/hL1L/RgVcYwPOX97dzhmc2ixM8V+eqpLWH0ghP9Mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HHp3TTjGCsSmUkLNpPve5n1n/X9evKMmtERHHUnOsMQ3AIxGmQbNQs2EEn5BysWnc
	 PJ08B6wBNy2TTEf4OifrpQIwRXXOdxh4mdcOmjKI0vmBQN/ReZnnbAVTJ/3naQlvBw
	 YrEJ1Ul2Q0RKmkt2jDsDf+0BZDYKeiyFfSYmrXPcHS+pSAtI9TgEfaLcfgUScDpewI
	 zJoJU/HNucGQw7xhw/lf/HCE35SMWcvoQzrdlwRBbhS2yb0kNp+bvGeZPbh2oPOuoV
	 8gtLQQ9fl800VIoAINY4Jzj3Fdr5tIWDSawfAKs689v3Lo0PWkZ+SJ3DHlEV85FL3t
	 GXHxQlTE+kAQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9D7C79FB6;
	Wed,  9 Sep 2026 14:14:23 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 09 Sep 2026 17:14:05 +0300
Subject: [PATCH 1/3] dt-bindings: iommu: mediatek: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-6572-iommu-v1-1-de261da09fb2@protonmail.com>
References: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
In-Reply-To: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
To: Yong Wu <yong.wu@mediatek.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788963261; l=2837;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=dwxNgLWUiyagGRngvUTXF8Q3mn0Z/8Gp90+ec/HbfQE=;
 b=8zBKc+fTvUi9pPpdPzfAzxaZDGX72EAiENZ4TSMrwd7adwi6lVA7T1qT0eczdmcib3XGbCsMi
 +DXU9U7VFidBMcOTDMSr/H823ERdWDuT6q9iwd0tD/LuitQr5U+vqO4
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add compatible string and header file for mt6572 IOMMU support.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml  |  3 +++
 .../memory/mediatek,mt6572-memory-port.h           | 26 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 79c573c47b08..d0ac4bd71911 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -72,6 +72,7 @@ properties:
       - enum:
           - mediatek,mt2701-m4u  # generation one
           - mediatek,mt2712-m4u  # generation two
+          - mediatek,mt6572-m4u  # generation one
           - mediatek,mt6779-m4u  # generation two
           - mediatek,mt6795-m4u  # generation two
           - mediatek,mt6893-iommu-mm         # generation two
@@ -134,6 +135,7 @@ properties:
       dt-binding/memory/mediatek,mt8189-memory-port.h for mt8189,
       dt-binding/memory/mt2701-larb-port.h for mt2701 and mt7623,
       dt-binding/memory/mt2712-larb-port.h for mt2712,
+      dt-binding/memory/mediatek,mt6572-memory-port.h for mt6572,
       dt-binding/memory/mt6779-larb-port.h for mt6779,
       dt-binding/memory/mt6795-larb-port.h for mt6795,
       dt-binding/memory/mediatek,mt6893-memory-port.h for mt6893,
@@ -162,6 +164,7 @@ allOf:
             enum:
               - mediatek,mt2701-m4u
               - mediatek,mt2712-m4u
+              - mediatek,mt6572-m4u
               - mediatek,mt6795-m4u
               - mediatek,mt6893-iommu-mm
               - mediatek,mt8173-m4u
diff --git a/include/dt-bindings/memory/mediatek,mt6572-memory-port.h b/include/dt-bindings/memory/mediatek,mt6572-memory-port.h
new file mode 100644
index 000000000000..6f8ddc98f1b1
--- /dev/null
+++ b/include/dt-bindings/memory/mediatek,mt6572-memory-port.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
+ */
+
+#ifndef _DT_BINDINGS_MEMORY_MT6572_MEMORY_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT6572_MEMORY_PORT_H_
+
+#define M4U_PORT_DISP_OVL		0
+#define M4U_PORT_DISP_RDMA		1
+#define M4U_PORT_DISP_WDMA		2
+#define M4U_PORT_DISP_DBI		3
+#define M4U_PORT_CAM_WDMA		4
+#define M4U_PORT_CMDQ			5
+#define M4U_PORT_VENC_BSDMA_VDEC_POST0	6
+#define M4U_PORT_MDP_RDMA		7
+#define M4U_PORT_MDP_WDMA		8
+#define M4U_PORT_MDP_ROTO		9
+#define M4U_PORT_MDP_ROTCO		10
+#define M4U_PORT_MDP_ROTVO		11
+#define M4U_PORT_VENC_MVQP		12
+#define M4U_PORT_VENC_MC		13
+#define M4U_PORT_VENC_CDMA_VDEC_CDMA	14
+#define M4U_PORT_VENC_REC_VDEC_WDMA	15
+
+#endif

-- 
2.55.0




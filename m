Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A29C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mFi/dsL9L+pt0Hn3m48yv3RTHiV+f0K9SkmpwU7vhY=; b=1TTy2ViiVfZ90hxp64ly8x9A19
	LFXksAQWPwggu6OL0guDmwMji/iIzlhXOukOKbOoVmC+fhiABPx10IJFFcq60UhXWTkL7+plfkUoe
	LTCjFrAQ9NonNGvNBPGEVBq6abEqqP/QgpRUYIJIJqyw06vtRYKHhSsyT3QMchtlfDoTmpgnZnJPJ
	bmd75wg7jeEeo/ACqSYn2KYFKm9g5foFmzXrg7SgDv4SPqEiAp6eGYVpbJt4UoT8JDlQSGkpbTBB8
	b5tBKtbMIgJyUN6ZyYJyLs0NZmjOkP9Sk8W/PRhQLU+79iFXl/QcMVkmh38kfWyRk5OCfqDFRJBiG
	38fGeiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to49r-0000000BxNv-35Uc;
	Fri, 28 Feb 2025 17:28:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to48H-0000000BxCu-3pOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:26:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49F81515;
	Fri, 28 Feb 2025 09:26:55 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E15E03F6A8;
	Fri, 28 Feb 2025 09:26:39 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: vkoul@kernel.org
Cc: devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: dma: Add Arm DMA-350
Date: Fri, 28 Feb 2025 17:26:32 +0000
Message-Id: <2918c3b4403f78b89f46e32f7572eace9f50ab93.1740762136.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1740762136.git.robin.murphy@arm.com>
References: <cover.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_092642_016904_6F81251F 
X-CRM114-Status: GOOD (  10.52  )
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

Arm CoreLink DMA-350 is a pleasantly straightforward DMA controller
which, although highly configurable, lends itself to a simple binding
thanks to plenty of self-describing ID registers.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/arm,dma-350.yaml

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
new file mode 100644
index 000000000000..429f682f15d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/arm,dma-350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm CoreLink DMA-350 Controller
+
+maintainers:
+  - Robin Murphy <robin.murphy@arm.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: arm,dma-350
+
+  reg:
+    items:
+      - description: Base and size of the full register map
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Channel 0 interrupt
+      - description: Channel 1 interrupt
+      - description: Channel 2 interrupt
+      - description: Channel 3 interrupt
+      - description: Channel 4 interrupt
+      - description: Channel 5 interrupt
+      - description: Channel 6 interrupt
+      - description: Channel 7 interrupt
+
+  "#dma-cells":
+    const: 1
+    description: The cell is the trigger input number
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
-- 
2.39.2.101.g768bb238c484.dirty



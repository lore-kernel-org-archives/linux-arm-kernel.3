Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FEgLND8rJ7ClK8WOTOgJeElk/cOMf1xQg+bXVoacjU=; b=E607qSGdvc7wU0+VPOfceXNhFD
	tYF+axElVMvM6hMx7Yj/rz5GgVkV5/QERfXoPvzrWt4cyNpx08Qw2Dqia3iYf7qszQ0yILjCjo8yM
	fyKw0eFdFtP9U13nYXAqp5IhuAjjl2OVw4zG4PAIz7Eg+bMsIL77mc8K3M3yKUe3URb7RGmKJjtgT
	9sjvBC+QriwViLlGWUR+TJCHMn3RBXr4xeAKAK5T3W/AR3/GOgJ9GBLF9MZjuk38fxGEVnXgpzEZ7
	7F3OpnfC4qkfltBnSrEnV9pLfuGLWDRIe+O2/AYthhIUebRuMFJJJv61prfVj3X9fxttu0ALV3GBk
	axNKqIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSQw-0000000AY5A-2iXk;
	Fri, 07 Feb 2025 17:46:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRCE-0000000AHSm-0ape;
	Fri, 07 Feb 2025 16:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8865FA426EC;
	Fri,  7 Feb 2025 16:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF57C4CEDF;
	Fri,  7 Feb 2025 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738945633;
	bh=9MLgp6BnjDhauGe+vw7L5oPe/nVs55P5xZ18grfkNcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nGxGZ6U7cmQ8L+ico6eJK3xtFJysdSt0fWemEtoGiBSGGiAI0Dn58+G3m6oUUAFXL
	 HgsRhSq66uhf3W5CZVS2QuAtvywV5enkj8kfJ2UuiKVejF3VM/W3G+mH7ATblU5BMX
	 NdAeepwKZikuclVgCYo7fGhP+oXoR92kK8JDaiESqS8xHxCgWf5k6faprndV61ZuQi
	 w8nMRL+Vb/5/sbdouXq0jiIfyyS0Ipl+2ai2HllhsAzu6+VbHgIN1EaR2rFfC3cdOm
	 8UZUnupJ8Mtqs8RBnX8jL0eLuegdblVuZ+qUyzgBrcCHYdHVssDoGq28y1fjx8Ko/Q
	 nYjRCpQklL5Uw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 07 Feb 2025 17:26:25 +0100
Subject: [PATCH net-next v2 10/15] dt-bindings: arm: airoha: Add the NPU
 node for EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-airoha-en7581-flowtable-offload-v2-10-3a2239692a67@kernel.org>
References: <20250207-airoha-en7581-flowtable-offload-v2-0-3a2239692a67@kernel.org>
In-Reply-To: <20250207-airoha-en7581-flowtable-offload-v2-0-3a2239692a67@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082714_316949_11429CD4 
X-CRM114-Status: GOOD (  12.39  )
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

This patch adds the NPU document binding for EN7581 SoC.
The Airoha Network Processor Unit (NPU) provides a configuration interface
to implement wired and wireless hardware flow offloading programming Packet
Processor Engine (PPE) flow table.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/arm/airoha,en7581-npu.yaml | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a5bcfa299e7cd54f51e70f7ded113f1efcd3e8b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/airoha,en7581-npu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Network Processor Unit for EN7581 SoC
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha Network Processor Unit (NPU) provides a configuration interface
+  to implement wired and wireless hardware flow offloading programming Packet
+  Processor Engine (PPE) flow table.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - airoha,en7581-npu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 15
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to the node describing memory used to store NPU firmware binary.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      npu@1e900000 {
+        compatible = "airoha,en7581-npu", "syscon";
+        reg = <0 0x1e900000 0 0x313000>;
+        interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&npu_binary>;
+      };
+    };

-- 
2.48.1



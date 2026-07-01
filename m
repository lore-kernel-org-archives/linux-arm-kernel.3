Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FBAC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mc8zHhnTaMr+T5l9Eq18aMLJndsFHm92Fc6x4Bb4nKE=; b=p7fr7o9d+rXgeDUBZm8zwqed7h
	Gzcr74JtunwCuZ0eOzmjya8ohjInOiNHJ7TswNsJ9ZpLczYYksWIO+jBOAXHSgAQxWK4JGQ6Bq1CP
	PIqHWIeRbH5s+8hbj05ohk3fv115oHbfgHnc3ET8hhPzGMP4gek6W0ZcH8xuigpPuRSoHvqrRE1W6
	trIAaIfmM+IzD8XAmsG67WXcA4zzVHnFdHd4ib2RgyxXNBeG6twH3P72hcr2rkLi1trayuaaT0xAq
	8C8LJzqAdbILxUkDF7d5I1lMyJlV2oiAEyAdxk8jaXn00Npz4AeFHoVycdN+kpMKzw5Pe0Pmemj3Z
	vnCSnOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxH-00000001wYs-1tWt;
	Wed, 01 Jul 2026 12:22:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwo-00000001vAa-2vAR;
	Wed, 01 Jul 2026 12:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mc8zHhnTaMr+T5l9Eq18aMLJndsFHm92Fc6x4Bb4nKE=; b=Lck46cx9Pj+/vakrCH+U3o0BbL
	C8e9sVJj3a0LThwJP3eos0byEdSQKxqzmYb9Bi1JbVXfIFj7rXYkCGV2+UYI39Fj+2f2LIzppTmod
	noZiENxjzATWYUYUZ8yUpRzD+COPzM1ptoB9C/sChpErVbEiZxfWN87WN1p90Uynxwbe8V1yEACA/
	jWL8P2AiaOSNi/X/uUiXwDOPgoViWgukQjM4AumLJR5NaN8zjWcC0J/2KKFXk1HATZMy3GOxlf5qa
	8YpA4+cxJb3R3kz4EUzqzXsjWNDtrTJxP+ha4X9Ni4P9QqWPy5nilqJm99FSd30COQpPsOusferIP
	cmRKOAkQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwh-00000002jw8-1Lmm;
	Wed, 01 Jul 2026 12:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908498;
	bh=lLMPa9ysKvRX2d4gATrFB2GtA/AijOeRfim9jjyCoEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0dvlERMF3QSovsgYTMRycpFM/Hi2jccGcZCMc6+qvdZMk1gQ1m/0skp3i16kIM85
	 WdPu900gENCqlgOPfmCW70ggExy7Eb0aAZzgqnmSm+M7xNr5b0uRXL3dSZ3B0EAp9q
	 8VbiqWY8EgCxGSWT6fP0T2U21VUz+tCsYjtw/XS+j3wNcB/zQ/XxQlouBaOZ25IId4
	 9EG466XSuDOFjyR0Y03GTwxdOGPcktsgkzoLd1iv98K1J5Bd9fcfRWAiikiiIvC0Ms
	 A7cJSxvlNdIAJ4t6dQot1AqJ+ll821rSRTBdgl+GgoRUHFX54wiy38bBZEfRUNwWo6
	 VStSAeUusnq/g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 451EC17E0F44;
	Wed,  1 Jul 2026 14:21:37 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 26/42] dt-bindings: display: mediatek: Introduce MT8196 Layer Blender
Date: Wed,  1 Jul 2026 14:20:41 +0200
Message-ID: <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132139_477898_064077CA 
X-CRM114-Status: GOOD (  11.79  )
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

Add documentation for the Overlay Layer Blender IP found in the
newer generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-blender.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
new file mode 100644
index 000000000000..d907a51c495e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-blender.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay Layer Blender
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay Layer Blender hardware is responsible
+  for performing the alpha blending operation for overlapping layers
+  from various sources.
+
+properties:
+  compatible:
+    - const: mediatek,mt8196-disp-blender
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+
+    required:
+      - port@0
+      - port@1
+
+  trigger-sources:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    blender@328e0000 {
+        compatible = "mediatek,mt8196-disp-blender";
+        reg = <0x328e0000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_BLENDER1>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 11>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&exdma0_2_out>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&exdma0_3_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0



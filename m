Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm4geRn4bo2KqscZDvl5G7bmVEcvJ5LW6jN43jFZnNI=; b=UjXeA/DfQryPyW3N/appzg4D0j
	jxXyaJl6+nBkaVY3beaXWUggi4/T6iOYd1Fk2f7RObV8KjzrAvUmVwPmRhXTjWbeaDauqtotBFjj1
	keg9QFLcZng1iQ8vDEXbSlF6SKz76yEr74XnxQPneuu/Jw0pNB8GIBajiMTSF6A6Cs52q8uiZKUiM
	jDNxSLJn+92+i4xBRcjXbOymB/ZF7+QYxuImoCMxy6CdurJ6xiWRU2FlTNs8r/oCAZF+8ROphxd4U
	21P+rxQG4Jg+fk6KkD5lAVRSo3kKk98evjb6tCEILQBRRDu6ugbCySjHTp3aTni5bxLNEzkISKE8I
	bVGpmQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbaU-0000000Bkpp-3C7q;
	Tue, 14 Jul 2026 11:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZe-0000000BjHr-1dpp;
	Tue, 14 Jul 2026 11:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hm4geRn4bo2KqscZDvl5G7bmVEcvJ5LW6jN43jFZnNI=; b=iKBgVA7E1oxe3aLtTAKbtjlCA9
	K9aEn4+ga94MBxcV7WIxzknMAYTFLtcDoRXSCtgA/+pBOSOQNqn9LLS7r79iVVG32vXrai/ZL9r1s
	sqK9md19JCdcp/aIeJjbD9C+jucpy9YJwOnoGwRHfokfg1eooOtopRaejiYvWK3LiNhj1pZGuIZGB
	/8CSB79xM5Va5jfqQ4sPZ+hJR6qHqXu2L/9t4WbslkCT8fozu+phPieTGOjneftIkVr6DShTqYPVo
	vCTgUTN595dd3/DQfXjVpFc4I3eSMi02bFRmaCKNW+7McBiyDdY2xgGkHWdijFmqM1wWzqQicbSU4
	8Hs27GHw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjbZZ-0000000CQmf-3o0E;
	Tue, 14 Jul 2026 11:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029512;
	bh=jnjb7bbDatkp6uQNXKXGwV1y5BumXKMOkUY3tqjagkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1Y/xXKLqg/IU6n2kGO5lrH73oThhlyiKWjQv0fhZEQfla63I/OMkKtdRYIwiNMbk
	 0RVHXEzfLmkb96Iav7Bg7bsX8TJZltvYYNNYEsI5LYtwUByWseIWYMKnT/5pjoBV7J
	 QrOmNlyrKOCnhAPCcv6NQ38HeIpCMqRc4BALWscODOaQcPsbXWfk6HRFOgAvA2bU04
	 LD0rH1uKI2UVxMu2AcJjw+f5A22D3MwsFWrxOQ7T5wfktn2rk0+uOVElf5A5Thg2Pi
	 66fnabOlrkdZePBojfu96+QybhHpXcuNB6QlGkMLTK2GdJ5ZUIeh3w0qZH5Vupuej1
	 fk1PFCtPZuUyQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01DAE17E0F76;
	Tue, 14 Jul 2026 13:45:11 +0200 (CEST)
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
Subject: [PATCH v2 32/46] dt-bindings: display: mediatek: Introduce MT8196 extended DMA Engine
Date: Tue, 14 Jul 2026 13:44:00 +0200
Message-ID: <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_124514_096992_C5F5704F 
X-CRM114-Status: GOOD (  12.41  )
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

Add documentation for the extended DMA Engine (exDMA) IP found in
the newer generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-exdma.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
new file mode 100644
index 000000000000..d56bcd2f2b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-exdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay extended DMA (exDMA) Engine
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay extended DMA (exDMA) Engine hardware is used
+  to configure the Display Controller to read the data from DRAM to perform
+  layer overlaying.
+  This hardware also includes color conversion functions to output pixels
+  processed into a consistent color domain.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-exdma
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
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
+  - "#dma-cells"
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
+    dma-controller@32850000 {
+        compatible = "mediatek,mt8196-disp-exdma";
+        reg = <0x32850000 0x1000>;
+        #dma-cells = <1>;
+        clocks = <&ovlsys0 CLK_OVL_EXDMA2>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 2>;
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
+                    remote-endpoint = <&ovl0_resizer0_out>;
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
+                    remote-endpoint = <&blender0_1_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0



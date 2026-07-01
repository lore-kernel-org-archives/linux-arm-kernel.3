Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E30BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e3Z6PjSdmaD+QDQknitNoRD352gaQMaAyqy9qu6L0Q=; b=FzN76yiFLGo4/aOgIJkRbCnRhB
	8L8q8mHZwI3nruikIRZEjZtuuIaD2dljK+jKK5IkvVXqgjApPE7mItY9TD6aK/7SVNAUB5eraKHRV
	Zj6OoBEriJ3UN0DBgmhOypwGclBolAM92qJz5PSCkq+ITENOrIKW9/g4SmsJ3hGIDDlUOca4oOYZx
	GEVjn6kd7cM+LsBH6dV9AZ+mBjPS9k7+YGN2lQ1qrjuSPRu2t5Za3rp4ZOxoGd5dDaohTkf7141q6
	5aSHhR8KzHVgV2s+/41d7RJ7YfYxGc/4WJx+jxUYGYiZjlISbnMoCsuVUfn1bIIlg6g2BBFYI5ghr
	lPsNDm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxI-00000001we6-2Xge;
	Wed, 01 Jul 2026 12:22:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwp-00000001vCu-1Uiu;
	Wed, 01 Jul 2026 12:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6e3Z6PjSdmaD+QDQknitNoRD352gaQMaAyqy9qu6L0Q=; b=d+ES8nKH/ui9vQ+fM9tfNw0nEj
	ERziJswztm69gBe8/Uoi+jlQyWu56GcErBm6JL3Bx/bvbijbP/E4NXuNQWw5vDg7zhJBMDhq5xQcg
	Bfqp5bV3h/F7cXQOiRE+R8XuTmlRjPjaZ0Pb+htPdXBaXREpt2EnGzSQ9hPT0oMUTmog7DdlxG1BC
	8bU3e/SBNWU7Mz0wNXXWO9M0vYR+dPtBmS5ayczkhruuG0h4qmYGBqHqfLcxQDjg5Q7L2JWGqaav5
	eroVgEmyFzTEwJ0rjQV7V7qjFE0rhvfowvKUGc/hDhrg4T8zfl26kFHzWCftSC2LNxqHzpop9dh1C
	01ACywYA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwl-00000006ayN-3NPj;
	Wed, 01 Jul 2026 12:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908502;
	bh=90HSbW7eF7LLynifZcvFIq/6LpLwh4fID92XGJUHG4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcxYSspxgBmH1OTNRzx6h6/SEV57tsNiBi3bJ4+GEVmCta+PnKH9lhidbCKlB9hRW
	 cj/YWMzlo7ClAha05yJIPYE3YfdzUYrJE+zv6S+Ph4TVNCTnQb1HoZ0WXPrbzE3FMm
	 7Nk4C3egE5nvbFHsX0gWo8ZYRcAlCbunDDxvQLCri51SGQGoA1ujWuqNaS+ao+F6C7
	 AJxXRfucXBfeubzrVGKEIPcm+DnTx2n4KI/e4TEtDePH74J/ZIYxGBP9a64kiXRG9Z
	 zIDVF56oYHgeDySI9Xrde0gYcwHu0epgvysZVe35VcuyxJ/cszL9lDbJRuCqY0V9ct
	 YRgWdYfwWK+zw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB58617E35C9;
	Wed,  1 Jul 2026 14:21:41 +0200 (CEST)
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
Subject: [PATCH 30/42] dt-bindings: display: mediatek: Introduce MT8196 Output Processor
Date: Wed,  1 Jul 2026 14:20:45 +0200
Message-ID: <20260701122057.19648-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132144_065530_57DBF6DA 
X-CRM114-Status: GOOD (  10.33  )
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

Add documentation for the Overlay Output Processor IP found in
the newer Generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
new file mode 100644
index 000000000000..634107db269c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-outproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay Output Processor
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay Output Processor hardware handles the
+  post-stage of pixel processing in the layer overlaying process and
+  is also capable of performing gamma correction, ensuring that the
+  per-pixel values are within the expected luma range.
+  If an instance of this hardware is configured as last stage, it is
+  also capable of generating VBlank (Frame Done) events which can be
+  then dispatched either via an interrupt (to the CPU) or through a
+  Global Command Engine (GCE) Event, internally sent to programmable
+  Command Queue (CMDQ) Engine(s) for offloading purposes.
+
+properties:
+  compatible:
+    - const: mediatek,mt8196-disp-outproc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    description: Optional VBlank event interrupt
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
+    outproc@32970000 {
+        compatible = "mediatek,mt8196-disp-outproc";
+        reg = <0x32970000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_OUTPROC0>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 20>;
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
+                    remote-endpoint = <&blender0_8_out>;
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
+                    remote-endpoint = <&ovl0_directlink_out_relay6>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0



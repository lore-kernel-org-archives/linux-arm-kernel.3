Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF7C44511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SdP6kXCQ0Rls1I4flFzHg0VY7Le5KZENnyNFb8SU+Y=; b=jODMUKtwyOw1s1XlIWo+H2dZic
	NuuaM6htvO1J2pvASYbAt58iurmMcygZraekM3FGa+9enISwiqq116vT4SqcjGu4MystLIe1B9k/A
	1+m/1agxBOJh2AzWo93tixcEmKZweEc0lWaGhwMU+nuvpifZGX1H6PuAsaJWMU59dg6CkgdLMw+UG
	jKx9eS/LcV7c6jM6Jqa3vZnDlrek/TOO0BwDN66mqa510MslBibxTcHM08KhIHwDo95Vi4yw0OQDX
	yOf7eFVAQjgQdUt4dIii2XIrNnHcZ/h2C4vAneioDSJfNVIMkLz+BzuHx5BbKvRKvpNNlVeAlZ0do
	R7XPxqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbaB-0000000BkJE-46Zs;
	Tue, 14 Jul 2026 11:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZb-0000000BjDK-1Zne;
	Tue, 14 Jul 2026 11:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3SdP6kXCQ0Rls1I4flFzHg0VY7Le5KZENnyNFb8SU+Y=; b=A8tUKGniFA23tQduFfKwRAjvIv
	8crglS9JF6C0OQR6BCdhhFXCHjSedvYhcegCMk71bR7dgkYgAkLx5iEP6mA25VlqV8BbzRFPW+9d9
	GQR12hEazOZfUsj/XoDzD9HcWNORBTktO7D8E6p53ctuPQK54awl+EiNNZZUMCYS/tshLrLaP+JPQ
	m8q6VCIwllntmTs+72b4CygajW5wljPTzpuR21+hO81LedswWOcu75L0f8V42L9vsHenfCoXBaXDi
	BT3qzaG4bs5UorgJysFU2IQWJT1vKwajoza3losYJMZ3eTiwN7abN7Me3G1Bh00selaaPerwIqhYK
	QFN6G7fQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjbZX-0000000CQkq-2bDl;
	Tue, 14 Jul 2026 11:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029510;
	bh=I7fJQlOlTfXkIng8aBbijbBG0zVVgjgbwIFT77vxeyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozOIVlttp38W+s8YqB15p60UHE692CTt/vPblTu0Q86O2W4MQeJhATo3rEPpBJshP
	 Y6tQAH24iPI+4Z+oaQURshLoXryJluMDIR2T8DLUdWkW1fctMSGGbS3n66JnvpMnnL
	 wBs55AXXAbypXeeLDBRtVMA6IZyk+95NggdyrN0/KM8kYiKGQW2sn3iqFJTr1+AYuu
	 xHXHjMx1kMZAoRxHsXCeRzHQZ4ReQkwhyLEsR/FKxNtYVC/qE5s4wpZUndNNi/Van6
	 U+MvgBKgNVIG2/+Hfpo/9mxlmftGkDMQfobMjtYpkTrbniMItm/wdH0o/CDEtkydZa
	 LOSTuvZe1FyPw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A94617E0956;
	Tue, 14 Jul 2026 13:45:09 +0200 (CEST)
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
Subject: [PATCH v2 30/46] dt-bindings: display: mediatek: Introduce MT8196 Layer Blender
Date: Tue, 14 Jul 2026 13:43:58 +0200
Message-ID: <20260714114414.184512-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_124511_827678_13F16D4C 
X-CRM114-Status: GOOD (  11.23  )
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
index 000000000000..402eccb5fd70
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
+    const: mediatek,mt8196-disp-blender
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



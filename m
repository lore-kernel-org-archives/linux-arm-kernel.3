Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTZzwCmCrem4Nzy2AR/A2RLshIXEvbZCWLJ/jgBwtXY=; b=1EwH6wdPsArCJ10Fe/8yjBIk/w
	nKQaGzFn8Z6QCiHfLA9bDNS/OSqB3tO4iEnJ8A0XNWkr0TlIIK00DrKJhI6jgRwVYUR4mhxBhHfS/
	jY3c7cRsREJ/CRKmnQ1wx1TY+YjWWSKInemC1Pe/lZxtJhy6b6phDJ1IVfSKC+8VVWVMIbBrgFSOp
	Vg5Hl9096OfdljM+xqCqqvJAkPj4WXyPcGi0toRfB/Woy8z925v/eXCrP7ZBQdJge+Hcy46rvPNH4
	75U315pakuf/1HbY6YuXry9Qn+ILUmmlcOVTKNmvIQOCIxz4g8+0isokDocoJ5wbTO/46CocKbtkH
	QwdA/vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxf-00000001xps-1UFT;
	Wed, 01 Jul 2026 12:22:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetx4-00000001vtO-1LUw;
	Wed, 01 Jul 2026 12:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QTZzwCmCrem4Nzy2AR/A2RLshIXEvbZCWLJ/jgBwtXY=; b=acRCCJAIjWemI/IDm16rc25Sy5
	02VxS+zoEp8QKGFPTBwkVx6YulA68qhhA56Sr4wr6ywsRNEW41CLYp0D0CX7wckMdSR1AXTt0WT78
	OPdwBOZDH31UIT0W09vFKEJl8s0wCorFE8lTtTMv/9hrXd6Q/Dq3sGtACjASP8QyCzfrgnP7+3ew6
	FE8fPanNNQ5SdfSCy2cGdForpoApztCLw1gXzDgiQW/7pMSi3mmKerVGWh1unQHIH4rnEqcc22QAN
	IIqjHGeLAdKT/xUG1XSDiFOmSbiDLTGPnRHADQbY10ZDmVNzAq66nJi4E/BCB6kqn0DmMFIqrsvVU
	Admdga4A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwz-00000002k5d-1foP;
	Wed, 01 Jul 2026 12:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908516;
	bh=LYnNlffTqEaIo/8joGv6zwqndt8MqlFVMfRv+2/fnUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSY8WfVSau0awvdveY+JisdZ818dXAED/9hJ0+3olKdpD1FwN2YqcuUZFUq4v7An7
	 wZN1dIJPMYV2ExLwK4UNztEbVAwBl4rTzoka9cBt6EAuulgwFTnaJYiPENcG2AqNOH
	 qdXIy5qr3Hk2u69TtvHsYupgkvAQvnGVJKnZ/jzuOjOYPR8RCdimXcVsCXjTZXTk/y
	 s5bPoHd1WPf44wfXiBMdOjufF4rkYCdlA4O0NooKsTYrVcr9tv4XaoFKkyiqdRE9EQ
	 yHS6oEetn1tKMn5V04oAH1KM8LlkzXKea7CIBRLhcScHN0SoIT2g11HE2WsqZZwhZz
	 eOB9DTECt9TQA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D95817E35F5;
	Wed,  1 Jul 2026 14:21:55 +0200 (CEST)
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
Subject: [PATCH 40/42] dt-bindings: display: mediatek: Introduce MT8196 Image Resizer
Date: Wed,  1 Jul 2026 14:20:55 +0200
Message-ID: <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132157_567857_81A0C1B5 
X-CRM114-Status: GOOD (  12.34  )
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

Add documentation for the Image Resizer "RSZ" Scaler block found
in the MT8196 SoC and its variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,mt8196-rsz.yaml | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
new file mode 100644
index 000000000000..cf6b0ed08bfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Image Resizer (RSZ)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Image Resizer (RSZ) is a high fidelity scaler block,
+  with filters and signal enhancers, responsible for performing downscaling
+  or upscaling of a frame.
+
+properties:
+  compatible:
+    - const: mediatek,mt8196-disp-rsz
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
+    scaler@329d0000 {
+        compatible = "mediatek,mt8196-disp-rsz";
+        reg = <0x329d0000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_MDP_RSZ0>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 26>;
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
+                    remote-endpoint = <&ep_main_out>;
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
+                    remote-endpoint = <&exdma0_2_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0



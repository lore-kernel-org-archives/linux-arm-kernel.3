Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71841CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zbhVgMQfTliX8eWfdhCQYGm0le0Urjt05MrmEhh//gw=; b=Ev1n6FQJgNEkVx99FJqiaGkAgu
	qNpmftimYsw7Jxm5si0t4Utbsf5G19ugQoWrh5i2EbRiQgxXR6U8KSjNiqVwlqWyNkwR2mIFFArzh
	HTIinuplqkDbjIMHK4bjhQzxYVelnTKJGoZb1plkBHFUG0PKN5ukIg1tLLB1172bhWKhI8P2DPBRM
	Q3d8YAIMJY9FjGRYMgTfOrLeSItx/rXgrq3ybkUg8r3HMOH49sC5ae7/mWd6pYDOclSPNS5UXoaE7
	IBbAJ1+45sjQA7FHIMiGCcf/pjloV/ZcNKPP6MFAfgLEpi22Q8mCucLkNY28YyqUN6pVH3PsbSOyn
	cuiFRl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJnP-00000001kL0-30uS;
	Mon, 28 Sep 2026 22:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJnO-00000001kKq-29mD;
	Mon, 28 Sep 2026 22:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 066DC402DA;
	Mon, 28 Sep 2026 22:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDAC1F000FF;
	Mon, 28 Sep 2026 22:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790634361;
	bh=zbhVgMQfTliX8eWfdhCQYGm0le0Urjt05MrmEhh//gw=;
	h=From:To:Cc:Subject:Date;
	b=PudfRpASqbkUOXl5dciNATNWI3dvxqVKYoRpNOK27MhdYO4u6RuTv4K42p8NGaFYp
	 4Zpn3Ag1WlH7Lz16Kyutz9tNJ1sj35K5hLm9sijEfKxZIaJwdZrvTgserZn00x4VS0
	 qWG2s0RJoCQaJujIAkEsIYBXm2pJ86b+1AqqWs4NXo71IEqaLza70zmUSYh5cb4xQK
	 gOSOco6vXiBOqa1Vj1H5fXd0l04E8q45/BeuK0HIu0f3SB+qYLJefG5V0rXYLngpdH
	 uDn5lROi4tO9O9RCZIIpIf47w76XDzbcCvQ4JIbveQO+sn3+zwa3kWdPqpIHDyF7LP
	 iVayQYJBF799g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: power: Convert mediatek,mt2701-scpsys to DT schema
Date: Mon, 28 Sep 2026 17:25:51 -0500
Message-ID: <20260928222552.1118609-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the mediatek,mt2701-scpsys binding to DT schema. The mt6735 and
mt6765 don't exist anywhere. The mt8183 is covered by
mediatek,mt8195-scpsys.yaml schema. With those dropped, the clock-names
are trimmed to drop mm-*, isp-*, cam-*, and venc_lt. The venc_lt and
mfg_2d supplies are dropped as well.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Add per compatible clocks/clock-names constraints
---
 .../power/mediatek,mt2701-scpsys.yaml         | 184 ++++++++++++++++++
 .../bindings/soc/mediatek/scpsys.txt          |  79 --------
 2 files changed, 184 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
new file mode 100644
index 000000000000..75c84abc865f
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mediatek,mt2701-scpsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SCPSYS
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: >
+  The System Control Processor System (SCPSYS) has several power management
+  related tasks in the system. The tasks include thermal measurement, dynamic
+  voltage frequency scaling (DVFS), interrupt filter and lowlevel sleep control.
+  The System Power Manager (SPM) inside the SCPSYS is for the MTCMOS power
+  domain control.
+
+  It provides the power domains defined in:
+    - include/dt-bindings/power/mt2701-power.h
+    - include/dt-bindings/power/mt2712-power.h
+    - include/dt-bindings/power/mt6797-power.h
+    - include/dt-bindings/power/mt7622-power.h
+    - include/dt-bindings/power/mt7623a-power.h
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt7623a-scpsys
+          - mediatek,mt6797-scpsys
+      - items:
+          - enum:
+              - mediatek,mt2701-scpsys
+              - mediatek,mt2712-scpsys
+              - mediatek,mt7622-scpsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-scpsys
+          - const: mediatek,mt2701-scpsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7629-scpsys
+          - const: mediatek,mt7622-scpsys
+
+  '#power-domain-cells':
+    description: Always 1
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  clocks:
+    minItems: 1
+    maxItems: 20
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - mm
+        - mfg
+        - ethif
+        - venc
+        - jpgdec
+        - audio
+        - vdec
+        - hif_sel
+
+  vdec-supply: true
+  venc-supply: true
+  isp-supply: true
+  mm-supply: true
+  audio-supply: true
+  usb-supply: true
+  mfg_async-supply: true
+  mfg-supply: true
+
+  infracfg:
+    description: Infrastructure configuration controller phandle
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - '#power-domain-cells'
+  - reg
+  - infracfg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt2701-scpsys
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mm
+            - const: mfg
+            - const: ethif
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7623a-scpsys
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: ethif
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt2712-scpsys
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: mm
+            - const: mfg
+            - const: venc
+            - const: jpgdec
+            - const: audio
+            - const: vdec
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-scpsys
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: hif_sel
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6797-scpsys
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mfg
+            - const: mm
+            - const: vdec
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+
+    power-controller@10006000 {
+        #power-domain-cells = <1>;
+        compatible = "mediatek,mt2701-scpsys", "syscon";
+        reg = <0x10006000 0x1000>;
+        infracfg = <&infracfg>;
+        clocks = <&topckgen CLK_TOP_MM_SEL>,
+                  <&topckgen CLK_TOP_MFG_SEL>,
+                  <&topckgen CLK_TOP_ETHIF_SEL>;
+        clock-names = "mm", "mfg", "ethif";
+    };
diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
deleted file mode 100644
index 3530a6668b48..000000000000
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-MediaTek SCPSYS
-===============
-
-The System Control Processor System (SCPSYS) has several power management
-related tasks in the system. The tasks include thermal measurement, dynamic
-voltage frequency scaling (DVFS), interrupt filter and lowlevel sleep control.
-The System Power Manager (SPM) inside the SCPSYS is for the MTCMOS power
-domain control.
-
-The driver implements the Generic PM domain bindings described in
-power/power-domain.yaml. It provides the power domains defined in
-- include/dt-bindings/power/mt8173-power.h
-- include/dt-bindings/power/mt6797-power.h
-- include/dt-bindings/power/mt6765-power.h
-- include/dt-bindings/power/mt2701-power.h
-- include/dt-bindings/power/mt2712-power.h
-- include/dt-bindings/power/mt7622-power.h
-
-Required properties:
-- compatible: Should be one of:
-	- "mediatek,mt2701-scpsys"
-	- "mediatek,mt2712-scpsys"
-	- "mediatek,mt6735-scpsys"
-	- "mediatek,mt6765-scpsys"
-	- "mediatek,mt6797-scpsys"
-	- "mediatek,mt7622-scpsys"
-	- "mediatek,mt7623-scpsys", "mediatek,mt2701-scpsys": For MT7623 SoC
-	- "mediatek,mt7623a-scpsys": For MT7623A SoC
-	- "mediatek,mt7629-scpsys", "mediatek,mt7622-scpsys": For MT7629 SoC
-	- "mediatek,mt8173-scpsys"
-- #power-domain-cells: Must be 1
-- reg: Address range of the SCPSYS unit
-- infracfg: must contain a phandle to the infracfg controller
-- clock, clock-names: clocks according to the common clock binding.
-                      These are clocks which hardware needs to be
-                      enabled before enabling certain power domains.
-	Required clocks for MT2701 or MT7623: "mm", "mfg", "ethif"
-	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
-	Required clocks for MT6765: MUX: "mm", "mfg"
-				    CG: "mm-0", "mm-1", "mm-2", "mm-3", "isp-0",
-					"isp-1", "cam-0", "cam-1", "cam-2",
-					"cam-3","cam-4"
-	Required clocks for MT6797: "mm", "mfg", "vdec"
-	Required clocks for MT7622 or MT7629: "hif_sel"
-	Required clocks for MT7623A: "ethif"
-	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
-
-Optional properties:
-- vdec-supply: Power supply for the vdec power domain
-- venc-supply: Power supply for the venc power domain
-- isp-supply: Power supply for the isp power domain
-- mm-supply: Power supply for the mm power domain
-- venc_lt-supply: Power supply for the venc_lt power domain
-- audio-supply: Power supply for the audio power domain
-- usb-supply: Power supply for the usb power domain
-- mfg_async-supply: Power supply for the mfg_async power domain
-- mfg_2d-supply: Power supply for the mfg_2d power domain
-- mfg-supply: Power supply for the mfg power domain
-
-Example:
-
-	scpsys: scpsys@10006000 {
-		#power-domain-cells = <1>;
-		compatible = "mediatek,mt8173-scpsys";
-		reg = <0 0x10006000 0 0x1000>;
-		infracfg = <&infracfg>;
-		clocks = <&clk26m>,
-			 <&topckgen CLK_TOP_MM_SEL>;
-			 <&topckgen CLK_TOP_VENC_SEL>,
-			 <&topckgen CLK_TOP_VENC_LT_SEL>;
-		clock-names = "mfg", "mm", "venc", "venc_lt";
-	};
-
-Example consumer:
-
-	afe: mt8173-afe-pcm@11220000 {
-		compatible = "mediatek,mt8173-afe-pcm";
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_AUDIO>;
-	};
-- 
2.53.0



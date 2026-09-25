Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19C7C98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zB+uphukWsYzwSOajdvh6cv5j11GNs+nqVXToUS/cgk=; b=wDIfF5x2OYvsTYEkOLnF9E0Mdm
	uBN6yZ6HmQdFcpGQ7f1uzCOW0pE+Gsw8BTWgbxkqw26XmOngv/gG9zjS8Et5l5ZJbR3Un4CDWxlBL
	W5i1heuvLxrl+vdl5TfI04ouFXsTExbVGQoy1evN8D1psmg0PYFrz2y7Q+hfTsFSbQm8owE1XEkUW
	yVeSlqiH3Vz6djF8Doauqs1rA0scqx3hymhzGeJFKRiMFJ4EAZbh0PLJDUzU7OqburYtVSLY4WsAB
	0ZrGD4u/A/CKdr3DhLksKIwjLB05r7Zq9TxAJWZ62asEC530U45GyQgbjMBHlIcYmQYnY+7wV9t9k
	U2hhnw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Kx-0000000DtCQ-0xW2;
	Fri, 25 Sep 2026 15:59:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Kv-0000000DtBf-3RnG;
	Fri, 25 Sep 2026 15:59:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85E7B40DD3;
	Fri, 25 Sep 2026 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315751F000FF;
	Fri, 25 Sep 2026 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351985;
	bh=zB+uphukWsYzwSOajdvh6cv5j11GNs+nqVXToUS/cgk=;
	h=From:To:Cc:Subject:Date;
	b=fAKdsbzasz2R8m6Io4IM5xBe8i/yrGwfeDJvrrALc+l8G3IU7VScfmJbFY8PYuAkI
	 GhAuWSBF6tPwubQ682VNHIisRZpv0rZ+VpLMKrHv76sco60/wy7NZ2nlElBr7vs65f
	 gQ3rA83hKL1AQ2JKguWwqVTN+Sa/oPI8wLKOwyC3sb8f1V2+S/e3V+uwrWm08evL0u
	 amr5Jwk87wbs0UKw41hOsM32fXdzKJekwKw23gKg627wRP9J341xERiFBdR9sfxRyC
	 VKCuBcG2DISTPSxGP0F/By4qemd/ybYj6TU5Pc6SjL4D7TwY1BLA8OgRdeWuulD8L8
	 YtGPz/tu8d+2w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: power: Convert mediatek,mt2701-scpsys to DT schema
Date: Fri, 25 Sep 2026 10:59:26 -0500
Message-ID: <20260925155927.1707560-1-robh@kernel.org>
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
 .../power/mediatek,mt2701-scpsys.yaml         | 111 ++++++++++++++++++
 .../bindings/soc/mediatek/scpsys.txt          |  79 -------------
 2 files changed, 111 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
new file mode 100644
index 000000000000..d991b8a008eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
@@ -0,0 +1,111 @@
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



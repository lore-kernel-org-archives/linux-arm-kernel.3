Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED54C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNkm6SejKGDvPd5KRBCK8vmpvmjQLGTWFseyfI5sl1g=; b=oXLo/eZlSVIARdPhHN0spLAE0r
	jdMAfFV24kU9MYAS6ct8dQ+u5R6FJLrXGuojDUKbIwjDJpdaWZjCA3MoA67Tg16v3hQeo/sZo9eDF
	FCLcEZEEaQa8Jc3U5Ds0RZi8bNyVpIw4AHUcMfrurdW6JGH3Y55jFr/caScoRjGeNkfj6U5jcmHi1
	gaqPX0/nv+W0SDPJU2LIaSac5wcjsdwMjh3BczjONmjg90zPgPylte478Z3hYcCitwlUMECVSWo82
	HeSFprgTsIHwFonyEruZepBeuHFIUqSlua2gqzzJhQc+vv1mvBOI2yrsMHIL9/CLj37ETo6kYcVGn
	+aSM/ZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubepv-0000000552G-0iTh;
	Tue, 15 Jul 2025 12:32:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeHp-000000050Bp-2W71;
	Tue, 15 Jul 2025 11:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752580648;
	bh=lBLq2XppSqe8dM1Htia7d5Ef/77fUNAK3eL/ULF0Uk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UkVRrZF4U1h2mzhCidadkCLTq1sWHqx7K6CQ8RP1n6TB9JlUmg1pTXyD6eZuesmmP
	 IGQZVfWQbCykFBRvpS0hG2oHpwSneXUlmEVDUq0CJNZffxKdANDRPJSADfbyuoTSGQ
	 RpbrjJ3IzTuWO9Ttg78oouRLGeJwZIuxEkombv5ag9C1henb8EeKPU36TX39/YHAsd
	 g0IIPP9GVQq2XowrcTmGePIki9Ne+kOiiEqrybEYtMfwQytuZx/ZYUR62i7o+lnvkB
	 xNpIbuhr57qnHjxU8LqmjKMF7/CG8uXPtbsVHP9ZqhQR2q8fTKLLLvMUSPpRiRu3ze
	 6zyMqborcCsdQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B83317E1301;
	Tue, 15 Jul 2025 13:57:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v4 5/8] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Tue, 15 Jul 2025 13:57:15 +0200
Message-ID: <20250715115718.176495-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715115718.176495-1-angelogioacchino.delregno@collabora.com>
References: <20250715115718.176495-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_045729_795975_8F51CE80 
X-CRM114-Status: GOOD (  15.16  )
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

Add bindings for the regulators found in the MediaTek MT6363 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
MT6363 PMICs.

Link: https://lore.kernel.org/r/20250624073548.29732-6-angelogioacchino.delregno@collabora.com
Link: https://lore.kernel.org/r/20250707134451.154346-6-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6373-regulator.yaml  | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
new file mode 100644
index 000000000000..dec4bf90e892
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6373 PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MT6373 SPMI PMIC provides 11 BUCK and 23 LDO (Low Dropout) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6373-regulator
+
+  interrupts:
+    description: Overcurrent warning interrupts
+    minItems: 1
+    maxItems: 34
+
+  interrupt-names:
+    description:
+      Names for the overcurrent interrupts are the same as the name
+      of a regulator (hence the same as each regulator's node name).
+      For example, the interrupt name for regulator vfp will be "vfp".
+    minItems: 1
+    maxItems: 34
+    contains:
+      enum:
+        - vbuck0
+        - vbuck1
+        - vbuck2
+        - vbuck3
+        - vbuck4
+        - vbuck4-ufs
+        - vbuck5
+        - vbuck6
+        - vbuck7
+        - vbuck8
+        - vbuck9
+        - vant18
+        - vaud18
+        - vaux18
+        - vcn33-1
+        - vcn33-2
+        - vcn33-3
+        - vcn18io
+        - vefuse
+        - vfp
+        - vibr
+        - vio28
+        - vmc
+        - vmch
+        - vrfio18-aif
+        - vrf09-aif
+        - vrf12-aif
+        - vrf13-aif
+        - vrf18-aif
+        - vsim1
+        - vsim2
+        - vsram-digrf-aif
+        - vtp
+        - vusb
+
+patternProperties:
+  "^v(ant|aud|aux)18$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vbuck([0123456789]|4-ufs)$":
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, does not limit the maximum out
+                current but unless only a light load is applied, there will be
+                regulation accuracy and efficiency losses.
+            3 - Forced Ultra Low Power mode for ultra low load, this greatly
+                reduces the maximum output power, makes the regulator to be
+                efficient only for ultra light load, and greatly reduces the
+                quiescent current (Iq) of the buck.
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2, 3 ]
+    unevaluatedProperties: false
+
+  "^vbuck4(-ufs)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vcn33-[123]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(f|t)p":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(cn18io|efuse|ibr|io28|sram-digrf-aif|usb)":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vmc(h)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vmch-(eint-low|eint-high)?$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vrf(09|12|13|18|io18)-aif$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vsim[12]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+      interrupt-controller;
+      #interrupt-cells = <3>;
+
+      regulators {
+        compatible = "mediatek,mt6373-regulator";
+        interrupts = <5 17 IRQ_TYPE_LEVEL_HIGH>, <5 18 IRQ_TYPE_LEVEL_HIGH>,
+                     <5 19 IRQ_TYPE_LEVEL_HIGH>, <5 20 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vusb", "vaux18", "vrf13-aif", "vrf18-aif";
+
+        vaux18 {
+          regulator-name = "avss18-auxadc-mt6373";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+
+        vmc {
+          regulator-name = "pp1800-2900-vmc";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <2900000>;
+          regulator-allowed-modes = <0 2>;
+        };
+      };
+    };
+...
-- 
2.50.1



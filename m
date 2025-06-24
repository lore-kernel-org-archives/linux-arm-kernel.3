Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795EC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTwq/H8JOFgr0x3SwPY4bGnzX1WtYFhKLZDYURBlmpQ=; b=2b6c6/dnDrxNLS9qkg0hcNL11p
	hqNaN4eRBoB1E9FPQMlu3z0vpBn50t5wnSvWvSef2T+Sil6QeDuhEGigcDBwzeHmHiTbJICHVlDcs
	7K5CEBmrmyaU6+vz3FdpyyS5rhGJexK3YAaqf+Fvc9sqo2ncla1t7FkxFkR4CSniUz0CpCnUTa7pF
	mk1yoJF16rz+j8zqfsFOhI8OdwRHThAxS3nXwYVA0eFcmHaODjNXl4iFEIkR1ejqNF0sGIHuXpkTi
	nyTmWIMdE7+tr0gefVRJGAQZx5thEM9lELn1TraAVe6xhdiFcHnNjcoyCOI/DwX/Z97H3KZqI54o/
	+bRJzWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTydn-00000004xdq-1J1j;
	Tue, 24 Jun 2025 08:04:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyCB-00000004tB6-1wLW;
	Tue, 24 Jun 2025 07:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750750553;
	bh=tuIAU3/jPqC/vVlqNQI9mFvFjLa8oCatvIPSUqpJew0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJR5Txtp0arSQ099lf61C2bwwFLEWGuh3cGgY1vBHrmYWU5ZRPhLASX2DlT6C76Rb
	 yk+F0QaDvyvZN6jIf2+qFXaHtNes0D09zwSYoQaU88Chu2CNl6aLe70kYybZ24AA/A
	 X4Z3H3BDusOlhydxtqMYy+nnT3+TlaDgNfcUR3Q54pHgkJww3jEoBYwwvQo3UKvVMj
	 P0qJaxNGKKFeB043KNvt3u9iOJ9CEz2zpARZzTDBPo9zGXi5ax+wld8+TlQfpWOKi/
	 N2Ui13z2EMWhSQStecWzlI2yJfDAmq+VJ2amxTj1sR9D0zbG/ueGrgU771j83Lmfv0
	 qZpAGtASJb14A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 402E917E1439;
	Tue, 24 Jun 2025 09:35:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
Date: Tue, 24 Jun 2025 09:35:45 +0200
Message-ID: <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_003555_641235_4A87A961 
X-CRM114-Status: GOOD (  12.64  )
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
MT6373 PMICs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
new file mode 100644
index 000000000000..f866c89c56f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6363 PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6363-regulator
+
+  interrupts:
+    description: Overcurrent warning interrupts
+    minItems: 1
+    maxItems: 36
+
+  interrupt-names:
+    description:
+      Names for the overcurrent interrupts are the same as the name
+      of a regulator (hence the same as each regulator's node name).
+      For example, the interrupt name for regulator vs2 will be "vs2".
+    minItems: 1
+    maxItems: 36
+
+  isink-load:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  ldo-vemc:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+patternProperties:
+  "^ldo-va(12-1|12-2|15)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^buck-vb[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^buck-sshub[124]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-v(aux|m|rfio|tref)18$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vcn(13|15)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vio(0p75|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vrf(0p9|12|13|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vs[1-3]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vufs(12|18)$":
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
+        compatible = "mediatek,mt6363-regulator";
+        interrupts = <4 16 IRQ_TYPE_LEVEL_HIGH>, <4 17 IRQ_TYPE_LEVEL_HIGH>,
+                     <4 18 IRQ_TYPE_LEVEL_HIGH>, <4 19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vcn15", "vcn13", "vrf09", "vrf12";
+
+        ldo-vio18 {
+          regulator-name = "pp1800-vio18-s3";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-allowed-modes = <0 2>;
+          regulator-allow-set-load;
+        };
+      };
+    };
+...
-- 
2.49.0



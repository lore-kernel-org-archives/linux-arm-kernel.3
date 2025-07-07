Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D81C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkHWjITsDaK/ib3mgnEGB1cSkboBQSBDG0I4q7dmQFE=; b=Dy/6JiIo7Kkfu/L2CFI3yksgEx
	V3RbNQ4wrxF4cbVLR6fgC6m6GBzzJX1A35hu3jWNIMA+G4x9zFPmLs5nM0eyYx4O5d4MCyTjn0mPo
	FQXJHpcrLDCHphgQOPjZaBi260MT7xZgzIrh4mQ16PnyEqXf+Y7oaU/Jzk/Fu2H7AIr1lPQ6C4nnc
	5dzQwe+5gyn2kZA7qoRGWb3Azr6P5/aYjGfOZ2oKHKBkl7Mc8sfcDcKTnKGHCvJIr7QdS4uePtU6V
	Sii8Ks3MdIga8D52HjR61ydaCgMvBFFZdTCaR7VkIypDIyb5CKfzzB5IZfB8w/R/H7eeQ5hZDj6PZ
	xiQxttNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmjt-00000002gBx-3nyU;
	Mon, 07 Jul 2025 14:22:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm9X-00000002aqV-2O93;
	Mon, 07 Jul 2025 13:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895902;
	bh=YfJsAz/MXzGFmP41ETWF8TQ5Ecu21USFNF5/WGHyE8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfdYIL4IjL+XUv0VMpLjKEsMttOKTijuyI+MxD2rMOGFNUmE/sUqryE2ziE+6e6ye
	 TfMxsO/9f5OliZGC9UcdFcY0KmJsw1Qb9P1tvBrXfJX5rJUptAanffgicQwElz9gQ6
	 K4x8VlSTeoIyg/AiEamt7F6joidBy4fezEGXND+BGSJ3qizIkrk2SM61M382OEct+s
	 cVATf7fGNBOtR0lbnAIOAuDNuwWxofqt3EMoOoccjwZVlspDeQORKn7eghmLmi1Bb2
	 5hSuPIpWCSLKTPuoUrkvOwxG6N15KNIe/IlWLDjOCkpCMkaVbqIp1/Yb/7kNTJXYjL
	 hv9wOzSIXiWQQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 457F717E0657;
	Mon,  7 Jul 2025 15:45:01 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH v2 1/8] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Mon,  7 Jul 2025 15:44:44 +0200
Message-ID: <20250707134451.154346-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064503_752316_255FEDA9 
X-CRM114-Status: GOOD (  12.36  )
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

Add bindings for the regulators found in the MediaTek MT6316 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks.

This chip is fully controlled by SPMI and has multiple variants
providing different phase configurations.

Link: https://lore.kernel.org/r/20250624073548.29732-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
 .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
 .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
new file mode 100644
index 000000000000..e7a6b70cdab2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
+  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
+
+properties:
+  compatible:
+    const: mediatek,mt6316b-regulator
+
+  vbuck12:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  vbuck34:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316b-regulator";
+
+        vbuck12 {
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <965000>;
+          regulator-always-on;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
new file mode 100644
index 000000000000..0b9239a595ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 CP/HP/KP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316CP/HP/KP PMICs are fully controlled by SPMI interface,
+  features four step-down DC/DC (buck) converters, and provides 3+1 Phases,
+  joining Buck 1+2+4 for the first phase, and uses Buck 3 for the second.
+
+properties:
+  compatible:
+    const: mediatek,mt6316c-regulator
+
+  vbuck124:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  vbuck3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316c-regulator";
+
+        vbuck124 {
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-always-on;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
new file mode 100644
index 000000000000..460c02bf69de
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 DP/TP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316DP/TP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides a single Phase,
+  joining Buck 1+2+3+4.
+
+properties:
+  compatible:
+    const: mediatek,mt6316d-regulator
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        compatible = "mediatek,mt6316d-regulator";
+
+        vbuck1234 {
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-always-on;
+        };
+      };
+    };
+...
-- 
2.49.0



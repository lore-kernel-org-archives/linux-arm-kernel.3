Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC9CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6TRgV7R7pQ7LrrZT1eSc0JNHOm2nLOrXXLSi1EjYGk=; b=g+Kh4wXYHHOyZyKHLN54/HXQG8
	DtAoiRR4nsnpcZitplKMXK1zxeRGwuNt9myJVK09JCVsQxqZXFtzoExiMuH85avrOrYbZl5Me1h7e
	XqB/irWMRrzaduDi6ws98PDuwg0IIdykUPAtbYEjgnI1RWwSmt+aRR3/YYJP80T7abBnpQ3F4QSV8
	BsTShMBEHQTr5PhKNdlyCEQHnwdDeT2HO+eCRV61zWHDjCUf51P+tPzU72kuprg8hl/sPNC3TrLzl
	4ck5ChxGpjnxraxGdSADO6mGPVJ5ta7hTi6YU0A450PnCKDRUdHRiIVy1c7R5wL7MFHTVlbwGKZ3q
	Aw8kzb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKD-00000004CBu-1ugV;
	Thu, 16 Oct 2025 09:31:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KK8-00000004C9G-0PPa;
	Thu, 16 Oct 2025 09:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607062;
	bh=pludmFCDqJvq7WEzwNPBhZzjbs99h72dhhI5Qeckujc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSAUIGbF+ewE0rKv1KG/UgXUtypw2yAE8EH3qcdsmvrANKqt7FdoPrjgo6mwR06Op
	 PFVrwyx9+qcTbZJeEh2x2HTlfdI4XB4mHfCg2Nz4ESUInnpqoBz0Q4TmJnNsSm1uQp
	 6ZTz6t+67x4DA1hKsRDdSFy0/+XBe2IHUKd5NOj7vIZWA6uVmZqVZzoH9xDVnVGdPX
	 2B259kZtHTxXJcF1Po8WnCiqCjhrChzX2yDcdRmGU6Ti4+EijqiLL3Jkfdg92tyjDZ
	 D3MwmEWXYH+IYYq4lKhyTcUnGwKWwg4OUWNrgTLJQe4ENbTbGvMZOYoZVCDpUjQ3Nx
	 Wyl48EvWkfdhg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7274117E0DB7;
	Thu, 16 Oct 2025 11:31:01 +0200 (CEST)
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
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v9 1/9] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Thu, 16 Oct 2025 11:30:46 +0200
Message-ID: <20251016093054.126293-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
References: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023104_290916_DA839A44 
X-CRM114-Status: GOOD (  13.97  )
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
 .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
 .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
 3 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
new file mode 100644
index 000000000000..65b70dd90728
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
@@ -0,0 +1,78 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(12|34)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
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
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@8 {
+        compatible = "mediatek,mt6316b-regulator";
+        reg = <0x8 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck12 {
+          regulator-name = "dvdd_core";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <965000>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
new file mode 100644
index 000000000000..1565aee43f1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
@@ -0,0 +1,78 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(124|3)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
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
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@6 {
+        compatible = "mediatek,mt6316c-regulator";
+        reg = <0x6 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck124 {
+          regulator-name = "dvdd_proc_m";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
new file mode 100644
index 000000000000..b53c5a4a6f96
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
@@ -0,0 +1,77 @@
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
+  reg:
+    maxItems: 1
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
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
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@7 {
+        compatible = "mediatek,mt6316d-regulator";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck1234 {
+          regulator-name = "dvdd_gpustack";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
-- 
2.51.0



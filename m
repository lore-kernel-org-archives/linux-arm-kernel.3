Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7133DCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2EYO35WnQDXQ1CSn4cZXzWNJEfTf5U79VW2+gbZxoM=; b=y4yYajaJdQXKRuyk5Hduj6Gh5R
	quchmLDugp4tiMWhwZgexcoQETi9oMpbOBjvnxOY9iXSzZLn448N7SMaaLqCpVGLCRHGE7Ze9ChAI
	cfba3wKbULZ5m6TlI9zb7TpLlSCA2IHn4I44cMJi3t01AfEBK5DtIPV0Xvcq3m68vATBnV7F/IP9x
	1xGuPyF80EZktGgqhWuTfwvzVCFh6TA1ixXvYa//IxlOyENVK2a7zkfiYShitWnEEXsP280snUnNs
	R+YZE7NC1CTubPJ+ZS98PclePGMco40+TQq4UfwNnks149dGUI9V8EpSxK0vHCnSPyaTRBotploGY
	fiL9o4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEI-00000008gXm-0RJk;
	Fri, 24 Oct 2025 08:32:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDE2-00000008gLk-3xXc;
	Fri, 24 Oct 2025 08:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294760;
	bh=J5422bSRZ4U/JD7t7orWCPBcDw+viZtifCbqY+ALk/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efAnK7edwLGSeL5+3DjkjCrEqvFrngdqNQDn+3rSTU6JIlhZe27Kl2lEKYseKtCQy
	 ByxYvMKpOLa2b0fLyg+oGeSHZlv5B8GqIL3lBzJ2+ZM0DutEgGfx9U27vdOoLmciSQ
	 /dVDoQaAqN9IeoA32J8AJu9RSvOwjzcpaQou7BKVDc2qr2nQ+QZU4kzoz0IqOqMq9z
	 yUmwhXCmFRUTkO6Vq44kONxaaScmj3nUuE4JFEjS4u6CH9gOVT4PqlMXYY8kDCw6Zd
	 /pOD2mudl9f9WYYDyZYU9QgzNhYYOJvIEjTxg6p2CDuYqUS5aHfHxjjweZnVrQU9X0
	 0pbldaJuSzU9w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 109FE17E13F9;
	Fri, 24 Oct 2025 10:32:40 +0200 (CEST)
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
Subject: [PATCH v10 3/9] dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
Date: Fri, 24 Oct 2025 10:32:15 +0200
Message-ID: <20251024083221.25758-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013243_298628_A164119F 
X-CRM114-Status: GOOD (  12.95  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6363-regulator.yaml  | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
new file mode 100644
index 000000000000..4f79d4f81d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
@@ -0,0 +1,146 @@
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
+  The MT6363 SPMI PMIC provides 10 BUCK and 25 LDO (Low DropOut) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6363-regulator
+
+  reg:
+    maxItems: 1
+
+  vsys-vbuck1-supply:
+    description: Input supply for vbuck1
+
+  vsys-vbuck2-supply:
+    description: Input supply for vbuck2
+
+  vsys-vbuck3-supply:
+    description: Input supply for vbuck3
+
+  vsys-vbuck4-supply:
+    description: Input supply for vbuck4
+
+  vsys-vbuck5-supply:
+    description: Input supply for vbuck5
+
+  vsys-vbuck6-supply:
+    description: Input supply for vbuck6
+
+  vsys-vbuck7-supply:
+    description: Input supply for vbuck7
+
+  vsys-vs1-supply:
+    description: Input supply for vs1
+
+  vsys-vs2-supply:
+    description: Input supply for vs2
+
+  vsys-vs3-supply:
+    description: Input supply for vs3
+
+  vs1-ldo1-supply:
+    description: Input supply for va15, vio0p75, vm18, vrf18, vrf-io18
+
+  vs1-ldo2-supply:
+    description: Input supply for vcn15, vio18, vufs18
+
+  vs2-ldo1-supply:
+    description: Input supply for vsram-cpub, vsram-cpum, vrf12, vrf13, vufs12
+
+  vs2-ldo2-supply:
+    description: Input supply for va12-1, va12-2, vcn13, vsram-cpul
+
+  vs3-ldo1-supply:
+    description: Input supply for vsram-apu, vsram-digrf, vsram-mdfe
+
+  vs3-ldo2-supply:
+    description: Input supply for vsram-modem, vrf0p9
+
+  vsys-ldo1-supply:
+    description: Input supply for vaux18, vemc, vtref18
+
+patternProperties:
+  "^v(buck[1-7]|s[1-3])$":
+    description: Buck regulators
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
+
+  "^va(12-1|12-2|15)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^v(aux|m|rf-io|tref)18$":
+    $ref: "#/$defs/ldo-common"
+
+  "^v(cn13|cn15|emc)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vio(0p75|18)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vrf(0p9|12|13|18)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vufs(12|18)$":
+    $ref: "#/$defs/ldo-common"
+
+$defs:
+  ldo-common:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed LDO regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, does not limit the maximum out
+                current but unless only a light load is applied, there will be
+                regulation accuracy and efficiency losses.
+        maxItems: 2
+        items:
+          enum: [ 0, 2 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
-- 
2.51.1



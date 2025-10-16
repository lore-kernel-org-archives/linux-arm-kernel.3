Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39221CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+hiEej9ww8pRb/q5PC9+GnV5a+nfZmhvc7PQZJl2+s=; b=LDpr3EHSW2WqQlJ39EWebbOKQ2
	Q88O64AAPNWjBziLvylbMWVn0ilucYMdottLa9ek/8si0m5oHIzx3L8Rc+iKif9QI0XJ2eBw+DbDg
	LBpVjNqzsYoIPw675+McvMclNSbmJfGgkmDnCS1NtU/ucu3y7WD7v5ZjBsYx98aqlBBn9XI+w6aYF
	p1V6T8gpO4F88sb5MqsnNIUfbj1S/NyGYv81HxqnlWHWO8hdXw/zEMqriHOuDmLcJkaPzaDSEa/am
	9i4bxcQOz905WFepiw4pnuQZcfCqY01NyxUyAeS1My8Qs6NrSw7eh3NdJY1RqPHCMdaZ7D5cgJhBQ
	KxKQaqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKP-00000004COS-3R8z;
	Thu, 16 Oct 2025 09:31:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKE-00000004CBj-1SGG;
	Thu, 16 Oct 2025 09:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607065;
	bh=1vxKJh+1G5TNAXx+Wnw6fJCL0eFLOUWzI7TwuvLZJgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1D+r45wYTlBVPxXmyA9qVacAID2t7FXtem5UBGpcBBNwScpb3km5TuEBYeJ36aQd
	 n3AxuPNaEb289JhhaXQK6tHfoJEPYOLiu3RmiUYclEcV7L7heRzYTeQOv+W027p7Xk
	 vtSJUXpTwQLE0FNIijSpujcg6v8YkYTN5nE4iQ0GFQVf9G9qaxMeUATLxH2KtXYJN1
	 rQMmj+sfMXDwp5JmQOpV6T/BBinSR5aXfMB5JqY5sNKR2kL9dNr2SYKzijZv0/rHet
	 9kZZtb7pJreBKC5N/M2cXJ/QeLVyTzAuKvjUIllp8toFe5p1SfMXRqSekLSP+bKO93
	 5aGjXiEzbaNXA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0B5517E1400;
	Thu, 16 Oct 2025 11:31:04 +0200 (CEST)
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
Subject: [PATCH v9 5/9] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Thu, 16 Oct 2025 11:30:50 +0200
Message-ID: <20251016093054.126293-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
References: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023110_574746_BB1A1679 
X-CRM114-Status: GOOD (  13.15  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6373-regulator.yaml  | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
new file mode 100644
index 000000000000..4562f291fc0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
@@ -0,0 +1,137 @@
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
+  The MT6373 SPMI PMIC provides 10 BUCK and 23 LDO (Low DropOut) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6373-regulator
+
+  reg:
+    maxItems: 1
+
+  vsys-vbuck0-supply:
+    description: Input supply for vbuck0
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
+  vsys-vbuck8-supply:
+    description: Input supply for vbuck8
+
+  vsys-vbuck9-supply:
+    description: Input supply for vbuck9
+
+  vs1-ldo1-supply:
+    description: Input supply for vant18, vaud18, vcn18io
+
+  vs2-ldo1-supply:
+    description: Input supply for vrf12-aif, vrf13-aif
+
+  vs3-ldo1-supply:
+    description: Input supply for vrf09-aif, vsram-digrf-aif
+
+  vsys-ldo1-supply:
+    description: Input supply for vcn33-1, vcn33-2, vmc
+
+  vsys-ldo2-supply:
+    description:
+      Input supply for vaux18, vcn33-3, vefuse, vfp, vibr, vio28, vtp, vusb
+
+  vsys-ldo3-supply:
+    description: Input supply for vmch, vmch-eint-high/low
+
+patternProperties:
+  "^v(ant|aud|aux)18$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vbuck[0-9]$":
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
+  "^v(cn18io|cn33-[123]|efuse|fp|tp|ibr|io28|sram-digrf-aif|usb)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vmc(h)?$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vmch-eint-(low|high)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vrf(09|12|13|18|io18)-aif$":
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
2.51.0



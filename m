Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtLgoain9KAZ+dGhGRqocRYpnT00Ci9nPy8Q7gsX9Tw=; b=OeSF4wW3kjIjE0wDxYvyBNleSW
	Gliel42DRjr8DEUHe705FL7CZBFJvhc/KXWR2SzlSGcbcpRIPtFKptf5Af6R0yUxNfugPKZckSFiN
	Ow5wBctH1O7XZMyfls++DY0+ZpRph+6kJaY1FD/KOE8klwUBEtubvdyC+/GPyTYLdwtAU7ZfshFHQ
	Sp4BsS40ZZhQwdi7KJdmQEUu2wygeW4iIAOD37EXp6F6e3U2c1MlPYhDNEPejcZt90WV/mi1QiJFv
	p1BVIxjI/eyWudCV5A58zkquKlXSCki/qjkZl035jd+ZqXJ+K6IzmNc9rMVaQIgusmeDv4VHMX4/F
	k2/sZR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7j-00000005rex-0wDC;
	Tue, 15 Sep 2026 10:10:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7R-00000005rLY-3ztc;
	Tue, 15 Sep 2026 10:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789467026;
	bh=QL+UHbz6ocxj2GQ6KJGSIdIbj7NFCI3MZwL5GnuuHpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFIKAhPnOsHFLpzvCY+NrDgDA/svkjIC0EMr4vEmv/LJxySNgjlxic46k4Ikm1Veu
	 SuBjZdMDM3aC3ltooN60qg1McN9nbZ80f3n/EiSktyjDVRfs9ElUwDPmavve8uU4MF
	 WiEtR1ShdkGZIvHALq8vGl9wtmP5F+oSfnxpTMnn1jTkhgilqfeBGGIbkmRgUM/cyv
	 B8Gg8HzEvyE+MHnMG11TefMkj+p6yvJqEt+OqKL5+kyqHVzaYYzFZ1cEvUB0bP5arE
	 GWrvQkNr4GwElM2IHFXJ9KBxWHM45P/F/O9g6/dChLTKwNxNUKtircXy8JeMR8za3C
	 LIjMmyTnxrnBQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4733917E091A;
	Tue, 15 Sep 2026 12:10:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
Date: Tue, 15 Sep 2026 12:10:21 +0200
Message-ID: <20260915101022.23852-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_031030_152241_C74F0E58 
X-CRM114-Status: GOOD (  12.51  )
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

This adds bindings for the PCI-Express Gen4 S-PHY found in newer
MediaTek SoCs, such as MT8196 and its variants.

In the current "revision 3", depending on the specific port, this
S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
and RC modes.
It is not clear whether revisions/versions earlier than 3 have
ever been shipped in any other MediaTek SoC.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../phy/mediatek,mt8196-pcie-sphy.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
new file mode 100644
index 000000000000..3fd1bfbc3822
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8196-pcie-sphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCI-Express Gen4 S-PHY
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek PCI-Express Gen4 S-PHY is capable of data serialization
+  and de-serialization with 8, 10, 128 or 130 bits (16GT/s) encoding
+  and decoding, has analog buffers, elastic buffers and mechanisms for
+  receiver detection.
+  This PHY supports link rates of 2.5, 5.0, 8.0 and 16.0 GT/s per-lane
+  in both Root Complex (RC) and End Point (EP) modes, depending on the
+  chosen port.
+  The Digital PHY (PHYD) part adheres to the Intel PIPE (PHY Interface
+  for the PCIe) specification.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-pcie-sphy
+
+  reg:
+    items:
+      - description: System Interface (SIF) registers
+      - description: Clock Management (CKM) registers
+
+  reg-names:
+    items:
+      - const: sif
+      - const: ckm
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    items:
+      - description: Internal resistor selection of TX Bias Current
+      - description: XTP Bias V2V voltage calibration
+      - description: S-PLL CKTX Impedance Selection (P-MOSFET side)
+      - description: S-PLL CKTX Impedance Selection (N-MOSFET side)
+      - description: S-PLL CKTX Intermediate Transition Impedance
+      - description: RX Front-End Return Loss Continuous Time Linear EQ
+      - description: RX Front-End Return Loss Variable Gain Amplifier
+      - description: RX Front-End Return Loss Decision Feedback EQ
+      - description: RX Impedance Selection
+      - description: TX Impedance Selection (P-MOSFET side)
+      - description: TX Impedance Selection (N-MOSFET side)
+      - description: TX Lane 0 Switch Resistance (RSWn)
+      - description: TX Lane 1 Switch Resistance (RSWn)
+      - description: eFuse calibration table version
+
+  nvmem-cell-names:
+    items:
+      - const: int-r
+      - const: xtp-vtrim
+      - const: cktx-pmos
+      - const: cktx-nmos
+      - const: cktx-r-mid
+      - const: rxfe-lanes-rl-ctle
+      - const: rxfe-lanes-rl-vga
+      - const: rxfe-lanes-rl-dfe
+      - const: rx-lanes-imp
+      - const: tx-lanes-pmos
+      - const: tx-lanes-nmos
+      - const: tx-ln0-rswn
+      - const: tx-ln1-rswn
+      - const: cal-version
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@16900000 {
+        compatible = "mediatek,mt8196-pcie-sphy";
+        reg = <0x16900000 0x10000>, <0x16920000 0x10000>;
+        reg-names = "sif", "ckm";
+        power-domains = <&spm 10>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0



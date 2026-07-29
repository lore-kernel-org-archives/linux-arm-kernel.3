Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18514C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mImuq/Poxe43llISeO8/ydvGmYUC+VBOsaH0wvf8Hw=; b=l9qXM1jQ0CwMHytW3ibvJJcyQQ
	NI6fx7osSnwIe/cze8kwTiB2bFPpIP3Z9KGhbmer/FKfb5fsqeCFtVT2fBf5+EZ/HeGCyCujXOOME
	p4jHTxt/GdvMiF6FNWf18moHVtw4vksblHP5OzRMdz6xr1Q0aNQodA+Eco3Zath4T2QK9qwTgPNfX
	3ZzpcRIoijWPfuu6xQrm4dVKR6eCBCShL7VDRI2RjdV4Pu9VmmHo/SCF5zLBzDUkbAKoj1AQkvAKg
	LUfOdKorISILiuTb/cNtiVOsKuKbezPD/ARLLNoXBNDZVu+ecv5xZYu1IW5f4KYje5q+vbHYPeX3E
	FedOvzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18X-00000007SO2-3q2Q;
	Wed, 29 Jul 2026 10:03:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18G-00000007S6K-377C;
	Wed, 29 Jul 2026 10:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4mImuq/Poxe43llISeO8/ydvGmYUC+VBOsaH0wvf8Hw=; b=ZlRD4yl/4Eh6TwM8FkV3UDgqaY
	SIZ/X4whVW/wGoOI+zYfDmzaPOSdrd1LnOlA9aEPBYwFOolXfm1avkVAajdtuhBR9CIwB+BpU6q3G
	5Jdogt4091fk/LlkzmlHTNZwLo1bbQH8FI+Q1EpeLZ+19/fFRoOijtkoYtzt/Sp15phPJFdRZ3f/j
	x++NQY0scRZVkDzlwQWyiUpFM1xYyN5UujVrPHfWgdIvspe46nysCXUuHS/vXHh7Sp3JkqMspfLt7
	LkRkXMYSMB/ET+bCqgmmYeTP/PwNF24YfFrvEPzrOzW0UJIEp7xPrybShAYPKyyBe9RhL9uKVCt9K
	2rEXh72w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp18C-00000005eQp-3oak;
	Wed, 29 Jul 2026 10:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319395;
	bh=bZwCPfz/oC+ZzaJTPsZoph2SeRDJ9CNJ/zw85Kx+nW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JJ0UmwTHH40a1O1rClQYh1EiKh36zqsq/oEVp3oGinYJyWsaqBxIC0wMoRyDc4zsY
	 TF8EMmhqis7Wks9zkeEtHaPdcS+1SbvXLX5QRzWacPfUtGtTIQRfKba29MvZI+gLBj
	 ASxLOMUeQosXkwj9jtVh4KxRMj49aUHgzB6+2GmwBD6szLwSG0AiuEOUHAljL2av2s
	 5EAi/+zFIjfLYn23Z8FHzQxfWH5O08MgL7ks95UuPKJ2sVCEtACm0UVqMKy3K6oJqR
	 WCG5btLr9yGqEZ74jssfDPhqWe7mLMJi2Hx1vTNgZsJgwU4FCQyfX6V9qPHu0iADvY
	 urs75jZQS8JHg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AB0617E08D6;
	Wed, 29 Jul 2026 12:03:14 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:49 +0200
Subject: [PATCH v4 05/24] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-5-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=9269;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=bZwCPfz/oC+ZzaJTPsZoph2SeRDJ9CNJ/zw85Kx+nW0=;
 b=1Q02DU76syto9aDhnbnj3YsP3aAalLl8dimwbgBIC9I6nAJfAWnj8EP319qXZLb1tXE0pAGoi
 30d1CdYiLkgBYKfS2MSmw2vkfoTaS+evZrYtrxCMch8x30Tw2yMUoSI
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_110321_232591_9CD36862 
X-CRM114-Status: GOOD (  12.82  )
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

Regroup the MT8188 clock and system clock dt-bindings into MT8186 ones
to ease maintainability and have common files for several currently
supported SoC or new future ones, that have the same kind of clock
controller design.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/clock/mediatek,mt8186-clock.yaml      | 50 +++++++++++-
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |  6 +-
 .../bindings/clock/mediatek,mt8188-clock.yaml      | 93 ----------------------
 .../bindings/clock/mediatek,mt8188-sys-clock.yaml  | 58 --------------
 4 files changed, 54 insertions(+), 153 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index 756b937bb7c4..0bc2da60a601 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/mediatek,mt8186-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek Functional Clock Controller for MT8186
+title: MediaTek Functional Clock Controller for Mediatek SoCs
 
 maintainers:
   - Chun-Jie Chen <chun-jie.chen@mediatek.com>
@@ -35,6 +35,29 @@ properties:
           - mediatek,mt8186-vdecsys
           - mediatek,mt8186-vencsys
           - mediatek,mt8186-wpesys
+          - mediatek,mt8188-adsp-audio26m
+          - mediatek,mt8188-camsys
+          - mediatek,mt8188-camsys-rawa
+          - mediatek,mt8188-camsys-rawb
+          - mediatek,mt8188-camsys-yuva
+          - mediatek,mt8188-camsys-yuvb
+          - mediatek,mt8188-ccusys
+          - mediatek,mt8188-imgsys
+          - mediatek,mt8188-imgsys-wpe1
+          - mediatek,mt8188-imgsys-wpe2
+          - mediatek,mt8188-imgsys-wpe3
+          - mediatek,mt8188-imgsys1-dip-nr
+          - mediatek,mt8188-imgsys1-dip-top
+          - mediatek,mt8188-imp-iic-wrap-c
+          - mediatek,mt8188-imp-iic-wrap-en
+          - mediatek,mt8188-imp-iic-wrap-w
+          - mediatek,mt8188-ipesys
+          - mediatek,mt8188-mfgcfg
+          - mediatek,mt8188-vdecsys
+          - mediatek,mt8188-vdecsys-soc
+          - mediatek,mt8188-vencsys
+          - mediatek,mt8188-wpesys
+          - mediatek,mt8188-wpesys-vpp0
 
   reg:
     maxItems: 1
@@ -42,11 +65,36 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-camsys-rawa
+            - mediatek,mt8188-camsys-rawb
+            - mediatek,mt8188-camsys-yuva
+            - mediatek,mt8188-camsys-yuvb
+            - mediatek,mt8188-imgsys-wpe1
+            - mediatek,mt8188-imgsys-wpe2
+            - mediatek,mt8188-imgsys-wpe3
+            - mediatek,mt8188-imgsys1-dip-nr
+            - mediatek,mt8188-imgsys1-dip-top
+            - mediatek,mt8188-ipesys
+    then:
+      required:
+        - '#reset-cells'
+    else:
+      properties:
+        '#reset-cells': false
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 6733dafbde16..199eac2034f2 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/mediatek,mt8186-sys-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek System Clock Controller for MT8186
+title: MediaTek System Clock Controller for  Mediatek SoCs
 
 maintainers:
   - Chun-Jie Chen <chun-jie.chen@mediatek.com>
@@ -31,6 +31,10 @@ properties:
           - mediatek,mt8186-infracfg_ao
           - mediatek,mt8186-mcusys
           - mediatek,mt8186-topckgen
+          - mediatek,mt8188-apmixedsys
+          - mediatek,mt8188-infracfg-ao
+          - mediatek,mt8188-pericfg-ao
+          - mediatek,mt8188-topckgen
       - const: syscon
 
   reg:
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
deleted file mode 100644
index 5403242545ab..000000000000
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ /dev/null
@@ -1,93 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek Functional Clock Controller for MT8188
-
-maintainers:
-  - Garmin Chang <garmin.chang@mediatek.com>
-
-description: |
-  The clock architecture in MediaTek like below
-  PLLs -->
-          dividers -->
-                      muxes
-                           -->
-                              clock gate
-
-  The devices provide clock gate control in different IP blocks.
-
-properties:
-  compatible:
-    enum:
-      - mediatek,mt8188-adsp-audio26m
-      - mediatek,mt8188-camsys
-      - mediatek,mt8188-camsys-rawa
-      - mediatek,mt8188-camsys-rawb
-      - mediatek,mt8188-camsys-yuva
-      - mediatek,mt8188-camsys-yuvb
-      - mediatek,mt8188-ccusys
-      - mediatek,mt8188-imgsys
-      - mediatek,mt8188-imgsys-wpe1
-      - mediatek,mt8188-imgsys-wpe2
-      - mediatek,mt8188-imgsys-wpe3
-      - mediatek,mt8188-imgsys1-dip-nr
-      - mediatek,mt8188-imgsys1-dip-top
-      - mediatek,mt8188-imp-iic-wrap-c
-      - mediatek,mt8188-imp-iic-wrap-en
-      - mediatek,mt8188-imp-iic-wrap-w
-      - mediatek,mt8188-ipesys
-      - mediatek,mt8188-mfgcfg
-      - mediatek,mt8188-vdecsys
-      - mediatek,mt8188-vdecsys-soc
-      - mediatek,mt8188-vencsys
-      - mediatek,mt8188-wpesys
-      - mediatek,mt8188-wpesys-vpp0
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt8188-camsys-rawa
-              - mediatek,mt8188-camsys-rawb
-              - mediatek,mt8188-camsys-yuva
-              - mediatek,mt8188-camsys-yuvb
-              - mediatek,mt8188-imgsys-wpe1
-              - mediatek,mt8188-imgsys-wpe2
-              - mediatek,mt8188-imgsys-wpe3
-              - mediatek,mt8188-imgsys1-dip-nr
-              - mediatek,mt8188-imgsys1-dip-top
-              - mediatek,mt8188-ipesys
-
-    then:
-      required:
-        - '#reset-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    clock-controller@11283000 {
-        compatible = "mediatek,mt8188-imp-iic-wrap-c";
-        reg = <0x11283000 0x1000>;
-        #clock-cells = <1>;
-    };
-
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
deleted file mode 100644
index db13d51a4903..000000000000
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
+++ /dev/null
@@ -1,58 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek System Clock Controller for MT8188
-
-maintainers:
-  - Garmin Chang <garmin.chang@mediatek.com>
-
-description: |
-  The clock architecture in MediaTek like below
-  PLLs -->
-          dividers -->
-                      muxes
-                           -->
-                              clock gate
-
-  The apmixedsys provides most of PLLs which generated from SoC 26m.
-  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
-  The infracfg_ao provides clock gate in peripheral and infrastructure IP blocks.
-  The mcusys provides mux control to select the clock source in AP MCU.
-  The device nodes also provide the system control capacity for configuration.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - mediatek,mt8188-apmixedsys
-          - mediatek,mt8188-infracfg-ao
-          - mediatek,mt8188-pericfg-ao
-          - mediatek,mt8188-topckgen
-      - const: syscon
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    clock-controller@10000000 {
-        compatible = "mediatek,mt8188-topckgen", "syscon";
-        reg = <0x10000000 0x1000>;
-        #clock-cells = <1>;
-    };

-- 
2.55.0



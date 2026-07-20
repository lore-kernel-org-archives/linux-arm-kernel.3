Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8979C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO4GOKimmCeoHJk6I5wde47McqqGDfTgDplaCXUI+5Y=; b=kNqTgNA9SdTuL+jfdZ/pnG8Vkq
	7YpryBvAz/TGe6gfKM5JawW3Ey9U85pHGFNPHtFL0eWdk9tpFmQ/W9Y3sTnWzokKwWTAtHdJ3Yvww
	Rlt7kIxZLLj8NAdNm0RiYqR3Q0JSQ4g1GGg0FUCkEPDat2CW4CS6F5W9lACu4hEdqsHAWcDzQiHzT
	AJhg1+LjBfD9zgzIMBJeG6l7SwoTKEawXRVDCqySpyVNvb6Vkisg9+RfXt2Uac/uCdsH375ANQTLd
	kGYnVcLm2xNBA0UtgkBCW/DBaSfsLBSLmbetSXnx64+GPSkmLMk8AaPuG/bHLxZXg/ItysrL5Qbqv
	9FsOyCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlksO-00000006QDs-1yni;
	Mon, 20 Jul 2026 10:05:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkry-00000006Plb-3Zp7;
	Mon, 20 Jul 2026 10:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784541904;
	bh=QK/z2/OlU9f+haYluWVfeQDHy1ylay/b/2MI0HOuaVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fQhXwypBImsASeQWjVZAaXPVUg8EWHA/O26xxfDa9CSBQ9R2VkA5j+mO5zmigbY8r
	 ZWhQJGbpytjdWbYeTnPIDokjo6JXGEThhH6S6fsXqsh2qE0NOMI+LBa8jmDI5imt6o
	 7p5CLv6+8ii2m+jlfh9ZF8Ffj2qpzk9VDKiYXTteA3a4nTI9fITmdlWkWcBXL91fq0
	 0IzYLfNDLCqJdsUWQ+FP2SRwDddcLXzyMFwIrWg4Mc8nJaw9ddmBwW+sMj7d9U0+Ud
	 w1XtjURXbUqj3q1NR01AVA1pNlVJ41cofEcVSgN55eK5dWoUsNZtArXdTD1rumqA6M
	 WhCRSm8LImTPQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A88117E0E2C;
	Mon, 20 Jul 2026 12:05:03 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 20 Jul 2026 12:04:17 +0200
Subject: [PATCH v3 07/18] dt-bindings: clock: mediatek: regroup MT8195
 dt-bindings into MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-mt8189-clocks-system-base-v3-7-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541894; l=12317;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=QK/z2/OlU9f+haYluWVfeQDHy1ylay/b/2MI0HOuaVw=;
 b=RAKGSLDppcD62fLWDJQhbLhNOldbKKEc5XErrRYnrKB6ezOQ0CtL8MawWDMhKuvgphrxFDsws
 /xoEpM0I1ObDl2ZVhvdADsEuWRpA3nPT0d4MpSmOAkmBaJC5A+TBp7q
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030510_203406_ED79B80D 
X-CRM114-Status: GOOD (  11.49  )
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

Regroup the MT8195 clock and system clock dt-bindings into MT8186 ones
to ease maintainability and have common files for several currently
supported SoC or new future ones, that have the same kind of clock
controller design.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/clock/mediatek,mt8186-clock.yaml      |  25 +++
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   4 +
 .../bindings/clock/mediatek,mt8195-clock.yaml      | 239 ---------------------
 .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |  77 -------
 4 files changed, 29 insertions(+), 316 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index b5988d122e4d..ab9f8cb7dd6e 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -78,6 +78,31 @@ properties:
           - mediatek,mt8192-vdecsys_soc
           - mediatek,mt8192-vdecsys
           - mediatek,mt8192-vencsys
+          - mediatek,mt8195-apusys_pll
+          - mediatek,mt8195-camsys
+          - mediatek,mt8195-camsys_rawa
+          - mediatek,mt8195-camsys_yuva
+          - mediatek,mt8195-camsys_rawb
+          - mediatek,mt8195-camsys_yuvb
+          - mediatek,mt8195-camsys_mraw
+          - mediatek,mt8195-ccusys
+          - mediatek,mt8195-imgsys
+          - mediatek,mt8195-imgsys1_dip_top
+          - mediatek,mt8195-imgsys1_dip_nr
+          - mediatek,mt8195-imgsys1_wpe
+          - mediatek,mt8195-imp_iic_wrap_s
+          - mediatek,mt8195-imp_iic_wrap_w
+          - mediatek,mt8195-ipesys
+          - mediatek,mt8195-mfgcfg
+          - mediatek,mt8195-scp_adsp
+          - mediatek,mt8195-vdecsys_soc
+          - mediatek,mt8195-vdecsys
+          - mediatek,mt8195-vdecsys_core1
+          - mediatek,mt8195-vencsys
+          - mediatek,mt8195-vencsys_core1
+          - mediatek,mt8195-wpesys
+          - mediatek,mt8195-wpesys_vpp0
+          - mediatek,mt8195-wpesys_vpp1
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 41b8c61132e2..4a9d3eea4316 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -39,6 +39,10 @@ properties:
           - mediatek,mt8192-infracfg
           - mediatek,mt8192-pericfg
           - mediatek,mt8192-topckgen
+          - mediatek,mt8195-apmixedsys
+          - mediatek,mt8195-infracfg_ao
+          - mediatek,mt8195-pericfg_ao
+          - mediatek,mt8195-topckgen
       - const: syscon
 
   reg:
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
deleted file mode 100644
index 94dd29c2396c..000000000000
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-clock.yaml
+++ /dev/null
@@ -1,239 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mediatek,mt8195-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek Functional Clock Controller for MT8195
-
-maintainers:
-  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
-
-description:
-  The clock architecture in Mediatek like below
-  PLLs -->
-          dividers -->
-                      muxes
-                           -->
-                              clock gate
-
-  The devices except apusys_pll provide clock gate control in different IP blocks.
-  The apusys_pll provides Plls which generated from SoC 26m for AI Processing Unit.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - mediatek,mt8195-scp_adsp
-          - mediatek,mt8195-imp_iic_wrap_s
-          - mediatek,mt8195-imp_iic_wrap_w
-          - mediatek,mt8195-mfgcfg
-          - mediatek,mt8195-wpesys
-          - mediatek,mt8195-wpesys_vpp0
-          - mediatek,mt8195-wpesys_vpp1
-          - mediatek,mt8195-imgsys
-          - mediatek,mt8195-imgsys1_dip_top
-          - mediatek,mt8195-imgsys1_dip_nr
-          - mediatek,mt8195-imgsys1_wpe
-          - mediatek,mt8195-ipesys
-          - mediatek,mt8195-camsys
-          - mediatek,mt8195-camsys_rawa
-          - mediatek,mt8195-camsys_yuva
-          - mediatek,mt8195-camsys_rawb
-          - mediatek,mt8195-camsys_yuvb
-          - mediatek,mt8195-camsys_mraw
-          - mediatek,mt8195-ccusys
-          - mediatek,mt8195-vdecsys_soc
-          - mediatek,mt8195-vdecsys
-          - mediatek,mt8195-vdecsys_core1
-          - mediatek,mt8195-vencsys
-          - mediatek,mt8195-vencsys_core1
-          - mediatek,mt8195-apusys_pll
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
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
-    scp_adsp: clock-controller@10720000 {
-        compatible = "mediatek,mt8195-scp_adsp";
-        reg = <0x10720000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imp_iic_wrap_s: clock-controller@11d03000 {
-        compatible = "mediatek,mt8195-imp_iic_wrap_s";
-        reg = <0x11d03000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imp_iic_wrap_w: clock-controller@11e05000 {
-        compatible = "mediatek,mt8195-imp_iic_wrap_w";
-        reg = <0x11e05000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    mfgcfg: clock-controller@13fbf000 {
-        compatible = "mediatek,mt8195-mfgcfg";
-        reg = <0x13fbf000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    wpesys: clock-controller@14e00000 {
-        compatible = "mediatek,mt8195-wpesys";
-        reg = <0x14e00000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    wpesys_vpp0: clock-controller@14e02000 {
-        compatible = "mediatek,mt8195-wpesys_vpp0";
-        reg = <0x14e02000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    wpesys_vpp1: clock-controller@14e03000 {
-        compatible = "mediatek,mt8195-wpesys_vpp1";
-        reg = <0x14e03000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imgsys: clock-controller@15000000 {
-        compatible = "mediatek,mt8195-imgsys";
-        reg = <0x15000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imgsys1_dip_top: clock-controller@15110000 {
-        compatible = "mediatek,mt8195-imgsys1_dip_top";
-        reg = <0x15110000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imgsys1_dip_nr: clock-controller@15130000 {
-        compatible = "mediatek,mt8195-imgsys1_dip_nr";
-        reg = <0x15130000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    imgsys1_wpe: clock-controller@15220000 {
-        compatible = "mediatek,mt8195-imgsys1_wpe";
-        reg = <0x15220000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    ipesys: clock-controller@15330000 {
-        compatible = "mediatek,mt8195-ipesys";
-        reg = <0x15330000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys: clock-controller@16000000 {
-        compatible = "mediatek,mt8195-camsys";
-        reg = <0x16000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys_rawa: clock-controller@1604f000 {
-        compatible = "mediatek,mt8195-camsys_rawa";
-        reg = <0x1604f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys_yuva: clock-controller@1606f000 {
-        compatible = "mediatek,mt8195-camsys_yuva";
-        reg = <0x1606f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys_rawb: clock-controller@1608f000 {
-        compatible = "mediatek,mt8195-camsys_rawb";
-        reg = <0x1608f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys_yuvb: clock-controller@160af000 {
-        compatible = "mediatek,mt8195-camsys_yuvb";
-        reg = <0x160af000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    camsys_mraw: clock-controller@16140000 {
-        compatible = "mediatek,mt8195-camsys_mraw";
-        reg = <0x16140000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    ccusys: clock-controller@17200000 {
-        compatible = "mediatek,mt8195-ccusys";
-        reg = <0x17200000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    vdecsys_soc: clock-controller@1800f000 {
-        compatible = "mediatek,mt8195-vdecsys_soc";
-        reg = <0x1800f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    vdecsys: clock-controller@1802f000 {
-        compatible = "mediatek,mt8195-vdecsys";
-        reg = <0x1802f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    vdecsys_core1: clock-controller@1803f000 {
-        compatible = "mediatek,mt8195-vdecsys_core1";
-        reg = <0x1803f000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    vencsys: clock-controller@1a000000 {
-        compatible = "mediatek,mt8195-vencsys";
-        reg = <0x1a000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    vencsys_core1: clock-controller@1b000000 {
-        compatible = "mediatek,mt8195-vencsys_core1";
-        reg = <0x1b000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    apusys_pll: clock-controller@190f3000 {
-        compatible = "mediatek,mt8195-apusys_pll";
-        reg = <0x190f3000 0x1000>;
-        #clock-cells = <1>;
-    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
deleted file mode 100644
index ba1b36fa0169..000000000000
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
+++ /dev/null
@@ -1,77 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek System Clock Controller for MT8195
-
-maintainers:
-  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
-
-description:
-  The clock architecture in Mediatek like below
-  PLLs -->
-          dividers -->
-                      muxes
-                           -->
-                              clock gate
-
-  The apmixedsys provides most of PLLs which generated from SoC 26m.
-  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
-  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - mediatek,mt8195-topckgen
-          - mediatek,mt8195-infracfg_ao
-          - mediatek,mt8195-apmixedsys
-          - mediatek,mt8195-pericfg_ao
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
-    topckgen: syscon@10000000 {
-        compatible = "mediatek,mt8195-topckgen", "syscon";
-        reg = <0x10000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    infracfg_ao: syscon@10001000 {
-        compatible = "mediatek,mt8195-infracfg_ao", "syscon";
-        reg = <0x10001000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    apmixedsys: syscon@1000c000 {
-        compatible = "mediatek,mt8195-apmixedsys", "syscon";
-        reg = <0x1000c000 0x1000>;
-        #clock-cells = <1>;
-    };
-
-  - |
-    pericfg_ao: syscon@11003000 {
-        compatible = "mediatek,mt8195-pericfg_ao", "syscon";
-        reg = <0x11003000 0x1000>;
-        #clock-cells = <1>;
-    };

-- 
2.55.0



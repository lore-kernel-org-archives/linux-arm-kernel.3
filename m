Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D595C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rznLVY8pb2jpUq3mMasDfkzPYad2UGsKfQeQX4YhzO4=; b=Pd7LqovFryxDfBWBVEpiKOEVJ/
	8/1Sfg80zvrfPbDGSZAbHo/ydhX6DODZohufBjzcAGzORf3L3ONQ3iVcM/vpJAcZDtBzt4Meew1w3
	+9mXP1VKLHPETivne9BsiL5qJlzGzfd79mPLKJh54Cq1OpFPC+r8RycGXveF5RTOTg0hzUrhFQBZ2
	Fq6ylaqNGQx+hktEFgwUraE+WSyMZ6mUnWtnFs7fjN+II4kw1x9K6yp4P6Ps1dedbUdzaiWKpgq2C
	i4sq7WJpHSgxS2qc3oMeIBpQd+HOP/7Huee9I39pdcZWi6BrPzsBYISgYkRo+NPD2FO7ta9PzEuPN
	QpZ/gUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuZ-0000000FHvQ-2bLB;
	Wed, 12 Aug 2026 02:41:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuP-0000000FHn2-3oFP;
	Wed, 12 Aug 2026 02:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5CB560A84;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C9EBC2BCFC;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=doW9pi23sj/cTxrC+DwemhpJKoEXzoywgavV8mxVNQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cbhPmIhMLgQYiSG1Ubzs05SaREDQCdPPozb+Cldin5lwh4vJvuXg2laG/+bOOVw1u
	 Owr9M7L4/1td9P49KIDqnVoVKXYz30ag6ejyw3cthjtEcQHl7yn4WU/+H4mR3hFMoa
	 ZiiCrmJq09YWzamxaU40aqUn2T6+pab+05qrUinBP/fyVEgJVeAVi/cq8lGUatLFrP
	 vgoA9PV+N3KwzGD3HUtZkkxX3negJ8d+1k2olCWuaMeczvAWfx2FxjgAyIgx+JDT9D
	 vsBvjZ4Cnio6cb3WVsQRkCLqJ6YVAU3t2CXuKnDUQUYKEcqbsGFOfR+Fomi7D0j0Io
	 l+8eCpQoWHaPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64426C5B572;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:25 +0800
Subject: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=3409;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=gqN9jbMMxVH85rt3rKwM/onT1L7aKjc77EyNsOG4BpA=;
 b=K2/ILBECnfUNQAvLiG7A090qY3l8bQ7AYEFI5l+pWGpBie6MSsUb2MzpGf6+/1BfFanax8G4a
 HxRjOiOxOa3Dl7IwQrqRnhTsTFK9pUjSXVC4EHZhzRH7NN9NfKi9ih7
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Describe the initial support for the V4L2 stateless video decoder
driver used with the Amlogic S4 (S805X2) platform.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..b5af3f931b26
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Video Decode Accelerator
+
+maintainers:
+  - Zhentao Guo <zhentao.guo@amlogic.com>
+
+description:
+  The Video Decoder Accelerator present on Amlogic SOCs.
+  It supports stateless h264 decoding.
+
+properties:
+  compatible:
+    const: amlogic,s4-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: dmc
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: hvdec
+      - const: vdec
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: dos
+      - const: vdec
+      - const: hevcf
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: vdec
+      - const: hvdec
+
+  resets:
+    maxItems: 1
+
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  secure-monitor:
+    description: phandle to the secure-monitor node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - amlogic,canvas
+  - secure-monitor
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vdec";
+      reg = <0xfe320000 0x10000>,
+            <0xfe036000 0x20>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "hvdec",
+                        "vdec";
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "dos",
+                    "vdec",
+                    "hevcf";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hvdec";
+      resets = <&reset RESET_DOS>;
+      amlogic,canvas = <&canvas>;
+      secure-monitor = <&sm>;
+    };

-- 
2.42.0




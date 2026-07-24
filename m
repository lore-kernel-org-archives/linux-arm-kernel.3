Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5AC53214
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70NXaamRn7Tew+JKyHpgLtFgUnnAOuyIO2OH1ak0g/U=; b=DyOprZ7PsSpAU5iNAhUgKHYUEE
	2zQ/TQK6DD39KrsTke5XrDM2GnXZ6F2kx7Zr7UN2fwePC2Yi0uSX6CjX+TRH0DjQc43lA+QVJ25a0
	JznHa8eOffgDOLeefOq2V1G0lz6LRWwlUu/xZ1cz4NWdKxItxRoo+fAvfk0+6f8zCfsoad8pC4+yB
	g0jD0MlusUWmyCmhJfDrmhcmvf3QmCFUi0LsvaOIA2yDew7OGu0LHBscpfGLmV0Ea2BYPVcxDjQxL
	669I0DdWxWQk5lUIFNawc0ovJ6QM1Ymcj7GhWj/Ci6scbu8J3VaaAnZHbQ3IfM/B5k8AF9Y7qtGpz
	FYOMW8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9y5-0000000FeKb-3m9I;
	Fri, 24 Jul 2026 07:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9y3-0000000FeJA-0WzD;
	Fri, 24 Jul 2026 07:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A92145038;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A9A5C2BCFD;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784876709;
	bh=HbDm3MaRy5luRr54fSjkCIxl0iG/cmZ6ibtyRahFCyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CzWy/GPeiA2I6PTSycTU4YX0kclMSO3lX32kRXg1YIyoi1siXFvORsqlbAbpz+Nu9
	 mf7FmOOiMFbCz0WOKCBoGq0e65JzCE76SnTZw2ijojmXWnMKm8BjGFU9oGLxBMeffy
	 kmEzw0iP99b1yreJboXH23vQQ2LVkI3lcFaEpcaQwe62mTTQ8Fyw1rulaNuNSubUwH
	 I5Ipczojn7yX2BEXtnxVOhsNCqptu9DNH3RTiww/wWrRkdeJ5iK3A4hMEuVUtYeziq
	 f4P5TJAsRBnokTdjZu0OAUgjFHtOP3P+76hNtGt5ddoCa1cIl9a+B6L4RyuMWSfUsU
	 lt/+g97H6V5dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B7EC531F9;
	Fri, 24 Jul 2026 07:05:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 24 Jul 2026 15:04:53 +0800
Subject: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784876706; l=3279;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=Z6EOYrybE4FwQa2JPELwUlSBBqVih6opcvzLnX0kafg=;
 b=Bcd0E3m01QGxq2H0qaAOGQsZaKGF3fwL+gGechdY9KwVXYHGsS8w1J5nRmRIW7jgP4hCora7e
 VYUzWrK+t85CZTZqF6uAjOMFA5Me1w+vpp3PA7sojWBlXxGK6rPvilH
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
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..e3c2ab4000aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,103 @@
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
+    maxItems: 3
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
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
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
+      amlogic,canvas = <&canvas>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
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
+      secure-monitor = <&sm>;
+    };

-- 
2.42.0




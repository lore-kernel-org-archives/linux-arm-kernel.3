Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE4CCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITNN2d77woS8/oO2KTddZEEt1+FM6fc3S5DowG/WmFM=; b=VDMAzsPiNgxO0xU/g+CYxnPnuS
	U5jxVjWvO5gfs+pb5miKxYM7yyLZ3va3m2NTVntm1dKLXeNFID0HGxoctpV2hxocJRN4kan3oaDkK
	xnoQ1WKKaIkz81z86Mcjn0KeFTlGx2ldyQddprb4K4fP4bXV3Z7Ewc/F6phpZrhGjgr4SFcySqHjL
	mJWuRWD/NucdLmosyAsYXYeu3I8BpbZQgJwO8r4kcXKIns0DDYc1A/el1aA5quEfCJNx/lhe5c4pa
	wFqa8dAZY/Vh26eI1Toy6RjLcoqrg9lBtFOZ3oYbbEXjH+iwHh6KblAn6/7OhvwoYpAaud7t4gwbd
	kB9LUiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNJk-0000000B1vi-0QYn;
	Mon, 24 Nov 2025 03:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNJb-0000000B1sL-3fkl;
	Mon, 24 Nov 2025 03:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A08F3442E7;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B38BC4CEFB;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763955154;
	bh=+vUEeQ+oKBW42P4bNYyEWDh9IPPF0c9ajm6FdHUtDgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K2QHG2vgHxz4OUoqZIJnJvp0v3udBmajr5kDfVQaUPleIqOk6iPHRCevoyK/gt2a8
	 HI7TKc0JY7QBIozsVWIqHJQOF/DuzV95nakrdG3s7aurQUXWUFhTH0BUOUhaC25GZ4
	 au6y46lSOnRgFASjFImqu3o6OEsAJOiiJI9nLh49WXR4yHt+KuWt/ZSdPiOWsl6s4f
	 UwtkI14Mopwm4EUmgYM6lxfwza/6uMjz1MzaEuZDOjrx4il2eUsJTpM55NFAlnJGTh
	 /TVYeJBsEdTR46KSui/KfzqFtNlOpvuufI46mAGbzkJhwRgsgSUZXa53sTgjmp1xuH
	 YSwCmI0ELv9ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CD6CFD317;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 24 Nov 2025 11:32:17 +0800
Subject: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video
 decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763955152; l=2874;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ojBHIRmTFbfRhSiNqZUE5wWfU7fFlbxeePD+nSCZSVI=;
 b=kGEEn3iGlSSJBNB1XpOPFEICT4DGpDfrFEJEg69bILFh9RhP7d7k5fE+S9k2RsjSPo4YIyogm
 DYyPCIQOM9RA62C8DdE4iCXsXY7/tXicnfpo4P9NNfSKzyGxT68OxzN
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_193235_970197_D0DEC221 
X-CRM114-Status: GOOD (  11.21  )
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
 .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
new file mode 100644
index 000000000000..401a5a32902e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
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
+    const: amlogic,s4-vcodec-dec
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
+      - const: vdec
+      - const: clk_vdec_mux
+      - const: clk_hevcf_mux
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: vdec
+      - const: hevc
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vcodec-dec";
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
+      clock-names = "vdec",
+                    "clk_vdec_mux",
+                    "clk_hevcf_mux";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hevc";
+    };

-- 
2.42.0




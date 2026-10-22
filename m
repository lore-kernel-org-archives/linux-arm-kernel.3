Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=onMGNjeV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nE9PSI1B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZw7X4lb3ksfrAnMAuxx2fg6EzYIhAqap3eUmHgRVu0=; b=onMGNjeVwpIKs5
	jA575/zKYljGBMm1Msf8chpzvdmTOPFw3verAlQ11MgxylcXCtC+Oa+PtNnvx8hyb0Q+gdKP6rHsz
	DL8bmHCGEygzKYCJwswReFDdmEZau3RrN/LYABf2gCBXgyXXVLFr3doNcPGTK1J0h0o0zZKWhodi3
	AMazbKothS0jBOMEFVo9d+zXXF9jX+jGIVd/fMlPzgEwmguhmSbAjd2EOi0diNPpCCeT7Yf3w0MFI
	g7BsgN1XK+M1wS9CpQE5qnC7QTwnv6R9txZzuAqsRZAGUTY2DfCGp2AnpOtE/baEzq3+EY2JRL0Vn
	jctLIgVEOuiFR10tk/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKh-0000000DNjJ-0wtt;
	Thu, 22 Oct 2026 05:27:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKe-0000000DNgW-3E0v;
	Thu, 22 Oct 2026 05:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E8D260211;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646835;
	b=m3r7tcjnBXTd+X8wnNnjUljdNzM79xURcz28VK3iFotYLctYACR6GFv/tfHW/3KZ58Er
	 BannArVORXj76rnc9JKu2pRGBODPMepR2KVo7IYTx/eXN+tCwHknv52hLfsJ/t2QBW2aV
	 q1yTec6htU6hSk4C83SP07oj2TT05YIo7qJ1wYxoqBSNyeygmtOmiSVDb23gJ07VvAmEy
	 YpYRnBU3hu2kozsrG9Q9PM5rMpdiD3OHk+hLXKyZTECMZnXYDVK7C2IfcWJIZ+6A55IER
	 4SVsyotjHKXywlcgvVGAqADOsN9qPEYQelNAl2pTRWvcF288JhrSH+eOloGyaSDsOQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vZw7X4lb3ksfrAnMAuxx2fg6EzYIhAqap3eUmHgRVu0=;
	b=Zg/GoOg2lqqHmZQ7IPhKNXC+4cxywKbG48aFV6nsHj6UeaLeVLIUVvxXO58P82YCj0po
	 YSpe1UsuFdCrZghULqSQKCsKi9jKmBnGvN6HN2yILfBH5BGWp3Awiq72gf08v32mOe0wD
	 iXqsOw+S3vJS8xmKxNU/wWUUPevD5SpW5ZfzvzTE/cy5vdS/B8T/YKZyl/0N6y7iF+9hG
	 eGn5JdZlevkSJRZlRLVjKKqLne0HVuznUAxo09ceK+VNxs123PSwQyMrDxFRQWd/O84/S
	 yzQpazJ/Z4dh33fbTJRHCyBGTHcemjinw3sA3ub2Ngzm96LH/yMmZui46AhIQcwFOqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB12D1F000C1;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646835;
	bh=vZw7X4lb3ksfrAnMAuxx2fg6EzYIhAqap3eUmHgRVu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nE9PSI1BkQuX2JUDgREpDWRGo7njCyJXhZe28t7966XvBP7eHNTW33TFCAJuh/m+7
	 hZQ863cuG5OXkk5m3bYA/aBsNvj346k5j11xK+DS/Cc3tdSXZYFPkLWMAnhmFS6DE9
	 I7ssWcD2EyMiRqJsKrStswgVAm0GTWo783Diy3ysdBUXbxxRp7kSvX5gUUYHBYgyGb
	 20raI00TICV+o9rs9TPs+ycE7dSfu3/LJD8e+IitHwBbNJzxdfl5MP4JMXWq5LEpJi
	 3eD/twfgzHDnW2HXFsh8Ob4/drVQXa8Jv5feXRP28ZZwEISGWHxv0XFRLjaOU6+vPH
	 7QCThpYUSU2xw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4F315434E9;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:01 +0800
Subject: [PATCH v12 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-b4-s4-vdec-upstream-v12-3-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=3663;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=sdpnxZqgnjpHOtW3zEsr+0hEfJ2Oq9V4xODbhYXkAYs=;
 b=GOiymRYreeaoKRFwe4SQyASgsTUzFHSGFZZar2eJxjGY5P2HmFfDGJF67XUBGD1zFrFlrHyQ5
 OjEiadj7KuICaBsHqr6TQgdztMOB0ZGWycEd3yPlExUDi8O2jU81bF7
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add bindings for Amlogic hardware decoder accelerator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..75b9ba3cb08d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,114 @@
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
+    items:
+      - description: Clock for dos core
+      - description: Clock for vdec core
+      - description: Clock for hvdec core
+
+  clock-names:
+    items:
+      - const: dos
+      - const: vdec
+      - const: hvdec
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
+    description: Canvas maintains an index-to-physical-address
+     mapping table that allows the 16-bit AMRISC decoder core
+     to access 32-bit or 64-bit physical address.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  amlogic,secure-monitor:
+    description: Used to decrypt and load the signed decoder
+     firmware through ARM SMC (Secure Monitor Call).
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
+  - resets
+  - amlogic,canvas
+  - amlogic,secure-monitor
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
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "dos",
+                    "vdec",
+                    "hvdec";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hvdec";
+      resets = <&reset RESET_DOS>;
+      amlogic,canvas = <&canvas>;
+      amlogic,secure-monitor = <&sm>;
+    };

-- 
2.42.0




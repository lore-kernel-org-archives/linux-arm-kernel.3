Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D94D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWtUjQXCzr+ySLMxAzEGot2HrVtFxNbhWaFqd76Zd+Q=; b=EqMyc0n/W+72pNhGdyI7N06ItZ
	2zgx/FDAM7MJaqNPLm3AeYk5sK0DJlLJV5zxYGe9p9NnSq5BewZkZPTiM49rPmEMxREMwv2xfy9Kx
	xShK7lHOf25ey3SYT/CSu3aHDpWwhE9kOg/csmRe5N6tle8l3y45dIbeMGOO1EbDFALSWGpvQB1df
	mFwP3LN4bLos6FSTlNEMBs6KDVh4J9ZPEEU4peM0WVs0L78UBfw9jfEoh7+2AWlZHohn/2GfXLzeO
	L1UN0h2BoLQCta9R9ZQV9tuw2NN2CWVvE4E94tI4l3v86RL4KD5xP5V6mBeEen0jvwnuCIQJ9NVJf
	L8sBhaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbV2-0000000D8O8-11Sp;
	Mon, 08 Dec 2025 13:42:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbUw-0000000D8LC-0HWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 13:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 230A443CC1;
	Mon,  8 Dec 2025 13:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A79C19421;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765201312;
	bh=P5mZ0L0CwVMV7GLuSdH5kZFL7mttnkSJtjZ3tGQrvzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q8QLWUN/pBOEMi+X4cRPnwVlAQZvRYbuk3as+TbZ6dI7+DQib3uCvnjGJGLok7oOf
	 XL3w4ocEQgqsZKo1zhtn+dmUU8eJkxwCJhE34ZftwCehQHio7PiARlfg5vVVBpS6O9
	 QiAIJfw89/I8aHtNrYRORVt3kN6nkE5zdijwj7Rk1qB621SisJlyBIMhOT/Lnm4/kv
	 cfEU8elMLH9k4WVmuvqanAm+ezdXbSA/WrR9jaw9MR/bwiIaHJxOYSMHRqdzmGZA1V
	 Upb7ZhY91lhIjHyRLBlx/TX/V5eXofCGIR5sg14VZ+EF1pMpKo5OdH1tSPb6cpHCl1
	 j46BxhS+IL1FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02D9D3B7E8;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 14:41:22 +0100
Subject: [PATCH v6 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-2-2e51ab2e4ce9@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=jzj1ta0KXPH3flJwQD/CD3oKP8EK5pemrsqeprwRzpQ=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSaXZ1n+emSlGtTsW2OYsfSO2+u7n67qH5WDN+9vxkdK
 uuuKFdN7ShlYRDjYpAVU2T5YLD02Re2Gp8ZLWzzYeawMoEMYeDiFICJ3GZi+GdtqnoqYLen4FaN
 jswi3k0b3uiUfu90XXZs8tsawVNlaeWMDCdljzR1G+yPFPCdm3Ln5adZ7qn3Nh+N1xXgYAk9+Pv
 ASUYA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_054154_178874_017FE8AE 
X-CRM114-Status: GOOD (  14.68  )
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
Reply-To: yassine.ouaissa@allegrodvt.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add a schema for the allegro gen3 video decoder.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 000000000000..12e86c306d55
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the gen 3 of Allegro DVT IP video
+  decoding technology, offering significant advancements over its
+  predecessors. This new decoder features enhanced processing capabilities
+  with improved throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegro,al300-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: MCU core clock
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-decoder@a0120000 {
+            compatible = "allegro,al300-vdec";
+            reg = <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
+                  <0x01 0x80000000 0x00 0x8000>;  /*MCU_APB*/
+            reg-names = "top", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            memory-region = <&vdec_mem>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc56841fa5e5..67dfc2ee1725 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -837,7 +837,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.50.1




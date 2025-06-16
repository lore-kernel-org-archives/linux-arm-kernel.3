Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B17C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wy1eEeN0xvALPzyPtxgyxgdumjdcF8O3DeQHmcyWM0=; b=k/xQJFlMsTJ9YRqeUjLpAw1PaN
	nNrsUcSh+Ly0qwYfdbIJkFtxRrLiAigbRye4jFrP0jMUhN4xxFFL+JdJ1EAE8orUe629eppIzGAOq
	OHh4AQRt6oVr+BnvkY4NmZDGL+zVXYghJuwX2FDuwPArL5PnzEPaBBHimwYKx3geKwQFKk62NMmKT
	hiU8gWp299OCNwQFNQYLqhex3dHZ//D/vEmup/KpC0rKIzBB9eHFJ9KO3MWVh9VpXzWkFroCElk8c
	B08ISnWuPPbRuKESGMyU7eiW/FF4WGH4GZryn5+yoaV7sXyEEweSrSZlKhpdIb6b8J8msULIqHbU3
	yDQJcDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBim-00000004pCM-1bP7;
	Mon, 16 Jun 2025 15:26:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9dY-00000004Uva-2qfp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E78B7A50F95;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 875D6C4AF0D;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079551;
	bh=1yKsFqTOtYKs6CtFPkdUWGMSnxi9wcLfAeW5U77+sCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ruBYRKEnLCKUVyumgFG+Pqt85TsActo21WnbtkKzJYaiAPcxiXD5RUx+uUi7mRf5x
	 WaO3jzBg+TubvZ18HNpcv8OP+HDOBvO0+RkSrJd1gm2+9RAXzPCbLzU2mlMqtzhJ3J
	 hLT5OydDK6+J45wV/wW3WNkSsh7HLUtB/T5ANMTRz/jq/twrQ9W03nTleLbd8Zirip
	 mPL6LNp/GsvHYtRDxbUJ1SzTqux33ZyUO6cIZ5VEEHfZ8H81DD+wcZBcqOBoilG0dD
	 b5oNOoypE/2fVqQYZYd/yfSra5QOdHQJ4JQaB/VLjPePDmFSXyDI+uQxEENIRdQY1w
	 IFktH/nsuR33g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78203C71136;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 16 Jun 2025 13:12:13 +0000
Subject: [PATCH v3 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-allegro_dvt_al300_dec_driver-v3-2-7d746cb9e5f9@allegrodvt.com>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3303;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=au2dnE7tEVR437ncnXvLO1cFwQ0gkTeQn7UoptUPeqc=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQESNiEvfnJt8DhpcmnI3fbj1783LzSTNS+4KziZM3U+
 qwrSUeSOkpZGMS4GGTFFFk+GCx99oWtxmdGC9t8mDmsTCBDGLg4BWAit54x/C9+nhwZffz+m3uz
 a0VETnAFWN2qSy+032Ig5vzbcOe8D6sY/umUcrhN29vf5/zLdrd064r+Gu9Ove+c+2MW1fxmvm6
 6hB0A
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_061232_861104_E2A89FD6 
X-CRM114-Status: GOOD (  14.80  )
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

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..12e86c306d5578d298ad03a6d59593dd1ddcff9e
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
index 714016079537ce3318dd7c7cd05b6aaf35256e26..b1205e3065d2a854c039431637d446d4a15921c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,7 +816,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.30.2




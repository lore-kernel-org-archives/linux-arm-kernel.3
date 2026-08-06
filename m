Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01FC5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOlTghZ5dr10Yc6yFqqtMtGYCqy/tTOG8jWDdNW5vxc=; b=DDn48V8PrfN84c/KJuGmI+GrUV
	3v5rip/hj6wuK4BPxzUwHoWNilDSPjOkRL0BQ+eCRjMufN0z/JqGp7Q5DCdTCDDyDZXQ70M0et+uq
	bf28N+EKYe27Mcm/yQcW/cAtcPjmkyaSkcvluyt/773KVSDNQhQsMb/B+GZNvlMTZM6FK+pemrgXl
	jYy+xPjtKCtZtkgAjZsysMzF4VLKrc9YITmbWbhbLSdWYriDcD81okvoGib3pJhEKEX1AGe7l8xef
	kjHIJ0KBQSAQHjFTltshSWmPd6gQbkh0lDqGFTBJIc7bYuv1MCyHfjEaehpTYr0WdQpn/relZLMEw
	oHcJpoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUj-00000005OQq-38L0;
	Thu, 06 Aug 2026 09:34:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005OMY-1PVp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A478443FA1;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 715A2C2BD04;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008866;
	bh=Nlm5hTHmD3jVsjGjeCec+uJpTqsxuKfQw+NDZdxHGoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t95zQJejNNWaf44gVX1XbrLkTX/Js0YD3NmiU/Rapaf7/VvToPBUGKSuKv7qb/Djs
	 7in/ykeMEKANpMFTaCgKM+AOJ06E6z17w+r7pA1NyyyzmIIBvcMOpIZlxlTs0VwBUL
	 MxZzkooVYLRDQmMmz5ThAlrtDWMCU6BoJDv/Zy6ql+3tBGhlSyUPYXuRdwcjpbvyfC
	 AaBDuBNGDLvQOkbungQFw1XeKS3plf0G4gb3kNb3wH24NFi+rTbEct7VGGyoM8nteQ
	 VvuyP3k68lJw3EZLohiVrxv8ZiYxff2Qa1/svrUVbvNK/7N4ASk48JZmxxBskSAEnf
	 RcDqCDsTIVy8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE80C5AC6F;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 06 Aug 2026 17:34:12 +0800
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-4-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=4816;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=9rdubmZ/+QRo7Rx2fG5nIwgQAldJunotrOeXcg9Kbfo=;
 b=F8tcpzImpasxLSOpFpa6um1OEviO7AaVDmtd8wslWwtethIiD275bee1POZMWiMBBcB9DdOFD
 FcfOCqbzGK7AV21UvOdQljOEMAhfsnfobtLOJK/JcoYagHZhqT/ROQs
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add the CV75 pin controller binding.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 175 +++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
new file mode 100644
index 000000000000..3fa30b275e51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ambarella,cv75-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 Pin Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description:
+  The Ambarella CV75 pin controller configures pin multiplexing, bias and
+  drive strength for the main GPIO banks. Pin groups and their mux settings
+  are defined by the pin controller driver and selected by function and group
+  names.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: ambarella,cv75-pinctrl
+
+  reg:
+    maxItems: 1
+    description: IOMUX registers
+
+  ambarella,drive-strength-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: RCT syscon containing the drive-strength registers.
+
+  ambarella,pull-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Secure scratchpad syscon containing the pull registers.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+
+    required:
+      - reg
+      - interrupts
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - interrupt-controller
+      - "#interrupt-cells"
+
+  "^[a-z0-9-]+-pins$":
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        const: uart0
+
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        items:
+          enum: [uart0tx, uart0rx]
+        minItems: 2
+        maxItems: 2
+        uniqueItems: true
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+      drive-strength:
+        enum: [3, 4, 5, 6, 7, 8, 9, 12]
+
+    required:
+      - function
+      - groups
+
+required:
+  - compatible
+  - reg
+  - ambarella,drive-strength-syscon
+  - ambarella,pull-syscon
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rct: rct {
+    };
+
+    scratchpad: scratchpad {
+    };
+
+    pinctrl: pinctrl@e4010000 {
+        compatible = "ambarella,cv75-pinctrl";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0xe4010000 0x1000>;
+        ranges;
+        ambarella,drive-strength-syscon = <&rct>;
+        ambarella,pull-syscon = <&scratchpad>;
+
+        gpio0: gpio@e4013000 {
+            reg = <0xe4013000 0x1000>;
+            interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 32>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        gpio1: gpio@e4014000 {
+            reg = <0xe4014000 0x1000>;
+            interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 32 32>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        gpio2: gpio@e4015000 {
+            reg = <0xe4015000 0x1000>;
+            interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 64 32>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        uart0-pins {
+            function = "uart0";
+            groups = "uart0tx", "uart0rx";
+            bias-disable;
+            drive-strength = <8>;
+        };
+    };

-- 
2.34.1




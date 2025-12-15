Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987FCD5B86F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jnyu1SfXIXnAb6zGYhME3tSm9u3RKP4XHaNdCt5lW8I=; b=hV1bNe6VL4hdErTxczsFHIOv65
	4uxyycEHISWIQd/K1DCY44UIIGp1Eb+xem05hKV5I4EvqHO/nJu8z2pExHqa+kNZt/5NO9mBL7sUt
	L7ouzw20EJSDSraxbGcy8FaXtmALPEbOgK/7E1xCKZ/qYGJrEWKtPDcEASodPYf1IU5ndtW4VWdP9
	fhUPiDhZDmwE0RlppvANittCbZ8Mrb0tZxrESt9YaIAsF5wgDJD/pLPJl8tZ7cRsIqMgteVy40cvK
	VmYcwVLtLsJb/Y5HAhBOb9myO3k8d7oIiuuoe7LIfCnrBwKHQ1veHALyW3wjydXMmDB1cBxchvdkB
	a1my5QXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG4C-00000004Hao-2vyh;
	Mon, 15 Dec 2025 21:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG49-00000004HZC-0yrH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D57B040958;
	Mon, 15 Dec 2025 21:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82340C4CEF5;
	Mon, 15 Dec 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833912;
	bh=V7dIumNmjYaERbd0MD+B76a5NTQazRSqsfPFCXAda8M=;
	h=From:To:Cc:Subject:Date:From;
	b=PSrHjL1NyaKYOCJLAbtqICw5Fa70sDSRWppz77LxTSMugaTuUuiMUbz1g/iuhYzX6
	 S2IiiiPYs/iguAMH+79tsAVkw0uuwGvDoTOgsq7ph06TP5zUeuS7SbfjyWRI1bjcEI
	 2QPnYf3pKy6nBBKJIfH0epLKaDP/x5FmKTtXofUzqCwD77DA2MkDtHNFf3P5q5FUo6
	 e5P2sI/mXeRN6WTF/R2YRYWpMZG/StrYOGBp/cdFFWZIXO3W+5oxg1FlU7qAEma3Gt
	 eJx+jZBgXj1G/LTljEYFrown1KAQbnej04ETwGVYsMztcoreRF5MC0yxqHelMClHEV
	 vTsBbNrrFGwpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
Date: Mon, 15 Dec 2025 15:25:06 -0600
Message-ID: <20251215212507.3317805-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132513_313219_B204169C 
X-CRM114-Status: GOOD (  12.13  )
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

The Socionext Uniphier DWC3 controller binding is already in use, but
undocumented. It's a straight-forward binding similar to other DWC3
bindings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
new file mode 100644
index 000000000000..892ae3458c1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
+  - Masami Hiramatsu <mhiramat@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: socionext,uniphier-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: socionext,uniphier-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Host or single combined interrupt
+      - description: Peripheral interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - enum:
+          - dwc_usb3
+          - host
+      - const: peripheral
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  phys:
+    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed PHYs
+    minItems: 2
+    maxItems: 6
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+
+unevaluatedProperties: false
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@65a00000 {
+        compatible = "socionext,uniphier-dwc3", "snps,dwc3";
+        reg = <0x65a00000 0xcd00>;
+        interrupt-names = "dwc_usb3";
+        interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "ref", "bus_early", "suspend";
+        clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
+        resets = <&usb0_rst 15>;
+        phys = <&usb0_hsphy0>, <&usb0_hsphy1>,
+               <&usb0_ssphy0>, <&usb0_ssphy1>;
+        dr_mode = "host";
+    };
-- 
2.51.0



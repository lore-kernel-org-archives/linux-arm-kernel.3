Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BA3C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yC5tnwt+eZCDG/SfjgdC6zXxTMsUKrOW/ojqL/NvNJQ=; b=xLoWkU2VVSWLwiTtDdNFTmwFXq
	MuescOInJqN8DIwwMzEHHxytQQnuesanNxTHy/8YB5juAGlJ9Jdfqpxxkl80f0TpmDxo/3olc4Rrb
	X6egniOXnDoaT4IDThqXIHgUeDaTVatysOVH/fxbQy1RyQ5/GpI+JYuLkHbmBaSwnxJ9B1zYU682G
	Go/CLLkTNd+4CFWjEUaKEWkve6jojkHwWAl2m3faYRUAt0ClvI3EWLvakFoi6l3p6BT7Dn0/IuIIm
	FAKTazXzvTDHWFzwDRKwKCwhw1cKMmJu2XdhUF3s2SeQ7A+O/HLaFKlK1VLPT20TIfNvzkMpiEHQt
	QHYx1/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnNg-0000000BjGL-1Vss;
	Mon, 05 Jan 2026 16:24:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnNf-0000000BjGF-34LQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 172DA60141;
	Mon,  5 Jan 2026 16:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B09C116D0;
	Mon,  5 Jan 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767630270;
	bh=lYCW3siDQNRZY+GsyMzVi9UL/1vFDJTQoDJqk5WeLXk=;
	h=From:To:Cc:Subject:Date:From;
	b=GPjcKII0OHEUX4sJTxAE62ChobNYZmkA/Y73pMem5xTDSVO5jhPzKqBCMAVJTQRwm
	 7Yt1EsjtuZiZnM77g2ULdAc2Y7y9v9HO0v8QHt8Mb9zMCT5TULXuU1UT7O2UQQc+0a
	 LbqTZJ4M7wFSU6ZlyR67Ifn9LFgcfup5aOpCujbJLhzK2AgvPzeiG37W4iCOCC2SM9
	 cep0MaDn6gAKbW7AQVSS57ZwNb4iSGTLg57ur7j1PyZWNEZraKrvYsOpUfD2TlXCvX
	 OketC79ovpwhXE13BuTiCpBC82BUk2BzQTMsGiFBsBdS4yEs+FIB6gYNicUr7PalTg
	 tSudURb0MsIEA==
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
Subject: [PATCH v2] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
Date: Mon,  5 Jan 2026 10:24:16 -0600
Message-ID: <20260105162418.2842825-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
v2:
 - Allow 1 phy entry for Pro4
---
 .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
new file mode 100644
index 000000000000..2b253339c199
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
+    minItems: 1
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



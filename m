Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDl8iUnMg4P+thAe4M63BIt0gWdZOpeVZLj/v2vJrkU=; b=HhdcNF8TxB3qb/FLRGUdOZMOCz
	fOXJ7UB1qGFNk7yQRmej4fSgBw4dlaunNvzlXKnXfJEZJaQZBE+Y7ogZCZ3Sa8q8iBMlIPCrt417Q
	BPr1QYQt45vuMrHJ9JTctigEXEBbMyS0ptYu6SlHSdGBvGukZE8TfZewIOvMWyPpURV7CbS2/ifbX
	Cbr737IIK07YMSjsLkWQl1SwGXFLnpo0u73RBD1aqQf0T4V5k5ywSs1nCIQ/+HP4FTDsmedI/6A5e
	0uw+PjizhKjGPTOo52KMsZenT1GXL+D+oNM7UzJCNHJYaKOsSwcc0V3aZGHH/mQhTTG/y/wAw95C6
	DBy6r/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzK-0000000H4cM-47S3;
	Tue, 30 Jun 2026 12:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzC-0000000H4Vw-48gF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F7B543F7E;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6984AC2BCC9;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782824086;
	bh=c7dco5weVexbDAMt6Y4/pHS14uEsNEudzF+M7amuXCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxOIjHkMJwNCvSNa5jocktFvXyl/coEQjHlyHOgPTxCokGyIqT5YAtUCUPNbXW6Px
	 5mDKeiE7+qKtJOwIswlpI9RcabHL2reHHOfifYtELAGg07l03PW79Z5DXR9kyw9DCY
	 VMx6X7Z9GhZio6wnDTZb6AgBU+tL0zBjvXh2LrDYr7RfDA6zYSEpmzdOIo1/MOEsRZ
	 E6wxa4ePMcIbribEFll7bTNTw+BgOFJq3IYjn1Gj3CZAvJl6HVYWlVTwfmHhsM8Pif
	 ZfvmwdvgEgu7D/TYQq+X3fUxVY7m5lOyy/r89vQBbI1J8NKRZwO7p3gn5BNOEXyp2t
	 /czKt0mr44usQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F0C43638;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 30 Jun 2026 22:54:30 +1000
Subject: [PATCH 02/10] dt-bindings: mailbox: apple: Add DockChannel mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782824083; l=3372;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=qTwrlgJUrpkywdb2F2oQ2ZLa1OFi9nFHKwuUTUdwhbA=;
 b=zhPL7D/L3ecCBBmc/Pkjy4JwKtjBdT8TJvfmlR8jtYbmZ2arPjeKdRCAuUY+I1iR9onA7CUrW
 eNxr+F33BbNBOrA1qnapabIls6hA93fbn8FingnrPKFX0pY2KgefvA7
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

DockChannel is a FIFO and interrupt block used by Apple coprocessors
to exchange byte-stream traffic with the AP.

Describe it as a mailbox provider so HID and future serial clients can
use the common mailbox API.

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 .../bindings/mailbox/apple,dockchannel.yaml        | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
new file mode 100644
index 000000000000..4f326d8f3d5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/apple,dockchannel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DockChannel FIFO Mailbox
+
+maintainers:
+  - Michael Reeves <michael.reeves077@gmail.com>
+
+description:
+  DockChannel is a hardware FIFO and interrupt block used on Apple SoCs for
+  low-latency byte stream communication with co-processors.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: apple,t8112-dockchannel
+      - items:
+          - enum:
+              - apple,t6020-dockchannel
+              - apple,t8122-dockchannel
+          - const: apple,t8112-dockchannel
+
+  reg:
+    items:
+      - description: Interrupt control registers
+      - description: FIFO configuration registers
+      - description: FIFO data registers
+
+  reg-names:
+    items:
+      - const: irq
+      - const: config
+      - const: data
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 0
+
+  nonposted-mmio: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mailbox@24eb14000 {
+            compatible = "apple,t8112-dockchannel";
+            reg = <0x2 0x4eb14000 0x0 0x4000>,
+                  <0x2 0x4eb30000 0x0 0x4000>,
+                  <0x2 0x4eb34000 0x0 0x4000>;
+            reg-names = "irq", "config", "data";
+            interrupt-parent = <&aic>;
+            interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
+            #mbox-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..741974f0f326 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2594,6 +2594,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
 F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
+F:	Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml

-- 
2.51.2




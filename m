Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E003BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxjFzFBuv9setY3GEXZW1QUDUWoqolXRQSZMEdeMApk=; b=f7Gu1dhqWZnIK9rOE4yHtPTPeI
	Gb/RnU4ghdp81npnq1lUedKgKsqn05yk9YYbV3pcyf+s47AiniUx5gw1h2L8D4gU2sjFxF3Ub1N5K
	JIrOkpc8tAi4q+UG9Vx63RgclyKUJMdJsCfcOg8lrcQRa4lSTyvlaBkjtpuV6hsWbcw6LBcr/h8lb
	IGQpOJ5AYqbLBQPzCyoVy5MN55j/JXs5BM97ROcigKeZnEX95OaQj8zf7opvtPKYuqGK5zlQt5Hp4
	fh8g9uMohfpyONAqLlGTdw5lw/+rfWuTw0ZjtKyKFnJi1p4f8iRUWU6YYsN/JTsqS6ttoSeMcWfeK
	8IMGBETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4kF-0000000DHRq-1pEx;
	Fri, 25 Sep 2026 12:09:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4kE-0000000DHQi-2EoH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9575243D4F;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5571AC2BCF7;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790338177;
	bh=Kf9gvIhCBn9QevLLq2R3J3WgNziUXLOXSzIqFtO+NZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jHW7HLKRvuByMk8Q3nZg7C8JKlwBtgT9n8XlYkF66clvxRb+oPU4Y3LZjpcab/ZVL
	 DQD4uX2bVPt/9WpWfcz/QujatwTkjF3Zqw67T3IMSIt/AMSRzKncEJ5p5TMz8Tgw1t
	 kYdtxHqmOqRVM9GIsvNr++Xe3d80nE1pRHQYdNhm6JmvLSBDTlRXJ2TcXtWKJoyhrg
	 QUKhAer+dKm/tLXF0CZtKsQQv1Jz/06lSYr4VaD9lxYyYdOf1V14sz2fVYlwubpWVK
	 +wIqb5JR/gIkAucxIWerH7a7eJCHJDLm4l9HC/0MPRUtaBBIrnnpwuR2a8lZlAO+qf
	 NjPTzmJdIbwQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35575C98321;
	Fri, 25 Sep 2026 12:09:37 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 22:09:29 +1000
Subject: [PATCH v4 02/10] dt-bindings: mailbox: apple: Add DockChannel
 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-apple-mtp-keyboard-final-v4-2-304c267518f4@gmail.com>
References: <20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com>
In-Reply-To: <20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>, Julian Braha <julianbraha@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790338174; l=4166;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=wjuQxiC5MrfndsNZKrsbL/Dah8aA7f3onm2i59wCOVU=;
 b=VAYTSP6K0OKOMzv+cyPoo938TMLqzJBtlKtq6tqC0BYzoSiLhfVXE337qS+z9c6Dr7+xJQ0DM
 LOEqe92zLGqBMFs4C9fcaiVPVplBj3XRAphaVMC16eZk4lZgrDgS8is
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
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

Describe it as a mailbox provider for HID and serial clients. The FIFO
interrupt pair is configurable because MTP and DebugUSB use different
pairs.

Suggested-by: Yureka Lilian <yureka@cyberchaos.dev>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>

---
Conor's v3 Reviewed-by is not carried forward because this version adds
the apple,irq-index property.
---
 .../bindings/mailbox/apple,t8112-dockchannel.yaml  | 88 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,t8112-dockchannel.yaml b/Documentation/devicetree/bindings/mailbox/apple,t8112-dockchannel.yaml
new file mode 100644
index 000000000..9afd58613
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/apple,t8112-dockchannel.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/apple,t8112-dockchannel.yaml#
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
+              - apple,t6030-dockchannel
+              - apple,t6031-dockchannel
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
+  apple,irq-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+    default: 1
+    description: |
+      Index of the FIFO interrupt pair in the interrupt control registers.
+      TX uses bit (2 * index) and RX uses bit (2 * index + 1). The configuration
+      and data register resources must describe the corresponding FIFO.
+      If absent, pair 1 is used for compatibility with older keyboard nodes.
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
+            apple,irq-index = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a..0183c3e1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2643,6 +2643,7 @@ F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
 F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/apple,t8112-dockchannel.yaml
 F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml

-- 
2.55.0




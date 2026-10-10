Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21ECA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkRk1b0acKcNtNb5LGbx/EpjtFCkjlQU51LIog+QBM0=; b=mBAPE1BvjSV69fgPDu7YL6qj3p
	kwECxCm3Ofiufh0lHI+QXWGxUb06Lnsdp7BA4YvUG58eabjI43MULo+rTkzka57W3cCA9UK+PyP4A
	QTyidDqqB9MXqtBk46giu12QYbxGODYKTU4iOA5csmQEI9S+CZezNvuPxeObBj8BHG/IbCoyN/00N
	PbkOE9rsaylV1Qqimu2OYDNYCSlVK98yYLUYFGqZ9SeggUy1KP68ob5wW7P7gw8YIrca2R09vZvOZ
	kMzGJWFpmnCfqAGL2rPerXlrDWlS6fcKUtzgGLF/OMq6JFbMYIeYlWMKfQkrikxMqFccOkZ96J5Og
	cecBzWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTX1-00000007mn3-056R;
	Sat, 10 Oct 2026 09:38:19 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTWu-00000007mjC-3fAU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 09:38:16 +0000
Received: by chaosmail.tech (Postfix) id 94BD91CC3B9;
	Sat, 10 Oct 2026 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1791625086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkRk1b0acKcNtNb5LGbx/EpjtFCkjlQU51LIog+QBM0=;
	b=HC+LZM4dYfGd8D6lih2rnmfy5ULP2O+7DJZgB4ZBrZgihlv6WLp+LWN9Eo8OZsfXpdSMsN
	D1H8q3YSEmzS+pzJiZ+5FrqOGERGxpowIYj/5RCMVJfC1rFLmBA3MQ/xjtBiO8z1Ezv5dG
	nh7sXDOEGzjzkihUqKDDkqEghXG9kBk=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 10 Oct 2026 11:37:55 +0200
Subject: [PATCH RESEND v7 1/3] dt-bindings: usb: tps6598x: Add
 sn201202x/ACE3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tipd-ace3-v7-1-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
In-Reply-To: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791625084; l=3481;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hSa4L+QWc2uDvx/tqmkiTHw4LQoP2Kt3Eb1meqwGiAc=;
 b=3sE9VFqok7hPqDR4glc4T5rxGsoKkGlSnB9Cs6TXcXoEDRpSdUgRpNouzw7cWZWUzUeLmajyK
 uoYJd+TUSuiBf4Fl0TE8H0nqc2aTw22Td9jmByEmm0cevMWJ34pshL2
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_023813_391927_34996A7B 
X-CRM114-Status: GOOD (  12.60  )
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

A variant of tps6598x that is attached to a SPMI bus and is found on
Apple devices starting from the M3 series

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
new file mode 100644
index 000000000000..133a71bbedb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,sn201202x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments sn201202x Type-C Power Delivery controller
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Texas Instruments sn201202x Type-C Power Delivery controller
+
+  A variant of tps6598x controller also known as Apple ACE3
+  present on hardware with Apple SoCs starting from the M3.
+
+properties:
+  compatible:
+    enum:
+      - apple,sn201202x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Primary irq used for tps6598x events
+      - description: Logical register selection completed
+      - description: Standby command completed
+      - description: Wakeup command completed
+
+  interrupt-names:
+    items:
+      - const: irq
+      - const: select
+      - const: sleep
+      - const: wake
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        usb-pd@c {
+            compatible = "apple,sn201202x";
+            reg = <0xc SPMI_USID>;
+            interrupts = <11 IRQ_TYPE_EDGE_RISING>,
+                         <13 IRQ_TYPE_EDGE_RISING>,
+                         <17 IRQ_TYPE_EDGE_RISING>,
+                         <19 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "irq", "select", "sleep", "wake";
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..ba4274ed9c79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2659,6 +2659,7 @@ F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.56.0



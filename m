Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B5C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaJSUiufXIynJEgTY1t0ImnJ5PfelP7FV5KKULtlBS8=; b=htlHkCR23S4k0hiVb6LO7adL3N
	MgOxLZKEf26aierwgjwHuggoxYqCsYo1AATU0pbLYJywsNRbpd0nhO5C7HoYtu6HXi8aB2p+Aav1J
	kpVX+SgpKBy8y7lsLmU/yDSBD4Xl6PVw3eoDRAmw9ihv/GI7phkCykw85rqv4oC1Ma2lwV4agtV92
	kwEiuPHn6EmQj8jcsyKe/4t6Eqko8NTorSspHp6Ae4Y7zVs96m64Iog9xeYfMwjEePOtAleINsuAK
	2kz2K5/txATBP9rxMQ9VWQaR5fPDPN7qOlEyWX5PeO9HrzLp/I3DpN7LrHXoKCDBJ0XYJNdpWVqeA
	t8M5avNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGri-00000009kQ7-3bvp;
	Fri, 25 Jul 2025 11:45:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGIq-00000009g0U-15X8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90D9B60203;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB0A0C4CEF5;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441767;
	bh=nSJWxPvm0d7ZIgzF4usQc615UKM7wu43CkTVriDIrQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BJE+taCmBbzNHWjlNEmYwlJsBo5+jDow4WwIZa4PlyQyqhfOtiTHmHJjbK2XJqW6m
	 n/V+0KrUgotqPrPhHUNJ6cgm3fCQ1aMzqx2pbUML7N5BQWoh5vZkzbMvsl4Wo4bA8z
	 WUZW5RERAxMHRPYzc0hLYCNjvommmM40hhlwxNLDhNWbL1cGD1sV702S4Ws61XQl/X
	 QQHpfw1AtQzmcJE/XG0z1Z+m6oI6CMaEpKZQMorR+81SsPRAGKYuBUXUlwrnoxsmXD
	 zmHilQOiRpNmSR/FXs/V6+W7Bx335DNQ28x+FxxTAWxexQ/1tfUPGiI9py9gyeSM7Y
	 ePYV8s144M5yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6E5C83F26;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 25 Jul 2025 13:09:23 +0200
Subject: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=3209;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=rF9ThmeNbuWIand4A7K9APVhfKLn9LFOZN2rquJEp+k=;
 b=NBUSkuO8FqyRzfHY0KNnAzXgkytFnl2C4b0o0jbKBqzdVZIG0purz9BpolG1K58XiMSAvO4F1
 Eq7ZGjZvXgACerV4Gp9M2JEs21Jt66+BS+Jacdg3U5djqDQsac5PDRQ
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with intgrated boost controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..63baf1cbcbb14ed93d7e45ba013080872060ce71
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max25014 backlight controller
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max25014
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator which controls the boost converter input rail.
+
+  pwms:
+    maxItems: 1
+
+  maxim,iset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 11
+    description:
+      Value of the ISET register field (0-15). Default is 11.
+
+  maxim,strings:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A 4-bit bitfield that describes which led strings to turn on.
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - maxim,strings
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight: backlight@6f {
+            reg = <0x6f>;
+            compatible = "maxim,max25014";
+            bl-name = "max25014";
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_backlight>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 1>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e18349a5556e4d793b63a6b3c600000b21b0418..9e9a45442b7bf60b00eaf3f8ebadf8f4fbaf3bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14907,6 +14907,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
 
+MAX25014 BACKLIGHT DRIVER
+M:	Maud Spierings <maudspierings@gocontroll.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
 L:	linux-rtc@vger.kernel.org

-- 
2.50.1




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32740D65525
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT/s3m1EQsAbsZRS6XEfhWEzH/ag/XveYrxCo1OuO10=; b=WtRiNSSuOG99gw3ESUUxY40FqV
	wUfc7hqdnPa3P/h7jlfjr8DBZNrlsDXX93iUINoushTLPvgHATlNOcLmqwV63Bvb93YRq1O8tp3KN
	4tHuQSCCdDQnevihRfnqWDfjX0eWCbrqBEVxXJyDRVCuExQOMOageLSEvUoutno5I28LFiuugNxII
	MiE+QOXJBzaOUF4IvCsY33Kn89lF74mahbppfpW5LxkyG5nJCArp5OqsM1Gje6qiMGDF2A1iEtxV7
	iYK03l3fl8/t9cd4tlfrBU5JyvYitMatRVHTtwqB1oa3oRp39oyvbXdJYgLHGss2maCA789fTpxaE
	Uk1JPb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Vh-0000000Bge3-2Pth;
	Tue, 26 Nov 2024 20:50:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Tm-0000000BgHV-465A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 395ACA413FF;
	Tue, 26 Nov 2024 20:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B69C5C4CED0;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=nPlVVBDGKjV5+b5plwup/oaCwem/vGJJlIuA9WfZlTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p375jSE/nhXtMxzvEOS9mugsU2ApN2vVdpuN9R4/WGM07+3cDR4KMSZ1FHNvh1/8L
	 mGU4Yk19FQw3WXOe9K4jdRKyYJqPNlB507wa57oOxm8xes2D0Bn5XIpd//ZpRvDvTK
	 J9k4ZSuTPm2L9ZKhturx9xqqP9qtJbEqZjWtueQQA9dfChBzOi1FhhsZyJwaPNFzEx
	 G5uPkfjBD4ClIrN2Tk7Xq4z/yUDDhmRqKJbnNaeHWXNFyS8ZW1bmlZrEmeKbxV52EC
	 ZAGTz3cNm+KE080l7XHoANzMB7xnijTu5TsR2I8caY3/PaOZZHNcwWpkB9FprjkTnY
	 J6Yd/ECCPBP0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BD0D65553;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:47:59 +0100
Subject: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=2804;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=UHvXgMi/23w7qON+PGUGo++6lr9MH2GBkiekDOSsTok=;
 b=v2an5Zj1C0uzlwCBhHF2ZQWwt6rSGPADVo45ZAjcVatoE2WRViXstwZvsJUf7P6F9MtmnBKza
 2GOjGYozUJwDVOHKJNJtRTlkyNCJtsYdABKic9dSMOvOWgu8iwJqldS
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_124815_148786_6DB6E155 
X-CRM114-Status: GOOD (  11.86  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for touchscreen controllers attached using the Z2 protocol.
Those are present in most Apple devices.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../input/touchscreen/apple,z2-multitouch.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0387e2178b91d5658dfd60cb44099a8048dc97df
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/apple,z2-multitouch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple touchscreens attached using the Z2 protocol
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: A series of touschscreen controllers used in Apple products
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,j293-touchbar
+          - apple,j493-touchbar
+      - const: apple,z2-touchbar
+      - const: apple,z2-multitouch
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  cs-gpios:
+    maxItems: 1
+    description: |
+      J293 has a hardware quirk where the CS line is unusable and has
+      to the be driven by a GPIO pin instead
+
+  firmware-name:
+    maxItems: 1
+
+  label:
+    maxItems: 1
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+
+required:
+  - compatible
+  - interrupts
+  - reset-gpios
+  - firmware-name
+  - label
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+            compatible = "apple,j293-touchbar", "apple,z2-touchbar",
+                         "apple,z2-multitouch";
+            reg = <0>;
+            spi-max-frequency = <11500000>;
+            reset-gpios = <&pinctrl_ap 139 0>;
+            cs-gpios = <&pinctrl_ap 109 0>;
+            interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+            firmware-name = "apple/dfrmtfw-j293.bin";
+            touchscreen-size-x = <23045>;
+            touchscreen-size-y = <640>;
+            label = "MacBookPro17,1 Touch Bar";
+        };
+    };
+
+...

-- 
2.47.1




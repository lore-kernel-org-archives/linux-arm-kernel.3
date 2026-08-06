Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A0C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASMPuQKSJC8uNvcCgcqLa+1nmbq4NWEZPtoSGFS+jfM=; b=OPOhIMWQMNwLqsNTh1E2UfrM3q
	49j4FKwCOwZybBs9e7Z6TALWUYTx8vyWE3CbM/0vYtGRp4UN8xCrJXHyx2NlzVzWx6/hgFulpovIV
	y2CugHLdMkU7dnx4gJP2py09UAH0KxUnhfrqXdOBmlMoidDVf6OuBqq1c7ErsZvqqPzphS4vr2VN0
	ZZFUv2ZdlEuFWZ1SCuBk6gqUGqZmRdynyem6zthSSKSIBTgKK3+d4kNGHfhDNafuwH2Kv8FAOaWj9
	S/Aszy3FrBCE2/6zY146q4Q/dB5EiY/HHPey6jvnTXwScfpX+WlmBi/wrmmQpOrr8ao+l7JaHnthk
	nDObgECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws45b-00000006aI6-3f49;
	Thu, 06 Aug 2026 19:49:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws45Y-00000006aFw-3IG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:49:15 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 132C0418A8;
	Thu, 06 Aug 2026 21:49:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX4d1873iFKH; Thu,  6 Aug 2026 21:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786045741; bh=sD2ttyi1AZR6Zq2YrL2GU2IPJ5gSb8y1BWyzSisavgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=drX8aEalvzR/JLisqZZWEt2B/9mgarj6P3nUBGnMPaVNAf3yuEZ3284cXFRi9Wpvs
	 7D+aXyEaOoktjoMnHeiDdA4lm1yN/pUp8U53hyj2wnrkJvJEMFJ0I+ik51r9m5Xx2E
	 hL1+3ib2Ju7VZ2AzErs1GacpKjQncfrQIk1ik1dAYJgo9RR6GYFvsPyKJMNjBA/Ocm
	 pNoysk/bBhIANdN4ifI3ZLooxeZDtn8PNqmRCPKHydWT78fhuq6TsxTisURyrfbOCY
	 c1d1TPVIaYDFMX1EtHY0nriPh62NNZ0RjvWBLvoPr2AFt2WtgzjpAHZ9Z1PnQbfCkV
	 v9Z0MI20iC+cQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 07 Aug 2026 01:18:41 +0530
Subject: [PATCH v4 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gp2ap070s-v4-1-74f6a67b6272@disroot.org>
References: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
In-Reply-To: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_124912_969485_E6428CA0 
X-CRM114-Status: GOOD (  12.12  )
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

The GP2AP070S is a proximity sensor designed and manufactured by Sharp
Corporation. Unlike the other GP2AP* schemas, this is strictly a
proximity sensor and NOT an ambient light sensor.

For power supplies, it expects two voltage supplies, one for core and
other for driving the infrared LED which is used to measure proximity
distance. However, some variants may not explicitly require a separate
regulator for the LED as they're able to draw power from the main
supply.

This chip has been used in production mobile devices such as the Samsung
Galaxy J6.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/iio/proximity/sharp,gp2ap070s.yaml    | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
new file mode 100644
index 000000000000..73f0abc1f09c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/sharp,gp2ap070s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp GP2AP070S Proximity sensor
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: ../common.yaml#
+
+properties:
+  compatible:
+    const: sharp,gp2ap070s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Voltage supply for the internal circuitry
+
+  vled-supply:
+    description: Voltage supply for the IR LED
+
+  proximity-near-level: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      proximity@39 {
+        compatible = "sharp,gp2ap070s";
+        reg = <0x39>;
+        interrupt-parent = <&gpio>;
+        interrupts = <1 IRQ_TYPE_EDGE_BOTH>;
+        vdd-supply = <&vdd_supply>;
+        vled-supply = <&vled_supply>;
+        proximity-near-level = <500>;
+      };
+    };
+
+...

-- 
2.54.0



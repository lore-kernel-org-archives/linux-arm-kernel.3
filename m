Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sga4MOmTV9FTSsd/3VxLp/kpppIQyfNmPszDEaYxk0=; b=udTH1l0F2rDuDQh1Tvb1CsXkaC
	Tny5eCsya+gG+IBA0Dgu2R6rgAhLsJM/5QCVrEo6WypUJ/Pm2x9jrFb3ET8Tpa7nxDWtit/slm+kP
	RZrSp/Qn5nVVseA8z7S9UehKpCvgrd/mUkTfcl6pzTrBRHxGqVNbO5eOi32wWWmHpTSbMKFJUkcbc
	1+dXXgTsOyeDzFZkJ1OcXHRWGux+gTQ37fX3LSrlHBREDDJwCGeef26Jb3MV/QwLGPbG8zKeECc5S
	W2h7LFf/+SPPHHzYWEdGxvZUx/lgS71x9okdqpoafMCz+krAK7O89DcISrd6Iydmo76vzcfdcZR3B
	xfGNMHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxEG-0000000Ep9u-1Odf;
	Thu, 23 Jul 2026 17:29:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxED-0000000Ep8i-3AKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:29:03 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B9F2A887E7;
	Thu, 23 Jul 2026 19:28:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFMCgq-LND6L; Thu, 23 Jul 2026 19:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784827738; bh=8RNNJicbOxkofsbn69rExkYA+ETIbn8fNyoaONjKg8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hH3b9XxY/0b2Zcd3ud0DtNCxIiif6sJ+eNj/Fr01R53LX+MQKIF/y0+6nscDFHgQf
	 fij/II88++vWilc2uxgxbRHb5FbkCfXgW+4ZsjdmlllYUdK5dk3yB8y/yYBv1BXMgH
	 PgpeqHNruISJY9neyG+lPjEzIJIl1Wa7Sw5g++axg7FAN5jKhSGCHjvsXq+c+vrBlm
	 rBdjhI8+IeTPhK6IqZjLFp5iqw9QkPZqGofloLrCgljcLuer4LaeL5i9A1UHwV9Jiz
	 q2DR9swV0dIVGjyIb4GtS9VuW4cmlSrDywlYgykjl70GBR89KYomebyqB5NqeLsdxa
	 bQ9mzbn0FDdHg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 23 Jul 2026 22:58:33 +0530
Subject: [PATCH 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
In-Reply-To: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_102901_952878_F4DE810E 
X-CRM114-Status: GOOD (  11.41  )
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
distance.

This chip has been used in production mobile devices such as the Samsung
Galaxy J6.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/iio/proximity/sharp,gp2ap070s.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
new file mode 100644
index 000000000000..bcae68303b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml
@@ -0,0 +1,59 @@
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



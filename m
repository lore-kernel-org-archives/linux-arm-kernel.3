Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0160CE77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 04:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SdRiH2airw9z6ypYrBmUiV3iBfgFtvLtVbmbzSaIe2M=; b=2sC8qE+RSN3Tq3Hsj81mCb+YTm
	fUlY9aslZnIEGY0movCnuW0nrR1XqDguAB5lel/uKrtTFM/XRQSGkUYeLEAoBN19+/QZpH8DVakvl
	HOinJ6JErsdFrHA/Y3jMe4Wy/TnpnZq9zlVL0XLFuvmAjRuhDQPN2ZyJMOKZYGMknrsmk+Cip86LT
	vw1x9qQRQfWVonHhycUQWtz81PRn/WdDoBUpqURcfQ/C7ym4MtmYA6qwXEmE+Y1qu+IYaOGLt7KJv
	yJB1PCiT6bQ1gZykjI9x6gVFHBj7VeS+7Cg0j4Lio9Rw6LCN4j5HydnKF+qV6LZPWBu43I5yDH1wm
	dOSWm0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlEl-0000000FWQb-3X22;
	Wed, 18 Dec 2024 04:00:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlDg-0000000FWLS-0sAb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 03:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734494372; x=1766030372;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=StsdnWYHV32T75XIBYHABEf0plWnrpE74s1rgUtfdfw=;
  b=M8eCch4gJ+Sjs/i/eqvAoNxV4MHkk6O4xOxvTUHUycB4aNWbnYW8GGZR
   kz+JemPtJmWKTsRNfB05CTV8sxKO97X3sgYhGWPldF74fkUWCrdmBTb6x
   kdUaBk7HatQHfnhw1daijn6GeBbd/6d14h26p2KIaOHdKMA7KHu4T/0ts
   h0hk199zmiXIhXtsqcg1B3m7JKsEqMxEA9QrAZLwnq1uxcKum1E2pQ1b0
   o4WNhxJXr9wRXTLtvQ9cOAIu8NkLFG1BpDa5N155nvQzmJQ61UO1Kv8HG
   F+7Vx9Is4meSlMsGMiYDtiDnebfmkwDK7W1oz0DCkpPlx0F+HE94vNj7B
   w==;
X-CSE-ConnectionGUID: 1K4hxExYRu+9DzMqcOCcBQ==
X-CSE-MsgGUID: 5nSihg91QYWZhSWt6QclKA==
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="39410548"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2024 20:59:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Dec 2024 20:58:54 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 17 Dec 2024 20:58:51 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Wed, 18 Dec 2024 09:24:54 +0530
Subject: [PATCH v2] dt-bindings: mfd: atmel,at91sam9260: Convert to json
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241218-matrix-v2-1-f3a8809ee5cd@microchip.com>
X-B4-Tracking: v=1; b=H4sIAI1HYmcC/zXMQQrDIBCF4auEWdcyY1ILXfUeIQtrtc7CGDRIS
 vDutYEs/8fj2yHbxDbDo9sh2cKZ49xCXjowXs8fK/jdGiTKgSShCHpNvIkeUZK6K/dSDtp5Sdb
 xdkDj1NpzXmP6Hm6h/3oSdBKFBImbdUg46F674RnYpGg8L1cTA0y11h9JEeeioAAAAA==
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_195932_279304_3F5CFEFD 
X-CRM114-Status: GOOD (  13.89  )
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

Convert old text based binding to json schema.
Changes during conversion:
Add a missing fallback `atmel,at91sam9x5-matrix` for
`microchip,sam9x60-matrix` which is not defined in the text binding.

Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
Changes in v2:
- Modified the commit messsage.
- Replaced `anyOf` with `oneOf` in compatible under properties.
- Removed additional items group and added both `microchip,sam9x60-matrix` and 
  `microchip,sam9x7-matrix` as an enum under one items group
- Replaced `matrix@` with `syscon@` in examples.
- Link to v1: https://lore.kernel.org/r/20241211-matrix-v1-1-5ef0104a3af4@microchip.com
---
 .../bindings/mfd/atmel,at91sam9260-matrix.yaml     | 52 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-matrix.txt       | 26 -----------
 2 files changed, 52 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
new file mode 100644
index 000000000000..447b3a3edbfc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-matrix.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/atmel,at91sam9260-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 Bus Matrix
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+description:
+  The Bus Matrix (MATRIX) implements a multi-layer AHB, based on the
+  AHB-Lite protocol, that enables parallel access paths between multiple
+  masters and slaves in a system, thus increasing the overall bandwidth.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91sam9260-matrix
+              - atmel,at91sam9261-matrix
+              - atmel,at91sam9263-matrix
+              - atmel,at91sam9rl-matrix
+              - atmel,at91sam9g45-matrix
+              - atmel,at91sam9n12-matrix
+              - atmel,at91sam9x5-matrix
+              - atmel,sama5d3-matrix
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sam9x60-matrix
+              - microchip,sam9x7-matrix
+          - const: atmel,at91sam9x5-matrix
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@ffffec00 {
+        compatible = "atmel,sama5d3-matrix", "syscon";
+        reg = <0xffffec00 0x200>;
+    };
diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
deleted file mode 100644
index 6e5f83614e83..000000000000
--- a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Device tree bindings for Atmel Bus Matrix
-
-The Bus Matrix registers are used to configure Atmel SoCs internal bus
-behavior (master/slave priorities, undefined burst length type, ...)
-
-Required properties:
-- compatible:		Should be one of the following
-			"atmel,at91sam9260-matrix", "syscon"
-			"atmel,at91sam9261-matrix", "syscon"
-			"atmel,at91sam9263-matrix", "syscon"
-			"atmel,at91sam9rl-matrix", "syscon"
-			"atmel,at91sam9g45-matrix", "syscon"
-			"atmel,at91sam9n12-matrix", "syscon"
-			"atmel,at91sam9x5-matrix", "syscon"
-			"atmel,sama5d3-matrix", "syscon"
-			"microchip,sam9x60-matrix", "syscon"
-			"microchip,sam9x7-matrix", "atmel,at91sam9x5-matrix", "syscon"
-- reg:			Contains offset/length value of the Bus Matrix
-			memory region.
-
-Example:
-
-matrix: matrix@ffffec00 {
-	compatible = "atmel,sama5d3-matrix", "syscon";
-	reg = <0xffffec00 0x200>;
-};

---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241210-matrix-30021676fb6f

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>



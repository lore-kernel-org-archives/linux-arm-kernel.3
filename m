Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25994D6E2DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yXnJLIn72Sbw0NHhHYgzI45qDQ+y+rYNrWFdka5MmAw=; b=j77L6/M2U++5winXGOi5D23KRj
	vqKte0DTu5a/pvPqVOZ6fxb5Z2+IILGRgXQHLAgYg1MtXKwWCsdljJD4B3h2Mifdpf8QflFANdS11
	OkNfySFH4mBoZO89cb5zMZKzYTm8tq0seouhQ97LjM8xyDbd3tsOA9GRcJrlYxKCq9mTECCsRu/Po
	gg/giYwKiqou4qyDoVkjdxUqhviAiTjipAzv2ysgwZK9vSxiKJ30Kb1MEVha6GtoYOoEUXsgel994
	n0FMQnbVJPLaXbtcSJRF0d9X5WYWSSW+b6ekw7pE4AukzL8c9pFr1IEDU72yOpF/KNK+Q+/0+hHOD
	FLaFw5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgC0-0000000EmPa-3jzc;
	Wed, 20 Nov 2024 08:36:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgB3-0000000Em5D-1gAq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732091709; x=1763627709;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=55A8FeZ2TpcWNVaw339qWDeg5tKpRPnQiXrnOOVibu4=;
  b=cU8LdSNBLSiBAqoLLJXqOdOmuhS3tduPQYaORntNDQFg/wBjMicfQtlj
   x/jU0adZGFd4Hi5MaF7r0VHZwct5A/wXU/JylmUQYdQic66n19iyWhvDe
   ZEBn4HT/mu8a2mQITWyA75eg7PZTbaTVnirhffKOKXT65BxMVtMS3lYyh
   gC2UijXxLF9aSw0pOKaY6cJitvDVnrIP8ea+omNn5JBYVk6wyrjY5DPT8
   6H/rOfCpAiYT4d39bvNh8yzSnX/h0t8cdOXA45moN2RHUioDZopOzCIpF
   9vSUfn+Jwj08oPMlkpzLPe2oFzXT7BiCkdtBzhmIDx/eYk0bkMsgjt7PW
   w==;
X-CSE-ConnectionGUID: 0G/ItBSvSQqPiV4u0hJ3jA==
X-CSE-MsgGUID: OuuoQFbsTC2KrX/X/n6znA==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="34273278"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 01:35:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 01:34:36 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Nov 2024 01:34:30 -0700
From: Charan Pedumuru <charan.pedumuru@microchip.com>
Date: Wed, 20 Nov 2024 13:58:08 +0530
Subject: [PATCH v3] dt-bindings: net: can: atmel: Convert to json schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-can-v3-1-da5bb4f6128d@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJedPWcC/12Myw6CMBBFf4XM2ppOsaW48j+MC/pAZgElrWk0h
 H+3YGKiy3Nzz1kg+Ug+wblaIPpMicJUoD5UYIduuntGrjAILk68RcFsNzHtTdNr30ilHJTnHH1
 Pz71yvRUeKD1CfO3RjNv662dkyKxUEg1q3hpzGcnGYAeajzaMsDWy+HrIef3xRPG0bDi6WrTKu
 X9vXdc3t5RQGtIAAAA=
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>
CC: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charan Pedumuru
	<charan.pedumuru@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_003509_612154_DDDBEAE0 
X-CRM114-Status: GOOD (  16.54  )
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
- Add a fallback for `microchip,sam9x60-can` as it is compatible with the
  CAN IP core on `atmel,at91sam9x5-can`.
- Add the required properties `clock` and `clock-names`, which were
  missing in the original binding.
- Update examples and include appropriate file directives to resolve
  errors identified by `dt_binding_check` and `dtbs_check`.

Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
---
Changes in v3:
- Modified the commit message with reasons for each change
- Link to v2: https://lore.kernel.org/r/20241003-can-v2-1-85701d3296dd@microchip.com

Changes in v2:
- Renamed the title to "Microchip AT91 CAN controller"
- Removed the unnecessary labels and add clock properties to examples
- Removed if condition statements and made clock properties as default required properties
- Link to v1: https://lore.kernel.org/r/20240912-can-v1-1-c5651b1809bb@microchip.com
---
 .../bindings/net/can/atmel,at91sam9263-can.yaml    | 58 ++++++++++++++++++++++
 .../devicetree/bindings/net/can/atmel-can.txt      | 15 ------
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml
new file mode 100644
index 000000000000..c818c01a718b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/atmel,at91sam9263-can.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 CAN Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+allOf:
+  - $ref: can-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9263-can
+          - atmel,at91sam9x5-can
+      - items:
+          - enum:
+              - microchip,sam9x60-can
+          - const: atmel,at91sam9x5-can
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: can_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    can@f000c000 {
+          compatible = "atmel,at91sam9263-can";
+          reg = <0xf000c000 0x300>;
+          interrupts = <30 IRQ_TYPE_LEVEL_HIGH 3>;
+          clocks = <&pmc PMC_TYPE_PERIPHERAL 12>;
+          clock-names = "can_clk";
+    };
diff --git a/Documentation/devicetree/bindings/net/can/atmel-can.txt b/Documentation/devicetree/bindings/net/can/atmel-can.txt
deleted file mode 100644
index 218a3b3eb27e..000000000000
--- a/Documentation/devicetree/bindings/net/can/atmel-can.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* AT91 CAN *
-
-Required properties:
-  - compatible: Should be "atmel,at91sam9263-can", "atmel,at91sam9x5-can" or
-    "microchip,sam9x60-can"
-  - reg: Should contain CAN controller registers location and length
-  - interrupts: Should contain IRQ line for the CAN controller
-
-Example:
-
-	can0: can@f000c000 {
-		compatible = "atmel,at91sam9x5-can";
-		reg = <0xf000c000 0x300>;
-		interrupts = <40 4 5>
-	};

---
base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
change-id: 20240912-can-8eb7f8e7566d

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@microchip.com>



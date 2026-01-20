Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A955D2ED12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHRH2PzNA5e7bSpim7EQt2hZ6Eupsbp/2jcQWZDGT4I=; b=lYwLkgExHtnCHNXOjVzIx8BhqO
	9pMkNS9jaLaw6RR0ZlJFpYYL/22qsOdka2ccOrMnjROJkBM5dEtxIMeW7lC+x0Qms3UyLcjUvSD39
	jMSzEPkka1GAb2wADCU+NBk4jMnR6M/LBSQcyQritREbMIOjhYEAytYoFPvyNTVzBLzbz7uqNMS1G
	y01//xa2JJggTPf3frBdKG06tlaZCMyOHA56b6LSQsZ2TiEKdDZt4dXniSQPE84ueqijYpO4fWgyV
	Q6HcniRGISdOXLa+CYXeO5foRYbVOYUvmSR3M1fGBMU9QqbNkLVNC1SoasWz5c9vk2yAG0/b8iV4C
	F+Lc0hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8o-00000003jmi-41te;
	Tue, 20 Jan 2026 11:43:22 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8l-00000003jjE-1XMs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:43:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 20 Jan 2026 19:43:06 +0800
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=5436;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=MrVRNKm/mjltzAWngdN4v+Ffyd7xxroQ3hNrDmuuTjU=;
 b=lFnzFI3T2fdX4n4eQ4/F2ICFdre8wOEtRMhqeD6VfFGt/HNoMFRnIuy/V+ZMLU5zH5KHTK/Yr
 S3jQnwoRCfYBZPKhdfKHaAFShqiq4Vh7mZrFWo02UC2gILYzLORDkpC
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034319_417352_242A83FC 
X-CRM114-Status: GOOD (  12.21  )
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

Add bindings for the pin controller found in ASPEED AST27xx SoCs.

The AST2700 SoC consists of two interconnected SoC instances, each
with its own pin controller register block managed by a separate
System Control Unit (SCU).

Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
describe the SoC0 pin controller, which is not compatible with
existing ASPEED pinctrl bindings.

The SoC1 pin controller follows a regular and predictable register
layout and can be described using an existing generic pinctrl
binding, therefore no dedicated AST2700-specific compatible string
is introduced for it.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
 2 files changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index ff6cf8f63cbc..7eda8fddc560 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -164,4 +164,31 @@ examples:
             reg = <0x7c 0x4>, <0x150 0x8>;
         };
     };
+
+  - |
+    syscon@12c02000 {
+        compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+        reg = <0x0 0x12c02000 0x0 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x0 0x12c02000 0x1000>;
+
+        pinctrl0: pinctrl@400 {
+            compatible = "aspeed,ast2700-soc0-pinctrl";
+            reg = <0x400 0x600>;
+
+            emmc-state {
+                function = "EMMC";
+                groups = "EMMCG1";
+            };
+
+            emmcclk-driving-state {
+                pins = "AC14";
+                drive-strength = <2>;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..f52dfe0cb4c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC0.
+
+  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
+  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+
+patternProperties:
+  '-state$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - VB
+          - TSPRSTN
+          - UFSCLKI
+          - VGADDC
+          - USB3AXHD
+          - USB3AXHPD
+          - USB3AXH
+          - USB3AXHP
+          - USB3AXH2B
+          - USB3AXHP2B
+          - USB3BXHD
+          - USB3BXHPD
+          - USB3BXH
+          - USB3BXHP
+          - USB3BXH2A
+          - USB3BXHP2A
+          - USB2AXHD1
+          - USB2AXHPD1
+          - USB2AXH
+          - USB2AXHP
+          - USB2AXH2B
+          - USB2AXHP2B
+          - USB2AD1
+          - USB2AHPD0
+          - USB2AH
+          - USB2AHP
+          - USB2AD0
+          - USB2BXHD1
+          - USB2BXHPD1
+          - USB2BXH
+          - USB2BXHP
+          - USB2BXH2A
+          - USB2BXHP2A
+          - USB2BD1
+          - USB2BHPD0
+          - USB2BH
+          - USB2BHP
+          - USB2BD0
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGDDR
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGM0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+      groups:
+        enum:
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - EMMCCDN
+          - VGADDC
+          - VB1
+          - VB0
+          - TSPRSTN
+          - UFSCLKI
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BBP
+          - USB2BAP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+    pins:
+      $ref: /schemas/types.yaml#/definitions/string-array
+    drive-strength:
+      minimum: 0
+      maximum: 15
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false

-- 
2.34.1



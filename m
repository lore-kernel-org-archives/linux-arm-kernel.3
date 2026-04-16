Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B00FA0C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT66Byi3bg6rw9Wnl6S3il7tGLJcS18JKH3o2a4Pdis=; b=GVRCdGsnVU6/TWLuObeuPPiMei
	jKGaPCckBWj/qLzAcHaULVeIR8pyT60Z+NQ6k6n085UmNlULPrCqRkEhLy0sPkWgI8zNSwQh5lX2Z
	726kYgmzeKlZNBlTkm3fl/6zUlL0Hv3mlmgi3uZcZrdLGtTIIHNvw7hqfmweo9v6EBWGfZ1i81nZM
	mqvrKM/fDI6VpFukEb5Cy69C5y4xNK0GUKUKZht98G0iS5TTGqDmSaDro7uOOqgabuXQqioawbXgN
	6NaEOsNPwjNFzRfvSNu3wqz/eE0q7A+5i7SsvKE98wtBwgYEQ5oBlCl9IbfyGHYjP3udbw98fX+Ig
	ZkYi/DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHBS-000000027wt-0C9X;
	Thu, 16 Apr 2026 07:30:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHBL-000000027uU-0KrG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:30:37 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 16 Apr
 2026 15:30:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 16 Apr 2026 15:30:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 16 Apr 2026 15:29:43 +0800
Subject: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
In-Reply-To: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776324626; l=4554;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=/ubvf9DLP+Avh5y/ebKCCUhKpdr4O8xnRNwt2LL0kvo=;
 b=ETmluXu74ZIS8EXwvt6rAH/uOF2avjuUozDPKoYK1vQB9sWl/G6WWJml51/NCghAxVMSrmve2
 S0sHxiiG15WAxBPMUQVUzfaOAhlRB9GOwKcW2asRMtnZKtz4bPL75l1
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_003035_124762_E3579059 
X-CRM114-Status: GOOD (  10.43  )
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

Add a device tree binding for the pin controller found in the
ASPEED AST2700 SoC0.

The controller manages various peripheral functions such as eMMC, USB,
VGA DDC, JTAG, and PCIe root complex signals.

Describe the AST2700 SoC0 pin controller using standard pin multiplexing
and configuration properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..947f3cd09fcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,162 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - JTAGDDR
+          - JTAGM0
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2AD0
+          - USB2AD1
+          - USB2AH
+          - USB2AHP
+          - USB2AHPD0
+          - USB2AXH
+          - USB2AXH2B
+          - USB2AXHD1
+          - USB2AXHP
+          - USB2AXHP2B
+          - USB2AXHPD1
+          - USB2BD0
+          - USB2BD1
+          - USB2BH
+          - USB2BHP
+          - USB2BHPD0
+          - USB2BXH
+          - USB2BXH2A
+          - USB2BXHD1
+          - USB2BXHP
+          - USB2BXHP2A
+          - USB2BXHPD1
+          - USB3AXH
+          - USB3AXH2B
+          - USB3AXHD
+          - USB3AXHP
+          - USB3AXHP2B
+          - USB3AXHPD
+          - USB3BXH
+          - USB3BXH2A
+          - USB3BXHD
+          - USB3BXHP
+          - USB3BXHP2A
+          - USB3BXHPD
+          - VB
+          - VGADDC
+
+      groups:
+        enum:
+          - EMMCCDN
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BAP
+          - USB2BBP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - VB0
+          - VB1
+          - VGADDC
+      pins:
+        enum:
+          - AB13
+          - AB14
+          - AC13
+          - AC14
+          - AD13
+          - AD14
+          - AE13
+          - AE14
+          - AE15
+          - AF13
+          - AF14
+          - AF15
+
+      drive-strength:
+        enum: [3, 6, 8, 11, 16, 18, 20, 23, 30, 32, 33, 35, 37, 38, 39, 41]
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@400 {
+        compatible = "aspeed,ast2700-soc0-pinctrl";
+        reg = <0x400 0x318>;
+        emmc-state {
+            function = "EMMC";
+            groups = "EMMCG1";
+        };
+    };

-- 
2.34.1



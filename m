Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA92F0180C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q57wOGgcZdGO8Qi6ke0EVo4ZqKPCH7+05dehr5k2jno=; b=Ll+hjXDWXlihU5txLPi7C+lloR
	my9VvPuI2J2LmMteFfBNWEUgAoc8YHpVUmqhLV8jgwtTVrp3IMz7fwEqqVA3xKTKS1GuS5xzRmGr9
	Ir2Q+TQMg90fwwONLIgmQQdPyCjRllgFk911/wqIi29yZGPgcWyqo0aIRE8soNyGmgxeX+Dc0ZN8p
	SD70h4+bIAxtRYiiJNOzmZgYUBitX9Vt3ryJKtpOF8bOnTCg9ISQ8VfRJYbE2p60Ogs1jqqsRFYOl
	cqNPhlCjhhta20KX9bCJTZVEfuby1viuQsI0DnhIO/EqMpIk5VEXo4gMN23NhnSaFrzsQn0ejzC5l
	tTM2zPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQDs-00000003Dis-3vsA;
	Fri, 06 Mar 2026 08:07:48 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQDm-00000003DUo-3ehl;
	Fri, 06 Mar 2026 08:07:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 16:07:24 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 16:07:24 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 6 Mar 2026 16:07:27 +0800
Subject: [PATCH v2 5/5] dt-bindings: interrupt-controller: aspeed: Remove
 AST2700-A0 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260306-irqchip-v2-5-f8512c09be63@aspeedtech.com>
References: <20260306-irqchip-v2-0-f8512c09be63@aspeedtech.com>
In-Reply-To: <20260306-irqchip-v2-0-f8512c09be63@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772784444; l=4783;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=3E1xw0HsueF+u/KGpP5CYluFLpq97aaG2OP77KelhBs=;
 b=kn3OWDXDQmtIRzIJ+vraA5kn3sCgavptGJTCroJCF5tKMdeBxGWqFh6O/g3qUTIV5PITffJCm
 x6t6XR7doW0DCAxoEbGTDatBhB49uxvPlTHJYMShILaxIWY7BloaU+0
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_000742_961198_BFE2B381 
X-CRM114-Status: GOOD (  10.31  )
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

The existing AST2700 interrupt controller binding
("aspeed,ast2700-intc-ic") was written against the A0 pre-production
design.

In A0, the interrupt hierarchy effectively converged at the Primary
Service Processor (PSP): INTC1 instances fed into INTC0, and INTC0 was
wired to the PSP GIC. The binding therefore described a fixed, PSP
aggregation model.

From A1 onwards (retained in the A2 production silicon), the interrupt
fabric was re-architected: interrupt routing is programmable and
interrupt outputs can be directed to multiple upstream controllers
(PSP GIC, Secondary Service Processor (SSP) NVIC, Tertiary Service
Processor (TSP) NVIC, and Boot MCU interrupt controller). This design
requires route resolution and a controller hierarchy model which the
A0 binding cannot represent.

Remove the binding for the pre-production A0 design in favour of the
binding for the A2 production design. There is no significant user
impact from the removal as there are no existing devicetrees in any
of Linux, u-boot or Zephyr that make use of the A0 binding.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../interrupt-controller/aspeed,ast2700-intc.yaml  | 90 ----------------------
 1 file changed, 90 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
deleted file mode 100644
index 258d21fe6e35..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ /dev/null
@@ -1,90 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Aspeed AST2700 Interrupt Controller
-
-description:
-  This interrupt controller hardware is second level interrupt controller that
-  is hooked to a parent interrupt controller. It's useful to combine multiple
-  interrupt sources into 1 interrupt to parent interrupt controller.
-
-maintainers:
-  - Kevin Chen <kevin_chen@aspeedtech.com>
-
-properties:
-  compatible:
-    enum:
-      - aspeed,ast2700-intc-ic
-
-  reg:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 1
-    description:
-      The first cell is the IRQ number, the second cell is the trigger
-      type as defined in interrupt.txt in this directory.
-
-  interrupts:
-    minItems: 1
-    maxItems: 10
-    description: |
-      Depend to which INTC0 or INTC1 used.
-      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
-      status registers for use.
-      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
-      INTC1 is used to assert INTC0 if interrupt of modules asserted.
-      +-----+   +-------+     +---------+---module0
-      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
-      |     |   |       |  |  |         |---...
-      +-----+   +-------+  |  +---------+---module31
-                           |
-                           |   +---------+---module0
-                           +---| INTC1_1 |---module2
-                           |   |         |---...
-                           |   +---------+---module31
-                          ...
-                           |   +---------+---module0
-                           +---| INTC1_5 |---module2
-                               |         |---...
-                               +---------+---module31
-
-required:
-  - compatible
-  - reg
-  - interrupt-controller
-  - '#interrupt-cells'
-  - interrupts
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    bus {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        interrupt-controller@12101b00 {
-            compatible = "aspeed,ast2700-intc-ic";
-            reg = <0 0x12101b00 0 0x10>;
-            #interrupt-cells = <1>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
-        };
-    };

-- 
2.34.1



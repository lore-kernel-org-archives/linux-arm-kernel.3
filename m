Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB16ACDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 01:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ0ypID1O9Q93DezS4iROQXKtdNNTDRs5MtDYM7giKY=; b=Ls3bpiTaO9fa5UfDw0KVFNiv9D
	Tq2Y1AIEyQUJmAaNYQ5P0SpGufmiTM/hS5cG3fLpKDRfzsPKaCI+DXp5uFGqo3UcM5GZAGhsdkl4J
	JGrq27LnuGLD70s+s0NdH1bvxOL1sDG2xT7dFFeRPPF0l2kxc5kU/3foMgCo7Srlv2+bnkzSL/9eH
	pOFMD81yw1PsFCksMO5WDRiCntb2kcaNcvHohepDimbza2DwtW9g8zOAsQWD9BPJYA1fJwatvsJgE
	THiCBAhX7/VG6KstIArObM4ck2/nMVnfT5TCebXCosWMyaDW387J/mcUS2ImS/o5LlcdRWElG6TdK
	C5sHKZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpkS-00000005XBD-22g5;
	Tue, 23 Jun 2026 01:16:20 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpkJ-00000005X5B-39H7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 01:16:12 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 23 Jun
 2026 09:15:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 23 Jun 2026 09:15:54 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 23 Jun 2026 09:15:52 +0800
Subject: [PATCH v33 3/5] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260623-upstream_i2c-v33-3-6d5338fc56ed@aspeedtech.com>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
In-Reply-To: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782177354; l=3063;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=r2T5rQ6TN/II/E6wQiYvjiwSm3+xG1X8ZJATJXCx5iE=;
 b=t16vyiD/JNqUz/ELVPfVtDMcu/RE3b4r4LvUoW/X9/qKSAFphZeZcex+3dwBuTBJG3HeIf0AB
 b46VNOhSJ2pAH4Ozs1z8yfuXnWtiuqjO69AD+A1ol+aP6tPXNu6tVl+
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_181611_819824_1633CB33 
X-CRM114-Status: GOOD (  10.91  )
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

Add the aspeed,global-regs phandle to reference the AST2600 global
registers syscon node, containing the SoC-common I2C register set.

These properties apply only to the AST2600 binding. Legacy DTs remain
unchanged.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v32:
- Add if/then conditional schema: when aspeed,global-regs is present,
  require reg to have at least two items. The new driver unconditionally
  maps resource index 1 (the buffer SRAM region); a DT with one reg
  entry and aspeed,global-regs passes schema validation but fails probe.
  The constraint makes the schema consistent with driver behaviour.
- Fix binding example to use the correct AST2600 clock header
  (ast2600-clock.h) and ASPEED_CLK_APB2 instead of the legacy
  aspeed-clock.h, where index 26 (ASPEED_CLK_APB) maps to the
  UART5 gate clock on AST2600 rather than the APB2 bus clock
  used by the I2C controller.

Changes in v29:
- remove aspeed,enable-dma properties.

Changes in v28:
- update commit message correspond with aspeed,enable-dma.
- remove aspeed,transfer-mode and add aspeed,enable-dma property and
  description.
- Fix aspeed,enable-dma description to reflect hardware capability rather
  than software behavior

Changes in v27:
- change aspeed,transfer-mode to aspeed,enable-dma.
---
 .../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index abc614315dff..eb6e316c112f 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -48,6 +48,12 @@ properties:
   resets:
     maxItems: 1
 
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
@@ -55,19 +61,28 @@ required:
   - resets
   - interrupts
 
+if:
+  required:
+    - aspeed,global-regs
+then:
+  properties:
+    reg:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     i2c@80 {
         compatible = "aspeed,ast2600-i2c-bus";
         reg = <0x80 0x80>, <0xc00 0x20>;
         #address-cells = <1>;
         #size-cells = <0>;
-        clocks = <&syscon ASPEED_CLK_APB>;
+        clocks = <&syscon ASPEED_CLK_APB2>;
         resets = <&syscon ASPEED_RESET_I2C>;
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+        aspeed,global-regs = <&i2c_global>;
     };

-- 
2.34.1



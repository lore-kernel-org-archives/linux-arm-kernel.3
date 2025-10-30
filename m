Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5D1CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alhH5QaYTWa/mI8EEvA4Rm0NZmF52xRpzaz5Q8pj900=; b=SdxrPPHVjkJeljUMI7K4MALIUr
	+aKeMe3yMquNcOczTE2eZqOYNpkAuRrMl1G9iXOLVbXOgLs9wLI5EA2KC81Xbx/P0nAfPC5/7xdVn
	L+6bT1C14RWrnPPY9ZII0THEcUNoMDfaf7ZqZ0dnbBUOiDM788pbOQEpDMPnhgVM4ohn1gZPgcKOG
	ChWkPczZlYpwjP4qeuiPqiyZcLfmUMv81HIGWmN+i5vP20HWYb05FjdjJZxHRE9xK6mmZL78c+YFN
	XCiYqKC6L7WhIFUbzpeNx+gh0HZg0cuxjmt0I7xYCsR7EjoG2cZMk8dgADqx1xXQdrDx0wU1kCeSN
	cJ9a2Pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELjj-00000003XKH-0GxK;
	Thu, 30 Oct 2025 06:02:15 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELjc-00000003XHU-1qIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:02:09 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 30 Oct
 2025 14:01:55 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 30 Oct 2025 14:01:55 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	<jk@codeconstruct.com.au>, Kevin Chen <kevin_chen@aspeedtech.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v6 1/1] dt-bindings: interrupt-controller: aspeed,ast2700: correct #interrupt-cells and interrupts count
Date: Thu, 30 Oct 2025 14:01:55 +0800
Message-ID: <20251030060155.2342604-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030060155.2342604-1-ryan_chen@aspeedtech.com>
References: <20251030060155.2342604-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_230208_479732_C1FD4398 
X-CRM114-Status: GOOD (  12.58  )
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

Update the AST2700 interrupt controller binding to match the actual
hardware and the irq-aspeed-intc driver behavior.

- Interrupts:
  First-level INTC banks request multiple interrupt lines to the root
  GIC, with a maximum of 10 per bank. Second-level INTC banks request
  only one interrupt line to their parent INTC-IC. Therefore, set the
  interrupts property to allow a minimum of 1 and a maximum of 10
  entries.

- #interrupt-cells:
  Set '#interrupt-cells' to <1> since the irq-aspeed-intc.c driver does
  not support specifying a trigger type; only the interrupt index is used.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../interrupt-controller/aspeed,ast2700-intc.yaml   | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
index 55636d06a674..999df5b905c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
@@ -25,13 +25,14 @@ properties:
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 2
+    const: 1
     description:
       The first cell is the IRQ number, the second cell is the trigger
       type as defined in interrupt.txt in this directory.
 
   interrupts:
-    maxItems: 6
+    minItems: 1
+    maxItems: 10
     description: |
       Depend to which INTC0 or INTC1 used.
       INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
@@ -74,13 +75,17 @@ examples:
         interrupt-controller@12101b00 {
             compatible = "aspeed,ast2700-intc-ic";
             reg = <0 0x12101b00 0 0x10>;
-            #interrupt-cells = <2>;
+            #interrupt-cells = <1>;
             interrupt-controller;
             interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
         };
     };
-- 
2.34.1



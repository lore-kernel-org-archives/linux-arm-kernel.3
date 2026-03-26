Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11792109E557
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+c1qdcTxTsOTTYgUvUzO1k2tuphITL/5mx7UqECEuI=; b=MGXszuQeFUWWpkBH0THSldobK8
	SJWULKdJnG7Ze+3XN5uEBPTHyg17um953/9EQbULldYmhi1PLuI0YzCFoYqh1K+5JuMu65D2npBSb
	q+MiacTWpkJoAACS2DhN3i0GDmagcBCOMDIUEMQ6qdAYfEGGGlZLcZpEP3ZpDNZ7KUCxlJx9QZTTR
	aOj/TGjWp9RjoJ8oHyxkxyjEGqP+tzUDUZ39fmL5hiv71Mi2nh0U/zw/8Qkzalr89FM5BWhsbTDRT
	oVb4ghnkpvL6P7EQWn+JMEf6PE9g25wSJDV9ygfXZjkwglr+vPzHlfiItLvGwkf/aDEkF/SRJjtYa
	BG7Od91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5e50-00000004nkm-2uo3;
	Thu, 26 Mar 2026 06:20:30 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5e4j-00000004nXi-0GR2;
	Thu, 26 Mar 2026 06:20:14 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Mar
 2026 14:19:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Mar 2026 14:19:50 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Thu, 26 Mar 2026 14:19:53 +0800
Subject: [PATCH v3 4/4] irqchip/aspeed-intc: Remove AST2700-A0 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260326-irqchip-v3-4-366739f57acf@aspeedtech.com>
References: <20260326-irqchip-v3-0-366739f57acf@aspeedtech.com>
In-Reply-To: <20260326-irqchip-v3-0-366739f57acf@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774505990; l=5800;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=dDHK26Pv3om1nVVi9t4wNhYIZIKE7ffity4S2AcBKdE=;
 b=a2LIRMfXKomh6waSLwNLx6F2dZ7sgFn/YDi/hbGuAXv7USC+g/es12mIQBD90HMv8I794aidD
 IDd8TVO6gP/Dqq+Ygw38WvtbA9wmEqv70V0pMDemv0+IGtz5c/wRUQU
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_232013_142089_879236C6 
X-CRM114-Status: GOOD (  14.38  )
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

The existing AST2700 interrupt controller driver
("aspeed,ast2700-intc-ic") was written against the A0 pre-production
design.

From A1 onwards (retained in the A2 production silicon), the interrupt
fabric was re-architected: interrupt routing is programmable and
interrupt outputs can be directed to multiple upstream controllers
(PSP GIC, Secondary Service Processor (SSP) NVIC, Tertiary Service
Processor (TSP) NVIC, and Boot MCU interrupt controller). This design
requires route resolution and a controller hierarchy model which the
A0 driver cannot represent.

Remove driver support for A0 in favour of the driver for the A2
production design.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/irqchip/Makefile          |   1 -
 drivers/irqchip/irq-aspeed-intc.c | 139 --------------------------------------
 2 files changed, 140 deletions(-)

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ac04a4b97797..3d02441b3ee6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -92,7 +92,6 @@ obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_ASPEED_AST2700_INTC)	+= irq-ast2700.o irq-ast2700-intc0.o irq-ast2700-intc1.o
 obj-$(CONFIG_ASPEED_AST2700_INTC_TEST)	+= irq-ast2700-intc0-test.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-intc.o
 obj-$(CONFIG_STM32MP_EXTI)		+= irq-stm32mp-exti.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-intc.c
deleted file mode 100644
index 4fb0dd8349da..000000000000
--- a/drivers/irqchip/irq-aspeed-intc.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Aspeed Interrupt Controller.
- *
- *  Copyright (C) 2023 ASPEED Technology Inc.
- */
-
-#include <linux/bitops.h>
-#include <linux/irq.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqdomain.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/io.h>
-#include <linux/spinlock.h>
-
-#define INTC_INT_ENABLE_REG	0x00
-#define INTC_INT_STATUS_REG	0x04
-#define INTC_IRQS_PER_WORD	32
-
-struct aspeed_intc_ic {
-	void __iomem		*base;
-	raw_spinlock_t		gic_lock;
-	raw_spinlock_t		intc_lock;
-	struct irq_domain	*irq_domain;
-};
-
-static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
-{
-	struct aspeed_intc_ic *intc_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-
-	chained_irq_enter(chip, desc);
-
-	scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
-		unsigned long bit, status;
-
-		status = readl(intc_ic->base + INTC_INT_STATUS_REG);
-		for_each_set_bit(bit, &status, INTC_IRQS_PER_WORD) {
-			generic_handle_domain_irq(intc_ic->irq_domain, bit);
-			writel(BIT(bit), intc_ic->base + INTC_INT_STATUS_REG);
-		}
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static void aspeed_intc_irq_mask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int mask = readl(intc_ic->base + INTC_INT_ENABLE_REG) & ~BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(mask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static void aspeed_intc_irq_unmask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int unmask = readl(intc_ic->base + INTC_INT_ENABLE_REG) | BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(unmask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static struct irq_chip aspeed_intc_chip = {
-	.name			= "ASPEED INTC",
-	.irq_mask		= aspeed_intc_irq_mask,
-	.irq_unmask		= aspeed_intc_irq_unmask,
-};
-
-static int aspeed_intc_ic_map_irq_domain(struct irq_domain *domain, unsigned int irq,
-					 irq_hw_number_t hwirq)
-{
-	irq_set_chip_and_handler(irq, &aspeed_intc_chip, handle_level_irq);
-	irq_set_chip_data(irq, domain->host_data);
-
-	return 0;
-}
-
-static const struct irq_domain_ops aspeed_intc_ic_irq_domain_ops = {
-	.map = aspeed_intc_ic_map_irq_domain,
-};
-
-static int __init aspeed_intc_ic_of_init(struct device_node *node,
-					 struct device_node *parent)
-{
-	struct aspeed_intc_ic *intc_ic;
-	int irq, i, ret = 0;
-
-	intc_ic = kzalloc_obj(*intc_ic);
-	if (!intc_ic)
-		return -ENOMEM;
-
-	intc_ic->base = of_iomap(node, 0);
-	if (!intc_ic->base) {
-		pr_err("Failed to iomap intc_ic base\n");
-		ret = -ENOMEM;
-		goto err_free_ic;
-	}
-	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
-	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
-
-	intc_ic->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), INTC_IRQS_PER_WORD,
-						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
-	if (!intc_ic->irq_domain) {
-		ret = -ENOMEM;
-		goto err_iounmap;
-	}
-
-	raw_spin_lock_init(&intc_ic->gic_lock);
-	raw_spin_lock_init(&intc_ic->intc_lock);
-
-	/* Check all the irq numbers valid. If not, unmaps all the base and frees the data. */
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		if (!irq) {
-			pr_err("Failed to get irq number\n");
-			ret = -EINVAL;
-			goto err_iounmap;
-		}
-	}
-
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		irq_set_chained_handler_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);
-	}
-
-	return 0;
-
-err_iounmap:
-	iounmap(intc_ic->base);
-err_free_ic:
-	kfree(intc_ic);
-	return ret;
-}
-
-IRQCHIP_DECLARE(ast2700_intc_ic, "aspeed,ast2700-intc-ic", aspeed_intc_ic_of_init);

-- 
2.34.1



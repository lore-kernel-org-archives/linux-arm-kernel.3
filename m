Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8C9CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtHd0OOmxEkdBRQocM20KEi+AkYIzhAFyxAIPEgrOp8=; b=qK9o9K1XQicgOdmeN0paDBlMzD
	jf3WPKaMgioNhINLWBNksn+CoO1DMskdQBiIFpnCnQGxmV4shiKsnK3MdmifLrv62wluY7U1h9vIi
	3vwAB82lK96qXec9ecqJmWHu+n1x6dFPb/D9QrIsp/VwAP6+k4rsmDon/Y7J+uFO4BeLUrQvnYJG7
	e5bnszvyAIOEAB8BnO0ho/vRfSrYQyGj5bTxZEgh0dcaXFexvqot6uPYSgPGwysdV/QKSgODUEz3F
	h8W+3zRSJHJeVVjqK8z3qyprcvVH489SsRAOfkjNs+YdlrVithGNzJFWrz4PcZXgHB18QMuZWd7zT
	rql49Gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQf-000000061Wv-1b32;
	Sun, 18 Oct 2026 16:08:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQY-000000061UR-3f6X;
	Sun, 18 Oct 2026 16:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jtHd0OOmxEkdBRQocM20KEi+AkYIzhAFyxAIPEgrOp8=; b=JLZ6WAlDoaXvhBY5tkGAKaqmhd
	iu9hWITzG+hUD/GnSLAXUxkxPadHbtgJUXdcer76dOnYzb4BqjmgeoMryipVO1VTDV7Wy7zwTJJCK
	ijJ6lCH/fGKHJT10Ezo3vZfNvcGz2VmKCpxzK5F8fkF8NrX78gs7HK99dv0IYYFKXAoomRiyf9Ufo
	OFm56Qg+0C1Z4KtRchuYJbAtw/Fa7qfhNzHfOs2UXLhjtsWuyeGtyG+GFdHA7dGDuTK20z1hhRt/Z
	xBv75ysUVViNppinMrYzM5szsOh2yxE8Gmz6SGrYtgnEaR+d/bAOtmoe/onARRsZ8Ru7g7qb/eL0B
	F2vNZ6mQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xITQS-000000031Bf-1qMi;
	Sun, 18 Oct 2026 16:08:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6swaE1115131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=jtHd0OOmxEkdBRQocM20KEi+AkYIzhAFyxAIPEgrOp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=v8QbaeCQgHABFVwfFeKCF9f8woxG3cn0AJe7iyvfAPq7BE/uIP8DUzXRVNCH+AugC
	 xIb1aMGfjLlsrsmHKS/UHcqXwzqSNYBDv7T/PhZwgC0mg+F7zM0Qg1DQ6kwg8Ecz/9
	 39DGMcQE8iW3iBY8Wyvk6hW7JLo6ZTHItaFxpUc+A7ktfFgOBvDLYb1T9UYRWxaf1C
	 BfjtL7KZ9JtzzdmAsO1w2yPTIpp7YnE287IXXibEqeF8CioXMWRn+wrkWYPpU19ciF
	 j7lThBnalCOBTjEAF2MEOwgBhlyqAMn8/MNBHCPLxeVFrayVOpOmwpdPdil0deBHRc
	 iJgs0hVyUjL2A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6swaE1115131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:55 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:55 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 8/8] irqchip/realtek-rtd1625: Add driver for Realtek DHC rtd1625 SoC
Date: Mon, 19 Oct 2026 00:06:53 +0800
Message-ID: <20261018160653.3940371-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_170758_567691_63AE61F1 
X-CRM114-Status: GOOD (  18.95  )
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

From: James Tai <james.tai@realtek.com>

Add support for interrupt controller driver found on Realtek DHC rtd1625
SoCs.

Signed-off-by: James Tai <james.tai@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/irqchip/Kconfig               |  12 ++
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-realtek-rtd1625.c | 261 ++++++++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-rtd1625.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2598f6a82cc2..c97c32f3f0a8 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -320,6 +320,18 @@ config REALTEK_RTD1619B_INTC
 
 	  If unsure, say N.
 
+config REALTEK_RTD1625_INTC
+	tristate "Realtek RTD1625 interrupt controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select REALTEK_DHC_INTC
+	help
+	  Enable support for the Realtek RTD1625 SoC interrupt controller.
+	  The RTD1625 SoC features complex interrupt routing with multiple
+	  interrupt banks. For example, its misc interrupt controller region
+	  contains two register sets.
+
+	  If unsure, say N.
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index acc515fc6f9a..6fec774cfb2c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
 obj-$(CONFIG_REALTEK_RTD1319_INTC)	+= irq-realtek-rtd1319.o
 obj-$(CONFIG_REALTEK_RTD1319D_INTC)	+= irq-realtek-rtd1319d.o
 obj-$(CONFIG_REALTEK_RTD1619B_INTC)	+= irq-realtek-rtd1619b.o
+obj-$(CONFIG_REALTEK_RTD1625_INTC)	+= irq-realtek-rtd1625.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-rtd1625.c b/drivers/irqchip/irq-realtek-rtd1625.c
new file mode 100644
index 000000000000..4cca66c8ff70
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-rtd1625.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTD1625 interrupt controller driver
+ *
+ * Copyright (c) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include "irq-realtek-intc-common.h"
+
+#define ISO_NORMAL_MASK		0xfffe0ff6
+#define ISO_UART9_MASK		0x00000008
+#define ISO_RTC_MASK		0x0001f000
+#define ISOM_NORMAL_MASK	0x00000037
+#define MISC_NORMAL_MASK	0xfffffffe
+#define MISC2_NORMAL_MASK	0xfffffff8
+#define MISC2_UART1_MASK	0x00000002
+#define MISC2_UART2_MASK	0x00000004
+
+#define ISO_ISR_EN_OFFSET	0x40
+#define ISO_ISR_OFFSET		0
+#define ISOM_ISR_EN_OFFSET	0x10
+#define ISOM_ISR_OFFSET		0
+#define MISC_ISR_EN_OFFSET	0x80
+#define MISC_ISR_OFFSET		0xc
+#define MISC2_ISR_EN_OFFSET	0x88
+#define MISC2_ISR_OFFSET	0x4
+
+enum rtd1625_iso_isr_bits {
+	RTD1625_ISO_ISR_UR0_SHIFT		= 2,
+	RTD1625_ISO_ISR_UR9_SHIFT		= 3,
+	RTD1625_ISO_ISR_SPI0_SHIFT		= 4,
+	RTD1625_ISO_ISR_SPI1_SHIFT		= 5,
+	RTD1625_ISO_ISR_SPI2_SHIFT		= 6,
+	RTD1625_ISO_ISR_I2C0_SHIFT		= 8,
+	RTD1625_ISO_ISR_I2C7_SHIFT		= 10,
+	RTD1625_ISO_ISR_I2C1_SHIFT		= 11,
+	RTD1625_ISO_ISR_DRTC_HSEC_SHIFT		= 12,
+	RTD1625_ISO_ISR_DRTC_MIN_SHIFT		= 13,
+	RTD1625_ISO_ISR_DRTC_HOUR_SHIFT		= 14,
+	RTD1625_ISO_ISR_DRTC_DATE_SHIFT		= 15,
+	RTD1625_ISO_ISR_DRTC_ALARM_SHIFT	= 16,
+	RTD1625_ISO_ISR_VFD_SHIFT		= 17,
+	RTD1625_ISO_ISR_GPIOA_SHIFT		= 19,
+	RTD1625_ISO_ISR_GPIODA_SHIFT		= 20,
+	RTD1625_ISO_ISR_LSADC0_SHIFT		= 21,
+	RTD1625_ISO_ISR_LSADC1_SHIFT		= 22,
+	RTD1625_ISO_ISR_PORB_HV_CEN_SHIFT	= 28,
+	RTD1625_ISO_ISR_PORB_DV_CEN_SHIFT	= 29,
+	RTD1625_ISO_ISR_PORB_AV_CEN_SHIFT	= 30,
+	RTD1625_ISO_ISR_I2C1_REQ_SHIFT		= 31,
+};
+
+static const u32 rtd1625_iso_isr_to_scpu_int_en_mask[32] = {
+	[RTD1625_ISO_ISR_UR0_SHIFT]		= BIT(2),
+	[RTD1625_ISO_ISR_UR9_SHIFT]		= BIT(3),
+	[RTD1625_ISO_ISR_SPI0_SHIFT]		= BIT(4),
+	[RTD1625_ISO_ISR_SPI1_SHIFT]		= BIT(5),
+	[RTD1625_ISO_ISR_SPI2_SHIFT]		= BIT(6),
+	[RTD1625_ISO_ISR_I2C0_SHIFT]		= BIT(8),
+	[RTD1625_ISO_ISR_I2C7_SHIFT]		= BIT(10),
+	[RTD1625_ISO_ISR_I2C1_SHIFT]		= BIT(11),
+	[RTD1625_ISO_ISR_DRTC_HSEC_SHIFT]	= BIT(12),
+	[RTD1625_ISO_ISR_DRTC_MIN_SHIFT]	= BIT(13),
+	[RTD1625_ISO_ISR_DRTC_HOUR_SHIFT]	= BIT(14),
+	[RTD1625_ISO_ISR_DRTC_DATE_SHIFT]	= BIT(15),
+	[RTD1625_ISO_ISR_DRTC_ALARM_SHIFT]	= BIT(16),
+	[RTD1625_ISO_ISR_VFD_SHIFT]		= BIT(17),
+	[RTD1625_ISO_ISR_GPIOA_SHIFT]		= BIT(19),
+	[RTD1625_ISO_ISR_GPIODA_SHIFT]		= BIT(20),
+	[RTD1625_ISO_ISR_LSADC0_SHIFT]		= BIT(21),
+	[RTD1625_ISO_ISR_LSADC1_SHIFT]		= BIT(22),
+	[RTD1625_ISO_ISR_PORB_HV_CEN_SHIFT]	= BIT(28),
+	[RTD1625_ISO_ISR_PORB_DV_CEN_SHIFT]	= BIT(29),
+	[RTD1625_ISO_ISR_PORB_AV_CEN_SHIFT]	= BIT(30),
+	[RTD1625_ISO_ISR_I2C1_REQ_SHIFT]	= BIT(31),
+};
+
+enum rtd1625_misc_isr_bits {
+	RTD1625_MISC_ISR_TC8_SHIFT	= 1,
+	RTD1625_MISC_ISR_TC9_SHIFT	= 2,
+	RTD1625_MISC_ISR_TC5_SHIFT	= 4,
+	RTD1625_MISC_ISR_TC0_SHIFT	= 6,
+	RTD1625_MISC_ISR_TC1_SHIFT	= 7,
+	RTD1625_MISC_ISR_I2C5_SHIFT	= 14,
+	RTD1625_MISC_ISR_I2C4_SHIFT	= 15,
+	RTD1625_MISC_ISR_I2C6_SHIFT	= 22,
+	RTD1625_MISC_ISR_I2C3_SHIFT	= 23,
+	RTD1625_MISC_ISR_SC0_SHIFT	= 24,
+	RTD1625_MISC_ISR_SC1_SHIFT	= 25,
+	RTD1625_MISC_ISR_FAN_SHIFT	= 29,
+};
+
+static const u32 rtd1625_misc_isr_to_scpu_int_en_mask[32] = {
+	[RTD1625_MISC_ISR_I2C6_SHIFT] = BIT(13),
+	[RTD1625_MISC_ISR_I2C5_SHIFT] = BIT(14),
+	[RTD1625_MISC_ISR_I2C4_SHIFT] = BIT(15),
+	[RTD1625_MISC_ISR_SC0_SHIFT]  = BIT(24),
+	[RTD1625_MISC_ISR_SC1_SHIFT]  = BIT(25),
+	[RTD1625_MISC_ISR_I2C3_SHIFT] = BIT(28),
+	[RTD1625_MISC_ISR_FAN_SHIFT]  = BIT(29),
+};
+
+enum rtd1625_misc_isr2_bits {
+	RTD1625_MISC_ISR_UR1_SHIFT	= 1,
+	RTD1625_MISC_ISR_UR2_SHIFT	= 2,
+	RTD1625_MISC_ISR_UR3_SHIFT	= 3,
+	RTD1625_MISC_ISR_UR4_SHIFT	= 4,
+	RTD1625_MISC_ISR_UR5_SHIFT	= 5,
+	RTD1625_MISC_ISR_UR6_SHIFT	= 6,
+	RTD1625_MISC_ISR_UR7_SHIFT	= 7,
+	RTD1625_MISC_ISR_UR8_SHIFT	= 8,
+};
+
+static const u32 rtd1625_misc_isr2_to_scpu_int_en_mask[32] = {
+	[RTD1625_MISC_ISR_UR1_SHIFT]	= BIT(0),
+	[RTD1625_MISC_ISR_UR2_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1625_MISC_ISR_UR3_SHIFT]	= BIT(4),
+	[RTD1625_MISC_ISR_UR4_SHIFT]	= BIT(6),
+	[RTD1625_MISC_ISR_UR5_SHIFT]	= BIT(8),
+	[RTD1625_MISC_ISR_UR6_SHIFT]	= BIT(10),
+	[RTD1625_MISC_ISR_UR7_SHIFT]	= BIT(12),
+	[RTD1625_MISC_ISR_UR8_SHIFT]	= BIT(14),
+};
+
+enum rtd1625_isom_isr_bits {
+	RTD1625_ISOM_ISR_GPIOA_SHIFT		= 0,
+	RTD1625_ISOM_ISR_GPIODA_SHIFT		= 1,
+	RTD1625_ISOM_ISR_GPIO_LEVEL_SHIFT	= 2,
+	RTD1625_ISOM_ISR_UR10_SHIFT		= 4,
+	RTD1625_ISOM_ISR_IRDA_SHIFT		= 5,
+};
+
+static const u32 rtd1625_isom_isr_to_scpu_int_en_mask[32] = {
+	[RTD1625_ISOM_ISR_GPIOA_SHIFT]		= BIT(0),
+	[RTD1625_ISOM_ISR_GPIODA_SHIFT]		= BIT(1),
+	[RTD1625_ISOM_ISR_GPIO_LEVEL_SHIFT]	= BIT(2),
+	[RTD1625_ISOM_ISR_UR10_SHIFT]		= BIT(4),
+	[RTD1625_ISOM_ISR_IRDA_SHIFT]		= BIT(5),
+};
+
+static const struct realtek_intc_mask rtd1625_intc_iso_cfgs[] = {
+	{ ISO_NORMAL_MASK, },
+	{ ISO_UART9_MASK, },
+	{ ISO_RTC_MASK, },
+};
+
+static const struct realtek_intc_info rtd1625_intc_iso_info[] = {
+	{
+		.isr_offset = ISO_ISR_OFFSET,
+		.scpu_int_en_offset = ISO_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1625_iso_isr_to_scpu_int_en_mask,
+		.subset_mask = rtd1625_intc_iso_cfgs,
+		.subset_num = ARRAY_SIZE(rtd1625_intc_iso_cfgs),
+	},
+};
+
+static const struct realtek_intc_desc rtd1625_intc_iso_desc = {
+	.banks = rtd1625_intc_iso_info,
+	.bank_num = ARRAY_SIZE(rtd1625_intc_iso_info),
+	.shared_irq_mask = BIT(0),
+};
+
+static const struct realtek_intc_mask rtd1625_intc_isom_cfgs[] = {
+	{ ISOM_NORMAL_MASK, },
+};
+
+static const struct realtek_intc_info rtd1625_intc_isom_info[] = {
+	{
+		.isr_offset = ISOM_ISR_OFFSET,
+		.scpu_int_en_offset = ISOM_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1625_isom_isr_to_scpu_int_en_mask,
+		.subset_mask = rtd1625_intc_isom_cfgs,
+		.subset_num = ARRAY_SIZE(rtd1625_intc_isom_cfgs),
+	},
+};
+
+static const struct realtek_intc_desc rtd1625_intc_isom_desc = {
+	.banks = rtd1625_intc_isom_info,
+	.bank_num = ARRAY_SIZE(rtd1625_intc_isom_info),
+	.shared_irq_mask = BIT(0),
+};
+
+static const struct realtek_intc_mask rtd1625_intc_misc_cfgs[] = {
+	{ MISC_NORMAL_MASK, },
+};
+
+static const struct realtek_intc_mask rtd1625_intc_misc2_cfgs[] = {
+	{ MISC2_NORMAL_MASK, },
+	{ MISC2_UART1_MASK, }, /* ur1 */
+	{ MISC2_UART2_MASK, }, /* ur2 */
+};
+
+static const struct realtek_intc_info rtd1625_intc_misc_info[] = {
+	{
+		.isr_offset = MISC_ISR_OFFSET,
+		.scpu_int_en_offset = MISC_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1625_misc_isr_to_scpu_int_en_mask,
+		.subset_mask = rtd1625_intc_misc_cfgs,
+		.subset_num = ARRAY_SIZE(rtd1625_intc_misc_cfgs),
+	},
+	{
+		.isr_offset = MISC2_ISR_OFFSET,
+		.scpu_int_en_offset = MISC2_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1625_misc_isr2_to_scpu_int_en_mask,
+		.subset_mask = rtd1625_intc_misc2_cfgs,
+		.subset_num = ARRAY_SIZE(rtd1625_intc_misc2_cfgs),
+	},
+};
+
+static const struct realtek_intc_desc rtd1625_intc_misc_desc = {
+	.banks = rtd1625_intc_misc_info,
+	.bank_num = ARRAY_SIZE(rtd1625_intc_misc_info),
+	.shared_irq_mask = 0,
+};
+
+static const struct of_device_id realtek_intc_rtd1625_dt_matches[] = {
+	{
+		.compatible = "realtek,rtd1625-intc-iso",
+		.data = &rtd1625_intc_iso_desc,
+	}, {
+		.compatible = "realtek,rtd1625-intc-isom",
+		.data = &rtd1625_intc_isom_desc,
+	}, {
+		.compatible = "realtek,rtd1625-intc-misc",
+		.data = &rtd1625_intc_misc_desc,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, realtek_intc_rtd1625_dt_matches);
+
+static int rtd1625_intc_probe(struct platform_device *pdev)
+{
+	const struct realtek_intc_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return realtek_intc_probe(pdev, desc);
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(realtek_intc_rtd1625_pm_ops, realtek_intc_suspend,
+			       realtek_intc_resume);
+
+static struct platform_driver realtek_intc_rtd1625_driver = {
+	.probe = rtd1625_intc_probe,
+	.remove = realtek_intc_remove,
+	.driver = {
+		.name = "realtek_intc_rtd1625",
+		.of_match_table = realtek_intc_rtd1625_dt_matches,
+		.pm = pm_sleep_ptr(&realtek_intc_rtd1625_pm_ops),
+	},
+};
+module_platform_driver(realtek_intc_rtd1625_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek RTD1625 Interrupt Controller Driver");
-- 
2.43.0



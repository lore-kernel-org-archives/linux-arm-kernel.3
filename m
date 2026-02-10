Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE5EA3F3E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ3B7aAiGiTA9sIf/hvgN4lz2vGxhImMLU1lkbC03F4=; b=T5fDgzFMSxEvUj0bBFtD8zhrqG
	iOyCV8cqsXvTdXm/e8Da/zS2cCHr6jcsOAifr9MaXY9NEM5wCE1v/3E8d47bQQwHJsEYzfLfdvd98
	peXzUDMGzeZu4YCEn41Yjmg1qR05yum9yszfgAhMeGpOe/gyhpD3yS2R1tr4lvdNZNjgFfndmRDoi
	bRqR9wpscTUuEdACZMScdiIbSb2Tj0nDZcC8nQrOA3edoF6P193IZeuYN+sCMlWDt1MxQeOo1ZYeW
	38KNyWWHEDc7yzOnYq47dqXdGt3OAVyg0GY857IR1PDUINPNFMF5f4YQLDpz6wv2MrwLSioLavlp8
	BVU98iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUU-0000000GreS-3WUq;
	Tue, 10 Feb 2026 11:01:10 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUP-0000000GrcG-0fgw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iQ3B7aAiGiTA9sIf/hvgN4lz2vGxhImMLU1lkbC03F4=; b=k7CDPE
	eMCX7FUhYKT5mY37fkoXxeR8cDD6iQXWrQRM4uebccJ9uHv0zcoT0Jaa3VIj3RVt
	t/aOHwkfIyYm7UCfkqhB4Lq37X/6dq39WNtRX28TN124rOT+ZgUYgPEQuZxbfjNc
	lk1ImxcOWVj0JzERX76B2lfsHm3j9uiti1M1ugSDTrXG5TLm/tT7CRBN3MUBcvNF
	iqiPjtlB8aPLzxgphXhfa7/DP3io37YTWyL1QIM5tagk45XKTUrE3hZ1Y+nRePv3
	ZJFACxY0eh0NwALVGv+YoPcokXQm3eGB2zNTlaW4wjgYK+O82gvHme/thEk1A3wp
	b+B1Gf4PQ8CIqmHw==
Received: (qmail 353850 invoked from network); 10 Feb 2026 12:01:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:02 +0100
X-UD-Smtp-Session: l3s3148p1@vsvLK3ZKnpkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] hwspinlock: u8500: delete driver
Date: Tue, 10 Feb 2026 12:00:55 +0100
Message-ID: <20260210110057.10869-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_030105_477014_FCB3FE64 
X-CRM114-Status: GOOD (  22.10  )
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

The U8500 platform was converted to DT around 2013 and is DT only
meanwhile. This driver has never been converted to a DT driver, so it
clearly hasn't been used since then. To ease upcoming refactoring in the
hwspinlock subsystem, remove this obsolete driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                     |   1 -
 drivers/hwspinlock/Kconfig      |  10 ---
 drivers/hwspinlock/Makefile     |   1 -
 drivers/hwspinlock/u8500_hsem.c | 155 --------------------------------
 4 files changed, 167 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index db2c5a663867..dcdbb7c10dce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3160,7 +3160,6 @@ F:	drivers/clocksource/clksrc-dbx500-prcmu.c
 F:	drivers/dma/ste_dma40*
 F:	drivers/pmdomain/st/ste-ux500-pm-domain.c
 F:	drivers/gpio/gpio-nomadik.c
-F:	drivers/hwspinlock/u8500_hsem.c
 F:	drivers/i2c/busses/i2c-nomadik.c
 F:	drivers/iio/adc/ab8500-gpadc.c
 F:	drivers/mfd/ab8500*
diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..d84e00084ee2 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -53,14 +53,4 @@ config HWSPINLOCK_SUN6I
 
 	  If unsure, say N.
 
-config HSEM_U8500
-	tristate "STE Hardware Semaphore functionality"
-	depends on ARCH_U8500 || COMPILE_TEST
-	help
-	  Say y here to support the STE Hardware Semaphore functionality, which
-	  provides a synchronisation mechanism for the various processor on the
-	  SoC.
-
-	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..3a740805949d 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -9,4 +9,3 @@ obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
-obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
deleted file mode 100644
index 5a2d8c3e0d80..000000000000
--- a/drivers/hwspinlock/u8500_hsem.c
+++ /dev/null
@@ -1,155 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * u8500 HWSEM driver
- *
- * Copyright (C) 2010-2011 ST-Ericsson
- *
- * Implements u8500 semaphore handling for protocol 1, no interrupts.
- *
- * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
- * Heavily borrowed from the work of :
- *   Simon Que <sque@ti.com>
- *   Hari Kanigeri <h-kanigeri2@ti.com>
- *   Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
-#include <linux/platform_device.h>
-
-#include "hwspinlock_internal.h"
-
-/*
- * Implementation of STE's HSem protocol 1 without interrutps.
- * The only masterID we allow is '0x01' to force people to use
- * HSems for synchronisation between processors rather than processes
- * on the ARM core.
- */
-
-#define U8500_MAX_SEMAPHORE		32	/* a total of 32 semaphore */
-#define RESET_SEMAPHORE			(0)	/* free */
-
-/*
- * CPU ID for master running u8500 kernel.
- * Hswpinlocks should only be used to synchonise operations
- * between the Cortex A9 core and the other CPUs.  Hence
- * forcing the masterID to a preset value.
- */
-#define HSEM_MASTER_ID			0x01
-
-#define HSEM_REGISTER_OFFSET		0x08
-
-#define HSEM_CTRL_REG			0x00
-#define HSEM_ICRALL			0x90
-#define HSEM_PROTOCOL_1			0x01
-
-static int u8500_hsem_trylock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	writel(HSEM_MASTER_ID, lock_addr);
-
-	/* get only first 4 bit and compare to masterID.
-	 * if equal, we have the semaphore, otherwise
-	 * someone else has it.
-	 */
-	return (HSEM_MASTER_ID == (0x0F & readl(lock_addr)));
-}
-
-static void u8500_hsem_unlock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	/* release the lock by writing 0 to it */
-	writel(RESET_SEMAPHORE, lock_addr);
-}
-
-/*
- * u8500: what value is recommended here ?
- */
-static void u8500_hsem_relax(struct hwspinlock *lock)
-{
-	ndelay(50);
-}
-
-static const struct hwspinlock_ops u8500_hwspinlock_ops = {
-	.trylock	= u8500_hsem_trylock,
-	.unlock		= u8500_hsem_unlock,
-	.relax		= u8500_hsem_relax,
-};
-
-static int u8500_hsem_probe(struct platform_device *pdev)
-{
-	struct hwspinlock_pdata *pdata = pdev->dev.platform_data;
-	struct hwspinlock_device *bank;
-	struct hwspinlock *hwlock;
-	void __iomem *io_base;
-	int i, num_locks = U8500_MAX_SEMAPHORE;
-	ulong val;
-
-	if (!pdata)
-		return -ENODEV;
-
-	io_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(io_base))
-		return PTR_ERR(io_base);
-
-	/* make sure protocol 1 is selected */
-	val = readl(io_base + HSEM_CTRL_REG);
-	writel((val & ~HSEM_PROTOCOL_1), io_base + HSEM_CTRL_REG);
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-
-	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
-			    GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
-		hwlock->priv = io_base + HSEM_REGISTER_OFFSET + sizeof(u32) * i;
-
-	return devm_hwspin_lock_register(&pdev->dev, bank,
-					 &u8500_hwspinlock_ops,
-					 pdata->base_id, num_locks);
-}
-
-static void u8500_hsem_remove(struct platform_device *pdev)
-{
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-}
-
-static struct platform_driver u8500_hsem_driver = {
-	.probe		= u8500_hsem_probe,
-	.remove		= u8500_hsem_remove,
-	.driver		= {
-		.name	= "u8500_hsem",
-	},
-};
-
-static int __init u8500_hsem_init(void)
-{
-	return platform_driver_register(&u8500_hsem_driver);
-}
-/* board init code might need to reserve hwspinlocks for predefined purposes */
-postcore_initcall(u8500_hsem_init);
-
-static void __exit u8500_hsem_exit(void)
-{
-	platform_driver_unregister(&u8500_hsem_driver);
-}
-module_exit(u8500_hsem_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Hardware Spinlock driver for u8500");
-MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
-- 
2.51.0



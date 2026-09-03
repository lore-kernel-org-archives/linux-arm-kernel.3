Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C91C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFhczqpnwb4IhUTkETL5+7R/pr9TNelX53Vo1wf/d7g=; b=ChVFE1Q+HmP6QeDmG0GKJY66gM
	+sxocAqDf6V9/23Oe5ueF8n03f6QuMTQZEEth84eTdIB67J8rlOQ5172nUZ8M7BYoF34Sr1m3KkXK
	xWh+HJNC9gKhOT2ehUiP0ls5psAR+3uIobgzjTuAPPsQKMVA5mmlZfytpZka04ztKib7AF/9Ja10F
	FZx//CpJrNM/6e98LSVOmQ4qqhMYpA+UvtdWgkq4YGQ3cydgVJkRcA9eJKBNlD5KEqsr01ruNt17x
	/eToW5nG44Q3HtCqGIRsJF1VoEBkq7+lKVbuVt38O+7N1jdyMTQasYzIU+Cqe2ecAyTEwOItMfqew
	qCrnC/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yv-0000000HC68-1CRD;
	Thu, 03 Sep 2026 11:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Yu-0000000HC4t-07YQ;
	Thu, 03 Sep 2026 11:24:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29626600D4;
	Thu,  3 Sep 2026 11:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD131F000E9;
	Thu,  3 Sep 2026 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434694;
	bh=rFhczqpnwb4IhUTkETL5+7R/pr9TNelX53Vo1wf/d7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hksb64BlCdoIKrxrQyUUcgGAjhmlnJLDgqmmCAjkd4iiQK71CSFRnOGthlo7hZegl
	 MTmHgLv3Umnrwfy6/CfpXyMHAtWQvjvuM2P8HdhZtayUPeWTYLcU0AEN+hsbJH/b84
	 iu3tveDJ2iYTw7XXGwRJJKy5NjFNKR9j1RRQalZW0jFL5eWne3a3PDlbAP96CLGx6V
	 hvgaFcbjhu46LlGdwOK1aC6qVG2nMtvDbPChIDBURXRX5i1TquZ7ZyHxzUl8tPz7n0
	 tKj3MSpYWqTnfaaa83Zwt9TfVE8vnlSGI2SeyQf/co06g3ignxw1ECKoT2OKzvLrVp
	 kfm03s2H6hYbw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] mtd: rawnand: lpc32xx_mlc: Remove platform data support
Date: Thu,  3 Sep 2026 14:24:24 +0300
Message-ID: <20260903112425.1904748-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org>
References: <20260903112425.1904748-1-vz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
device tree support, the unused platform data support can be removed
from the NAND MLC driver.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 21 ++-------------------
 include/linux/mtd/lpc32xx_mlc.h    | 17 -----------------
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 include/linux/mtd/lpc32xx_mlc.h

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8f6a89d9ba83..8436015edcb4 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -26,7 +26,6 @@
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
-#include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
@@ -174,7 +173,6 @@ static struct nand_bbt_descr lpc32xx_nand_bbt_mirror = {
 struct lpc32xx_nand_host {
 	struct platform_device	*pdev;
 	struct nand_chip	nand_chip;
-	struct lpc32xx_mlc_platform_data *pdata;
 	struct clk		*clk;
 	struct gpio_desc	*wp_gpio;
 	void __iomem		*io_base;
@@ -580,24 +578,11 @@ static void lpc32xx_ecc_enable(struct nand_chip *chip, int mode)
 static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 {
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
-	dma_cap_mask_t mask;
 
 	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (IS_ERR(host->dma_chan)) {
-		/* fallback to request using platform data */
-		if (!host->pdata || !host->pdata->dma_filter) {
-			dev_err(mtd->dev.parent, "no DMA platform data\n");
-			return -ENOENT;
-		}
-
-		dma_cap_zero(mask);
-		dma_cap_set(DMA_SLAVE, mask);
-		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-mlc");
-
-		if (!host->dma_chan) {
-			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-			return -EBUSY;
-		}
+		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+		return PTR_ERR(host->dma_chan);
 	}
 
 	/*
@@ -736,8 +721,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	gpiod_set_consumer_name(host->wp_gpio, "NAND WP");
 
-	host->pdata = dev_get_platdata(&pdev->dev);
-
 	/* link the private data structures */
 	nand_set_controller_data(nand_chip, host);
 	nand_set_flash_node(nand_chip, pdev->dev.of_node);
diff --git a/include/linux/mtd/lpc32xx_mlc.h b/include/linux/mtd/lpc32xx_mlc.h
deleted file mode 100644
index 35e971be0950..000000000000
--- a/include/linux/mtd/lpc32xx_mlc.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Platform data for LPC32xx SoC MLC NAND controller
- *
- * Copyright © 2012 Roland Stigge
- */
-
-#ifndef __LINUX_MTD_LPC32XX_MLC_H
-#define __LINUX_MTD_LPC32XX_MLC_H
-
-#include <linux/dmaengine.h>
-
-struct lpc32xx_mlc_platform_data {
-	dma_filter_fn dma_filter;
-};
-
-#endif  /* __LINUX_MTD_LPC32XX_MLC_H */
-- 
2.51.0



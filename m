Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CB606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWa7QkCv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1PCWuwR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=; b=XWa7QkCvLZ+lgr
	QEkMNeTZaHuND/OPPVOO+khjKFsSoui68c6lmEl6vTq9aGsZh1f1lYee6bQLDtQ3Ostuil5Qa7ErO
	Y7hiA73VS38xXIyUCDe8KFpdWEWvGHgJI8sbzlH85mSbJi0c1kvAH3ljRUxq2p/OOpVwvkXCfQO2C
	8oTizew0pP0rwgn5ZXPSjhCAkISoLfCiWmzojdrkW3ax5BOC4QvB8GWFV67Zs7MzyNZOxrUAZlZBy
	gMF2TFotlOc5Sv0jrHIj3N+TVz8AniNUVGRs8+LLQ3NzlPjIg9VYM0+9yfS5jrWyYUcTiyFEk+nCi
	fueowde8e8GRxeEECTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2er-0000000AEgi-0gCW;
	Thu, 05 Nov 2026 18:57:57 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ci-0000000ADI9-3iOi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:49 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-716d052dc23so686015eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904944; x=1794509744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=m1PCWuwRfO2W48wPFJ1+ZWQNPljqQV4LoR8K6VscG8eV5+KyE4EQfJC08AR57LPYPA
         4S2OwjjgGhURGktxiGmCFxbkNsJJZrA9RueJDzcirR2J6a10AwFveG1lICWBCp+x8kub
         qy7fkgCPz5asam/KuI2yc6En2WQXkj0gLcBxANZvSOob8Ui5s5Ax9zNWt1SSUDaA0JZo
         F9G1lufivs5Zdo50Gqx4cbM5R0PBKTf5WV93wcMZBbRjG0d7lwITW1blNytO0WtfI9kH
         c167010xG9A4+xfxHMZAjq4SoYTUm4MZ/DpuA+fPBo9s20rR+SbDEQXm/XeV7GnvNS18
         JdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904944; x=1794509744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=RFILRILBPolHSdNzoupL9O1Xfsk0vN3QkCfttmc6WcNsjK1m+Vh7rhKL190XXBNwou
         Chb0CFbMuaUqego8FLMmo7SobGcnwy13aOVpc6W8Orzm16cTlzdE/AgXMqLtydLZdWdo
         sm6UuSJU2E+Z3N9lJSBm8SPnTMzQkTvf4F25OUZtkefUDKzRnKKMU7d4SecJoKcfcYrS
         TF0abQHfQpyR7q+Q5KyJGxAqSK2cMBUKw8PzEbxgaq1/P+uNJc7GDDdM5xt4GRh8oiJk
         v0f3O41lfBQ1rq1QVEkuqJHr4XdwnhW34oeZ95H18jgrgNJJyDOAeBnk2yiCZHcrAH5r
         I16Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgELqH1wnu1swUIIHrd/t5A+G148hJ18UqC7aF4F2ePiySA1Gp30NeL5WAEdxiiR9yo1iG6FiuObt2JEQ6+Ie3@lists.infradead.org
X-Gm-Message-State: APuU4Z9zMcqwEuzuFFJNWokdJUcnXKmFUSAexFnYA4Rg+ergy8ehQf6G
	C1rDKfjQtUoiy8yGBqkSJRIgOE4wNZiN7SzXc6073oOAUTXoNgZPB6i7
X-Gm-Gg: AYBFou3/tbbATe5RuNLonlYnaOtkQmL2x+yDqOzk3D0g1czULZXugBiYdOHs4ofB8N1
	0PR3K0SE2A+q134tWvFdptHPkZNPy13lYzhp+0iDOq7GAnXzrGblhePtJ1BCekqEHh29n3295QE
	WsRgIGT4B8yd3li1WwlaS3Vo08d4+iIsQtRb6w4wT0eOHqM0wjZaxrBS6vFWbDAtOjeA9Qy1tV9
	4FWcx4O97c8BNkk8qyscJrOZ0GuHhImHvLFmcZiDscfZnjWuRprN1elxgbEgEXZS/fhan3x4w1T
	PIL4GEAqaFuZQkHhr31OBJTC5waFwN8Qh0BQ2wtzWZWuHRHlM2L5U0Q47Wkakn77kAS/LnQYIRn
	m+P2HGRlTpAFoBUNCsSDCFvu5FpTsKDsrU3m1mqNU7LM0JTS1Bk+QLH8YUPCSirnd3pJTkNxZUO
	sUVa9KNmYp68icJ8lFseS6OOAtUx3kY/sd1IKkd6LQSGbc+egco105sosDtEzhpOhQmg1m5B5YP
	A992RF/+AuE6AJabGljRV48R/68SegjjutwIgDqJ5BGS88n/QJ4sn6J2GqlsL0sMlbNQYPT4lgn
	H6A1esr9b0IxhVb8aHEZh8fzhVP69sIA0XLvNdB0nBMTe4moIRQyPyPR5jEOQ//EGLO9ef9oPkk
	p0bkqFZShHVJpdwKNNqL/8e9kjx44CNB5LtiY5S+JpOM5XI5sEUphEFKKVhepwH5TarHM9qbL3l
	XqX0mw/jbmcNByiK4uF7w5PRBzRRIufp0mpB3xQwZedxOIPaEu0EmB
X-Received: by 2002:a05:6820:1c8b:b0:712:c751:22eb with SMTP id 006d021491bc7-716e73dea8fmr352195eaf.11.1793904943944;
        Thu, 05 Nov 2026 10:55:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:23 -0700
Subject: [PATCH v10 07/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-7-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105545_142793_218A6EAF 
X-CRM114-Status: GOOD (  26.19  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller uses one completion for successive interrupt-driven
waits. Some transfers wait for both command completion and DMA
completion. The handler acknowledges each event and masks it, leaving
any outstanding event enabled; it calls complete() when all requested
events have arrived.

sunxi_nfc_interrupt() currently calls complete() before updating those
registers. A successful waiter can wake on another CPU and start the
next operation before the old handler acknowledges status or rewrites
the mask. Move complete() after those updates so waking the waiter
cannot precede the handler's last controller access.

A timeout also needs to exclude an unfinished handler. With PREEMPT_RT,
the flags-zero IRQ request is forced threaded. Near the timeout
boundary, that thread can be preempted after reading status and enable
bits while the waiter times out, clears the device mask and rearms the
next wait. The saved snapshot can then restore an obsolete
remaining-event mask or, if it satisfies the old wait, complete the new
wait. Masking the device does not invalidate the running handler's local
values. Repeating init_completion() can also reset its waitqueue lock
during complete(). This lifetime problem was identified by code
inspection during review.

Initialize the completion once in probe and use reinit_completion() for
each wait. On timeout, call disable_irq() before clearing controller
state so existing handling finishes and no new handler can enter during
cleanup.

The hardware may have finished before the delayed handler runs, or the
handler may complete the wait while disable_irq() drains it. Recheck
status against the remaining enabled events before clearing either
register. Events already acknowledged by the handler no longer appear
in that mask; if none remain, the wait has completed. This also handles
command and DMA events arriving separately without requiring an
already acknowledged status bit to be set again.

Then mask and acknowledge the events, read back the mask to flush those
writes, and re-enable the IRQ line even if the recheck changed the
timeout to success. Keep partial-event handling in the IRQ handler and
leave polling and controller/DMA abort handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9a7b365e998e..111094b1c64c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -401,6 +401,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -420,6 +421,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -441,18 +443,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -462,16 +466,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -484,6 +500,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2657,6 +2679,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2665,6 +2688,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0



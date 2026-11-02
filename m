Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D58606D821
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cGP9ozbE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjjwjveG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=; b=cGP9ozbENxANoX
	H9jFt5BqQ1lnbEqKt7CQ5qQZkLNvyWy6Tgx2e2i7sO9X9zWeDVROGvQ3fHPmNK1lglIT+G/tk3RXU
	n4W6+RIjgjUwpm20JtkDLC9u9+OPfX1C8Xaao9JBaG6p70MU6f5zdTRtNECfYmbLhUenBOt5PX63M
	t5DUOcCdNMD5pwFZL/UomM97i1/rBrymh4RGAAhk9jmSFJcBcBKLaSTvjDqHbEdMBMkzd1mnSig0I
	9xaOM5xzAzq19HoqNl1ImaWnHZp0BfKDtul04Aa8N5PT9EYDAeG2CKndZaM47cVmbccXVm8WMINvH
	9mb7C87iZs3CGcFr5RPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Ex-00000000d7h-1IKi;
	Mon, 02 Nov 2026 23:14:59 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Ep-00000000cxT-0A4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:14:52 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-7037daaa820so1294276eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661290; x=1794266090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=LjjwjveGroaKvHKnTy09MRPONtO47pSTLw6cpd+j591Snti8anmhgBsTvowBaP5j0y
         6jJgFVCVdBTf7Ck2WDn4CaSkm6Jq2JzebmB21vfqZG08810yU52FeYh4uMyWEko1oHef
         JLuhPTUJJXvPhTKgvlsHjMg/NmWLK2cTWN8nltqzRDgN7eaAKTPiKmBVZj4aJh9MTJ+U
         RnX4tPo7tCQGFLVDp2i3vonFOKj0Y8mWIJyAw9KzF/kUZ++zWAf3UZzeR8RWOTdQIkJY
         /EwQNlIvzFLukJ4raYp1m1UN/XP2ABcXM+a7CxRSPN2LIaoQHeV3h5ltPOYuPlSDkDTu
         +l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661290; x=1794266090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=AHjsqr+JGl+MK+TSYrVlRROme1bvdTwLhPZLKYhumgbXG3xgW45T2kKXXy7oNeobQG
         H7fRyO3TUDIEDIIppxDNw/02Es+S/5qQPyCAagQwh1bHehWBR8DUIYYdofLy+4irq5fk
         mNUS2gEsTFIih7fVF4ZZri+DNeifLZdj44HYdC6haWOVcP9m6biEesupf9Gf0ulgFNxa
         Vz3rOwLtRALNOY35rxixScUq8Hop3POthcKYUAnFdPyD7sA+ONp674y5vlpbEiOh4QF5
         zzgryAhDC/+PVDPgSgGEGM4M+CQWrstt7THxvajNUEVBk2HEKlFNg1zhoR8yTttNEmES
         lF4A==
X-Forwarded-Encrypted: i=1; AKwUvBw29ZP6mJHundfvYLeS+Oo8g+TH82UTKiXCzPVlLMb9lW6sGmcKOy+aXUqn+1TaFMQJx0GQxhnP+MvqfAvf3KLP@lists.infradead.org
X-Gm-Message-State: AFq9FYJxeYMb+45NWJ+7icNZOmNj69CQT5eEYjO1ytSAww6jtbDjp8PT
	5AKRvM6Xe6jGSZhWe0T5TIELKZRSdG0719+FxDkLoVSUfhV+yE7ckSRM
X-Gm-Gg: AYBFou3mxgLQCyxwjfbVce2IRqezax56MKmEqS+l1/qo2KRFAAvdjJrcmHiOsS7mi5O
	k7VHt2tRcaGAD0uro8DEuPQfLY4lTOuEBtFj6xpu+Jb8OGcJi5jN3YzqoqyCmQvhkhnJVjZUuHo
	8vk7bLlfQxUiMNY0RzkjBo0NF9bANj6t7vVf/FLC1r+gIkPDZHPqsfo0+Y4xwk1LsTZ72Txrs1j
	pyWkBX7LypfSuZrPXZUgFIX9V0vLGXQpF1M5s6B8kLnY+lMTZq1p5PJV9uOXHDIphgvfE49TtEb
	/eeFtmNBM/GimV+koRd4Bjf3hlWrxCNPcJ18pbHl32fA/n5NlM2dY21eDeRlKb95vxrLeQvNWdE
	ecP3oH5dmKi4+6Ly701odqe01OpPrd1r0vnA14Xet18tnni1MoALYgBYFCgUsMoRfxdXpZdyBGb
	+/PpG+G7tLjHy9nSWt1ykGtGRuaGWrcmCTQV4ft3Cs73GAMGUTGr8qiRj5Rigevz8QaokcWQGc7
	bNAkv3Oh8Wm2N5eBMygis3y2eYbjldcHjSEJW6GS2TKutqMSKkSi4h+Flj8vp0yJnvFDMh2TOBk
	NaWKNKbClPRaXfmmYz2KyhY/JqCEqrfDYsL8+Rg0xZzM+aoubczr6c5nJlnEXe5wh+fiETgEnh5
	3KGjyfCCQ1E9QdHkl3GWwuywOtzY9AHA7PrM3DVrxB5YS4ZP1O+GMQHCqisakqnap0OdY1wNvr5
	ux53vA+6/3kjs4GS0VDW5Y2VYiXbNaQ2AgRwD7xi0x1YuJ4UEAZ+eB
X-Received: by 2002:a05:6820:a508:20b0:6cd:3fec:de76 with SMTP id 006d021491bc7-714f2ab9b3bmr4460157eaf.76.1793661289912;
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:35 -0700
Subject: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination
 fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151451_146805_6508CC5B 
X-CRM114-Status: GOOD (  17.72  )
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

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure,
rate-limit ongoing failures with the elapsed time and current RX/TX error
codes, and report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index fd2a0ed21165..6307d0261ceb 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -530,6 +530,46 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = USEC_PER_MSEC;
+	ktime_t start;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret)
+			dev_err_ratelimited(p->port.dev,
+					    "DMA termination still failing after %lld ms: RX %d, TX %d\n",
+					    ktime_ms_delta(ktime_get(), start), rx_ret, tx_ret);
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -539,9 +579,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -553,7 +593,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0



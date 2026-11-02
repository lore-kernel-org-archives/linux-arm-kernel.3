Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFF606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mxPT30Z0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NS4eqGO+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MHu2O2tpE7mPIfUDL/iFSTKDW4nswjhcLVRaXC4fQv4=; b=mxPT30Z0hpRrHc
	IuHT+6j1NlXx9aDXmR9oEndOYsFauc56BKtj8xrHC2+o8gtNb9jWgbaLM/gw2A4Vy4SsP4zkifVJe
	V+yytPq/X2ZAEO7uodeozbvAPaht7L1x5NHpmp10UFYSjAOlA5ahO9RLqdYYKXei/l6is3+Lr2lp+
	uo45wbqfbYD1ahr/AhHQZJ/0FJmGkOf65HI/mTOVdrYPZhOu1t0cXWqMeIPYxumMtNcBD+Byu7MSl
	OSn1iuuCETqTu0/tgh42D2XY3IQtySpgjvHx/GTbKwCKeUHsWPJSIQLy0J1bgNmc0fzYQeGG4yKym
	ldi4soHMrG3U7+kvsYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Er-00000000d0Y-1l5j;
	Mon, 02 Nov 2026 23:14:53 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1En-00000000cw8-3Wq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:14:51 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6dde81a6820so2612895eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661289; x=1794266089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHu2O2tpE7mPIfUDL/iFSTKDW4nswjhcLVRaXC4fQv4=;
        b=NS4eqGO+aRbB8I0O/qQDvVdNjQQvRXF4ts8osSgW7b1z0JgmBZCTNXwLe8876rnJYB
         M+LUDlpNaoTjewXW05uzHCBD9Rfauzih1hiP62ao4dBBHX2vyiTYz5uyKUBZFNC7PfVN
         QtyBpzGiXwY6+l7TJ2lu5TVgUYA3JxxrXawbVy0faG5E3IukSQsLcKBXSFnUnmdAWEHw
         PQtwFed2EaF17lAYcvfVMsxunRdD0GcXB2ZNF/RNUPs5hnYE72rqGiJ0dPAu3CP0bW3w
         fYm0KXXidk92U1bv4FyBJ2gc0TSbEzG7qylCjMiW45ZlhRO/NhLMz4+fzpaP+owNu5eE
         VYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661289; x=1794266089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHu2O2tpE7mPIfUDL/iFSTKDW4nswjhcLVRaXC4fQv4=;
        b=MFpuTcDPKBGYOQFOiIHOyURROo1ys7WWUwxs87mDFEXHFbYHJM8oaYRRJxCxavRT1n
         Ek0+qOgAwgT5Rtsl+n4qrvxjLW7x79oc4O1/zEr1QQEYbXk+bNSFX0JXnCqJwGniHU9T
         97QTpgpaBg4TAdkw2RQWYRlQkwCvH/hKuNMEEMuNAmECZxv9A50W7zbCEWCWh5Un53d0
         ulBXQKW6GtN4aFdcq6HcklxuNGIo4ny/hGj9HqRlGNnuAtsgMMNLRdKIAlv+5mqO4YXa
         8T+vHQDq5I3f5ZegwK/osb77jWrh3GOMuWppCrkQNJpoxvfgMGLCRyxaMwkW4ZUwqdi5
         FpsA==
X-Forwarded-Encrypted: i=1; AKwUvBwXoUdt0X8EW1wGrQ51gOj3UBllT8E5bVESm9M42eQOMV3uGfOJ+5uKw4SGBcfAD2Dk8MzDIF7dJaDc+uKUYxqq@lists.infradead.org
X-Gm-Message-State: AFq9FYI957j0gYbbQOqkuFLTNmpvy/1frLIpswBXuMvQpuY4zHpQPT9f
	LsxO9mkR5ibuH+kkHf0HYLIoS66BO0n+v8T3YYa5n8TrvQ+c1X8wknDH
X-Gm-Gg: AYBFou2d/bdJcC0c8UzKWA4UChuwtPSNo47k69PMOKDhflpsYLkWCPwCoWYtmedx2i5
	pgNSfJuL8+nieLRD8TWccNYxxLLTzO5GMaa4LkZaGstXLyLXy0evDX4V/Dc0VayZ6E+AGtLxQVb
	xWUwCmDgymTiO6g48sZD3ssupncpwdtk9+RY7ArBRGGjEQp2cZlO3LppvUImwr/1tE2Lw38IS/4
	8cNIHPwUMRPt0tEe0+9/0UnJFwtje1LXA9W/wy5RL4Do1QH1oXro2lXpQZODOF60G94QvxYlk06
	gwaqJg1lbyhhGcUovZ84EUCpMGXTtit7MuimN1GJbuFFMKMtvVUZ0X1PmvaxXRqOpQ+yb/6cZQ4
	uCb+m7RxX1SZRbUcJ4i3b/01HUkQkCCel42p2Ro4TRN2M+zeeWjSCUdUsHUhgDTaSEFZsvDfrLF
	VnbcL8hrPQ7I3Vo3u2/1Bl9c+2wR2NWcGKW/6mP0v481bNwHU9wqMa5HHkUbQhg0eQIwjoQDl6j
	ZiRzoiRZNnrq872e6RYrczAq8qS71imQCZTixM4EOkvt1cnUltzK64y1sveK1s8Jfj9TkOr4VR8
	pNi0I3IxIKAYDTmigMNMn5395fSpgKQHpuez9TMD61s++QDnySPONZ81AMYAbRBx+oU++BucT94
	lKYjStVXeqNfouwsZoQFs1zFOvShp+Bf76B5w/mCgc5wogvmQ0UhW15dDFRLa8s/di25gzyB9nt
	OiwRYL6VJklRxgkEvSjFCi/C4jdqBUd3vGvCOXIHX0fK3VGIyKYjg=
X-Received: by 2002:a05:6820:c3ca:b0:6dc:3be3:bb81 with SMTP id 006d021491bc7-714f2462c97mr3847282eaf.35.1793661288486;
        Mon, 02 Nov 2026 15:14:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:34 -0700
Subject: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before reusing
 the receive buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_151450_042091_672EA1DC 
X-CRM114-Status: GOOD (  28.34  )
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

The generic RX timeout path pauses a transfer, copies its data and
terminates it asynchronously. Clearing rx_running at that point lets a
new receive reuse the buffer and cookie while the old callback has not
yet run. Inspecting the new cookie cannot distinguish that callback from
the completion of a new transfer.

Reserve the receive buffer until a worker has drained the canceled
callbacks. Keep FIFO access separate from callback retirement: after a
successful pause and termination, clear rx_running while rx_terminating
prevents another descriptor from reusing the buffer. Deliver the paused
data before allowing the interrupt handler to drain the FIFO through PIO.
Normal retirement only releases ownership and leaves subsequent receive
handling to the UART interrupt.

Preserve the normal completion-path LSR read and gate DMA resubmission on
the receive interrupt enable, so stop_rx() prevents another transfer while
the status read retains its existing side effects.

Reject new flush work and PIO receive handling during shutdown, including
late Intel MID DMA timeouts. Stop and drain retirement work before freeing
the channels and buffer. Once RX has stopped, allow the idle flush used by
DesignWare LCR recovery during shutdown. Clear the shutdown guard before
startup configures the UART and tests its interrupts.

Check pause failures before accessing the buffer. A successful pause is
the quiescence guarantee, even when a provider still reports IN_PROGRESS.
Also accept DMA_COMPLETE after a failed pause: completion can stop the
channel before its callback acquires the port lock, leaving nothing for
the provider to pause. Retire that completed transfer normally.

A failed pause with an incomplete cookie is ambiguous: hardware may have
finished while its completion interrupt is still pending. Canceling that
descriptor can discard the entire completed receive buffer and switch
permanently to PIO. Retain the transfer and retry pause and status in the
worker, with receive interrupts masked to prevent a timeout interrupt
storm. The worker copies only after a successful pause or reported
completion, then terminates and drains the old callback before reuse.
The pending-pause guard keeps callbacks from copying or resubmitting the
transfer concurrently.

Start pause retries at 1 ms and double the delay up to one second to limit
CPU use during persistent failure. Sleep outside the port lock on a timed
waitqueue, with completion and shutdown publishing a wakeup under the
same lock as the worker's retry check. This also catches notifications
arriving just before the worker sleeps, avoiding a full backoff delay
after completion or during shutdown. Reset the delay for each new flush.
Report a stall lasting at least one second once per flush, rate-limited
across repeated stalls. A provider which never pauses or completes retains
RX ownership until an error or shutdown; a timeout alone cannot establish
that discarding the buffer is safe.

On DMA_ERROR or termination failure, let the worker stop DMA before
handing the FIFO to PIO. Keep the requested enables in the existing IER
shadow and filter hardware writes during pause retries and recovery,
including termios, RS485 and overrun-backoff changes. Apply the current
enables after retirement so stop_rx() and shutdown remain effective.
Hold a runtime PM reference around worker register accesses and keep RX
on PIO until reopen after a confirmed error.

Abort the DesignWare idle sequence when RX cannot be stopped. Allow
the empty-FIFO timeout workaround once DMA has released the FIFO, including
while callbacks retire. Exclude FIFO resets during RX DMA recovery. If the
provider still cannot terminate the channel in process context, retain
its buffer and leave receive interrupts masked.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  46 +++++++-
 drivers/tty/serial/8250/8250_core.c |   2 +-
 drivers/tty/serial/8250/8250_dma.c  | 222 ++++++++++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dw.c   |  28 +++--
 drivers/tty/serial/8250/8250_omap.c |   2 +
 drivers/tty/serial/8250/8250_port.c |  36 ++++--
 6 files changed, 276 insertions(+), 60 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 9f01fa36fa3c..d5f847f865e6 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -11,6 +11,7 @@
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 #include "../serial_mctrl_gpio.h"
@@ -23,6 +24,10 @@ struct uart_8250_dma {
 	/* Completion processing with the port lock held. */
 	void (*tx_complete)(struct uart_8250_port *p);
 	struct work_struct tx_flush_work;
+	struct work_struct rx_flush_work;
+	wait_queue_head_t rx_pause_wait;
+	/* Written under the port lock; sampled locklessly by the wait condition. */
+	bool rx_pause_wakeup;
 	struct uart_8250_port *port;
 
 	/* Filter function */
@@ -55,11 +60,16 @@ struct uart_8250_dma {
 
 	unsigned char		tx_running;
 	unsigned char		tx_err;
+	/* RX DMA may access the FIFO; independent of callback retirement. */
 	unsigned char		rx_running;
 	/* Protected by the UART port lock. */
 	bool			shutting_down:1;
 	bool			tx_terminating:1;
 	bool			tx_flushed:1;
+	bool			rx_terminating:1;
+	/* Retry pause without discarding a completion awaiting its DMA IRQ. */
+	bool			rx_pause_pending:1;
+	bool			rx_err:1;
 };
 
 struct old_serial_port {
@@ -148,6 +158,29 @@ static inline void serial_out(struct uart_8250_port *up, int offset, int value)
 	up->port.serial_out(&up->port, offset, value);
 }
 
+static inline bool serial8250_rx_dma_running(struct uart_8250_port *up)
+{
+	return up->dma && up->dma->rx_running;
+}
+
+static inline bool serial8250_rx_dma_recovering(struct uart_8250_port *up)
+{
+	return up->dma && (up->dma->rx_pause_pending ||
+			   (up->dma->rx_err && up->dma->rx_terminating));
+}
+
+/* Keep the desired enables in up->ier while RX DMA recovery masks hardware. */
+static inline void serial8250_out_IER(struct uart_8250_port *up, u8 ier)
+{
+	lockdep_assert_held_once(&up->port.lock);
+
+	if (up->dma && up->dma->shutting_down)
+		ier = 0;
+	else if (serial8250_rx_dma_recovering(up))
+		ier &= ~(UART_IER_RDI | UART_IER_RLSI | UART_IER_RTOIE);
+	serial_out(up, UART_IER, ier);
+}
+
 /**
  *	serial_lsr_in - Read LSR register and preserve flags across reads
  *	@up:	uart 8250 port
@@ -221,7 +254,7 @@ static inline bool serial8250_set_THRI(struct uart_8250_port *up)
 	if (up->ier & UART_IER_THRI)
 		return false;
 	up->ier |= UART_IER_THRI;
-	serial_out(up, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 	return true;
 }
 
@@ -233,7 +266,7 @@ static inline bool serial8250_clear_THRI(struct uart_8250_port *up)
 	if (!(up->ier & UART_IER_THRI))
 		return false;
 	up->ier &= ~UART_IER_THRI;
-	serial_out(up, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 	return true;
 }
 
@@ -417,7 +450,7 @@ extern void serial8250_tx_dma_flush(struct uart_8250_port *);
 void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
 				   struct scatterlist *sgl, unsigned int nents);
 extern int serial8250_rx_dma(struct uart_8250_port *);
-extern void serial8250_rx_dma_flush(struct uart_8250_port *);
+int serial8250_rx_dma_flush(struct uart_8250_port *p);
 extern int serial8250_request_dma(struct uart_8250_port *);
 extern void serial8250_release_dma(struct uart_8250_port *);
 
@@ -473,7 +506,12 @@ static inline int serial8250_rx_dma(struct uart_8250_port *p)
 {
 	return -1;
 }
-static inline void serial8250_rx_dma_flush(struct uart_8250_port *p) { }
+
+static inline int serial8250_rx_dma_flush(struct uart_8250_port *p)
+{
+	return 0;
+}
+
 static inline int serial8250_request_dma(struct uart_8250_port *p)
 {
 	return -1;
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 42319843cb5b..ca06288038ed 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -738,7 +738,7 @@ static void serial_8250_overrun_backoff_work(struct work_struct *work)
 
 	guard(uart_port_lock_irqsave)(&up->port);
 	up->ier |= UART_IER_RLSI | UART_IER_RDI;
-	serial_out(up, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 static int __serial8250_register_8250_port(struct uart_8250_port *uart,
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 344f0dd24b41..fd2a0ed21165 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2013 Intel Corporation
  */
+#include <linux/delay.h>
+#include <linux/ktime.h>
+#include <linux/minmax.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/serial_reg.h>
@@ -86,53 +89,174 @@ void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
 }
 EXPORT_SYMBOL_GPL(serial8250_tx_dma_sync_buffer);
 
-static void __dma_rx_complete(struct uart_8250_port *p)
+static void serial8250_rx_dma_copy(struct uart_8250_port *p,
+				   const struct dma_tx_state *state)
 {
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tty_port = &p->port.state->port;
-	struct dma_tx_state	state;
-	enum dma_status		dma_status;
-	int			count;
-
-	/*
-	 * New DMA Rx can be started during the completion handler before it
-	 * could acquire port's lock and it might still be ongoing. Don't to
-	 * anything in such case.
-	 */
-	dma_status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
-	if (dma_status == DMA_IN_PROGRESS)
-		return;
-
-	count = dma->rx_size - state.residue;
+	size_t			count = dma->rx_size - state->residue;
 
 	if (tty_insert_flip_string(tty_port, dma->rx_buf, count) != count)
 		p->port.icount.buf_overrun++;
 	p->port.icount.rx += count;
-	dma->rx_running = 0;
 
 	tty_flip_buffer_push(tty_port);
 }
 
+static void serial8250_rx_dma_recover(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+
+	/* Keep PIO and new descriptors out until the worker stops the channel. */
+	dma->rx_err = true;
+	dma->rx_terminating = true;
+	serial8250_out_IER(p, p->ier);
+}
+
+/* Try to obtain a stable residue before retiring the current descriptor. */
+static int serial8250_rx_dma_try_flush(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	struct dma_tx_state state;
+	enum dma_status status;
+	int ret;
+
+	lockdep_assert_held_once(&p->port.lock);
+
+	ret = dmaengine_pause(dma->rxchan);
+	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
+	if (status == DMA_ERROR) {
+		ret = -EIO;
+		goto recover;
+	}
+	if (ret && status != DMA_COMPLETE) {
+		/*
+		 * Hardware may be idle before the provider publishes completion.
+		 * Leave the descriptor alive and retry outside interrupt context;
+		 * neither copying its buffer nor canceling it is safe yet.
+		 */
+		dma->rx_pause_pending = true;
+		serial8250_out_IER(p, p->ier);
+		return ret;
+	}
+	/* Some providers still report IN_PROGRESS after a successful pause. */
+	serial8250_rx_dma_copy(p, &state);
+	dma->rx_terminating = true;
+	ret = dmaengine_terminate_async(dma->rxchan);
+	if (ret)
+		goto recover;
+
+	/* DMA released the FIFO; retain the buffer until callbacks retire. */
+	dma->rx_running = 0;
+	return 0;
+
+recover:
+	serial8250_rx_dma_recover(p);
+	return ret;
+}
+
 static void dma_rx_complete(void *param)
 {
 	struct uart_8250_port *p = param;
 	struct uart_8250_dma *dma = p->dma;
-	unsigned long flags;
+	struct dma_tx_state state;
+	enum dma_status status;
 
-	uart_port_lock_irqsave(&p->port, &flags);
-	if (dma->shutting_down)
-		goto out;
-	if (dma->rx_running)
-		__dma_rx_complete(p);
+	guard(uart_port_lock_irqsave)(&p->port);
 
-	/*
-	 * Cannot be combined with the previous check because __dma_rx_complete()
-	 * changes dma->rx_running.
-	 */
-	if (!dma->rx_running && (serial_lsr_in(p) & UART_LSR_DR))
-		p->dma->rx_dma(p);
-out:
-	uart_port_unlock_irqrestore(&p->port, flags);
+	if (dma->shutting_down || dma->rx_terminating)
+		return;
+	if (dma->rx_pause_pending) {
+		/* Let the worker observe completion without waiting for its timeout. */
+		WRITE_ONCE(dma->rx_pause_wakeup, true);
+		wake_up(&dma->rx_pause_wait);
+		return;
+	}
+	if (dma->rx_running) {
+		status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
+		if (status == DMA_ERROR) {
+			serial8250_rx_dma_recover(p);
+			schedule_work(&dma->rx_flush_work);
+			return;
+		}
+		if (status != DMA_COMPLETE)
+			return;
+		serial8250_rx_dma_copy(p, &state);
+		dma->rx_running = 0;
+	}
+
+	/* Preserve LSR read side effects when stop_rx() has disabled resubmission. */
+	if ((serial_lsr_in(p) & UART_LSR_DR) && (p->ier & UART_IER_RDI))
+		dma->rx_dma(p);
+}
+
+static void serial8250_rx_dma_flush_work(struct work_struct *work)
+{
+	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, rx_flush_work);
+	struct uart_8250_port *p = dma->port;
+	unsigned int delay_us = USEC_PER_MSEC;
+	ktime_t start = ktime_get();
+	bool recover, retry, restore_rx;
+	bool warned = false;
+	int ret;
+
+	guard(serial8250_rpm)(p);
+
+	for (;;) {
+		scoped_guard(uart_port_lock_irqsave, &p->port) {
+			/* Shutdown cancels this work and drains both DMA channels. */
+			if (dma->shutting_down)
+				return;
+			/* Serialize reset with completion and shutdown notifications. */
+			WRITE_ONCE(dma->rx_pause_wakeup, false);
+			retry = dma->rx_pause_pending && !dma->rx_terminating;
+			if (retry) {
+				ret = serial8250_rx_dma_try_flush(p);
+				retry = dma->rx_pause_pending && !dma->rx_terminating;
+			}
+			recover = dma->rx_err;
+		}
+		if (!retry)
+			break;
+		if (!warned && ktime_ms_delta(ktime_get(), start) >= MSEC_PER_SEC) {
+			dev_warn_ratelimited(p->port.dev,
+					     "RX DMA pause stalled: %d; retaining transfer and retrying\n",
+					     ret);
+			warned = true;
+		}
+		/* Notifications also cover completion or shutdown before sleeping. */
+		wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->rx_pause_wakeup),
+				     ns_to_ktime(delay_us * NSEC_PER_USEC));
+		delay_us = min(delay_us * 2, USEC_PER_SEC);
+	}
+
+	if (recover) {
+		ret = dmaengine_terminate_sync(dma->rxchan);
+		if (ret) {
+			/* Retain ownership and keep RX masked if DMA cannot be stopped. */
+			dev_err(p->port.dev, "failed to stop RX DMA: %d\n", ret);
+			return;
+		}
+	} else {
+		dmaengine_synchronize(dma->rxchan);
+	}
+
+	scoped_guard(uart_port_lock_irqsave, &p->port) {
+		restore_rx = recover || dma->rx_pause_pending;
+		dma->rx_pause_pending = false;
+		dma->rx_terminating = false;
+		dma->rx_running = 0;
+		if (dma->shutting_down)
+			return;
+
+		if (!restore_rx)
+			return;
+
+		/* Apply the current enables, including any intervening stop_rx(). */
+		serial8250_out_IER(p, p->ier);
+	}
+	if (recover)
+		dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
 }
 
 int serial8250_tx_dma(struct uart_8250_port *p)
@@ -242,6 +366,9 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 
 	if (dma->shutting_down || dma->rx_running)
 		return 0;
+	/* A retiring transfer has released the FIFO, but not its buffer. */
+	if (dma->rx_err || dma->rx_terminating)
+		return -EIO;
 
 	serial8250_do_prepare_rx_dma(p);
 
@@ -262,16 +389,26 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	return 0;
 }
 
-void serial8250_rx_dma_flush(struct uart_8250_port *p)
+int serial8250_rx_dma_flush(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
+	int ret;
 
-	if (!dma || !dma->rxchan || !dma->rx_running)
-		return;
+	lockdep_assert_held_once(&p->port.lock);
 
-	dmaengine_pause(dma->rxchan);
-	__dma_rx_complete(p);
-	dmaengine_terminate_async(dma->rxchan);
+	if (!dma || !dma->rx_running)
+		return 0;
+	/* A late interrupt must not hand a still-active receiver to PIO. */
+	if (dma->shutting_down)
+		return -ESHUTDOWN;
+	if (dma->rx_terminating)
+		return -EIO;
+	if (dma->rx_pause_pending)
+		return -EAGAIN;
+
+	ret = serial8250_rx_dma_try_flush(p);
+	schedule_work(&dma->rx_flush_work);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(serial8250_rx_dma_flush);
 
@@ -368,10 +505,16 @@ int serial8250_request_dma(struct uart_8250_port *p)
 
 	dma->port = p;
 	INIT_WORK(&dma->tx_flush_work, serial8250_tx_dma_flush_work);
+	INIT_WORK(&dma->rx_flush_work, serial8250_rx_dma_flush_work);
+	init_waitqueue_head(&dma->rx_pause_wait);
 
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->tx_terminating = false;
 		dma->tx_flushed = false;
+		dma->rx_terminating = false;
+		dma->rx_pause_pending = false;
+		WRITE_ONCE(dma->rx_pause_wakeup, false);
+		dma->rx_err = false;
 		dma->shutting_down = false;
 	}
 	dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
@@ -395,10 +538,15 @@ void serial8250_release_dma(struct uart_8250_port *p)
 		return;
 
 	cancel_work_sync(&dma->tx_flush_work);
+	cancel_work_sync(&dma->rx_flush_work);
 
 	/* Release RX resources */
 	dmaengine_terminate_sync(dma->rxchan);
-	dma->rx_running = 0;
+	scoped_guard(uart_port_lock_irqsave, &p->port) {
+		dma->rx_running = 0;
+		dma->rx_terminating = false;
+		dma->rx_pause_pending = false;
+	}
 	dma_free_coherent(dmaengine_get_dma_device(dma->rxchan), dma->rx_size,
 			  dma->rx_buf, dma->rx_addr);
 	dma_release_channel(dma->rxchan);
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..050a1c23d9f0 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -112,7 +112,7 @@ static void dw8250_idle_exit(struct uart_port *p)
 	if (up->capabilities & UART_CAP_FIFO)
 		serial_port_out(p, UART_FCR, up->fcr);
 	serial_port_out(p, UART_MCR, up->mcr);
-	serial_port_out(p, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 
 	/* DMA Rx is restarted by IRQ handler as needed. */
 	if (up->dma)
@@ -134,6 +134,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 	unsigned int usr_reg = d->pdata ? d->pdata->usr_reg : DW_UART_USR;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int retries;
+	int ret;
 	u32 lsr;
 
 	lockdep_assert_held_once(&p->lock);
@@ -147,7 +148,12 @@ static int dw8250_idle_enter(struct uart_port *p)
 	serial_port_out(p, UART_IER, 0);
 
 	if (up->dma) {
-		serial8250_rx_dma_flush(up);
+		ret = serial8250_rx_dma_flush(up);
+		if (ret) {
+			serial8250_out_IER(up, up->ier);
+			d->in_idle = 0;
+			return ret;
+		}
 		if (serial8250_tx_dma_running(up))
 			serial8250_tx_dma_pause(up);
 	}
@@ -390,9 +396,9 @@ static void dw8250_quirk_ier_kick(struct uart_port *p)
 	if (!(lsr & UART_LSR_THRE))
 		return;
 
-	serial_port_out(p, UART_IER, up->ier | UART_IER_THRI);
+	serial8250_out_IER(up, up->ier | UART_IER_THRI);
 	serial_port_in(p, UART_LCR);		/* safe, no side-effects */
-	serial_port_out(p, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 static int dw8250_handle_irq(struct uart_port *p)
@@ -429,6 +435,9 @@ static int dw8250_handle_irq(struct uart_port *p)
 
 	d->no_int_count = 0;
 
+	if (up->dma && up->dma->shutting_down)
+		return 1;
+
 	/*
 	 * There are ways to get Designware-based UARTs into a state where
 	 * they are asserting UART_IIR_RX_TIMEOUT but there is no actual
@@ -436,10 +445,11 @@ static int dw8250_handle_irq(struct uart_port *p)
 	 * read.  If we don't do this then the "RX TIMEOUT" interrupt will
 	 * fire forever.
 	 *
-	 * This problem has only been observed so far when not in DMA mode
-	 * so we limit the workaround only to non-DMA mode.
+	 * Only read the FIFO when DMA no longer owns it, including PIO fallback
+	 * after a DMA error.
 	 */
-	if (!(quirks & DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ) && !up->dma && rx_timeout) {
+	if (!(quirks & DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ) &&
+	    !serial8250_rx_dma_running(up) && rx_timeout) {
 		status = serial_lsr_in(up);
 
 		/*
@@ -454,7 +464,9 @@ static int dw8250_handle_irq(struct uart_port *p)
 	}
 
 	/* Manually stop the Rx DMA transfer when acting as flow controller */
-	if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_running && rx_timeout) {
+	if (quirks & DW_UART_QUIRK_IS_DMA_FC && rx_timeout &&
+	    serial8250_rx_dma_running(up) && !up->dma->rx_terminating &&
+	    !up->dma->rx_pause_pending) {
 		status = serial_lsr_in(up);
 
 		if (status & (UART_LSR_DR | UART_LSR_BI)) {
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 9211ccda316a..e305fb4264fe 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -780,6 +780,8 @@ static void omap_8250_shutdown(struct uart_port *port)
 	scoped_guard(uart_port_lock_irq, port) {
 		if (up->dma) {
 			up->dma->shutting_down = true;
+			WRITE_ONCE(up->dma->rx_pause_wakeup, true);
+			wake_up(&up->dma->rx_pause_wait);
 			omap_8250_rx_dma_flush(up);
 		}
 		up->ier = 0;
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index cfbd154bf5f9..49d6a0b19fb4 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1306,7 +1306,7 @@ static void serial8250_stop_rx(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 /**
@@ -1332,7 +1332,8 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
 	 * Enable previously disabled RX interrupts.
 	 */
 	if (!(p->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
-		serial8250_clear_and_reinit_fifos(p);
+		if (!serial8250_rx_dma_recovering(p))
+			serial8250_clear_and_reinit_fifos(p);
 
 		if (toggle_ier) {
 			/*
@@ -1346,7 +1347,7 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
 			lockdep_assert_held_once(&p->port.lock);
 
 			p->ier |= UART_IER_RLSI | UART_IER_RDI;
-			serial_port_out(&p->port, UART_IER, p->ier);
+			serial8250_out_IER(p, p->ier);
 		}
 	}
 }
@@ -1600,7 +1601,7 @@ static void serial8250_disable_ms(struct uart_port *port)
 	mctrl_gpio_disable_ms_no_sync(up->gpios);
 
 	up->ier &= ~UART_IER_MSI;
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 static void serial8250_enable_ms(struct uart_port *port)
@@ -1619,7 +1620,7 @@ static void serial8250_enable_ms(struct uart_port *port)
 	up->ier |= UART_IER_MSI;
 
 	guard(serial8250_rpm)(up);
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 void serial8250_read_char(struct uart_8250_port *up, u16 lsr)
@@ -1816,8 +1817,7 @@ static bool handle_rx_dma(struct uart_8250_port *up, unsigned int iir)
 		fallthrough;
 	case UART_IIR_RLSI:
 	case UART_IIR_RX_TIMEOUT:
-		serial8250_rx_dma_flush(up);
-		return true;
+		return !serial8250_rx_dma_flush(up);
 	}
 	return up->dma->rx_dma(up);
 }
@@ -1837,15 +1837,22 @@ void serial8250_handle_irq_locked(struct uart_port *port, unsigned int iir)
 
 	lockdep_assert_held_once(&port->lock);
 
+	if (up->dma && up->dma->shutting_down)
+		return;
+
 	status = serial_lsr_in(up);
 
 	/*
 	 * Recover from no-data-ready and FIFO error condition to avoid getting
 	 * stuck in the ISR.
 	 */
-	if (!(status & UART_LSR_DR) && (status & UART_LSR_FIFOE))
+	if (!(status & UART_LSR_DR) && (status & UART_LSR_FIFOE) &&
+	    !serial8250_rx_dma_running(up))
 		serial8250_clear_and_reinit_fifos(up);
 
+	if (serial8250_rx_dma_recovering(up))
+		skip_rx = true;
+
 	/*
 	 * If port is stopped and there are no error conditions in the
 	 * FIFO, then don't drain the FIFO, as this may lead to TTY buffer
@@ -2345,6 +2352,12 @@ int serial8250_do_startup(struct uart_port *port)
 
 	guard(serial8250_rpm)(up);
 
+	/* The previous shutdown has drained DMA and its callbacks. */
+	scoped_guard(uart_port_lock_irqsave, port) {
+		if (up->dma)
+			up->dma->shutting_down = false;
+	}
+
 	serial8250_startup_special(port);
 
 	/*
@@ -2447,8 +2460,11 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			WRITE_ONCE(up->dma->rx_pause_wakeup, true);
+			wake_up(&up->dma->rx_pause_wait);
+		}
 		up->ier = 0;
 		serial_port_out(port, UART_IER, 0);
 	}
@@ -2786,7 +2802,7 @@ static void serial8250_set_ier(struct uart_port *port, struct ktermios *termios)
 	if (up->capabilities & UART_CAP_RTOIE)
 		up->ier |= UART_IER_RTOIE;
 
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_out_IER(up, up->ier);
 }
 
 static void serial8250_set_efr(struct uart_port *port, struct ktermios *termios)

-- 
2.53.0



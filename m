Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E56606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AIwf80qi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BzGDKDAB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=; b=AIwf80qiWxohln
	RMHO95ZGYLmKmtidXnrYIdkDKKybSi3nAObjxqHoIgY7uGP++13zP1GProb9+vOVGHAQrF67ij2TZ
	4/x0nu9CpSPsUxqpCaz+uvTDTDo4uvUIW6K54abpQ0WyZvgBMj/fg5MfYi5haAzSx9KtnyL4ehNSX
	D8vBGZ0mRPeGyLU/VTzOf+f80/CvImLbDfC/h6pZfH2F3ZCWinDxDDEboXUIBZ1Bf7DyzGILIC3y9
	PPjVTGWYf4pinUZeGwLMIbmweVoc20BuU83yavV+echUjdgT8ZOwj5pVJ4vybj5sxsC8rYD2f4lU+
	1noQVFuLyfTFnTq8Chhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Eq-00000000czR-43iw;
	Mon, 02 Nov 2026 23:14:52 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Ei-00000000ct3-20sC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:14:48 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6df0b02fe91so96997eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661283; x=1794266083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=BzGDKDAB6a4Oa62RdQLZQow6eDRgkH0+++r/QNKuUrV6eHrrDfSnkB+hOOzowSsP8p
         JbKIcVQdq/zwMBM7psZ8gQ1ODRKSqMftgEodyWQdQfqfom0DKQ8hco01T4l7fVEu86KE
         f3c9B8x69WNzXIMt4bzB2hSw52fmatjHP6ASHMyWRqGMSrSt6Lcd6S8CnaW4DQY5BIR1
         kYCphrNQDZkO7hmEpsA2M6Cz6yZL2l1hnzF8ggDv+a4WKah/hEs3RCuYA0YbGS8V3RXV
         jWYRhh5FGCI7ggp/Keu3/N5SeDTAz2SQT5qT2wjFZG0EH1Z5vC1ZfQlcqti3QHTbbTEK
         MSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661283; x=1794266083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=I4uKOU96Jvv+/VZGDaZBgm7ResLkPyht+RTpfFsz/g7pxNqOnKoT83OwddWYqZdLkn
         DUkG6Zga3JB3JSYZ9gXr7U17eS7s2r0Fijzwtrbx0ny+VEiZDOd37bXbHHvqUd5fE3+z
         q17UIP4rPaRnQzNuJQKIPj8IFB6wrk5B1ZVro93FDxeK2cpfOu3JwH4sUmwbYPFXm01u
         ePp6IUDSedqrBtD2t2ZSRPGF6Q5MmYKqPiaeUnwJlu4EwiC3dgLDkgXRazSAogPh/2Vv
         nrYzfm6hNIoWZA0k3h2nrMYI6E2Pa67nxsTZhycwNMVk7fnMT4YLFEu69WMfZUEg+Jwp
         6dqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUZIRCuiHIHIhU4shMtMkAP81YPe6jX027i0gztXg0F+Sks/8sObnkZUdv+r9aGtnzc2GP5N3hkbACR+LS2Kzu@lists.infradead.org
X-Gm-Message-State: AFq9FYK1SIpqyU6WqbMZL5fPRdoMfhZH2qWDA1cspy9Zbl7KGisWNLYv
	mrMicsZ5ka85/K6GYxVKIj5iaJG7e9KP+qCNkpXagmNpxjUv5UT+J54l
X-Gm-Gg: AYBFou2rY0bC0dX6/mHbP9vquaLE2q9Mwcnsb1TxYbTWNejkzWsCLqIjx5WMiW1kjpV
	JvtqPXcih+tRdoPGYV1rxzQBEQD57qrRlcs2fErWKg6Zb6ahjd3QStXvZhplsGpEfSW3nXMqIn/
	Gc7Zf4oxFOAbNp9wNNhVgP9Y6cQ/rtQRAJ2xF3ha2iDNCaC2In8UQch5uvK/f5FVOwjfsmupeE/
	8wlysCmYPKrdq7Mip79ENMXFzNvhPYkYWqvEtd38ttOpNoa7RqiF/6ZrBTYrwn8QkYDxEc9B/ON
	2k26GMMOxWXTXpDhh8BRP/2Pbd9sHjuUdDdKEC+bX7CDI+1FdaAnPJPXjcVdxgMaDwhxdwEK0Iv
	17T4zvHMeGXCI04giIukTyikqam7nUDhyEDfTSLKIBW8xDs7P6Uzekqx3b3vuInsOHwJwG9SZV/
	Tfc+moavRrSeGUSHabsQKJZbda4Yg0Z8+Ij4/k5XJP86yl7ThWY+fzbYzs7zIpx1bCh9WQ75xpd
	pRPDtL542zh/KlpVSzTa75sxMwf1Briy4QnujnCUCUpsEPasrCTl+vbLbuXsqQtn5GbVTT7XjXk
	0pk6yOGpfqvi+Q3TTYwxWxPkgKhNDRyfkfxhqoqyRX0kvspLxBpA9q8bOIXbhRLNwlD3Tzec9KO
	UaAVwezyQiqxdAiKQEDhU6JOp1Kd24LZLjpWlU321TF80mH9bjcaI4WQ4MJqCVKSipSoroENqO3
	zxWl9A00IsiBUbAIDsuBqjIEa54k3qPOK7ek3G0LhvjfEzgRRgEIqdgSeEmtyusqMfX4/w4aX4
X-Received: by 2002:a05:6820:571a:20b0:6f5:86e1:b020 with SMTP id 006d021491bc7-714f29fa61amr3266065eaf.26.1793661283331;
        Mon, 02 Nov 2026 15:14:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:31 -0700
Subject: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_151446_925572_BCC14D61 
X-CRM114-Status: GOOD (  14.62  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 322403cec2de..fc1a83d6fa7c 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0



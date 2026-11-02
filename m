Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86562606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1M34xJ/b;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYqIR6VY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=; b=1M34xJ/bWhZ8m3
	UKMMV6n7sUaPtNSQqOeVrOlGg8GEU3oxqkX/q0og2N7JaVVbNmtWv2hcYBSaA/oEQ3uUfcZaCWc/K
	BOGGUHnpAP43KqRVgtU1shi8Wq3H9u0KZvdioKCD4fNORH+/EDU4eH8zbs/GydeRXvT01gEDxkZXD
	5sIYqlKSw5+KT+YQJt4WM9ytbuXymugOtF8e30XEqPIOJu1pMY61wJtt2r2QV/p8UfssvUPdTKwtV
	j5qjj9DdD24Hybr8nwCTIobPqzaLE2KvBJk9tEaFFAW+Hawsmd5VfltwvGOHcSKDOgsHB9R7QDBG/
	TEaJArr4QL4dx73coXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1El-00000000cuk-2Lj2;
	Mon, 02 Nov 2026 23:14:48 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Eg-00000000csD-2613
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:14:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-714d57774d8so2353714eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661282; x=1794266082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=qYqIR6VYT4WhTN68gdaOvdeCOcFvYOuH0PxC6uu6Th5wYA+mdayGrh8DuiqofAEkm1
         hIpAUb6raaNE1+0fZsyq22EZIT/QUyotf0NRCTRBfx68vZbRzmPIU/WFr0BCKDZxGwde
         e1sMNsqVFbKEYMUcKvgJR7oKs2ESGzxqhySI4SurEW/gg6UO1q9pHi0JQ+Sd5mnRH4Tk
         QiRuYOmVkcj9ACbyv4ySpkhLFcmy/FGi/o2U+4ipn61LC9sTfjqV7TbkbWx7t+i9yaW4
         8IrLx+PQ5FG9heO58nd31VzLrwfg9w9cb+tEXU5NfLk6FEasKiXdC9hKb8IRMaEYo0QF
         Qn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661282; x=1794266082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=HY+PAM8k7q7skiGoUP1ehbRmLWV+A13M6m2mZ0dhbqFYgpK9TbkZOel6WR+/9EOeNx
         f0AeftajS5Z7a3vOOt4c8yOJMmhE8wuyxLjcc7RC98a8PHcNqPJPWFszVO/8mJysjgW2
         gXlmCaeKwyUNPwEuTJAUem9mZsiBII81YAsjRwg8Lidm0WpK4isz/aalLP7Zsq21Kr55
         A0N+1WRzMLvIkPDWKCTqM6PQoHAFdI7RIewVNtWqzTbGkGCUscDHSM6JI5jQXalptGa9
         rMgEx/wDzGWciQsJRjelkOI9nOni/aulYLJgrH6oxIb9kbTiR1VSngOhcYd2RwSlojNr
         pSLw==
X-Forwarded-Encrypted: i=1; AKwUvBzNM4sn67S9aSaZQgrGYPWLrapVQmdMrsgG8uSPBVdzvY4thExGyrZzJjO4tLs3K4UsBKkqPmPFHUscM/M2wuqy@lists.infradead.org
X-Gm-Message-State: AFq9FYJeHEtEDXtN7PVsE7x29AnDYmgUQ+lpjX1yJWK1assVE2DrikR6
	1qxKITmz8LPtlpJAujpXcpqSFLT3HOm5vCtHr+5Pv7jNtEdu9Qe8FbMv
X-Gm-Gg: AYBFou0YF3DYYx6uQPUCkBvZJPlISnsfsIJ8Gg5gzVdl8IOWZm60DWOFZfoJ8Ih7yoi
	TLQkY/okeHW4lLSFZpAst35ydFn5qIYls+TIkKqIDPwGqv2391b85o199mgv0rN101x2me0shzf
	CWiBY9js/Ejj++cIzDTHj11z3y2X3OJ2jT2Ejw14QzuAj7mScDMP7OoSGev9CsUnjGraBdNSvoZ
	aGwzMIiOB/vxfL+5BeQfwwl1Myn6/WifYUK2XYXndbQylBWGyA9lBDqnd715pgeMTDgxBrxPbdL
	Ww+zepEXIsiH0RXy92/o7jPQ7PCG1dlUE5dmDfYeYBDNucY6VEII+BDya8aZF+dsz6fJpj0yN2X
	P2ddQqRRRoFonf4u4BcHutzgJmt6ndLEvLQCQ6raJ//HWKihCcnInQAE0KVoj4ShZfEZkvmGJ7n
	P/G9s8H9vUegq3IGuOZFvpXH04rqs1SLP2rrtWQ5pPlriyQ0bt83GoyWgnfk5tOj9xh73h7FY8p
	q1chyViE1jsZAefRn2ahOvEn7k4fu9ut5i576ZXWJQbCXJMwOE+Tnz6LyNPTPo4FSshFW1/Hdje
	YsoqtXnGqnWt5pPRrFgDmTBBuxDNRBkf+tj83Ati6zKBEflAQ1m+eRer8bFMdb33Hne+3ZFDCt2
	toR/8ae3Z739qcJUeza0xKls4CFM/TJS0OfUYMMk2njTgPPNAeQQLnaHt5TfYxnqEQ/eawjTknE
	5FwXsCXJzG1N3AfgmGggl1RLKZiyw+bXQLrCfEuBUrTMjo2qEefVg=
X-Received: by 2002:a05:6820:5717:20b0:6d8:57bf:57bf with SMTP id 006d021491bc7-714f2381e69mr4446915eaf.21.1793661281665;
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:30 -0700
Subject: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_151442_579262_6FA990C0 
X-CRM114-Status: GOOD (  14.27  )
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

Moving RX DMA locking out of __dma_rx_do_complete() left the DMA
completion callback calling it without rx_dma_lock. Shutdown and runtime
suspend flush RX under rx_dma_lock but without the port lock, allowing
these paths to overlap the callback's buffer accounting and flip-buffer
insertion. RX submission and UART interrupt handling also require the
port lock.

Take rx_dma_lock inside the port lock in the completion callback. Hold
the port lock around the shutdown and runtime-suspend flushes, matching
the existing interrupt-path lock order. Assert both locks in the common
completion helper and the port lock at the flush entry point.

Fixes: 789898416749 ("serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..322403cec2de 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,8 +771,10 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma)
+	if (up->dma) {
+		guard(uart_port_lock_irq)(port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -898,7 +900,7 @@ static int omap8250_rs485_config(struct uart_port *port,
 #ifdef CONFIG_SERIAL_8250_DMA
 static int omap_8250_rx_dma(struct uart_8250_port *p);
 
-/* Must be called while priv->rx_dma_lock is held */
+/* Must be called with the port lock and priv->rx_dma_lock held. */
 static void __dma_rx_do_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma    *dma = p->dma;
@@ -911,6 +913,9 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	int			ret;
 	u32			reg;
 
+	lockdep_assert_held_once(&p->port.lock);
+	lockdep_assert_held_once(&priv->rx_dma_lock);
+
 	if (!dma->rx_running)
 		goto out;
 
@@ -977,7 +982,8 @@ static void __dma_rx_complete(void *param)
 	if (dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state) != DMA_COMPLETE)
 		return;
 
-	__dma_rx_do_complete(p);
+	scoped_guard(spinlock, &priv->rx_dma_lock)
+		__dma_rx_do_complete(p);
 	if (priv->throttled)
 		return;
 
@@ -995,6 +1001,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
 	unsigned long		flags;
 	int ret;
 
+	lockdep_assert_held_once(&p->port.lock);
+
 	spin_lock_irqsave(&priv->rx_dma_lock, flags);
 
 	if (!dma->rx_running) {
@@ -1811,8 +1819,10 @@ static int omap8250_runtime_suspend(struct device *dev)
 		}
 	}
 
-	if (up && up->dma && up->dma->rxchan)
+	if (up && up->dma && up->dma->rxchan) {
+		guard(uart_port_lock_irqsave)(&up->port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	schedule_work(&priv->qos_work);

-- 
2.53.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwCpwZkR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ACvqzbqC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=; b=gwCpwZkR+5GOLE
	UHlzL8ssWP9/PWg+iE1gIHEQJZoxajaViL23IKqpjwcinwuW78UdWX8mlDoSGSy5gvDQ26KaBYGIT
	sTIYlpF1MX8v1G1AKziOHJi2OfOhdn85hZd1z3OSkLu9/8YqqHXalVLpQ/7F0RVCrTE3987IKqszS
	Js4WglHlG5pObznJR3oEhVUjOmiMENjXPafIaE/L0V65LnCigvMHqi80is5Hq0/gdHjM3NbzxYK4S
	CYhyaxG5itYXHFkpAX8Rv+bnyAEr7Jnbdu0dE+gCIOGUF6q+dhy2Ft9/981VnLsiLwTWXJYhLltpx
	ND3ktuWIdVAgtW8IyxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKiO-00000008YrR-2cNq;
	Thu, 29 Oct 2026 07:38:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKhv-00000008Yf0-00su
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:38:09 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-8451a619da7so1252602a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259473; x=1793864273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=ACvqzbqC9ys/fHVAU2okkxYlyr5fcl9StMsoW7b5hBujbWMMCgPqQ/r9ZjuIf4ec//
         wifTOxfEWv0LS2L/KWUZj4fg3df57rEOwJTcYtLsCms27tW6yLVF1UKe6L2NtbYyiSrZ
         ywl96f+CsNz9aNkZ5ESe0eIU8MTrX2oqQ2nhRjOiAoKhfO7f6daeFAGWPyEOcXordvuK
         KPPTnidek3EC7JvqPnmaIXwgl+4NFfzmgM5OzZexnepmYSHyi+O0g293Gj1pwxdDfHYx
         9bH2r6JzlacJ3JxqLF/A06YwjQ7wJp9cGqRUL79CIO6Qvp914XL2JI0hrTdrqLlNbeZF
         7dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259473; x=1793864273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=eorscc1o0qvIN+fCIB2gkhL2nsZve1xDdnsEfFqIlSSCNg3jLW6JuxAsqI2rUziAC+
         MfNCn9d2O9mpDsjl+spBOAJZ/8n0dUNEgSSQz2Q5krb0NZOSL6nHn6xPqeW56l+Dk7dR
         tbBbPpGnxnFlizuKUEobZJ29r9aJzdwfz4FYRoPS4y5NtJs0dKbnPMtE5JdNttzXdZ43
         1ka2tQ/McnPKrFdCPuviDnZQtVnpq80YN4UJRg2Fs1K4Mk6lHx6Ou8Kpmz1YYXk911fs
         0HBb2cyp+69UedlDSRpYOAQi2NYrYVSC5GIQ25l4ZYr2v84Hz9htoB54KsQ8WdUgrjz1
         l/xg==
X-Forwarded-Encrypted: i=1; AKwUvBxCi1H9VOqiK7gJmz3ZRhoQjVtc2XKoA2R1UYOQ3D59PPPUxMnac8/Qq0CMrXTxiqB3czXdmHqh5C21i2nkW+f9@lists.infradead.org
X-Gm-Message-State: AFq9FYKVZbm5ftDxoPA85pj+HQ+s96AgFYaWk/mwR7nToGzNXoJs69iA
	/K8fLDfeZwiFRGN7eDFJ9Gs73sizgzeYexSFzJXAVwAbHmP8eDjZy5E/
X-Gm-Gg: AYBFou0mpEWN4GKTE7NoSqu8u0neNIyN6lXX5PbHIZbv39PPKwaudF6wKFq2BwIPpDN
	Km70LPDJoRenLZK8YhwVJ4oXxhuCOgUcvWPip8GWrI2/mCspiVNglk5MFNudSHEK/xVTf0Ov/oJ
	N/Cd+DhtFbFLJFXwZ31ySmOfjg7K1123nlwPw0PiJfizt8XmbbpC9gOFisuzmAprgkeM4WW3nmO
	+V/EF4jxszGT1wKoNOjF+nIoT28q3rmu2pz3zxkwNbnaoj8AyeeNQaZVy6N/L3guwYIRcYLOj/0
	j4VQ3qMwidf7hy8ZEXPrMj6TtNzrgNJBBsS3RQcsawtGBmw0GZRJZmeuIzETjRYFhHiATdTmLzD
	ae//3m5dih7iiT5ji4YjmKQ3YcedsI2OiqGpAEaUz2r3BzMBlElBGEVFrJxKuMp/pZxWzs2nEYN
	QZqZQCQMIIvjIHz+v1mQDwhSBS0I2cwSQMbDBIujl0AwTjHLcY7Kx9ab/Dq8yHnvJK47nnjF6tQ
	Mr1FfoJ+AWqO87XIX/JKrkBxH/NpROfb7VjQx/aKbqs5QGDYJ3S3cA27G6bIrXyGWtnJ1rrrtzE
	VL8ttvxMLtlaKIAupQSNbmJMhINZp1NESB/rKIN9tCUSpJ5CLfot9GPpw0/CbE4HowrUej3lHVm
	XSUbAstZo46Ukw4JwAEocGhC0BpCBDSUJkT8lipDCcF/GZBriefqR0NmJefxP+QyCo9Cq27Hx6x
	AzdVbcUsVYbb+O9n6PiNCFG3mgz0wf8gC8XNCU54AgHYUWK79INqqNwyI8WTUI2098zOfN11ZVz
	g==
X-Received: by 2002:a05:6808:11c8:b0:4d6:2545:b12a with SMTP id 5614622812f47-56382682108mr3199317b6e.26.1793259473449;
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:37:02 -0600
Subject: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination
 fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
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
 Timur Tabi <timur@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_003756_690481_97A9DC12 
X-CRM114-Status: GOOD (  16.51  )
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

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index f980b4faf6a3..ff7574b1be40 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -505,6 +505,32 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		dev_err_ratelimited(p->port.dev,
+				    "DMA termination failed: RX %d, TX %d; retrying\n",
+				    rx_ret, tx_ret);
+		msleep(100);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+	}
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -514,9 +540,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -528,7 +554,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0



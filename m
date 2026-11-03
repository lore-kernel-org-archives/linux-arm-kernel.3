Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yduh6NW9;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KojVzX90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=acYk1wdTfJFTPT2zxMP3Y5i0dH0kUe7R3DKFdNTib58=; b=yduh6NW9sf/twA
	nohGknfZYED0Zq7GYNB98b+Sa1MUpXMHW+RkKsGGF76dswWkuhuv2V3si2dPWTy3OpGXQaicDstHv
	Si5p2e8hJnkRiQutJ7iyaVOmwwSr3hLnr9f4Dfity3OFUvjrGc0cqZPTPC3dB+lqJoW9lhILr8Oic
	LeOjfGCr+59RD/rlSi4yY3ZGzG0XshxlsxEY4uInj9MWICKtOTF+tiETKTDR/n2sBjrqnQ716QifR
	cTsCrbRpLc3DGuZD8LMypGV3I2DEwtU8DyPpm8Ghxzy6DhRGxWmJqS+5t61MSorg/tLHBr6JsUvaj
	WbILwXqDkYU6ke9PCHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6k-000000034am-1xZb;
	Tue, 03 Nov 2026 16:11:34 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6Y-000000034Rn-1F8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:28 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-48e94879f02so1272580fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722281; x=1794327081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acYk1wdTfJFTPT2zxMP3Y5i0dH0kUe7R3DKFdNTib58=;
        b=KojVzX906vk8UP5rjL9CZ4jQdIso0EXwfwkXH4lnBQZYq/uC745Zc9Bx9+pCY/ZtYV
         eIP/84nFRwVQISORUMDiBbh15B5D7F4Vf/SvOV1+l4FD3kNe65wRkcaUQ+e0/M41kghj
         LTw5J6g7cvl8r0KcGI+DTM5yNb2S/xvaBcA/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722281; x=1794327081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acYk1wdTfJFTPT2zxMP3Y5i0dH0kUe7R3DKFdNTib58=;
        b=b4djeSAx9MPR9xv7m6f96SRFJP+HJXQTE8l41gszgHo6CCKUTFFvHWcleW2vrxadVU
         KwlBd/1/uGGa4XOAANCIaWON7E4GX+pG7jfhfdbRxTWh3PmNGAy7GvNCJL74i+E4ozJ6
         YzS3hc8dyq27ou2Vyjx2p1FLxOlQsS+ixETkm3XQuzNzVZTUribFJ3Rwg985pIkjQs3O
         JdEbZ9d4zeHURswNWwoTnCJ8ClfaxmEqOOwlUaoUqxBNplJfDXBcj4pxDPhArWYRuVvr
         EZUg5xnB59G02YvO0BFD8P3KF+WNggRV+VrO2S6Lw+4Jh4R8Oy6WZID4ZVUZuVl4blmZ
         HAsg==
X-Forwarded-Encrypted: i=1; AKwUvBx4jmPC+5OngtBk9COq2ndZp6dgsah2+3bSV737bKi6XzAU+B1BuTRsghCEW18X87b4vbVgnBiEOms9A4GpV59a@lists.infradead.org
X-Gm-Message-State: APuU4Z8Yixdk7tgYCDHNmAEZkvUG/OwuyVro0+lgZm2r1DWDFdHIZaZC
	sD4HFfTwqflFsxHkkyVHb/wMO5nOof5xwoFrcljxHqmJoNOYpuOBv6qm81X4PmjtYw==
X-Gm-Gg: AYBFou24llf+XwsfM84Z1/DmC5xd8c/lsfHvTRGczIl7AwBnx0wm8FyIYB0QYPnckFz
	mIfpQDXJVR7j3ldfNurwZOUjKSoMba+Qz66UEtbWIC/bOP+MD+Vify28EIGL43RBoVcoLZ6W0XQ
	JC6TSlK39A7iV/jP+bFgeLt5L1yj8qPWqSX8K8SaFngYIaMzci6fbQXcT8r5mROFTqNPsULA6Nn
	VOoNDqz0rvtdX5GTtbiaFydq3qlyEbpinrheEWx/3VGnIcGyJm1J3WUVgQXf6HEik89BYI3C4wG
	UWRR14ZdNrLoMfVeX/+EsOFk/W6qZRKUpf0Vulu39a3jZ9ZmFXMmoN3WpmV9nYAT174W8qg3t6g
	PNOWSrr+YMTahuhy5qTqqePTFFUufbER5qnzOEJkqsnjDa0CInWk4jZWc+mWIxNsiHGakPT0Thz
	FroTv+uZQ8qWdhfM7dEwtAJtsjSNHE9L1VmlC27bmXZOkxiwhXacP/GrSKyqoRm1Z3Er4+JSJ14
	btHmn3L3oyF6jZaILav620jiamSLw+I1ngQ8gHdLT+p3zToYixZnGgteFceFQMRFJR57joW3bm2
	/fWhEkOKhNI4112Cdp4EYbVTdMidjz96vf+2Gr2tQnU9iVkcofFH8kBhA774f65iAPA7/B6aviu
	eriBNCHNb6N4i308=
X-Received: by 2002:a05:6808:11c6:b0:4f4:b5ba:a241 with SMTP id 5614622812f47-5640dde805amr8598864b6e.39.1793722281085;
        Tue, 03 Nov 2026 08:11:21 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:20 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Tue,  3 Nov 2026 09:11:03 -0700
Message-ID: <20261103161104.2449407-7-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081123_450420_2AF6306F 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Thanks for v9 — fixing asc_startup() locking in Patch 2/8, waking
tty->write_wait for drain waiters in Patch 5/8, splitting OMAP RX locking
and IRQ quiescing into Patches 3/8 and 4/8, and adding rx_pause_wait with
immediate wakeups from dma_rx_complete() and serial8250_do_shutdown() all
look good. Waking rx_pause_wait under port->lock cleanly avoids delaying
normal completion or cancel_work_sync(&dma->rx_flush_work) during shutdown.

Two remaining comments on Patch 7/8:

1. Escalating to serial8250_rx_dma_recover() after a bounded pause-stall
   window on partial RX transfers:

   The commit message notes:
   > A provider which never pauses or completes retains RX ownership until
   > an error or shutdown; a timeout alone cannot establish that discarding
   > the buffer is safe.

   I completely agree that a timeout alone cannot establish that *reusing*
   or *freeing* dma->rx_buf is safe while the channel is still running.
   However, calling serial8250_rx_dma_recover(p) under p->port.lock once
   the retry budget expires does *not* reuse or free dma->rx_buf without
   stopping the channel:

   - Calling serial8250_rx_dma_recover(p) under p->port.lock inside the
     worker's retry block sets dma->rx_err = true and
     dma->rx_terminating = true (and keeps RX masked in UART_IER), which
     causes serial8250_rx_dma_flush_work() to exit the for (;;) loop
     (retry = false, recover = true) and call
     dmaengine_terminate_sync(dma->rxchan) outside p->port.lock in process
     context (8250_dma.c:233-239).
   - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret == 0), the
     channel is stopped and its callbacks are drained, so clearing
     rx_pause_pending/rx_terminating and restoring p->ier safely falls back
     to PIO ("RX DMA failed, using PIO\n").
   - If dmaengine_terminate_sync(dma->rxchan) also fails (ret != 0),
     lines 235-239 already retain dma->rx_buf and return early with RX
     interrupts masked.

   Why does this matter in practice?
   Look at drivers/dma/tegra186-gpc-dma.c:
   - Line 1521 unconditionally assigns .device_pause = tegra_dma_device_pause,
     so dma_get_slave_caps() (drivers/dma/dmaengine.c:614) sets
     caps.cmd_pause = true and serial8250_request_dma() enables RX DMA.
   - On Tegra186, tegra186_dma_chip_data sets .hw_support_pause = false
     (line 1351), so tegra_dma_device_pause() (lines 420-423) unconditionally
     returns -ENOSYS. (On Tegra194/234/264, tegra_dma_pause() at lines
     389-414 polls TEGRA_GPCDMA_STATUS_BUSY after setting
     TEGRA_GPCDMA_CHAN_CSRE_PAUSE for 20 us and returns -ETIMEDOUT if the
     channel does not pause.)

   When an RX timeout interrupt (UART_IIR_RX_TIMEOUT) fires on a partial
   transfer (e.g. a few bytes typed at an interactive console or a short
   command waiting for a reply, count < 4096), hardware transfer completion
   will never occur while the remote peer is waiting for our response. With
   an unbounded for (;;) loop:
   - Those partial bytes in dma->rx_buf are never delivered anyway (even if
     we wait forever until the user closes the port, serial8250_release_dma()
     terminates the channel without copying dma->rx_buf).
   - UART RX remains permanently dead with RLSI/RDI masked and never falls
     back to PIO.
   - serial8250_rx_dma_flush_work() holds a runtime PM reference
     (guard(serial8250_rpm)(p)) for the lifetime of the open port.
   - On 8250_dw, dw8250_idle_enter() (8250_dw.c:151) sees
     serial8250_rx_dma_flush(up) == -EAGAIN and silently aborts
     dw8250_set_divisor() and dw8250_check_lcr(), breaking baud-rate and
     LCR updates while rx_pause_pending is stuck.

   If serial8250_rx_dma_flush_work() escalates to serial8250_rx_dma_recover(p)
   under p->port.lock once the stall threshold is reached (or immediately when
   dmaengine_pause() returns -ENOSYS / -EOPNOTSUPP), dmaengine_terminate_sync()
   safely stops the channel before any buffer state is released and the UART
   recovers on PIO instead of wedging until close().

2. Minor nit in drivers/tty/serial/8250/8250_omap.c:783-784:
   In omap_8250_shutdown():
     WRITE_ONCE(up->dma->rx_pause_wakeup, true);
     wake_up(&up->dma->rx_pause_wait);
   8250_omap uses its own synchronous omap_8250_rx_dma_flush() and never
   schedules rx_flush_work or sleeps on rx_pause_wait, so those two lines
   in omap_8250_shutdown() can be dropped.

Thanks,
Raul


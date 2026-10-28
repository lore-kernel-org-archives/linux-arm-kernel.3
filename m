Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G2lw5pje;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8T/AkoO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=; b=G2lw5pjeP/Efba
	nWEV8Qfuntky9oIboKbOO7hffx0dX1r+hoqkNIZCFaMtXpNk25xm1Yv4C7wRCi0MeiXncoLck2+zT
	yCE17Buo4738jaNuoxTUBOZ1wro3tjyxMvB+TDszSFjIbglBmRHR576hJbxVCX3ALPtnSdizLmgzE
	YKZsorGwFzyBHjm4XKi5SX+dz4eaWhjhU7H8X+NnTqDTVaRcFS2Mdf6TzSzl8X1Ap2kx4mju+jiuv
	UDg3M1dqiFX3HaX7ljX/OYbmW3nlZHGTCs5nmTu7KrWBTRle4Pzk4uKSz0ZidydGRlGg0mlwL80Xz
	Ka5QhGQUfqdH3bqUGKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZy-00000007wvW-2d6R;
	Wed, 28 Oct 2026 20:49:02 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAZs-00000007wsn-1070
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:48:57 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-504ae5941faso787485b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220535; x=1793825335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=b8T/AkoOkHqX3rpXStQO+b5KJfbqP6svPeUOx9eTd8f743vedUFmyhKiUKf3zf5e7p
         GtISEqWCuWLMBh3rT0WBRQGNn0WotOu3EU0/ut7Y7fqzIwKc2Co2S/QP9jVuT+N2OE+X
         /MGzS2xn+PHN5HzCNuwBBXYxz1K+sE7pzUjyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220535; x=1793825335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=gK9b+muUcp2rUiUilBFvWpQjhofGa+eKFBCJ2Pxd4pa480nnW55DY+ITp8cG4WfQcC
         GiEuTC0nqWOJlkiUpE/LP1GSC0cXqCFeIW8ZfybI52+FrhJ2+eIq3HNA/xiBS5pCteJL
         hYYxMprQiA9XM4Ibrs50G1WFzKVh/Hs/4B3uyzhTnWnerzFRbSeTuMpAoyQWW8VuNxS5
         1w21vR6bFiPRDFWLSVZ0GwSfSRNAo2mfOFaS6756Jo7b8YCQFCmwOPCT+xtUyeOCLLMU
         oJI6LbQwgsXcsjONSlRP8VTf8QvRZyV5i4vsMjYwq3V5djWQi+RuVzYPKi8EQZ5sBY+q
         PiEw==
X-Forwarded-Encrypted: i=1; AKwUvBzBj/iw8JkSetrSt6CyIBmTw9XVh/tKe47kf6ajEAbzaktjyBgQvyJzr4Grl37ZWTz0eyI2gxgJfRteL6CH8+CN@lists.infradead.org
X-Gm-Message-State: AFq9FYIBtswPh66jg0TsV4sqWM+GZOPoL8SdoUVZY16tFAiCGvl+b/VM
	fkhmABIukXbxF6QbyLDYt2pPZuB4b9ACWo4wsVfRZaDnrum2DwUVJzq6cw8Mbu19Vg==
X-Gm-Gg: AYBFou3AWYogOxjUPMvM/68NQhk5FXGFFG03q11jUYBZ6nfKN8puyz7jYq2j1DB0TyO
	OnEmnKo7xSqZZRbGreGEuAUXYx7xE0Q4ob74iEegZupsnlzEO1rUdzqxhbCYe6EBEMcETjDObLh
	gvDj+ClosAv0r7XCjqRxa5dRW1Wcu+OuTUhRF+CUeNYoX4j8qiv7zkxxo7rJILiScU7yWjdfSY3
	48CkLy2ZdHC/1t3aLf9u9mTt3GSvTzHrU1MaFDSHWV/HPe8u8N63vykg91iUIPF77sir3kDAUbM
	mtmfWgf0qUK1rLSHiQr+0gVlNU+62VjwN3HTKasdPxEsORa9vAqO24NKE1t4mmofeLVd2SLD2FV
	q3AV4o0I8JzruBe1kekg5OqiAJd6UDcjDk7y3rZN/2pmWtDDPOyOKDymdJ16+Gwrt7Zv7XMW1qo
	C9vnky4Xkl0a9b485x8+MQthF3gjRKzxorSM6UKpPxNqXq//dfXJvNWuZoJdXsxYOHu7o4dsaEF
	nzPluN2+7/UE7JhYW7Ix3X3gEI7KLQkHcSIKMMyq1xFicjnNjAgIti7tPEphboccCKP5DXNxQ9o
	9Uq8jd44im+6JlybX6EMGn1hbdQ3Kt1i0liXe7e/QXvMGymnHP2COp11XjGiQaW10s+Sk+LqfOv
	SpwA5/H5LAXVjAX8uhQ==
X-Received: by 2002:a05:6808:5090:b0:4c3:9892:96c3 with SMTP id 5614622812f47-56385c45dbbmr2597003b6e.22.1793220534711;
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 5/5] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Wed, 28 Oct 2026 14:48:47 -0600
Message-ID: <20261028204847.3471382-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_134856_293253_E13F6BBD 
X-CRM114-Status: GOOD (  11.31  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

In serial8250_rx_dma_flush():

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	/* A completed transfer may reject pause before its callback gets the lock. */
> +	if (ret && status != DMA_COMPLETE)
> +		goto recover;

Checking `status != DMA_COMPLETE` assumes that whenever the hardware DMA channel
has finished transferring the buffer (causing dmaengine_pause() to fail because
the channel is no longer active), dmaengine_tx_status() will already return
DMA_COMPLETE.

However, dma_cookie_status() only returns DMA_COMPLETE after the DMA driver's
interrupt handler has called dma_cookie_complete() / vchan_cookie_complete().
Because serial8250_rx_dma_flush() runs under uart_port_lock_irqsave() in the
UART ISR, if the RX DMA transfer finishes in hardware just before
dmaengine_pause() is called (or while local IRQs are masked on the same CPU
before the DMAC hardirq is serviced):
- On dw-axi-dmac (drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c, used with
  8250_dw), hardware clears CH_EN in DMAC_CHEN when the transfer completes, so
  dma_chan_pause() times out polling DWAXIDMAC_IRQ_SUSPENDED and returns
  -EAGAIN, while dma_chan_tx_status() still returns DMA_IN_PROGRESS because
  dw_axi_dma_interrupt() has not called vchan_cookie_complete() yet (and
  dma_chan_tx_status() also reports state.residue = length for non-cyclic
  transfers until dw_axi_dma_interrupt() runs).
- Similarly, tegra_adma_pause() (drivers/dma/tegra210-adma.c:696) returns
  -EBUSY and omap_dma_pause() (drivers/dma/ti/omap-dma.c:513) returns -EINVAL
  if the hardware channel cleared CCR_ENABLE before the DMA ISR ran, while
  dma_cookie_status() still returns DMA_IN_PROGRESS.

In that window, `if (ret && status != DMA_COMPLETE)` jumps to `recover:`,
dropping up to 4 KB of received data and permanently disabling RX DMA
(dma->rx_err = true) on a normal transfer completion.

Also, on a related shutdown note in drivers/tty/serial/8250/8250_omap.c:
omap_8250_shutdown() (line 775) still calls omap_8250_rx_dma_flush(up) before
taking port->lock to set up->dma->shutting_down = true and clear UART_IER = 0
(lines 783-786). Because __dma_rx_do_complete() clears
UART_OMAP_IER2_RHR_IT_DIS and dma->rx_running = 0, an RX interrupt or callback
in that window can see shutting_down == false and restart RX DMA right before
serial8250_release_dma(up).

We also published the TLA+ model and TLC counterexample trace
(Serial8250RxDmaV7_HwDoneBeforeIrq.cfg) here:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul


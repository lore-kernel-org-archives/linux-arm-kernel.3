Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+mMQl0Y;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P/7mkTI9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=; b=k+mMQl0YvAksVO
	uBFBFAzsK6PP7qOrdpY1NNXxXbKxrT28BZbl+Orieb+lovpEOLzhK5i8T9vRftf1M+6kbigfM7l5B
	6lNOp/31YsqNEHZP8iGq/gcIISeLNQq+1qndaWFCLTMuMkymDWQSEapDsEyimQibe4uOSh3mNXv3N
	PODYP0yu1DX4n9Yhf8K+nSs8Oh1V1dFs+jslGaRQAVIrxX9gWQ8QhS75DaUs2s5HH2mr5QVRJATn1
	lDjMW5cSJubyR7SQxNBY9QNQV0Tncez/f5ZYJtBbIbuYRxAe0ZB+pEqdqM6F4AaSdzsy/fk4FJXtc
	5xDWQ0yT9Hf7koivIeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYbD-0000000ATOw-1orS;
	Thu, 29 Oct 2026 22:27:55 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYb2-0000000ATNY-3i0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:27:48 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-823e4047037so103668a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312863; x=1793917663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=P/7mkTI99Dt2mLxo58/lDiL9v6UxUvCVB8zGvN2dUY4vI07QBaJm7g83QoArcB3m2z
         bYYrg4vi+XunDvecx3hqc5uZT8LR+6ZQmwV06R3/UqI0u0U3LWwkqWuQR27ojeLJ4FwW
         42/7A7CufAUvM518DTbUuHhcaZyptgGe/EHjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312863; x=1793917663;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=oVcblh0lmiAzMdmXyz72+nhLx3KFQtzBQdTH/ZQfdK8O+CUw/vO606JSmsiIaSXsPa
         8PVZXeMHyhHZJUxN5afiL+S+/rzQrZvwyn8xMUa9OKWsiW8KrQkqu7SHrByRXF97uBrn
         qhN4Yiio266tPb9hBYUOVnWTB24r1jYfMwwgjZscfiGzmIsVcS4bdyiTEE7E+fW8BWvg
         EYMp8OJmEXANNTk4ElQJn2AgA8uVmRBwvApa/HGCQQNlIxL8KEtUAI1Y+YPWrJSTKI+7
         bAm45NLFhMIzODJZnsjBClEFr6BAi6m7zMVOx7PeGiSKu/uLvLVS0UUe5b8khSw0HTeI
         NwWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvLQKGbBZMGgcyYIaeOEfqXRh8RTkasGDGU9oov0+d//dAA289ZtaKwtnCBa9o3FwocmtEyFXJdmaUP2oTnL9J@lists.infradead.org
X-Gm-Message-State: AFq9FYLW+n+MkeTkFglgUJpxlbT1brMhzYzMWkFCTXmMOyKP5CV0H7cJ
	FvWGq2DhAti0D8O6AZg4oeRN8WSvO9HMIIxDB+Rp4d9wV2GaijC6+AOFauzlNmwA4g==
X-Gm-Gg: AYBFou0F9rrt0SGSww7wfbS5X1ul9xJeWVh8+sKpFkoAbmr5WddZ2vfbzFOaPtf80LI
	o5Qdj3hXsD74j+bu0n4BT6sG//vEqFFlaffYo9Ww1+BZofqIaQpJE846W6GHO8jhe99fmgCnnGl
	HyWjtaW2Jz9RVwhGtB8YLs7SSEGIVk4gLs/kcVZ8pIqKn9sl7zCUOijQ6wiKcm8CeZkwNo5Dcqz
	Rs46h51KyI07gDtzVymxTrVlqWLCmpYDffOSa0mFLNnC0DTjt5VSI3ImAK8nJIcNzpp17XfR2pd
	NOs7U/Lc92TsuhVPnP/XduAEM0upH3dRdvTjNUOSxfSTDY8gc34IuKUpDwb1ZkKQMO6omI4iUDd
	iclCu8f5VDBO3u0VjGcJqMBI0IBbT+5QNXUAmlvGnWpiKXyCUH7O9PA56+VDYXD/yOTeEecUFql
	HKbSsYvGgVaVZyg5kDYJ1SGJ1qzkF63sadjxaDCAj6m4SWaHLzoeCmTwuFGN14WPlIiBMzk+XUU
	d8rKo64ooC6Wn8bendU869YtMhUrBmBVceeqZ9/dFZ0LjTT5O/GtNVUfKrAkGhcJ80ldLONDL1Z
	VU043BzAR2p/hM0mCDdiB566FK10Qj0EBK7heov3mMuCMyW9mrj0uc0QwftBSSAfedKcn8IsBdP
	+5iSjIef1kQrHb/Y=
X-Received: by 2002:a05:6830:25c6:b0:81f:827a:b1cf with SMTP id 46e09a7af769-85d3644f500mr541370a34.22.1793312863265;
        Thu, 29 Oct 2026 15:27:43 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:41 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination fails
Date: Thu, 29 Oct 2026 16:27:34 -0600
Message-ID: <20261029222734.3086943-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_152745_759675_63BC3F9B 
X-CRM114-Status: GOOD (  16.66  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:19 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > > +	while (rx_ret || tx_ret) {
> > > +		dev_err_ratelimited(p->port.dev,
> > > > +				    "DMA termination failed: RX %d, TX %d; retrying\n",
> > > > +				    rx_ret, tx_ret);
> > > > +		msleep(100);
> > > > +		if (rx_ret)
> > > > +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > > +		if (tx_ret)
> > > > +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > > +	}
> > >
> > > Huh?!
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match the
> > > baudspeed and other parameters of the transfer.
> ...
> Regardless of the retry interval, shutdown cannot release the buffers
> until the provider establishes that DMA and its callbacks have stopped.

Agreed that if dmaengine_terminate_sync() fails, shutdown must not free
dma->rx_buf, unmap dma->tx_addr, or kfree(port->xmit_buf) while hardware
or a detached callback may still touch them.

However, because serial8250_release_dma() runs under port->mutex in
uart_shutdown(), uart_tty_port_shutdown(), and uart_suspend_port(), an
unbounded `while (rx_ret || tx_ret) { msleep(100); ... }` loop means that
if a DMA provider returns a persistent error from dmaengine_terminate_sync()
(-ENOSYS, -EINVAL, -ENODEV, -ENXIO, -ETIMEDOUT, or a wedged controller),
close(), hangup(), and system suspend will hang forever in
TASK_UNINTERRUPTIBLE while holding port->mutex (triggering hung_task_panic
after 120 seconds).

Would it make sense to satisfy both constraints (no UAF on buffers/callbacks,
and no infinite sleep in close()/suspend()) by quarantining/leaking only the
failed channel's resources instead of looping forever? Specifically:
1. Bound the retry loop in serial8250_terminate_dma() (or do not loop on
   non-transient errors, checking `if (dma->rxchan)` / `if (dma->txchan)`).
2. If rx_ret or tx_ret is still non-zero, warn once (`dev_err` / `WARN_ON_ONCE`)
   and intentionally quarantine/leak only the failed channel's resources:
   - If rx_ret != 0, leave dma->rxchan non-NULL, keep dma->shutting_down = true,
     and skip dma_free_coherent() / dma_release_channel(dma->rxchan).
   - If tx_ret != 0, leave dma->txchan non-NULL, keep dma->shutting_down = true
     and state->xmit_blocked = true, skip dma_unmap_single() /
     uart_xmit_unblock() / dma_release_channel(dma->txchan), and in
     serial_core.c:uart_free_xmit_buf(), skip `kfree(xmit_buf)` if
     `state->xmit_blocked` is still set.
3. For a subsequent port reopen after a quarantined failure:
   - Remove the redundant `up->dma->shutting_down = false;` in
     serial8250_do_startup() before serial8250_request_dma(up) (which already
     clears shutting_down under port->lock), and have serial8250_request_dma()
     return -EBUSY if `dma->rxchan || dma->txchan` is still non-NULL so
     reopen falls back cleanly to PIO (`up->dma = NULL`).
   - Guard the DMA completion callbacks (`__dma_tx_complete`, `dma_rx_complete`,
     `omap_8250_dma_tx_complete`, `__dma_rx_complete`) with `if (!dma || ...)`
     so a late callback after `up->dma = NULL` is ignored safely.

That way, neither hardware nor a detached callback can ever UAF rx_buf or
xmit_buf, while close(), system suspend, and subsequent PIO reopen all
complete cleanly without an unbounded msleep() loop.

Thanks,
Raul


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hdT7BJu5;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AXSv5+fc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=; b=hdT7BJu5Br1oAd
	NZkIj1+MjVlwKPMSqm35gJ7QGog/RsHC5X2sauTa/1q0BEmBFQldc8V75+IsO82zrnYqz8aC3X35Q
	Kwq7pss26ZJjhMnhF242xO4uIG+oChdY1GC6E306q3zYdpaXbx0R2u6Jmz90BlkXTbqEgXy7rHyQF
	fNJyvQThOoEU9v34+/+v136gQWvKmM0AdWdzCss+udtKuwsIFuim9SM3pWwC4cHhbzx4hpGRPuTLB
	YNQjmUNMoZHSQdcewNv2VLoaCx8sTkVgpEG/1sPDnwcEzG/wNy5EixBOWSNMX12QzbgbFH4+QOZ69
	oQnQ8PwJZkQf4f9FnqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYb6-0000000ATNu-05Qr;
	Thu, 29 Oct 2026 22:27:48 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYb0-0000000ATNG-3JnC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:27:45 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-85d363fb73cso94045a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 15:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312860; x=1793917660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=AXSv5+fcMnRxiSsZ66BkA6f00Eav88Clk47PiuzYjPUhAjrHSYKIFV7LUfWO/6S9Tp
         RQ2kLfR8qs1DJS/aAVc46ZsS1SQjwPJXkUjP+deN8+M3jEkz/vJ0aAxdb+QZscbpb9OW
         w3Ev2tK4k0u5+JXK9fAgo1LZ4v3a6HlJmRJ3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312860; x=1793917660;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=Y5VT/T8U5buUQfAeOjBO7q64z4ZjFcTKaXzomj8CUJh1dSeWi+qcaLzUsWSI7Kn0D7
         ZZKOm/AJJrUq0HFt9zo/wBRdT/LJA627ZGGUGxee39iLRvHkoQJkMJ9ASIydCrb/02A1
         ez+e9pXSG/10krNox9iYF/goBsOSA6uUlBpFsWXVBz2MS5Bvl09GDoV2j9+QoTvAMw4X
         LCDJTSvgWtRtj6ZA5SF5L4JK6yp1P1BUcSHfP0n3g/3QVQPrUm78+ByMZDExNY9GW2SF
         ly1qSDTueOU0e1F/B2NwZ9XJLXbF+2qMv6EWb9Jek7J46VbN0q/3DhyQsL+vu/8OEauV
         srcg==
X-Forwarded-Encrypted: i=1; AKwUvBx6XXYKtjKSnjdAuNkZdRq8B3DbmXrTBECeLn/K4/i4UyB0IbGcH1ixCjez5guoopbpuVFKNdH2uvYRZ84Xez8B@lists.infradead.org
X-Gm-Message-State: AFq9FYKy7qiZL6buMGxYgvcjcYXM1R+pOLEsJdLbfRhHhu2BmHKeSQql
	ds3oRy0Fly7tVO6+RucIPcsOppkRKwd0uLl2WdqJ7CughX3SYFw9PtKNfgfgsJo9AA==
X-Gm-Gg: AYBFou38aiq5J9bTqzwPWGDSJ1HuZ+NRmgNePvogEaw39+kwEVvOtrsVJJ75sPmceAs
	ZjFTtXia2AZsAVaxhJkL0/Bbe/u6vIvUPAJE93bvHPK6KGTiGDA49qA/WQ7RZPcA4UCbuqt41W/
	ddjTAvCZ0or0Jfyub0rR3diEmQ0gjnwcXEaAJxd+f7FFECodg2W0ZW2JrC+5XemqtfxPyObiVo6
	tETospJowPqcm+KtidLjhFRQZuJV4UOMJCYMzsM0NmFNsBegnF+ctOUIjzHicIBMWWBiG60A0GQ
	exi5CWB3qYFVfezReFk180XnzPSUMdlg50QAUTo/dsC61+3p3JsuPJ+HnSSuhXicox9GCx4PDV+
	/OXf6myCgM//0FBruwMxPtB8mbDHAJEfbIOAIXN3kEBHMsHPvLtvEazc4nnyxgft/sfFvPVATno
	5CcRKaRnR4Jp7em55+6dq98w6BVctSNqoLGbYk6ljjNeFkkXnqYSJxHDpsz6hWwLyRVfeoAU6XM
	P5W202vI+weM8M++bPI+eVZ9a2eKKITfKs7pc68HSnzKfcJM11hwcanQPG7XRYnlGTXwn6XXjZY
	voBouWxyD3zATQIddEWZ8vaxzFbw6OtdLGhIm9oo/pW65QGwIO3Hvz4xGiYfZvoC/PkIY7MGB8I
	NAXFEALQs+p7ZJOiXd/acNNmoJQ0K7FbwqMM5
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85d363b89f1mr545837a34.14.1793312860205;
        Thu, 29 Oct 2026 15:27:40 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:38 -0700 (PDT)
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
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Thu, 29 Oct 2026 16:27:33 -0600
Message-ID: <20261029222734.3086943-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_152743_128983_3052FB2D 
X-CRM114-Status: GOOD (  15.69  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirming
that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
(__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking all
look resolved in v8.

On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending worker
retry loop:

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	if (status == DMA_ERROR) {
> +		ret = -EIO;
> +		goto recover;
> +	}
> +	if (ret && status != DMA_COMPLETE) {
> +		dma->rx_pause_pending = true;
> +		serial8250_out_IER(p, p->ier);
> +		return ret;
> +	}
...
> +	for (;;) {
> +		scoped_guard(uart_port_lock_irqsave, &p->port) {
> +			if (dma->shutting_down)
> +				return;
> +			if (dma->rx_pause_pending && !dma->rx_terminating)
> +				serial8250_rx_dma_try_flush(p);
> +			retry = dma->rx_pause_pending && !dma->rx_terminating;
> +			recover = dma->rx_err;
> +		}
> +		if (!retry)
> +			break;
> +		usleep_range(1000, 2000);
> +	}

This cleanly resolves the race where a full 4 KB transfer completed in
hardware just before dmaengine_pause() ran while its DMA completion hardirq
was still pending (once serial8250_rx_dma_flush_work() drops port->lock and
sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE).

However, what happens if dmaengine_pause() fails on a *partial* RX transfer
(0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the remote
peer stopped sending and is waiting for a reply?

(In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress) on
Receive at lines 67-70, which forces the remote peer to always keep
transmitting until count == Capacity and CompleteInHw fires.)

When the peer is idle after sending a partial burst (< 4096 bytes):
1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
   (neither DMA_COMPLETE nor DMA_ERROR).
2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
   -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
   serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
   usleep_range(1000, 2000):
   - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wakes a
     system_percpu_wq worker 500-1000 times per second until the port is closed.
   - RX interrupts remain masked in hardware (`rx_pause_pending == true`), the
     partial bytes are never flushed, and the port never falls back to PIO.
   - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_flush()
     while rx_pause_pending is true, causing dw8250_set_divisor() and
     dw8250_check_lcr() to silently abort baud-rate and LCR updates.

Since the only reason to retry pause/status is to let an already-pending DMA
completion hardirq run after port->lock (and local IRQs) are released, could
we bound the retry loop in serial8250_rx_dma_flush_work() to a small number of
iterations (e.g. 5 retries)? If rx_pause_pending is still unresolved after the
retry budget expires, calling serial8250_rx_dma_recover(p) under port->lock
will set `dma->rx_err = true` and `dma->rx_terminating = true`, letting the
worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), and
switch cleanly to PIO.

We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
`Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul


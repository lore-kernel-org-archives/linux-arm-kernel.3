Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tr1eePnL;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C9zxO5qN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=; b=Tr1eePnLatPV60
	PvSV3xuO+sTbPVOGM8GTkmUf9DjyelDVF+drCJOql6LrzQlAB18hOWhC4in6RJ0pGyxn5OvF+t5yY
	fIFy7g4yhYTDw+ImxjvKZ/nVocJVqe0ZOc884ex95NdXdG2gbn9b7gRysPPcfRCsvPY3PpRqUtQEa
	ocqlwa3DVXq6RhtJ2KcEvgXCpGrDVMzem3CZQ3lutmZ8qUB2e4nQDzxpIn+SCCfDEEaW+JF9SgNSH
	wUco5k5Hjcu8Ah2wbOrVz2BO1mUFISiwrfnmABDCSTgo7l5hVQ69Ny0Nd7cetMBoUf5xQPdwZRQWa
	jGrYfxB79JI0XJHpnjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqX3-0000000CFoV-3R5x;
	Fri, 30 Oct 2026 17:36:49 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqWv-0000000CFmO-16cN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:36:42 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-847ac7ccd85so723616a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793381800; x=1793986600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=;
        b=C9zxO5qNZ+BSJ+RvUI1CBhu93Qm0eqB6wGbJ2tRC5Yby/D8a/kR/EjWnOh78enLB4m
         T5Xz9alGE8aLemdIMMz3y+2NIAOKc4lSSmGGrqvFeX4E9tMXDTZYQicz4ZqVjqkHqg1C
         zDq9uYhxFxuOcD5Bvt+03CsXaaNugPsy8CzAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381800; x=1793986600;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=;
        b=XH3lXu/96bthV+5I4PKRy0XnqYGY1fhKXKDXY/YlRNL1rCUzFGhP36Jj+6ZlEd14kZ
         VwmLyWg/SwTa6GpGWWni28OyVBxYys2EYgu3TcYdE6mFht95Nm7k/qMGZ2jb9xHPGNMe
         Quy3anQSuMYgXwWXBxeAM6R4SWzIcNnrzVgQUGxY2piUIJu8OEV/H0vchu2D0yzFISQ8
         mwCfoJaYsnobZaz13leba1+PE34xPR1UOI4+6qU3ypkQEG1RF+ZjwKYXkZA9vKgUew//
         0zpzmFGiGW1jHGVb1xTPkse3poIiL8ioYqEM97rJ6HBIjMc4UBUUN0CPKnsAAdY76zrB
         Xigg==
X-Forwarded-Encrypted: i=1; AKwUvBzaMMimCHLvu0zZ4ANJ7euNUpJRUy+PLnTHBJXJqPNtFeFo7MA0Uz0IaFekoq4c/1V0rxG3i6sjy1Qryz2A4/ZY@lists.infradead.org
X-Gm-Message-State: AFq9FYIHxu/VZKNykm4rHJHLaB+ElrEPcR2VwMN1/1i4OoMOsSMEY6jA
	CYZV2iGHUAsRCjP3nZgwEVh+Bt5M9wD44qxZELE/mpPfFPS8O4bh6f7s0ocNq3D5YA==
X-Gm-Gg: AYBFou1l3K/bskFAsNFNk28Qy0hDXvsoNaE6WZrkMnAfxEfonp6pvfTGkoQZR0BQJWr
	8cHMCrkVEXd3aEn2p6MuyFnwwJ7V5RnncYCWt+yAFcKetvKBVJad6Phb2A9wUnYvYHwAaHzxvVT
	wKQkf6wrVBDMwHi78lwMs85+4tvlMku2exRN9xV2b5RGOV7NG7KFj+Ml/MDBqGLk7/46DqHFHrr
	ukZcZ+fISDkiKGzuN5lru0AWpzLFyIHYrqRsKqZqLArYbYSG5enBtV+mmAs47ndTWDJZ0/H/HC+
	gy0Iv6nz17nFnZZ/GOjmHWRsWPqQ/glMdR2ZRVBA+ClEXcLl3J80Lrn9NekrZsyx2CpJMN+YOZd
	YjibVbhdNmnC2kkqeoGlHEEuBqn+dlifvxnwIK38amhqlkPO/DChNWa/vQ0qLtNmND0xLRt2h6E
	QJjwq+7T6DWMfuMZcwBpG4TUYwSlWYINkDLnTD7RLsdUGAJbsyFJoi4Bm0vqjI3R1gmEwqWY2QU
	Q+3PpjWOxasCp03/XwnIZvBBEaMVDQ+50uu/d1bReVln1bYKxRS4JjbZSBbSfjsJqceZOkVCgdI
	kIMjlZB+icgeMqWQjuCQti2nmnPiCXokZeQ4SVuplT+kZMMVy68IRXXx+0F3ZhBte+0nl8lMA7C
	AaXhjw5Y55PntPhpd
X-Received: by 2002:a05:6830:7181:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-85d3649ebddmr2330039a34.29.1793381799663;
        Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354efebesm2497044a34.19.2026.10.30.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?UTF-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
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
Date: Fri, 30 Oct 2026 11:36:35 -0600
Message-ID: <20261030173635.2186490-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com> <20261029222734.3086943-2-rrangel@chromium.org> <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_103641_320043_61454A04 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Oct 29, 2026 at 6:35 PM James Hilliard <james.hilliard1@gmail.com> wrote:
> That is the current behavior. Returning from shutdown allows serial
> core to free the TX buffer and removal to release the callback
> context. The retry loop prevents those releases, but a permanent
> termination failure blocks teardown indefinitely
...
> Retaining the buffers and channels does not preserve the complete
> callback context.
>
> The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
> embedded in devm-managed private data, which can be freed after
> unbind. The registered 8250 port slot can also be reused. Retaining
> the DMA channel does not prevent either operation.
...
> Clearing up->dma does not stop hardware accesses. After unsuccessful
> termination, the channel may still access the UART FIFO, so reopening
> with PIO can introduce concurrent FIFO access.
>
> A hardware-specific stop/reset sequence could establish quiescence,
> but its implementation and effects on other channels depend on the
> controller. If the channel cannot be stopped, quarantine also needs
> to preserve callback-context lifetimes and prevent unsafe port reuse.
...
> The current callbacks fetch p->dma before acquiring the port lock.
> A callback can therefore retain the old non-NULL pointer across the
> assignment of NULL. Checking that cached pointer does not protect
> its backing allocation from being freed.
>
> When termination returns an error, dmaengine_terminate_sync() also
> returns without calling dmaengine_synchronize(), so callback draining
> has not been established.

Those are all good points. We added port reopen and a `NoConcurrentFifoAccess`
invariant to `Serial8250TxDmaV8.tla`
(`Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg`), and TLC immediately
confirmed your point on FIFO contention: clearing `up->dma = NULL` and
falling back to PIO when reopening after a failed `dmaengine_terminate_sync()`
violates `NoConcurrentFifoAccess` in 7 states because the un-terminated DMA
descriptor can still access the hardware UART FIFO concurrently with PIO.

We can satisfy all three constraints while still preventing normal `close()`,
`hangup()`, and system `suspend()` from hanging forever in
`TASK_UNINTERRUPTIBLE` under `port->mutex` across the three lifecycle edges:

1. **On `close()` / `hangup()` / `uart_suspend_port()` (`serial8250_release_dma()` & `uart_free_xmit_buf()`)**:
   - Bound the retry loop in `serial8250_terminate_dma()` (with a short
     backoff rather than an unbounded `msleep(100)`, guarding
     `if (dma->rxchan)` / `if (dma->txchan)`) and release whichever
     channel(s) terminated cleanly (`rx_ret == 0` or `tx_ret == 0`).
   - If `rx_ret != 0` or `tx_ret != 0`, **keep `up->dma` intact** (do not set
     `up->dma = NULL`, including in `8250_omap.c:omap_8250_shutdown()`), keep
     `dma->shutting_down = true`, and retain the failed channel and its
     buffer (`dma->rxchan` / `dma->rx_buf` when `rx_ret != 0`; `dma->txchan`
     and mapped `dma->tx_addr` when `tx_ret != 0`).
   - When `tx_ret != 0`, explicitly call `uart_xmit_block(&p->port)` under
     `p->port.lock` (`state->xmit_blocked = true`, since `xmit_blocked` is
     otherwise only set when `uart_flush_buffer()` ran prior to `close()`),
     and in `serial_core.c:uart_free_xmit_buf()`, return early under
     `uport->lock` if `state->xmit_blocked` is set (without clearing
     `port->xmit_buf = NULL`, resetting `port->xmit_fifo`, or calling
     `kfree(xmit_buf)`).
   - Because `up->dma` is not cleared and `struct uart_8250_dma` /
     `struct uart_8250_port` remain allocated on the bound device during
     `close()`, `hangup()`, and `suspend()`, any callback that was not
     drained by `dmaengine_terminate_sync()` safely loads a valid `p->dma`,
     observes `dma->shutting_down == true` under `port->lock`, and returns
     without UAF—while `close()`, `hangup()`, and system `suspend()` return
     cleanly without hanging in `D` state or triggering `hung_task_panic`.

2. **On subsequent `open()` (`serial8250_do_startup()` & `omap_8250_startup()`)**:
   - At the very start of `serial8250_do_startup()` (`8250_port.c:2356`) and
     `omap_8250_startup()` (`8250_omap.c:724`)—after acquiring runtime PM,
     and **before** clearing `up->dma->shutting_down = false`, touching
     `UART_FCR` / `UART_RX` / `UART_TX`, or setting up IRQs/timers—if
     `up->dma && (up->dma->rxchan || up->dma->txchan)` is still non-NULL from
     a prior failed termination, retry `serial8250_release_dma(up)` first:
     - If `up->dma->rxchan || up->dma->txchan` is **still** non-NULL
       (termination still failed), immediately return `-EIO` and **fail
       `startup()`** (do *not* clear `up->dma = NULL` and do *not* fall back
       to PIO while the wedged DMA channel may still touch the UART FIFO).
     - If termination succeeded on retry (`rxchan == NULL && txchan == NULL`,
       which also unblocked `state->xmit_blocked`), reset `xmit_fifo` and
       proceed with normal startup and `serial8250_request_dma(up)`.

3. **On driver unbind (`serial8250_unregister_port()` / `serial_core_remove_one_port()`)**:
   - Driver removal is the *only* point where `devm`-allocated
     `struct uart_8250_dma` and the `serial8250_ports[]` slot are about to be
     freed/reused (note also that `serial_core_remove_one_port()` at
     `serial_core.c:3336` only calls `uart_shutdown()` when
     `tty_port_initialized(port)` is true, so if the port was already closed
     with a quarantined channel, unbind must still drain/release it).
   - Restricting blocking termination wait to driver unbind (when a channel is
     still active/quarantined) prevents `close()`, `hangup()`, and system
     `suspend()` from ever hanging the kernel in `msleep(100)`.

We verified this quarantine + `-EIO` reopen contract in
`Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg` (`AllowReopen = TRUE`,
`ReopenFallbackToPio = FALSE`), which passes all safety and liveness
properties (`NoUsersAtFree`, `BoundedTerminateRetries`,
`NoConcurrentFifoAccess`, `QuarantineImpliesXmitBlocked`, `ShutdownProgress`)
with 0 errors:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul


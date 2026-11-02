Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B35606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0rZWTXcV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw4ODt1B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=; b=0rZWTXcV7FjqKy
	aq4LWM7fxhl+OcMZWbKp2meslTxOMrnIaLP0Tq1qySf0KDTa8fTTjk+lQkZMkzxlIDBRZCNi/XsL4
	vEQBd/EHiz8lNQQZvKqSgfaqxeWwVb91fIzaXBXQJ5UCR/bqC6FnwjOVzpuFcGIXH0DtqqYuQYWdw
	9sqDuUDslIl3fMXXPB+OIETzYdLdEDQnZ/N3HF37fC56DLOXr4genGBr4OE/rQuRTYQ4+aKDC9a5b
	F+9Sa+3a0hVkD6jmh6t0o/hlkg6DuaOF8Zf0SBul9/f/JBHJ+epJM2rdUKt1DZcxOSKCtF4HTEmpA
	p6vASBJvgBcSA2HgFz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxI8-000000003EH-2vYk;
	Mon, 02 Nov 2026 19:02:00 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxI5-000000003DV-3jAD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:01:59 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-77bf892b496so1048905137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646115; cv=none;
        d=google.com; s=arc-20260327;
        b=QW1QMrYz92k78hbvY6xKuI5hujXzUnQmkWo4uHh/2ylLmdyHybo2DrT+Qf/QkG6rb3
         IhLSgW1PmNOIsmWtC8nTdXgB7CVK5/N/Y6alsWuAejFDOi2z/7T22GZWJJqCTH/beCh6
         aqqPbaWtVNHAN6M4xEXYuoGBTBs+91NxUzY9tIg/oP9Ro6fKxBFd44bomZ2EgwHvWY8S
         G0Uw03DGUN4RWH2VFdPwVhnl0G+0s+1DrSge5QMBLIRKciwFVWdVbq9/oDSdR0L9PkDv
         pXVbWy5R5BRk1q6VgJRmTPxrngDfcXhCed+91hHxhrgoU3kauC7Pt51wvFD91JTUqCD0
         buoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        fh=E5zxeOm0zZgluehsgFV4WUEt/lOu1QBK9qcbo08MjFY=;
        b=kGvKE61w3K/tjgrfOwYETuHtcuHd/1Mfx97DOXsOhU9SkChIJXg4TUnvFYxkfOMwxE
         jso7cS2Her5M/fsybVBECGXopU7N2qUYqcMMha9tC6IhAQyn2UlAbVy+NoH6nTysB5Lp
         bIoTjViBx4XozwOZBDsudxENiqn5Z3+iYz4s4uZwKxRmsRXo3XZ6WQj3YpeAIXxWS3yP
         MCRnjZ2PquCQdkBTGtha4/4MO4ytKmUtgHohKr0vTzzFp6TUn0WI7slU6Vx57Oa432g7
         OH9OsPlFYQB+M048BcQJacGs3BUBuGOPhT9tUw9opabj+EhWV/hgLcpBNRZ3lJylrNms
         vQsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646115; x=1794250915; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=Dw4ODt1B6zP5eXNaJWclzN+pigC1esU6gPg0xxqobKeOxn76sCN3JaC5MJvjwbziI6
         kfH0yl6jt8FDypLo2WRL4sfFdo/KVq+e2/2k4fchHgw0W6Rzu29FRFPlt1wVFicgsFeh
         i0jWn8/JtzNKNTAh055MyyCo1eugDqdG5tE0RijvLOtH5M6ZnDP2qV+f9qBewp2Hu8/X
         GOBmNMncXeGvBgVU1H18R5SuGefiA8tmxD18aqTvEiZrJLHbWYes0CVcvd3PKW7/8KIp
         H3G36FIcT6Lq7y7t/V4/Ox3Rwllj6zMcl5T5B9Vq9eJPH9Mbli6CbvE04Hk73QuvhhzI
         h97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646115; x=1794250915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=xkwmOvRrDIfjjo+ogXJCW70kQu2VnegNK0V9P57+cuvvqL8NZCu5hQ9ZYLVOtsCxb9
         KEr09Ejh53yMf0hGorVV4vwWNtLZZaOmiQ3D8USdQLhmgFFgPSROtwmDAiYP+E6zZWMe
         JsEAp+fHSWMkOLg/NQiS0HLwwji6/nd8m2NdtneQ8FSesTbvdmFXnAcZD4twazlbtTIw
         VEiu1b8okrRdBtOAU+hO8sBUyVd0T7H63djfC1oJYPdZlo58LC6idm1ItYK3fclHukL4
         5hTTYmxc/whEyYYKm4Pf6j0/M1lHPi6doYLL7NLXHE/AVfl7bls51V+ZJZuyVjD+oK1H
         DPLA==
X-Forwarded-Encrypted: i=1; AKwUvBwGCV6wGf6Q4cvnk1ddWmbZKgvj3+dUpZgJbCXl2GiTGi+IbsF8ohrdhxXCmY8Sg6ARkGfZpQ2Wjs1ukop/GruA@lists.infradead.org
X-Gm-Message-State: APuU4Z+nm+7qHRxE4193o4DNfyyGX6iajaZtXfO8RUqGsNFdPu2rwN6b
	psilmgepYMMCTZ6lCqFwBy9GL9fnhaxTAQTaobN6BhgU/o1K/aDwQlniZU+xojWch2oFErG9e1a
	Oa/nm/R6SiXXMz+ZpUahi5txA4MLsQPU=
X-Gm-Gg: AYBFou0p3bWXwDO75waTm80llAswEjYPSbvYhL31EjChVHfc1Ym2Ki4YgNj7WNC8xzJ
	l2zlqr+nGiD0gzq0utwkkeRozZzbwqdLP1Jsupp+0YO3gsK9oiycNviOIIC+glRqWCiBmrWrt3U
	GyRhCRfvP5B7fbRWkNdE8aXJY+yrUbGwaM51Ampm1QCoYwbBgVoE5IuwttzbSoAzsnD4oIDq3/4
	/okZXzph2anGEXxmOvxAFaLAUnTPIcoLzXqtbjtavVxK4vJLNJTOevu1I7bYd1GytqpsYrEIwnd
	VeU9pT74VTRdiAnEOCXS609oZ/qb7/XJtxGV6wTiMOysfBvRu3z9NFYV1Zyq+cjUPXoTmHykTcZ
	bIeGUgZUyT01Oxz9zzcUrz05X4HqbVkXaWHThILmro8Mw2IF2WGbMZzNswBuzv5vjo5ApRyrwer
	6kT/usYGHw8tfxQS/K1mChSv6q8nV/f7i8ZcVss8rl907oy3TrTC8i/HckX8+Jv4OOkg8vx/dwz
	pFGVuwYvGOl+OdmbJDCMDqKZpviUg==
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr4192494137.13.1793646113500; Mon, 02 Nov 2026
 11:01:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <20261029222734.3086943-2-rrangel@chromium.org> <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
 <20261030173635.2186490-2-rrangel@chromium.org>
In-Reply-To: <20261030173635.2186490-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Nov 2026 12:01:42 -0700
X-Gm-Features: AclHuK8hePvnISH49dlVrc4mCThAhAMYZDLctOcSiiJ-Xdrwl739zXGlDWt75pI
Message-ID: <CADvTj4op-tFqWmtzOQnt=q9aZttaWngYXLjfXEkdqcLirTMoXA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Raul E Rangel <rrangel@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_110157_957755_F84D3443 
X-CRM114-Status: GOOD (  34.81  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:36=E2=80=AFAM Raul E Rangel <rrangel@chromium.or=
g> wrote:
>
> On Thu, Oct 29, 2026 at 6:35 PM James Hilliard <james.hilliard1@gmail.com=
> wrote:
> > That is the current behavior. Returning from shutdown allows serial
> > core to free the TX buffer and removal to release the callback
> > context. The retry loop prevents those releases, but a permanent
> > termination failure blocks teardown indefinitely
> ...
> > Retaining the buffers and channels does not preserve the complete
> > callback context.
> >
> > The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
> > embedded in devm-managed private data, which can be freed after
> > unbind. The registered 8250 port slot can also be reused. Retaining
> > the DMA channel does not prevent either operation.
> ...
> > Clearing up->dma does not stop hardware accesses. After unsuccessful
> > termination, the channel may still access the UART FIFO, so reopening
> > with PIO can introduce concurrent FIFO access.
> >
> > A hardware-specific stop/reset sequence could establish quiescence,
> > but its implementation and effects on other channels depend on the
> > controller. If the channel cannot be stopped, quarantine also needs
> > to preserve callback-context lifetimes and prevent unsafe port reuse.
> ...
> > The current callbacks fetch p->dma before acquiring the port lock.
> > A callback can therefore retain the old non-NULL pointer across the
> > assignment of NULL. Checking that cached pointer does not protect
> > its backing allocation from being freed.
> >
> > When termination returns an error, dmaengine_terminate_sync() also
> > returns without calling dmaengine_synchronize(), so callback draining
> > has not been established.
>
> Those are all good points. We added port reopen and a `NoConcurrentFifoAc=
cess`
> invariant to `Serial8250TxDmaV8.tla`
> (`Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg`), and TLC immediately
> confirmed your point on FIFO contention: clearing `up->dma =3D NULL` and
> falling back to PIO when reopening after a failed `dmaengine_terminate_sy=
nc()`
> violates `NoConcurrentFifoAccess` in 7 states because the un-terminated D=
MA
> descriptor can still access the hardware UART FIFO concurrently with PIO.
>
> We can satisfy all three constraints while still preventing normal `close=
()`,
> `hangup()`, and system `suspend()` from hanging forever in
> `TASK_UNINTERRUPTIBLE` under `port->mutex` across the three lifecycle edg=
es:

Keeping the DMA state intact and refusing PIO reuse addresses the earlier
reopen hazard. However, implementing quarantine safely requires changes
beyond retaining the buffers and rejecting startup.

For example, serial8250_do_shutdown() clears the FIFOs and reads UART_RX
after serial8250_release_dma() returns. Those operations also need to be
excluded while the retained channel may still access the UART. Close and
suspend subsequently enter power-down paths, so retaining the allocations
alone does not establish that either transition is safe.

There is also a serial-core exception to the proposed reopen contract:
startup errors permit an administrative open for CAP_SYS_ADMIN. That
allows reconfiguration paths which can release port resources. Returning
-EIO from the driver startup callback therefore does not by itself
enforce quarantine.

>
> 1. **On `close()` / `hangup()` / `uart_suspend_port()` (`serial8250_relea=
se_dma()` & `uart_free_xmit_buf()`)**:
>    - Bound the retry loop in `serial8250_terminate_dma()` (with a short
>      backoff rather than an unbounded `msleep(100)`, guarding
>      `if (dma->rxchan)` / `if (dma->txchan)`) and release whichever
>      channel(s) terminated cleanly (`rx_ret =3D=3D 0` or `tx_ret =3D=3D 0=
`).
>    - If `rx_ret !=3D 0` or `tx_ret !=3D 0`, **keep `up->dma` intact** (do=
 not set
>      `up->dma =3D NULL`, including in `8250_omap.c:omap_8250_shutdown()`)=
, keep
>      `dma->shutting_down =3D true`, and retain the failed channel and its
>      buffer (`dma->rxchan` / `dma->rx_buf` when `rx_ret !=3D 0`; `dma->tx=
chan`
>      and mapped `dma->tx_addr` when `tx_ret !=3D 0`).
>    - When `tx_ret !=3D 0`, explicitly call `uart_xmit_block(&p->port)` un=
der
>      `p->port.lock` (`state->xmit_blocked =3D true`, since `xmit_blocked`=
 is
>      otherwise only set when `uart_flush_buffer()` ran prior to `close()`=
),
>      and in `serial_core.c:uart_free_xmit_buf()`, return early under
>      `uport->lock` if `state->xmit_blocked` is set (without clearing
>      `port->xmit_buf =3D NULL`, resetting `port->xmit_fifo`, or calling
>      `kfree(xmit_buf)`).
>    - Because `up->dma` is not cleared and `struct uart_8250_dma` /
>      `struct uart_8250_port` remain allocated on the bound device during
>      `close()`, `hangup()`, and `suspend()`, any callback that was not
>      drained by `dmaengine_terminate_sync()` safely loads a valid `p->dma=
`,
>      observes `dma->shutting_down =3D=3D true` under `port->lock`, and re=
turns
>      without UAF=E2=80=94while `close()`, `hangup()`, and system `suspend=
()` return
>      cleanly without hanging in `D` state or triggering `hung_task_panic`=
.
>
> 2. **On subsequent `open()` (`serial8250_do_startup()` & `omap_8250_start=
up()`)**:
>    - At the very start of `serial8250_do_startup()` (`8250_port.c:2356`) =
and
>      `omap_8250_startup()` (`8250_omap.c:724`)=E2=80=94after acquiring ru=
ntime PM,
>      and **before** clearing `up->dma->shutting_down =3D false`, touching
>      `UART_FCR` / `UART_RX` / `UART_TX`, or setting up IRQs/timers=E2=80=
=94if
>      `up->dma && (up->dma->rxchan || up->dma->txchan)` is still non-NULL =
from
>      a prior failed termination, retry `serial8250_release_dma(up)` first=
:
>      - If `up->dma->rxchan || up->dma->txchan` is **still** non-NULL
>        (termination still failed), immediately return `-EIO` and **fail
>        `startup()`** (do *not* clear `up->dma =3D NULL` and do *not* fall=
 back
>        to PIO while the wedged DMA channel may still touch the UART FIFO)=
.
>      - If termination succeeded on retry (`rxchan =3D=3D NULL && txchan =
=3D=3D NULL`,
>        which also unblocked `state->xmit_blocked`), reset `xmit_fifo` and
>        proceed with normal startup and `serial8250_request_dma(up)`.
>
> 3. **On driver unbind (`serial8250_unregister_port()` / `serial_core_remo=
ve_one_port()`)**:
>    - Driver removal is the *only* point where `devm`-allocated
>      `struct uart_8250_dma` and the `serial8250_ports[]` slot are about t=
o be
>      freed/reused (note also that `serial_core_remove_one_port()` at
>      `serial_core.c:3336` only calls `uart_shutdown()` when
>      `tty_port_initialized(port)` is true, so if the port was already clo=
sed
>      with a quarantined channel, unbind must still drain/release it).
>    - Restricting blocking termination wait to driver unbind (when a chann=
el is
>      still active/quarantined) prevents `close()`, `hangup()`, and system
>      `suspend()` from ever hanging the kernel in `msleep(100)`.

This looks like a useful direction, but it introduces a broader lifecycle
contract across serial core, the individual drivers and power management.
In particular, suspend may need to fail until the hardware is quiescent,
rather than succeed with a quarantined channel.

The current retry loop still allows permanent termination failure to
block teardown; changing the backoff does not resolve that limitation.

Would it make sense to address quarantine separately, with that
limitation documented explicitly here? I would prefer not to fold this
larger redesign into the cancellation series before those paths have
been worked through.

>
> We verified this quarantine + `-EIO` reopen contract in
> `Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg` (`AllowReopen =3D TRUE`,
> `ReopenFallbackToPio =3D FALSE`), which passes all safety and liveness
> properties (`NoUsersAtFree`, `BoundedTerminateRetries`,
> `NoConcurrentFifoAccess`, `QuarantineImpliesXmitBlocked`, `ShutdownProgre=
ss`)
> with 0 errors:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul


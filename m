Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B0606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XqmtJoo7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnldlkwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=; b=XqmtJoo7J7dq8F
	Ha3ISn3NmsWErEplAevNUxIhUa11ADi1TtrTRgAeaedydzK1yDmL5YV8kIndNteCZGzHWk3CD0jxH
	v+wdFss1XUDJXlVfI+nzX+1jBFmAtetZzLNJj8RiV6B3J8TxjUvW3GVbycYgc9SBKH45K5g8pIAEi
	CfRZizlme/eicIxzrJyCfoOSUsi6HYypWbpMFWi9hBcL5tNUkNsnQRwc+4zbPU/xaSXyyaQRgbAnR
	nyCf7JYo3Jeu6C+412UBi5yUBFZ/J1DsrCKF88j/ckQek/W7cM2v68Zd6dpmZ3DGRbbvsilKLVk4r
	lxWaQZqxlIk/kunw9C1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIij-00000003LLD-35dl;
	Tue, 03 Nov 2026 17:54:53 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIig-00000003LKe-3oRH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:54:52 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso1601803e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728489; cv=none;
        d=google.com; s=arc-20260327;
        b=bvGDFvBmTKXofIp/0VgEHzNH3eksrs3PHMRkWgHoI76qvVPR+zzQFVEgpm45LMiga3
         A+PKs3FIf3jyemBc/61R25u/ehlTWtyzaeR5THbdWM//22TGD65daMy8fK3+LTwmf4xO
         pzSJtoSreUHKjkRz9yG9ea3I4zc7N6foYs6VzJoOC6L8OJ5ZH+Xk5zsCq4jmPSEDYicM
         wSh2c1ngXlDX1IY/I5hsLsXBulBRR1+FJcgiBReeEa/Ko+rBB6lDvDuQ1i8UDCgrOrWW
         qVmGioeDAwMUVue+KPblPmC/QIwu5hXRfjL2lpaYA79QTQohxtDdCW2ZCJzfmVZeeipm
         2jNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        fh=AsTtzW4OX2EHOU2seAqAQfxqpMO3x3YAoZsvL77ZAvs=;
        b=IF1+7SbGA/AZopXlNMM6Ens9O18C42JhPNtkaoWqrNsRCTtUzkFKBYKKTXdo+BFQNC
         SAY8IYCroerXiPPiaUh8L4sEEQPZ4Ys84xsEaDKJ5SfDpDz8t7tg1L+u3s5yHRQ3hrdu
         l4CeHPDcdzzKnn4VyITPZ75qOipGrz9XrBJ5UbOlzKOdoNtwKGS/3hhong5Ak4lQRFGJ
         jkYGxb+XWa7cDqk0gqH8uIc/Lj/i2xi01fO+gN74HwdS5isyix6cy/AxZOX3sg03GrRx
         Uum6gHCHzKz2LYWqy2uQN0pOOrNb+VJRAiK6Aa0K+qrU4PW0zv1iGAUo3szFKV4YnQ0Z
         tQ7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728489; x=1794333289; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=mnldlkwmaWnFxpjzCaACFAwJQcx19GJKN5YTgBiAE/J3tWbT0yd+6xnUswt7+wCRjf
         CZXS+xztztdJbiPV19AI08+WOzDHDSFVOJrYFYtENI0Ai8Fuw3qD+apHZJAyg3JxyGdL
         BtCUkCKbvRL2zOsPiFdjI6vBefqXhbF4WENWXiCrXwey912v7Ru0+GTEiQ6SwmVrCn1c
         c29s7OwXQaEwbAJJQ9isDoXVGQRvVlsNjUG8rB1Oxz2xcus+MzVUTFOC2qBOHO2GahnD
         Cznw7vgbTqGQxHxqmLLNNaZ0600fmQVxgCv6QI2ykY0tsOXg9FOwtwakVvWCxw24IC/E
         FiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728489; x=1794333289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=tw6Sf6ccYuP2je2RTqDrybtaRx//k9zSClNTdHoE1qrJgNnuX5VusliIPg5ey1Nr/F
         yRugiKD2V/pjoaHoT6IDRub416GuGVEAmuQW1h0rI+pK8jUf0qEf6Cm/U6wiWheXIs2o
         py12YfJFRy+JFoew+pW4csxBv0swvzlIsXS+4Y3Kd2Ud5TepO8GRKb10cV0MGHz0BfpW
         sgzt9CoSx41/tCtZu0/EFih/hl0hJk97/pwaqt5LqM1z04d5w8ahJxj2Ege0ETtOGJ9a
         GOcVL+Rp47TtBT2wsbutnLO8ci3J0KEOlS+i/GmZQT775VDuYPFhR797iyqqrPeVU4OL
         xATg==
X-Forwarded-Encrypted: i=1; AKwUvBz6+t8R8Vw/I4KMbBlzI4pNDT8xQvyC5iMuMXbtjgH5FlnooqvXNnHtkhux/CnPs24oVbNwo6g9Xh/BNuYDcvsl@lists.infradead.org
X-Gm-Message-State: APuU4Z/IH8W1s0uqlq6WZMakK2y8BYom/Fmd4gbpBxxRydJhn/FOB/B1
	8N14TFyd9BKKy5GGCm7JdoeOnGWuce58Z0cBvtyHHFnOlsUD9Uu7Se6WnAh+i2ldjbmU9EhLpjL
	VM6NAJOxMCwTh1lwjh9G9UrkDFZrHGQg=
X-Gm-Gg: AYBFou1v9Ktspklj2PWpZ2x91YBp0SgAZ26wJKz3YUg4Jp0IRvAF/dv4aqoZYj6lwkU
	4ZbatzEwRLXb9DtJl35XX5E1VXzJSBBNjjYRK4b5QmRYm05cvclZ27kHxINhNJ4tK1eqLCKU3HD
	KeDSIqigr6Iuw6e1pCfWXaSU+4la2CUiCNJwEYGfd5te57yB4y18SojrnK2i9tFWcWHfSI2GYRe
	VozZTAjTAFr9AZz2AOr951o08DN8IKJ8MeT5GQOzUzqekNchdxjxglbZ5+qS7Jqn7oAu5r+Lp1s
	5D4PJWv5i/dJXzjou+iF1ukV8JFJYNuRqcqOJhIaDKVtvuOHn9iLStfAkuSWrVHn7LG1R3Zauaa
	vZ68gLCFiAR2iibyCSi/R3YNIV9Wb4RuZxj4h7wntJDxOpgr7BEzC8RT+sdV3+50RXB5zAFJD2O
	RCzExKZ0cP78QnzEQiV0ZkQt1fHB/m2bYKrrRMDvh66jXf+jviPZzCTVgw+NdjLLd+xenuILUq6
	w3djjNk/R2MF7wq5xFNRFwuUbg13tI=
X-Received: by 2002:a05:6122:4697:b0:5ea:fae8:e69e with SMTP id
 71dfb90a1353d-5ec688311c2mr6169989e0c.11.1793728489195; Tue, 03 Nov 2026
 09:54:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <auoa8OWBxqaQuKRq@ashevche-desk.local>
In-Reply-To: <auoa8OWBxqaQuKRq@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 10:54:38 -0700
X-Gm-Features: AclHuK9I_c4PO4aR4qFDRCjbioBe9CFVnX4O6YbacRovHX2KesJOnpsJ16Nbm6g
Message-ID: <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_095451_023850_DF4A6117 
X-CRM114-Status: GOOD (  39.10  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:
> > The generic RX timeout path pauses a transfer, copies its data and
> > terminates it asynchronously. Clearing rx_running at that point lets a
> > new receive reuse the buffer and cookie while the old callback has not
> > yet run. Inspecting the new cookie cannot distinguish that callback fro=
m
> > the completion of a new transfer.
> >
> > Reserve the receive buffer until a worker has drained the canceled
> > callbacks. Keep FIFO access separate from callback retirement: after a
> > successful pause and termination, clear rx_running while rx_terminating
> > prevents another descriptor from reusing the buffer. Deliver the paused
> > data before allowing the interrupt handler to drain the FIFO through PI=
O.
> > Normal retirement only releases ownership and leaves subsequent receive
> > handling to the UART interrupt.
> >
> > Preserve the normal completion-path LSR read and gate DMA resubmission =
on
> > the receive interrupt enable, so stop_rx() prevents another transfer wh=
ile
> > the status read retains its existing side effects.
> >
> > Reject new flush work and PIO receive handling during shutdown, includi=
ng
> > late Intel MID DMA timeouts. Stop and drain retirement work before free=
ing
> > the channels and buffer. Once RX has stopped, allow the idle flush used=
 by
> > DesignWare LCR recovery during shutdown. Clear the shutdown guard befor=
e
> > startup configures the UART and tests its interrupts.
> >
> > Check pause failures before accessing the buffer. A successful pause is
> > the quiescence guarantee, even when a provider still reports IN_PROGRES=
S.
> > Also accept DMA_COMPLETE after a failed pause: completion can stop the
> > channel before its callback acquires the port lock, leaving nothing for
> > the provider to pause. Retire that completed transfer normally.
> >
> > A failed pause with an incomplete cookie is ambiguous: hardware may hav=
e
> > finished while its completion interrupt is still pending. Canceling tha=
t
> > descriptor can discard the entire completed receive buffer and switch
> > permanently to PIO. Retain the transfer and retry pause and status in t=
he
> > worker, with receive interrupts masked to prevent a timeout interrupt
> > storm. The worker copies only after a successful pause or reported
> > completion, then terminates and drains the old callback before reuse.
> > The pending-pause guard keeps callbacks from copying or resubmitting th=
e
> > transfer concurrently.
> >
> > Start pause retries at 1 ms and double the delay up to one second to li=
mit
> > CPU use during persistent failure. Sleep outside the port lock on a tim=
ed
> > waitqueue, with completion and shutdown publishing a wakeup under the
> > same lock as the worker's retry check. This also catches notifications
> > arriving just before the worker sleeps, avoiding a full backoff delay
> > after completion or during shutdown. Reset the delay for each new flush=
.
> > Report a stall lasting at least one second once per flush, rate-limited
> > across repeated stalls. A provider which never pauses or completes reta=
ins
> > RX ownership until an error or shutdown; a timeout alone cannot establi=
sh
> > that discarding the buffer is safe.
> >
> > On DMA_ERROR or termination failure, let the worker stop DMA before
> > handing the FIFO to PIO. Keep the requested enables in the existing IER
> > shadow and filter hardware writes during pause retries and recovery,
> > including termios, RS485 and overrun-backoff changes. Apply the current
> > enables after retirement so stop_rx() and shutdown remain effective.
> > Hold a runtime PM reference around worker register accesses and keep RX
> > on PIO until reopen after a confirmed error.
> >
> > Abort the DesignWare idle sequence when RX cannot be stopped. Allow
> > the empty-FIFO timeout workaround once DMA has released the FIFO, inclu=
ding
> > while callbacks retire. Exclude FIFO resets during RX DMA recovery. If =
the
> > provider still cannot terminate the channel in process context, retain
> > its buffer and leave receive interrupts masked.
>
> ...
>
> > +static inline bool serial8250_rx_dma_running(struct uart_8250_port *up=
)
> > +{
> > +     return up->dma && up->dma->rx_running;
> > +}
> > +
> > +static inline bool serial8250_rx_dma_recovering(struct uart_8250_port =
*up)
> > +{
> > +     return up->dma && (up->dma->rx_pause_pending ||
> > +                        (up->dma->rx_err && up->dma->rx_terminating));
>
> Slightly better formatting is to put some line breaks.
>
>         return up->dma &&
>                (up->dma->rx_pause_pending || (up->dma->rx_err && up->dma-=
>rx_terminating));
>
> Alternatively
>
>         if (!up->dma)
>                 return false;
>
>         return up->dma->rx_pause_pending || (up->dma->rx_err && up->dma->=
rx_terminating);
>
> > +}
>
> > +/* Keep the desired enables in up->ier while RX DMA recovery masks har=
dware. */
> > +static inline void serial8250_out_IER(struct uart_8250_port *up, u8 ie=
r)
> > +{
> > +     lockdep_assert_held_once(&up->port.lock);
> > +
> > +     if (up->dma && up->dma->shutting_down)
> > +             ier =3D 0;
> > +     else if (serial8250_rx_dma_recovering(up))
> > +             ier &=3D ~(UART_IER_RDI | UART_IER_RLSI | UART_IER_RTOIE)=
;
> > +     serial_out(up, UART_IER, ier);
> > +}
>
> ...
>
> >       struct tty_port         *tty_port =3D &p->port.state->port;
> > -     struct dma_tx_state     state;
> > -     enum dma_status         dma_status;
> > -     int                     count;
> > -
> > -     /*
> > -      * New DMA Rx can be started during the completion handler before=
 it
> > -      * could acquire port's lock and it might still be ongoing. Don't=
 to
> > -      * anything in such case.
> > -      */
> > -     dma_status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &=
state);
> > -     if (dma_status =3D=3D DMA_IN_PROGRESS)
> > -             return;
> > -
> > -     count =3D dma->rx_size - state.residue;
> > +     size_t                  count =3D dma->rx_size - state->residue;
>
> No need to put too many spaces between type and variable name.
> (Yes, the first one will be left untouched.)
>
> ...
>
> > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > +{
> > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_8250=
_dma, rx_flush_work);
> > +     struct uart_8250_port *p =3D dma->port;
> > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > +     ktime_t start =3D ktime_get();
> > +     bool recover, retry, restore_rx;
> > +     bool warned =3D false;
> > +     int ret;
> > +
> > +     guard(serial8250_rpm)(p);
> > +
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     /* Shutdown cancels this work and drains both DMA=
 channels. */
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     /* Serialize reset with completion and shutdown n=
otifications. */
> > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     if (retry) {
> > +                             ret =3D serial8250_rx_dma_try_flush(p);
> > +                             retry =3D dma->rx_pause_pending && !dma->=
rx_terminating;
> > +                     }
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=3D MS=
EC_PER_SEC) {
> > +                     dev_warn_ratelimited(p->port.dev,
> > +                                          "RX DMA pause stalled: %d; r=
etaining transfer and retrying\n",
> > +                                          ret);
>
> _ratelimited() is a slop of AI without understanding the code. It makes n=
onsense
> in combination with warned.

The two controls have different scopes. warned is local to one invocation
of the flush worker and prevents repeated warning attempts while that
flush remains stalled. A later flush starts with warned cleared again.

The rate limit applies across worker invocations and UART ports. It limits
messages from separate stalls, rather than repeated retries of the same
stall.

>
> > +                     warned =3D true;
>
> Altogether NIH _once().

dev_warn_once() uses a static flag at the call site, shared by all ports.
After the first warning, subsequent stalls would remain silent even after
recovery or reopening the port, including stalls on another UART.

The intended behavior here is at most one warning attempt per prolonged
stall, while keeping later incidents diagnosable and limiting their
aggregate logging rate.

>
> > +             }
> > +             /* Notifications also cover completion or shutdown before=
 sleeping. */
> > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->r=
x_pause_wakeup),
> > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC=
));
> > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > +     }
> > +
> > +     if (recover) {
> > +             ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (ret) {
> > +                     /* Retain ownership and keep RX masked if DMA can=
not be stopped. */
> > +                     dev_err(p->port.dev, "failed to stop RX DMA: %d\n=
", ret);
> > +                     return;
> > +             }
> > +     } else {
> > +             dmaengine_synchronize(dma->rxchan);
> > +     }
> > +
> > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +             restore_rx =3D recover || dma->rx_pause_pending;
> > +             dma->rx_pause_pending =3D false;
> > +             dma->rx_terminating =3D false;
> > +             dma->rx_running =3D 0;
> > +             if (dma->shutting_down)
> > +                     return;
> > +
> > +             if (!restore_rx)
> > +                     return;
> > +
> > +             /* Apply the current enables, including any intervening s=
top_rx(). */
> > +             serial8250_out_IER(p, p->ier);
> > +     }
> > +     if (recover)
> > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> >  }
>
> ...
>
> > -void serial8250_rx_dma_flush(struct uart_8250_port *p)
> > +int serial8250_rx_dma_flush(struct uart_8250_port *p)
> >  {
> >       struct uart_8250_dma *dma =3D p->dma;
> > +     int ret;
> >
> > -     if (!dma || !dma->rxchan || !dma->rx_running)
> > -             return;
> > +     lockdep_assert_held_once(&p->port.lock);
> >
> > -     dmaengine_pause(dma->rxchan);
> > -     __dma_rx_complete(p);
> > -     dmaengine_terminate_async(dma->rxchan);
> > +     if (!dma || !dma->rx_running)
>
> You introduced a helper serial8250_rx_dma_running(). Use it.
>
> > +             return 0;
> > +     /* A late interrupt must not hand a still-active receiver to PIO.=
 */
> > +     if (dma->shutting_down)
> > +             return -ESHUTDOWN;
> > +     if (dma->rx_terminating)
> > +             return -EIO;
> > +     if (dma->rx_pause_pending)
> > +             return -EAGAIN;
> > +
> > +     ret =3D serial8250_rx_dma_try_flush(p);
> > +     schedule_work(&dma->rx_flush_work);
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(serial8250_rx_dma_flush);
>
> ...
>
> >       /* Manually stop the Rx DMA transfer when acting as flow controll=
er */
> > -     if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_ru=
nning && rx_timeout) {
> > +     if (quirks & DW_UART_QUIRK_IS_DMA_FC && rx_timeout &&
> > +         serial8250_rx_dma_running(up) && !up->dma->rx_terminating &&
> > +         !up->dma->rx_pause_pending) {
>
> Re-wrap it logically (also be consistent with parentheses
> when & versus && is used).
>
>         if ((quirks & DW_UART_QUIRK_IS_DMA_FC) && rx_timeout &&
>             serial8250_rx_dma_running(up) &&
>             !up->dma->rx_terminating && !up->dma->rx_pause_pending) {
>
> >       }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


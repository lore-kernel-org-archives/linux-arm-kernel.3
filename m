Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43OsVylR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtPji4Jq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=; b=43OsVylRsY95ez
	1WzFkYSM30AvrGmwkeRyftUTFGMm5cmak5evZZZ7QOA2fiAvxCSaeZPXMyZ+lrX+fb3AfCmvnLsU3
	PIj0Tw+zHKUI88OR5nPojjGIdg3hwEEAc3bfvpjg6IVU11VStgSLBs5WD3uqgmzGNLjQXO9TWgU2d
	Jz8Jdb9V/nfu/I/UOLG3DSqjKDSlEYzedYYqmzCto7YZ1lSo3SJ0cUOfpOrQ4mBzNpA+Bb/fzaT2p
	EmKM6nlbs4wBfvH3rWyqTYNpS+M2Lm02MuJa9moScn4HvX3bYZgKIwZifeEZUYJL1EW5ivMiWgejF
	j7CUTVZ1f8Q3IT40VWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMaXo-0000000AZtV-1shG;
	Fri, 30 Oct 2026 00:32:32 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMaXl-0000000AZt8-2CNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 00:32:31 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso45681241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 17:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320347; cv=none;
        d=google.com; s=arc-20260327;
        b=BCGMIIzrn94NsAnXULFpzI2N9nR4f4qZ295hKPR/GpNgdqrVtguecklypw1QRPXyiS
         sBRqFQo7lPfxiE6EAQv4nlyCjRXy+/vedQhyGPVb//2jptTFe2lUp916gWuhS3y8ii6r
         HbOS0qe3r6ZWHA6OzgtcYT0TEBEgUBpzBMM/T61XdxwedY1n5f9iglL0JddBczfEBUzp
         yOoyzWfu18VotviO6tEvlrUi2QBslflZfKcpRFaeQdgRx/4LPOZ1dBrhUglpSshYiwsw
         Lr+CYUyEexLGdihS+8MpLlWeEWx1Z5GWItGZe4ou2+GgEtvy3MSdVry80PoQ0ak9k5p7
         fTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        fh=Pw53/rJM9KxQqsZ7LGKQGz0WOjqmJL/2GNWO6k3Lja8=;
        b=WXdmTZH+sru7oB46tmF204R/y2s0CTsa81o2hNuk52t0qHCxfooMT31NPBz4SmMsPn
         UdhAKvTuqvUCiAKGX1wxunweE4FRkQDWL8H9wZMv8E+6OCDieXaxWAa0Pk9P+VRUXBup
         7oGvgO1CpxjLmxiY9MY7e7knBOuA4hWKDDZ0YP+ti7hkEPJdfJMVJxmc9TkoPoup4GNd
         YxLr+ZfLK7hlNhSnXllXNmNIXLZIHsZYwSbSp7UMAjrivQL1L6c7dx9hM+dKI1PlNmf6
         pAaIE1SaicXm7O0gF/09vQCBK/zaexhwmn3PH6zpynytDiBESe2zdyJGkMZ+mmg25A5/
         YRog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320347; x=1793925147; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=vtPji4JqWbmQ/1cvGl0OXfLQfgDkmC5dYAihduZMqG6yderyBUT6qCAGzVHe9Q924Y
         Hm9kgNOquXzZcsqM1SpxKsI5Td7JgC0Iv31j//0kuQ0JPO0YCN6m9CvRaDRXDPFfOaJV
         hCFwLtnAmsyyGsw8HbtNowlVN2ejTQWABdRTddiibutAE/qUUarqGE02TDJVUs1iC2vo
         BWPungfZB6fi7pcTGehwGmj9F4JEqjPsJD33hpoZhgfeUXRFxePc+4mAeEPlU+0jtWmM
         B3Gn3iThkD8cs5YVmolcWgrAFONT2UKEPDAAI4JMmTrktNPxrlt4fdy5Z56mI+5Aj1SZ
         X17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320347; x=1793925147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=mjAonc0OKnxaJaQaVp368udiKCY2+JcdZnHMrfXzgaeIkjsmzICH36/dOTou+lLpm/
         yHVQc2yMFkjQ5QVw93VFEYR0RJL4QE4s+eqPN+N2yVi0O1nOI9Uz4qmZGsupBvCIIqIe
         RjPrqxPXXiem2ur/xzPvH1+Mbrw+qxmliQzAZ5Loju7iXCJJokqZjY3U7r7R5nE/7QCQ
         WC16XPNleoM+6VTXOlSojnaPDw3+5JHwcioYg0t73UOYBTmaLmHpOd5rV6/etgPeWjz8
         IxBpoxI0J0QPIc+VNEOuHeFUa63J8uMh1AuP8E0fmMrmnZZ0J64AAj+D2HFf+QzPP8Nu
         4/nA==
X-Forwarded-Encrypted: i=1; AKwUvBz8yoAYLh6g6IqhsTnNwbWI1un47uJBHpLoiLAJEdKJANgToAQVLAJv+/OYFZA5TeETIz6N8N5IDiFA5JTYOak0@lists.infradead.org
X-Gm-Message-State: AFq9FYLmHt09+9Vr5EpUX3ZiHQ28sNq1p0/FC+RAna90GBw2soP0Engx
	UIW6wL6dPBnYhIAaSiPJuL/DNuvFgm6JE1y99d21GSE1lfZalMEuNuJbImCZm0vnMl5XYcHxWoD
	oliXKXEUwa83ppIe/3RP44/4HMnEkMuY=
X-Gm-Gg: AYBFou1uM0SV0kTFWxQJyDwhCk1pwFpjWaJJ2XlWc9rWwhrxZs35S7WU96i3xN1scIb
	VW5DXdR6HufNpPVS39JjFi8LpR0SgbLn68mxlZ1lfgYUIXXcryMNSC5Kct4E3KrfU21ehnJnEkH
	i6qk6OPRZ4xZSxySOsjUebL4xGw44lbCCkwdtdE0N3sma9+8hnmko3C1XbdQpxhxiGjrm5hupwi
	NW9tpGqcUra1vTlsHwOKzfqCtY9joBR9MrYARLRqZ43cRzcq1jvpfptDcR79gzlffhhxTGGtJfv
	ikzNPewVShdqNRotCjSgBJU+IladhpaFsVZRALUNUm6zLH4cmAag0IOA0wEbBCpwml8F/mz6/Fn
	e0b5e1EwFT2DUDOU4MCQrF9lOoYLYMALycNEufC+rp2PNAD7xyADJATga5sNmdoCXQhBSG75s1/
	xmN2SYEWMK54KRMtbti87APKZeHwrDVNPLvyXshlBJ7iE1JzPF/Zv7KUpSYiNhXWBKQtktXGFn5
	QkwJvYr71X0ygnFdLCp6VltZJCVKOs=
X-Received: by 2002:a05:6102:290c:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7d0723d710bmr492388137.0.1793320347401; Thu, 29 Oct 2026
 17:32:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <20261029222734.3086943-1-rrangel@chromium.org>
In-Reply-To: <20261029222734.3086943-1-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 18:32:16 -0600
X-Gm-Features: AclHuK-iYJ6lzjlFUVN3seH1Gc5KBaAl343rbNN_d-8c384kErq2Nw5ubYUVG3Q
Message-ID: <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20261029_173229_686227_9BF6BA25 
X-CRM114-Status: GOOD (  26.77  )
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

On Thu, Oct 29, 2026 at 4:27=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> Hi James,
>
> Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirm=
ing
> that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
> (__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking al=
l
> look resolved in v8.
>
> On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending work=
er
> retry loop:
>
> > +     ret =3D dmaengine_pause(dma->rxchan);
> > +     status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &stat=
e);
> > +     if (status =3D=3D DMA_ERROR) {
> > +             ret =3D -EIO;
> > +             goto recover;
> > +     }
> > +     if (ret && status !=3D DMA_COMPLETE) {
> > +             dma->rx_pause_pending =3D true;
> > +             serial8250_out_IER(p, p->ier);
> > +             return ret;
> > +     }
> ...
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     if (dma->rx_pause_pending && !dma->rx_terminating=
)
> > +                             serial8250_rx_dma_try_flush(p);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             usleep_range(1000, 2000);
> > +     }
>
> This cleanly resolves the race where a full 4 KB transfer completed in
> hardware just before dmaengine_pause() ran while its DMA completion hardi=
rq
> was still pending (once serial8250_rx_dma_flush_work() drops port->lock a=
nd
> sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE)=
.
>
> However, what happens if dmaengine_pause() fails on a *partial* RX transf=
er
> (0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the re=
mote
> peer stopped sending and is waiting for a reply?

With a persistent pause failure and an incomplete transfer, the
worker keeps retrying. RX remains masked and the runtime PM reference
is held until the condition resolves or shutdown takes over. There
is no receive-progress guarantee if the peer remains idle and pause
continues to fail.

> (In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress)=
 on
> Receive at lines 67-70, which forces the remote peer to always keep
> transmitting until count =3D=3D Capacity and CompleteInHw fires.)

That fairness assumption cannot establish progress for an idle peer.
The broader local RX lifecycle model includes permanent partial-
transfer pause failure, but checks ownership safety and close
progress, not eventual reception. Passing those checks does not
establish recovery from a permanently failing pause operation.

>
> When the peer is idle after sending a partial burst (< 4096 bytes):
> 1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
>    (neither DMA_COMPLETE nor DMA_ERROR).
> 2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
>    -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
>    serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
>    usleep_range(1000, 2000):
>    - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wak=
es a
>      system_percpu_wq worker 500-1000 times per second until the port is =
closed.
>    - RX interrupts remain masked in hardware (`rx_pause_pending =3D=3D tr=
ue`), the
>      partial bytes are never flushed, and the port never falls back to PI=
O.
>    - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_=
flush()
>      while rx_pause_pending is true, causing dw8250_set_divisor() and
>      dw8250_check_lcr() to silently abort baud-rate and LCR updates.
>
> Since the only reason to retry pause/status is to let an already-pending =
DMA
> completion hardirq run after port->lock (and local IRQs) are released, co=
uld
> we bound the retry loop in serial8250_rx_dma_flush_work() to a small numb=
er of
> iterations (e.g. 5 retries)?

A failed pause with an incomplete cookie does not distinguish a
persistent hardware fault from completion that has not yet been
published. A fixed retry limit does not resolve that ambiguity.

Terminating after the limit may discard received data, including a
completed buffer whose completion is still unpublished. Successful
termination would make subsequent buffer reuse safe, but would not
recover those bytes. This would therefore be a potentially lossy
error-recovery policy rather than a lossless timeout flush.

> If rx_pause_pending is still unresolved after the
> retry budget expires, calling serial8250_rx_dma_recover(p) under port->lo=
ck
> will set `dma->rx_err =3D true` and `dma->rx_terminating =3D true`, letti=
ng the
> worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), an=
d
> switch cleanly to PIO.

That requires termination to succeed and callbacks to be drained.
If termination fails, the channel may still access the FIFO, so PIO
must remain excluded.

The recovery requirements depend on why the provider cannot pause.

>
> We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
> `Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul


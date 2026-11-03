Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2762606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tsSQfqro;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AgzvzzuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=; b=tsSQfqrohODcqD
	Jt8QoayABW8aovXQbZvk2P3lVFNIde96XcJlJNXS+GNYrQwzUl1eevqZ8u1Il9yEgNYIXEh94bgqM
	86pIdv0TMuREBTDcQK1rUIbjboDbK8j/qyEasMFxJRFDavyaxBj4n0ZLgb63SPb9OL+P6A2xRagqW
	RTQ/ujAMDZsutp8K80wiN70l5ogSOLzu/Le/HMRcC15QNvpl3DPYeluiFu9oPCvOMr4lJyj75SvYJ
	KzJSIksGe/CoJ7zHKqtFSqE1E4zwf3QNO7bUJzOiS+rqOkj3kOyDvv1jBf5ltgYqVMUMGAjLVKjC8
	k4HE4qDlUr/P5klDFRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ48-00000003O8I-3Hf8;
	Tue, 03 Nov 2026 18:17:00 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ46-00000003O7k-3dzN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:17:00 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so3453640e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729817; cv=none;
        d=google.com; s=arc-20260327;
        b=ZyuHs/N+9xr/Sh+KPjbzYZkM5KBe+bUBpG6A4bLDHzMb7PajpSUF2w5gmF1y41yG7T
         QgZFZC81pkNMyRE4YY/tT6l9FqPlWYpHDySS4OIw2OYWNChlZjNKtmYHYMARmIHKpo4m
         TUlwjepfFvNEmEpqVz65t/EqBkHac1tmCNcOSKF+/Jax0WB9mIuMZMo82rIx9USKf1M3
         u3bi+TkJ+PwtK8Uv50hwUO8VJwWrkIJkRMp8Co/1vKAhaJBasG7yhvqCJpnbCsp3ksZf
         TxQtc9fgQ/0iB/T+eSapIQ9McoLwCy4jyMk3qYGAjM6sdlhdBqlDu+i7su1F9CPUdK6Z
         VggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        fh=rfGo+WtpsJfNOwm/7n6v9pnyZz5v49TEEPYK/77vvq8=;
        b=Al4ema76WF4Ky3EAah60x9XIwO3QAvjJyowxRW53nPZqZlmLDZsEbfyoyxkE8vAZXn
         VMqp0uNQDU9SRgb5haQIEo+e5zx6FeddBUkLGA/0ZvGSS/nLl6ZJBFUbeB69wdgRlaun
         xIQ/AOoX2hi2P+OCBWpXL3Tocesosqqyfyy1xq8B6EmRzTVrqAa7Ycr3Jvv3QzyK6xJx
         0KyuQs3chAQ6hB6obUQm+47o+qMrOd8toESi7tyFMlDE2NfdK6W2C2wFsQ5lUHHioxoy
         t2Flf73DRbq/YE2a4JmuyXVdxMiH5Xpo+rL28Kl2Bjh1mnPxe1HTqPLURt9C7AYjeyf1
         gSbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729817; x=1794334617; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        b=AgzvzzuMsVzubuhYn2rsl7Qtl94vID87XOmqvdb3YMkL0uDoW6tQ0SCa6HSpYhILKR
         bbOs5d8PGWecn2l3IQmXA7fX4cqwxBSW8w5P2+Nn5d4xwx007/KjKoR4uhsouXCUWk18
         VkNb56alDCvv2AH9l2tH2dcgLcx+4zK/fj4DP05jjGBTONdkLZIInQ+f2bdO7Q2C7SuT
         5VO1a+drOowVIq9mvvCEw9sSgPR0RGIFVvqqWEmPYRYi9RLTzdb6ehgJxWmW3TFeOo+i
         uG7RwXUIX2TANzINVKDwXiqbRy+Zsr0NYsXFxB3K8INZPVmgYjvTHvb2BNTiFDlL5dDN
         +4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729817; x=1794334617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        b=dwFPQ9OLI7mjBzdbGJ9nfmM0+ShkN+OowXOLxUKztcq3GWfkCGUcKmrh7r6/RzFKgN
         L7dN/5msULcMiH2LOIjHLxZDxD5IZtQOw9jEVlKN+5Z2M55ovxzX0fpVbzI5ACBYnp6r
         LQlYvWngzs9jHkkIIOR7opJXKn9K1EcjHVyK5fPh+Bd2e7/yTN9buZ4ZCCpgbJUcuMs8
         2kw1IwrAMJdS/B9EssumwgtEbs2CgEqOng+zsIkU6/roTmD8VZfKUcxdr/TYxKx4d2UR
         Z4elCDHtLNEiljuS2wIP6ZijBWfvilVQ2atJ5TUIWvC6nTeHCTRnlqjVccE0ZrNyXh7S
         9lyw==
X-Forwarded-Encrypted: i=1; AKwUvBxPPsc62AT/ucORQS9Pn83P9IfH6i4WLIZMxsgMNJcq/sFenQZ3oJbjUnDAF5vQ5l1k6bI2uZ5ubZ116aSCTyzm@lists.infradead.org
X-Gm-Message-State: APuU4Z+IAeAwo/X5X6WLkqU5Ibrc/dQcMmu/YjkhPds1BjdGbCRioeeX
	IFS9rDHlSBruBYA6Xa9Bz0cPIagszdkhn5sKxrildW7WK8CyT+xyk5LoDx+2RQogmHAkGKmsxae
	CyHz30og9Q51LP6lqdKVUD865pbikqCI=
X-Gm-Gg: AYBFou1v8Y1o/tir1qIIRCqKmA06nwP08m0sRA0yMQfVQ9bA5oyzy/aGF2GdeA+Vucc
	VbmO+kJilhbwSb44B5eiKU1bflR2lBY6uJ+Jj1xCJ7SRlfdPf/bilsqtGgxVBB60wFalvWRdU/D
	NGH2lxTClRxfI6czb+X2APJsrP9qqC2yY1OZ+6ij1nLS/LT8AgOrhiFDvrzGwViwfzfDpn4HaNB
	AkHEL6wjPGkEyiQfk3w22dGVZKcSvg+K5pIps0TyyOx3cwLbCoyyZwaJvjtNxDglew6Ws4Ovh+A
	mAu8bT7M5AUtLVGifjJANI8uD+Ve7H41auq8g4rC0iDBp3j4d5nKqz3q1zFga55mCgTLtMbS0yK
	CBfcaSLisFCGKtHLagSiCKYm+l35NliKyHgnXooRg76fzwWRU0OlT3qpvrg+/iMqqdNhRNHT/pe
	eavPtmKMXo/c/cPZQphzZkUpNai2cLuCjPvCLKsUUZV0lTtQm7a253Ntw6Ios/n2id01mN7Iiqr
	CsVr6F3nsrccmWGjGJDF96e6ZGrULdfX9Y7uYBgZN5CvXOsG1A=
X-Received: by 2002:a05:6122:180a:b0:5ec:5f1b:f725 with SMTP id
 71dfb90a1353d-5ec689c4d7fmr6770861e0c.23.1793729817534; Tue, 03 Nov 2026
 10:16:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
 <auoa8OWBxqaQuKRq@ashevche-desk.local> <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
 <auoit0AkmVeCvXqk@ashevche-desk.local>
In-Reply-To: <auoit0AkmVeCvXqk@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 11:16:46 -0700
X-Gm-Features: AclHuK8HW-CEs65d3UAbPyCnbzk3fKPiCpsZ9iT1lPWFV_I6MxwKEkb2VsX1bZo
Message-ID: <CADvTj4rwm5BH8veX9i5_4trvzQFRPbDrAby7sXuEth6H6zJH2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261103_101658_930418_24211331 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Nov 3, 2026 at 11:06=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 03, 2026 at 10:54:38AM -0700, James Hilliard wrote:
> > On Tue, Nov 3, 2026 at 10:34=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:
>
> ...
>
> > > > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > > > +{
> > > > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_=
8250_dma, rx_flush_work);
> > > > +     struct uart_8250_port *p =3D dma->port;
> > > > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > > > +     ktime_t start =3D ktime_get();
> > > > +     bool recover, retry, restore_rx;
> > > > +     bool warned =3D false;
> > > > +     int ret;
> > > > +
> > > > +     guard(serial8250_rpm)(p);
> > > > +
> > > > +     for (;;) {
> > > > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > +                     /* Shutdown cancels this work and drains both=
 DMA channels. */
> > > > +                     if (dma->shutting_down)
> > > > +                             return;
> > > > +                     /* Serialize reset with completion and shutdo=
wn notifications. */
> > > > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > > > +                     retry =3D dma->rx_pause_pending && !dma->rx_t=
erminating;
> > > > +                     if (retry) {
> > > > +                             ret =3D serial8250_rx_dma_try_flush(p=
);
> > > > +                             retry =3D dma->rx_pause_pending && !d=
ma->rx_terminating;
> > > > +                     }
> > > > +                     recover =3D dma->rx_err;
> > > > +             }
> > > > +             if (!retry)
> > > > +                     break;
> > > > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=
=3D MSEC_PER_SEC) {
> > > > +                     dev_warn_ratelimited(p->port.dev,
> > > > +                                          "RX DMA pause stalled: %=
d; retaining transfer and retrying\n",
> > > > +                                          ret);
> > >
> > > _ratelimited() is a slop of AI without understanding the code. It mak=
es nonsense
> > > in combination with warned.
> >
> > The two controls have different scopes. warned is local to one invocati=
on
> > of the flush worker and prevents repeated warning attempts while that
> > flush remains stalled. A later flush starts with warned cleared again.
> >
> > The rate limit applies across worker invocations and UART ports. It lim=
its
> > messages from separate stalls, rather than repeated retries of the same
> > stall.
>
> How? The whole _ratelimited() is nonsense here.

dev_warn_ratelimited() uses a static ratelimit_state at the call site,
shared by all ports. The intent was to limit warning bursts across ports
and separate flushes, while warned only covers one flush.

>
> > > > +                     warned =3D true;
> > >
> > > Altogether NIH _once().
> >
> > dev_warn_once() uses a static flag at the call site, shared by all port=
s.
> > After the first warning, subsequent stalls would remain silent even aft=
er
> > recovery or reopening the port, including stalls on another UART.
> >
> > The intended behavior here is at most one warning attempt per prolonged
> > stall, while keeping later incidents diagnosable and limiting their
> > aggregate logging rate.
>
> Yes, so what the point to use _ratelimited()?

It was intended to limit warning bursts across multiple ports and
separate stalls, while warned prevented repeated messages for one
stalled flush.

I'll use dev_warn() with the per-flush warned flag and one-second
threshold instead. That keeps one warning per prolonged stall and lets
each port report its own failure independently.

>
> > > > +             }
> > > > +             /* Notifications also cover completion or shutdown be=
fore sleeping. */
> > > > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dm=
a->rx_pause_wakeup),
> > > > +                                  ns_to_ktime(delay_us * NSEC_PER_=
USEC));
> > > > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > > > +     }
> > > > +
> > > > +     if (recover) {
> > > > +             ret =3D dmaengine_terminate_sync(dma->rxchan);
> > > > +             if (ret) {
> > > > +                     /* Retain ownership and keep RX masked if DMA=
 cannot be stopped. */
> > > > +                     dev_err(p->port.dev, "failed to stop RX DMA: =
%d\n", ret);
> > > > +                     return;
> > > > +             }
> > > > +     } else {
> > > > +             dmaengine_synchronize(dma->rxchan);
> > > > +     }
> > > > +
> > > > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > +             restore_rx =3D recover || dma->rx_pause_pending;
> > > > +             dma->rx_pause_pending =3D false;
> > > > +             dma->rx_terminating =3D false;
> > > > +             dma->rx_running =3D 0;
> > > > +             if (dma->shutting_down)
> > > > +                     return;
> > > > +
> > > > +             if (!restore_rx)
> > > > +                     return;
> > > > +
> > > > +             /* Apply the current enables, including any interveni=
ng stop_rx(). */
> > > > +             serial8250_out_IER(p, p->ier);
> > > > +     }
> > > > +     if (recover)
> > > > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> > > >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


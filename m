Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29804606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HqI3qR1g;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxJx7AUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=; b=HqI3qR1gPTPqQr
	aHa5xX0dFg9wsTYrJfEudt+C48Q95TX1elgsI1xM7kFb7YRUtkr5LfzjZI1hf3ToO5CdtV2fliTmJ
	iYhBuA7GBPCzBy8l7EH6tAEIsCsYq98pIX2IshGxihumCQECgZuquY6+GU31GymogIXDIBLRaBmSV
	GxU92yW1VgS5FbiVI2urzDJmVMu0Pau6qunJzfT8RfeqaUAtM1iLSpBcGm1SUDNMoGkfBopJNWsSZ
	6iWg1O9OVjF2ZqVrwyWyJewL5S5wPsqgg9FMG2n28SWplzhVyc1g1yZA8qvzXbCJDR0+Kf/ZgK7xo
	yqF8iU/1VsA9+FomrZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMThe-00000009wJk-38kq;
	Thu, 29 Oct 2026 17:14:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMThb-00000009wJ7-0uxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:14:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4366072a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294049; cv=none;
        d=google.com; s=arc-20260327;
        b=Az1zGYqWQrP9YvlZ0CRKnm05or9X/xRSJLiLxUomgFw5RWO5ZV9qD6GUV3c/4pseje
         MjR0/GBQPPi+iBYKOpkiMhrQx4nMQEGjoOjs7O4Hpa81ZS5JhT9n9VWsYl8q3ciuTQn2
         9PUUWH54hbuguU6JtNZY2l1RkS0MSg3Q2pQ52QQMp7yiezWQTWJ5RYY3ebSwYaUHbyDg
         DH2TADI2WWrMg8nMjkmiR4GYTtN6vfwbpK/SJ+Prx31PyE0BIQ/OoHveF5jWIgSBNRYn
         harpuQKFLZMQu8t6SH/SUqJmHWy2fIaJXcDGJXT5271Eu5kY89serea3aWVNwv6Qoe1V
         ej/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        fh=8Xrf0xu58uKXrlFgRuA00qe51c5Mitpa3SYN6yy26Gg=;
        b=E1s8JzB0MQ14S8gjc3J375n6o6wxyUWy+JfaHSP1UNaHMUKedgS+TGKp4Qjp7rSB0z
         6+bVEn/xHZzKB0pKurLQo6GdXqSr2+buCcffwf6LsE36R/cjc+k7Gb1MCbHMbE7ncIAl
         weRRoeMVTyOLbIwET0N/nN1M9zB59PFe8N0rXjBbS7vlqz3ipifmtaTHUkcpO8Rp0bvo
         P/FT43bbLAe99yMeSuqFRZzPxXzdO8d7DGXiZUwQRXbnsr4tPpBzplZt472OEZlc8FeW
         w7K0bkc4NrMV5ngf/F/KxD7Ec7ypnNJIzcFbeuunCX8NwZ2/C0gsiD6WvdNzqPwmRwVI
         5Bvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294049; x=1793898849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=UxJx7AUQ89d6Mv/pJI2MJm87oftUtM8z1zRYmJzcVntvAoj52lg4O67/WjC5R9i+gv
         WoRlbo+Y7b5faE95a3Sx/LvlfPl6SgS+eOD7ZNHdt8hZTei5sB9FuUDa2KB3prgHoLRQ
         iaz/h6c9qp30Wy+AJH2xvbA0l+VtmkdFPHKQpdAgV2aVfyTJ0sg2bcEId35h/9giyHKl
         qUAxGN+fjt9VwiWf4c3lyEHVdw9bF23emFELDNC0pWYIVlmsbJaXEX4sDuS/LoKQPsx+
         S5dvVDUpjl3t7TBFcT/6QFtuvCxI9kk6iCSJoUZ0VeUD1JJ69QpXaUnOanqcu5p+8cOe
         Hq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294049; x=1793898849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=g/yPBi8AXf0neTORuKz1gaMMVJDo1OHi4upUZpjH0jdM4UpPfUMtQYFZfBfB/c+xVO
         YjdJSDoLOW15lssLaoM5B1xdmKD+ZwRnQET4CFXP8dk4E4hwgAOD++viGQPjl1gwaoDv
         ulUUJwlyTRpaMEAzuqCxNLBC599mtPL86qkopap5OOE/mbqeHN3qDMgDzM9XE9hAAYpX
         huQRgGmivtEmEDTRMw9iYNUds9qDqAZ5LtINKmUgljYXyz0MuCjpuSITzjWJziFGfTGQ
         Zdl6h66bOvCYsFy82ZzH6BGKB6ojbOvaypHaKB2VMdNzEZWufyTVMvqEhzCVM9CF3OqI
         IW6A==
X-Forwarded-Encrypted: i=1; AKwUvByEka0e5xW/fCCEtywzVm3QlRuGHeDuuLnIER9KVvrEVGaiba0dPuugs1/VNID3CeZOOHfFG7CPAqG8k8wKTXeY@lists.infradead.org
X-Gm-Message-State: AFq9FYKO+ZV5sb4gSoyBHd4w5oEPcmN+LjvvAz+DzHOuXtJ7FJ3hI66M
	MQAiMu09D8vwW0v7WYbFoD4qH0nSV9MAY3d2BApIH23lr3xfZJCddx8tOn54Gtfyr2/pbqEDC2W
	bKLGIHi3FdYIxPjGkLYubhp8XxchhKSw=
X-Gm-Gg: AYBFou09gz69gh4YU7vAafp1QVAXzKIOdbClAwtUKYUXEAaErEgJDW1Z/cQ2CtBoJMk
	Z/Bg+Vdw1g86uc0i4Gpp3w8+lxQUZCJsJh6ZURuqJSR1v4L7KIVzdN03Ww+SR/erlfU1LwVSPEY
	T3IkteY89VQ4yqToTwbk5Xi5ZpthGDyn3ybZ3vjte8w0NCnYJvMlZCpQPT+tZRovArSIaO8OfjM
	U1bLjDV2HuwQrXAFha3Yw4R2i73lLBYwK9t75hfeuugwB7L3ZRmuUz7rPPqQNhN3nTEL52hvO3a
	X6N5eldzXpwoC0TvgP8ZuOj3U692V7GpjEDqoKQvQD0K7AX0kBgxPz5WVfu6OWWUl0gB9ztDjbq
	K3zzJPTskvfYueZoDq9jF2PY7a4rjqWPkesLuRXEuBBVxHWCNDVsguo5NhwOiEYyeBqfQZUxmTY
	BBQ/yc3G1DCBBOlxopSJeRRz1mwH7vRyczhAAyuh2Ox2h0PlLbiicw5ikh9ReIKZm2KkOG+CuZI
	RAwxek0HRRho5GA9ahO99uGMhNyKA==
X-Received: by 2002:a05:6402:1cc4:b0:6aa:9830:aa21 with SMTP id
 4fb4d7f45d1cf-6b49cb8eabemr4436038a12.39.1793294048534; Thu, 29 Oct 2026
 10:14:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com> <auNVk_Y8iiAXyFa3@ashevche-desk.local>
In-Reply-To: <auNVk_Y8iiAXyFa3@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:13:56 -0600
X-Gm-Features: AclHuK8vSM1CWTDsGeWZ16QtCofwiUc2xcHxHUC_tVZ5DI3qrKZF21jWZD2zp04
Message-ID: <CADvTj4pwVF7u-6z3RUiHWGyG3MZGFU2WkytMRh0G16pdFwaotQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] serial: serialize asynchronous write wakeups with
 the port lock
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
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_101411_296152_B1847CFF 
X-CRM114-Status: GOOD (  25.99  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:18=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:36:58AM -0600, James Hilliard wrote:
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
> >
> > Take the port lock around these notifications or their transmit helper.
> > Keep sleeping SPI and regmap accesses outside the locked region, and ke=
ep
> > the FSL LPUART completion lock held through its wakeup. Acquire the por=
t
> > lock after releasing private channel locks to preserve the ordering use=
d
> > by UART callbacks. In the MUX timer, publish available FIFO space under
> > the port lock and keep the hardware FIFO-drain wait outside it.
> >
> > Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> > path, since their interrupt handlers now acquire the same port lock.
> > Preserve the caller's interrupt state when releasing those locks.
> >
> > On SB1250, lock modem-state updates after reading and filtering the cha=
nge
> > status, and wake modem-status waiters after unlocking. Take the TX lock
> > inside its service routine so RX-only interrupts need no acquisition.
> > Keep that lock across x_char handling, FIFO consumption and the decisio=
n
> > to mask TX interrupts: a writer must not enqueue data and enable TX bet=
ween
> > the empty-FIFO check and the interrupt-mask write. Each TX invocation s=
ends
> > at most one character.
> >
> > Serialize CLPS711x TX servicing and its interrupt-enable state with the
> > port lock. Disable TX interrupts without waiting in stop_tx(), since a
> > threaded handler may need that same lock. Have an already queued handle=
r
> > leave stopped output untouched, and drain it outside the lock during
> > shutdown before the transmit FIFO can be released.
> >
> > SCCNXP handles interrupts under a controller lock which its UART callba=
cks
> > acquire with the port lock already held. Collect the ports needing wake=
ups
> > in an unsigned long bitmap while servicing the controller, then release
> > that lock before visiting the set bits, taking each port lock and
> > rechecking the wakeup threshold. Removal drains the IRQ or timer before
> > unregistering the ports.
> >
> > This serializes write notifications with port-locked serial-core state
> > changes, allowing readiness and transmit-storage reservations to gate t=
he
> > notification without a check-versus-shutdown race.
> >
> > Cover DZ TX servicing and JSM Classic modem notifications as well. On
> > DECstation ZS, acquire the port lock before the SCC lock and notify wri=
ters
> > after releasing the SCC lock. Defer normal TX restart after console out=
put
> > to a worker, since console output can already run under the port lock.
> > Check transmitter readiness before consuming another character and drai=
n
> > the restart worker during shutdown and removal. Release Lantiq's hardwa=
re
> > lock through the transmit helper's completion hook before notifying the
> > line discipline.
>
> ...
>
> > static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)
>
> >       struct uart_port *port =3D dev_id;
> >       u8 ch;
> >
> > +     guard(uart_port_lock_irqsave)(port);
>
> Why _irqsave?

For serial21285_tx_chars(), a plain uart_port_lock guard is sufficient.
It is only registered as an IRQ handler; saving and restoring the IRQ
state adds no protection on the hard-IRQ path. The necessary change
here is acquiring the port lock.

>
> >       uart_port_tx_limited(port, ch, 256,
> >               !(*CSR_UARTFLG & 0x20),
> >               *CSR_UARTDR =3D ch,
>
> ...
>
> Same Q everywhere (it might be legit in some cases,
> it might be too strong in others).

The other sites have different calling contexts. Workers and tasklets
can share the lock with a hard IRQ, and some helpers have callers with
different incoming IRQ states. Those need different treatment from
hard-IRQ-only handlers.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


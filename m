Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k6j+kxnm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZjBl+by
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=; b=k6j+kxnmQuKTR9
	3JuwhadUDiSes/lHITuFzXdGHYCEwnYX2oHhC/mAf+ebw9nVotuqo0/ReCJslaG6Ye/qUSn5J1pEF
	Wl2yb/qaih4bo1iafPEFwMMn5Luem9k9VhTRUsnM9KDtsgEXrOdIVk7iKy1QTQoU9EhXqFdQ2Ppr7
	mIN/L0bojjbeADO2zu4QFMYNwbRkudTHvS8DjO1e1XJ+jFEXGcRilh0s4Dmg8qRlO1+f/bIkAKFOC
	ZB39tCzZJfpHKg7/nOaBGprWwx+vv9ud5BJMwRFb6XxqtDcYbU5xRuBUvvHR89hUK3f9Qx7iTKTFZ
	DfDo8fCPmTF6wKLap4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTlI-00000009wx9-1DcN;
	Thu, 29 Oct 2026 17:18:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTlF-00000009wwC-34g6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:17:59 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3236817a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294275; cv=none;
        d=google.com; s=arc-20260327;
        b=QsbR+FeDGbT88g0K6J5C0MxhUv7rt+KdkEvDTZ0HpJht1kJKZmrWrUda+zZb3PBlIr
         Cu/j86QiTpcnlFHU/70WJdsUQzCPlaTTu9J0NeZRxwzvt9lVYvWSxttanA7AsVa2oL5s
         8pkeH8APei87XRAlDhX8R4VkW4SSdjhTnXfnlx3F62R+WRfN8aHsIwUVNCaBSlsUbbTN
         alBRbWDx8E8ESDaRyV6ang2D1THDtKBeUvOb36mo/Fm0B4jPEKuOmgsZ2tF1+naY+oK4
         iTA17OsBLHnEXArQUs/UlU6LB1O0aVsFrM4yutDrzKKXP2T6MAlE1JfYXL4XFakPxeYm
         5YXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        fh=r5PWOqzrA4T5Dr10YNLi7aZdw0hZ7oaI81l5hjafWAE=;
        b=Psh6MUVNTSyEKjTT/vazXxqIs+cGv4PvfKA1jvtKcX1PCVJX+QHf6OQsB27bxz9Eu9
         Fy5/Xor47GCzYIREuEDhmDiZbw9PSYKKjGcGNjCHdByxG6Z8FbywCdwd9tWsD+lJZUI0
         cKy7DfMzcXQAfLx/U6BQ1j9jc1dImDXGBcnDDMVFfDZtubNvpU1cXIFt4T1Y0334/DwY
         vsYNdJE6YGgqBP5ucht227OLxaTdw3SkU1vFi3O74eSiguOUUaDQTwHlWc4TaeJWLbXt
         EjP+ixXmo0pLNz6tATAC+DiTX+2M++4Py/rJFTmshHRYAL3A6G1zka26lwX224wxVF3T
         8Npw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294275; x=1793899075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=bZjBl+byznZEGN5wkjhjZP3mL4FEbkwTAI49FSi/6BBn/xw4ZIn4SUSpB3l3DkW42A
         u6VktzbF2wMSZWcle1ZekLJv4XWjMSsWEdcAHgFv96QPBVoUbZjuZ7r8L0yHDEtJR2jF
         QrLqPkisRD8FebLa+7yTU5gzxD1pWpBBzEkI3yuo+vDq+5stQTEFjafqZuHaSkiO8fqy
         Z/tznJhjONtEtZ9hGRjP1RpKjtONaz/Rhtme35fE7ocki1Qq+PkiJbEKgshV7gLQuPC4
         4aKrptVZXW1iU/pqlFsGGCQYcsRbeyS3o0Q2axpGYlnHJ9CH9KozbCGGVWuuIc2FEhKh
         SJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294275; x=1793899075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=epsp9tDteW5Cv7GOXe/E1LwyqRO8mMMAA+h51x7Bz1yQjMy7HyKit4iRhlrCkHrewH
         J0QOaq8oRCOCIh66xA1wo8xKtVHJx55Y3fYYFm/hIYYOH8au2X91qgbwdkL0HThgWHSY
         EcK/TsW0b2bAuNDPCv7j2Ol/00l7ZDa4RMFPCRMsnnj2A4C+dZ9N7/ZLKBt0UxSy9Fgr
         Duyfwf+9Gw3fnhBNlXezKOUKjWHiPGPkpqfCHcDSJnwG10x1hvx7Xcwv6QBM+Aejhegd
         LlGsc6CXWDaMttCje3FBuWIvKrwccqhDRRTm+hXICZmxlnsNYt01xiIgVt6ylLXhkuEp
         r5IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgL04nEMep85HP4hJ5CF44aZOwj4RwQLkhplzg3V7VfGyNzSHYHYqM6shlyZWzZlmWg/D1o1fhKZg0vqFXmR5E@lists.infradead.org
X-Gm-Message-State: AFq9FYIzG75cmFHpJoTaR2DUQcvoxnht3nNZscbipBAc3uv208OMiMx6
	IdUOSxYBKDPord/7n4nG2dZWxBr3C1+rtU1jArlKZ3qdC12r9lRNF3Dsk1w087I5WhgI2Dj+qOo
	Ty9sAd9b3ERsjG1eVpKAZQLpNY0vPZxk=
X-Gm-Gg: AYBFou1dxV4QCBrIXRHXNbE32dhV65iWLGCuPLI4hWqtj0CKss4UElaBAql5qwlXVQw
	XRPlZl10JOrZW26G6g2Ji6kmhozJyNU2TwLM7/7cDnlaIRiyl3FbPRb5oXUrSlXqZ2iFvn7Uc5o
	Wur1IjSLflod+1JiK+DuX/cp8gSPL+8ATGPVb+RlUPdxqrUUX/JPi1VsYAlxFvGKjT4pjwT9kpl
	54e1MSN7rY7ajrVW0hy4xUsK4kNesWIRrfDRSckQTqetm8UbzbEqlUqb7Aq98C3SvAKVjeAhEzN
	ALX32D6eYyAsRZnYdokcWKIZf+AaL5FB0gUQnZtIi4DLEvjq76zccwvlrYN15B7k8d/60CBwsAm
	0VnK/+8tWArtNLWjbhuoEn3OGaNGc3jxy+y5Gp7viV6xj0o9jWQbXOVChQ6cYt6uTvYyljIzRGB
	KfFVmTp/k+C9nLXQc6IlxZcsQpLubHzvT4ua4Nmws+ULdh1AQUGq46Fe8lsITfFCLQmxlwrZVOs
	vrjXOyxe3d8GJGnFIQnQhddeaUjjQ==
X-Received: by 2002:a05:6402:158f:b0:6b1:ba86:5f48 with SMTP id
 4fb4d7f45d1cf-6b49cb8e221mr4598429a12.36.1793294275082; Thu, 29 Oct 2026
 10:17:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <auNWl_thBnE8JqBE@ashevche-desk.local>
In-Reply-To: <auNWl_thBnE8JqBE@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:17:42 -0600
X-Gm-Features: AclHuK9p5HgzHs6EyjP74wtBvDwmav_JmQ_V3uuDUu-UaTGXVkbTzXu0Rboi3LQ
Message-ID: <CADvTj4qR0j7f-79wTUb9LmwWdGKYz32vB3Bgfr9AnEfXMnMBdw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
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
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_101757_813490_51B921B5 
X-CRM114-Status: GOOD (  28.80  )
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

On Thu, Oct 29, 2026 at 8:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:01AM -0600, James Hilliard wrote:
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
> > transfer concurrently. Retries sleep outside the port lock and stop whe=
n
> > shutdown takes over. A provider which never pauses or completes retains
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
> >
> > For OMAP, publish the shutdown gate under the port lock before the fina=
l
> > RX flush and interrupt masking. Take the RX DMA lock inside the port lo=
ck
> > in the completion callback, and serialize the runtime-suspend flush wit=
h
> > the same order. Drain the UART IRQ before releasing DMA state so an
> > in-flight handler cannot retain up->dma across its release.
>
> Can this patch be split to smaller logically isolated (to some extent) pi=
eces?

The OMAP shutdown and locking changes look like they can be split
out.

The generic RX changes are more tightly coupled: the retirement
state, worker, IER filtering and FIFO-access guards must agree about
whether DMA still owns the receive path. Splitting those mechanically
could leave intermediate commits allowing PIO or another descriptor
to access a buffer that has not been retired.

>
> ...
>
> > +++ b/drivers/tty/serial/8250/8250_dma.c
>
> >  #include <linux/tty_flip.h>
> >  #include <linux/serial_reg.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/delay.h>
>
> When adding a new header to an unsorted block, try to squeeze it the way =
that
> you get the longest ordered chain (yes, interleaved with some unsorted
> elements, but still).
>
> >  #include "8250.h"
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ocADFIm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R/HY+e3e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=; b=2ocADFIme9M7JE
	BgBT7ShUYFWNiOLWrbAsJB5aKe3Nk3gL51VATBSj8y6M94ibkOuqGiXpUULGZbJ0u8GZXd1i0r+Er
	rqbz3fWq8AbbogSpOT9crP0d/eJca/IO9dEq6uWM7oxbC/Sc6QdQhWLv0T1IHa0aay5ws5v5E7/M9
	cxNYeU/3kDgbWJFe+1VMORrni0Dn5hgpH9LbhBmgEUwGjElt5lE9OAljP0QX8Kco67zk3HZ/bbAlK
	7STt1sdnvRJjxPpxIQfG2llBomta4/8kU+yZrqbz8CTFhAOLxIVD+7xSzoC/1FuPxtFGifobwrJpU
	fcmLmpDsae8g0XlqSQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3FX-00000001IkL-2gn5;
	Sun, 25 Oct 2026 18:47:19 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3FV-00000001Ijt-10Uj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 18:47:18 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so2961985e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 11:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792954036; cv=none;
        d=google.com; s=arc-20260327;
        b=jEnDl3kxR+xXxG4L8P9ATYglrs63jrCs4pj+H+dHpBR+lhsEUXlEMr4vvF9GiGtON4
         CARRo8TYHkoQaLv6KXt6QLXnw96Om7LzXFECnwDGLpn8mko3bT5WCnY3QW8bVooonsTB
         gDhBiGktaBGbxQmidAE7DLtRmWMF2KWyhUX4ZUY6X8lN4ftXlWTzL6/U9E51KYLMY/dn
         Ysh4aI+293PoAscF/QWsN6v8oWnVmLlsblIRlDeShbbAZZiIfKnQy59RzumCPR1VyOe5
         dqv1DrQhQeqjsbg7GGm8KZdgd9BHMsV/BB2x/XM5+0BWozVLBdRQsoD96bcLrn9ikSxd
         ArjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        fh=+/UWBB47Y/BvN2WHIADMRXDJA1UGXID5bzQjWpLC2kY=;
        b=eHMTUNTPR9L55j8uM9xyQQtAZgm0DEpGOHOU7c9gNtQE/juyRxhqKcTsr5LWViUivu
         rvCKVcANSJ79bJsCigS+mjsAWWUyhlpGcPphzTLjDgfVtOl4zYmGWaqQ7oMA/C6t2IG7
         b7eC9HW+U0zlGSSD0blsw35F+SgPyq7lk/bX3/jfB5beoqo3qAt8d2qYVriU7oqzns0q
         ebHq8wfVxfisKbAHzqkAiKDeG+ZqCg/uDOPo1qKa3schlTf6lk8l1npt5jX4kCYrySi5
         iLTjDONmeJ0DGpyacDp7G1QQC59do4b+2yu6NW3lzMd7jqMCRC+0G8rtafcnI8yB6hj9
         chrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954036; x=1793558836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=R/HY+e3evPz6kJnf8mC/KLDT763c1PnCMa+d8Lnbsa1tEh2wsqEL/1THqfiOzOqsI/
         K/bPQO4UxjTi5YeMPhPG4XqQpzCV1QSsOOXwPobmcPVpnwa5Qindgbb9n8Jtc5x0f4KW
         O6Xf/amZSHF3GAhhWJoV4mFIEYNwFfh/Q8q5KZTWu/E1UxRqNeVcdWXL5tNhRrLAfBD4
         LzQTjpuvFBR0kSUelG7zkrgVpjIZqmjiQoV8hC6Wk/eFb6+NRaqGD38Nsf9CfOFR04Wu
         PAeYjKxBaOw9lyaqc05v2q9ryZP1sEKHZi5Nii/vshg5PSV077aSLEXHMcYPawUkO/pX
         b95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954036; x=1793558836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=jgudfUaabxhBHSXJUuSHxC+bWISBnarS2up2DRpaEyWyK4xvZZ3rw1ida0Dg4sIFfk
         13bgdArp4yiMHk4UmyBBTK8w4ip+cGgMpLX29mRId3A7H23IAhiysDRetTlclPWiGcsV
         MJv7DSf4W2GLMzrcxRvkbNcukGTuzok2imc9ao7xXGKfrKQ4fCd9+SAQv/7l20K7ugfQ
         zQqZEpS3F/TRP6/aBu1+vSQbfO+suGwhlcCLFjxPYeCNOZVVXlNqfAC8LwrIVjjAgBrQ
         NJ2YotDHpNX8+o7gpAcNrFDf4B6VrDODSB3lGc2dP+c2HNQfCsR5eYIADtqfiw6aRCIr
         JRhg==
X-Forwarded-Encrypted: i=1; AKwUvBzDG5q/Wf2JPWUOAn8v6UqyntqvJO2/PkPkw9k219HfrZbUN1r3ErQ048aV3uHhmvhJeYVyTEYifuhtYtrB9WTX@lists.infradead.org
X-Gm-Message-State: AFq9FYIjQ8UaxxFXsebKj/2jZSvVcSwOerMu7oVJnBq7A/0t2938vCRZ
	cheWiCTlZdlfw+JJ1UtruMg57722ks0MlQZSWNh0mCXLxUrbDHWoq3t6VKnQ6cvqZkCrDl50tre
	9B91hsjbE2GfPPBbMKtMLT5EpfFGbIRk=
X-Gm-Gg: AYBFou32off2v6wLpjZrtScqPrGB17ypP2505aDWlBarfMkU1ZIoYLP5OXJzpDSUc+d
	58HJHIihemNJ4I2Uxh81RIcUPzU7dVseg21W/ZkQKxGPMf9+D0BNuTacvrLvxjH5iDEr68UBCP0
	FTFgBOJJdiGeUrU0gvA8F8bA7MrVAwd/d7BxLfIKvpix0JXQ9M2Jmko8tBkgO6jQZ3xvn3jahu9
	INm3w6XHi2iPpHsnQTdEtd0fQHa4wBroNBE/cu+iweyZTWKOs27y+HxlU/Wj0cl3pxDuSSFxPxm
	kLvtxpEBgvQZw3A+3vOCaxup4VdED7QXYZX7BbnCSK+hQkaVh69WCz3gTUvt8kmOG4JRloC9rId
	ByzSwd6SHDhixdb/IMxPLqXpuH70dk+jAGLXT+6bpWVz2aBmBuKvsILofY3rN8uqpZ1ppmG4HMC
	MGrBLAs9IknKKGETqphNqx15nFnRTH1dXcz3iBabfeRKNABZgKM5wGMUGiiEigYYhg9+4SHJncx
	qLealH2sX3QwPniGfz0gtWr5ujdjQ==
X-Received: by 2002:a05:6102:b04:b0:7b5:8fd9:27e9 with SMTP id
 ada2fe7eead31-7ce5d005cd0mr1043722137.2.1792954035832; Sun, 25 Oct 2026
 11:47:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com> <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 12:47:05 -0600
X-Gm-Features: AclHuK8RfnuoMKUL7_ChiQcwJjtxWWikUNjoVOQNx_xye2F4G1UoFeQQYjFC0tc
Message-ID: <CADvTj4ryYd91LYMCktJ6a8=ygm0BG6dd4ZyK6XByaVcWvFTvkw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_114717_295627_1EF6F04F 
X-CRM114-Status: GOOD (  21.34  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 11:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Sat, 24 Oct 2026, James Hilliard wrote:
>
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
>
>  Fair enough, and thank you for the cleanup and spotting the issue in the
> first place, however...
>
> > diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1=
250-duart.c
> > index b4e1b90e5960..b15f76acd06b 100644
> > --- a/drivers/tty/serial/sb1250-duart.c
> > +++ b/drivers/tty/serial/sb1250-duart.c
> > @@ -454,10 +454,12 @@ static irqreturn_t sbd_interrupt(int irq, void *d=
ev_id)
> >
> >               if (intstat & M_DUART_ISR_RX)
> >                       sbd_receive_chars(sport);
> > -             if (intstat & M_DUART_ISR_IN)
> > -                     sbd_status_handle(sport);
> > -             if (intstat & M_DUART_ISR_TX)
> > -                     sbd_transmit_chars(sport);
> > +             scoped_guard(uart_port_lock_irqsave, uport) {
> > +                     if (intstat & M_DUART_ISR_IN)
> > +                             sbd_status_handle(sport);
> > +                     if (intstat & M_DUART_ISR_TX)
> > +                             sbd_transmit_chars(sport);
> > +             }
>
> ... why do you think the whole functions need to be called with the lock
> held while they may or may not call the handlers in question even?

For sbd_transmit_chars(), locking only uart_write_wakeup() would leave the
empty-FIFO decision and TX interrupt masking racing with start_tx(). A
writer could queue data and enable TX after the empty check, then the
interrupt handler disables TX interrupts and leaves that output stalled.

The same lock protects x_char handling and FIFO consumption against
concurrent updates and flushing. These races predate this series, but
wakeup-only locking would leave them unresolved. I'd keep the complete TX
operation locked; each invocation sends at most one character without a
FIFO-drain wait.

> I
> think we should avoid excessive locking where possible to avoid holding
> execution elsewhere unnecessarily, shouldn't we?

For sbd_status_handle(), I'd read and filter the change status first, take
the lock around the CTS/DSR updates, and release it before waking
modem-status waiters.

I'd also move the TX lock into sbd_transmit_chars(), so RX-only interrupts
don't acquire it. That means two acquisitions when both status and TX need
servicing, in exchange for narrower critical sections.

>
>   Maciej
>


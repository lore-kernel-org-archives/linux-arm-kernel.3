Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PnIU0PLr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzf12mUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=; b=PnIU0PLrUXN7tu
	CUhh2I9u86/TcpmsOdOCBJWhrwdjsBvsHXWBdQ4UCE3NbyE3OBlDW9NwoIjcwuczXyYH1iV9Nft0m
	BRzMIa+VyNo/cbNVTKXYeh6Hvs3eyj7Fh7X9e7xSiEw8Eqf9QvWrhCjGmWsdGHn9ZxBPwQwMBDG2J
	auvG5jq+5U88clF6U+LOrUfKKu3l7WkcfFM5d91fL6HDmGy0zdh7p9AdeHpvIlkBJEPUCM/lqN2HO
	63rlvwUQqFxl7Xv08ahmVHWCdK9pU0S8UdXVXSkZE7WPgt8jBADhTZeocDKK056ed1HxVkGtArVt9
	ncPAtvYY8CM7Ulz2kIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTnX-00000009xEG-01Oc;
	Thu, 29 Oct 2026 17:20:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTnT-00000009xDF-20fU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:20:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso2973854a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294413; cv=none;
        d=google.com; s=arc-20260327;
        b=sT3bkRkMvKWJ9dZbtCwNvNkV7cYIGdtLD+8c6zZ3XKtJ7mx1yiuCVqjsNfUaEMH4wh
         Y74pPQVNid0Kz2dBA+VAa32kfg8Trit78tVGHfypfSsGMoEa3JPhLHe6EmniM+RPgL4Q
         6CUsoYeYtD3xg889NNPRQ1SsY8HXgva4/myeSVB9HZLuNQxo+UDtybMEsAsf6hHFj3wa
         +QpUHgPFxCltrwOlVTnC9JToY7ttFcMO1vIHkd21N9PsX91FU2peuOfgm5QRHZaVzZE0
         4/j23r+x6zIrNidFOSH25W1U5DiUAaChVL6a9HPMjxtbJuoETjyiLft2blMAwJKnIXdu
         QXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        fh=3oGEHYXwDjiPzxMzNfi5PdS39ZQFXA3BZ2HU7xiH2ok=;
        b=IgidJv0aBLPXdMMMPCXpSnteF0s7Gz9UWYUQxNuuZI0EjEZIC85utGqBtflrhGNFf+
         GQ3hTSd/b6e0haCbYgX4bzgm3Gj1Hoy9xFov7PMijUAHwZD5uglJh3ANq70PLPplnQts
         3W8ynxv24zhySUl4TuewGlcMpy4J1opNYZiS4kJs/UMspx+wZ71PrYRzXxfcDzA0WJ7/
         41n2oMs8Z2ED5GvPorZhk+Ni8U++a8EiGf2vjJwbCEfCuFdyJ7t9tDdc0lnW9w9rAisn
         fFegzmtLCTCgnOLQjpynThSOHlvVqrE7qEwIwRG7DmN9uyuCD5nVKa24atXZ7GPYx3wQ
         o5hQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294413; x=1793899213; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=gzf12mUcL41ewXzBbblYLaS/VSRMomfiEuT+tE+3Hd+hNZZUKmk7tEFDn99QjtN4Zt
         Jz7KnA0FXOlaCgioAkZO2kJ8LtysocT2NWpj8PXtV4wjhywQW91PT6/m+SQO+DaTSYBJ
         /SRV5KNXFLWxVVtWNUbA64RsNhXh9H/L6WeHLsrRFtSb2AvBbzx7UUhWypmPbOhn8lhw
         rM5qvF6bIASjAbtYAa/y3//8Q4zLs1fK1ayd8Gp2eXRELwyrBr458v95Ameoj0lFbC9L
         +ZAn9pkcTNlQBD8dLty8SQRlLuTjaGuH2VSF3c3ti7Zm2s76SYZ//pG6u6DWg/XvBAMx
         GVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294413; x=1793899213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=ON9S+uPtM0S7Lpfh70x8hKVZ7B3+faQ5kDyB6bo09dkRla5RPflYYQe6+LC/f9cL3u
         Xw7VxtE7xBq0LCpVY95V3snVlEfy+18nAjeGLGHRqXThdNMqLmxymT5bIRD/5koLuNtd
         plCeRPu1bXdN70VxSsiI0L3gTy1PWsPKOWl12lGUsIPZbOBMQxylrrLqcozzpoK/9u/X
         /4OeAi+mho+tPVoEI4ZC3o2chKqvel/GcGGqHwuVSDVBGvDxlGz0otinPcpMzRIulZBO
         9apQXcQVo4JwKn406Zwlg6Ri6aomWn2eArUrm+iHF0F93te2pr0KaKziSTBC2OC1VjzA
         yFyw==
X-Forwarded-Encrypted: i=1; AKwUvBwNHaX1k2Lg95TX6L94mZkCCnUjuccHCCukU7VUwEVlAdEjC4mTqcEVAvOk8X2SFkbsTwYAWCUsaMtKZrz288Tj@lists.infradead.org
X-Gm-Message-State: AFq9FYKRo8NhWZ+AeC9DxDSRmtEzIv28mEt3LWYNecdpbGdCGBeM+Jul
	ueLmonl/YPMazCJqdJKq0JLPIUT9Z0cziLSPgy95TN+v1Bm5snrkOww3tmGX6cAjhsKTpcHcHyw
	Ry9KFlsTIB4+vsrB6iWV6CU6dKQQ3qlE=
X-Gm-Gg: AYBFou0lo57ScVx/MDRT9eV8QfyKsj1/A6JB+8ySY8ri5UyqnV1pAkU0eHfmok7WUB/
	YsE4nIOMqUdqz/RJgyii1sHNu4r6/lopg5kRLI3g771jvd3HOsGGl33dtVHDS9nTG6yzURk7629
	kV2A+knAZy4YE8WHoFWWzfNhT+16vZLkwzCuCMsJZU0A4OU+qjHCjf3yfgDAmRKlsEJtTrQUXIS
	8KMvQyw1mdp28nF74HRiqsioXVaDPztVA+iCG2xpdZy5Kvnj1t8t/d1qB/KIO5Rf6DuHXUqe0yo
	06x36rnoiFo8fk6OiLGUFb9G1xAk6s6HAPW5/QRt+WHwah6hQvxJRdtTeS92fPrhwFCClhUrggl
	85B208UQy+UAyS+rPEWXenxrr0l3b0RhHIWSbPsQC7QNA0TtDmN8lVyNkSIwJGV5+uFIw+CgxIx
	KUfRE0e7LsfxUHx+RkvpYhVw2DfGgC5ixf6QcXful8H/m627NxClDuNEik0XRr69WDP6hxZgVVd
	Pdcjeh04cdk9ZdsO3gOniGIf6yJ0g==
X-Received: by 2002:aa7:c1d1:0:b0:6b4:201f:17db with SMTP id
 4fb4d7f45d1cf-6b49cbdfd84mr3081067a12.18.1793294412721; Thu, 29 Oct 2026
 10:20:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
In-Reply-To: <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:19:59 -0600
X-Gm-Features: AclHuK-0pW6JI4DxQzs96I_p0R94o9xpuy7K0elsSNWPWKpDy78P7tTWYrgR_Gg
Message-ID: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
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
X-CRM114-CacheID: sfid-20261029_102016_236396_E43745E1 
X-CRM114-Status: GOOD (  21.57  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
> > serial8250_release_dma() ignores the return from dmaengine_terminate_sy=
nc()
> > before freeing the coherent RX buffer, unmapping the TX FIFO and releas=
ing
> > the channels. If the provider fails to stop a channel, the DMAengine
> > wrapper returns the error without synchronizing its callbacks. Hardware
> > or a detached callback can then access the released storage and state.
> >
> > Checking the error and returning early would not preserve their lifetim=
e:
> > serial core frees the TX FIFO after the driver's shutdown callback retu=
rns,
> > and port removal can then release the callback context as well.
> >
> > Require successful synchronous termination of both channels before
> > releasing any DMA resources. Retry failed channels after a sleep outsid=
e
> > the port lock, leaving channels that have already stopped and drained
> > alone. Keep the shutdown gate and storage reservation in place througho=
ut
> > the retries.
> >
> > A permanently failed DMA engine blocks close or removal. This deliberat=
ely
> > retains the buffers, mappings, channels and callback context until the
> > provider can establish that they are no longer in use.
>
> ...
>
> > +     while (rx_ret || tx_ret) {
> > +             dev_err_ratelimited(p->port.dev,
> > +                                 "DMA termination failed: RX %d, TX %d=
; retrying\n",
> > +                                 rx_ret, tx_ret);
>
> > +             msleep(100);
>
> Huh?!
>
> > +             if (rx_ret)
> > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (tx_ret)
> > +                     tx_ret =3D dmaengine_terminate_sync(dma->txchan);
> > +     }
>
> This is unacceptable. Sleeping is okay, but value should really match the
> baudspeed and other parameters of the transfer.

This sleep is backoff after dmaengine_terminate_sync() has returned
an error, rather than an estimate of UART transmission time. Each
retry asks the provider to stop the channel again; elapsed time is
never treated as evidence that the resources are safe to free.

The particular 100 ms interval has no hardware-derived justification.
However, I don't yet see a sound way to derive the retry cadence from
baud rate either. RX can be waiting for input, TX can be held by flow
control, and callback retirement is a separate requirement from
moving bytes through the UART.

Do you have a particular provider failure mode in mind where retrying
termination should follow the serial transfer timing? I'd like to
base the interval on the condition that can make termination succeed,
rather than substitute a wire-time estimate for an arbitrary delay.

Regardless of the retry interval, shutdown cannot release the buffers
until the provider establishes that DMA and its callbacks have stopped.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


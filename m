Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxdUDwTd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDpeqhUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=; b=FxdUDwTdeUXOrs
	kS5U4K5HX/I4GaIzqIbZAjM2HkVJBIHoDbKyhpTNxHzDKMP7w/9luAKQKaFOb5OzBORLeqRnrCV/H
	BV6y61tRDTaT5iCNavl7YW66+l2FhsFUt31A+rjB1lAaLOhaOcb5gm1HzA8DyjHqa6/H/pGkVioZw
	z7yz11oHemBgZbe40i5gL/E3qzgTg9lNguR4UHrEQFHuOkiWd9Jrz1B4jQ2TwTaSwQi+VbGcMwHUO
	qJqIHi++zTLKTRz4XwJnzPGPTvz8CNsf1TlgllLv1jomhizPKtlDJWHe6VmIXPSiWEWZUd9hYHPam
	9TW8xq68E+XbrjnsiFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVU4-0000000ADLK-1FqY;
	Thu, 29 Oct 2026 19:08:20 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVU1-0000000ADKe-0fZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 19:08:18 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5eafa528803so6320e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 12:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300895; cv=none;
        d=google.com; s=arc-20260327;
        b=f25jcwfj0fY3VrBFrNFo69oIv4bZnyTHiWLQyXsWrYZJ9aK1gMedGvRUSpvdF9g3lR
         e5FSeCgPq9Fill6/6+rDvMSk6xpJr6TslSeZeo1kiEovIxgbqzXzW+N6IVaOy3OiiMUK
         m/HTpkIi4qGe1ZwlZwsxHeNPyXAWoQgIMgkixj3wFzfqsIYuzxFlGMggsCQ99AdCnyQ6
         hxl9lo3/TI4YPwPxY+mkZ09naYFQGSeZJde6p7+PnKKTcMCBT7/nWcdNUwBe7ZsEBxSh
         Tr92LBJ5QqPX2u1OAGNwzMlM4yU2VGNwVnQ9+BnZ6eLU1NqnOosaYTO5e4SHcWlti51O
         6bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        fh=r2H9jYo62ZEknl2LiZb+9RJjnBdZLOZQhrjtYh8A2JE=;
        b=EuV4ZIN+bMHiROwZthW/Brgnu5lobkvF5/TMGaGsV0FpvO5Rx6GbpteW/iPOw7Yo+f
         HoWiokRTvHsKkNxckClO2tSCUGedl9mlBHWg+06fPDY2JTKe5SJdhlLLazAJi1cx11dO
         mEdKdsXjJv2+8CmhmIq3GAWYNUx49hFD+3jWJaPY5OO1uYyQQK6CFD1rs76sgcme88bg
         dq/rQ2xnvHa2AEPmoMpShPm0JEfby5cu2MFSwSrJ5TraJ3SVdUZkqXTvRrf2QOXtREh1
         aBqpN+Vl11T3TcifG7dqgdVfYA/UtG+hK9qRULIXU/3hFOdCkMm//esKJwlRktVQBBxv
         IGeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300895; x=1793905695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=XDpeqhUxLXJX1Ot4zyhj5JKIf8nbrFgVGngl+XmcRBOmw59blw6bkWBjwNfOnZbhKV
         op+z7EHCDXd4XNj7+/0/fQVUz3lmWLc1vGhjBjOeGx00A/xJsvpq+Y+BnsPOY6c381wT
         eH+BHh/iMjryuxEWwjLCTY/8mkDo+eJF3kgBB2F1ZLo9c5uUW/1ONClAcxIDh1UX8ae5
         q54C3C4oM+pUiWsb55v8QBMG+n6P5QJ0apIH9pjDOwGYhXiWZQWB922KfI3PydyyUay5
         nB2oXaEyMq70vi1tDWB5zNuPchL4F4X0quOPHe3rwbFskFWdtt1EJGKvCldLgs1rvgQZ
         M99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300895; x=1793905695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=N3+q3ReAbfoKnWR9/VoB9A/mzNUud5BJoeNRHtRvmWhgqUoegywDNqWrI5b3cOW8Dz
         xjpvNkMk90ZV9kDR4cthlW5YNGfJ0y8rdNjBaNa/FBDGgQP22SQakNohGfl2E/Yus9Hr
         9G0YHOe60rNqGGPRF05/Id6EpN0DFRVh/+dJpw/Xdl2obCm0E/llQyxNysk/a/ex0+ZY
         LIWiIuavZNNOrQIB/I8GpH1fkjtRFzm++aSnf7IDZHyFoYcE9N4bwnCiKwKytqKfBXU/
         L/zW6zKMAoxFzNxjqLi74qmQC6mCEYob7cT3OwF836goVEhuut2VBx8zcUDHpa8kDagG
         bEEA==
X-Forwarded-Encrypted: i=1; AKwUvBxFSDyFB+2ApnuBuHoCKs+i8bHfKfJ+pZ9+psePcRn+xZtPmyiGNJETZwYKA5ke+gEQdJd3EQSU1Y873v3rKvF5@lists.infradead.org
X-Gm-Message-State: AFq9FYJTazlzordvENLHj0+R4zYF4CqOhnNlgduKJiUpveoYdzfk6+g9
	lEPTUFw5PAuQfFcvh9LzwECx8w3nHnDhnFA0HZuJKEAZomCnUnl7y0WcKQAo3FtWoaFqs35FERg
	LiT4yrnN3LSx2DAkQ7Jcs5QeHjUW9N8g7oSEx
X-Gm-Gg: AYBFou0tIm6w9OIS2M+QFGfzK2vKxhV2nH10l6s5VcmkLhlGayh2HJ9el8XyAlO+mNZ
	EqYYa1X11NOKihN70b888v8SiRNe2El7CKyEPaItQPTEOhawZzXfhFhdRE0UZEp3mmqBWmlH1ef
	8blTc6j4FJb7GXQnu5JVj4Zyd2BtIEJFxUYoidBVWPLPIOMrS0y2X/7HTvAy3wXBbl0a8tCck7I
	kDhws4zP1bGPHQwtOeDf0eL7ljU4JZSeXrwBFv779YP6hyhK+s2FU2xLRWks+WfLnlzuoU3/WlZ
	i/oDmnq8j0VlD/MQ1AW7UQ+vs0PQs7cwkS0mpDeWbDKn8hw/LXU9z91Gyt38Ry9EejvgirTNYvQ
	j+UngxLxtK3fWCZqnGFwn5FjJvTR/mvne4k8fGJ9fhgp2TPSBizMaBBMrTY61XGKXOFemLYfIdd
	pn9myaau2lionrf94XkzcTxByzdthIRnUQybXIgyoQZsyyhz29R/FmDQ7lvgznV89gv+nTs5RKE
	/jAJvAxegjnGz1cCTVT3xXa0qYvxQ==
X-Received: by 2002:a05:6122:46a8:b0:5ce:ab22:1749 with SMTP id
 71dfb90a1353d-5ec6851cd7amr118633e0c.1.1793300895346; Thu, 29 Oct 2026
 12:08:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <auHW9nkDqZUXeHNZ@ashevche-desk.local>
In-Reply-To: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 13:08:03 -0600
X-Gm-Features: AclHuK-Rn80HNyPsHmS5HIf099B7rRnzpvWxOBqe3P7d4FosCUXTUKkW9AmBT7o
Message-ID: <CADvTj4o6N6sXk1YvYgMF6d5jyAGZCtyaZUe81ZP10qfhOPwd-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_120817_213320_1C4FB7C7 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed, Oct 28, 2026 at 5:05=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> >
> > Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platf=
orm
> > data. Use common Allwinner setup helpers to configure the transmit load
> > and receive trigger table from that depth.
> >
> > Derive the receive thresholds from the documented 1-byte, quarter-full,
> > half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 12=
8
> > and 254 bytes; the normal 16550A half-full FCR setting selects 128 byte=
s.
> >
> > Build the threshold table during setup and use the shared 8250 conversi=
on
> > helper to select the nearest lower threshold for sysfs writes.
> >
> > Serialize trigger changes with termios and hold a runtime PM reference
> > while programming FCR, preserving the FIFO contents. Propagate runtime
> > resume errors before changing either the FCR shadow or the hardware.
> >
> > Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> > DesignWare termios path selects hardware CTS handling, so the capabilit=
y
> > must be present for the corresponding hardware control to be enabled.
> >
> > Select the fixed configuration through the platform setup callback.
> > H616 has debug-divisor and RS485 control registers at the offsets used =
to
> > detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> > those probes and retain the BUSY-safe integer divisor hook and software
> > RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
>
> ...
>
> > +     unsigned int fifo_size;
>
> This is should come from DT (based on the property or compatible),

On some Allwinner SoC's fifo size can come from the FIFO Clock
Control register[0].

>
> ...
>
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
>
> Why do you need it here? Can it be provided via driver_data?
>
> ...
>
> > +/* The trigger is the masked, unshifted FCR receive trigger field. */
> > +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, uns=
igned int trigger)
> > +{
> > +     switch (trigger) {
> > +     case UART_FCR_TRIGGER_1:
> > +             return 1;
> > +     case UART_FCR_TRIGGER_4:
> > +             return p->fifosize / 4;
> > +     case UART_FCR_TRIGGER_8:
> > +             return p->fifosize / 2;
> > +     default:
> > +             return p->fifosize - 2;
> > +     }
> > +}
>
> You don't need this, just provide a set of numbers directly.

In v5 I added FCC based fifo-size discovery for A523[0] which does
need to compute these values dynamically.

[0] https://lore.kernel.org/all/20261029-submit-h616-uart-fifo-v1-v5-7-53b4=
33aebbf8@gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


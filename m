Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BAB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SWFJEJfC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIOQsZPt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IQ/MHZMX5vmwMAGRIrdmx/PMBK9c4wP9Hplcv7IA9ME=; b=SWFJEJfCPUeW+k
	ZTx05jOeSvQRRrN1U5VsaUKliceQkO4ZXJetOkOY5x3S0T5LtrwVo18Ps/i/B0eo++Yn3AcaTZiN6
	d+bfP++g2mK1DXuBu4l2XP6k5vR950pSZVWunpsOR1EXwen9g4o06hjnDHDNVQpAVZS8n+UBxsrT2
	tdjcrE536J5vNdPym1wtPxsaQ1mpK5UXhlBhPG4KRRfhh4ETNb+YIInRk10IrU63s+6dhWEI+AqxQ
	4O/7QfmtICLdZsDYqPNDpE7E60AhusUfvngmix93KjSdNMvcDJNTjKgOo/Im0X41IhvjEPAWnxrFA
	k/RAFGs7svPTzTZ9OKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq0B-0000000CBcl-1uhX;
	Fri, 30 Oct 2026 17:02:51 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq07-0000000CBcH-3TnV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:02:49 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5eac4855401so413438e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793379766; cv=none;
        d=google.com; s=arc-20260327;
        b=angcFIX1GPsMwx2mPQ+CIFAYYefVW4dueBUOi+faO5SihZKGGWF0To1RUVA9Um+OTF
         Ku8BfqnlePz3MLoTXzZ6TpFWSXa8AdYLQvZo//2k529tKbVJ9Oi0y6H7OQItz2nre2y+
         laR/DuVPGkXOFMCiDEqw/G6drA4yda1dA/E95jkdeMCtiGg81Pra0Q8qVv6LpxEnejLl
         uMvyfINpFbRIXAJRF10Fwsf4uIBva2kaXU1ndRb1OWCVto07XblP82RoLoo8Rco+Zj9X
         4Z54on9ptaG0tBrREUikSKSPKISZaShKBMueVi0hrNxdqTHXPlDj6FoNqpe9CgBpTcdh
         mhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IQ/MHZMX5vmwMAGRIrdmx/PMBK9c4wP9Hplcv7IA9ME=;
        fh=iHWsvIHNV6hgO4+aendf6xj2QRYQfkx8UYoX25p5pGg=;
        b=i9D//ifogXALH8w/MS/Hr7nJDpxqqnjbJ8lMulg0w+Z6oOj3mn6ir4wVKN1pS613+I
         qo84E2aQBuqgRbvux/lBpRlSlMnb9ybmqGgH0HfaPnx/n37qUy3G8Ls2C/FZsgFd63k4
         RugVIRkxjb/p7CRGYDIgbxTZgIGcLfr+lD8jR0Q5PEh7Mq1CAMKqUvadvCCEeNVkT47Q
         1u4HlMRgZMuR9TvqRSAwthXCFJeNks+WkzbL7tfH6YvIwmH5fMi6EZF/8rA1XFZCnZ57
         npgfHMsk9YeVAt7h6YVV/Y6MEUmJaitaBVJDY0agC5AdtDf4ilT/VCDr4yy8kinJYga+
         vF9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379766; x=1793984566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQ/MHZMX5vmwMAGRIrdmx/PMBK9c4wP9Hplcv7IA9ME=;
        b=CIOQsZPtxHzqHTeel0+EsmRrxxTA5FnojJD+PEiUy+KX5kma/4f5Npf082c9lZgl1T
         k0z+qKC+Ir78lz7bWzWZZBAxk7nGRm1YSzXx+UrfGJYP5b9yrTJoqjBTyvDmbtfMgLhA
         6x3l7ztEUAfd+IjLjHvfSRAjrDOuNEuBXHQdQv6NfP35AG/G8vs5U9fHVaq8audKlVib
         8BBEkoxGSvOblegng2GO5ngIl2Zk/Vppiin9qdPhAs0Y1o4DY6+zZjFY7xVBJQZMOWE8
         lx5pdxAOoyZ95Du/KxFbvNqbz6CsBPvsmYEbc6VDrzfWuru3xOjNGBVCmXcUP0TuhtfX
         eahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379766; x=1793984566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ/MHZMX5vmwMAGRIrdmx/PMBK9c4wP9Hplcv7IA9ME=;
        b=H2PR4nSblPCYn5Lb8GzVWWcm+M00smFNQWu2B/O+JEjCoRQ3A9JosJOpRE9ZmNmnHu
         JSITlmhYFqwzfURW6uw5WCCne4/WL8D7v4ncjhPQe8aQiMjI8bTNcnd53SjryIVHR4Pt
         q5C3CmZ7VoVOKn87lZDOey7Yn6bSbRFVVZmUzHiFfbzGoSDjhkrEQywOc407uReH/WWk
         eQJX//iUk3QakRdkLiEpRRilvsxUbGRAkyoYghjXlVNcKUqtZf7zOGLZcyUY/i1VAnoK
         tb9NIgCuLYTI9oAiisD41IrGPq79obiPqh6fztQcZZVn0dbnMRaoTj1JBCJQViAx9BCD
         t2Uw==
X-Forwarded-Encrypted: i=1; AKwUvBy27g34/wrP+dv10+3n4nL6pnj5XaCSPE8vDxupQBRTTQrrOZ9rXBxou0nlUSj40V1pZ5TqxpE8O76xwx2BRrtE@lists.infradead.org
X-Gm-Message-State: AFq9FYIWjiA0n5LrGXgJDuFGdkud6W6fqlcDhx9hEgHRSsVhsdRpbz2k
	aYRfP+BM3CM9f6BfDSTLz6v1YqQvkOs+iNlIZQyZfjpnqq0+2FAYPqx/vZwIcYwZgT2WgWj/Xnu
	3WJvVfu0kxCFjzVAWJzLUtLe0mtdF2mc=
X-Gm-Gg: AYBFou1X3/KmKaRpQ9jUoAWGEM7BqW6qamww9RT42SvqYSzOVsVCNdIItqDRNIAMjF1
	vA2o0JYhr5a3/GWTEXOlTNLVFvBgeleZDYpZLzA2gULYlZPUrZrG+jYFGi8gTbVIJwEqFT8jqfn
	OAXhXkRnh4X6LZwAM5UFxfIxkIDViElDT9mztCqEaSLJdez++BzGHVRksDZUE3GR9EclGtbUIf6
	M+fDL20UcEP4XPxKelokToOgKxWeZqonIURpS2XJdqzdG8iG1ywhDU3RAGkRw9rTAq9jz4+NcvZ
	qdt9ufyqOIm+NqY17Asf4cs3JEEsDsGDTttYQOjiUZTHTMPhNkkCsv43whjHnVjwgFsN3nzG2v0
	/ymHJMEdhJqmnOuOcxmrUWmI8f2/tP5F8DYMSpdIKshfGWCBEQhn+cX2mWuBzKUEiDf9fwu23gc
	TJ/3xPwzcZtz1y6winTESwaAol2ccvewYZNRavIxjwUKP3W4UAEKQeHkQWrUA75G7lIAqPhbyYP
	uwpwiDC1DHaphPquqqWQNOww+dt4hs=
X-Received: by 2002:a05:6122:ec6:b0:5eb:8606:3425 with SMTP id
 71dfb90a1353d-5ec6882efe0mr1512064e0c.10.1793379764546; Fri, 30 Oct 2026
 10:02:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
 <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com> <0809accd-0db3-c923-0396-2d45db7b0d82@linux.intel.com>
In-Reply-To: <0809accd-0db3-c923-0396-2d45db7b0d82@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 11:02:33 -0600
X-Gm-Features: AclHuK93gSvxd_qQwj9Y21y4-X1MbcSsbMU0tWlNjMu02Pk-YVCZgJyAG1RMGJg
Message-ID: <CADvTj4r2Z_NEzTPAUpEj1VvKLhFMS1+EFA+8wMKZgXcx7NxsMQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] serial: 8250_dw: configure the Allwinner H616 UART
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_100247_901835_01550D35 
X-CRM114-Status: GOOD (  44.54  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 3:51=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 29 Oct 2026, James Hilliard wrote:
>
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
> > Allwinner encodes these thresholds as fractions of the FIFO depth rathe=
r
> > than fixed byte counts.
>
> This feels repetitive wrt. the previous paragraph so I'd instead start
> the previous paragraph with this sentence.
>
> > Building a per-port table from that depth keeps
> > the mapping in one place for integrations with different FIFO sizes,
> > including those that report their depth through FCC. It also lets the
> > shared 8250 conversion helper select the nearest lower threshold for sy=
sfs
> > writes using the same table as the read callback.
>
> Instead of this long fragment of text, I'd just say something like this:
>
> Construct the RX trigger threshold array on the fly so that other fifo
> sizes can reuse the same mapping.
>
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
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 98 +++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 98 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index a546cf2de7b6..3bc6735fc253 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/io.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> > @@ -63,6 +64,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     unsigned int fifo_size;
> >       unsigned int quirks;
> >       int (*setup)(struct uart_port *p);
> >  };
> > @@ -81,6 +83,7 @@ struct dw8250_data {
> >       unsigned int            in_idle:1;
> >
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
> >  };
> >
> >  static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_da=
ta *data)
> > @@ -652,6 +655,93 @@ static int dw8250_setup(struct uart_port *p)
> >       return dw8250_setup_dma(p);
> >  }
> >
> > +/* The trigger is the masked FCR receive trigger field, in register po=
sition */
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
> > +
> > +static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
> > +}
> > +
> > +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char =
bytes)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +     int fcr, ret;
> > +
> > +     fcr =3D serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
> > +     if (fcr < 0)
> > +             return fcr;
> > +
> > +     guard(mutex)(&p->state->port.mutex);
> > +
> > +     PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
> > +     ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     up->fcr &=3D ~UART_FCR_TRIGGER_MASK;
> > +     up->fcr |=3D fcr;
> > +     /* Changing the trigger alone preserves the FIFO contents */
> > +     serial_port_out(p, UART_FCR, up->fcr);
>
> Hmm, the current do_serial8250_set_rxtrig() only takes tty port's mutex?
> Does it lack something it should be doing (RPM or taking port's lock)?

The tty-port mutex serializes against termios and port lifecycle
changes, but interrupt and RS485 timer paths do not take it. For
example, serial8250_em485_handle_stop_tx() takes the UART port lock
and can call serial8250_clear_and_reinit_fifos(), which restores FCR
from up->fcr. The generic sysfs setter can interleave with that
reset/restore sequence, allowing an old trigger value to be written
after the setter has updated the shadow and hardware.

Runtime PM is also missing from that path. The sysfs attribute can
be written while the TTY is closed, when DW runtime suspend has
disabled the UART clocks. Neither the generic setter nor the DW
register accessor acquires a runtime-PM reference.

The sunxi setter therefore takes the tty-port mutex, acquires the
runtime-PM reference, and then takes the UART port lock around the
shadow update and register write. Runtime resume happens before
taking the spinlock because it can sleep, and a resume failure
returns without changing either the shadow or hardware.

> I was going to suggest putting the actual FCR update into generic 8250
> code and lockdep asserting the required locks are held. But then noticed
> the taken locks seem do differ.

A shared helper for updating up->fcr and writing UART_FCR would make
sense with a UART-port-lock assertion. The generic caller would
still need the missing serialization and appropriate runtime-PM
handling; moving the register write alone would not provide either.

There is also a separate behavior difference: the generic setter
calls serial8250_clear_fifos(), whereas the sunxi setter only changes
the trigger bits, preserving buffered data. Keeping FIFO clearing
outside the shared update would let both callers retain their
existing behavior.

> > +     return 0;
> > +}
> > +
> > +static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +
> > +     /* Allwinner RX thresholds differ from the standard 16550A table =
*/
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(data->rxtrig_bytes); i+=
+) {
>
> Add include for ARRAY_SIZE()
>
> > +             unsigned int trigger =3D FIELD_PREP(UART_FCR_TRIGGER_MASK=
, i);
> > +
> > +             data->rxtrig_bytes[i] =3D dw8250_sunxi_rxtrig_bytes(p, tr=
igger);
> > +     }
> > +     p->get_rxtrig =3D dw8250_sunxi_get_rxtrig;
> > +     p->set_rxtrig =3D dw8250_sunxi_set_rxtrig;
> > +}
> > +
> > +static int dw8250_sunxi_setup(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     p->type =3D PORT_16550A;
> > +     p->flags |=3D UPF_FIXED_TYPE;
> > +     p->fifosize =3D data->pdata->fifo_size;
> > +     up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> > +
> > +     dw8250_sunxi_setup_rxtrig(p);
> > +
> > +     /* Use software RS485 with the Allwinner register layout */
> > +     p->rs485_config =3D serial8250_em485_config;
> > +     p->rs485_supported =3D serial8250_em485_supported;
> > +     up->rs485_start_tx =3D serial8250_em485_start_tx;
> > +     up->rs485_stop_tx =3D serial8250_em485_stop_tx;
> > +
> > +     return 0;
> > +}
> > +
> >  static int dw8250_probe(struct platform_device *pdev)
> >  {
> >       struct uart_8250_port uart =3D {}, *up =3D &uart;
> > @@ -875,6 +965,13 @@ static const struct dw8250_platform_data dw8250_dw=
_apb =3D {
> >       .usr_reg =3D DW_UART_USR,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_h616_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .fifo_size =3D 256,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -926,6 +1023,7 @@ static const struct dw8250_platform_data dw8250_td=
a54 =3D {
> >
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> > +     { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>
> --
>  i.
>


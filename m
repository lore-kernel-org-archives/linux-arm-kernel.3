Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9vqd321;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOB4KXaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=; b=a9vqd321aaM+PP
	vqIIIlkSkN7FGwZglS+vckC6+MS4DtHu/WkkrIwihX1dM08ZjajNEcZIN9EAoJgHnUEh9RtwJdnw0
	c1kPTu0ssEGdd2gLlrHHAxgEmSuW2hdiTEp5GplbY5fECTe14jz8wxTQv3QmsE1TL+byZqKMmC4fA
	URMHinOjTXxe30qB4TOYLoXffrAVREB6KYYt4Gd+DepZ0nM4TY41BZoMuuvtmOi3mpi3VmY/E1lQA
	NocRhjjryHVi5umDIX7a0oeLUIO7/UdFi+w4/kUAlOrBCV6YdJOFSX7hUW1UwpqKbM4oi9TSFpG1p
	gRHn59j23ZvjFCePvFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzPP-00000006as5-0UAd;
	Wed, 28 Oct 2026 08:53:23 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzPM-00000006arh-3TjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:53:22 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5eafb65e163so488332e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177599; cv=none;
        d=google.com; s=arc-20260327;
        b=kiJV5XKU1TUS+aVlfnucx4KyBhqIDYiZJXeyMxrcUfQe0tgZd76ASo1Dz7M5Xwu+nd
         XcmhbW76v7ikYMnNILloDQdnyj7PuQrY3LzuT5m3a4z/R4tfjgKxF2KEpk2Ifv21qfuM
         B2pBEX7AwSQPmVOoaIe1zAjdiMns5iF+3mNvqysw9Rh7RyF9CotQG9hTeZijG6Luaax8
         Tk0QE6VKZLjRy+0xlggU9AHTW22lJm5+eRpw3NeO7loIYM6ALEr+gOjiG5ropL8xVuiE
         hNmNROtNRBmMkV5EZvJMHp+XfcVsT9dvBis9TAhwhdz3lJM1Uq8GesFMOz3zwIEdqIQS
         U+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        fh=MEzwjXhXDMD+ctO4OINBVleemqg2Tdknra84azQFBdI=;
        b=s25UabRmBYKp5lX5AkFgfLvyoYFOb4A9vuV2fTRqZk3KobGyzSEEl8Mr9HJUFqn66T
         CPkHZ0O1ED61cvn68wg+se3ZqMQ8XbOfQMUB+paCGp5ITo9spYTYGxROF9VfDxRVNy6H
         SW9ClqDvYtzO2XnV/Szn4shdGtRUfAatojYTqYUL+GYuVVQAaYv+11QEaNxVabaAOVOq
         stJhbdKFoFhhRNotOcmIV5dfImXQx4U/kl9RVRhHYcgdCYv7cvCW6W63sRczMqeAtAy8
         gcyHU17xLwjxhIhv80Vu5SGV6Ss4AZPP0bJX880H28xcl0tZMZLpK282wHaLKU/hL9aM
         owXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177599; x=1793782399; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=HOB4KXaTXBTgoCR8yvxaMET3zyEDfpEyDUfP+4Lh56Gu/fDAvdUd/YU1aDo1i0Da7y
         gL+odnztE8XVElZ8YaH9SOOskk6RrZOEHxDz5Tc86U1PJvg+VMKjodRj20NC0tia+zXs
         80gg3DnTGMV2AfY2YS6/wtUT7SS8LFVtN07LMTlS0LZFedfcw59UJuOs0D3hR7l5Nf8s
         iqHx8X3FQGV/ugLQyX0Ae9mNJmldqMNUPdEsHWHQ0VR/kmJPAv5hPjpTP3sbgFHgmlOH
         hPW55oNQdGaRJVVEba6Oq4UN2nM3SYgIYc9ONxndkfCwbS268oOCAXVfpV3lVPV5HFIq
         14mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177599; x=1793782399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=lFKfSVSvet6sp4SZ5+p6QU55pW1l6LAhAtoLgYwcCx9t1YZAMHJrUhbAjvDOM7scNA
         7KLFvUsvvweLAwAFvOo+uS33KV9yR5hxuBvFYp9uAAop9htA8FrKeYSKlzuOAXbZvE1M
         SY+bHB11Pz761xRKWgUv1NdA9LBPMLGsUBeFIN2HU0N16IqpLBN6zT9S9/pZ9gueTZNb
         W/2awUwwQf8gtHDpoBXB2Jt/uiKxuA+t72XJ3Fqq6yibi8Lwai70ULlVK+Ufu2yNFose
         +D8k6vr5p/1JYXjqJLXxi+GbyaYIdpniXxGj6zJSOomAT/3x69fwYPw4cVxfFS5yLHBI
         z1cw==
X-Forwarded-Encrypted: i=1; AKwUvByRDxiSRFWx2wz2Mulm5Hzt8/om/+WWGCmGfHAiV/d1S77jyZbbwIZCebOYuXC1r6xQWJ+GWykVHEoSjbMDfFNA@lists.infradead.org
X-Gm-Message-State: AFq9FYIa7k2nFsyFJKyop6aGpaawZ/GTq0GnJo1RQTu61gPAbuCuarRy
	qXFwCbMIzg4a30tlaDJTexrTEe5g0SWZ3R5XK2+LDYP77aqcE1oULPVrSsZYIpvYh2ygeuPONpx
	ooEYFsSIXpAUlbgf89+oMv/klTlr8+5g=
X-Gm-Gg: AYBFou0vAqcLDFPffDLlplqx5Yxxm8ogEPsgtfvVAlnL93jYLCr+j4EoFsDDfYX4X6d
	yaTZaZIcmdArhMuwA2yGZIE90w0LRn7hrFne58fb893IAN3Zy/vNga4pW2sZgPb1IPgxSjsxoXq
	q8HW9+AUZ9HoH3lowmH4aiMufOlzQuEKNI77Ka6uU8YqCX8w6NZUe9lQUDkJnjfPaoT78bMwnl0
	43mCnPbCOWg0nu3UrdRMkSUtEqDmRwAtGOfIVdNTwt/ZILBCc786hv5YySte4qbn+2RJsLy8EhE
	Ec7ZO/ybltWC9jeKObqjmLoAQUiULMEGnaP9g0WD7zO+7WF01MGIQgLJT9ZYPCGyVMuJsCMFJ4F
	VjFFi8rAhpWKvorvIQAPX0nx6xQ0GScecuy2l8zIS3WmCdKII4dFSSYqtv93fDOfFj55J0c41g8
	27KzWdwsZjAzubUog1j+jbkCuFrBqJNNcHS3/bDkc0CIo1Reb4dEZsHn0ca7Z7Pkbk01pDrkEDb
	d0GuLrpH80BFbL9k/jjfKCgiirq818=
X-Received: by 2002:a05:6122:e22b:b0:5ea:df96:c394 with SMTP id
 71dfb90a1353d-5ec4cbc53dcmr735009e0c.5.1793177599205; Wed, 28 Oct 2026
 01:53:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
In-Reply-To: <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 02:53:07 -0600
X-Gm-Features: AclHuK_mnaE8FYNJJORUUY4g9ttUI8htgnnSLpHl_6Eypp3F-37DUlSMbLaTo6U
Message-ID: <CADvTj4pquJ=WV3UuQc1PxazSWh48cPi9jY5G7nNORgvyV0-Dww@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_015320_896977_C208DCC7 
X-CRM114-Status: GOOD (  39.75  )
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

On Wed, Oct 28, 2026 at 2:39=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 27 Oct 2026, James Hilliard wrote:
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
> > Build the threshold table during setup and use the shared 8250 conversi=
on
> > helper to select the nearest lower threshold for sysfs writes.
>
> You do that, I can see from the patch, but I came to read this changelog
> to understand "why"?? You provide zero reasoning for this design decision=
.
>
> Since you fifosize is constant as well, so what benefit building it on th=
e
> fly servers?

The intent is to keep the FIFO depth as the single platform-data input
and derive the thresholds from the common Allwinner mapping. Other sunxi
integrations using that mapping could then supply a different FIFO depth
without duplicating the threshold table.

Building the table once also lets get_rxtrig() and the shared
bytes-to-FCR helper use the same derived values.

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
> >  drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 1351523f0c47..2f156c01c5a1 100644
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
> >       void (*setup)(struct uart_port *p);
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
> > @@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *=
p)
> >       dw8250_setup_dma(p);
> >  }
> >
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
> > +     /* Changing the trigger alone preserves the FIFO contents. */
> > +     serial_port_out(p, UART_FCR, up->fcr);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +
> > +     /* Allwinner RX thresholds differ from the standard 16550A table.=
 */
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(data->rxtrig_bytes); i+=
+)
> > +             data->rxtrig_bytes[i] =3D dw8250_sunxi_rxtrig_bytes(p, i =
<< UART_FCR_R_TRIG_SHIFT);
>
> FIELD_PREP(UART_FCR_TRIGGER_MASK, i)
>
> For clarity, it might be useful to split it into two lines using an
> intermediate variable.
>
> > +     p->get_rxtrig =3D dw8250_sunxi_get_rxtrig;
> > +     p->set_rxtrig =3D dw8250_sunxi_set_rxtrig;
> > +}
> > +
> > +static void dw8250_sunxi_setup(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     p->type =3D PORT_16550A;
> > +     p->flags |=3D UPF_FIXED_TYPE;
> > +     p->fifosize =3D data->pdata->fifo_size;
> > +     up->tx_loadsz =3D p->fifosize;
> > +     up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> > +
> > +     dw8250_sunxi_setup_rxtrig(p);
> > +
> > +     /* Use software RS485 with the Allwinner register layout. */
> > +     p->rs485_config =3D serial8250_em485_config;
> > +     p->rs485_supported =3D serial8250_em485_supported;
> > +     up->rs485_start_tx =3D serial8250_em485_start_tx;
> > +     up->rs485_stop_tx =3D serial8250_em485_stop_tx;
> > +}
> > +
> >  static int dw8250_probe(struct platform_device *pdev)
> >  {
> >       struct uart_8250_port uart =3D {}, *up =3D &uart;
> > @@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw=
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
> > @@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_td=
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


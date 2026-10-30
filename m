Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90887606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztboVKd3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfmBXd+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=; b=ztboVKd3RUOLiL
	WHZUs25oXYoVeNRLaVijR7lcmrVmdNI3d9DNwTCfQD2UwoMcuql/a7o1YdHbLkOWlES/s9zvLYnES
	5TvK55j4WsoNrAWe3aMF9GBEiNVTUQppDble79IRw2QwcBlDNh/gNKfb1P/4f+B22e1LMB9fXjxE8
	jTsMU8osdrCiC+Jrl62cNAcoAWn8wBT841uRdnq8gXfzH4KfAckWCXyR25DS3XB2U/gIBYba078at
	5RAwAko2anSA0T1zXcu1dTTF8Vkg2yc7B2mt8R9+gfYE5Mg5VQh9RumhvIuEruUorF+pFmP5c1eJW
	mIUzpmQ0XoJBLg+oUaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXV-0000000C8Ma-23fp;
	Fri, 30 Oct 2026 16:33:13 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXN-0000000C8Ft-2SsI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:33:06 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso251496241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793377983; cv=none;
        d=google.com; s=arc-20260327;
        b=dGEGiOZbfdlkRgUztPRsGD5Ki/DdI8dj/vecD7H5Efnxpd6boiLSL7Qg/HFyphIosA
         DqSpcS5n46gnq4+6NNllKJcuGaFIfkpkvdnEv3lqF0regK7/HgaZbKyuUSZnYgJEzc1b
         e7HgY8RIyPq8Piad6E4gZSBaW2Qn+hiqUum09xZVOUOQ/xLkBa8CQwgQf9pyK4GXRNoq
         B/Tfw2lYy3SIvJsREpf2iw1bzJaLzY646vaPuMRS+S/kR5zKsbhsrnzlqX4eEo22/BY/
         vT6fktqO9JCqeLqi4aprg/P4UWs4FqMjNmWftJ1wNf0GNEm233+cvOC9qZji+OpN5xzO
         pE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        fh=Ksf24xqS57PNhIA4JNFvuW87y+wJ2P1NYwcElH68uE0=;
        b=hCJmFy+r+4idLJhzYV/BsM03dCKKvdKjkwj1N9JXqZzDqZhr19VL9oMQcqj0wFlZD6
         /kygStLkn8vLUM1DJr5wfW+xDMJ8VqrMLey2KFduvZijE1YAXHuDuCojBTHt32AVXAIo
         LMVCwDBn2FIaBHSdD9lRbFdkgcQKVPwBo39XYUGcCPJZzTDJQesAr0lFHc2/xoNlA7l3
         l09S/J+BiC4rySzcYhVcu2KEFqz9/5ZWVM5GYegt9rA7bmPYLSymPwNIDrQwGR1MS1DW
         KtxXaJPL9jMXMabgJtaLM6f3B72YlEW0GG5752II0xE3Ek4D4oCggrEKx6VwJkAWiQ6E
         0jYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377983; x=1793982783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=LfmBXd+dMpE2Xof/tielXLrDPjIE9PT3mN/5f3rb32ZUyGbENjCdOBypgV/W+32XWp
         ACEPxzBWJ6+zDZUGPqL5pmogCtmA2PUyjmcLwYWzTOy1KsvbLD/pYFd0ulFaOMg3LJcw
         opY2DyCZ2VUcvAdGW27rVRFnmw/LPB1Yu6iMFi5IgJ3wNfLEOywAQHMG9+D96F/iEYcE
         u29Qm64D0YPJcT6aH3Hc3o3BH5+tWKOGsQp6w0Peib/or3ZLAnMCmFIz5mRBn6RlPmqY
         zHhzNdiyHmbRSZiuVsjeJiLHJF7+VlT1FPDZ+WF1u92U8D31RkgT+Nna6VemDUjthenp
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377983; x=1793982783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=I/H9jWW52TV8DGv7AMb/xIW5a6NSQ1HKYMFnPeMjCJ+mjVLou2SLqMI/ofKwctYwAH
         U+0UBVhw0aIc0sV9ct4YojYs2a0o9OcUpqrC9G854gVj4KkQh4xMEgmhcaup3LhJmXQF
         Ykxe5ZJjxwGFdOW9ZNwF8Sm0UVxVnwwzLPLPddMrGPm+tzMz3TS0r8NMjSYOS72IeUg+
         D3w0M2lQ4w75wmZdxjWXdZZTGJhesQgDO6nm8tQq49a4EDcLCW5ipECK2NtJcakNUu6F
         Ljc/3GyIBi98lLiiS6RrbhYoP8+5P9HaL2HxGDsVvQVRIIVOytw47Guc87cCzy/WpCam
         kLLw==
X-Forwarded-Encrypted: i=1; AKwUvBwfAFX3xyMy+sQLA1ypUXxol7nRvPWJ05Pyja3YoRZM2eYzlbjRI9KQEO0Tpzhypj6Zobgi1d7fD94Rmd0B6oIX@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/hbfcqM5N37+xhMUqNSGcBhm72WS3pQ/GsT33tEMPC5A/ZQj4
	SvttxWAviG7uTvyl+6957xhFAmyqV53zWn2QiA2t2xfcBE+/WC7Yo+MmCL2MJZiXcBthU02fQUH
	bTWossxPJd3tkP3W3x+du+lSv9LmwDrA=
X-Gm-Gg: AYBFou1FAa7qg7O6f+Fszi5BqqjxPpZSpNnZpDIvM5do33f3XdETr4Sn5/G7ngSxWh9
	1Yh/jiqt8FAecTLVIIUAp/Wf0fE30Lgj6Lvoi4QFEIv8M9DeVnaU1HO0i5yKTMtbOwW077UjnNr
	9/aKZv//wkl8qO4Sm/rAZ4LBtHNkmn6NIz3fIA2CCVqth+TpSQzcF9qm4wxPuJnGTR+TTEUCr92
	kuNm5nh1ZGJC3xXx/1pmpxqFYJ9Dm+VZSnrj3ubxvqfxp21kE27yni4kYJmiD2QAUOaMHPt3oPz
	d7XZKnzgulAvFhxgdOVx8gpxW/H6MnEYCYFnmy2ko/w97FiEHhE7JEsoZyBIAoU8fQ+MxBR9pdj
	tFqLyEmmB3/71WyyeQmr1GyR17TT+h9CbxVO66t17bdR72tRKZ/JxekpkPZ+a2liCIpRK45y2hs
	RbAQts7JsphfzlExpftdk0cVPpsW7EK/cTLheACPKNHTVYsa1uq2GefEKuvtioSIHOanKGQFSCb
	wpBfeTSaLBS0b80er9iWodQwr+6ug==
X-Received: by 2002:a05:6102:2c0f:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7d0725528eamr1573062137.6.1793377982874; Fri, 30 Oct 2026
 09:33:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
 <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com> <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
In-Reply-To: <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 10:32:51 -0600
X-Gm-Features: AclHuK9dYwyBnU9vyC-IBxpz7TsWhpjTcY4ZwN-3UTn5urI74GWhcbY5yqJONhY
Message-ID: <CADvTj4on8Kx2bW05sSp5uHCT=LCL1L1Jmh_cOo2TEnNdx-mU9w@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
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
X-CRM114-CacheID: sfid-20261030_093305_705314_EAE6B732 
X-CRM114-Status: GOOD (  37.36  )
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

On Fri, Oct 30, 2026 at 4:15=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 29 Oct 2026, James Hilliard wrote:
>
> > The A523 UART integration, also used by A527 and T527, has 64-byte FIFO=
s
> > on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller rep=
orts
> > its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> > offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> >
> > Read this field in the sunxi setup callback when platform data does not
> > provide a fixed FIFO size. A fixed size takes precedence, so H616 retai=
ns
> > its 256-byte configuration without accessing FCC. The probe has already
> > enabled the clocks and deasserted reset before invoking the callback.
> > Leave the FIFO clock-control bits untouched.
> >
> > Validate the depth before generating the RX trigger table or setting th=
e
> > transmit load. The quarter-full threshold must be positive and the
> > FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
> > trigger API. Report an invalid depth and fail probe instead of generati=
ng
> > zero or truncated thresholds.
> >
> > Select this setup for the A523 compatible. Derive the transmit load and
> > RX threshold table from the discovered depth using the common sunxi
> > helpers. This handles the different FIFO sizes with one compatible and
> > one receive-trigger mapping.
> >
> > Like H616, this integration has Allwinner-specific debug-divisor and
> > RS485 registers overlapping the generic DesignWare feature probes. Use
> > the common sunxi PIO setup, BUSY-safe integer divisor programming and
> > software RS485 handling. Keep the APB clock gate enabled during termios
> > updates with SKIP_SET_RATE.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 3bc6735fc253..2ab91f479fc6 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > +#include <linux/limits.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -45,6 +46,10 @@
> >  #define RZN1_UART_xDMACR_8_WORD_BURST        (2 << 1)
> >  #define RZN1_UART_xDMACR_BLK_SZ(x)   ((x) << 3)
> >
> > +/* Allwinner FIFO Clock Control register */
> > +#define SUNXI_UART_FCC                       0xf0
> > +#define SUNXI_UART_FCC_FIFO_DEPTH            GENMASK(31, 8)
> > +
> >  /* Quirks */
> >  #define DW_UART_QUIRK_OCTEON         BIT(0)
> >  #define DW_UART_QUIRK_ARMADA_38X     BIT(1)
> > @@ -64,6 +69,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Fixed sunxi FIFO depth; zero selects discovery through FCC */
> >       unsigned int fifo_size;
> >       unsigned int quirks;
> >       int (*setup)(struct uart_port *p);
> > @@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
> >       p->type =3D PORT_16550A;
> >       p->flags |=3D UPF_FIXED_TYPE;
> >       p->fifosize =3D data->pdata->fifo_size;
> > +     if (!p->fifosize) {
> > +             u32 fcc =3D dw8250_readl_ext(p, SUNXI_UART_FCC);
> > +
> > +             p->fifosize =3D FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc)=
;
> > +     }
> > +     /* The RX trigger table must contain positive, byte-sized thresho=
lds */
> > +     if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
>
> One additional comment.
>
> What is the reason for this "byte-sized" limit? Is it Allwinner specific
> or perhaps the use of unsigned char in 8250 driver to store them?

It comes from the current 8250 software interface, not an Allwinner
hardware restriction. The per-port u8 threshold table is introduced by
this series, but the existing set_rxtrig() callback takes unsigned char
byte counts, and rx_trig_bytes sysfs writes are parsed with kstrtou8().
The existing per-UART-type threshold tables also use unsigned char.

> In the DW databook the CPR given fifosizes go all the way up to 2k. I'm
> not sure how large actual UARTs make them but applying the FCR formulas
> one could get > U8_MAX thresholds.

I haven't found an Allwinner UART documented as having a FIFO larger
than 256 bytes in the vendor manuals reviewed, and the BSP configurations
checked also stay within that size. With the Allwinner mapping, the
largest threshold for those depths is 254 bytes, so the current types
cover the hardware identified so far.

A larger FIFO could exceed that representation: a 512-byte FIFO would
need a 510-byte threshold, which would truncate to 254 in our u8 table.
The check prevents that truncation. It is a software limitation, not a
claim that Allwinner hardware cannot implement larger FIFOs.

> If it's just 8250 drivers type limitation, I think the comment should
> make that obvious the type could be changed as needed.

The comment should identify this as a limitation of the current
byte-count representation. Supporting larger thresholds would require
widening the new table and shared conversion helper, together with the
existing setter argument and sysfs input parsing. Widening just our
table would not allow those thresholds to be requested through the
current interface.


>
> --
>  i.
>
> > +             return dev_err_probe(p->dev, -EINVAL,
> > +                                  "invalid FIFO size %u\n", p->fifosiz=
e);
> > +
> >       up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> >
> >       dw8250_sunxi_setup_rxtrig(p);
> > @@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h6=
16_data =3D {
> >       .setup =3D dw8250_sunxi_setup,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_a523_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_t=
da54 =3D {
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> >       { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> > +     { .compatible =3D "allwinner,sun55i-a523-uart", .data =3D &dw8250=
_a523_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>


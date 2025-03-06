Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061F1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+9mxc+l02B65bY510CtDpWfGB/WhaPkpeMd5a2/EoQ=; b=S1Mxo0AaGjhnrg+yUdIbOb0vlO
	1QYyrUAn9CpOGYAU3E0O3oFa7Zrn29F+futxsri5hQHZMwt07Nx44QIwBFMQVDv4bdBqoZZn3IzL/
	lc5fU0v40WbfaKY6XWmjxxpQrSP5TyHhGpiu7rpH33wHVxWKGwABOIWLfZafobpTfTBuhKn+Wc5ZK
	+EceDVZ70xHjpAVEyCXQOdVY1ltMuV1mh8F8UGx2kQesyONHkKwmJlf4vrjjkK3tY+zLdYcPnuDh4
	q0abVicg0uC1uFwjCryWy1BX78+Rw/6LjrdNAQ1d7/4wP9+sGUKnkxAUGrZTzlU0HSNTV6Xsot9wu
	v4rwriJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKte-0000000CWWj-2OHh;
	Thu, 06 Mar 2025 23:44:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKp3-0000000CVkU-35jj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:40:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA1DA169E;
	Thu,  6 Mar 2025 15:40:18 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EC033F5A1;
	Thu,  6 Mar 2025 15:40:04 -0800 (PST)
Date: Thu, 6 Mar 2025 23:39:49 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] pinctrl: sunxi: support moved power
 configuration registers
Message-ID: <20250306233949.23924567@minigeek.lan>
In-Reply-To: <6028746.MhkbZ0Pkbq@jernej-laptop>
References: <20250227231447.20161-1-andre.przywara@arm.com>
	<20250227231447.20161-5-andre.przywara@arm.com>
	<6028746.MhkbZ0Pkbq@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_154013_863281_2DF16F36 
X-CRM114-Status: GOOD (  23.04  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 05 Mar 2025 18:50:34 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 28. februar 2025 ob 00:14:43 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > The Allwinner pincontroller IP features some registers to control the
> > withstand voltage of each pin group. So far those registers were always
> > located at the same offset, but the A523 SoC has moved them (probably to
> > accommodate all eleven pin banks).
> >=20
> > Add a flag to note this feature, and use that to program the registers
> > either at offset 0x340 or 0x380. So far no pincontroller driver uses
> > this flag, but we need it for the upcoming A523 support.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 83a031ceb29f2..fc12e6f807e4d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >  		val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> > =20
> >  		raw_spin_lock_irqsave(&pctl->lock, flags);
> > -		reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> > +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> >  		reg &=3D ~BIT(bank);
> > -		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> > +		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset); =20
>=20
> These two are missing "+ PIO_POW_MOD_CTL_OFS" right?

Ah, you are right, I mixed that up. Nice catch!

> >  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
> > =20
> >  		fallthrough;
> > @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >  		val =3D uV <=3D 1800000 ? 1 : 0;
> > =20
> >  		raw_spin_lock_irqsave(&pctl->lock, flags);
> > -		reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> > +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> > +			    PIO_POW_MOD_CTL_OFS);
> >  		reg &=3D ~(1 << bank);
> > -		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
> > +		writel(reg | val << bank,
> > +		       pctl->membase + pctl->pow_mod_sel_offset +
> > +		       PIO_POW_MOD_CTL_OFS); =20
>=20
> And these two have "+ PIO_POW_MOD_CTL_OFS" too much, right?

Indeed, fixed now.

Thanks,
Andre

> Best regards,
> Jernej
>=20
> >  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
> >  		return 0;
> >  	default:
> > @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platfor=
m_device *pdev,
> >  		pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
> >  		pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
> >  	}
> > +	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> > +		pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> > +	else
> > +		pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
> > =20
> >  	pctl->irq_array =3D devm_kcalloc(&pdev->dev,
> >  				       IRQ_PER_BANK * pctl->desc->irq_banks,
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 6cf721876d89d..742fc795c7664 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -87,9 +87,11 @@
> >  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
> >  #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> >  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
> > +#define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> > =20
> > -#define PIO_POW_MOD_SEL_REG	0x340
> > -#define PIO_POW_MOD_CTL_REG	0x344
> > +#define PIO_POW_MOD_SEL_REG		0x340
> > +#define PIO_11B_POW_MOD_SEL_REG		0x380
> > +#define PIO_POW_MOD_CTL_OFS		0x004
> > =20
> >  #define PIO_BANK_K_OFFSET		0x500
> > =20
> > @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
> >  	u32				bank_mem_size;
> >  	u32				pull_regs_offset;
> >  	u32				dlevel_field_width;
> > +	u32				pow_mod_sel_offset;
> >  };
> > =20
> >  #define SUNXI_PIN(_pin, ...)					\
> >  =20
>=20
>=20
>=20
>=20
>=20



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F48C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNcEfaeJ7f/7E/IbehiEuZjAqs388XIO8b4zuNsyFG0=; b=0aq9LNe4uJpi4waikna+GaWOCK
	Cq3KH4Ud8KZZQRb27A+TLASiGPMHYRQjh9Z1r99rUIBkx0yvrs3ZejjoQakoWWrLvo/swDseHMYyg
	LCp6Qwk4beOssOLvT+d6FrAjZFCLY5UedetCIVyJyki744uIyxIWv17Y4XaXoNqWx2rr4tm0jUVct
	zvXbH+3LoUn3GXJ/jhz7ZmLn004Dy+2hW8+NkjrEfDVvh7aCGm67s5fIzOls3suUCY9aFPxR1C0RF
	cdAzg1NkEFhpVEqUlB742+OXspcF04RrUlEYydeqBBLuOuQFWWZsQhHiC/gnn4b4OSAnBoJyZEJLn
	3WNci8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYisQ-000000027F1-1Wq8;
	Mon, 07 Jul 2025 10:15:10 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiKL-000000020tJ-3aMl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:40:00 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 023561F00051
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 09:39:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CEA55ACAC78; Mon,  7 Jul 2025 09:39:47 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 61394ACAC6F;
	Mon,  7 Jul 2025 09:39:44 +0000 (UTC)
Date: Mon, 7 Jul 2025 11:39:42 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <aGuV3gcKSRIyey53@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XdpP7rZ162aJGq60"
Content-Disposition: inline
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023958_212718_484A813D 
X-CRM114-Status: GOOD (  50.74  )
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


--XdpP7rZ162aJGq60
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Andre,
> >
> > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > trailing "0" that has no reason to be.
> > > >
> > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die:=
 it's
> > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > registers (@0x5030000), and there is a second syscon register
> > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > It seem like no suitable pins are connected on the A133
> > > > package, but that should not affect the A100 .dtsi (we use a similar
> > > > approach for the H616 and A523).
> > > >
> > > > So I think we should keep the emac0 name.
> > >
> > > just thinking that it's even worse: this changes the DT visible pinct=
rl
> > > function name, so it's a DT ABI change. With the "emac0" function nam=
e,
> > > Ethernet would work with stable kernels already (as everything is
> > > compatible, it's just about DT changes). But with this change, pinctrl
> > > drivers in older kernels would not match.
> >
> > Given that the port is still very early and experimental and has very f=
ew users
> > and no field deployment so I don't really think it would have annoyed a=
nybody in
> > practice. But yes in principle you are right, while the header renames =
keep the
> > same value, the string names are used to match the device-tree definiti=
ons and
> > this constitues ABI that needs to remain stable.
> >
> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>=20
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.
>=20
> You definitely need to send a revert for the DT binding patch that is
> already in net-next.

Should this really affect the bindings though?

=46rom what Andre reported, both EMAC0 and EMAC1 should be the same block s=
o it
doesn't seem particularly necessary to have a different compatible.

Looking at Allwiner's BSP code for the A133[0], I don't see any difference
between the two. While there's device_type property in Allwinner's dt, it's
apparently not used by the driver[1].

So I think we're still fine with a single compatible (without the controller
index in it).

[0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux=
-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
[1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux=
-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c

All the best,

Paul

>=20
> ChenYu
>=20
>=20
> > Cheers,
> >
> > Paul
> >
> > > Cheers,
> > > Andre.
> > >
> > > > [1]
> > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boo=
t/dts/sunxi/sun50iw10p1.dtsi
> > > >
> > > >
> > > > >
> > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinn=
er A100 pin controller")
> > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > ---
> > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----=
------
> > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >
> > > >
> > >
> >
> > --
> > Paul Kocialkowski,
> >
> > Independent contractor - sys-base - https://www.sys-base.io/
> > Free software developer - https://www.paulk.fr/
> >
> > Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--XdpP7rZ162aJGq60
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhrld4ACgkQhP3B6o/u
lQxhGg//RkhulMqu+NDFCtXDYdtwjWBuUBSul6anTse4p1HDcTCsQwm5F9QTP+tZ
dvgl02rfFlH0W/ylYmmN3aFjR3d/EuhicBUiNVpVlSBW2JzZ0EK9ge2ulNkNy0r2
OAyA+SJjVUK4jNN6Cv9TI1C5I0lrTQRhl/RHdjb7lL+8141MChuF1l8PTKstLK+Q
uSxcYr4f2FFssp0ZsaTlTl6YmZHT1MVvMHdpM4KiV/3Nt9HcdlXtQdoB4tpAFNj+
1dSFiF0arpuRVKDMCstvd6QZFdpTfQPWmRB0kvSwlYAWU1bm1JZwW2KG15GoHAnW
BuumXSZvVtKD2oMjtVVKbgJJirquzv0WgUvf6gAjGPcdAYTNJ8Tka78zXcFkkSx5
VwqGI+wiBs/m6ICPVO7UACgjOeZGKUfJ6TuZl/59Em6kGo+AgHP6YK7bV2IlIhJw
GXJSJ7b54rin3O666Aag10RMIWW8s7SzlqmEukbn61nlAPdqvEpCaDqHyTe9XPaJ
HMdA56CxqXIA7SBOky1pP4kUAcATGNYuRjvXfGjVR67UXv+yngOeBNARenWBkTX7
ybRbzcFT/38IifMTxrjc9c0TLtHNFsMUNaXFF5PRRKBsxcSEw+AJ3pCmxVDzpyru
msl7lUFLn0XoV+6PnPRQJ/j4bbSK5mNMVsXUgiOGA1AaQNrlB3E=
=tq5K
-----END PGP SIGNATURE-----

--XdpP7rZ162aJGq60--


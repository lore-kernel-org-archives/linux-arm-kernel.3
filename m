Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C9DFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkD+Cua6mFUOEMGpJbTr5Tmcp+IoQGSyyc/TNMFouxc=; b=08Md2ykFcNVf+goIbqKvfW4aC5
	kLgIINAX5Q0wdhXADRjK2FW9tkj7sqJGnWf7KDcreSlrah/LGrklKgY2TwO11DmD4e0VFM9yDA6BZ
	IpNJEUq9Si9GUoSMbdDOKs0WmQ68U+OGzxm+p/hQk8nz83CpE6Hxd5ACPTgDdtRe1xAA0SJr6Oo/J
	iRK7fxoaZfzMmvxIcr0HSdO+zhV9h2v0GAcJprMNYOwvLgRbAf95nIVzUi30VcnrE2RUB+T1pZDw1
	eIYsW0q6VOyMBn83JQmkW+9B3ZJ0zUlcRXqhP1A2sH8koRmDGlWP88vDYMIw4SAVElCxl0n7rzEE+
	2VTWr/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIhe-0000000Gtoq-1XX8;
	Tue, 05 May 2026 16:32:58 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIhZ-0000000GtkP-2TCU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:32:55 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 37DFB1F8005A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 16:32:50 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DF57AB4057D; Tue,  5 May 2026 16:32:48 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 84B44B40578;
	Tue,  5 May 2026 16:32:47 +0000 (UTC)
Date: Tue, 5 May 2026 18:32:45 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <afobrW9UFtNW0B1k@collins>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
 <afoRe6DI4GJIVtg4@shepard>
 <20260505182017.10d71c11@ryzen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rq9iZSTGYiEAWlha"
Content-Disposition: inline
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093253_958096_3C6DFF2D 
X-CRM114-Status: GOOD (  30.20  )
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


--rq9iZSTGYiEAWlha
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Tue 05 May 26, 18:20, Andre Przywara a =C3=A9crit :
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> Hi Paul,
>=20
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c =20
> >=20
> > [...]
> >=20
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +	{ .fw_name =3D "hosc" },
> > > +	{ .fw_name =3D "iosc" },
> > > +	{ .fw_name =3D "losc" },
> > > +	{ .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +				       hstimer_parents, 0x730,
> > > +				       0, 0,	/* M */ =20
> >=20
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >=20
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >=20
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>=20
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

Oh right I think I got confused! These clocks have no M but they have P.

Sorry for the noise there.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--rq9iZSTGYiEAWlha
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6G60ACgkQhP3B6o/u
lQxmzhAAgwGpo6Kmj27yWIQtH71oCqnC0lDHBP6All8FXvNIA4nxm+oerCxRpcwa
5pJkouva0w07D1W3+2f5ctrnPeRxEM/SmppEkEZqeoiaZCVdRgH9+XhULT6GuuP7
JsqKSow7rW2Fd620cNHNoH/STGwybziFzrgwauDmrHYFOfp/52RjvXssreLkS2Y1
FC2ehf1UVRVPsaV2Ae5Q8UB4gkLOfQBiL7R2OukqrwU5YaOZ9SUOYD2x79YsAHxp
oGgQD0ZEQIJIaVl+d3WmXyRomRK+Ah2AOVQxaUvKjHgQFfEmqs9Ut9k1CWZznZ2l
isu05RSc8Dgwo15vDTRJGp1zeCBo7RX6AZbhNJz7W4kbn8CKl1bamkBfG3/Jd77C
zhDbzJcRWusfI1YmSLDbOdypmDoZd/FFjyG8ZrH3qzt7HZoJihLMiqZ5FrZX0egs
je3DCmsHdn3AG5OT91kLqchwg9WGtM/GQTclS/I4AY9tHrdHOPRPjUp+o6uUKi7l
OMGjqbkbRgBXkC/jaq45of5eed7ND45QJUnea+hLq14RH7/yAIATLR70muHhUfRa
LoyrtJogmYE8QyGmsCxF2XotvJ1Fh2ZhGc28oaKTp8WG+Q3wYZVSRdCUs+4a1FQ8
AoLEvT97Y+2B0qG3LUsjNxJOOPD8LDm6+tJcGS62DRag4APqV+I=
=h3+g
-----END PGP SIGNATURE-----

--rq9iZSTGYiEAWlha--


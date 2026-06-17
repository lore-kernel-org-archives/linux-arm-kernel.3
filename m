Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFB5CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=404tAE/+R1SyZUkdqbOQ+xCot/cOxhbKnrTtvvurl98=; b=hxuqlv4zehhLDfADnlfMO5yfIN
	9ZA55YfNSZQuo8hlFpeldJ6kj2KDj1Jwuj4GzEQto3PYcH/NCxzxk70qcsWGHwZMjE4GPd6jWsOGm
	wusUOmOvnErBz1Hrzak/kv6Bqy/0hEsgfKZs2jTZDy6ZpFOs1pQpxrxedHmDI92umbDUe1BZKaXWv
	p270PREoa0sg5mQGr0SFU0R9l6mimy6AHRkJ/Z3E0mRy4+/JZADoSQwYwR8ZV2SjXF6XxSZgQm2NI
	ZDH1VA2U4dITMt08iuseW+wUrJ9WBiLZaXh/MrWeRjEp9FBnAYPKe3WaSRmRa8rORQGeNNl628GvH
	pJ9qjLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZy0R-00000000MGx-2lR5;
	Wed, 17 Jun 2026 21:41:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZy0Q-00000000MGr-3L2R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 21:41:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C07B36001D;
	Wed, 17 Jun 2026 21:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4B11F000E9;
	Wed, 17 Jun 2026 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781732465;
	bh=404tAE/+R1SyZUkdqbOQ+xCot/cOxhbKnrTtvvurl98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTnUtpL6Lr0x0CQQtTyI0DkN21QWM2xh3qkfbRkWOv0y85XPDJuI3a7vp8qy5dgYb
	 vH4LblkNLxC1uJOBjj2RjKsZICTavJjedU+53pdVlJl0tGzTtZT9vSFklpncd4Y3Uq
	 Jwy4EFyUamCpLp+ACc66go/TDzcg632smTIaseBWgKnA1CFR7PitKW1cUUoWdKRLVq
	 HFBXDWlQuXoWs+2AMJepj72Lzln1ApRyoJ8YKNbm7IokF++KXGBwN/ghNvLxDaAyTw
	 y+nw8zPuvdBzV2mrzSlgig1v0muqHra8Y6lAmUiZBp+DKc0HSSJVGq9QNoEpy3gFP5
	 KoSInkaXxI5zg==
Date: Wed, 17 Jun 2026 22:41:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
Message-ID: <20260617-gone-antennae-66b362e9d42c@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
 <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
 <20260617-deed-snap-4649ffae0e27@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yGnFFU5qPObdCcLm"
Content-Disposition: inline
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>
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


--yGnFFU5qPObdCcLm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 10:23:56PM +0100, Conor Dooley wrote:
> On Wed, Jun 17, 2026 at 08:47:53PM +0300, Stefan D=F6singer wrote:
> > Am Mittwoch, 17. Juni 2026, 19:08:02 Ostafrikanische Zeit schrieb Conor=
=20
> > Dooley:
> > > On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=F6singer wrote:
> >=20
> > > > +F:	Documentation/devicetree/zte,zx297520v3-*
> > >=20
> > > Sashiko complaint here looks valid.
> >=20
> > Yes, it is valid.
> >=20
> > It also brought up another concern in patch 12 that has an impact on th=
is=20
> > binding:
> >=20
> > Am Dienstag, 16. Juni 2026, 23:42:19 Ostafrikanische Zeit schrieb sashi=
ko-
> > bot@kernel.org:
> > > issue(s) to consider: - [Low] The `syscon-reboot` node is incorrectly
> > > defined at the root level using the explicitly deprecated `regmap`
> > > property. --
> >=20
> > And indeed "regmap" is deprecated and I missed it somehow. As far as I=
=20
> > understand, to put syscon-reboot as a child of the clock, I need to add=
 the=20
> > simple-mfd .compatible:
> >=20
> > Either
> >=20
> > topclk: clock-controller@13b000 {
> > 	compatible =3D "zte,zx297520v3-topclk", "syscon", "simple-mfd";
> > 	reg =3D <0x0013b000 0x400>;
> > 	...
> > 	syscon-reboot {
> > 		compatible =3D "syscon-reboot";
> > 		regmap =3D <&topclk>;
> > 		offset =3D <0x0>;
> > 		mask =3D <0x1>;
> > 	};
> > };
> >=20
> > --- or ---
> >=20
> > something@13b000 {
> > 	compatible =3D "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
> > 	reg =3D <0x0013b000 0x400>;
> > 	ranges;
> >=20
> > 	topclk: clock-controller@0 {
> > 		compatible =3D "zte,zx297520v3-topclk";
> > 		...
> > 	}
> >=20
> > 	syscon-reboot {
> > 		compatible =3D "syscon-reboot";
> > 		offset =3D <0x0>;
> > 		mask =3D <0x1>;
> > 	};
> > };
> >=20
> > I see both ways in existing DTS files (e.g. imx6sl.dtsi for the fomer,=
=20
> > uniphier-pro4.dtsi for the latter). Is there a preferred way? I have a =
mild=20
> > preference for the first, as it would keep all 3 clocks in the same way=
=2E If I=20
> > go for the second, the clock driver would have to query its own node an=
d the=20
> > parent node for the regmap.
>=20
> The first one is more natural...
>=20
> > AFAIU unrelated to syscon-reboot option 2 would give me the opportunity=
 to=20
> > have separate clock and reset nodes and bindings and skip the aux bus, =
but=20
> > this would not be a correct representation of how the hardware works.
>=20
> ...for this reason!
> Do you actually need an aux bus here though? Since you have to add
> simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can y=
ou
> set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> instead?

Although, the /naming/ is more natural in the second case. "topcrm"
sounds like the actual name of this register region. And syscon@ for the
node name.

--yGnFFU5qPObdCcLm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajMUbQAKCRB4tDGHoIJi
0r2hAPwNW7XtiqbIzMgNxrNCvFns+PFFwkEpnFNspkst36LvJwD/UrRB3kPmZ4Bk
W7Wu8WXjAqQnoDnptstn15CHqLXgtwk=
=IZMg
-----END PGP SIGNATURE-----

--yGnFFU5qPObdCcLm--


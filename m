Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D38CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXDwBGB2+sGiN6W1XVKpTD05/Z92DbH2/IbpKUIVRaU=; b=uke9ZeYo58gN3gvWXivh9vS0AB
	tqi7YqnJUoLkKeKYBjz/mCZ6Tq1iWI9oDsmS6t26ve8h4NfyU6u6o2jPUa6MyW0heyg/so3kidVCh
	fs9z9IaK3q0rAvMTa06PYuaut3rmg3FTt6CLd90ePkaWpaMPTt3ZoGbZekdFPYQdWXFX4hoYnHoVr
	geK5c0WzPZz9dNPz8RTQfEqUjqVCUaqmVn23BJfv93xS9RRX6dGnetwaBNZC+hM+qX6csrIPWfVNQ
	oVgVarEwJSpUnTQwY2I3m7LRgTBlA9/ur7R4mXvLoy5WfrL+XwFdzIBqoAu+O/MEWNbjAcYla6cQd
	ED2Mw+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbNN6-000000047Dm-2S3y;
	Sun, 21 Jun 2026 18:58:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbNN5-000000047Df-2vaJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 18:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92C3B60051;
	Sun, 21 Jun 2026 18:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25FD1F000E9;
	Sun, 21 Jun 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782068298;
	bh=hXDwBGB2+sGiN6W1XVKpTD05/Z92DbH2/IbpKUIVRaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c3cRYvXd7Ag/nvsk/uwFkFafT4XRPst5ltuxZoiXj0qZAn7eAynApMSm6YSglXh+5
	 Q7o9NiuaghYRWx5Z0hkDYjLRGUhy7AVrF03pNBBcN+E5yifsXQ1hTk9TAnV6+e+AhM
	 P7TbJiCpaszksNvuevq0pMWUQ7wKG7+xhiqcLPomGEccJvs8dbA+AjtpqGKjb8A70Q
	 Rx3C2CkD0+CWrSUgFdqTXZO9ceI7AZX7rE4dflH4gOlRtEXw2Y8tO3bcXt34o5jGO3
	 OzcljdlKb0I3xbHNzGcEDrksL3TIaB4UwRyoHYlQbmJVfyG1g+BPFtPDL6AVOyn/0A
	 fSJbNuJDozycQ==
Date: Sun, 21 Jun 2026 19:58:14 +0100
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
Message-ID: <20260621-plywood-straddle-b01f0c45f27c@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
 <20260618-fantasy-estimate-6c52edbc6890@spud>
 <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0zAE9ZWvKbtJb/a"
Content-Disposition: inline
In-Reply-To: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
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


--j0zAE9ZWvKbtJb/a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 08:28:03PM +0300, Stefan D=F6singer wrote:
> Hi Conor,
> Am Donnerstag, 18. Juni 2026, 22:54:53 Ostafrikanische Zeit schrieb Conor=
=20
> Dooley:
>=20
> I think I get the gist of your suggestions. I have a few follow-up questi=
ons=20
> to make sure I understand things right:
>=20
> > I think aux bus makes perfect sense when you have a clock/reset
> > controller, but once you start expanding past that and you have reboot
> > or hwmon or hwspinlock then mfd starts to make sense.
>=20
> At what point does it make sense to move the bindings from bindings/clock=
 to=20
> bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
> prcm.yaml look like clock, reset, misc controllers in mfd/ whereas=20
> ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock +=
 misc=20
> drivers in clock/.

Yeah, to bindings/mfd or bindings/soc/<vendor>. Which I think is mostly
a judgement call. Two of your devices have at least three functions,
which I think is enough to make the claim that it's not just a clock
controller.

> Likewise for the node names: syscon@ or clock-controller@?

If you have syscon in the compatible, then I think it should be syscon
in the node name as it's more general and makes it clear the device
isn't just a clock controller.

> > You'd then have topclock that is a syscon + simple-mfd, matrixclk that =
is
> > a syscon and lsp that's using the aux bus. The topclock and matrixclock
> > would have dedicated and trivial drivers somewhere that have the mfd_ce=
lls
> > and call mfd_add_devices().
>=20
> Do I even need simple-mfd? It seems I can add the syscon-reboot node via=
=20
> mfd_cells too by setting .of_compatible. It seems once it has a driver (e=
ven a=20
> very short one) simple-mfd is misplaced.

If you don't need child nodes in dt, you don't need simple-mfd.
Whether setting of_compatible is a correct thing to do, I do not know,
sorry.

> What about syscon? Topclk needs it for syscon-reboot and the watchdog=20
> controls. For the other two I only want a regmap. Afaiu device_node_to_re=
gmap=20
> works without a "syscon" compatible. There's also regmap_init_mmio, but a=
faics=20
> I only want this when my driver is the only one using the regmap.

If it is a miscellaneous system register region, then it should be a
syscon. These devices that perform multiple functions like hwspinlock,
clocks and resets fit that bill. Whether or not you "need" it for linux to
work, if it is a correct description of your hardware you need to use
that compatible.

>=20
> > Probably the compatibles you've chosen start to make less sense at this
> > point though, but probably "topclk" and "matrixclk" are not what the
> > documentation for this device calls these register regions?
>=20
> Yeah I'll rename them top topcrm / matrixcrm / lspcrm. I just stuck to th=
e old=20
> names for this email.
>=20
> > I think the priority is having something that reflects the hardware
> > accurately, I wouldn't compromise on that just to have the same design
> > for all three drivers.
>=20
> As far as I can see the primary difference between mfd_add_devices and si=
mple-
> mfd + child nodes is that the latter makes the MFD composition visible in=
 the=20
> device tree and the former keeps it a driver implementation detail. My se=
nse=20
> is that the latter is preferred unless a subcomponent of the MFD might be=
=20
> reused in other components - e.g. an ADC is used in PMIC-abc and PMIC-xyz=
 and=20
> thus the driver can be reused as well.

Correct. The other reason for doing it the devicetree way is if there
are conflicting property requirements. E.g. two of the same class of
device, like a pair of pin control functions or devices that use
different #address-cells to one another.



--j0zAE9ZWvKbtJb/a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajg0RQAKCRB4tDGHoIJi
0lkdAQDsejM/fiWAN/LLadnJsGBAoCzGlSSrOtr3A2sg2usvKQEAldF5W8w2SxSO
ZvE0QlZlNZrBlfWBeMTJBFfQDlUn9QI=
=tjft
-----END PGP SIGNATURE-----

--j0zAE9ZWvKbtJb/a--


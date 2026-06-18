Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADD3CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChaR+L+O0umhnKyuHBEkEzYpuHpr3EdQEGRs/zVdoBM=; b=Jnk/ChR2Qy500+5b2jRziM29So
	R/ptQRA3jeQ0yV6FgDoebRJ8b+gn4WiL6dO0waevNn3xsZ9X8MXrtD2itzmSLe495/LchpbaFKDUa
	RYqI1vj9boH4IDxGF4TwQtYyJukrXx3OP1MpCnWXCWBHLhegEHF6k0d69EP5dGIhzwaO/qvsg4nso
	aKljT5jjb057iE/viCESed2LmpYHIacw+NgZvD/eNRv+6iCfEnT95OaUKTmrQA6UuSGwzI0eDpebr
	cI6r6SSiTj2b7VUkHDY+ZDu1aQ8Txw/oyh+5Tb2+62FUqo6wR9WH8/zGmACtTd7V5RsYue9azO0Fk
	ehnC1bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIpH-00000001kuP-26Pc;
	Thu, 18 Jun 2026 19:54:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIpG-00000001kuC-2fM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 19:54:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDB49601E1;
	Thu, 18 Jun 2026 19:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3FA1F000E9;
	Thu, 18 Jun 2026 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781812497;
	bh=ChaR+L+O0umhnKyuHBEkEzYpuHpr3EdQEGRs/zVdoBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iT4lqhEZBafq/H7aa0u623hrpML7qIWjcWt/HcDXEqgusgZjGUp+VgecJq+NeqHDA
	 NEeO6RfCOqRZ2BEc0NygLjUdW+3d5Glkq4iSo+iNnCHfUxayrQX3Z4V6Hl+vqzvoaO
	 zbWP0RQaYgnZXAx6G9VVH1rJRvp/zK65RT90VMuyoSf0gbMzpOsdLTX1GyuYkwUSfk
	 qttZm7kzqUoBZtF5h3hpq2AI0AWGp2TFbAti/fOOzHUU0J/jPJCCPvU7rpGGfjwUWB
	 ZMJGXCQEFlzMgTVf68MJ/aZw5k2npCWf+cRO5qhsrcg7gNyoohJbYy7XHyKShAd3SP
	 SKsVhx96BMEUQ==
Date: Thu, 18 Jun 2026 20:54:53 +0100
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
Message-ID: <20260618-fantasy-estimate-6c52edbc6890@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
 <20260617-deed-snap-4649ffae0e27@spud>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajFBN5mr9y54BNeo"
Content-Disposition: inline
In-Reply-To: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
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


--ajFBN5mr9y54BNeo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 09:59:00PM +0300, Stefan D=F6singer wrote:
> Am Donnerstag, 18. Juni 2026, 00:23:56 Ostafrikanische Zeit schrieben Sie:
>=20
> > Do you actually need an aux bus here though? Since you have to add
> > simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can=
 you
> > set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> > instead?
>=20
> I'll have to read up on devm_mfd_add_devices; The aux bus was the suggest=
ion=20
> of Philipp Zabel. At first sight it sounds to me like they do fairly simi=
lar=20
> things. I don't see any precedence for [devm_]mfd_add_devices in drivers/=
clk/.

I think you don't see it because the driver calling mfd_add_devices()
probably isn't in drivers/clk and probably also uses an mfd_cell for the
clock.
There's some in drivers/soc and some in drivers/mfd (I'll be honest and
admit to not knowing what actually drives the placement of the mfd
driver).

I think aux bus makes perfect sense when you have a clock/reset
controller, but once you start expanding past that and you have reboot
or hwmon or hwspinlock then mfd starts to make sense.

>=20
> Whatever way I go I'd like to use the same for all 3 clock/reset controll=
ers.=20
> So far I only made topclk a simple-mfd. I recently stumbled upon spinlock=
=20
> registers in matrixclk, so I guess I can justify a simple-mfd there too. =
For=20

Just to note, simple-mfd is used when you have child nodes. You don't
need simple-mfd if a device fills multiple roles but doesn't have
children.
Your hwspinlock may not require a child node at all, you can just put
#hwlock-cells into the main node and use mfd_add_devices().

You'd then have topclock that is a syscon + simple-mfd, matrixclk that is
a syscon and lsp that's using the aux bus. The topclock and matrixclock
would have dedicated and trivial drivers somewhere that have the mfd_cells
and call mfd_add_devices(). The fact that topclock would be a simple-mfd
has basically no impact - I think the difference is that topclock will
call of_platform_populate() where matrixclk will not.

Probably the compatibles you've chosen start to make less sense at this
point though, but probably "topclk" and "matrixclk" are not what the
documentation for this device calls these register regions?

> lspclk all I can see is clocks and resets and I ran out of unknown regist=
ers=20
> in there.

I think the priority is having something that reflects the hardware
accurately, I wouldn't compromise on that just to have the same design
for all three drivers.

I guess the problem you have is that the reset driver is shared? You can
always have more than one way to probe a driver. Because I messed up
stuff in the past, reset-mpfs.c has both aux bus and mfd probing in it,
which could serve as an example for how to have both in one file.

--ajFBN5mr9y54BNeo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajRNDAAKCRB4tDGHoIJi
0p7PAP9ZceOwH+gLo8A2ejco8rW2JkGu3DEB1FMmEaUVRfVCJgD9GgBrmaQwHzJj
M6a0Db0Bq9oduGTS1qxc4gkCxlmKrQE=
=P+Eg
-----END PGP SIGNATURE-----

--ajFBN5mr9y54BNeo--


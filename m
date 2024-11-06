Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329EAD59F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GIrb8lH6MtB9ni0oZQC5O1PWk0ZuEvid3uRJD/gFEk=; b=M7PLJhLMqDA1bHjwPK0ckPKmII
	oC+oSeiIEmgxvs+Y0/yr6cHoDU19oS4OLVrV4QBLwCcSXizkVKwU84Spjxn/Xcj6AeFCZXDdCzOdf
	5vF2/kvw1SiSLZGIiIeuYXJx1uo8iwxeLQdg9UTqQC4EJ3H2zoR3b+TjebKflgFYP4YDN2Qu5F6Ps
	gOAER9E6ATZnkgUTwgKsGMUmxnWJM1c1Zwd0WpznteVk4njzXYL/OAAhuj97wdvYAwdezBIqSe+23
	eynEG0McVM6TEPM2W4hlPiZ0Ux4D8kXjJwbxjHXcifKTxlQP8R9/X7KQe0lwuYOnE+NLozRUbDTKX
	7J8c7pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j7q-000000044b8-0J2G;
	Wed, 06 Nov 2024 16:43:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j5Y-000000044Ax-47SD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBEDB5C04CE;
	Wed,  6 Nov 2024 16:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC78C4CEC6;
	Wed,  6 Nov 2024 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730911260;
	bh=/GIrb8lH6MtB9ni0oZQC5O1PWk0ZuEvid3uRJD/gFEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/tDVlPsFSxqrW/jxij2IoAoHIVPLSEYkIWy4w1eFfFs8RoMwmk3WbWBgmUVjitiR
	 kYy7iRQs/rx0N5huEMCFuFRGHgVPtI7vVGbJfPS3N5bBwlcJA+3f02facNV4Y5RjBG
	 o5UbkUB3XNhvFIjFLP0CsZwXriRM66aWfZYgBnRtIc9IgJ7ykIXwD2XPHBNoGbhQk0
	 urJvbUcOaX0rmlSegERf/yG2qsPlR5Fl9OuKadaKKd7O18Q17zVcmszNnzVjeswddX
	 El3xioF32fP6OkqbGaQdE+AqbuyJv92rowbq5itKl41dC3ZvJwaoQVjb3ro9SAgKTa
	 yGUO3AyedBd/A==
Date: Wed, 6 Nov 2024 16:40:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based
 TQMa62xx SOM family and carrier board
Message-ID: <20241106-happy-anything-46f7293f6aca@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <20241104-floral-dexterous-7d3fee2ff616@spud>
 <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
 <20241105-tinsmith-countable-fbb51045bc98@spud>
 <7286141141fe4930cd2581dac7a1fb36a98e62c4.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oJ2Y6Urhi+vkl28I"
Content-Disposition: inline
In-Reply-To: <7286141141fe4930cd2581dac7a1fb36a98e62c4.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_084101_156646_9ED529D6 
X-CRM114-Status: GOOD (  26.48  )
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


--oJ2Y6Urhi+vkl28I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 01:03:08PM +0100, Matthias Schiffer wrote:
> On Tue, 2024-11-05 at 18:55 +0000, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 11:40:20AM +0100, Matthias Schiffer wrote:
> > > On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> > > > On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> > > > > The TQMa62xx is a SoM family with a pluggable connector. The MBa6=
2xx is
> > > > > the matching reference/starterkit carrier board.
> > > >=20
> > > > Why all the wildcards? Why isn't there a compatible per device in t=
he
> > > > family?
>=20
> Because all variants use the same Device Tree. There is also only one com=
patible and one (main) DTSI
> for the AM62 SoC family, which our Device Trees are based on.

So what varies between the members of the family?

> > > For the compatible string we've chosen the TQMa6254 as the representa=
tive for the TQMa62xx family.
> >=20
> > And all the boards in the family are the exact same?
>=20
> There is a single TQMa62xx PCB, which has some AM62 family SoC installed =
(AM6254 in the case of the
> TQMa6254, but all AM62 are possible). TQMa62xx is also the name used for =
marketing when not talking
> about a specific SoC variant:
> https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma62x=
x/
>=20
> Some SoM variants with different RAM/eMMC/SPI-NOR/... do exist, but they =
don't have separate device
> trees (firmware may patch some variant information into the DTB however, =
like the correct RAM size).
>=20
> Choosing one representative for the family including the SoC variant numb=
er, but not distinguishing
> minor variants matches the level of detail used for our other SOMs alread=
y supported by mainline
> Linux (like the TQMa64xxL and various i.MX-based platforms).

I don't like any of this wildcard stuff at all, who is to say that the
next soc you put on your SoM won't be an am62a7, which has a specific
compatible in the kernel? Your fallback then would be ti,am62a7 not
ti,am625. Probably someone will say "that's the am62a family not the
am62 family" - but that exact thing is why I hate all of this
wildcarding. It's barely any more effort to have a tqm6231 and a tqm6254
compatible than what you're doing with wildcard but it is unambiguous.

--oJ2Y6Urhi+vkl28I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyucFgAKCRB4tDGHoIJi
0nTOAP49AhXzVo1rMKvtd3ePJuffEjuHdGlp/GqT6bBrNTGtFwD/eogtLPtuaM+U
fil0gvlsrbgOMKWtdE3BthhK3ZCfvQw=
=yzQZ
-----END PGP SIGNATURE-----

--oJ2Y6Urhi+vkl28I--


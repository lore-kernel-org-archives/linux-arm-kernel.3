Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D47D13C1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrBeDM+ppcoHiPudl8UfdzdUe82B0RRwN1UsSSpRbHM=; b=xtLg2j6ld4RXEr6rNL66DcVDdu
	AvmK2EcxWwEwX+q2htINRp2t3CHrYdL98F6Urt+OL+R3CJzwnBtamDOJQGPphHEzw7TOui/kQkr6H
	bPmKGVUcY7dxwbaXG+lk2U4dthsx92sg7NeNmXc9c14eyEXwNo7YchetlfNDB9+SaRRJ2oPQFviCY
	nhfLTBJf9qtKk51/oiCa+/kfFnCP6K/VDjw0KuzIPA+QAwanQnFF1AJ3EG9ChDmekiOTVQLoYn3Nw
	Re4E6+Z0x9eZ9Lp6MNuCKjnGBJjYwlr/UXS2ayz1cAVHoj//cuS4hgRRpmJ53kMfF2ynLog2z52EA
	kYmsD3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNO6-0000000CgAy-3JAy;
	Mon, 26 Jan 2026 14:16:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNO5-0000000CgAs-2qzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2BA560051;
	Mon, 26 Jan 2026 14:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E8C116C6;
	Mon, 26 Jan 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769436976;
	bh=NrBeDM+ppcoHiPudl8UfdzdUe82B0RRwN1UsSSpRbHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ28naFqf6Fb0vnJXI0iOMnLYrxLxIMuzzmpyiURmwgvXagyhT8gmCwuSBvEZz1h3
	 Xpke0mY4b8zxOrfDRyx7wyLrsbtn9R7kbAhFBapU0nQiDa+h9q4Ysa16z/tlehsIXK
	 VcTArGSh2VPqg5fw45cOJif+nSTbJde3ZRWlibnZ6lbeSNOcA5ee1+HdeVuYjwyvRw
	 e2ZjNtEQLmDLgFU+sJ1SEQs2aNqBn8n5yYZwHvmqjNZ7McX1rc7Hi+V85KR8NeJK+5
	 inDzVP3ser9rIqXbXB0GpzprNzg9I+VsGFEdFTMt7GWO1HYKDJV14vt8OCTHIDYPkD
	 x0grCAfM3kiRg==
Date: Mon, 26 Jan 2026 14:16:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
Message-ID: <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
 <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s592SMWyYy/L1ikc"
Content-Disposition: inline
In-Reply-To: <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
X-Cookie: Haste makes waste.
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


--s592SMWyYy/L1ikc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 11:18:42AM -0500, Frank Li wrote:
> On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
> > the SM coprocessor. Thus, the programming model needs no handle to the
> > GPR node. Make it optional.
>=20
> "programming model" look like software configuration.
>=20
> Thus, GPR is transparent to software and does not need to be described in=
 the
> device tree. Make it optional.

I was expecting a new version of this with Frank's comments rolled in.

--s592SMWyYy/L1ikc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3dykACgkQJNaLcl1U
h9DqHwf/W0vKTs+cwDArItwrD1Pg0wAd6A1I28PNegyipqSgXGweCyLNwcoaTH+k
1BcuFESVQFofoSRYbirsMze6LvUrJc6GfcDfQTu0QvHb30xhBPSCBBfNIlZqL0dk
SZm7EZIDmQl5HEJHs5m/sGRLy5LwlW2MDGPGUwSP4kEcoFOc3is5dNEtGKAKqYRq
UuOkeS5jCYp7idd76Nh6au1HzTV9v0GPzkIRywTJnF5AWpVXTY001TLVf8+InwAu
Yxez+C/UfZ3emSmA+yAiX5mZ9NLFX0iALUvUerax17akjOmgTAHOEr/1WEhRpzLD
Q70Q3FIlKsSfVeFfzrVtY8W0C2fvpg==
=UreY
-----END PGP SIGNATURE-----

--s592SMWyYy/L1ikc--


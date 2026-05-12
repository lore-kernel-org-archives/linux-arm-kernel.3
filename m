Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E73ACD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7X3VU5Fnvb2pw09HJTrXmQN1bStwyMFOJNQ9PHYPPk=; b=SVHo62ON4NUjvQwOXxVH2E9ZPg
	T2aY8W3To2vaUZegQZeZ4jW5+PhmxkRxT2UskOBp0v80eepi0Yvo9bOSXUKkGC0zPAUSHuMnBFZOE
	Jfs6BVEg+KQUaPgVDgwYYu+b1SUHAcSGo01fI5tGCJQOfyjXzPxihGs0Ul89f56c5TD4ALSbKPW+x
	7U/nQLhVPuO7Xq0jCseb7T1iSQI3kz8o3tkQl0YsfcF56BVsuc3uWfSjUc9Xb3bv3zPRJ71fSZAeN
	VbGLFUMInyv2OavAYwdLupwpFaK09cWL3rDT7p3UDf85iPN9MrOhj3QLZpLzHFoR7el706kEJ2iIz
	nXF+p2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqUk-0000000HTCU-06Fu;
	Tue, 12 May 2026 17:02:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqUh-0000000HTBx-3IeV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EB3043A3A;
	Tue, 12 May 2026 17:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223A7C2BCB0;
	Tue, 12 May 2026 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605327;
	bh=t7X3VU5Fnvb2pw09HJTrXmQN1bStwyMFOJNQ9PHYPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/MzrubFmazjOzfMDlG+hsCo4L1k0j/prfntOVYe1FbH37Hc64KCifj8B3Dy3kJ9
	 A4bt+/czHFtKjdWTYKqingjkUCIiLMi0ywHO9H13myTtxkOLUxkFEMRxyJp3324OFl
	 gQ67lYmO6SyrysPM3PXBZ3pr0lZBxbx/E3UlUoaBBij8K+zgiNRW4S55/6bDj46GY6
	 QFXboCTDoBhP+4Em7mHO2UiAjM03ItlsaShcf/l5hstMWGoml9SvCmnrkpRJLUfH98
	 kpA9ltCfE54vRxMqN1TkMx1rSPp2Gfjo4BeO8SBPotMPu1SPNP3zM+KhAwG0ljTiDe
	 gtCCSRV82n3mw==
Date: Tue, 12 May 2026 18:02:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock
 and reset bindings.
Message-ID: <20260512-musket-gaffe-376f0450a610@spud>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
 <20260511-backstage-crewman-e44947ab6cfc@spud>
 <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M3uGp2e5R9ndKlm4"
Content-Disposition: inline
In-Reply-To: <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100207_865477_DA4492BE 
X-CRM114-Status: GOOD (  23.20  )
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


--M3uGp2e5R9ndKlm4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 12:33:42AM +0300, Stefan D=F6singer wrote:
> Hi Conor,
>=20
> Thanks for your reply!
>=20
> > Am 11.05.2026 um 19:07 schrieb Conor Dooley <conor@kernel.org>:
> >=20
> > How come the "matrixclk" has no constraints on clock properties?
>=20
> Because I am not sure what the correct/preferred way to express the inter=
face between top and matrix is - see the first question raised in my cover =
letter.
>=20
> In short, matrix potentially consumes all clocks available on the top con=
troller. There is no obvious interface between them, like there is between =
matrix and LSP. So I see two ways to handle this in the bindings:
>=20
> 1) List the top clk inputs, top clk PLL outputs and PLL fractionals as ma=
trix input
> 2) Be quiet about it

Unless you want to model top + matrix as a single node with two register
regions, then list it all. Hiding the relationships is ill-advised IMO.

>=20
> It'd be about 20 clocks or so that I know are consumed. The bigger issue =
than the number of clocks is that my knowledge of the board is from reverse=
 engineering, not proper datasheets, so I might find out that a clock is mi=
ssing or wrong.
>=20
> > Although, these two devices seem too different to be in the same
> > dt-binding. Do they have anyhting in common other than the SoC they are
> > part of?
>=20
> No, they don't have anything in common, other than that their concerns ar=
e poorly separated in hardware.
>=20
> I take it from your question that the preferred way is to have separate b=
indings for them in this case - I guess separate headers as well as separat=
e yaml files. Is this correct?

Separate headers if you like, separate bindings since the hardware and
binding are completely different between devices.

> The third clock controller - LSP - is nicely separated from the other two=
=2E I would not be surprised to see this subsystem of the board show up on =
a different ZTE board. If top and matrix should have different bindings, LS=
P certainly should as well.

The "two" I was referring to were the two with constraints, so top and
lsp, so that should answer that!


--M3uGp2e5R9ndKlm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNdCgAKCRB4tDGHoIJi
0rCoAQCbIMHm+OHvyUfYu6hMCFpvypMIFKu/WsZo5gklt3xhlwD9FAiVUGWc9Rj/
kCGsAImdqX5V2RKYeMsXRZ5JGRzBNAo=
=/N43
-----END PGP SIGNATURE-----

--M3uGp2e5R9ndKlm4--


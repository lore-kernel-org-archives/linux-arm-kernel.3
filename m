Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6382FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzAKqpVX83Tivx4OizdgS+imdgKRCOVLPlwMEKsHoOA=; b=hh5dEmBnHEPzg/8OTv36AfHwxY
	R36Wp3h4jt8xrF5qV0cO79rDaLDXrd+TdUGhHZZhkoTavBIXthz2EuP02Ee1uKHHyKDJ8gO0LV+BT
	eFFbyr/9v6tFTy17vNITSfxSPUbruNBQ84PVXWcY18EJeSigjYTwuMjSF3ztcfv8sgGyR67P1L5My
	OTVy0lJuYMj1chxu3Xmv9EFB+5B0wA7g9Ihya9wt4S5v7lbP181FaLqvq6p3c37C+sOHGrywsXsYo
	FvsR/ZFFAwfdVmap992SbX7FkV1XVdhbQx4RA/m9VDFqn+In/7gOMk9b85jIJ6GD2nZcpA40uhCVz
	M65DQZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD97j-0000000CoGD-0XpM;
	Sun, 26 Oct 2025 22:22:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD97g-0000000CoFh-41l2;
	Sun, 26 Oct 2025 22:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C434443ED0;
	Sun, 26 Oct 2025 22:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE71BC4CEE7;
	Sun, 26 Oct 2025 22:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761517319;
	bh=shvt/H62MSL/X9zYi3wGfN1JdJm+2GxmIeTsccBYlo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2zin1Z72la3TT+4nnVV6RnFFNATQhk8uw/M8t+PYAw7o+NSpYyuCpvRuMSRaWKXI
	 XYXbsqFUchbqhrAysO8wKh421BTh1cg4zH1cfn6rSf40wnT6bxwkD9IrC9vyAqnnbM
	 LfXHbx54mgn2dTt3DvKyqTFbpJfOe88eAw9ZSGg3tNkLNMlf7OqJALbtqWA3ZkdBpY
	 ORnbXGTC6W46Vwz6Smk4y3je5R3NAyzggsPT88+H4rGKxdvQLu0CxGRwN7VBzKiuZa
	 jiD03wbYxbRyRU4M3Wu8lE34yHP4FLGYU8lRy8QuJb0FA7YyQ7n4R73N+52+sew5UC
	 Oz549dNSfmSWg==
Date: Sun, 26 Oct 2025 22:21:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251026-despise-treadmill-12636f1a476f@spud>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
 <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
 <20251024-think-handwoven-504634ca620d@spud>
 <aPvETBr5aebElQUS@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dhk4ruQsXIYcg54z"
Content-Disposition: inline
In-Reply-To: <aPvETBr5aebElQUS@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_152201_042042_01ED77FD 
X-CRM114-Status: GOOD (  16.50  )
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


--Dhk4ruQsXIYcg54z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 07:24:12PM +0100, Mark Brown wrote:
> On Fri, Oct 24, 2025 at 05:29:31PM +0100, Conor Dooley wrote:
> > On Fri, Oct 24, 2025 at 10:32:13AM +0200, AngeloGioacchino Del Regno wr=
ote:
>=20
> > > +      regulator-allowed-modes:
> > > +        description: |
> > > +          Allowed Buck regulator operating modes allowed. Valid valu=
es below.
>=20
> > > +        minItems: 1
> > > +        maxItems: 3
> > > +        items:
> > > +          enum: [ 0, 1, 2 ]
>=20
> > This property has no default, and the property is not required. Is one
> > of these modes the default, or is there another mode beyond what's here
> > that is used if the property is absent? Or are all modes allowed with no
> > property?
>=20
> The general approach the regulator API takes with everything is that if
> there is no explict configuration then it will simply not touch the
> hardware.  If nothing is configured then the hardware will be left in
> whatever state we found it in which could be anything as far as we know,
> it might vary depending on what was running before and what it was doing.

Okay, thanks for explaining Mark.

--Dhk4ruQsXIYcg54z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP6fAgAKCRB4tDGHoIJi
0n9OAQCobSKgp224TCJ/mWYTt04fs5bxUTVnFJHz1LwZzQH0swEA+rPzYffubTv6
nxvq1BN/kkR//ktv2ykl6VnXkm0CJQ8=
=2u0+
-----END PGP SIGNATURE-----

--Dhk4ruQsXIYcg54z--


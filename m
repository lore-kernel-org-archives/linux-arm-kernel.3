Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F096CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzfRTiznda2/zSaLGXAU5xtnINAnk3MwK1xg9D/9+0U=; b=vT9OvQHW2ljLCPP4IutP60dxKU
	68F1JjrWq8WVTfErltnudDh+IdQH1pOD8J/v9IrMEL5aOUY2l1DSVODoI92UQSQClzOCYlAaZFikg
	ypmLUu9kSI1BQeBSn4zA+KVwRX/G13smu4HknC2kw45jMLufZ8KYnungGGiDlE1iPSp59wMYgYXfh
	k1GJrzY9/flVvIUwHGg7ChH3kA9N4dZfw0q4Skq8tSCuFjCTuTG3M0CB1WlSPKCSWsrjFo6gHTMG0
	X01xY81mqOWPL3HYS/ennS4kAveG6PFCID5f+0IiML4NsvaVCnSA1Dnq0EFCMKXfYcL07lkqPB+7+
	CyOeEgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIpH-0000000GvYc-1poM;
	Tue, 05 May 2026 16:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIpG-0000000GvYA-10S6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 16:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EzfRTiznda2/zSaLGXAU5xtnINAnk3MwK1xg9D/9+0U=; b=aBLYenr61fQ9rNVY3CQCnAbJnS
	3Dh6xplrer90F8HYnv2Qp8mHiZCzunHmBRqTCbFlAGWfHELra7ZAGX1N6PoAGoQjI4YukrInoDc+J
	EhLDl5x7QWnthYtpZDfmcKlyKrVbRDGMtWJpHGPP9S9XQk8+0Y8xnLF5hSKwswnXqHo4kS/zuLapL
	raI0Z0DTdU8KdfFRTqlSDbYWWTCC9l6wW8It5b0hVf9FXskyltyxN2odmqOKdTkmzNEjgdXObpUU7
	aUcZb1NXdfLLHxKuGhAkYDj7BLnMtVKsr/NZZBZs7uUDUNUNVppZsKQdU2rdjAhKsSTlyImA/2HDX
	mC3czTVw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIpD-0000000E49p-1X8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C7174015E;
	Tue,  5 May 2026 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9070C2BCB4;
	Tue,  5 May 2026 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999243;
	bh=E1z3zUjASlOjMOF/OVmtvWChIoR/zl1JNjKXpF8ra/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm9v+PQLtoFdeAaRFUzCvDp2QU590pe2wi5eIc3SWVnzqeYt7WqKkJlDqyU2hEOL5
	 N8fADdKNVRJG5hlWkrN5gP5/MzUOBLK6ywqgNhHi9cGrqUQLnFTLanyCrbRK7dRuHH
	 0LWhJ/cgOpPkrv2zlM7crL5qGmx0vdXzo9cMkl0h4LzITdn5InH6gprA0tUCZBQTj8
	 dy1jjK9W6VQ3ASlHtfk9nq6tAbUI/O+lQKONKD8gEsLIlsefha7xx45MUkfIXk9AhE
	 SbqEDmDaeQbTAWk4RVKHxLxgH3aMqmEOoo2fuLYqJArjtOzh3v4EEnv+fC801N4fFG
	 jn6xfi+y4jQ4g==
Date: Tue, 5 May 2026 17:40:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133
 compatible
Message-ID: <20260505-uncommon-concert-745d52cff0d5@spud>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
 <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
 <20260505-collision-evict-acc27ae41c3a@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X6nW2CY7XUeswqso"
Content-Disposition: inline
In-Reply-To: <20260505-collision-evict-acc27ae41c3a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_174047_638180_517DD714 
X-CRM114-Status: GOOD (  20.25  )
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


--X6nW2CY7XUeswqso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 05:39:09PM +0100, Conor Dooley wrote:
> On Sun, May 03, 2026 at 09:18:37PM +0200, Alexander Sverdlin wrote:
> > Baijie HelperBoard A133 is a development board around their A133 Core
> > board.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index e6443c266fa1..52b42779a283 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,11 @@ properties:
> >            - const: allwinner,ba10-tvbox
> >            - const: allwinner,sun4i-a10
> > =20
> > +      - description: Baijie Helper A133
> > +        items:
> > +          - const: baijie,helper-a133
> > +          - const: allwinner,sun50i-a100
>=20
> Should there additionally be a compatible for the som here?
> Looks like there is a product called the "helperboarda133 core board"
> that is soldered on here but has a separate product page.
>=20
> The dts/dtsi probably should reflect this too?

My wording here was not clear enough, I meant that your dts/dtsi
reflect the fact that there is an independent board deserving a
compatible.

>=20
> > +
> >        - description: BananaPi
> >          items:
> >            - const: lemaker,bananapi
> > --=20
> > 2.53.0
> >=20



--X6nW2CY7XUeswqso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafodhgAKCRB4tDGHoIJi
0vlCAP9mlDenlZNZPTlAWLB5+nXsLVRY5IiD54rPW9vRrzltowEA1jLdjtEpus7C
G7z8lW6c+ZBKnpaXtMI0Gxd8xOsT2ws=
=vwdC
-----END PGP SIGNATURE-----

--X6nW2CY7XUeswqso--


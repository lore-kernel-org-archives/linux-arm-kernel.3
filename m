Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D1C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPz3NbV3f0iRotg9FxW50Zeru4j6uUJ8NgiUcMYc6NA=; b=gwxAhuxXDgEKJ6ef7dFeyAIImz
	lO+M3GZzYh4kG2zPMsBW9oCuPLuvV1oKwRY+YTId8RkR/3do/wdFLsajjk48FLxFg5YPaoaIpBX2c
	0MKtudQW9qWsR4+HHFNHpP9O9y9B26hdyhF3N8ZJ7yZ3gRjYR4Hm2+fS7TFu2lZHLQ6ZezqtP+ll6
	uiOxFzTfpC2IUkBaVSjdsJhv5Okw2pMPzTPZ8qXG0m8jt5YUp8txjYfqufwSjjYAHHp3CVb2CcM3c
	9dy5jeXmm+NtdU1izaaJefp7WV3QNtwnMKpR+mGuVOR4FAFbAle2m8V7/qL9wVFdxEuAPppD2bhdh
	/wAjPvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdC8y-00000007XKm-0X63;
	Wed, 29 Jan 2025 17:46:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdC7a-00000007X6i-0oR7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 953B8A41AD3;
	Wed, 29 Jan 2025 17:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF788C4CED1;
	Wed, 29 Jan 2025 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738172701;
	bh=PCTPxKzIuyr8+qeAeyNw+BMlbBMarwgIFTdJW5hityo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcrXzW7S9xIi3gYU8YTu7+rkgcXdp3792VZkdVAu/q0GNgDP/CCVKhSBdv+5cmEpa
	 CvFnFOlatra1nRkTC18m+PAFaky9L+At334lVFARvXrkhv865xoUGyxXzdh5IJPj9h
	 U7BhxirxRP68hMhtTbNISYwntxJI1o6nsKiXE29oriIRD7vQ6dFcxx+iEBtsaWHyTh
	 9J2CCRgds5x7xonCBAyDTmxBHeTC22rY/ow2Abatb1C2igx1Vx7s5LckXWeR0uWnI2
	 Siujk2tJJ8IhV4SaaufPHtT6VaLZ5zmaHxWSH0h8iMYcxDiaYgIn+V+rV185ejzk7X
	 80zcceoXmHmPg==
Date: Wed, 29 Jan 2025 17:44:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: krzk@kernel.org, alexandre.belloni@bootlin.com, broonie@kernel.org,
	claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: misc: atmel,at91-ssc: Convert to YAML
 format
Message-ID: <20250129-confound-progeny-62b1f12cb03d@spud>
References: <20250129-vagabond-scrupulous-scorpion-b57db9@krzk-bin>
 <20250129132822.9382-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q56Hn0/GZoH2mSPs"
Content-Disposition: inline
In-Reply-To: <20250129132822.9382-1-andrei.simion@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_094502_299566_4B8A8669 
X-CRM114-Status: GOOD (  18.07  )
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


--Q56Hn0/GZoH2mSPs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 03:28:23PM +0200, Andrei Simion wrote:
> Hi,
>=20
> Thank you for the review.
>=20
> I will place this in: Documentation/devicetree/bindings/sound/
> because the SSC it is used only for Audio.
>=20
> >
> > Missing dai-cells. Old binding said 0, now you say anything...
> >
> > Missing required block
> >
> >> +allOf:
> >> +  - $ref: ../sound/dai-common.yaml#
> >
> > Full path, so /schemas/
> >
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - atmel,at91sam9g45-ssc
> >> +    then:
> >> +      required:
> >> +        - compatible
> >> +        - reg
> >> +        - interrupts
> >> +        - dmas
> >> +        - dma-names
> >
> > So only dmas?
> >
> >> +        - clocks
> >> +        - clock-names
> >> +    else:
> >> +      required:
> >> +        - compatible
> >> +        - reg
> >> +        - interrupts
> >> +        - clocks
> >> +        - clock-names
> >
> > Drop entire required:
> >
>=20
> I have a question:
>=20
> 1) The old binding said if "atmel,at91sam9g45-ssc": add dmas and DMA-name=
s to the list:
> 	- compatible, reg, interrupts, clock-names, clocks
>    Why do you ask: "drop entire required"?

The bits that are required in both cases can be set outside the
conditional, so you can do something like

if:
  foo
then:
  required:
    - dmas
    - dma-names

required:
  - compatible
  - reg
  - interrupts
  - clocks
  - clock-names

which I think captures all of what you're trying to do in the quote
above.

>    I intended to set the required through a conditional.
>     case 1) dma transfer
>     case 2) pdc transfer


--Q56Hn0/GZoH2mSPs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5ppGAAKCRB4tDGHoIJi
0i0EAP9UHCIx4jKR1hbQbVx+LhGc9b/jrCpx6jtNgdoaz5kDtQD/QT0ADLpMJ3gV
aNyv3zuMSQCJWY8J9Xah2PjmH06OOQk=
=kyZU
-----END PGP SIGNATURE-----

--Q56Hn0/GZoH2mSPs--


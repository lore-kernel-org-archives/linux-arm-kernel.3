Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC731090235
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65z6Tyqya3VubKpei8i2yaKdRdWgzPDsb6xh4tjKDnk=; b=v6/6xSB9KExzZgR+P65ta8sElW
	R8uvpZKsi9uru4EEq+iSMX0GAOZwoKril0tG6orsIrhRQO1WijwNpVUHm6UlNftHBlVTsr0qsbxxI
	I3wna5Iq9fH54gbyA+FEkJdaa7hts5ZTWi08VV67vCyZPstQoPBXoeUmwiRnW3r+7zpFknIF0sb1o
	nw1tPho1pyJOCfdp//e9mH8o8BeqPhrBFvpnn9dCRBq/hfDV2oi4mU1wDeGaWq3SUFhreVDJIsycJ
	6DIR6jcn5sseeSwXoCElRAUebsv0FGq3lGds/ce/eZk3MAAiMXq3DJtXAmeg/JerDUjtTkVUgQNvA
	32nx/XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EWA-0000000AojT-1x0F;
	Thu, 19 Mar 2026 14:38:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EW8-0000000AojD-3qbA;
	Thu, 19 Mar 2026 14:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4190760054;
	Thu, 19 Mar 2026 14:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF48C19424;
	Thu, 19 Mar 2026 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931112;
	bh=xVDCvmHcqvISvprP7lO7W6ddF7WUVJ7W2Df/HLSX/ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2kuo2AK5XKO3e1cpuhsJqbCb932nj+lOW/XRoTa5IcwOsYufpH27/bdev1IWsa1u
	 06RQxeQl/XeWFQgYAWyGwcW5uMHorjRHwCOYXGGMdK/H0mukpftjtUsvYkwmn3yiAc
	 WYOMz4kGTBIc2VNAKd/AEq7K/U7FFGzBaAY3bVzq/lvRzUn9/3mNktUBWDHKNyClte
	 e/ZljoGXAcB0WQ/oNTRV2y2l47eqZ+AS7p4psAhMwF017vRcEWhUqAk79CkKh1WPMf
	 4aBY8Jhk7/iXZhtfBoeGcrpQQfT8t5vpZ5igasBjHvm57milfLFqCtehtwcTcSAJ4m
	 CuiVgcEZPVTYQ==
Date: Thu, 19 Mar 2026 14:38:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260319-unrobed-simile-1c1393962ff9@spud>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
 <20260318-mumbo-lumber-b550932a5423@spud>
 <d9a9be92-7439-4899-8be2-adf7f0490790@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gs5QsPffFgv1KN45"
Content-Disposition: inline
In-Reply-To: <d9a9be92-7439-4899-8be2-adf7f0490790@collabora.com>
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


--gs5QsPffFgv1KN45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 09:04:06AM +0100, Michael Riesch wrote:
> Hi Conor,
>=20
> On 3/18/26 18:52, Conor Dooley wrote:
> > [...]
> >> =20
> >>    resets:
> >> -    items:
> >> -      - description: ARST
> >> -      - description: HRST
> >> -      - description: DRST
> >> -      - description: PRST
> >> -      - description: IRST
> >> +    minItems: 5
> >> +    maxItems: 9
> >> =20
> >>    reset-names:
> >> -    items:
> >> -      - const: arst
> >> -      - const: hrst
> >> -      - const: drst
> >> -      - const: prst
> >> -      - const: irst
> >> +    minItems: 5
> >> +    maxItems: 9
> >=20
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: rockchip,rk3568-vicap
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 4
> >> +          maxItems: 4
> >=20
> > Anything here that repeats the outermost constraint should be dropped,
> > so no minItems here..
>=20
> I already took a look at similar VICAPs (e.g., R3576) that will have
> more clocks. This is way I left this one in here.
>=20
> But I guess I will remove it and add it again when e.g. RK3576 VICAP
> support is added.
>=20
> >> [...]
> >=20
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: arst
> >> +            - const: hrst
> >> +            - const: drst
> >> +            - const: irst0
> >=20
> > Were you willing to reuse "irst" for the 0th irst, all the repetition
> > wouldn't be needed. I assume it represents the reset for the port at
> > address 0, so it wouldn't even be a different meaning on each device.
>=20
> Not quite I think. "{a,h,d}rst" are the same on all variants, then there
> is "prst" and "irst" on RK3568 and "irst{0-5}" on RK3588. So I thought
> that writing it out explicitly for each variant is more readable (even
> though it may need a few characters more).


Ah right, I didn't see the prst one somehow. Ignore me so.

--gs5QsPffFgv1KN45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwKYQAKCRB4tDGHoIJi
0vI1AP9iqd2CvDCVFRnFVh5XA4+IKjf2bhkzQrjtjDQ4SFrupAEA+VRt+iWztoun
oOwvNknPS9jj2rDN9dV2GlO7x5HP/wU=
=of5J
-----END PGP SIGNATURE-----

--gs5QsPffFgv1KN45--


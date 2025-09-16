Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0107CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qx7YYrgetF4H5quCDzF6vOAKEEG4E6d1i9dKJOKCGKI=; b=sJe2D0z7eYraTEQhpHVaDcMcDH
	EmF+rSFTuC2VpuOevnz0owHGFzOAvPrSvsH+SEbDDoAG5fHQHZ9gk5UIbumiZnLXLA56LNDj0GEQN
	LOhAUvjTm61AszlEouPqRxc9ow8GtFVzdK/+1R6J8RzTPIXkj4OaWE1itdCagWpXGFcpchJ0c1E3u
	wSyGERjnoZ9HMAW3QVggp165ik/phRYZh5zI/hwkHqY6Zkjprs7MCKaZIH0SCQc3X1GomL0mxv4FE
	6lRPiuvX/AOTPK1nP8Nt1vE+nmL+PGvVj5CmQ/J9Vy63mpfO1OMlgVpD6M5AWKuZT/ibXqPqG7A4P
	OL1IUYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybJS-00000008rVr-0QsB;
	Tue, 16 Sep 2025 19:26:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybJP-00000008rUw-1xHb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EAF140B89;
	Tue, 16 Sep 2025 19:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E148DC4CEEB;
	Tue, 16 Sep 2025 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758050759;
	bh=WbKVRAs3Wh+XR5dWt3YMr64WBRPzSYnPFa4jHASnGBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FatPAe+Nj2ETnFOEPGAs4h+A7TEzxfSsUORrtPQperTVyE+gb/CrFO/kzFh3Licr0
	 UPrXS/5YENcxjnnAicEivE5CnZ1ejKoeaaIJvNcNcLnieQkfYhlK+opI0pzLeQP1Ix
	 49qrP4lRMxbXXlFgZwB9WZmpsTS0dSzt6LB0wrTIjpG1cUrZKlH2ohdW711ASfHlzB
	 OABD75atGxGM6lHrs0AdJOVhuvwp0hymPtzETeR9KsAtjD9kP6K/o70fSihY4etXQ2
	 Bp3bH3HjbDy8GiORtNPUnjlWanFfhBlG0WRqCcgRGx7Dzj2hMMW2EaPbXV6IdWKFKI
	 Du9nV0OkVR2kQ==
Date: Tue, 16 Sep 2025 20:25:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250916-auction-angelfish-0239691a54e5@spud>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
 <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
 <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xdjz9h8Dzy3Z31w2"
Content-Disposition: inline
In-Reply-To: <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_122559_545902_A91311ED 
X-CRM114-Status: GOOD (  25.75  )
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


--Xdjz9h8Dzy3Z31w2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 11:55:17AM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 09:53:06PM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > generic description in touchscreen.yaml, this controller maps the
> > provided value to one of four discrete thresholds internally.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v3:
> > - Remove the final part of the description that refers to
> >   implementation details.
> >
> >  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..6214d8be5a99 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,18 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: |
> > +      Unlike the generic property defined in touchscreen.yaml, this
> > +      controller does not allow arbitrary values. Internally the value=
 is
> > +      converted to IPG clock cycles and mapped to one of four discrete
> > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > +
> > +        0: 8191 IPG cycles
> > +        1: 4095 IPG cycles
> > +        2: 2047 IPG cycles
> > +        3: 1023 IPG cycles
> > +
>=20
> You have to use ns here. You can caculate in driver to match to closed on=
e.

That is what he is saying it is doing - "internally the value is
converted to IPG clock cycles" and so on. Your repeated misunderstanding
of this though points out that maybe the description is still lacking?

Dario, how about:
| The gitch threshold in nanoseconds. Drivers must convert this value to
| IPG clock cycles and map it to one of the four discrete thresholds
| exposed by the TSC_DEBUG_MODE2 register:
|=20
|         0: 8191 IPG cycles
|         1: 4095 IPG cycles
|         2: 2047 IPG cycles
|         3: 1023 IPG cycles
?=20
I dropped the bit about arbitrary values, due to my comment on the other
version a few mins ago.

--Xdjz9h8Dzy3Z31w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm5wQAKCRB4tDGHoIJi
0vFUAP4yvJ7JPgJWizlkXSyY13Kiampa5okOCrVuX+Hzqtd9jwD/W4hIs5K7jaew
LxQ8Wc6U2dgRHKf+Px6HcnrGYoPcdwU=
=7jYx
-----END PGP SIGNATURE-----

--Xdjz9h8Dzy3Z31w2--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB195CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L9pBNqP1/a01cLv5B834jjOpt05WIUMXdyt6mXTYsY=; b=4xbvsZ4VTb0iVZuWByGY40jDkn
	g0JxzBDcNZZ1BWMsiCVbMp14B0LQhjD4yEKgc/juWnBPdCwvY2IghLnunhSnDUHvGSW/HxCioOP+6
	A7FukhlNaaqJWmPYqBfcUQvKps9fDkFJEBGD4hLOAzQp7abEmQRMyzz/E03nS/4pgjQwE36f9dgmf
	uER/ByuKlXLe0mZrllFIQxRIlKQx/d2emGS3LsCpqruoVwwgDvuM/lKBoX3+DSah0QgDd0524v7yR
	qbHy8sxTFBfw+TDfNHxzRU6AenBpYSPB3R1ryXxFDChTOXossyBOd19HID+fy2AAh2lSvLFA3DbEW
	mtZcRd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybKe-00000008rhx-1wQ2;
	Tue, 16 Sep 2025 19:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybKc-00000008rhT-2jGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1235D601B3;
	Tue, 16 Sep 2025 19:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966D0C4CEEB;
	Tue, 16 Sep 2025 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758050833;
	bh=SvkZnrjbq/9F17psAbb495EqR7oYJMGmVyT9vm58sw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js4XbzbFp9Re2Q6jO01FPk9zXAX1E8lWkZQajgfn4JESITqYqcKPOwYNeJTNBkgra
	 1OHurdgLt+TY+SkbTWIYwdiITROKwGsy3OuNqVX6DnDJ2c+s2leAYQArIqWzaj23AD
	 bEQePVlxQBWbcF6/udOSI5phoGcDrmSEf92vqw3LbROQTIudGQB95RJQ4vE4rvd0qt
	 mGJo7+qITyjv9/bHBZ+Px+wBhUE80M6+SMIX2vEWGt+gNEZTlkAIhdy6ruvhLTbJ7t
	 5VPfb5c+Ir0YjBSz0zBEdM9r/f7l/NKBg2XOsGwFLofL2bPJ+yI1TinOTh1rOoCpG1
	 6fXs8/60vRhBQ==
Date: Tue, 16 Sep 2025 20:27:08 +0100
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
Message-ID: <20250916-envelope-depict-7c321fe12341@spud>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
 <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
 <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>
 <20250916-auction-angelfish-0239691a54e5@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="up2hkdYrwSZhILqz"
Content-Disposition: inline
In-Reply-To: <20250916-auction-angelfish-0239691a54e5@spud>
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


--up2hkdYrwSZhILqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 08:25:53PM +0100, Conor Dooley wrote:
> On Tue, Sep 16, 2025 at 11:55:17AM -0400, Frank Li wrote:
> > On Mon, Sep 15, 2025 at 09:53:06PM +0200, Dario Binacchi wrote:
> > > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > > generic description in touchscreen.yaml, this controller maps the
> > > provided value to one of four discrete thresholds internally.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > >
> > > ---
> > >
> > > Changes in v3:
> > > - Remove the final part of the description that refers to
> > >   implementation details.
> > >
> > >  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++=
++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,=
imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,i=
mx6ul-tsc.yaml
> > > index 678756ad0f92..6214d8be5a99 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > @@ -62,6 +62,18 @@ properties:
> > >      description: Number of data samples which are averaged for each =
read.
> > >      enum: [ 1, 4, 8, 16, 32 ]
> > >
> > > +  touchscreen-glitch-threshold-ns:
> > > +    description: |
> > > +      Unlike the generic property defined in touchscreen.yaml, this
> > > +      controller does not allow arbitrary values. Internally the val=
ue is
> > > +      converted to IPG clock cycles and mapped to one of four discre=
te
> > > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > > +
> > > +        0: 8191 IPG cycles
> > > +        1: 4095 IPG cycles
> > > +        2: 2047 IPG cycles
> > > +        3: 1023 IPG cycles
> > > +
> >=20
> > You have to use ns here. You can caculate in driver to match to closed =
one.
>=20
> That is what he is saying it is doing - "internally the value is
> converted to IPG clock cycles" and so on. Your repeated misunderstanding
> of this though points out that maybe the description is still lacking?
>=20
> Dario, how about:
> | The gitch threshold in nanoseconds. Drivers must convert this value to

Or maybe instead of what I did here for the first sentence, yoink the text
=66rom [3/6] instead and re-use it.

> | IPG clock cycles and map it to one of the four discrete thresholds
> | exposed by the TSC_DEBUG_MODE2 register:
> |=20
> |         0: 8191 IPG cycles
> |         1: 4095 IPG cycles
> |         2: 2047 IPG cycles
> |         3: 1023 IPG cycles
> ?=20
> I dropped the bit about arbitrary values, due to my comment on the other
> version a few mins ago.



--up2hkdYrwSZhILqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm6DAAKCRB4tDGHoIJi
0r+8AQCh1pvwS8dKmQpDjpCd2rHydQeIys66IYitwQfTMldZQwD/fMpbr0KvyaCW
iM0erGHkx+tSkhIfbPbPTddxQMz+wwM=
=0w/+
-----END PGP SIGNATURE-----

--up2hkdYrwSZhILqz--


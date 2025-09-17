Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53888CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBjunldszJKa9kxkki4ZD0ttlVITk4TPJEcTv+aAIME=; b=04U2TjLvegeT0TpBuEYUHPhJPj
	QeFsv58oT35Bdqcld3hvn+xwmNZAwPT6WEZKKvdKR7OtoG1bt/o8y6yMB0R91xsrwPoCMYNMscpXD
	mU8WzdNLfNZFQf8lEuuX61rykMkLnPhyzjeYW51Wjb8ovw46eCrVzU5CGuiqeqwivDZZ6ZxtvIpTD
	0N5eQA+ljpr1enDB/SKwpa6P87yTN/z29Ki5KvjPeayOdu/7kre9j2iX1wlvvF2G0y2HMJ+pesmrw
	B+CHHUUNuwnE8GJegNpIgTx7E4J2ifSQOvxJL/A5iIVmPFAUGp39B1Rf1KXH6BektBGVZIUa0Q1Ua
	kbEBJgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxnt-0000000EGwT-26Rw;
	Wed, 17 Sep 2025 19:26:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxnr-0000000EGva-3z3Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 285586024D;
	Wed, 17 Sep 2025 19:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9256C4CEE7;
	Wed, 17 Sep 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137214;
	bh=rxQ5P0gTfpf4dmZ7B42QPAmEImAeP2nFA/KifuYjACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMhwH362ygjjwtnqhXiVywzh3oiDjnrB5XKf0gfMFk/qbDnOy0tJhMrLeVNSz0XX1
	 nF/X6JJvntikX0l4b7OuOv8ibCjAfJCW1P/mzjf03kgBw5yyB1Xe9LqCX4tJIrrQhP
	 CCnjdAC0Lwj4DN+Zhc95Puuo6k9iXc/Z5ppMcbB5miUh4+tesHDmssV1vs6JMMjtC1
	 lNhyo4jJGo/wCqrT3pOeG/zRkLc9PKFy8x/WxX+5l8RJMh4wcwDkah8aMz8m2yHyGN
	 9KAIkeZfXV2rUFurIu/vgS94QSZkilL6fF1cVfI7nqawQUtFWDX/rzQSwcDSUSD78B
	 FcmkowUHZpt1g==
Date: Wed, 17 Sep 2025 20:26:49 +0100
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
Subject: Re: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250917-unhidden-foothill-7c103245be1f@spud>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
 <aMrc0GhVbpI38t3L@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WzqRwur55oUj4Vo"
Content-Disposition: inline
In-Reply-To: <aMrc0GhVbpI38t3L@lizhi-Precision-Tower-5810>
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


--1WzqRwur55oUj4Vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 12:07:44PM -0400, Frank Li wrote:
> On Wed, Sep 17, 2025 at 10:05:09AM +0200, Dario Binacchi wrote:
> > Support the touchscreen-glitch-threshold-ns property.
> >
> > Drivers must convert this value to IPG clock cycles and map it to one of
>=20
> binding descript hardware, not drivers. So below sentence should be bette=
r.
>=20
> "TSC only supports the four discrete thresholds, counted by IPG clock cyc=
les.
> See SC_DEBUG_MODE2 register."
>=20
> > the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:
> >
> >   0: 8191 IPG cycles
> >   1: 4095 IPG cycles
> >   2: 2047 IPG cycles
> >   3: 1023 IPG cycles
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v4:
> > - Adjust property description following the suggestions of
> >   Conor Dooley and Frank Li.
> > - Update the commit description.
> >
> > Changes in v3:
> > - Remove the final part of the description that refers to
> >   implementation details.
> >
> >  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..1975f741cf3d 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,20 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  touchscreen-glitch-threshold-ns:
> > +    description: |
> > +      Minimum duration in nanoseconds a signal must remain stable
> > +      to be considered valid.
> > +
> > +      Drivers must convert this value to IPG clock cycles and map
> > +      it to one of the four discrete thresholds exposed by the
> > +      TSC_DEBUG_MODE2 register:
>=20
> same as commit messsage, talk about hardware.

This is fine. It's a generic comment about what must be done with the
property by software that helps people understand how to populate it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> > +        0: 8191 IPG cycles
> > +        1: 4095 IPG cycles
> > +        2: 2047 IPG cycles
> > +        3: 1023 IPG cycles
> > +
>=20
> This case genenerally need enum 4 values, but it relates IPG frequency.
> I have not idea how to restrict it base on clk frequency. May DT mainatai=
ner
> have idea.

I don't see how you really can restrict it based on the frequency of a
clock that can probably be varied at runtime.

--1WzqRwur55oUj4Vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsLeQAKCRB4tDGHoIJi
0lL5AQCLnyauVzJQEzihjVDX0KlDXBi1HSOzSRs+/oAZJqNsBAEA8sAFqz68gVZ5
J9dWazzA8+lZXRKWTAXkUnsZSD9G7Ac=
=6CrS
-----END PGP SIGNATURE-----

--1WzqRwur55oUj4Vo--


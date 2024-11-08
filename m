Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1027D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttAzCbnX8zSCCE2y0jR+XLbXSXexmb54ou6fjpQ0f5c=; b=2h20aqIjXXh8fSZ5VpYfnAUCH1
	kaG0Z7bOp/cO+yUXQexD74/h2IqiyhB/j/dcnFZ6FtJYo6RDj2RsZDw0pkMoi8X23JkvS+b2DP2AX
	B84WNr7U8/ysaU2VTxsZA9TSWpQhxN5OmVpX2cYfyp29ETZm0ejlxUhVumxN9MUuCUHXw7Olb3e4e
	28T6PcCCAyyM2fJ8DxaOBFDNrUt6KSzbYUHkgLtE0FHwUTfiUfUzeYON4sSnR46JEHHQB2p1rduFc
	s3Xzw09fuLnvZO+z8cT5ndLtWJxE4fU0r/uUCk0m5RvMYVYpaDr5Wyk/9CQjw9heynRLZOIhb4Cgk
	Ha9eWUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9T7U-0000000BUcY-2q2p;
	Fri, 08 Nov 2024 17:50:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9T5a-0000000BTkP-0cbz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F19BA5C5D09;
	Fri,  8 Nov 2024 17:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B6BC4CECF;
	Fri,  8 Nov 2024 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731088085;
	bh=1aUgru2o3+ohxnEw3ic1aU0QZvsJMvqqwbA9o6Tjhco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQlw8ioAsLCZR6EGz/lj/mKtMcg0xuyBdUiP8Gt2ouPpGWJmc+4eZB3115pN/YO6d
	 JwZErhkqXOhlI2yZfsMLSWPqXNjdOqA3bBruP7vihKmqQs+Mbt+o3thgLahp/nX4Ay
	 sxLjzvtwI2jQDrB2TpRwIuy8tkiOrYJTMuerD+DxJQssWlr87HbaqI1FrsrJi+iP8D
	 CYq2MEpR6qjH+E92NwbJhYcZDcTot/o0Z1Ye1EuZmCBVXmSZPBhOC89D/321DrB/9Q
	 bbBZ3VkC6+KxlUaeUKL6sXdxRUIvuZwrEKap5gUsAUDzM21g0s/q/NwRKIfIcHnvOn
	 vpC98j+VSXRmw==
Date: Fri, 8 Nov 2024 17:47:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: trivial-devices: Add NXP P3T1085UK
 I3C/I2C temperature sensor
Message-ID: <20241108-deuce-skimpily-a1d2149edd64@spud>
References: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
 <20241107-p3t1085-v1-1-9a76cb85673f@nxp.com>
 <20241108084547.dzmxgdwllwvbiw5n@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7nHnTVEESqYlNb9S"
Content-Disposition: inline
In-Reply-To: <20241108084547.dzmxgdwllwvbiw5n@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_094806_301499_E61A61A0 
X-CRM114-Status: GOOD (  22.28  )
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


--7nHnTVEESqYlNb9S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 09:45:47AM +0100, Marco Felsch wrote:
> On 24-11-07, Frank Li wrote:
> > P3T1085UK is a temperature-to-digital converter with a -40 =B0C to +125=
 =B0C
> > range. The device can be communicated by a controller via the 2-wire se=
rial
> > I3C (up to 12.5 MHz) and I2C (up to 3.4 MHz) interface.
> >=20
> > Add it to trivial-devices.yaml because only one 'reg' and 'interrupts'
> > needs.
> >=20
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/D=
ocumentation/devicetree/bindings/trivial-devices.yaml
> > index 6ecd6432b021b..361943b3d73bc 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -301,6 +301,8 @@ properties:
> >            - national,lm92
> >              # Nuvoton Temperature Sensor
> >            - nuvoton,w83773g
> > +            # NXP I2C/I3C Temperature Sensor (-40 =B0C to +125 =B0C)
> > +          - nxp,p3t1085
>=20
> The description of this binding says:
>=20
> "This is a list of trivial I2C and SPI devices ..."
>=20
> but you add a I2C and I3C device.
>=20
> Also I really like to see that you add a "power-supply" property which
> is most the time missing for such simple devices but always required.

Aye, the done thing in iio land is to make the supplies required too.

--7nHnTVEESqYlNb9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZy5OzwAKCRB4tDGHoIJi
0jokAP9Dkn068XT6Vudin7/GU6TzC36mN4490js3el82D0oMagD+PARCNk+APpU1
AkdWfs0ES1SrzM+YIhQFAXt20uDgCwQ=
=3YSF
-----END PGP SIGNATURE-----

--7nHnTVEESqYlNb9S--


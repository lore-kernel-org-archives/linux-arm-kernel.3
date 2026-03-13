Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BA107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCmb03AT0Z9uOVWvUD6gxDyM9KZ8csF4y3lfbWNQJag=; b=LeqHrcEvwfqIi6nziUCCZ1IqMb
	Zkmoog64SAnPQVfimdQAiG3Os0gGxW0V0Uf86yK6TmeJfW2aRkpSOzzufkfVO56VTE+Ne0JRhcyP2
	igTCtzgXU3+rxHed+9smf2sTcxUI5KKImt0nlTtwc7BrRG7CreI+BBKALo43V1t4cHezOsQyAlyjg
	kb6/GBiUeU7OiSp4plOnvkqpT4z0+wcYGL266ufq91uAQUyr7NcLwXvIPlf5ccZUxFBdH1bgLQrHA
	X1uSz1CHKorSUvYqUkbTH4elWdrSJ6p0rUgjr8DlN5kQpU7SeVeiImGzgsm3cpcCGdvvDpmYf80nn
	cVX4DqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15gv-00000000gce-22mM;
	Fri, 13 Mar 2026 16:48:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15gu-00000000gcX-0SZg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49E8F60142;
	Fri, 13 Mar 2026 16:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4F3C19421;
	Fri, 13 Mar 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773420527;
	bh=OuMawjsTQP6cRs8Og0jene1oaf3BQHmjfu6JPCuI+qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGt6MihzN7ZITGSFxs3kQmaBpJSHcy2h7b/kBGbIrykgGW64Q7NwHNZx8gArniJX2
	 ch1szy2zLk4bRsr9AfJr7SWq5NNNaPcqfx/38ysRBN8TeyhONvikvoYPh0C9CkkrnD
	 acPFQDeVsCcqBHibaSQ/ioWYqfhmsIoO9s5Hrg0qoMa7nnbsCw0qVA4orbGD2YAWOn
	 5Bb+P3DFuBGlHsizaULb+8fPR6gWUjcbLAnfvqm9py5OWuvDihuPCoVmr9vM4+IW16
	 kediO84vA6SEq13UnD617uoU09BD04Lh5fq49icVt0jPiwGrhK4L4pkkhRowMjwobn
	 jFYVArGOWpfHw==
Date: Fri, 13 Mar 2026 16:48:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <de40d5d7-2d2b-46a6-a725-c691005b63bd@sirena.org.uk>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <903bcc13-5b50-462c-8fa8-051f07748127@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JTpyDRd0+0jBU6j/"
Content-Disposition: inline
In-Reply-To: <903bcc13-5b50-462c-8fa8-051f07748127@sirena.org.uk>
X-Cookie: Monitor not included.
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


--JTpyDRd0+0jBU6j/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:32:31PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 04:24:22PM +0000, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > > This series adds initial support for the eSPI controller found on ASP=
EED
> > > AST2600 BMC SoCs.
> > >=20
> > > The series introduces a eSPI controller framework for ASPEED SoCs und=
er
> > > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > > peripheral and flash channels, defines the corresponding devicetree=
=20
> > > binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
> > >=20
> > > The driver is intended to support host-BMC communication over the BMC=
-side
> > > eSPI slave controller present on AST2600 systems.
> >=20
> > This all seems to be in the wrong places entirely, shouldn't an eSPI
> > driver and bindings go in the spi subsystem? FSL's appears to be there.
> > Mark?
>=20
> As documented in submitting-patches.rst please send patches to the=20
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

If this is a driver for SPI hardware it should be under drivers/spi and
use the framework there.

--JTpyDRd0+0jBU6j/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0P+gACgkQJNaLcl1U
h9B1bAgAhjDExdU7nWhBppym32h9JFvlNIdUal4t5ZuJWbf/lg8HFHnKImexzapT
oqN8FEnJdxLhzctp0aZE6FFgGWBc6Qk6Jkv+WoSyp+sS1bLUHjiwJlh4ecwb2cVU
g4WdcDGRRhx1dQSz8TW8oO22pViEYB7Q2FKXQAcZ3LMqPJV74ApRW0tzit+Z4bQd
PIQambqXcdo93X4Q2o+wZVmwFeHbJ5vYIYYfleaW5jYK1qb1ONdAd4L+1L521cyy
M6SeYTGeKJQqoqYRkVZlQ63dxnzWgOtJ3QQ7xppqXAYZTOZPHSiW4T00XlKfpBRT
2CLzUfNjBHHo43MpAzeQghjxjs0t8w==
=Qtsp
-----END PGP SIGNATURE-----

--JTpyDRd0+0jBU6j/--


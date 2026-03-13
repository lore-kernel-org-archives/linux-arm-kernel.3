Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632AD107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDoG6lWL1T3lToH/x6cJPVB9JP2JhQbK4YLDXdEvjis=; b=REQsFuUc1mCwWAkaZd/UR06Sty
	Cz02nUfvx3XqcJPWeCzNZjJg6JX+M86XCbjjztb+UV854vbBVxJZ9MpAtUXZkzRbHc5CBjZGkiwsc
	Y/HcXxVYZtBlLhbgHJPf83yPoygbRJMF5P5KkqJ1SBdMe8gvF4x5vy5k4FHAhC9OxK9soUzTlxPxF
	Sn5pgps6A0mN0hzu0mtyBYabyHqn03/tSzD/V1tkH4k+/Flup2e92YG3QJU09KcFDmc6Hh4+mGsKb
	0v92ls46WHsZJzGtCT3DeMPHDvryjwNuOon5NYVm4PhKATg3JSl+rt3iHQ3uV9qXt2lZqhcECNqJq
	ZxB0WBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15JP-00000000dmq-02Rz;
	Fri, 13 Mar 2026 16:24:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15JL-00000000dmA-4B88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 625CF41AFE;
	Fri, 13 Mar 2026 16:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC9CC19421;
	Fri, 13 Mar 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419067;
	bh=nO2xN0bDN0di6NgmvrvHhZmDL3VlQvUs/UOpTeiuJe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYtH8FoCr6ad2IGGddfsQz/i3/rgc4qD74Qn/NXfwLySdulz3ldgIt7/Iuwmq74as
	 +JcUXGNF78o2C73GYhk/AXAeXOg1QvyMw/Nk0CvB7itIB9K8CWmL/DsF/CC8Sxehsj
	 zFchOBuN4oE5yrqNUUwaFkgpADo4Ok5WUHWdD9Opd57YYyAwQe2mvEBtB8DtPVHaMx
	 FeUfzB1C4DfIBWOcSRIKHbCWvWMuI/la9OwP0z9382xeOFGhbhhVoa/oxvGDIDMOCl
	 86FIfIl01DgJnrhGMYENdeylbCF3WxPqjoQNRTYY+g8lbpjzV6HWwKu4FcnwgeRr7q
	 wT34YX1lhTIJA==
Date: Fri, 13 Mar 2026 16:24:22 +0000
From: Conor Dooley <conor@kernel.org>
To: aspeedyh <yh_chung@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com, broonie@kernel.org
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <20260313-energy-casket-ca8adc1f1fd1@spud>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ri4H3n7qcgGpiS4k"
Content-Disposition: inline
In-Reply-To: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092428_076907_C13A709C 
X-CRM114-Status: GOOD (  17.70  )
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


--Ri4H3n7qcgGpiS4k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> This series adds initial support for the eSPI controller found on ASPEED
> AST2600 BMC SoCs.
>=20
> The series introduces a eSPI controller framework for ASPEED SoCs under
> drivers/soc/aspeed/, adds AST2600-specific controller support for
> peripheral and flash channels, defines the corresponding devicetree=20
> binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
>=20
> The driver is intended to support host-BMC communication over the BMC-side
> eSPI slave controller present on AST2600 systems.

This all seems to be in the wrong places entirely, shouldn't an eSPI
driver and bindings go in the spi subsystem? FSL's appears to be there.
Mark?

>=20
> Patch summary:
> 1. dt-bindings: soc: aspeed: Add AST2600 eSPI controller
> 2. soc: aspeed: Introduce core eSPI controller support
> 3. soc: aspeed: Add AST2600 peripheral channel port I/O support
> 4. soc: aspeed: Add eSPI TAFS backend support
> 5. soc: aspeed: Add espi flash channel support
> 6. soc: aspeed: Add sysfs controls for flash LUN selection
> 7. arm: dts: aspeed: Add eSPI node for AST2600
>=20
> This series has been tested on AST2600 platform with Intel's host eSPI
> controller.
>=20
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>

Unless you're an fanatical employee of Aspeed, I doubt that this signoff
reflects your actual name!

> ---
> aspeedyh (7):
>       dt-bindings: soc: aspeed: Add AST2600 eSPI controller
>       soc: aspeed: Introduce core eSPI controller support
>       soc: aspeed: Add AST2600 peripheral channel port I/O support
>       soc: aspeed: Add eSPI TAFS backend support
>       soc: aspeed: Add eSPI flash channel support
>       soc: aspeed: Add sysfs controls for flash backend selection
>       arm: dts: aspeed: Add eSPI node for AST2600
>=20
>  .../bindings/soc/aspeed/aspeed,ast2600-espi.yaml   |  74 +++
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  11 +
>  drivers/soc/aspeed/Kconfig                         |   7 +
>  drivers/soc/aspeed/Makefile                        |   1 +
>  drivers/soc/aspeed/espi/Makefile                   |   1 +
>  drivers/soc/aspeed/espi/aspeed-espi-comm.h         |  62 +++
>  drivers/soc/aspeed/espi/aspeed-espi.c              | 618 +++++++++++++++=
++++++
>  drivers/soc/aspeed/espi/aspeed-espi.h              |  63 +++
>  drivers/soc/aspeed/espi/ast2600-espi.c             | 304 ++++++++++
>  drivers/soc/aspeed/espi/ast2600-espi.h             | 302 ++++++++++
>  drivers/soc/aspeed/espi/espi_storage.c             | 322 +++++++++++
>  drivers/soc/aspeed/espi/espi_storage.h             |  32 ++
>  12 files changed, 1797 insertions(+)
> ---
> base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
> change-id: 20260313-upstream_espi-d9fea66d1772
>=20
> Best regards,
> --=20
> aspeedyh <yh_chung@aspeedtech.com>
>=20

--Ri4H3n7qcgGpiS4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQ6NgAKCRB4tDGHoIJi
0r9rAQCzRJj+qeLcVgcLte6ZhkBlAd80bAZXjUF47eDDrK5abgD/bQdbCvmv8GKV
PXvZhB78H2Kl0OTJ/ssW+ILpkoWz9Q8=
=dRsP
-----END PGP SIGNATURE-----

--Ri4H3n7qcgGpiS4k--


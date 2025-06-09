Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC51C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUV3cWckHDsNUhYHN8ReHeoAD/0XA4jiSOxJeqYh0BA=; b=DJprN+TFPhYpOYUnllM9zJHqqE
	rESQ6+3jGZJlok57qRdsb+Ciq19HnQ43unt+X6kpaXPjXwAhQm2/dmKvw3GlTzybaJTzkpWw0yLcP
	AZv7okw0yCs54a9rVcl2SulnD6FkbNYlduVk59YRX6uat+/pIX7C82/9cq/6Yel/qtHjES03OqVwt
	H3sqHZGZMMZ4FWcCUSbGLs5bq7Z6xvc9/p8bVrhNnU1I+tWV2qRPn7gC2SQqlRiJr0OxcRpKzHtpX
	1MmaSL5WVRBh83U0jbRoig+5JPP6fhPeIfnxdRsHLiu1AKIcf9x4WMZyQZH6z6Y0Dhuksv+JJbdKO
	jxsz8bXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOi60-000000050lv-3HHx;
	Mon, 09 Jun 2025 19:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfup-00000004ked-2TnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E93084371A;
	Mon,  9 Jun 2025 17:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C22C4CEEB;
	Mon,  9 Jun 2025 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749488646;
	bh=f5pI2UHN8+s/yMkJm1kl6R65sHaQKYgNclTmzYcp7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOnLQMgXQN4VEY/z4Gsg7QRW4+a43c6FGy8VCK0sA6v4OwSUsAEThu37LBnmXqU6y
	 fae0aKwZKa96gUSQniCjV78+h2V2buKgNgMcdyyHAQ6GyBybRrkoNUH5mwGG3/DFDW
	 WHoACyq73Zkbu8AyARmOZwJJNGX5ExnfnDsHlQ3Gok5dtY6jaZGCCI0o53oHmBunto
	 svG/RpBcoGbONHc2n767orlFR61W67kNWZu6P8FPkvSIt5BHJ74dnFrRHVeMpH/esK
	 wo8SHEnSevvPpyB7+E1ayPkrXs8hRiET8W/ZAgmWIE1l2lC5Z6285LGcmLvOh8C6ki
	 Th7CXfhA5dflw==
Date: Mon, 9 Jun 2025 18:04:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250609-helpful-immodest-0f195cdbcbf2@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qN2c0PWcJTDqDL56"
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-4-5278026b7498@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_100407_647714_210AE4EC 
X-CRM114-Status: GOOD (  17.85  )
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


--qN2c0PWcJTDqDL56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Changes in v2:
> - Used generic pmic node name.
> - Add regulator prefix to fixed regulator node name.
> - Add the compatible to omap.yaml binding
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++=
++++++
>  3 files changed, 172 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index c43fa4f4af81..774c13157caa 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -145,6 +145,7 @@ properties:
>        - description: TI bone green variants based on TI AM335
>          items:
>            - enum:
> +              - ti,am335x-bone-green-eco
>                - ti,am335x-bone-green-wireless
>            - const: ti,am335x-bone-green
>            - const: ti,am335x-bone

Why is this hunk here?

--qN2c0PWcJTDqDL56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcUAQAKCRB4tDGHoIJi
0nHcAQDmm/vSthV7u0cRPShkiyiEYLhnJ1c/e0XLct8fqEWuHQD5ATthst+Gc7KE
2683y1k2eOiCjIvKEVH6KWfQEL79XQI=
=5ZBs
-----END PGP SIGNATURE-----

--qN2c0PWcJTDqDL56--


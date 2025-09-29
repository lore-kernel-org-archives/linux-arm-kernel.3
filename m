Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D232DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWfgpvSMnOtmJfliupgiZRAPSotfTF3w3UAfl0SaMvI=; b=cC3vJqJvMb1g/ePlsaQIb7+vJK
	RYinUhYsyW8JxmJigrJdnnl3XbBqox8ssVHRCKlswNZMxvNf5xeTGUs5No8k7nQopTJ/pIYVwXm5b
	/Cp/qtaOyGrY6ZTDdtIxKwwl8kTj8bbAybKA5w7keCEZiJd4QxBDsf54yk+gVuEItX/6XCYi8Mx0d
	9z7phMtclMARJ4ZrvHirCOcImpLXVNMnWOO8cHuSNK+3LiEB8zxOKDUWp8gVkPAqltYTY0mhqqAZt
	vSK/su932qsbewDNnFdmM1HdNfU4lNv3oy+zMQj9n7nE5kcIuulYZCsYN/pDhhBha3oiXn3GRYQCj
	BZOySSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3J8m-00000003Isf-3JGi;
	Mon, 29 Sep 2025 19:02:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3J8l-00000003IsU-49OK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 19:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02C2E626E9;
	Mon, 29 Sep 2025 19:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7A3C4CEF4;
	Mon, 29 Sep 2025 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759172546;
	bh=TaNbswUN7kemg0rLelKfMXHHEoipTDTxzGX1f8BKGBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDVFG/IN27SAeZxCnijPFCEGUtTAWPtheZIEt10N+N2M7hxTLeAnWjPEvtgoi7fgk
	 /ouCWwoxD0OZm5rrVDBvjVFPE3V6+GWmk+SMqjtOzRHPShZ1rVaChBArHMfgrR/S6I
	 Bx9jueC8VXj2KIaRSlACWFWgXPiiyFaivhNS5R4Ia6dD185jVKnR6UfJz+4W2XwDqT
	 yvxPYF353/64Mlsb9nSt10xzd1oToMGW1TfvTle6KKa09zRPXfwTJLSB/fs0OLSGx6
	 GPasGuBwkb4Ma2ZGu1KY4lFFFQj8LemSNATnjU9RwQ69iNf1trEhtSKICG/wkUV9Sh
	 I25CHfr2P1p0A==
Date: Mon, 29 Sep 2025 20:02:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Axiado Reviewers <linux-maintainer@axiado.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add entries for the Axiado SPI DB
 controller
Message-ID: <20250929-cosponsor-flyable-86e17f33dc46@spud>
References: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-0-b0c089c3ba81@axiado.com>
 <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-3-b0c089c3ba81@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPARSlYnkJJMkqR7"
Content-Disposition: inline
In-Reply-To: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-3-b0c089c3ba81@axiado.com>
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


--LPARSlYnkJJMkqR7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 01:58:03AM -0700, Vladimir Moravcevic wrote:
> Add the MAINTAINERS entries for the Axiado SPI DB controller.
>=20
> Acked-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..4fa4b99661b37b161e4326526=
e0c5049cf24691a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4130,6 +4130,16 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>  F:	drivers/pwm/pwm-axi-pwmgen.c
> =20
> +AXIADO SPI DB DRIVER
> +M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
> +M:	Tzu-Hao Wei <twei@axiado.com>

> +R:	Axiado Reviewers <linux-maintainer@axiado.com>

This email address is not fit for purpose. I got a mail from your
postmaster saying:
The group linux-maintainer only accepts messages from people in its organiz=
ation or on its allowed senders list, and your email address isn't on the l=
ist.

I think that's not what you want for a generic public facing handle.

> +L:	linux-spi@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
> +F:	drivers/spi/spi-axiado.c
> +F:	drivers/spi/spi-axiado.h
> +
>  AZ6007 DVB DRIVER
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>=20
> --=20
> 2.25.1
>=20

--LPARSlYnkJJMkqR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrXvgAKCRB4tDGHoIJi
0tSXAP9l9mzgZ6gDtDK9Y5Z4rOXGlZ7igzbY8Dl74s+oqSJt2wD/Y9M5IYmY6DL4
xAPJg06NeH44KujwVSGcfRkL/0SF4wU=
=Q97q
-----END PGP SIGNATURE-----

--LPARSlYnkJJMkqR7--


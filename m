Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taTRrd8ynJiQtg1nEq8mKKLb4b0tfXhztWPfnuT6Mqc=; b=FjvzoQNRfEgc5wxF9iZwsr+Wes
	lVELQ8DdrUixHx8PD+gRLMmhsEzI4Zz+0r9C4aoP94pGZHA3sOoSNQH9yx9Qc6IVdHLfBGFIjd96k
	8xSdbPWORG73NUt3GVo61t02KSuujQHaTROF4sPmFVNMS8HQ+Zi79Be1fh7z44bnAWMcpbD5LvCeU
	RkDc9kF3q+o6sfh07ppKpj4wL5GUttA8GI0DCNuNQ6WDgRcYBIxjAZffBsv05zR62Tvy+5MYJEP/O
	44vI4RwvSZQwQNwwleEX0fiGD2yVqOZz+FY1/6g6Mn6OYTlKBJTLNs3yovWYd1gRCcH2zAKOoEclu
	2PML2csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVfY-000000002i3-3jty;
	Wed, 08 Jul 2026 17:02:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVfX-000000002hv-3iV2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:02:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08FD1600C3;
	Wed,  8 Jul 2026 17:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED481F00A3A;
	Wed,  8 Jul 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783530162;
	bh=taTRrd8ynJiQtg1nEq8mKKLb4b0tfXhztWPfnuT6Mqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g6fa3pWdQrqbNrNqbAyb3VdZQcDkuWY37YF/LQh5mmuh4JWCiANh37z3FMgJKlRyO
	 erwdXh05Ygq6yOW11UGw868GE3duuGvBJn5vwM8k5bC1M+o5MW5YgXTJvmv7wao0GN
	 nSaUDNrv8z3qCKiowiP9WQZQRWwILJeIMvFVFhtN5U9UHF1zV/nKDwWkOZ8ffaaC4+
	 QU+/Y4Eym+aAb0/mrbzVazGlV7qoShEORP8U+WxRtWLidjofDIOD7acqsSZYr0jy7x
	 r4QzmFaJjorL8gsG4JScAcSVraiUbgG1kfHAnQZqz+K0ZOBSv6XUDYi+sI/RipigN/
	 7RTnWhlCvRMpA==
Date: Wed, 8 Jul 2026 18:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, robh@kernel.org,
	krzk+dt@kernel.org, broonie@kernel.org,
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, luka.perkov@sartura.hr
Subject: Re: [PATCH 3/4] spi: atmel-quadspi: add LAN969x QSPI support
Message-ID: <20260708-guide-outing-b471d0dc92c9@spud>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
 <20260708165201.624271-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HaSM35XyRalX3Hcv"
Content-Disposition: inline
In-Reply-To: <20260708165201.624271-3-robert.marko@sartura.hr>
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

--HaSM35XyRalX3Hcv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 06:51:10PM +0200, Robert Marko wrote:
> Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.
>=20
> It requires pad calibration, supports DMA, and supports 100 MHz operation.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

> @@ -1708,7 +1769,10 @@ static const struct of_device_id atmel_qspi_dt_ids=
[] =3D {
>  		.compatible =3D "microchip,sama7d65-qspi",
>  		.data =3D &atmel_sama7d65_qspi_caps,
>  	},
> -
> +	{
> +		.compatible =3D "microchip,lan9691-qspi",

Where is this compatible string documented?

> +		.data =3D &atmel_lan969x_qspi_caps,
> +	},
> =20
>  	{ /* sentinel */ }
>  };
> --=20
> 2.55.0
>=20

--HaSM35XyRalX3Hcv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak6CrgAKCRB4tDGHoIJi
0ko3AP9HSVFq5dJ+A0+8dCRDWOsvo1ptqe3CSfu1QcwdvjOn2wEA3telxRqOywsj
EwpDQ1eAtlU2IMR0ePTgoux3C0RuiQ8=
=UUHj
-----END PGP SIGNATURE-----

--HaSM35XyRalX3Hcv--


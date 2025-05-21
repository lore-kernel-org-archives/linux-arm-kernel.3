Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E41C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2+upy2Ym1DVgGRxAj3zUrzgfpTZD4jg3MX66HQnryw=; b=4mM9jnL2xDodMphCc5WKLmCP4A
	bMks0s4VoWwR+R9qwHTsM991c3/DAsxfOoZuAAQpq45+wlzYjE0aVJ/2hhzX0hCE2yQoIQn0vRpJc
	g9/JdR0mrw8rIS1QsuIJe3WkiV4vLtNsxSfiTfu5jRzASCjigDbUxrBu+gzR8rPifBqjR/UzrfCbc
	Pn0DJPpUgKeGMpPWTcoKKyUWSlNj9j9hwOvZBZkhCFumHmTegkxgggkNRdnpQ6RdKiH2jJxut/XhT
	P5OdRQxru8i1xthokENa8EXz2Fs+XjrA8fKdiZqHt/5Taz/dXCPaYBOWhfPIehwisg9zL/muLX2go
	pknQvfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghf-0000000FSi4-3emV;
	Wed, 21 May 2025 10:29:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfrE-0000000FL1Z-133X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:35:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHfr3-0001Lu-7G; Wed, 21 May 2025 11:35:17 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHfr2-000YAT-34;
	Wed, 21 May 2025 11:35:16 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id F299741679B;
	Wed, 21 May 2025 09:35:15 +0000 (UTC)
Date: Wed, 21 May 2025 11:35:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iltdsbk26xo7g47t"
Content-Disposition: inline
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_023528_286330_BD495A60 
X-CRM114-Status: GOOD (  13.11  )
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


--iltdsbk26xo7g47t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
MIME-Version: 1.0

On 21.05.2025 11:28:22, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM
>  - LCD-TFT controller
>  - CAN

[...]

> +&can0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&can0_pins_a>;
> +	xceiver-supply =3D <&reg_3v3>;

Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
capabilities")), the flexcan driver supports CAN transceivers via the
phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
of it?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--iltdsbk26xo7g47t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgtnlAACgkQDHRl3/mQ
kZxqfwgArcPARaZe5fCyem7ScC0CD03Xge91Id9cL6A9oCHQPIUaTJXStmGpgEPZ
p13vybE5uN1qhF25l4ALMsw76XVtydokAWgZ0/G2+tDVaP2BSfxJ+hwcfRmT4Mcc
n39D3dO/DWz1mFWJenJDMGrc0JUQVENF5ab4ixItQ0UtCb9QWffEv6iRDevafmJl
r+57pk+GzQkvauQLHelULhGlZeWTtfyTXSxUQwzEzXyhBRJ7RTCB3NjQUMvyRfRv
14tMcmQf3/5SzCScR2OaiPDrEUFLxv42y2W8UmU2swha32vvEq33ILw5bBTA+IW8
wKWmSI2jxnFb0dX2cNAoPq+8UYGv6w==
=1fHO
-----END PGP SIGNATURE-----

--iltdsbk26xo7g47t--


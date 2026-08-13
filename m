Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29F0C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJmCPul9jOqQ/QdYG0814B9QmndHxDgtfe+WTkVwZeo=; b=eUxkD7br4p9lUemE2VXiJ/wqkC
	276RcYVmnu7d/j+pr+vA+3Ev/09B0hlDT9ZAWkc5v/I4FWZuofLXiPCOUj774aeGWGJ8ctmlm5ppt
	Fmqh5qfnSstt5xGj3U2RH8IbErlDQPn5HOfvhjbwzEM244GiCnfwcp0bXhkpbVZndxEacjplySadq
	5fiNd3sWjrEBknMRovCJqFNmzwl6MPNzPRSGYRobiIHjqCzqBWCDlbPgKZOUU+TiTuYij1IzKZ3pZ
	4Qve3SB3PCR0gxYxKV3VMlvsY+Hk8dd7uHU7HUuXAGmH7ILSmHy2p1DLxurflOwfbb1Wva7Xkh20T
	HcOiGNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wud3p-00000001eVO-2PFl;
	Thu, 13 Aug 2026 21:34:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wud3o-00000001eVH-13Ki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 21:34:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8833A400FF;
	Thu, 13 Aug 2026 21:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F621F000E9;
	Thu, 13 Aug 2026 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786656839;
	bh=RJmCPul9jOqQ/QdYG0814B9QmndHxDgtfe+WTkVwZeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KS0moFFF0rJITVVbOktfgUKvpVxgrVDDBPYx1NnyUMIWpFA2fym+YrnoXEcAFEC+z
	 Pf6qZgmB1SojQqV3DbqFeyXjVm3MCCfEJc22VTTnCuvZYZlOuCZLCVt2jb8lXEmgn8
	 K0yzSb0lb8xZoJd/DBgG7za2GgvLuiVbnYzA8EGHQfeuFCJ8PN5IJuMiyneA1lrJDv
	 frsXSzCGRjghvcb0q2rCwHNAxPcyzlqCzlkc1mWEvLJyvwTtIpObfbxDQwvPlkC+wk
	 E+O9ST1kdCy8HpOptKG2YW8U3Izp3sprT8kEfqMoDK3FU9a8AbMUwnaogYxRAKykFd
	 35TIr6ysbh9WQ==
Date: Thu, 13 Aug 2026 22:33:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] spi: ma35d1-qspi: Add DTR support
Message-ID: <09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk>
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
 <20260813-perso-ma35d1-upstream-qspi-v1-4-b217b9870eb1@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ofwh2gFKdI85BSw4"
Content-Disposition: inline
In-Reply-To: <20260813-perso-ma35d1-upstream-qspi-v1-4-b217b9870eb1@bootlin.com>
X-Cookie: Immanuel doesn't pun, he Kant.
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


--Ofwh2gFKdI85BSw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:00:24AM +0200, Miquel Raynal wrote:
> The controller has DTR support, a bit must be set for it. The behaviour
> is interesting though, as the speed won't improve when enabled. This is
> because there seems to be an internal divisor (/2) which keeps the rate
> equal when DTR is enabled. As a result, this commit also doubles the
> target bus speed, which in practice does not happen. This way, there is
> a real gain:

> @@ -567,7 +577,8 @@ static int nuvoton_qspi_transfer_one(struct spi_contr=
oller *ctlr,
>  			buswidth =3D 2;
>  	}
> =20
> -	ret =3D nuvoton_qspi_configure_bus(spi, buswidth, dir, xfer->speed_hz);
> +	ret =3D nuvoton_qspi_configure_bus(spi, buswidth, dir, xfer->speed_hz,
> +					 xfer->dtr_mode);
>  	if (ret)
>  		return ret;

This needs ctlr->dtr_caps configuring, otherwise the validation will
block it - only the _mem_caps were updated.

--Ofwh2gFKdI85BSw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+OEIACgkQJNaLcl1U
h9DZ2Af+Nhsdzbp64ywAW88mtOuZ/FvF8klN/5pJZjRQzBM9u/Xw6tkIa1wfMTEa
rubL4TJK2bNU7LG3vghKhkFZ9Z9E1GPYNHOPzQ42E0BWI/T+sCeMQdQKcCHWpiFq
tADVc3oMY8vjymgRSzDU53flhddz6GREVOgoPy+LrRrjktCu84481I8YbMVjZqqh
BXc4yo15EgqxKK/qckLVqpq1bNS133PJrA1xPT5gQSsPfr19uHRs22AGot0Vdd2y
mSchqod0ciOlSQBQ+k9YfiYwpacrPZ9qIm9HJgULjKyk8vu2YZ9m8sK7BVAPSeAE
cH4Wwpf6YPp6rElv0Wzo4CDGbtmTEA==
=mY/B
-----END PGP SIGNATURE-----

--Ofwh2gFKdI85BSw4--


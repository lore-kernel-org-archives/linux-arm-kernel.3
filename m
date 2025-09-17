Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44448CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7cqj/X0KNVpeiU3hYTvr9sDyWfaYpxgWNsG090M5F4=; b=vsWbbq3Oymd1kdLq3HR2ou34Pc
	duAPUAtRm7RBekjiRVqQrqeaZbD05c5jOA4GFkejsS9vNmjPtmHmMXBPJk3SASYnB2qqm5FzOZS/D
	2gkhrfiBZ0H+R3oylzSObAUvRmRTe9iCjaRxIgRypJQ9A612D893upKN56DuGg+3vJiHeQ6PFU9+u
	dGEbigFWdDrBivn9qpBJuU8KtBFEFLbYkPC85R7iIc/zKj+zqmWspPaMFdZcM23CMsdzvhTJCpkeK
	LqWiRXPsUzsvt4GwzpSoENvcomwhbnl1yyq9z0quRTD0zfdqR8VkcvypeHjXf6iALIutCxay9Tvf3
	HlyY2n9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw6M-0000000De7B-1dPo;
	Wed, 17 Sep 2025 17:37:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw6K-0000000De4t-2Fd1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7BBF6024F;
	Wed, 17 Sep 2025 17:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CD8C4CEE7;
	Wed, 17 Sep 2025 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758130671;
	bh=Nc9e3rKn7AvDqrZmBkvvQLRNLGsv2pQ9yUUju53NSAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGSJoUG67pPu+iD0wkjpAQvrDPZG4bI5Xje2GuQujgFKzdTbbKazQvszs+6HPVRVa
	 RE985o8fqc5pcL6alcYf3CgjnjVYFVaYP2iW82kbJG0tJOLv70rc8KhLWqVmAhMaWI
	 ILME6F9GZYsZKmsNrgFp0/mzz6SEKE+5xymxpuAC8KlmVhCucd0ctW7shntHPFsBf2
	 M2sY5/ZvwDINaLts3FOK4MSMCM/+kVfjIJ7ryLGAH3MVueKXi25MtSjrZ4QkJ0cyMc
	 eKmhlK7MZL9neb1K+3/F8ZLhVDSpqhOw9gW1BjJE19Ss9/HDv7TP9t9qVz4yOjDc/8
	 lJzWi0NJxMOPg==
Date: Wed, 17 Sep 2025 18:37:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
Subject: Re: [PATCH 2/2] reset: sparx5: add LAN969x support
Message-ID: <20250917-backfield-saint-98ade84229e5@spud>
References: <20250917111323.60781-1-robert.marko@sartura.hr>
 <20250917111323.60781-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6SpiiCjI9ETMiFu"
Content-Disposition: inline
In-Reply-To: <20250917111323.60781-2-robert.marko@sartura.hr>
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


--w6SpiiCjI9ETMiFu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 01:12:36PM +0200, Robert Marko wrote:
> LAN969x uses the same reset configuration as LAN966x so lets add support
> for it as well.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/reset/Kconfig                  | 2 +-
>  drivers/reset/reset-microchip-sparx5.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..35cb84d1de4e 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -170,7 +170,7 @@ config RESET_LPC18XX
> =20
>  config RESET_MCHP_SPARX5
>  	tristate "Microchip Sparx5 reset driver"
> -	depends on ARCH_SPARX5 || SOC_LAN966 || MCHP_LAN966X_PCI || COMPILE_TEST
> +	depends on ARCH_SPARX5 || ARCH_LAN969X ||SOC_LAN966 || MCHP_LAN966X_PCI=
 || COMPILE_TEST
                                                 ^ missing space here.

>  	default y if SPARX5_SWITCH
>  	select MFD_SYSCON
>  	help
> diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset=
-microchip-sparx5.c
> index 6d3e75b33260..28ad8f1298a0 100644
> --- a/drivers/reset/reset-microchip-sparx5.c
> +++ b/drivers/reset/reset-microchip-sparx5.c
> @@ -198,6 +198,9 @@ static const struct of_device_id mchp_sparx5_reset_of=
_match[] =3D {
>  	}, {
>  		.compatible =3D "microchip,lan966x-switch-reset",
>  		.data =3D &reset_props_lan966x,
> +	}, {
> +		.compatible =3D "microchip,lan969x-switch-reset",
> +		.data =3D &reset_props_lan966x,

These are identically handled, a fallback compatible will suffice.

>  	},
>  	{ }
>  };
> --=20
> 2.51.0
>=20

--w6SpiiCjI9ETMiFu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMrx6gAKCRB4tDGHoIJi
0ovNAQDum1mVIVbOnS+KAAkLu8Ws5eOGjVkudY5FCdxlugHYZAEArSKFvw4nI/zF
Lha1SH2g+lAJrPIvFrwvGSP9W8o+dgk=
=sLGi
-----END PGP SIGNATURE-----

--w6SpiiCjI9ETMiFu--


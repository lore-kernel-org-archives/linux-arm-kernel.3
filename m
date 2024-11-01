Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70573E6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0E1+o9KklYkCgdDIcT62LWuFOm8izq/n4qYQPi18RI=; b=uUNRKmcx0mBOpfpIUxZed2hFkE
	ugE1GMZ5zFR6wRDmxso6tYV1N/kRFSoTar0ls5E4NxtHb1MbKc/x6352NfiJnMBiGEbMVHy6/RxnT
	yG9E48yk7BYhUtCCysCQT7ZeY5VpEQR5zutgqR2viqim1C0uG5nISUVaIDaLbAeKLEqufYN42PyNB
	DVwW6z0DOEI8HzCcf/r+AgJysEtVryYqUm9QBbUHeUBimogvjS2cSQq2JGCjEX32sQmTB1Oo1fkzE
	uXzoq63q4KHQDiO1P+jXODgLew/odk+bQQNpuqa/yweGQlz2TdGigGCVnTdPj1kHDxrYGFSzm3FMn
	URjuM5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pXE-00000006hom-0d9h;
	Fri, 01 Nov 2024 11:09:44 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pVS-00000006hVq-3Q7D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:07:58 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 19FFE1F0004B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  1 Nov 2024 11:07:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BF132A43F39; Fri,  1 Nov 2024 11:07:43 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E3B26A43F31;
	Fri,  1 Nov 2024 11:07:42 +0000 (UTC)
Date: Fri, 1 Nov 2024 12:07:41 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: topology: Allow missing CPU clock-frequency
 device-tree property
Message-ID: <ZyS2fZeIuK2Zuu2l@collins>
References: <20240929181936.644910-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tmqWi9WOi3e6nmMj"
Content-Disposition: inline
In-Reply-To: <20240929181936.644910-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_040755_220141_A527BF9D 
X-CRM114-Status: GOOD (  30.67  )
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


--tmqWi9WOi3e6nmMj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Le Sun 29 Sep 24, 20:19, Paul Kocialkowski a =C3=A9crit :
> Allow the fallback mechanism to continue by assuming the same nominal
> frequency for all CPU cores, while still benefiting from the static
> coefficient provided by the compatible-driven table entries.
> This is similar to what is done in the common arch topology code when
> it fails to find a clock to get the frequency from.

Any thoughts about this patch?

Thanks!

Paul

> The ranging mechanism (using the middle capacity) is unaffected by
> the use of a unit frequency and still returns values in the requested
> range.
>=20
> Also add a comment to clarify what is going on.
>=20
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  arch/arm/kernel/topology.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> index 2336ee2aa44a..0eb743c65166 100644
> --- a/arch/arm/kernel/topology.c
> +++ b/arch/arm/kernel/topology.c
> @@ -119,13 +119,23 @@ static void __init parse_dt_topology(void)
>  		if (cpu_eff->compatible =3D=3D NULL)
>  			continue;
> =20
> +		/*
> +		 * Use the legacy clock-frequency property (representing the
> +		 * maximum achievable clock frequency) as an efficiency
> +		 * coefficient (divided by 2^20, roughly 1 MHz) to the table
> +		 * value. If no such property is available, use the table value
> +		 * directly and assume all CPUs are running at the same
> +		 * nominal frequency.
> +		 *
> +		 * It is assumed that clock-frequency is either provided for all
> +		 * CPUs or for none of them.
> +		 */
>  		rate =3D of_get_property(cn, "clock-frequency", &len);
> -		if (!rate || len !=3D 4) {
> -			pr_err("%pOF missing clock-frequency property\n", cn);
> -			continue;
> -		}
> -
> -		capacity =3D ((be32_to_cpup(rate)) >> 20) * cpu_eff->efficiency;
> +		if (rate && len =3D=3D 4)
> +			capacity =3D ((be32_to_cpup(rate)) >> 20) *
> +				   cpu_eff->efficiency;
> +		else
> +			capacity =3D cpu_eff->efficiency;
> =20
>  		/* Save min capacity of the system */
>  		if (capacity < min_capacity)
> --=20
> 2.46.2
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Specialist in multimedia, graphics and embedded hardware support with Linux.

--tmqWi9WOi3e6nmMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmcktn0ACgkQhP3B6o/u
lQx1VQ/+KVHk6g2TKOPsdPZAVMIpU74SpTvzrGBnWrE5sCRETjuZGnMFGooF8Wcy
iQE8MjM7DlkiDfE660ZK+fJMBosGpjrSAfeuQ+Rpe2O4HBhmffqkQr2TwEKvic//
/0sp9rcUL2nNIK47VPY/imYWN4LDTaOiv6vu02GdZTU3wuQNBmDVZV2gBQbDNuir
NFHOBvyNSTvUwog97wGv10xLywbmyH3cZiqhVrAdGEn5mkGdyFbCED8wpF/F/1fW
8ZKF5/sMtCG0faa7NSSCfJwhxo4hqZ0K18wqcqeuHHt2EWHbXJhCwYMnC/l5Twp7
2+kpsNiCpingYuP7quSwu8VEDCKUAOZgXCdaVQAFOP4Dcyi+WYoGP3hTQMQTcwSj
hzw5wdp3+JHrYHGyD5OYgfsQGC0238XHkxjdfrTVfUWmQWedin1Zrnt9pFzyxI0W
KGum0wmajxsUMLlBX5gT5486g7nrcdvgbUkz1LukCkD+Th+uBcrjhXRopzWFtWj2
hJ3tQT3hXZpGe2/1X4+H0gM+FltHIKNecJS1sCxpNsUP19Jap5ob/qxokrtIIWvI
reol1u1fu7wbrSHNyPOJHML4BZ+HZWBLXzoytQB6XtQhW46kwt4VXu6JdlCdt6QG
4Wx37ggz/4E9mh684Chp+Fj2QlAV5ipAzClSpOVkSn5nrHJhKKE=
=Yiek
-----END PGP SIGNATURE-----

--tmqWi9WOi3e6nmMj--


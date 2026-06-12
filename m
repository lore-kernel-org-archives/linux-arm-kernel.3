Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PuWke7FFlMDn+jfQevh0c+wzNk+yNVgTyF73m6eCa4=; b=prdWfACOlsC8QZzSR2on65PDWe
	NU9Tk2L00FR1PVY+L6eSW//gGGxAVTWkub8gJ+/eEv/6wok15cQjF7EpfMACzkB3nW5cdTnHGRMyT
	xMqHSbSJwiqcjKVf1344jfNKLcBUSiYGEUVAsQscwAkhBMOXCfhGC60C+G7Lk9tAruMqcBb7qU6xd
	Lr71VvtYbPQ3139xWS3IeDUxiy4lhEkR4hbkIRowIVLNLHVWg9s4NAa4aCo686rbBNluhXIr8c2mk
	ZHdMbc+y8jsO2YN6jZdcOzfSR5KW2HyxFlH0IWyWXuRPvs/bLmBFMrbkFJ43pHjfvB8cc+YNa2zB2
	d5FD5TCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzAp-0000000Akv6-3bDC;
	Fri, 12 Jun 2026 10:31:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzAo-0000000Akux-1j5G;
	Fri, 12 Jun 2026 10:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CB7A6001D;
	Fri, 12 Jun 2026 10:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE151F000E9;
	Fri, 12 Jun 2026 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781260297;
	bh=8PuWke7FFlMDn+jfQevh0c+wzNk+yNVgTyF73m6eCa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QOrewn1zgoDVbtWoTJ7H9V3/Lft++X7cdFhtz1ZRHA3NtABIizDv0nVo2aFNiaFkQ
	 RxfCnxatoga9EG+Xwv2bph9r8rdaopdltlRSumcbX28ttWLmoe6vX1VOLRAuzjqXkK
	 9oes5eJtJybHPf3Fqdvn6hT+SLCIPX3QfpATq8HTkMmcI/XmrrrMWUkFbBOGVfC0TZ
	 woW5oHygaqQEMmF98R61yx9h1xoEhB11SJ/AvLx/GazUziXT0cHaOg6Y0VhBd6tTOl
	 R92r47GEpdfk4gIisreHyVdBXKcPxdhZz8ZckDiGuF2VsCHI9Glhg4+VVA97qMiZem
	 vt1o6rtekyCeA==
Date: Fri, 12 Jun 2026 12:31:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix debugfs new-tuple display for IPv4
 ROUTE entries
Message-ID: <aivgB2sduxGr8Do8@lore-desk>
References: <6a2b40ea.4dd82583.3a5c46.e5a2@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YhA8AKR1m+LaXGv3"
Content-Disposition: inline
In-Reply-To: <6a2b40ea.4dd82583.3a5c46.e5a2@mx.google.com>
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


--YhA8AKR1m+LaXGv3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_ppe_debugfs_foe_show(), the second switch statement falls
> through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
> accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
> (3-tuple) entries do not contain a valid new_tuple =E2=80=94 this field i=
s only
> meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
> memory at the new_tuple offset holds routing information, not NAT data,
> so displaying "new=3D" produces garbage output.
>=20
> Split the fallthrough: display new_tuple only for HNAPT and DSLITE, and
> add an explicit empty case for IPV4_ROUTE.
>=20
> Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
> Signed-off-by: Wayen.Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/n=
et/ethernet/airoha/airoha_ppe_debugfs.c
> index 0112c41..f9c12e7 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> @@ -121,8 +121,6 @@ static int airoha_ppe_debugfs_foe_show(struct seq_fil=
e *m, void *private,
>  		case PPE_PKT_TYPE_IPV4_DSLITE:
>  			src_port =3D &hwe->ipv4.new_tuple.src_port;
>  			dest_port =3D &hwe->ipv4.new_tuple.dest_port;
> -			fallthrough;
> -		case PPE_PKT_TYPE_IPV4_ROUTE:
>  			src_addr =3D &hwe->ipv4.new_tuple.src_ip;
>  			dest_addr =3D &hwe->ipv4.new_tuple.dest_ip;
>  			seq_puts(m, " new=3D");
> @@ -130,6 +128,8 @@ static int airoha_ppe_debugfs_foe_show(struct seq_fil=
e *m, void *private,
>  						       src_port, dest_port,
>  						       ipv6);
>  			break;
> +		case PPE_PKT_TYPE_IPV4_ROUTE:

I guess you can just drop PPE_PKT_TYPE_IPV4_ROUTE and use the default case.
Fixing it:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> +			break;
>  		default:
>  			break;
>  		}
> --=20
> 2.51.0
>=20
>=20

--YhA8AKR1m+LaXGv3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaivgBwAKCRA6cBh0uS2t
rB8kAP9zFXxSniNRzojUZXHiJIIs6KwY7rp9mtncD+EW2WI5kgD+PmP/VkboWbVF
DEH8AVCe7Ogjr8qgZ7CbFTyNNK7ceAo=
=b1qZ
-----END PGP SIGNATURE-----

--YhA8AKR1m+LaXGv3--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E77CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LldKNRMDIA0oFHKotBN+p6AKp3pFp9D3fQrq2hH17y8=; b=TB3Rleg2/AKTt2aZGgodXiQmIF
	lzt9nHXQmw2xc9y85BMX9oajHnGI2hlT4TSi3FdGUhdUitC+5ESg5bPBDzQD6lVo+XkkbWs8SnUyX
	0AxO2rhlYUaMrCQtaLmajl+UAzyBJqyEVIQ/oishGrjYe3oiFZpPCHZ7QxhdLFtLgDY2bR3ZpSeH0
	Hm0kqRsF2WdjXUgLrdhPCBqry8hjaQyPyOC6Bn9a1xvlfGm0AZmiu1KBVWpUDGbDs40Rdl2Q56Z/E
	kb5drWSkstfZbGE/g3/0udCJTNOVQgrCrHmZ1+UoEhu2CURsYGTw7bxuxlMShjyuQaI9ccqmnLqHi
	pOI5EVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGoc-00000009M5I-0nsK;
	Fri, 24 Oct 2025 12:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGoa-00000009M4O-04Qr;
	Fri, 24 Oct 2025 12:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FB6941A87;
	Fri, 24 Oct 2025 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89CCC4CEF1;
	Fri, 24 Oct 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761308559;
	bh=qTx04iEbOhzfAAE0oGbIBuQx0pHVs8rGV9hEwJGbdr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZZwMPoI4s/dkfoY7KAucgUs/9klMClinqSNfZ+lPbew2rPPkkTZkcpwCsq4iEwSr
	 GU7a4I/9UE+bWIb3ZWgiZqbskXRY+DfPUO4pAiIyQ+EpAdHUnPcSm1Y/QWWFSN9IlP
	 guli5OJ9WNAF5ENb/zGrkG+J6g3a3A/wufa+MqBAQPQBUL8L/dYoBLjSfQQXNdI9zM
	 6/squULZR4gVKo5ZBftSemMSq8dtlN8GL4P1rTvlq4PB73Lk5u09iQc3iFCvTFhZkS
	 SMOr+80cTM6WlMF86IGL2Lh8Fb+XOz7cfBeljLJyvkQi1u4dVCOvNG2SufSislaEIt
	 ZvOQSGGnuLEEA==
Date: Fri, 24 Oct 2025 14:22:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix a copy and paste bug in probe()
Message-ID: <aPtvi1hwDKOZH3vB@lore-desk>
References: <aPtht6y5DRokn9zv@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azbuYC81tseTLIZm"
Content-Disposition: inline
In-Reply-To: <aPtht6y5DRokn9zv@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_052240_071327_5A1851C0 
X-CRM114-Status: GOOD (  17.03  )
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


--azbuYC81tseTLIZm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This code has a copy and paste bug where it accidentally checks "if (err)"
> instead of checking if "xsi_rsts" is NULL.  Also, as a free bonus, I
> changed the allocation from kzalloc() to  kcalloc() which is a kernel
> hardening measure to protect against integer overflows.
>=20
> Fixes: 5863b4e065e2 ("net: airoha: Add airoha_eth_soc_data struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 8483ea02603e..d0ef64a87396 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2985,11 +2985,11 @@ static int airoha_probe(struct platform_device *p=
dev)
>  		return err;
>  	}
> =20
> -	xsi_rsts =3D devm_kzalloc(eth->dev,
> -				eth->soc->num_xsi_rsts * sizeof(*xsi_rsts),
> +	xsi_rsts =3D devm_kcalloc(eth->dev,
> +				eth->soc->num_xsi_rsts, sizeof(*xsi_rsts),
>  				GFP_KERNEL);
> -	if (err)
> -		return err;
> +	if (!xsi_rsts)
> +		return -ENOMEM;
> =20
>  	eth->xsi_rsts =3D xsi_rsts;
>  	for (i =3D 0; i < eth->soc->num_xsi_rsts; i++)
> --=20
> 2.51.0
>=20

--azbuYC81tseTLIZm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPtviwAKCRA6cBh0uS2t
rPipAP9ULxOBgv2wFtLbEDmV13eMnbOkkxwrAX135INBNPEm7gD/RJ5HNXgRC5fa
73KCPBdoSt5hEOBCmw1Rf7+x2TR7TAM=
=ScI+
-----END PGP SIGNATURE-----

--azbuYC81tseTLIZm--


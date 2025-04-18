Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5027C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h56vrPQ/nJIa9ccgPwJhHOxGDD/RAsTVhLtsO2PTxFg=; b=2Al5OwZ3vhG8+WdcctQWolHfk1
	IFPlei9HQ6girwRKhHphclt/xR1R3nzSyDpIn7YE90uYNVtZOt9YLZdFcvysQzh1wpCaZ2L+peXOv
	KbBPoSarY9sEtLqUMShxnou/9emeR8r1ffEgMK51ZrjPL9ymqoDnhyhVvbKyCKPtdsiBwo9qipxPF
	FJHxzYUkvqUi0S576sVQkXGpjljgTomIQlzTkc7okiGkA/9oZV8+UfZZeosbZowCxWPRETAk6oUij
	mllSVVj2sPLQ8PiG41eHLHFNu9r+5WpFy+NFVnXQ+L0DP1lNSDIwGrMW6NAvZR+1CIBkZSXbb3BeH
	KMM+AQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5krt-0000000G4vJ-0VcE;
	Fri, 18 Apr 2025 12:30:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kpy-0000000G4fg-1FJ0;
	Fri, 18 Apr 2025 12:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FBA05C570B;
	Fri, 18 Apr 2025 12:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A13CC4CEE2;
	Fri, 18 Apr 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744979333;
	bh=ilxE+AXvg/NkPCparHHXLro/i6ZYsW2R0eQyBLPfXW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnDyTiNlnqdqB+YYUT48Fr1Qp0GnOVNXI3DoY3NZIXDNc8WbtLm+ZzimWGBEwldnW
	 fI7Hs6NV6dgz9iey/D8j0ygJwboEOSavL77Nbm0tyY+cZlH5E1CplRnyDP08sePYKU
	 GQHsmzDWam4S0tHJD2sYU7GJs9weHq/viQwuFrD3dLz/L2x9OYZdFSTTt2+IbafwfP
	 otzZHeAV+mvQWkElFaW1d+MWar1i2D7f+9z4n7KvyzKmDjx+7F9igF1di2icH0rZPH
	 J0AXweDYfShtEiL0tCOHd4wHg+4734MErZ8P4Nk8fYPC+J8/8SFF/JsTSZcn1pczMG
	 Q3WBgaUiFkEow==
Date: Fri, 18 Apr 2025 14:28:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] net: airoha: Fix an error handling path in airoha_probe()
Message-ID: <aAJFgqrOFL_xAqtW@lore-desk>
References: <f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y0SBIVyEi97tYwoG"
Content-Disposition: inline
In-Reply-To: <f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_052854_450401_62C6CCC5 
X-CRM114-Status: GOOD (  17.14  )
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


--Y0SBIVyEi97tYwoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If an error occurs after a successful airoha_hw_init() call,
> airoha_ppe_deinit() needs to be called as already done in the remove
> function.
>=20
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 69e523dd4186..252b32ceb064 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2631,6 +2631,8 @@ static int airoha_probe(struct platform_device *pde=
v)
>  		}
>  	}
>  	free_netdev(eth->napi_dev);
> +
> +	airoha_ppe_deinit(eth);
>  	platform_set_drvdata(pdev, NULL);
> =20
>  	return err;
> --=20
> 2.49.0
>=20

Hi Christophe,

I agree we are missing a airoha_ppe_deinit() call in the probe error path,
but we should move it above after stopping the NAPI since if airoha_hw_init=
()
fails we will undo the work done by airoha_ppe_init(). Something like:

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/etherne=
t/airoha/airoha_eth.c
index 16c7896f931f..37d9678798d1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2959,6 +2959,7 @@ static int airoha_probe(struct platform_device *pdev)
 error_napi_stop:
 	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
+	airoha_ppe_init(eth);
 error_hw_cleanup:
 	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_hw_cleanup(&eth->qdma[i]);


Agree?

Regards,
Lorenzo

--Y0SBIVyEi97tYwoG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaAJFggAKCRA6cBh0uS2t
rKOIAQCwH4/D7rA5prRIS5BaxnLlZVf6GSFzAusPqDttCUbOqAD+KQkQkPThXEuJ
VlYdxSyCO8mR3H/2/EGw9Cw368w4iws=
=5A8k
-----END PGP SIGNATURE-----

--Y0SBIVyEi97tYwoG--


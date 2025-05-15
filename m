Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAV66ZKLC52zg4eAOfBqUMhiLnJjm8LP15+LcI7aO2A=; b=Bs7qrNJg/PAhs7SWZWb7pl3fCK
	psSB/DdGVl3b0/FuPW6b5UsX+6C0++841FXSsWbVqDHCj+Pb9tJL+y9tORVJwhCg1848uMtJSeRQc
	qgNLUHYjA/HZLupufE0QIHS3aQ/IIszKXps/Y7JxkumCTu83bZioTwpBO8nTZaH05I1HN093CarnZ
	ARcwOsVtWDXDsqZ2cBMn/mcVWeWEdTRq9BoaxlZrzSsuAFrnt+K51QxkRdg08cPIG2pwn0CMGRndG
	rMDXiZHbKiEnQjYKw3jKNlDmmdIpcl4g+5ZG2y8d/9HI6ggufUT8StBWLiObvfxinY+tQNiVj6c9a
	Er+Hkzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfyr-00000001shU-2Vek;
	Thu, 15 May 2025 21:19:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfwq-00000001sXv-1xAG;
	Thu, 15 May 2025 21:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 584CE434F6;
	Thu, 15 May 2025 21:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C4DC4CEE7;
	Thu, 15 May 2025 21:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343819;
	bh=0fDHksalYNZrl+B7FMp5wCiwKEDzwGLwVf4fzJoGC28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjF51K1EgtuYR8HJm9urywpBzMwwkQvuEdKPydwn1A4Y7b7jzktOUJ+jCqIAC4MAc
	 gNh78FbUVk0RcH4PFxVMc/LvzUIrDjxoGLa1Z8rU8xH0Sr6S7eFJnsTdNlgd2a+CWo
	 tHo2pLoSxCpWwOutmKQLVKJpMK5efRZasD+ymKgAkLIC0VxRRBnY372MZ6oXt1kxKU
	 IUXzWxQ4p1QKxXUNOsMqjsweKBVNYC+6qSJEK2R7pTaoKOff7btzUUTnriec44DK5c
	 bGh/sgQoRn+ZgZ8Ebf1bau5dRq1Gi+Z29B0/rxd8AdD1lvfM6nLqtmnMV9YZoQwNIL
	 +3hZnBiYjlikw==
Date: Thu, 15 May 2025 23:16:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
Message-ID: <aCZZyDvp-TZ7AFwS@lore-desk>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y6AU6u8oigfJDbdP"
Content-Disposition: inline
In-Reply-To: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_141700_522981_A4AE16AC 
X-CRM114-Status: GOOD (  19.28  )
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


--Y6AU6u8oigfJDbdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If register_netdev() fails, the error handling path of the probe will not
> free the memory allocated by the previous airoha_metadata_dst_alloc() call
> because port->dev->reg_state will not be NETREG_REGISTERED.
>=20
> So, an explicit airoha_metadata_dst_free() call is needed in this case to
> avoid a memory leak.
>=20
> Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v3:
>   - None
>=20
> Changes in v2:
>   - New patch
> v2: https://lore.kernel.org/all/5c94b9b3850f7f29ed653e2205325620df28c3ff.=
1746715755.git.christophe.jaillet@wanadoo.fr/
>=20
> Compile tested only.
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 16c7896f931f..af8c4015938c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2873,7 +2873,15 @@ static int airoha_alloc_gdm_port(struct airoha_eth=
 *eth,
>  	if (err)
>  		return err;
> =20
> -	return register_netdev(dev);
> +	err =3D register_netdev(dev);
> +	if (err)
> +		goto free_metadata_dst;
> +
> +	return 0;
> +
> +free_metadata_dst:
> +	airoha_metadata_dst_free(port);
> +	return err;
>  }
> =20
>  static int airoha_probe(struct platform_device *pdev)
> --=20
> 2.49.0
>=20

--Y6AU6u8oigfJDbdP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCZZyAAKCRA6cBh0uS2t
rBnoAP9FaVPF2CbBdrO+fj0pthqLp8g0i6A/AjxSkyZWruuaHwEA5btpiFBZ5imz
5SRZgTQ7PDqOijkGIb8OCvuDLpbXWQo=
=XFmd
-----END PGP SIGNATURE-----

--Y6AU6u8oigfJDbdP--


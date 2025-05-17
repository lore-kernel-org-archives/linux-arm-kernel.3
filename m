Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C21C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuI1n/7GeYYkg/H7oalMATaMATSphN81qwYT2W25Sss=; b=S9m03cFzlBb3n8/LOVHwXFfc5W
	uRUzE24h8KyqmAcbeFWjQZUP6oyf2zJiNheiQYn+6i7HhOaZ0h/iSGulgjIbQtfdVQfu4+7bwKckp
	r9dAXSOqVn9dWAyFvGfaMDk6R2ZMzPO2oY73WDZocW86vexUAPr4GLiHRkCMjBhR4boTD4Z3OGbF2
	EeFmzsq3kOZ8zrHPuJU6kqsRPJID5HIwzAZ5NLNIYSEMeyjKrfUqsFeh3ZzNrXCQ4JTkgT5cdbnXz
	QbKP9B8oqH3Hj+6+/5p4nwd/139MkYruTXrQ3oyc+1DLa+CHVtgUv24mMKB6M63jwWqJGt69BxvL8
	lud6aBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIGv-00000005oJW-2kpl;
	Sat, 17 May 2025 14:12:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIEw-00000005oAh-2m33;
	Sat, 17 May 2025 14:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED2A2614BB;
	Sat, 17 May 2025 14:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C03BC4CEE3;
	Sat, 17 May 2025 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747490983;
	bh=48gpje1b4BnG1wIFcMvNafwZBZ8ZTqpMU6S+ktxIe3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVfKb6TTJXwXCBaJQew8+KCAAimhuUfQw7JNoQO9Bk+k7dDWbZQN94GgbazuugqiW
	 8sd7KLXJfWVQN2J2XJ//t5lWXyg+O83qjik8j9Vgu3UcloRxslI/rEaC/bqXhXODWC
	 jFPinrwCebjOKVnTN4MqWD2y4h18bysTXIJ2mng2XGH4On/IWpxeeBF6noMTnuwXPb
	 p+TLNq3OadfvhX7Tiy9EQDRUj5wktcX3KHYd8k1ZQSRn3LwhYnBpG1uQiW71INvAc1
	 5ToHOdq/A0Nah9mMOkHo17ZBUS3BUnieYmRBwQjKHmQ+4O+QlVaeUycD5MXda2UTcg
	 PJ4TvZ5BZjPJg==
Date: Sat, 17 May 2025 16:09:40 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 4/4] net: airoha: Use dev_err_probe()
Message-ID: <aCiYpEVR6LqimFR9@lore-desk>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <bb64aa1ea0205329c377ad32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvb0gdBYaE0sLUSj"
Content-Disposition: inline
In-Reply-To: <bb64aa1ea0205329c377ad32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
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


--dvb0gdBYaE0sLUSj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Use dev_err_probe() to slightly simplify the code.
> It is less verbose, more informational and makes error logging more
> consistent in the probe.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v3:
>   - None
>=20
> Changes in v2:
>   - New patch
> v2: https://lore.kernel.org/all/1b67aa9ea0245325c3779d32dde46cdf5c232db9.=
1746715755.git.christophe.jaillet@wanadoo.fr/
>=20
> Compile tested only.
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 2335aa59b06f..7404ee894467 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2896,10 +2896,9 @@ static int airoha_probe(struct platform_device *pd=
ev)
>  	eth->dev =3D &pdev->dev;
> =20
>  	err =3D dma_set_mask_and_coherent(eth->dev, DMA_BIT_MASK(32));
> -	if (err) {
> -		dev_err(eth->dev, "failed configuring DMA mask\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(eth->dev, err,
> +				     "failed configuring DMA mask\n");
> =20
>  	eth->fe_regs =3D devm_platform_ioremap_resource_byname(pdev, "fe");
>  	if (IS_ERR(eth->fe_regs))
> @@ -2912,10 +2911,9 @@ static int airoha_probe(struct platform_device *pd=
ev)
>  	err =3D devm_reset_control_bulk_get_exclusive(eth->dev,
>  						    ARRAY_SIZE(eth->rsts),
>  						    eth->rsts);
> -	if (err) {
> -		dev_err(eth->dev, "failed to get bulk reset lines\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(eth->dev, err,
> +				     "failed to get bulk reset lines\n");
> =20
>  	eth->xsi_rsts[0].id =3D "xsi-mac";
>  	eth->xsi_rsts[1].id =3D "hsi0-mac";
> @@ -2925,10 +2923,9 @@ static int airoha_probe(struct platform_device *pd=
ev)
>  	err =3D devm_reset_control_bulk_get_exclusive(eth->dev,
>  						    ARRAY_SIZE(eth->xsi_rsts),
>  						    eth->xsi_rsts);
> -	if (err) {
> -		dev_err(eth->dev, "failed to get bulk xsi reset lines\n");
> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(eth->dev, err,
> +				     "failed to get bulk xsi reset lines\n");
> =20
>  	eth->napi_dev =3D alloc_netdev_dummy(0);
>  	if (!eth->napi_dev)
> --=20
> 2.49.0
>=20

--dvb0gdBYaE0sLUSj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCiYpAAKCRA6cBh0uS2t
rI58AQDtv8x2UkvBiCpjWp7KbOaBbU0fBMA3I7qsMReEFiMcwQEA13VkZJcrcOcB
DbnQXe3XN7duYfNTHnes7v8XvY/uTQg=
=jhMB
-----END PGP SIGNATURE-----

--dvb0gdBYaE0sLUSj--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC08C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1jFAOZWqnPvqQrpLbtRPIq2QakslIbnHdyUCiEUmu4=; b=ne217zUCnAxENXvzISCP3D6wJy
	xDUD0AWxMIi9rxcvprWkCPFq/QRgp/9pDY1z0tjJoIoSpXLAyIOp1taxOtq6fwbAZygUyRGlg1lxz
	hHEyVqsBs/nWjjuzSWVLRTS64SzNwcGD1yMIO6Gcua21EOoD71E35uFqC9gLWBIAECzokTIS1ySVf
	K++oSXADI8tcdxreLGfrsN8VhAyejdX2sn+H3pM2/Q2trHslNfPsgbYdzA1/uHfgCm0pEOidOkaVo
	YlrjV60nP6XlI4tF2DwADFrAR6l+CbLi0WprqOBdHED8fBeZv6+vuTT7iKXtss8gv0NC9nmQI1XNY
	GHuR5FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4B3-00000001IVR-1cK5;
	Thu, 08 May 2025 16:32:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Pg-00000001Ai1-2928;
	Thu, 08 May 2025 15:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E613A629DC;
	Thu,  8 May 2025 15:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B382C4CEE7;
	Thu,  8 May 2025 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746719035;
	bh=T6p70PtHkjOvSfKheTE9RIe/1B7E/b+kxUGvqGGghc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebQTAwBCFZt7fGX2PkSuWO3qgF32hEtffzoI4TppSq3DEI8Minyy7ijI/389xE1E3
	 95j8+WBZ6awF0Md43Vfk/2gNY7LG/uCiueeLWmv5CC0jJDnM/NgHGSfz31D/W18UCq
	 pnwHxx29Gppo/eEutif8PGanh7fmJteJFplJd8tAKshf/L6pWK5SlV++TMdIAC1SXe
	 /YLakK8aREkwqjzmzAK2ACSB61xID0PTyFXBBw4C1K8jFeBqNm/WJTzHkcOYWrwbtA
	 oROnW51xBB/gKvv1GtqwhMSEZ4jYyeiqxR8bRsJvJJOhOgB8d0tNU+vyeKTem60MVs
	 0dsXxwOXAl1TQ==
Date: Thu, 8 May 2025 17:43:53 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 4/4] net: airoha: Use dev_err_probe()
Message-ID: <aBzROQyQ_5oHmYr3@lore-desk>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <1b67aa9ea0245325c3779d32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyhlDYaZG9bgrtv1"
Content-Disposition: inline
In-Reply-To: <1b67aa9ea0245325c3779d32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
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


--cyhlDYaZG9bgrtv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 08, Christophe JAILLET wrote:
> Use dev_err_probe() to slightly simplify the code.
> It is less verbose, more informational and makes error logging more
> consistent in the probe.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - New patch
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

Can dma_set_mask_and_coherent() return -EPROBE_DEFER? The other parts are f=
ine.

Regards,
Lorenzo

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

--cyhlDYaZG9bgrtv1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBzROAAKCRA6cBh0uS2t
rFUMAQDpd0Xn+koxS18cJkCYXHZdZTj2Iyhx4nRlRK9NFE7f9QD/W6UmXacIPR+Y
bxz9OGSYFknzz3Tw588fLCsHr2Ur7QU=
=7evt
-----END PGP SIGNATURE-----

--cyhlDYaZG9bgrtv1--


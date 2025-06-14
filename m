Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37326C71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca1WOPZHrE504k4WoWwvvFcCCh5cthGfyQZRh3sFnss=; b=3tJWfl32NYeUsk589oSDTbSLp1
	e6L89+OslTMHIqciNd/oh/WgvHELKAv0cUGBAnltikAlXfVMriQrjI1EAK35KfyZ0F5J2OqwR6eQ9
	BsNExnaTEQYGI38ljD8rKvlXaRtOKIv95Hf4bdYAudPXEBRnLvVb25WCNoYwAkAWaZglwrjzE/wRa
	nIlCtSvi7iUKKb4BX3pHEagl7h4F6JVu+sWV3zVw3RQzB9Q0bfnZce5RZcL/t0jLRyKjz7AVt9Ini
	H9kKnL80ltFtbUZfqAAATc2o5kX545XK82iAgMy5UMNhnMStNHEdP1jRCXxivY2mNRZdAlkXGVj7w
	/YBtMfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQM5Z-00000000yYC-1DKW;
	Sat, 14 Jun 2025 08:18:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQLdR-00000000w8k-0zLV;
	Sat, 14 Jun 2025 07:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4895D6115D;
	Sat, 14 Jun 2025 07:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C05C4CEEB;
	Sat, 14 Jun 2025 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749887343;
	bh=hK2ZgYosNGPjzPukbx6c+1KX8W5yyH+XoQKnOeQo9Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXdUj6+i9UKbIc+5lo/ULhNd6+o7TktQg34mJ3+Rx9WAN54m5sw1CIrOrsdip3Abs
	 eraOgjOZWna7CSn3lVQ2Pwe0+b6exjMDjsYCwnNcpGQcarWJJ2rZP0L4uCdbQTaLZ8
	 kFT/ZluD9iYBxSvWxKFe8s3m8UxeodalazPX4yDd1UoR3wMoJgrZlZ+0o9fqfjsjFr
	 udtFFunuoaGDzrYCEq6xNa4sGCI4zYqfxu9R/Luax37/6f51jxQdHnJW62d6gDQRsq
	 0fG8KoSz1HcUk3o9FpuBi1m9Y6PFXIY6kYnogtXQIrQG7eyCbwsA68rzI2ISme8TLF
	 NeLlNCm6A4kYw==
Date: Sat, 14 Jun 2025 09:48:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org
Subject: Re: [net-next v1] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aE0pav5c8Ji1Q7br@lore-rh-laptop>
References: <20250613191813.61010-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BsiHWnyDui/cxXyo"
Content-Disposition: inline
In-Reply-To: <20250613191813.61010-1-linux@fw-web.de>
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


--BsiHWnyDui/cxXyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add named interrupts and keep index based fallback for exiting devicetree=
s.
>=20
> Currently only rx and tx IRQs are defined to be used with mt7988, but
> later extended with RSS/LRO support.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 24 +++++++++++++--------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index b76d35069887..fcec5f95685e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5106,17 +5106,23 @@ static int mtk_probe(struct platform_device *pdev)
>  		}
>  	}
> =20
> -	for (i =3D 0; i < 3; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] =3D eth->irq[0];
> -		else
> -			eth->irq[i] =3D platform_get_irq(pdev, i);
> -		if (eth->irq[i] < 0) {
> -			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> -			err =3D -ENXIO;
> -			goto err_wed_exit;
> +	eth->irq[1] =3D platform_get_irq_byname(pdev, "tx");
> +	eth->irq[2] =3D platform_get_irq_byname(pdev, "rx");

Hi Frank,

doing so you are not setting eth->irq[0] for MT7988 devices but it is actua=
lly
used in mtk_add_mac() even for non-MTK_SHARED_INT devices. I guess we can r=
educe
the eth->irq array size to 2 and start from 0 even for the MT7988 case.
What do you think?

Regards,
Lorenzo

> +	if (eth->irq[1] < 0 || eth->irq[2] < 0) {
> +		for (i =3D 0; i < 3; i++) {
> +			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> +				eth->irq[i] =3D eth->irq[0];
> +			else
> +				eth->irq[i] =3D platform_get_irq(pdev, i);
> +
> +			if (eth->irq[i] < 0) {
> +				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> +				err =3D -ENXIO;
> +				goto err_wed_exit;
> +			}
>  		}
>  	}
> +
>  	for (i =3D 0; i < ARRAY_SIZE(eth->clks); i++) {
>  		eth->clks[i] =3D devm_clk_get(eth->dev,
>  					    mtk_clks_source_name[i]);
> --=20
> 2.43.0
>=20

--BsiHWnyDui/cxXyo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaE0pZgAKCRA6cBh0uS2t
rEsYAQC/qq1Dy8AVNZxEa3E1iSwTgFoyhGkr9kvRgiXfnALDaAD/W5KJDTciKWY3
un1QrUhybLW5YPmxfQGgFZXWKUY1fw8=
=emYc
-----END PGP SIGNATURE-----

--BsiHWnyDui/cxXyo--


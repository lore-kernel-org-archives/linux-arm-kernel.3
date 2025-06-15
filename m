Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF4C71150
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqKoouUScBA7iaWbQbL5uQFgdW42OW441ClR0i92hTU=; b=W/fMpjKpSQ9cSNRgWXwEca2UPf
	XGrVEDdH7MmtjYOJta92FWHnNQWFpzyzZcinuOVVm7TTOg0Dzj2W0qvkN7R+rNsyBWlRaFTMRREms
	J8QEO4MkkO5tmJu4BBmEl6gmv+fnhcG6m6JSG46l8fk+BnyukaG/Nv9YXeMqs5VG7+gOBQ3AWPFLT
	tBmWDdxlRmpA14I1UIvTnpPSuru0XOFz+/zG6uFrTP6tNjkjM+9spOP3Guke0R9tJbPj8+8orkDvy
	+nB1/7oc/PJvbjSztHyU2LAKNIPMItHPABoVM2pX2cmbTo+R0RgYWE0ZnkLiUGrOsrSPftzW4zviF
	M9G6ggLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQjGH-00000002O7P-3V4C;
	Sun, 15 Jun 2025 09:02:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQjBE-00000002Nlc-2VNF;
	Sun, 15 Jun 2025 08:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BADB56112A;
	Sun, 15 Jun 2025 08:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C970C4CEE3;
	Sun, 15 Jun 2025 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749977851;
	bh=XMW/lqXWNMbcUk9E/piEVy2xWJc/YGRo2vP3hB8FJ60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvviPQpOtMw4MEHvUt0qzj6HY6/79rnWLl9J5A3MpLEIg3rHzwRhuBgWfXtsc10U1
	 PyhsuyEGbRaWQruzvzjnML/+3aDC0+L+4FnPRJzO0VtDkHW/t3kZQV7w6FbdQgmLV5
	 MpERqyZFO3frPm/EzGfMvR9HRZ0645Getw13/TaTmp3xSXqPvO31N+YrBcN7bxud8L
	 PHE5TDzTW1gjMTuG1jjf2XvYE+D9Et0hq19+u3wXz7lakD8UzC/2l5dkTUFS+XDfJs
	 kYbNIyR1+qPvLjVDrbfwYZf0uexnh1loKybdCe5kaIIqKW4X4sHBaoE9r9nOxoIwtP
	 +bSGLV37+TOvA==
Date: Sun, 15 Jun 2025 10:57:29 +0200
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
	linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aE6K-d0ttAnBzcNg@lore-desk>
References: <20250615084521.32329-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8qaYoOQjgsUS/FJ2"
Content-Disposition: inline
In-Reply-To: <20250615084521.32329-1-linux@fw-web.de>
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


--8qaYoOQjgsUS/FJ2
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
> Reviewed-by: Simon Horman <horms@kernel.org>

Hi Frank,

I guess my comments on v1 apply even in v2. Can you please take a look?

Regards,
Lorenzo

> ---
> v2:
> - move irqs loading part into own helper function
> - reduce indentation
> - place mtk_get_irqs helper before the irq_handler (note for simon)
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 39 +++++++++++++++------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index b76d35069887..81ae8a6fe838 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3337,6 +3337,30 @@ static void mtk_tx_timeout(struct net_device *dev,=
 unsigned int txqueue)
>  	schedule_work(&eth->pending_work);
>  }
> =20
> +static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *et=
h)
> +{
> +	int i;
> +
> +	eth->irq[1] =3D platform_get_irq_byname(pdev, "tx");
> +	eth->irq[2] =3D platform_get_irq_byname(pdev, "rx");
> +	if (eth->irq[1] >=3D 0 && eth->irq[2] >=3D 0)
> +		return 0;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> +			eth->irq[i] =3D eth->irq[0];
> +		else
> +			eth->irq[i] =3D platform_get_irq(pdev, i);
> +
> +		if (eth->irq[i] < 0) {
> +			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t mtk_handle_irq_rx(int irq, void *_eth)
>  {
>  	struct mtk_eth *eth =3D _eth;
> @@ -5106,17 +5130,10 @@ static int mtk_probe(struct platform_device *pdev)
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
> -		}
> -	}
> +	err =3D mtk_get_irqs(pdev, eth);
> +	if (err)
> +		goto err_wed_exit;
> +
>  	for (i =3D 0; i < ARRAY_SIZE(eth->clks); i++) {
>  		eth->clks[i] =3D devm_clk_get(eth->dev,
>  					    mtk_clks_source_name[i]);
> --=20
> 2.43.0
>=20

--8qaYoOQjgsUS/FJ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaE6K+AAKCRA6cBh0uS2t
rNwRAQDkq9MCTzTxXOAWLHs+sF7BDhN3kAkif2BGyov9yxAgfQD1FlVvcQW5j2nn
7M31TOKT1xjgWMBI4z37zNNUD+ihDA==
=CZKz
-----END PGP SIGNATURE-----

--8qaYoOQjgsUS/FJ2--


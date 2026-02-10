Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5EBEA3F28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtXTW7IGCXG3bewc2ZEtlerGZ4w448nsa2fTUZPugL8=; b=NBSotq79dZpU23BBhfn7SRdTEg
	DDMk78jjtGZr5mWicIof5ZHv2fiOeetGSseeoSqnDD5E8VMElyv/WCRYbvRelGz8/GkS9JrN8KuXm
	ACUE+WroIMwE/Y2HXt9AfgHr7yt5ecPDdGRzRaS5CfntS8j20+z7HUalzniGtGTci7OfmEpl0xyF+
	JqvNnB+iiI1CnjDFlnacZR4EM4Sa/2CjGXRz9ntITokPsr4zK3AUuQdE+KyMRJ6mRvzqUFnO4ikJT
	jBLkbFJCNcF88XsEJmj0/KrPLpRpGydocDpu8QYEE6Sr6zbRe06711V8bBRs5q/GONkm9cdtJ02jA
	6wVZG+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjcO-0000000Gilh-3trB;
	Tue, 10 Feb 2026 09:01:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjcH-0000000Gikg-41z5;
	Tue, 10 Feb 2026 09:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DF5643C23;
	Tue, 10 Feb 2026 09:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861AFC116C6;
	Tue, 10 Feb 2026 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770714063;
	bh=1IgCLrreBz/N3YL81SnN8Md7AwrHBpXjhO7OoBiEfuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eoh7RfHs2d/lzXJGMj9r0vsZfjdss7xFmnLeHycQqrYwhzi0IkLaY9ygXkurLITKA
	 OQ5hPL3QvPrjYDAf9fA4xo2WdJwPyjYgepZ8paEZVPm0SR//NdSG3Ab/UnRfeUeoAr
	 pJ1lWDkIxt//QncVLThos3PphGWLFlGwINqm4lF/L4ObuhArMhub6IWTVO7Z4uNBnB
	 jTBBySNPN7ZzrFPxP3DhnTolTyDyp2ubEg6pIki+e49dsalP/pYx9GCetWYq+IzLjs
	 sRra9iC5eLbUN6dAHW47WhkLtuOjr47IEUa+WQnrKYd1wkQzAa+wBgNZsDcRtkw3wZ
	 zJ7LGJgXI0SZQ==
Date: Tue, 10 Feb 2026 10:01:00 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: mtk: wed: Fix dma_free_coherent() size
 mtk_wed_hwrro_free_buffer()
Message-ID: <aYrzzEvl8IG1caxS@lore-desk>
References: <20260209151822.136934-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5gUtC+mBewt4W4cJ"
Content-Disposition: inline
In-Reply-To: <20260209151822.136934-2-fourier.thomas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_010106_042788_B201FF02 
X-CRM114-Status: GOOD (  17.86  )
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


--5gUtC+mBewt4W4cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The DMA buffer alloc'd in mtk_wed_hwrro_buffer_alloc() with size
> dev->wlan.rx_nbuf but is freed with size dev->hw_rro.size.
>=20
> Change the dealloc size to match the one used in
> mtk_wed_hwrro_buffer_alloc().
>=20
> Fixes: 6757d345dd7d ("net: ethernet: mtk_wed: introduce hw_rro support fo=
r MT7988")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethern=
et/mediatek/mtk_wed.c
> index 1ed1f88dd7f8..455df564174d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -879,7 +879,7 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
>  		__free_page(page);
>  	}
> =20
> -	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
> +	dma_free_coherent(dev->hw->dev, dev->wlan.rx_nbuf * sizeof(*desc),
>  			  desc, dev->hw_rro.desc_phys);

I think this problem is present even in the mtk git repo. I guess we should
allocate DMA buffer using dev->hw_rro.size instead of using dev->wlan.rx_nb=
uf
directly.

@Sujuan: any input on it?

Regards,
Lorenzo

> =20
>  free_pagelist:
> --=20
> 2.43.0
>=20

--5gUtC+mBewt4W4cJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaYrzzAAKCRA6cBh0uS2t
rDvzAPkBX1YTfrEpUBYKFlg/hoAY2G+5Paz3zr1hmUyqY94m+AEAyhM0Q8sr8rB8
DSN4g6RwZHsJPkjsBLlo+xDkFDbtFQA=
=DElc
-----END PGP SIGNATURE-----

--5gUtC+mBewt4W4cJ--


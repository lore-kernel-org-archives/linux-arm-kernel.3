Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE53C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YE7rVKkppuVjzkxFH0bH0kbXzu8LKHWY6a+DsEbwnU=; b=s/oomSrpPxTnLFHddo6HzYmA8X
	CffGHiI59b+GouLq1hHHlPjLhvrcyL63MaSoM4c6ElkTXGXkI+R4ahC+xN6/mFcZ5fCdsxYow00w+
	7nC6rzvgGinjLuMhBJ0r4BVdH9OLUGMgTtlum7plAqo/W/YbPnHFNatI/CgGXDxLifS3NUb3gRSuk
	SCzgrrguym93yjf2TGLFotsQqqkghqxTBEd0eOKC0YpHJUHH/nzPx70IFvCtpQNnr8gBLMQNc1LgO
	OH4zLz5wOQHZcAy0fS2+ktmQRKoCOI6iwcCkPvSpS5XC1Sk7YOGHzcRImLLD7EV3rZ9kvrgf+XldI
	UyKiRIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhWR-0000000EPXP-3RV1;
	Sat, 22 Aug 2026 08:56:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhWQ-0000000EPXG-0z7g;
	Sat, 22 Aug 2026 08:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0721841285;
	Sat, 22 Aug 2026 08:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414131F000E9;
	Sat, 22 Aug 2026 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787388972;
	bh=6YE7rVKkppuVjzkxFH0bH0kbXzu8LKHWY6a+DsEbwnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yxb1eeqtycN/SSjtnUdYrw/LYXrdiQnrfclXmZl1EnqW6GnV/H17v80wm01TQKggo
	 z01SZ5rAmYjyRU7i8Ok5QjqSoniTf61ZB7kwT0Bc22PX7yOG+qEm/poEETNZjyo3rE
	 cYHmVXhTAfkpGw44d0pMJek0aOoOf4/kB1sP7PsmKU3UDLfOkzqxiG7wgJzDXyMCsd
	 Mc2Dy7HdPBM1/XuED/DsfudhKBxx9dUas6pXtDUVzCk/Tfknp/MH4Y8mHvVoxqbqUm
	 L94vNphRi/iZp1N3EppGc2txslRVN7iwCXSzi5gNtgE1KP+nZmweePDVWvS6hsVEfm
	 PUupfJ9CtgnWA==
Date: Sat, 22 Aug 2026 10:56:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kuba@kernel.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, yangshiji66@outlook.com
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
Message-ID: <aolkKmwLsvnmG8Td@lore-qca>
References: <20260820085941.380401-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4UCTKtFfDws+VdJ1"
Content-Disposition: inline
In-Reply-To: <20260820085941.380401-1-pawlik.dan@gmail.com>
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

--4UCTKtFfDws+VdJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> leaving the streaming DMA mask at the bus default. On the non-coherent
> EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> after approximately 41 calls when using streaming DMA mappings.
>=20
> Replace dma_set_coherent_mask() with dma_set_mask_and_coherent() to
> set both the streaming and coherent DMA masks, matching standard
> driver practice.
>=20
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buff=
er")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608141=
10017.2795022-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608091=
52813.585797-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608050=
70851.2885888-1-pawlik.dan@gmail.com/
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index b679bed952de..4045d1eb93ea 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -766,7 +766,7 @@ static int airoha_npu_probe(struct platform_device *p=
dev)
>  		npu->irqs[i] =3D irq;
>  	}
> =20
> -	err =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	err =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (err)
>  		return err;
> =20
> --=20
> 2.55.0
>=20

--4UCTKtFfDws+VdJ1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaolkKgAKCRA6cBh0uS2t
rNLJAQClqStH75ruqGvASzQdetMn8Ppz4CPPTVAsMWPo/akT/wD9ECaDg33ScsTK
Dsxo0yNMrKwF78XzKE85XmFCUxf7jw8=
=mecl
-----END PGP SIGNATURE-----

--4UCTKtFfDws+VdJ1--


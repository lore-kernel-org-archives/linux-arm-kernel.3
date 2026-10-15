Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82026CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeSzBwDNP1bLe2YHsb8NqKTNfjCsvy23Eg0OzCMcErs=; b=sIVIEzoQG1GqsUqdihin6ZzbRG
	RXxSDBOGavk1uzmmtFmbrss7v6S+1fzJWYn0tHhLamqV9VrgF2PBPFP1GGwA9mdAWpHkP5rcgMafS
	9qVQQsthBOik567ZZu+V2DFlfyVxJachF9MXj7bmXtiv1XkFyvE3PPRCOPXsqnubqMkvyVLruCuEA
	ZoEP3Gi0SAnMDhqfzDOvLi8hO03B4ElKBegqOMGyTUrtXhdG88NJO3NSvmWbTkK/nO2k7zKhFWzGJ
	vNhgGN+d4kQKvV7IlrJ9xe6gIIvc70myXlHiHri5jQPta7k7BbLR3M5KACE4B0WL7dMj5ELOv00pG
	cBGCr4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMIU-00000000Lbw-3teT;
	Thu, 15 Oct 2026 14:19:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMIS-00000000Lbh-3xzn;
	Thu, 15 Oct 2026 14:19:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52DC46022C;
	Thu, 15 Oct 2026 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821511F000C5;
	Thu, 15 Oct 2026 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073944;
	bh=CeSzBwDNP1bLe2YHsb8NqKTNfjCsvy23Eg0OzCMcErs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ofmvxIX5sFpS2nZjQ3emTsjKbeA08Ybf3LomWAMA3CsTaar+cmLX3XueVahpMtYcH
	 WMCw/oQF7fS1Sb0U4FyUO+HAhNdMddq8U8mAjH0avlpGkBb56o+0JoxcDwfPw9Hi8w
	 /z9I2IrSb9hYzftzMkXcGbx9rqa+RV2p5NQDVFs+KbO5xA/KcNOVIUwVkGrs1nl+qb
	 nwQl79/n9lPdozVJSpDHav3zP9i+CydbsJDi43lhAwIxWVS5kQy/j91BdLtkG67epg
	 35MlKf91qFXiOfPqcUYVfkSGcK3lcwdmORnho8mZtZtcZzbSmrDd5/HZ7RhIRexmwd
	 qREot1TN3cJHQ==
Date: Thu, 15 Oct 2026 16:19:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	"open list:MEDIATEK ETHERNET DRIVER" <netdev@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: Fix dma_unmap_single()
 size
Message-ID: <atDg1UFw9CJpvsxF@lore-desk>
References: <20261015140110.41988-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf2LvNtCjkzeEFGh"
Content-Disposition: inline
In-Reply-To: <20261015140110.41988-2-fourier.thomas@gmail.com>
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

--bf2LvNtCjkzeEFGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In mtk_wed_wo_queue_refill(), the entry->buf is DMA mapped with length
> q->buf_size which saved in entry->len. However, in mtk_wed_wo_dequeue(),
> the same buffer is DMA unmapped with length buf_len which is set to
> SKB_WITH_OVERHEAD(q->buf_size).
>=20
> Change the size to q->buf_size.
>=20
> This was discovered with static analysis and was only compile-tested.
>=20
> Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/eth=
ernet/mediatek/mtk_wed_wo.c
> index 7063c78bd35f..4f720ec53e20 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
> @@ -99,7 +99,6 @@ static void *
>  mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u3=
2 *len,
>  		   bool flush)
>  {
> -	int buf_len =3D SKB_WITH_OVERHEAD(q->buf_size);
>  	int index =3D (q->tail + 1) % q->n_desc;
>  	struct mtk_wed_wo_queue_entry *entry;
>  	struct mtk_wed_wo_queue_desc *desc;
> @@ -123,7 +122,7 @@ mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_=
wed_wo_queue *q, u32 *len,
>  		*len =3D FIELD_GET(MTK_WED_WO_CTL_SD_LEN0,
>  				 le32_to_cpu(READ_ONCE(desc->ctrl)));
>  	if (buf)
> -		dma_unmap_single(wo->hw->dev, entry->addr, buf_len,
> +		dma_unmap_single(wo->hw->dev, entry->addr, q->buf_size,

I guess you can use entry->len here to align with the tx side. Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>  				 DMA_FROM_DEVICE);
>  	entry->buf =3D NULL;
> =20
> --=20
> 2.53.0
>=20

--bf2LvNtCjkzeEFGh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatDg1QAKCRA6cBh0uS2t
rAHDAQCBk2/JP1GlWzVrZmGmNrnZUmPT6fHOUTTZRcN+7YPm+gD9GGJ0a5/HxB8d
rhhirUOm4xPSbbOd9R0UefDOqX6KUwQ=
=PNQo
-----END PGP SIGNATURE-----

--bf2LvNtCjkzeEFGh--


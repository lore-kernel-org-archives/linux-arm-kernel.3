Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E635CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9YBolv+gzQ7HhE0xK39SkRKgHgeZglk5MjU3GOUQ/s=; b=nPC6gCJl8QW2tbSE18SjORgbWw
	ouQqSfdtps5eU5gJ6fbBRobc9u2OOGsYKMgfWdOqhpfn+GzLQ99yIgbIWYRkjlgPDQITnVJPvGceh
	Bs/nPExPnSdeqYLlVOha5W3rIZCBNjomHWAG3WzJTdJAFjHH5INFblncJt9Xj4W3v54/5WjoYX5P2
	+odD1n5Oq4tLdAlu0sBUoCJ61n+HmwCsTK2bloeoirTZD92duTBI231u61dvkzgGLHBix/Ug+9d+j
	K1OoaagswvRsqVL9qew64OKnDXdmFf2fLI+1CDvHbN2mF3bmlkP2sF6WPxoz0lngwW8FJOpLKsg5T
	TkwOHaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkEU-0000000Glnu-0TZD;
	Wed, 17 Jun 2026 06:58:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkES-0000000Glnd-1PwJ;
	Wed, 17 Jun 2026 06:58:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE0FD416B5;
	Wed, 17 Jun 2026 06:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C171F000E9;
	Wed, 17 Jun 2026 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679519;
	bh=n9YBolv+gzQ7HhE0xK39SkRKgHgeZglk5MjU3GOUQ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D6dXz3bbM8MjoqY3y3YE07w2Xj698HV93s818L5A1a0vkH+TL/F/m3W2SKgwkljwB
	 SgfDtQ0jtNCs6UYRSrrLT5MKTeZ3CPwgzJPr5k8Z1fllD/ny0i2UN2XG6yn0/dIYMD
	 vG9EqTLnoA8MJJXgaAE0UYK2tXMcll9D0OdkDJUdyEpeAGSsyqBAKrAYw0bKKMMy2l
	 inTOMJE/C3Nj4Rf8VKsYSkHAPLjWvZoVP2h3Ar1gFS6XPsnO+A8GfE3jvwyY+KbOgS
	 ju6P40Q2NhJLmDdGZcAUmhHYX/VXh1EwgyazuxQnoGFc7hOh47a+n8R0wDj5KpCqhK
	 7B1ffH4O+r8Sw==
Date: Wed, 17 Jun 2026 08:58:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_ppe: Fix rhashtable leak in
 mtk_ppe_init error paths
Message-ID: <ajJFnBsnyoSeKl1D@lore-desk>
References: <178167550101.2217645.14579307712717502425@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NDJ4ufy8ArQzYca"
Content-Disposition: inline
In-Reply-To: <178167550101.2217645.14579307712717502425@gmail.com>
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


--8NDJ4ufy8ArQzYca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In mtk_ppe_init(), when accounting is enabled, the error paths for
> dmam_alloc_coherent(mib) and devm_kzalloc(acct) failures return NULL
> directly, bypassing the err_free_l2_flows label that destroys the
> rhashtable initialized earlier.
>=20
> While this leak only occurs during probe (not runtime) and the leaked
> memory is minimal (an empty rhash table), fixing it ensures proper
> error path cleanup consistency.
>=20
> Fix by changing the two return NULL statements to goto err_free_l2_flows.
>=20
> Fixes: 603ea5e7ffa7 ("net: ethernet: mtk_eth_soc: fix memory leak in erro=
r path")
> Signed-off-by: Wayen Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethern=
et/mediatek/mtk_ppe.c
> index 18279e2a70..8451dc3fd0 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -918,7 +918,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, voi=
d __iomem *base, int index)
>  		mib =3D dmam_alloc_coherent(ppe->dev, MTK_PPE_ENTRIES * sizeof(*mib),
>  					  &ppe->mib_phys, GFP_KERNEL);
>  		if (!mib)
> -			return NULL;
> +			goto err_free_l2_flows;
> =20
>  		ppe->mib_table =3D mib;
> =20
> @@ -926,7 +926,7 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, voi=
d __iomem *base, int index)
>  				    GFP_KERNEL);
> =20
>  		if (!acct)
> -			return NULL;
> +			goto err_free_l2_flows;
> =20
>  		ppe->acct_table =3D acct;
>  	}
> --=20
> 2.51.0
>=20
>=20

--8NDJ4ufy8ArQzYca
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajJFnAAKCRA6cBh0uS2t
rI0aAPwM2odjog7hQypO1g2W6YBDDYMmzP5yW+nhVPnoN4SFPAD/RUOnP+tpmTPx
yLojKc99Vrm8lkiLh6lj+hu3m/WI5ws=
=srBO
-----END PGP SIGNATURE-----

--8NDJ4ufy8ArQzYca--


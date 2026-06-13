Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7071CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5AB2GnAjTYfAqDEhgce6z9wXEJuX9EVNcWGLGsHedI=; b=Xixhzv+ktrZEEopGvLQM8QnHXW
	H3VUan8UmskadUr78b0tVM7yvA9ldegTeDf2pRmlnTrDNy4YaOh4hoOScQWtrUi/dv3Oxwqv7IRfC
	M/EeAw9YFaKG7LP2FLw0/7QaksagsQ6VNSjflTL6jL//pg4Pf7+pGGaZVZ84HMpzrErmPPAdOyv6r
	lP1UECyorheI5bBz84smKR7iN7OCVYC3mDoYUfcnAe8nPEZi4BTaE8/zgoIKiRW4XcHvErMsZzJoo
	Sdlo6FNHiLwL2nxoF5PPYfforqVODTpI/piT+yFaCTZuTRwh1Yiw10LY9b8eAgj0rjfXx8MqFOYhC
	k3CaUeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJii-0000000C5TV-3Ic6;
	Sat, 13 Jun 2026 08:28:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJig-0000000C5TK-3MEt;
	Sat, 13 Jun 2026 08:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2487160018;
	Sat, 13 Jun 2026 08:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAD21F000E9;
	Sat, 13 Jun 2026 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781339276;
	bh=B5AB2GnAjTYfAqDEhgce6z9wXEJuX9EVNcWGLGsHedI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPUfJw2niWvJCDCYWoaFJyYlv9SaqAO9eWb2G60hRXV7i/b0tY/OuOQaRFGq41l/y
	 fWFuvnyreKsMzxa5M69Lmk+RobO1Zu5qX69c+zNcLs5vFuNQZKPN8Fdk/b/pvdd2fO
	 8FZLb9mnEthvfsYLByFXZU0dMPYDJA4a9Kj4C5UL4BHb4g8o6TinLZG8McJNxTqKfD
	 cYVYeI8yJ+0n2y1bK0Sx36ybpsh9cW4bh4sQZEfkDSqmDh7RYO2I6cUmmTVAn+m1MQ
	 TO0uTQv6bA2vj4FNHAMAS54kMWwphV1qiZrmfoSku+7Bsis4+nusXM+M5v+wHFcfPO
	 bee50gIjJ/Luw==
Date: Sat, 13 Jun 2026 10:27:52 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix non-standard return value in
 airoha_ppe_get_wdma_info()
Message-ID: <ai0UiG4epd96KVtZ@lore-rh-laptop>
References: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzHzCNJj3DNq8pfX"
Content-Disposition: inline
In-Reply-To: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
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


--yzHzCNJj3DNq8pfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_ppe_get_wdma_info() returns -1 when the last path in the
> forwarding path stack is not of type DEV_PATH_MTK_WDMA. This is not
> a standard kernel error code. Replace it with -EINVAL since the
> input path type is invalid from the caller's perspective.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Wayen.Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 5c9dff6..7260177 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -264,7 +264,7 @@ static int airoha_ppe_get_wdma_info(struct net_device=
 *dev, const u8 *addr,
> =20
>  	path =3D &stack.path[stack.num_paths - 1];
>  	if (path->type !=3D DEV_PATH_MTK_WDMA)
> -		return -1;
> +		return -EINVAL;
> =20
>  	info->idx =3D path->mtk_wdma.wdma_idx;
>  	info->bss =3D path->mtk_wdma.bss;
> --=20
> 2.51.0
>=20
>=20

--yzHzCNJj3DNq8pfX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai0UhQAKCRA6cBh0uS2t
rKlAAP4lFZjCFbxB2FvByROyzvrQUQJJbLpoX3MKp329SHp0iQD+P6mXCtbkeoi9
sZmQ+rhyoeWSzKSJ1zr4GUWnEgXsGws=
=quVv
-----END PGP SIGNATURE-----

--yzHzCNJj3DNq8pfX--


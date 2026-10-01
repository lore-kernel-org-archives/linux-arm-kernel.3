Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95727CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd4Rd9CRvxd2ybJD/+XeXGt4GToIyin27erBl4UTD4s=; b=VfFTCophY1qx6+Z+L7sQZ0RqTG
	p2zEqAB70ZLx/fCGa82Arn0WUx2NAPfNMINkBaqYJmCQyuDMr8M4IFEAi01RrTF12izP9Bu/VKueq
	SYIcWFaCfeHGVNydDWRpRqcdNFqIoiBTaJyhG3EJT+Vs++9oBaUdm+CFR4tF0Yh6sRQ5HULPhOdSV
	SsL4dkurwhKZPe9ZGjJEIe8bGGqQtdwjXGipNeQ6oNPcb+RKzxwhI1YsIukbV8lc3NsGVdxNgXjOQ
	+dswA0cbgg3YG2CfliElWqYA5oy55at43Dx2Py60QNeQXlMhLmFV2Cl8yUDFyL6s1PakTsCiSoPL4
	kekwsMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCDf-00000008BDq-3oXK;
	Thu, 01 Oct 2026 08:32:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCDe-00000008BDQ-2jvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:32:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34B5941521;
	Thu,  1 Oct 2026 08:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F45D1F00898;
	Thu,  1 Oct 2026 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843566;
	bh=zd4Rd9CRvxd2ybJD/+XeXGt4GToIyin27erBl4UTD4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lqRA69vVhP22r+xNMjuZDk6zVy0BlPDTwdr8miLQzuLn5bKlkEkfF/6lzBVtcnV45
	 noqAa7JlvMDWw6XSe5NoDH9/SGEXVzbIPRkw51e9quA6ZGoVkFYibTVnVTic/TBXKr
	 FniUuL8aU1vf2a8t1jztuYCMUQBUpPs4tqZolg0+MWbdRuWxilq0MOXgiira04Vejf
	 sWp+bCXIForjCTb7GXRREKeRYFUf8lbzpZdd4n+pbIsi2/CZ9J2egH9kmQ5EP3mreJ
	 KTKn0lEHFuHfyRRjZqHAqYZbJBdg+BO7W8d0DUAN6JKNtvFy5oxRQCgAqKRcAGuFOJ
	 2spgEVfEMRLVg==
Date: Thu, 1 Oct 2026 10:32:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: take ownership of saved RX state at
 poll entry
Message-ID: <ar4aq0i5lJLT7SGd@lore-desk>
References: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tPlwEejj5iNQjWqT"
Content-Disposition: inline
In-Reply-To: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com>
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

--tPlwEejj5iNQjWqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When a saved partial packet completes with a poll budget of one, the
> old loop can leave state_saved and state.skb pointing at an skb that
> has already been delivered or freed. The next poll then reuses that
> pointer, causing a use-after-free or double free.
>=20
> Take the saved state at poll entry and clear the stored ownership
> immediately. Save it again only if the packet remains incomplete,
> including when the next descriptor is still DMA-owned. Release a
> saved partial skb when the RX ring is destroyed.
>=20
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Hi James,

I guess we have a similar issue for stmmac_rx_zc() path as well, can you pl=
ease
fix it as well?

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-=
------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index ec62fa7418f4..1a4d03aaaf78 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2149,6 +2149,11 @@ static void __free_dma_rx_desc_resources(struct st=
mmac_priv *priv,
>  	else
>  		dma_free_rx_skbufs(priv, dma_conf, queue);
> =20
> +	if (rx_q->state_saved)
> +		dev_kfree_skb_any(rx_q->state.skb);

nit: you can drop if (rx_q->state_saved) and just run dev_kfree_skb_any().

> +	rx_q->state.skb =3D NULL;
> +	rx_q->state_saved =3D 0;

nit: rx_q->state_saved =3D false;

> +
>  	rx_q->buf_alloc_num =3D 0;
>  	rx_q->xsk_pool =3D NULL;
> =20
> @@ -5726,6 +5731,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int =
limit, u32 queue)
>  	struct stmmac_xdp_buff ctx;
>  	bool fcs_stripped =3D false;
>  	int xdp_status =3D 0;
> +	bool in_progress =3D rx_q->state_saved;

can you please respect RCT here?

Regards,
Lorenzo

>  	int bufsz;
> =20
>  	dma_dir =3D page_pool_get_dma_dir(rx_q->page_pool);
> @@ -5740,6 +5746,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int=
 limit, u32 queue)
>  		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
>  				    rx_q->dma_rx_phy, desc_size);
>  	}
> +	if (in_progress) {
> +		skb =3D rx_q->state.skb;
> +		error =3D rx_q->state.error;
> +		len =3D rx_q->state.len;
> +		rx_q->state.skb =3D NULL;
> +		rx_q->state_saved =3D false;
> +	}
> +
>  	while (count < limit) {
>  		unsigned int buf1_len =3D 0, buf2_len =3D 0;
>  		enum pkt_hash_types hash_type;
> @@ -5748,12 +5762,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int=
 limit, u32 queue)
>  		int entry;
>  		u32 hash;
> =20
> -		if (!count && rx_q->state_saved) {
> -			skb =3D rx_q->state.skb;
> -			error =3D rx_q->state.error;
> -			len =3D rx_q->state.len;
> -		} else {
> -			rx_q->state_saved =3D false;
> +		if (!in_progress) {
>  			skb =3D NULL;
>  			error =3D 0;
>  			len =3D 0;
> @@ -5787,6 +5796,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int =
limit, u32 queue)
> =20
>  		prefetch(np);
> =20
> +		in_progress =3D status & rx_not_ls;
> +
>  		if (priv->extend_desc)
>  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
>  		if (unlikely(status =3D=3D discard_frame)) {
> @@ -5971,7 +5982,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int =
limit, u32 queue)
>  		count++;
>  	}
> =20
> -	if (status & rx_not_ls || skb) {
> +	if (in_progress || skb) {
>  		rx_q->state_saved =3D true;
>  		rx_q->state.skb =3D skb;
>  		rx_q->state.error =3D error;
>=20
> ---
> base-commit: 7375d38364a9aa66fb31716bcefef38aecad75d8
> change-id: 20260930-stmmac-rx-state-041371e43e8c
>=20
> Best regards,
> -- =20
> James Hilliard <james.hilliard1@gmail.com>
>=20
>=20

--tPlwEejj5iNQjWqT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar4aqwAKCRA6cBh0uS2t
rFuEAQDSLs28FZXtvlFLovCP1shWroHJcnR6//fdjyCKN0DS2AD/f6MbvrXfDTP6
NaSWZHYL7Stp2fYZCBntEBoUBKpiCAI=
=LpWX
-----END PGP SIGNATURE-----

--tPlwEejj5iNQjWqT--


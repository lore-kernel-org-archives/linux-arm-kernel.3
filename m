Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86ADFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCDRnSN4R5hdrw6p/Z2MSp7JmFvMbvRG5SIix8Wk020=; b=lWYuCM6SXBej6JijsZFRvUcYm8
	kjpppoqlXMU46s76WUH60ASk5PZ44+RPcghVbar8Z7CXpSdjRKU29FzKQwERyjB+NgmmGC1RvcacI
	Xff1bhjH2nUsnkQ68hnFPUdHGa/44hVIxCiIE+AJZYtWNQ70q6dsJobE0upwMrm2tg/+SfwefLHOT
	QeZXlhlq9dr6M2xHf3x7YebtZyWM/CsiMcoW8QVPKZy/Q+BQLD66HCnbSnXuEGpTUYq6KeNQpJmZh
	T1zl93l2HdCkyIMExmr7Pl/cqrAXfonfu7VbtAaBzIpgNjl2eys3t/LpUtMp3idStx8d1SRdvACIZ
	iKNOOywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdih-0000000EV0C-41tl;
	Sat, 25 Apr 2026 14:10:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdih-0000000EV03-0vFC;
	Sat, 25 Apr 2026 14:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF0D6011F;
	Sat, 25 Apr 2026 14:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F892C2BCB0;
	Sat, 25 Apr 2026 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777126253;
	bh=wagJbOabzBX4c3I3/fpQnk3/gb9n7mhfA2RWn9EY5NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avcVIe9uVideLxvgqZdXGOU5N0OIGskkLBJJMVEnRmjir9GW7F6hRNAesMAwospOe
	 1P4JdGVEWbL15vJm4SllIZ0PZ4pZJx07Q6AY0OdTosB6pD7iIVk0rrezENQ60C/lc2
	 RyIKmNA+q6xorvq1Yh31gIL1lFJL7BFlIpLOXJwjApA5efUMdqVc3AIwoG+0cCgWto
	 nLtLiBO3hD6pn+dhZZa+lWDBNTYSU7HnDEQDdFwUrP7Y9y1caJJrmpupbqqSfr6pqe
	 P3Va2G3zCVcjaKMHUCUtigVuy561vO5g7XICgO0cnWF04SW7kjgMx2qEZ8B1Tio0aZ
	 RM3vNuIeW0ghg==
Date: Sat, 25 Apr 2026 16:10:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
Message-ID: <aezLa2POvT0It5AA@lore-desk>
References: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0VgauHS1AwOXXx5H"
Content-Disposition: inline
In-Reply-To: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
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


--0VgauHS1AwOXXx5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The transmit loop in airoha_dev_xmit() reads fragment address and length
> during its final iteration, when the loop index equals
> skb_shinfo(skb)->nr_frags, at which point the fragment data is
> uninitialized. While these values are never consumed, the read itself is
> unsafe and may trigger a page fault. Fix this by avoiding the fragment
> read on the last iteration.
> Additionally, move the skb pointer from the first to the last used packet
> descriptor, so that airoha_qdma_tx_napi_poll() defers freeing the skb
> until the final descriptor is processed.
>=20
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581=
 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 2bb0a3ff9810..d3a841908c82 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1997,8 +1997,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	struct netdev_queue *txq;
>  	struct airoha_queue *q;
>  	LIST_HEAD(tx_list);
> +	int i =3D 0, qid;
>  	void *data;
> -	int i, qid;
>  	u16 index;
>  	u8 fport;
> =20
> @@ -2057,7 +2057,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  			     list);
>  	index =3D e - q->entry;
> =20
> -	for (i =3D 0; i < nr_frags; i++) {
> +	while (true) {
>  		struct airoha_qdma_desc *desc =3D &q->desc[index];
>  		skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
>  		dma_addr_t addr;
> @@ -2069,7 +2069,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  			goto error_unmap;
> =20
>  		list_move_tail(&e->list, &tx_list);
> -		e->skb =3D i ? NULL : skb;
> +		e->skb =3D i =3D=3D nr_frags - 1 ? skb : NULL;
>  		e->dma_addr =3D addr;
>  		e->dma_len =3D len;
> =20
> @@ -2088,6 +2088,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  		WRITE_ONCE(desc->msg1, cpu_to_le32(msg1));
>  		WRITE_ONCE(desc->msg2, cpu_to_le32(0xffff));
> =20
> +		if (++i =3D=3D nr_frags)
> +			break;
> +
>  		data =3D skb_frag_address(frag);
>  		len =3D skb_frag_size(frag);
>  	}
>=20
> ---
> base-commit: e728258debd553c95d2e70f9cd97c9fde27c7130
> change-id: 20260423-airoha-xmit-fix-read-frag-dc6aa001ca4b
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

Commenting on Sashiko reported issues:
https://sashiko.dev/#/patchset/20260424-airoha-xmit-fix-read-frag-v1-1-fdc0=
a83c79e8%40kernel.org

- Does the TSO checksum calculation earlier in this function ensure the
  TCP header is in the linear portion of the SKB?
  This issue is not related to the current patch. Moreover, can we have a T=
SO
  packet where the tcp header is not in the linear area of the skb?

- If dma_map_single() fails partway through a multi-fragment packet and
  triggers this goto error_unmap, will it break the Tx ring contiguity?
  This issue is not related to the current patch. Moreover, I guess the hw =
is
  capable of managing out-of-order descriptors.

- Is it safe to map fragment data using dma_map_single() instead of
  skb_frag_dma_map()?
  This issue is not related to the current patch. I will post a dedicated p=
atch
  for it.

Regards,
Lorenzo

--0VgauHS1AwOXXx5H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaezLawAKCRA6cBh0uS2t
rCSVAP4hJXo5r610dexifSQ7HqAQwgINCipaQyT6j0sTiA11XwD/a4KlozQd3xg7
gPp2llCfFkiPrwcWIN60uNLYuPWkrAE=
=4VRT
-----END PGP SIGNATURE-----

--0VgauHS1AwOXXx5H--


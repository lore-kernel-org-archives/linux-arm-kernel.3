Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D7FA1FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haLon5jNt0yaEjtkhw/5J2igzDV6P4677oPXEsIyp1s=; b=aEPR1q9OZfcPl/sMBNP74lXDYi
	OTLMJ5d3jxAOt8scDhyrO5RKgXbTHkhEYa72z2/ne4yirx/oQTcqBSCU7Rl8C/PB5weEgGMWRJpfB
	l55+mbD/qD82QDVVRfD3kg1Oukzm5QviJqs35ecEK76G5sR+svopWLjej0rM3eQS7mobrklbGUSwM
	A4D+sM8RPGX/xV0EjBY21vDXLgayMM7eWvr1PHn/UgPjIkTUomAmL6mF1v02MDaHEmSdzVMYQiowK
	jJ4i4tGaRUsqAw7VGXV9jUvv69+3BGjBaNNB5qGZu09WwisGwA97g+c++CI+EF4BAy9PUZk7ifgaz
	TQMGDx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFa8u-0000000ATQk-2OC6;
	Wed, 22 Apr 2026 16:09:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFa8o-0000000ATPp-0huE;
	Wed, 22 Apr 2026 16:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B1154151B;
	Wed, 22 Apr 2026 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B0CC2BCAF;
	Wed, 22 Apr 2026 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874169;
	bh=SBPYOB3ZXq1r3Di2k7yUx1oZXfbnIN5yGtjLEJy8hko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7e8pti7lKvpIs1AkotuqIqFHzZdqo47cRmPEhe3/IYU0V2bRNpXpSjlkox//gteU
	 k4azoB6utVu+bjq0p19DnS9MhhEjWPzREcPm+HrHpvJBZmAOBJUR+9Yp+9VVs4aEoz
	 bJ79R5JTtCsBJnp6YEW+QcRRam29+dW5hUXWkUAjivG/SgvHCn0ewkKkXsS2P8Svon
	 Aqi2LG0zPzAVv1NchUws1iimiM2ja77at2rU0LeFi7WcxGKnMXcWaSrl+N/a7f8Wvg
	 4rFRNjM6deHxv3W5agmjB2Mb6Kyysafr6v+Efalb7aswbvvNF3uDMCOT3Fig2uWqdV
	 L97vpVYDCkoQw==
Date: Wed, 22 Apr 2026 18:09:26 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: airoha: Move ndesc initialization at end
 of airoha_qdma_init_rx_queue()
Message-ID: <aejyttYXyW_vzi8o@lore-desk>
References: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
 <20260420-airoha_qdma_init_rx_queue-fix-v2-1-d99347e5c18d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kZko5lrIFyDnW20B"
Content-Disposition: inline
In-Reply-To: <20260420-airoha_qdma_init_rx_queue-fix-v2-1-d99347e5c18d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_090930_246919_A52EE059 
X-CRM114-Status: GOOD (  21.11  )
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


--kZko5lrIFyDnW20B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If queue entry or DMA descriptor list allocation fails in
> airoha_qdma_init_rx_queue routine, airoha_qdma_cleanup() will trigger a
> NULL pointer dereference running netif_napi_del() for RX queue NAPIs
> since netif_napi_add() has never been executed to this particular RX NAPI.
> The issue is due to the early ndesc initialization in
> airoha_qdma_init_rx_queue() since airoha_qdma_cleanup() relies on ndesc
> value to check if the queue is properly initialized. Fix the issue moving
> ndesc initialization at end of airoha_qdma_init_tx routine.
> Move page_pool allocation after descriptor list allocation in order to
> avoid memory leaks if desc allocation fails.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index e1ab15f1ee7d..fc79c456743c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -745,14 +745,18 @@ static int airoha_qdma_init_rx_queue(struct airoha_=
queue *q,
>  	dma_addr_t dma_addr;
> =20
>  	q->buf_size =3D PAGE_SIZE / 2;
> -	q->ndesc =3D ndesc;
>  	q->qdma =3D qdma;
> =20
> -	q->entry =3D devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
> +	q->entry =3D devm_kzalloc(eth->dev, ndesc * sizeof(*q->entry),
>  				GFP_KERNEL);
>  	if (!q->entry)
>  		return -ENOMEM;
> =20
> +	q->desc =3D dmam_alloc_coherent(eth->dev, ndesc * sizeof(*q->desc),
> +				      &dma_addr, GFP_KERNEL);
> +	if (!q->desc)
> +		return -ENOMEM;
> +
>  	q->page_pool =3D page_pool_create(&pp_params);
>  	if (IS_ERR(q->page_pool)) {
>  		int err =3D PTR_ERR(q->page_pool);
> @@ -761,11 +765,7 @@ static int airoha_qdma_init_rx_queue(struct airoha_q=
ueue *q,
>  		return err;
>  	}
> =20
> -	q->desc =3D dmam_alloc_coherent(eth->dev, q->ndesc * sizeof(*q->desc),
> -				      &dma_addr, GFP_KERNEL);
> -	if (!q->desc)
> -		return -ENOMEM;
> -
> +	q->ndesc =3D ndesc;
>  	netif_napi_add(eth->napi_dev, &q->napi, airoha_qdma_rx_napi_poll);
> =20
>  	airoha_qdma_wr(qdma, REG_RX_RING_BASE(qid), dma_addr);
>=20
> --=20
> 2.53.0
>=20

As requested, I am commenting the issue reported by Sashiko on this patch:
https://sashiko.dev/#/patchset/20260420-airoha_qdma_init_rx_queue-fix-v2-0-=
d99347e5c18d%40kernel.org

- Does this code leave a regression in the TX path by omitting the equivale=
nt fix?
  This issue is not related to this patch and already fixed here:
  https://patchwork.kernel.org/project/netdevbpf/patch/20260417-airoha_qdma=
_cleanup_tx_queue-fix-net-v4-1-e04bcc2c9642@kernel.org/

Regards,
Lorenzo

--kZko5lrIFyDnW20B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaejytgAKCRA6cBh0uS2t
rNjYAPsE6vHRstqCNtY7VdsXgogfTMg3eIitwR4Cd7rx8vkc9wEAlT/aXD/pfWfU
I4HEEr6YV9z6AGOdd7AdPDauj/tIXww=
=6ghH
-----END PGP SIGNATURE-----

--kZko5lrIFyDnW20B--


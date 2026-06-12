Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA5CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/ANQU5yElXq5/4kup7qDLTunMHTYjQhDPXNkYYLT8s=; b=prlQa4lN8UAselLgpf21FYQa7R
	YniXTaZnLoIBEv/6qGwKYfFhYwER7IcTAt6v2ARjtw2eIEwl4gmTmPQHeX+szPSMH2Nl2aE6QDmfj
	ra/CLrrbWL23Ojkm6+WO1NCWSPwsiXa4EemFWJbIdO+ADa1jnUU3NyAjkl1X3v+Ym7wGDY8mXPWYW
	m66i27NnPR2BDXgF5M7Q1X5zyFq3DQO0qVaRj0OVl2xl6PUj9RicXMyrpxrlSjiHdBTkvsDoT0ScO
	pxdQ0YnXxITIpdaJB86cGkhnAVC+fK5lfLnf1UHo9cjXsE7N5S/BHF4CeHxdlNORCy4K9d/772kXb
	dsVHrrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz7j-0000000AkY7-1JUg;
	Fri, 12 Jun 2026 10:28:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz7h-0000000AkXu-3hQ3;
	Fri, 12 Jun 2026 10:28:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A25786001D;
	Fri, 12 Jun 2026 10:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FE81F000E9;
	Fri, 12 Jun 2026 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781260103;
	bh=f/ANQU5yElXq5/4kup7qDLTunMHTYjQhDPXNkYYLT8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DNlMkoPrCGAq+LCan0dVbwLbdh0MdMlr+wO+V2l7NTFUTsa2psI5Q/WYBRp1mNAvw
	 AhJL0A8M/aOoIZyDTeuFq57jMWDCfe492qHRSEOYeFRMFbPA3m10GputbpTJtvUHuX
	 9x+n+uDJaRLx6bp9cm3g9FiOt6Awod/NZYq9tWkO3Hdsr8f+gqqWSorNmROXASnj0+
	 yaEz93iw4p9oEROWp9JOhpfKvN4B+cbviewxLaQJ2esMsQ+BeC8bIfVH2zTgmt3PG7
	 4Pfj2o+VtsjlFeeuTMEbLZo05dDdlN1gxR6trhPrKAtsJZNJ651sMgRmg8uz9tt26i
	 qkLURpgeIUTgw==
Date: Fri, 12 Jun 2026 12:28:21 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix register index for Tx-fwd counter
 configuration
Message-ID: <aivfRSPzxRezTRta@lore-desk>
References: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LYLKlmUwV+uWKKpP"
Content-Disposition: inline
In-Reply-To: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
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


--LYLKlmUwV+uWKKpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_qdma_init_qos_stats(), the Tx-fwd counter configuration
> register uses the same index (i << 1) as the Tx-cpu counter, which
> overwrites the Tx-cpu configuration. The Tx-fwd counter value register
> correctly uses (i << 1) + 1, so the configuration register should use
> the same index.
>=20
> Fix the REG_CNTR_CFG index from (i << 1) to ((i << 1) + 1) so that
> the Tx-fwd counter is properly configured instead of clobbering the
> Tx-cpu counter config.
>=20
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Wayen.Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11..329988a 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoh=
a_qdma *qdma)
>  			       FIELD_PREP(CNTR_CHAN_MASK, i));
>  		/* Tx-fwd transferred count */
>  		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
> -		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
> +		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
>  			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
>  			       CNTR_ALL_DSCP_RING_EN_MASK |
>  			       FIELD_PREP(CNTR_SRC_MASK, 1) |
> --=20
> 2.51.0
>=20
>=20

--LYLKlmUwV+uWKKpP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaivfRQAKCRA6cBh0uS2t
rNYfAP0XdKGR6Aiasu0qGwgQ/9xP3GhgfMeX1v4XIsmZR6d1xAEAzrpOQRsPg2BJ
CZQkHbgBiT3lNpNkZhqrKyDk4zz+iQo=
=PnbT
-----END PGP SIGNATURE-----

--LYLKlmUwV+uWKKpP--


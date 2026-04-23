Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE862F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knOefttnIyPWl2d+eqYXv+SUsJugMspNXMYMja8kCag=; b=jVQ7nwAk1iW49G2SkOP2lAfzS8
	NX+dWUjUNiBPLJdEUmNyUUYO0e3HJJo10sj4gAMrFf58KKP2TS6h7FPmdxAEYou8k5CQsZBYd91LU
	OZWN3DNewN6Lz4j4Kz840dL6VRSjTPdPiweYVCLOpKNyqaXAOOEQPLJ2XuGq/jrt1U/3rnlyFEeBu
	2BsedmDHQ7/rlOEvW/U7+DP46TUCiEQuP3ycGcWCmgvQ7hm46gkL6KYoazLAiaoRBAvbexo2zTu0S
	g25oZ2ImpX8a49yIhDEDPFeniiWhSJftYIxDhJ4m9QI2k1Bpla3j40mOIO/d5vTMPIHxQFx1wnIAB
	fczLVe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpAk-0000000BD6U-2oUR;
	Thu, 23 Apr 2026 08:12:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpAe-0000000BD5K-1x7i;
	Thu, 23 Apr 2026 08:12:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E664643B24;
	Thu, 23 Apr 2026 08:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712BCC2BCAF;
	Thu, 23 Apr 2026 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931943;
	bh=iEcYAM0VwzzlUdBWlgBenv9RwXM4rAx4T+7N+FRLWSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABr3DnpMiq0MaldPMg3udYOvaz02Da8BaHqPFrDJJvdIQu6rX4u1n80nNj85WCRkS
	 75QaPBYbDsvs+SQWIHNn4vbdEG2DJuDCutTTDclvCanI9VqhwfNbofQ7qQErKoILTn
	 yv+3KlbN9Lm+M1Ov6Yv6xWmvS6EESQFZjT87DeXBI5f9RCMGJVg9avF1JNChp22TSK
	 /+dletROj0tX1pLtgoa12poN5h9xK38mu4qJO/yRyQ7zbtcf3qLHsJIJLCFZRQMbBJ
	 eEY72aKJQVg1Zi1ahz6S1l3h6epEH+BBMj/JXz0HWlCBHYjul2CaiNPhw144AEKdNp
	 PnDtcUOfMpoxA==
Date: Thu, 23 Apr 2026 10:12:21 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hariprasad Kelam <hkelam@marvell.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: fix BQL imbalance in TX path
Message-ID: <aenUZc6mSBuSvWbz@lore-desk>
References: <20260421-airoha-fix-bql-v1-1-f135afe4275b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UnahIpJ2gghwFW0k"
Content-Disposition: inline
In-Reply-To: <20260421-airoha-fix-bql-v1-1-f135afe4275b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_011224_547385_159511A7 
X-CRM114-Status: GOOD (  26.62  )
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


--UnahIpJ2gghwFW0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fix a possible BQL imbalance in airoha_dev_xmit(), where inflight
> packets are accounted only for the AIROHA_NUM_TX_RING netdev TX
> queues. The queue index is computed as:
>=20
>     qid =3D skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx)
>     txq =3D netdev_get_tx_queue(dev, qid);
>=20
> However, airoha_qdma_tx_napi_poll() accounts completions across all
> netdev TX queues (num_tx_queues), leading to inconsistent BQL
> accounting.
>=20
> Also reset all netdev TX queues in the ndo_stop callback.
>=20
> Fixes: 1d304174106c ("net: airoha: Implement BQL support")
> Fixes: c9f947769b77 ("net: airoha: Reset BQL stopping the netdevice")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 19f67c7dd8e1..6c7390f0de5d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -929,10 +929,9 @@ static int airoha_qdma_tx_napi_poll(struct napi_stru=
ct *napi, int budget)
>  		q->queued--;
> =20
>  		if (skb) {
> -			u16 queue =3D skb_get_queue_mapping(skb);
>  			struct netdev_queue *txq;
> =20
> -			txq =3D netdev_get_tx_queue(skb->dev, queue);
> +			txq =3D skb_get_tx_queue(skb->dev, skb);
>  			netdev_tx_completed_queue(txq, 1, skb->len);
>  			dev_kfree_skb_any(skb);
>  		}
> @@ -1711,7 +1710,7 @@ static int airoha_dev_stop(struct net_device *dev)
>  	if (err)
>  		return err;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++)
> +	for (i =3D 0; i < dev->num_tx_queues; i++)
>  		netdev_tx_reset_subqueue(dev, i);
> =20
>  	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> @@ -2002,7 +2001,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
> =20
>  	spin_lock_bh(&q->lock);
> =20
> -	txq =3D netdev_get_tx_queue(dev, qid);
> +	txq =3D skb_get_tx_queue(dev, skb);
>  	nr_frags =3D 1 + skb_shinfo(skb)->nr_frags;
> =20
>  	if (q->queued + nr_frags >=3D q->ndesc) {
>=20
> ---
> base-commit: a663bac71a2f0b3ac6c373168ca57b2a6e6381aa
> change-id: 20260421-airoha-fix-bql-7fff7cebbc9a
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

commenting on Sashiko reported issues:
https://sashiko.dev/#/patchset/20260421-airoha-fix-bql-v1-1-f135afe4275b%40=
kernel.org

- This isn't a bug in this patch, but does using 0xff as a sentinel value c=
ause a permanent stall?
  I do not think this is a real issue since, according to my understanding,=
 the NIC
  never writes 0xff in irq_q queue.

- This is another pre-existing issue, but does freeing the SKB here cause a=
 DMA use-after-free
  for multi-fragment packets?
  This issue is not related to this patch, and I will fix it in a dedicated
  patch storing the skb pointer in the last descriptor in airoha_dev_xmit()

- Since the QDMA hardware and NAPI instance are shared among multiple ports=
 (qdma->users),
  could active NAPI polling cause a BUG_ON() in dql_completed()?
  This is not an issue related to this patch since here we are just resetti=
ng
  all the netdev tx queues instead of just the first ARRAY_SIZE(qdma->q_tx)
  ones.

- This isn't a bug in this patch, but does failing to wait for the DMA engi=
nes to become
  idle before unmapping buffers cause memory corruption?
  This issue is not related to this patch and it will be fixed with a dedic=
ated
  patch.

- This is also pre-existing, but can this mapping cause a kernel panic on h=
ighmem systems?
  Can we have fragments in high memory? e.g on ARM architecture? Anyway, as
  pointed out by Sashiko, this issue is not related to this patch.

- This isn't introduced here, but does this logic cause a permanent TX stal=
l?
  this issue is already fixed in the following patch:
  https://patchwork.kernel.org/project/netdevbpf/patch/20260421-airoha-xmit=
-stop-condition-v1-1-e670d6a48467@kernel.org/

Regards,
Lorenzo

--UnahIpJ2gghwFW0k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaenUZQAKCRA6cBh0uS2t
rG34AP9NRfrm2/98XzQnX8x/rvejxWGK4oyc/yAPXY8BBSwGWgEA0/gbqM6hiF2B
TP2H8hOsiFsTF5in8IVx3jPq3E8e7Qk=
=ET9C
-----END PGP SIGNATURE-----

--UnahIpJ2gghwFW0k--


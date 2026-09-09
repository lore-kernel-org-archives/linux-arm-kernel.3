Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD2C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w4NFg9faVW5eV7iVVa1tzxXUY7v774ABj4yQO4DEJg=; b=Io8zgcOMT2UEfDYnEGkyUwMf+p
	490LMN/Lx8Ra/CwYtERIIlW0OLZujXbKTldxAYCxDt3GPRVYqJuYXeGu5/nvUwGIA53oEC0mMkFvG
	Da00wcckkFxvpUpmVt+QURH+Py/GSqAY2/pncVl0ZViw2k1mbRk2aBKmUKtHTHZoYBbLJeCVWCeeg
	LRxrY4hZKInkvnK4S/zgUVALTqbR2KoD/ZIlozFK2i7G/00hg2mS6ziSwjQmf+5R0OzFDuCAqsuch
	gkba3r1Z3fEPH8PdlQ/Lxqk1fDqHx7T43vJMRVu2OYFR9NqyDPcO/kQXjdWJRsue2Yw5CggOi0sV2
	nd2FwmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cqm-0000000B01q-0GMb;
	Wed, 09 Sep 2026 07:36:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cqk-0000000B01U-24JT;
	Wed, 09 Sep 2026 07:36:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 748F560207;
	Wed,  9 Sep 2026 07:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08401F00A3D;
	Wed,  9 Sep 2026 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939365;
	bh=9w4NFg9faVW5eV7iVVa1tzxXUY7v774ABj4yQO4DEJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gGNs9N+ZIhCHGYvWHcYWC6dZPuZeJjxsDtuww3pG+tF3e0Ah42XuOdvnjK+Q72RuO
	 P4bRtReLxeccMflJUuCRlbTzTuy9PqbhdlFQxDU3G3JyVoKahT4hT6Opz+bB5SjjEC
	 aP0je3N/qPqlxSO1bbISHCYwNXe4KXNWOq9Uvu4RRxezpOOok2zFdFQaDWgw58YsbK
	 8+xshmStRfBx9thRo70mLrC+bkZkD24r+OKZJXz8PEt0n9OiiOu9fQtfrLJdDf2fZF
	 RLFfJimI0iIEo2lFWMY50MBwYBl2uwP2HnUWiqjVQkl44hDHwC26ghgDl6bgFz4qoh
	 vBHLmOVpAgb3Q==
Date: Wed, 9 Sep 2026 09:36:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, aleksander.lobakin@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	madhur.agrawal@airoha.com, horms@kernel.org
Subject: Re: [PATCH net-next v6] net: airoha: add LRO offload support
Message-ID: <aqEMYubcWlQiuAwR@lore-desk>
References: <20260906-airoha-eth-lro-v6-1-a6cc5179a8c5@kernel.org>
 <178893579710.219967.7015031895402367364@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UmsGRNl06GTcbpNQ"
Content-Disposition: inline
In-Reply-To: <178893579710.219967.7015031895402367364@kernel.org>
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

--UmsGRNl06GTcbpNQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 3
>=20
> - [Medium] The new LRO drop path in `airoha_qdma_rx_process()` increments
>   `netdev->stats.rx_dropped` (the legacy `struct net_device_stats`=E2=80=
=A6
> - [Low] The commit message claims "aggregated skbs are marked
>   SKB_GSO_DODGY so that the stack does not rely on gso_size and does not=
=E2=80=A6
> - [Low] Teardown asymmetry for the shared FE/CDM LRO state:
>   `airoha_dev_set_features()` arms the per-QDMA LRO block via=E2=80=A6
> - [Low] The new LRO error path performs a plain, non-atomic read-modify-
>   write of the shared per-netdev counter `netdev->stats.rx_dropped++`=E2=
=80=A6
>=20
> --
>=20
> net: airoha: add LRO offload support
>=20
> This adds LRO offload to airoha_eth using the 8 dedicated LRO hardware
> queues mapped to RX queues 24-31, bumping those queues' page_pool order
> since LRO cannot use scatter-gather.  Aggregated skbs get GSO metadata
> and a pseudo-header checksum so forwarded traffic can be re-segmented,
> and NETIF_F_LRO is only offered while a single device uses the QDMA.
>=20
> Link: https://lore.kernel.org/r/20260831-airoha-eth-lro-v5-1-6b0f50401121=
@kernel.org
>=20
> A few questions below.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 64619e9a704dd..7035b269a7c34 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>=20
> [ ... ]
>=20
> > @@ -657,13 +742,146 @@ airoha_qdma_get_gdm_dev(struct airoha_eth *eth, =
struct airoha_qdma_desc *desc)
> >  	return port->devs[d] ? port->devs[d] : ERR_PTR(-ENODEV);
> >  }
> > =20
> > +static int airoha_qdma_lro_rx_skb(struct airoha_queue *q,
> > +				  struct airoha_qdma_desc *desc,
> > +				  u32 msg1, u32 len)
> > +{
>=20
> [ ... ]
>=20
> > +	shinfo =3D skb_shinfo(skb);
> > +	shinfo->gso_type =3D ipv4 ? SKB_GSO_TCPV4 : SKB_GSO_TCPV6;
> > +	shinfo->gso_type |=3D SKB_GSO_DODGY;
> > +	shinfo->gso_size =3D DIV_ROUND_UP(len - data_off, agg_count);
> > +	shinfo->gso_segs =3D agg_count;
>=20
> [Severity: Low]
> Is the commit message description of SKB_GSO_DODGY the right way round?
> It says:
>=20
>     "aggregated skbs are marked SKB_GSO_DODGY so that the stack does not
>      rely on gso_size and does not merge the aggregate into the GRO
>      engine"
>=20
> SKB_GSO_DODGY means the opposite for gso_segs: it tells the stack that
> gso_segs is untrusted and must be recomputed from gso_size.  In
> qdisc_pkt_len_segs_init() in net/core/dev.c:
>=20
> 	if (unlikely(shinfo->gso_type & SKB_GSO_DODGY)) {
> 		int payload =3D skb->len - hdr_len;
> 		...
> 		gso_segs =3D DIV_ROUND_UP(payload, shinfo->gso_size);
>=20
> and the TCP GSO output path uses gso_size as the MSS when re-segmenting,
> so the approximated gso_size is authoritative rather than advisory.
>=20
> The scheme still looks workable, since DIV_ROUND_UP(sum, agg_count) can
> never exceed the largest merged segment and the re-segmented packets only
> come out smaller.  Could the commit message state that rationale instead
> of saying the stack does not rely on gso_size?

ack, I will fix it.

>=20
> [ ... ]
>=20
> > @@ -707,9 +927,17 @@ static int airoha_qdma_rx_process(struct airoha_qu=
eue *q, int budget)
> >  			__skb_put(q->skb, len);
> >  			skb_mark_for_recycle(q->skb);
> >  			q->skb->dev =3D netdev;
> > -			q->skb->protocol =3D eth_type_trans(q->skb, netdev);
> >  			q->skb->ip_summed =3D CHECKSUM_UNNECESSARY;
> >  			skb_record_rx_queue(q->skb, qid);
> > +
> > +			if (airoha_qdma_lro_rx_skb(q, desc, msg1, len)) {
> > +				netdev->stats.rx_dropped++;
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> [Severity: Medium]
> Does this counter ever reach userspace?  This driver registers
> .ndo_get_stats64 =3D airoha_dev_get_stats64, and that callback assigns
> rx_dropped from its own MIB-derived stats:
>=20
> 	storage->rx_dropped =3D dev->stats.rx_drops;
>=20
> dev_get_stats() in net/core/dev.c memsets storage and calls
> ndo_get_stats64 when it exists, only falling back to
> netdev_stats_to_stats64(storage, &dev->stats) when there is no
> ndo_get_stats64/ndo_get_stats, and afterwards only adds dev->core_stats.
>=20
> So every packet dropped here (agg_count above
> AIROHA_RXQ_LRO_MAX_AGG_COUNT, IPv6 with extension headers so nexthdr is
> not NEXTHDR_TCP, iph->ihl below 5, th->doff below 5, or a frame shorter
> than the headers) appears nowhere in ip -s link or rtnetlink.
>=20
> Would dev_core_stats_rx_dropped_inc(netdev), or the driver's own
> dev->stats.rx_drops under its u64_stats syncp, be the better sink here?
>=20
> [Severity: Low]
> Separately, can this increment lose counts?  netdev->stats.rx_dropped is
> a plain unsigned long shared per netdev, and this is a non-atomic
> read-modify-write from NAPI context.
>=20
> Each RX ring has its own NAPI instance (q->napi, 32 rings across the IRQ
> banks) and the target netdev is resolved per descriptor by
> airoha_qdma_get_gdm_dev(), so two pollers on different CPUs, for example
> LRO rings 24 and 31 both resolving to the same airoha_gdm_dev, can reach:
>=20
> 	airoha_qdma_rx_napi_poll()
> 	  airoha_qdma_rx_process()
> 	    netdev->stats.rx_dropped++;
>=20
> concurrently with no lock and no per-CPU separation, which also tears on
> 32-bit.

ack, I will fix it.

>=20
> > +				dev_kfree_skb(q->skb);
> > +				q->skb =3D NULL;
> > +				continue;
> > +			}
> > +
> > +			q->skb->protocol =3D eth_type_trans(q->skb, netdev);
> >  		} else { /* scattered frame */
> >  			struct skb_shared_info *shinfo =3D skb_shinfo(q->skb);
> >  			int nr_frags =3D shinfo->nr_frags;
>=20
> [ ... ]
>=20
> > @@ -2288,6 +2582,32 @@ int airoha_get_fe_port(struct airoha_gdm_dev *de=
v)
> >  	}
> >  }
> > =20
> > +static netdev_features_t airoha_dev_fix_features(struct net_device *ne=
tdev,
> > +						 netdev_features_t features)
> > +{
> > +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +	struct airoha_qdma *qdma;
> > +
> > +	qdma =3D airoha_qdma_deref(dev);
> > +	if (qdma->users > 1)
> > +		features &=3D ~NETIF_F_LRO;
> > +
> > +	return features;
> > +}
> > +
> > +static int airoha_dev_set_features(struct net_device *netdev,
> > +				   netdev_features_t features)
> > +{
> > +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +
> > +	if (features & NETIF_F_LRO)
> > +		airoha_dev_lro_enable(dev);
> > +	else
> > +		airoha_dev_lro_disable(dev);
> > +
> > +	return 0;
> > +}
>=20
> [Severity: Low]
> Should the enable path here be gated on netif_running()?  There is no
> admin-state check, so ethtool -K ethX lro on arms the shared FE/CDM LRO
> block of the QDMA while the interface is still down.
>=20
> The only teardown sites for that hardware state are ndo_stop and a later
> ndo_set_features.  unregister_netdev() does not call ndo_stop for an
> already-closed device, and neither airoha_qdma_cleanup() nor
> airoha_hw_cleanup() touches REG_CDM_LRO_EN, REG_CDM_LRO_RXQ or
> REG_CDM_LRO_LIMIT, so after this sequence:
>=20
> 	ethtool -K ethX lro on      # link down, LRO armed anyway
> 	rmmod airoha_eth
>=20
> the CDM LRO engine stays enabled and mapped to RX queues 24-31 after
> those rings, descriptors and page pools are gone.
>=20
> This looks like leftover hardware state rather than something worse:
> airoha_qdma_cleanup() clears GLOBAL_CFG_RX_DMA_EN_MASK and polls
> GLOBAL_CFG_RX_DMA_BUSY_MASK before the RX buffers are released, so no DMA
> into freed pages, and airoha_hw_init() asserts and deasserts the fe reset
> on the next probe before airoha_fe_init(), so the stale enable bits do not
> survive a rebind and cannot make airoha_dev_open() return -EBUSY forever.
>=20
> Would it make sense to call airoha_dev_lro_disable() from the remove path
> as well, so enable and disable are symmetric?

I do not think this is necessary since during module probe we reset the dev=
ice,
disabling LRO.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260906-airoha-eth-lro-v6-1-a6cc5179a8c5%40kernel.org

--UmsGRNl06GTcbpNQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqEMYgAKCRA6cBh0uS2t
rEZIAQCD2qwAMaKckbztHY+IfkzQZcYbJhZzwtapM57LKJaAwgD9EhxdkotcKzn1
vguxeUvD7zxVvXUlGH47iYjAwQ/3OQ8=
=pyKu
-----END PGP SIGNATURE-----

--UmsGRNl06GTcbpNQ--


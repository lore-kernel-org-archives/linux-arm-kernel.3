Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACB3E99076
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA9GssIJnHjp+0pJ/YA3uwcbFGvbPnxMKsonzlgOy7E=; b=k6cS9OEtz5PK/tiJvGou5bwIpr
	PIE0tR99bsJXOzr2bUEgB1kmckrl5/EnKI7bfOlp/geJPvfT/zeL2wulMTiSEjhxrTb9VQwu5cyik
	0s2pbk+jWnzLZimf+f7hZQdkvEXsQhxgIoy8VbtVtp61y0Ui44Bl78loUnwAjxaeXn8eQfv4OOrzr
	PE62WYTU5kh+hi6NqCqRrlg9+TFnyEU+BWKzO62NtA3XdFTRaATTl6SJCm5T1pl+knfYmClyGbrOw
	QHRNsepdHLCNuZrUAILtENSYccurHi4beH9pp+XDuQLLKu48HSyQyKgtIrTS1TdFEKQGDDBaHcCc7
	sjwV81Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ce-0000000C0sU-2PmU;
	Fri, 10 Apr 2026 10:35:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Cc-0000000C0sK-3dG7;
	Fri, 10 Apr 2026 10:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 083DC60126;
	Fri, 10 Apr 2026 10:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653FFC19421;
	Fri, 10 Apr 2026 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775817305;
	bh=NbLMW9yD5qW6WB9yg4ttyR+1tADafNTIh7LxC+xpkQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GARQ2WLjSg5318qxd44xvfOHr5o4PZb8ep4XJU+jy7EVLExVz0fmJ77P/dHWqM+Zs
	 IPaWAUkJqA77hhpaFOvT1fsyzy4d3ezpyDco1x7J67X0LZrZ0Y5/NF8iQzYKY6kIhJ
	 IbK7eOtENWVJv1XFZPJMYYExQwwc/WludzAO6ZRcCKEIfGd1C8ZOFLmQRfIKvZNHMU
	 QbQQCLeK966dblNIiSag1XSlSch4p+ogRF5Dr3g0St9h/d8088Y01/g+IQfllG/UCv
	 kWFiSUHXGphB09x4dJuKVJ8+REimujKAO44foNPi6UwmlJ4M7tYfydKq64eb6Ak4UE
	 /QTceuKQGeYFQ==
Date: Fri, 10 Apr 2026 12:35:03 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v3 10/12] net: airoha: Do not stop GDM port if
 it is shared
Message-ID: <adjSV_ITucZItPjb@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-10-ab6ea49d59ff@kernel.org>
 <20260410025726.1810041-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8LLt8ct3/nBL/EoR"
Content-Disposition: inline
In-Reply-To: <20260410025726.1810041-1-kuba@kernel.org>
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


--8LLt8ct3/nBL/EoR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email says "For your consideration."
> ---
> net: airoha: Do not stop GDM port if it is shared
>=20
> Theoretically, in the current codebase, two independent net_devices can
> be connected to the same GDM port so we need to check the GDM port is not
> used by any other running net_device before setting the forward
> configuration to FE_PSE_PORT_DROP.
>=20
> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index fd27ba13029bd..5b0cd37b155e4 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>=20
> [ ... ]
>=20
> > @@ -1688,18 +1693,18 @@ static int airoha_dev_stop(struct net_device *n=
etdev)
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> >  	struct airoha_gdm_port *port =3D dev->port;
> >  	struct airoha_qdma *qdma =3D dev->qdma;
> > -	int i, err;
> > +	int i;
> > =20
> >  	netif_tx_disable(netdev);
> > -	err =3D airoha_set_vip_for_gdm_port(dev, false);
> > -	if (err)
> > -		return err;
> > -
> >  	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++)
> >  		netdev_tx_reset_subqueue(netdev, i);
> > =20
> > -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> > -				    FE_PSE_PORT_DROP);
> > +	if (atomic_dec_and_test(&port->users)) {
> > +		airoha_set_vip_for_gdm_port(dev, false);
> > +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> > +					    REG_GDM_FWD_CFG(port->id),
> > +					    FE_PSE_PORT_DROP);
> > +	}
> > =20
> >  	if (atomic_dec_and_test(&qdma->users)) {
> >  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> > 				  GLOBAL_CFG_TX_DMA_EN_MASK |
> > 				  GLOBAL_CFG_RX_DMA_EN_MASK);
> >=20
> > 		for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
> > 			if (!qdma->q_tx[i].ndesc)
> > 				continue;
> >=20
> > 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
> > 		}
> > 	}
>=20
> This problem wasn't introduced by this patch, but does the QDMA teardown
> path have a DMA corruption vulnerability here?
>=20
> When GLOBAL_CFG_TX_DMA_EN_MASK is cleared, it fails to poll
> GLOBAL_CFG_TX_DMA_BUSY_MASK, proceeding to unmap memory while the hardware
> DMA engine may still be processing in-flight descriptors.
>=20
> Furthermore, airoha_qdma_cleanup_tx_queue() unmaps the DMA addresses and
> frees the SKBs, but it does not appear to clear the physical hardware
> descriptors or reset the hardware ring pointers (REG_TX_CPU_IDX /
> REG_TX_DMA_IDX).
>=20
> When the device is later reopened in airoha_dev_open(),
> GLOBAL_CFG_TX_DMA_EN_MASK is set again without re-initializing the rings.
> Will the hardware DMA engine resume fetching from its previous index,
> processing stale descriptors whose backing memory was already unmapped
> and freed?

ack, I will work on it with a dedicated patch.

>=20
> [ ... ]
>=20
> > @@ -1851,10 +1856,22 @@ static void airoha_dev_get_stats64(struct net_d=
evice *netdev,
> >  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
> >  {
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_gdm_port *port =3D dev->port;
> > -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_eth *eth =3D dev->eth;
> > =20
> > +	cur_len =3D FIELD_GET(GDM_LONG_LEN_MASK,
> > +			    airoha_fe_rr(eth, REG_GDM_LEN_CFG(port->id)));
> > +	if (len < cur_len) {
> > +		u8 port_refcnt =3D atomic_read(&port->users);
> > +
> > +		/* We can decrease the device MTU just if the GDM port is
> > +		 * not shared or if the other device is not running.
> > +		 */
> > +		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
> > +			return -EBUSY;
> > +	}
> > +
>=20
> Does this MTU decrease validation create a state trap on shared ports?
>=20
> If both eth0 and eth1 (sharing a port) are up, and a user increases eth0 =
MTU
> to 9000, the hardware MTU updates to 9000. If the user then tries to lower
> eth0 MTU back to 1500, len < cur_len evaluates to true. Because eth1 is a=
lso
> up (port_refcnt > 1), this returns -EBUSY.
>=20
> This would prevent either interface from decreasing its MTU without fully
> bringing down the sibling interface.
>=20
> Should the software netdev->mtu be decoupled from the hardware validation,
> allowing valid MTU changes in software while dynamically programming the
> hardware MTU to the maximum of all currently up interfaces on the shared
> port?

It seems more correct to me avoid receiving in the stack packet bigger than=
 the
configured 'SW MTU".

Regards,
Lorenzo


--8LLt8ct3/nBL/EoR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadjSVwAKCRA6cBh0uS2t
rKGBAQDRSN/e8N+6AoxvLopfJBHvUijN7q4xUeofQsEYNntjygEAhNk5cQC8KD5p
37hLOLJqsp50UUBwxSDUH4e9phnmyAQ=
=5Ae+
-----END PGP SIGNATURE-----

--8LLt8ct3/nBL/EoR--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64127CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6GQT7Ejkt7iBdRGPtp3Ii2iOHNhQCuXivgT3YxHTso=; b=mscn1UpsnTMbKzLQ1CVFwDq9Ya
	HApXY8De1/dU+QnjmITdrBEvD8cw0pIVUtqFVy07v98QV+W3nVGAPm7w95tFrkX9/NPj7JMTbkTu+
	HoZ/6hl7rrAktD8LuPKpKiljvRAFuEUPXbU1PsY72Dt+W12OzSkKWI4INeW3uI1Pd/RfgpBG/ioLX
	NMbKC2DYIwwo53DE89I3Iv/SKOiDN18eCsMfpc1KUyHMXnEibQNIrStbNEZ5veNcDjKcSyTE8lQMx
	Me9VilrLYI4fb85VImyJQgQYa9m7j7PrdKIgAcF2x9gULy6dgHfVGHAE6SLAEKk15eRXDIIv/oMeG
	QZ8Bkjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLdY4-00000008dZO-489N;
	Sat, 09 May 2026 09:00:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLdY3-00000008dZ4-2TDk;
	Sat, 09 May 2026 09:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 546F560008;
	Sat,  9 May 2026 09:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87068C2BCB2;
	Sat,  9 May 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778317233;
	bh=ZqLpz2CFj28iASBq5rq8tyYLR7o5ybdmwFhd94Td2m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pP5r8Bhpm0NTMhVIzUfWOtGIwxDRr+p9wyNO5ZIeT0iScG9QjezvbYUzRJIH6hos/
	 LV1CTwl0sCAFeVQudLmrYvT+gMk1zNxdf+dq12q0Kdw26VkxWuaru4xA0u65jLr4ps
	 2rtxmqu1gQZpgHQ/zkgGJvGZOJ8O/zpJz1L3UeLs1H0wIPeKLe3V5v0kAigf+/D3V6
	 S72mUlJbtwzA9rnCzqnkmcRT9AtoxXiwEjFX1M8Igj1wiPHkijfBahVrAfAL6pH3AQ
	 nSZHmF1177Rk6g5rX9IFvJG3I2qbw7K6KUDSbV3fAABWfQWFhMoJ1uU0pCy2VBj2G2
	 XJsSFDSNoBGYA==
Date: Sat, 9 May 2026 11:00:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 08/10] net: airoha: Do not stop GDM port if
 it is shared
Message-ID: <af73rqYK1xCL-XsK@lore-desk>
References: <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
 <20260509014613.3558087-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lk/TFdVeNBlgNVPK"
Content-Disposition: inline
In-Reply-To: <20260509014613.3558087-1-kuba@kernel.org>
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


--Lk/TFdVeNBlgNVPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: airoha: Do not stop GDM port if it is shared
>=20
> This patch adds a per-port users refcount so the GDM forward configuration
> is only reset to FE_PSE_PORT_DROP when the last netdev attached to the
> shared GDM port stops, and it adjusts the MTU/length register updates to
> cope with the shared case.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 0253919714e0..1c4927c1aeb0 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1714,8 +1714,8 @@ static int airoha_dev_open(struct net_device *net=
dev)
> >  	int err, len =3D ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> >  	struct airoha_gdm_port *port =3D dev->port;
> > +	u32 cur_len, pse_port =3D FE_PSE_PORT_PPE1;
> >  	struct airoha_qdma *qdma =3D dev->qdma;
> > -	u32 pse_port =3D FE_PSE_PORT_PPE1;
> > =20
> >  	netif_tx_start_all_queues(netdev);
> >  	err =3D airoha_set_vip_for_gdm_port(dev, true);
> > @@ -1729,10 +1729,14 @@ static int airoha_dev_open(struct net_device *n=
etdev)
> >  		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
> >  				GDM_STAG_EN_MASK);
> > =20
> > -	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> > -		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> > -		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> > -		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> > +	cur_len =3D airoha_fe_get(qdma->eth, REG_GDM_LEN_CFG(port->id),
> > +				GDM_LONG_LEN_MASK);
> > +	if (!atomic_read(&port->users) || len > cur_len)
> > +		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> > +			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> > +			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> > +			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> > +	atomic_inc(&port->users);
>=20
> [Medium]
> When a second netdev opens with a larger MTU, this unconditionally
> widens GDM_LONG_LEN_MASK for the already-running sibling that has a
> smaller MTU:
>=20
> 	if (!atomic_read(&port->users) || len > cur_len)
> 		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> 			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> 			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> 			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
>=20
> Meanwhile airoha_dev_change_mtu() rejects shrinks (len < cur_len) with
> -EBUSY when the port is shared. Is this asymmetry intentional?

This is done intentionally since we do not want to break traffic of already
running net_device if we want to increase the MTU on a sibling net_device.

>=20
> With the new policy the hardware long-length ends up as the maximum of
> the two MTUs, so the smaller-MTU sibling silently accepts frames larger
> than its advertised MTU at the MAC level. Should opens that would
> increase the shared length also be gated (symmetric policy), or should
> the commit message and a comment document the chosen ceiling/floor
> behaviour?

I will add a comment in the code in v5.

>=20
> > =20
> >  	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
> >  			GLOBAL_CFG_TX_DMA_EN_MASK |
> > @@ -1762,8 +1766,12 @@ static int airoha_dev_stop(struct net_device *ne=
tdev)
> >  	for (i =3D 0; i < netdev->num_tx_queues; i++)
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
>=20
> [Low]
> Is the airoha_set_vip_for_gdm_port(dev, false) call inside the
> atomic_dec_and_test() block intentional?
>=20
> Looking at airoha_dev_stop() as a whole, the same call is already made
> unconditionally a few lines above:
>=20
> 	netif_tx_disable(netdev);
> 	airoha_set_vip_for_gdm_port(dev, false);
> 	for (i =3D 0; i < netdev->num_tx_queues; i++)
> 		netdev_tx_reset_subqueue(netdev, i);
>=20
> 	if (atomic_dec_and_test(&port->users)) {
> 		airoha_set_vip_for_gdm_port(dev, false);
> 		...
> 	}
>=20
> Since get_vip_port() derives the bit mask per-(port, dev->nbq) and
> airoha_fe_clear() of already-cleared bits is a no-op, the second call
> looks like dead code today. The commit log only mentions the
> FE_PSE_PORT_DROP gating, not VIP handling. Should the duplicate be
> dropped in v2?

ack, I will fix in v5.

>=20
> > =20
> >  	if (atomic_dec_and_test(&qdma->users)) {
> >  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> > @@ -1915,10 +1923,22 @@ static void airoha_dev_get_stats64(struct net_d=
evice *netdev,
> >  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
> >  {
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_gdm_port *port =3D dev->port;
> > -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
> >  	struct airoha_eth *eth =3D dev->eth;
> > =20
> > +	cur_len =3D airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
> > +				GDM_LONG_LEN_MASK);
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
> [Low]
> Why is port_refcnt typed as u8 here when atomic_read() returns int?
>=20
> 	u8 port_refcnt =3D atomic_read(&port->users);
>=20
> With AIROHA_MAX_NUM_GDM_DEVS currently 2 this cannot overflow, but a
> future bump of AIROHA_MAX_NUM_GDM_DEVS, or a refcount leak, that pushed
> port->users to 256 would wrap to 0 and quietly bypass both the
> port_refcnt > 1 and port_refcnt && !netif_running(netdev) checks,
> permitting MTU shrinks that are meant to be rejected. Would using int
> here (the type atomic_read() returns) be preferable?

ack, I will fix in v5.

Regards,
Lorenzo

>=20
> >  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
> >  		      GDM_LONG_LEN_MASK,
> >  		      FIELD_PREP(GDM_LONG_LEN_MASK, len));

--Lk/TFdVeNBlgNVPK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaf73rgAKCRA6cBh0uS2t
rGHbAQCU4qZQKNGV5iqcff0D6MaDhyAsSLJmi/W5EouwYcqncAEAmNiuT5ZIzpcH
4Mt+NqzHqJyEkeLUhvnoyxX86GhLUg8=
=akYS
-----END PGP SIGNATURE-----

--Lk/TFdVeNBlgNVPK--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF80E7E367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOTd3srgk4rrP4E6kQiY1BMbpnm51l6xf4nHD01pQ5g=; b=d9YIXARTWYdBSbwvSgcpZaxtKj
	It68E8aexdb/kJ++CAu7/UjkcFOnyCf8Ot5Df11i26P1EqR5f6jf+08DyafYCwZUIFuwZ8kj+p8xl
	DeKXzdqcrUcrDRXIwFLe9Bj5HR31Iq1nMl65pbXRtogRmlaZmSpVCW/90m0Bvp5PN3wHgjAqSjwgT
	Xagqumr7IqUdiBntiw8MUeLljam1Clf8aYPPGWI4qldhVjdr1R6kwSQpU/ktDGQeHInRVzGThpIWz
	X+GUsxcjo7jasBsjT3+myye8QGATrFB9vn7S/xZ6r7cYOCRO1yxQdW+k46goFIx+eZkQrjXuG/Xum
	hQU4pQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bbs-00000001sTo-1QKc;
	Fri, 03 Apr 2026 10:18:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bbr-00000001sTX-2Mwi;
	Fri, 03 Apr 2026 10:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD20660121;
	Fri,  3 Apr 2026 10:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6909C19423;
	Fri,  3 Apr 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775211518;
	bh=88tMHoUUWmi1PJoD+n4oQI0lN0JAMMrQTdtZ93Vgmsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuWoeCS7h902ubwxZePg8q5liA2YqnbSs0vmMCtIEJa4iZ9g6uh5qAe78HA66zVSo
	 zcHGAYJQl1TKeG2vOqOBI/egUoFcJMv4IpEvwF5795bTFnIvVeOOb1keeWbY8SBlVH
	 kePPWevvdj/vORgWSlfo4lqMVwxLX1LyBbbSrGWPiRG6qFZPcbWHMkxaOerkmd6jVH
	 acN0LgbwBO98ypTpPGIa/echLsWZ83d3mu1rsQFv1xqLifJTr/LOFX2DSZKBnb27z7
	 vuAfuPCKz1/CjrIelV9L4h4t7DiAlx9sNq3qdVaJlbtypRwc8vjWN5Jf+TYXal7OKL
	 pDnJhVBUYxFaQ==
Date: Fri, 3 Apr 2026 12:18:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 10/11] net: airoha: Do not stop GDM port if
 it is shared
Message-ID: <ac-T-4gbX9Fmhbtb@lore-desk>
References: <20260401-airoha-eth-multi-serdes-v2-10-ac427ae4beeb@kernel.org>
 <20260403011229.1785808-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8drteVwn+iFzTVzY"
Content-Disposition: inline
In-Reply-To: <20260403011229.1785808-1-kuba@kernel.org>
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


--8drteVwn+iFzTVzY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: airoha: Do not stop GDM port if it is shared
>=20
> This patch introduces a port->users reference counter to prevent setting
> the GDM port forward configuration to FE_PSE_PORT_DROP if another net_dev=
ice
> is still using the shared GDM port.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 0780fb8aacfb..3f9bce8c5370 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> [ ... ]
> > @@ -1681,9 +1682,6 @@ static int airoha_dev_stop(struct net_device *net=
dev)
> >  	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++)
> >  		netdev_tx_reset_subqueue(netdev, i);
> > =20
> > -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> > -				    FE_PSE_PORT_DROP);
> > -
> >  	if (atomic_dec_and_test(&qdma->users)) {
> >  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> >  				  GLOBAL_CFG_TX_DMA_EN_MASK |
>=20
> While this patch aims to support shared GDM ports, does the remaining
> unconditional call to airoha_set_vip_for_gdm_port(dev, false) at the start
> of airoha_dev_stop() break other active devices sharing the port?
>=20
> static int airoha_dev_stop(struct net_device *netdev)
> {
>         ...
>         err =3D airoha_set_vip_for_gdm_port(dev, false);
>         ...
> }
>=20
> This appears to clear the REG_FE_VIP_PORT_EN and REG_FE_IFC_PORT_EN hardw=
are
> bits for the physical port, which might instantly kill traffic for any ot=
her
> active interface using the shared port.
>=20
> Similarly, in airoha_dev_open() and airoha_dev_change_mtu(), the
> REG_GDM_LEN_CFG (MTU) is overwritten unconditionally. If a device with a
> smaller MTU is brought up, will it overwrite the shared port's MTU limit
> and cause the hardware to silently drop larger packets for the other devi=
ce?

ack, I will fix it in v3.

>=20
> [ ... ]
> > @@ -1697,6 +1695,11 @@ static int airoha_dev_stop(struct net_device *ne=
tdev)
> >  		}
> >  	}
> > =20
> > +	if (atomic_dec_and_test(&port->users))
> > +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> > +					    REG_GDM_FWD_CFG(port->id),
> > +					    FE_PSE_PORT_DROP);
> > +
> >  	return 0;
> >  }
>=20
> Does moving this FE_PSE_PORT_DROP configuration to the end of airoha_dev_=
stop()
> cause a race condition when stopping the device?
>=20
> In airoha_dev_open(), the driver correctly enables the QDMA engine before
> configuring the GDM port to forward packets. A safe teardown typically
> mirrors this by first stopping the packet source (setting FE_PSE_PORT_DRO=
P)
> and then disabling the destination DMA engine.
>=20
> By moving airoha_set_gdm_port_fwd_cfg() after the airoha_qdma_clear() blo=
ck,
> when both qdma->users and port->users reach zero, the QDMA engine and its
> queues are shut down while the GDM port is still actively forwarding pack=
ets.
>=20
> Could incoming packets be forwarded to a disabled DMA engine during this
> window, risking hardware lockups or buffer leaks?

ack, I will fix it in v3.

Regards,
Lorenzo

--8drteVwn+iFzTVzY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCac+T+wAKCRA6cBh0uS2t
rBm2AQCvBVHq6iuxtRf5otgmibRNOjubyAtWc+9ULdeW0GtT6AD+M6TIdwlOOCIg
GsdGbqFmP8JPFncb7+dbSHLUnEJBuQc=
=qvfH
-----END PGP SIGNATURE-----

--8drteVwn+iFzTVzY--


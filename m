Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F518CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34cesB0P22WcI/oVO6Og7H3r+yfNQHtFVNEEqxhn6sk=; b=m/82gf/Ix7YGGHImCjXHEXOWm/
	4aVDHy/FCtOV6KVV8SrIyYEfXTUhWz8/Xkcma2bua4rIoEAb0qyA2V794RNBnyI8SesV0K6ayzvq7
	POR6ba/zj2zFth/GxaRfnZzSSVJ4jBe54Tqu2sXAgGjoEpFTRZiXaZpQPE6cfdqUesvRMaiIMJFlq
	9WoTtL7deFcZlbw7KKYbJOcGsCkytL+LcPe4zBz+aP/aY28hvvnwkWyhjvRZMdWnvApSuHJPmrZ0q
	xJR6Q4Qw4Hf60EIG6cf0+2FgyGIOPX1DPVUBXEOcDzayMtqiXBXXev5yjZDHdP8D7F6cv+54Jjt1T
	waANmwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd0a-00000008ZXM-0GQe;
	Sat, 09 May 2026 08:26:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd0Z-00000008ZX1-0Mly;
	Sat, 09 May 2026 08:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB3B26024D;
	Sat,  9 May 2026 08:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077A5C2BCB4;
	Sat,  9 May 2026 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778315157;
	bh=nczlNiIr/A9xdNyg6rE5uVSARRuTIZ7Uz1A5NFRANqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCVVtO4GspLXm5oU2Y+5HmrgHaQiFURcpPBaQjKOGDVaLDRBN27A8bkvOo394mwtJ
	 a6liRN/2eMOSZd7Df3DCnUreka/54xDgLu7tAQgtk9B3j//rIFq6oyH9gspoGn2BdC
	 MWSo54itWTgPWgCNMmXHNez2IsZKTgvMY2K7hvh83lhaXIPQYBu91IFSyluwh+luiD
	 +ZPIxUoKXYry1c6j30Ut5bhLHkeOmIxbPdhf7cuJXv11GTHNAN6rza+tR2/rC5ABwB
	 v3TZ0LerSeoUsT4CB9hSHcMcH8CghGTX/VJ1QsgxDqrat8iP7iKHoHUf0G+xw9/n3p
	 kHIu7Om+b2lTg==
Date: Sat, 9 May 2026 10:25:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 07/10] net: airoha: Support multiple
 net_devices for a single FE GDM port
Message-ID: <af7vkpjEY5FhlEyc@lore-desk>
References: <20260507-airoha-eth-multi-serdes-v4-7-af613b61ae02@kernel.org>
 <20260509014611.3558060-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YnCVD7Lr1XicTVN0"
Content-Disposition: inline
In-Reply-To: <20260509014611.3558060-1-kuba@kernel.org>
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


--YnCVD7Lr1XicTVN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: airoha: Support multiple net_devices for a single FE GDM port
>=20
> This commit introduces support for multiple net_devices connected to the
> same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hardware
> arbiter on EN7581 or AN7583 SoCs, and adds a get_dev_from_sport callback
> to differentiate between the net_devices attached to each port.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 786bc677af3c..0253919714e0 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>=20
> [ ... ]
>=20
> > @@ -3188,14 +3257,23 @@ static int airoha_probe(struct platform_device =
*pdev)
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> >  		struct airoha_gdm_port *port =3D eth->ports[i];
> > -		struct airoha_gdm_dev *dev;
> > +		int j;
> > =20
> >  		if (!port)
> >  			continue;
> > =20
> > -		dev =3D port->dev;
> > -		if (dev && dev->dev->reg_state =3D=3D NETREG_REGISTERED)
> > -			unregister_netdev(dev->dev);
> > +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> > +			struct airoha_gdm_dev *dev =3D port->devs[j];
> > +			struct net_device *netdev;
> > +
> > +			if (!dev)
> > +				continue;
> > +
> > +			netdev =3D dev->dev;
> > +			of_node_put(netdev->dev.of_node);
> > +			if (netdev->reg_state =3D=3D NETREG_REGISTERED)
> > +				unregister_netdev(netdev);
> > +		}
> >  		airoha_metadata_dst_free(port);
> >  	}
> >  	airoha_hw_cleanup(eth);
>=20
> [Medium]
> Is the ordering of of_node_put() and unregister_netdev() here correct?
>=20
> airoha_alloc_gdm_device() now does:
>=20
> 	netdev->dev.of_node =3D of_node_get(np);
>=20
> so the netdev holds its own reference to the of_node for its entire
> registered lifetime. In this error unwind the of_node_put() runs before
> unregister_netdev(), and netdev->dev.of_node is not cleared, so any
> subsequent access to netdev->dev.of_node during unregistration (netdev
> notifiers, sysfs, overlay-aware code) would be looking at a node whose
> reference count has already been dropped.
>=20
> Other drivers (e.g., drivers/net/ethernet/hisilicon/hns/hns_enet.c in
> hns_nic_dev_remove()) put the node only after unregister_netdev().
>=20
> Would swapping the order to call unregister_netdev() first, then
> of_node_put(), be more appropriate here?

ack, I will fix it in v5.

>=20
> > @@ -3216,14 +3294,22 @@ static void airoha_remove(struct platform_devic=
e *pdev)
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> >  		struct airoha_gdm_port *port =3D eth->ports[i];
> > -		struct airoha_gdm_dev *dev;
> > +		int j;
> > =20
> >  		if (!port)
> >  			continue;
> > =20
> > -		dev =3D port->dev;
> > -		if (dev)
> > -			unregister_netdev(dev->dev);
> > +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> > +			struct airoha_gdm_dev *dev =3D port->devs[j];
> > +			struct net_device *netdev;
> > +
> > +			if (!dev)
> > +				continue;
> > +
> > +			netdev =3D dev->dev;
> > +			of_node_put(netdev->dev.of_node);
> > +			unregister_netdev(netdev);
> > +		}
> >  		airoha_metadata_dst_free(port);
> >  	}
> >  	airoha_hw_cleanup(eth);
>=20
> [Medium]
> Same question in airoha_remove(): the of_node_put() fires before
> unregister_netdev(), while netdev->dev.of_node is still assigned. Would
> this be safer with the unregister first and the put afterwards?

ack, I will fix it in v5.

>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/eth=
ernet/airoha/airoha_eth.h
> > index 3e93919a175c..207c75152fde 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
>=20
> [ ... ]
>=20
> > @@ -542,14 +543,15 @@ struct airoha_qdma {
> >  struct airoha_gdm_dev {
> >  	struct airoha_gdm_port *port;
> >  	struct airoha_qdma *qdma;
> > -	struct net_device *dev;
> >  	struct airoha_eth *eth;
> > +	struct net_device *dev;
> > +
> > +	int nbq;
> >  };
> > =20
> >  struct airoha_gdm_port {
> > -	struct airoha_gdm_dev *dev;
> > +	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
> >  	int id;
> > -	int nbq;
> > =20
> >  	struct airoha_hw_stats stats;
>=20
> [Medium]
> With multiple airoha_gdm_dev instances now sharing a single
> airoha_gdm_port, do the per-netdev statistics need to become per-netdev
> rather than per-port?
>=20
> airoha_dev_get_stats64(), airoha_ethtool_get_mac_stats() and
> airoha_ethtool_get_rmon_stats() all read from dev->port->stats, and the
> underlying hardware counters at REG_FE_GDM_*_CNT(port->id) are per-GDM
> port rather than per-netdev. When two netdevs share a port (for example
> PCIE0/PCIE1 on EN7581 GDM3, or ETH/USB on GDM4), both netdevs would
> report identical port-wide counters via rtnl_link_stats64 (ip -s link
> show) and via the get_eth_mac_stats/get_rmon_stats ethtool callbacks,
> and summing across the two netdevs would double-count.
>=20
> Would it make sense to maintain per-netdev software counters in the
> xmit/RX paths for the multi-dev case so each netdev reports its own
> traffic through the standard uAPI?

We have already a separated patch to address this issue that is not part of=
 the
series. I will add it to the v5 in the next iteration.

Regards,
Lorenzo

--YnCVD7Lr1XicTVN0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaf7vkgAKCRA6cBh0uS2t
rNx6AP4vp7fBv+mMgpov4j4sMb2X2lfK18z7Rdr86kjr3iuVkQEA2v2JFYUsriWf
RBzOd9kloGcV9h2okyFY1MsyXDH1uAY=
=LwTq
-----END PGP SIGNATURE-----

--YnCVD7Lr1XicTVN0--


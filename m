Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6745EE7E364
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfRg7JhxgO22hv4vWTi7qx0wPWni4jPw9gnG9lj7S84=; b=PyrqkAXoYjS2dVz3S9KbR11Jvk
	1SmPGPnkutelJgkzgdyva4PABRY7IjBqGT3BjFy5PjUbLrDsygt0fbwTBeXqFImdaT3gsYpjyq+Mx
	afatjdR0MGafAPL4WMkD7tNnR4EeA+yhyDowrsdSxvJddl2XiPW0dIZh6Crmo0yRg/RhQymjR30ZD
	SL8aHblCAJfGgMa5JOq3RHMu2VvK+otvwtqWnEKmZGIBxSZV76np0BWuPcSMg+pXtHJTYca81x5bq
	pk9VURjfSjKW8PtkIsFHy2wuU5NdQmcPxGi+tIHtDkntKB2wTrS2UzIIZqWA+B0AXUWE2XNLTamsV
	qdD35cNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bbQ-00000001sOF-1zvd;
	Fri, 03 Apr 2026 10:18:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bbO-00000001sO1-43tt;
	Fri, 03 Apr 2026 10:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 029D960008;
	Fri,  3 Apr 2026 10:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F41CC4CEF7;
	Fri,  3 Apr 2026 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775211489;
	bh=gnO1TPgDaKN0Jehro+SBn82RW/6IA1b93dtYQWKMCk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bG6aHuwiQKPtfqhem1Q0+Uy42nD+WovXzdsuTbPT5MlR3StVje5XoD14o+64+H2vY
	 ygzwEseyG5seQJ1Jdzz/Ybsw99HBkNJI6OBOdc3oI+/xwbFUqozVG5qNLRQY3/iD8G
	 mRkH3YwjdrtptG8T/k10LIDBM8WaXvu0L4sCR/8SB3BNpHnU+LZAirWnj4jdMMeNsF
	 C6GoC17k+Yah2ogHJdUutH2WIsTAvC7y8c3t6wQIvT675Plx90F3vgxqVgjeh8Sw8P
	 tc7hc8KMxR83NtUt5gn+IkqP7UA+Ac531Fvdg6SeTP/6k3XdMrthgTuLwS05a/xCf/
	 YFem104TfOCDQ==
Date: Fri, 3 Apr 2026 12:18:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 09/11] net: airoha: Support multiple
 net_devices for a single FE GDM port
Message-ID: <ac-T31bmPzp7hqbA@lore-desk>
References: <20260401-airoha-eth-multi-serdes-v2-9-ac427ae4beeb@kernel.org>
 <20260403011208.1784815-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uANK1J/2luT5WIud"
Content-Disposition: inline
In-Reply-To: <20260403011208.1784815-1-kuba@kernel.org>
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


--uANK1J/2luT5WIud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> Subject: net: airoha: Support multiple net_devices for a single FE GDM po=
rt
>=20
> This commit introduces support for multiple net_devices connected to the
> same Frame Engine (FE) GDM port via an external hardware arbiter. It
> adds logic to parse device tree child nodes and instantiate separate
> net_devices for TDM traffic from external SerDes.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 5e489e8593ba..0780fb8aacfb 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> [ ... ]
> > @@ -614,9 +616,8 @@ static int airoha_qdma_rx_process(struct airoha_que=
ue *q, int budget)
> >  		u32 hash, reason, msg1 =3D le32_to_cpu(desc->msg1);
> >  		struct page *page =3D virt_to_head_page(e->buf);
> >  		u32 desc_ctrl =3D le32_to_cpu(desc->ctrl);
> > -		struct airoha_gdm_port *port;
> > -		struct net_device *netdev;
> > -		int data_len, len, p;
> > +		struct airoha_gdm_dev *dev;
> > +		int data_len, len;
> > =20
> >  		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
> >  			break;
> > @@ -633,12 +634,10 @@ static int airoha_qdma_rx_process(struct airoha_q=
ueue *q, int budget)
> >  		if (!len || data_len < len)
> >  			goto free_frag;
> > =20
> > -		p =3D airoha_qdma_get_gdm_port(eth, desc);
> > -		if (p < 0 || !eth->ports[p])
> > +		dev =3D airoha_qdma_get_gdm_dev(eth, desc);
> > +		if (IS_ERR(dev))
> >  			goto free_frag;
>=20
> If a scattered frame is being processed (q->skb is not NULL) and IS_ERR(d=
ev)
> triggers the goto free_frag, the error handler frees the skb:
>=20
> free_frag:
> 	if (q->skb) {
> 		dev_kfree_skb(q->skb);
> 		q->skb =3D NULL;
> 	} else {
> 		page_pool_put_full_page(q->page_pool, page, true);
> 	}
>=20
> Since the current fragment's page is not yet attached to q->skb, does this
> skip the else branch and permanently leak the page pool buffer?

This issue is fixed in the following net patch (not merged yet):

https://lore.kernel.org/netdev/20260402-airoha_qdma_rx_process-mem-leak-fix=
-v1-1-b5706f402d3c@kernel.org/

>=20
> [ ... ]
> > @@ -1747,9 +1748,7 @@ static int airoha_set_gdm2_loopback(struct airoha=
_gdm_dev *dev)
> >  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
> >  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
> > =20
> > -	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
> > -	nbq =3D port->id =3D=3D AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : =
0;
> > -	src_port =3D eth->soc->ops.get_src_port_id(port, nbq);
> > +	src_port =3D eth->soc->ops.get_src_port_id(port, dev->nbq);
> >  	if (src_port < 0)
> >  		return src_port;
>=20
> With multiple net_devices instantiated for the same physical GDM port, do=
es
> the initialization of sibling devices overwrite shared hardware registers?
>=20
> For example, when airoha_set_gdm2_loopback() uses src_port to configure
> REG_FE_WAN_PORT, it explicitly clears the WAN port routing masks:
>=20
> 	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> 		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> 		      FIELD_PREP(WAN0_MASK, src_port));
>=20
> Will the last initialized device clobber the WAN routing configurations a=
nd
> hardware MAC filters for the others, causing their traffic to be dropped?

ack, I will fix it in v3.

>=20
> [ ... ]
> > @@ -1970,7 +1969,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff=
 *skb,
> >  	}
> > =20
> >  	fport =3D airoha_get_fe_port(dev);
> > -	msg1 =3D FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
> > +	msg1 =3D FIELD_PREP(QDMA_ETH_TXMSG_NBOQ_MASK, dev->nbq) |
> > +	       FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
> >  	       FIELD_PREP(QDMA_ETH_TXMSG_METER_MASK, 0x7f);
> > =20
> >  	q =3D &qdma->q_tx[qid];
>=20
> When multiple net_devices share a single QDMA instance and its TX rings
> (qdma->q_tx), a TX queue stall might occur here.
>=20
> If the shared hardware ring fills up, netif_tx_stop_queue() stops the
> transmitting device's queue. Later, when descriptors are freed, the driver
> only wakes the queue corresponding to the specific packet that just compl=
eted.
>=20
> If multiple devices' TX queues are stopped, will the other devices' queues
> remain stalled unless their specific packets happen to be processed?

This does not seem strictly related to this series. I will look into it in a
dedicated patch.

>=20
> [ ... ]
> > @@ -2897,10 +2900,11 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth =
*eth,
> > =20
> >  static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  				   struct airoha_gdm_port *port,
> > -				   struct device_node *np)
> > +				   int nbq, struct device_node *np)
> >  {
> > -	struct airoha_gdm_dev *dev;
> >  	struct net_device *netdev;
> > +	struct airoha_gdm_dev *dev;
> > +	u8 index;
> >  	int err;
> [ ... ]
> > +	/* Allowed nbq for EN7581 on GDM3 port are 4 and 5 for PCIE0
> > +	 * and PCIE1 respectively.
> > +	 */
> > +	index =3D nbq;
> > +	if (airoha_is_7581(eth) && port->id =3D=3D AIROHA_GDM3_IDX)
> > +		index -=3D 4;
> > +
> > +	if (index >=3D ARRAY_SIZE(port->devs) || port->devs[index]) {
> > +		dev_err(eth->dev, "invalid nbq id: %d\n", nbq);
> > +		return -EINVAL;
> > +	}
>=20
> There are two potential issues regarding the new index logic:
>=20
> First, does this break probing for older device trees without child nodes?
> When falling back to airoha_alloc_gdm_device(..., 0, np) with nbq =3D 0,
> the index -=3D 4 operation for AIROHA_GDM3_IDX will cause the u8 index to
> underflow to 252. The bounds check 252 >=3D 2 fails, returning -EINVAL.

ack, I will fix it in v3.

>=20
> Second, can an invalid device tree value bypass the bounds check?
> The int nbq parameter is directly assigned to the u8 index. If a large va=
lue
> like reg =3D <256> is provided, it truncates to 0, passing the index >=3D=
 2
> check. The un-truncated int nbq is then stored in dev->nbq, potentially
> causing out-of-bounds shifts when used in hardware macros.

ack, I will fix it in v3.

>=20
> [ ... ]
> > @@ -2986,7 +3004,36 @@ static int airoha_alloc_gdm_port(struct airoha_e=
th *eth,
> >  	if (err)
> >  		return err;
> > =20
> > -	return airoha_alloc_gdm_device(eth, port, np);
> > +	for_each_child_of_node(np, node) {
> > +		/* Multiple external serdes connected to the FE GDM port via an
> > +		 * external arbiter.
> > +		 */
> > +		const __be32 *nbq_ptr;
> > +
> > +		if (!of_device_is_compatible(node, "airoha,eth-port"))
> > +			continue;
> > +
> > +		d++;
> > +		if (!of_device_is_available(node))
> > +			continue;
> > +
> > +		nbq_ptr =3D of_get_property(node, "reg", NULL);
> > +		if (!nbq_ptr) {
> > +			dev_err(eth->dev, "missing nbq id\n");
> > +			err =3D -EINVAL;
> > +			of_node_put(node);
> > +			break;
> > +		}
> > +
> > +		err =3D airoha_alloc_gdm_device(eth, port, be32_to_cpup(nbq_ptr),
> > +					      node);
> > +		if (err) {
> > +			of_node_put(node);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	return !d ? airoha_alloc_gdm_device(eth, port, 0, np) : 0;
> >  }
>=20
> If nbq_ptr is missing, err =3D -EINVAL is set and the loop breaks. Howeve=
r,
> since the child counter d was already incremented, the final statement
> evaluates to 0 (success) because !d is false.
>=20
> Does this swallow the -EINVAL error and cause a silent failure where the
> driver continues probing without initializing the misconfigured GDM devic=
es?
>=20
> Additionally, the for_each_child_of_node() iterator automatically handles
> taking and dropping the reference to node.
>=20
> When node is passed to airoha_alloc_gdm_device(), it is directly assigned:
> netdev->dev.of_node =3D np;
>=20
> Since of_node_get() is not called, when the loop iteration finishes and d=
rops
> the reference, does this leave the net_device pointing to a freed device
> tree node?

ack, I will fix it in v3.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--uANK1J/2luT5WIud
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCac+T3wAKCRA6cBh0uS2t
rD8uAQDLwW+kRrIkaKBLR1QF49omOiYp+YjFijcbAKEE/A1lWAD9GoWKnBmEB+A1
wsVr9oMXxS/1lbttP9QypribarRFtAU=
=maWk
-----END PGP SIGNATURE-----

--uANK1J/2luT5WIud--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og6o7ZEgF06jekY5XOw6F9PY6d5VMFdiUNMLpvHn7Yk=; b=qdOM70wKnDTCPI+luoSd4XKD5b
	OMuzOV75AMs8v9OvRhBIqdbRhf3DPbNO1Pnsp4hz3FGFzXkkG0sKZ9yv9+gQ+OQPW2ngZ3y5fz0LY
	DVByzOofx/JozOWZKbh5MGmC7PxfDPwSfu4PK/t/EVNcuOJBJxyjfPj/Tsvk6r5NjQN6BMdm9F+VK
	NcqQ8dCsHCP6I07N1EPLu30IC+dQTpdq7ynL08ycRHPeqtWeDPaN3hqWrDwynU8ygBXkbVucL0Uq6
	0UqU7RTZKsnlJl6G1zi0xaOZhcrN84qmsqSSOTtWiCkBVQxqRic00oPZLmTL8EM74g9C07H4xHMn2
	mf0dwmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcWJ-00000008X4p-2Mgw;
	Sat, 09 May 2026 07:54:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcWG-00000008X3r-3yWh;
	Sat, 09 May 2026 07:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28FF342E49;
	Sat,  9 May 2026 07:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A89AC2BCB2;
	Sat,  9 May 2026 07:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778313280;
	bh=zxyz8FDN5UzWDUVCt3tWqjRCa0K5HokRsZajA9FWsek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0rzUBvTmVfwTVwe7CTcEVYs2+fRAl+LvX7Voh1dmP5UGx4KZ+7xkZLgR0KsHByP+
	 2WsukQoAQ2WdzXCU4g9J/XIFmPr7qwiCjTok/Sm0ctfGdPq+cW7YULTR7VRzbycW4r
	 mMur2I3fBXKo7hwVWOelVhqGnK4icBPDEVBpgzN6Yng39xHunQM7WlHBCGZ6zvoTRd
	 FGI9eRAYM6GEMIkRLRv0Q8S7gGxf75se8CG0mHWF5Xc0fx7y4H9m/ep+Fsr7VPmwzU
	 YgvczEoW8dyerxHy0ZQGJwNYCBF0Y48vrtYZFeMJbDe//5a9QQ7fSwBklvWfXZzy1O
	 kfVIjRHxOzBcw==
Date: Sat, 9 May 2026 09:54:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 05/10] net: airoha: Move qos_sq_bmap in
 airoha_qdma struct
Message-ID: <af7oPWp43eMDmolL@lore-desk>
References: <20260507-airoha-eth-multi-serdes-v4-5-af613b61ae02@kernel.org>
 <20260509014609.3558041-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xd5dB8WzQ5hyc0ai"
Content-Disposition: inline
In-Reply-To: <20260509014609.3558041-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_005441_031520_22ED4BFE 
X-CRM114-Status: GOOD (  28.74  )
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


--Xd5dB8WzQ5hyc0ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 08, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
>     net: airoha: Move qos_sq_bmap in airoha_qdma struct
>=20
> The change moves the HTB-offload channel-allocation bitmap from the
> per-netdev airoha_gdm_port to the per-QDMA airoha_qdma, so sibling
> netdevs attached to different QDMA blocks no longer clobber each other's
> bitmap.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 080705e2f58d..69a4c2e0d58b 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2600,7 +2600,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct =
net_device *netdev,
> >  	u32 rate =3D div_u64(opt->rate, 1000) << 3; /* kbps */
> >  	int err, num_tx_queues =3D netdev->real_num_tx_queues;
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > -	struct airoha_gdm_port *port =3D dev->port;
> > +	struct airoha_qdma *qdma =3D dev->qdma;
> > =20
> >  	if (opt->parent_classid !=3D TC_HTB_CLASSID_ROOT) {
> >  		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
> > @@ -2627,7 +2627,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct =
net_device *netdev,
> >  		return err;
> >  	}
> > =20
> > -	set_bit(channel, port->qos_sq_bmap);
> > +	set_bit(channel, qdma->qos_sq_bmap);
> >  	opt->qid =3D AIROHA_NUM_TX_RING + channel;
> > =20
> >  	return 0;
>=20
> [High]
> Now that qos_sq_bmap is per-QDMA, can two sibling netdevs that share the
> same QDMA block collide on allocation?  On EN7581, GDM2/GDM3/GDM4 all
> select the same qdma pointer via:
>=20
>     drivers/net/ethernet/airoha/airoha_eth.c:
>         /* QDMA0 is used for lan ports while QDMA1 is used for WAN ports =
*/
>         dev->qdma =3D &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
>=20
> and airoha_is_lan_gdm_dev() returns true only for port->id =3D=3D 1, so
> every non-LAN GDM netdev resolves to eth->qdma[1] and shares
> qdma->qos_sq_bmap.
>=20
> The allocation path does not test the bit before setting it:
>=20
>     channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
>     ...
>     set_bit(channel, qdma->qos_sq_bmap);
>     opt->qid =3D AIROHA_NUM_TX_RING + channel;
>=20
> If two sibling netdevs on the same QDMA pick classids whose TC_H_MIN
> maps to the same channel, both airoha_qdma_set_tx_rate_limit() calls
> program the same HW TRTCM egress slot, the later caller silently
> overwrites the earlier configuration, and both netdevs receive the same
> opt->qid.  Should this path use test_and_set_bit() (or similar owner
> tracking) to reject a channel already owned by a sibling netdev?

ack, I think we should move qos_sq_bmap in airoha_gdm_dev struct and track =
if a
shared qdma qos channel is already in use. I will fix it in v5.

>=20
> > @@ -2811,11 +2811,11 @@ static int airoha_dev_setup_tc_block(struct net=
_device *dev,
> >  static void airoha_tc_remove_htb_queue(struct net_device *netdev, int =
queue)
> >  {
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > -	struct airoha_gdm_port *port =3D dev->port;
> > +	struct airoha_qdma *qdma =3D dev->qdma;
> > =20
> >  	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
> >  	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
> > -	clear_bit(queue, port->qos_sq_bmap);
> > +	clear_bit(queue, qdma->qos_sq_bmap);
> >  }
>=20
> [High]
> airoha_tc_remove_htb_queue() operates unconditionally on the caller's
> netdev but clears a bit that may be owned by a sibling netdev on the
> same QDMA.  The effects that follow look like cross-netdev interference:
>=20
>   - netif_set_real_num_tx_queues(netdev, real_num_tx_queues - 1)
>     decrements the caller's tx-queue count for a queue it never
>     allocated, and its return value is discarded (eventually the txq<1
>     EINVAL guard in netif_set_real_num_tx_queues() will trip silently).
>=20
>   - airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0) zeros the
>     egress TRTCM rate-limit registers for a channel that the sibling
>     netdev still considers active.
>=20
>   - clear_bit(queue, qdma->qos_sq_bmap) then hides the channel from the
>     legitimate owner's later test_bit() checks.

This issue will be fixed by the change described above. I will fix it in v5.

>=20
> > @@ -2838,10 +2838,10 @@ static int airoha_tc_htb_delete_leaf_queue(stru=
ct net_device *netdev,
> >  static int airoha_tc_htb_destroy(struct net_device *netdev)
> >  {
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > -	struct airoha_gdm_port *port =3D dev->port;
> > +	struct airoha_qdma *qdma =3D dev->qdma;
> >  	int q;
> > =20
> > -	for_each_set_bit(q, port->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
> > +	for_each_set_bit(q, qdma->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
> >  		airoha_tc_remove_htb_queue(netdev, q);
> > =20
> >  	return 0;
> >  }
>=20
> [High]
> Does airoha_tc_htb_destroy() now walk bits owned by sibling netdevs?
> The iteration no longer filters by owning netdev:
>=20
>     for_each_set_bit(q, qdma->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
>         airoha_tc_remove_htb_queue(netdev, q);
>=20
> Previously each netdev had a private bitmap, so destroy could only
> touch its own channels.  After this change, tearing down HTB on one
> GDM netdev appears to remove channels and clear rate-limit HW state
> belonging to every sibling GDM netdev on the same QDMA.  A subsequent
> tc-htb delete or get on the legitimate owner then hits:
>=20
>     if (!test_bit(channel, qdma->qos_sq_bmap)) {
>         NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
>         return -EINVAL;
>     }
>=20
> Should the bitmap track the owning netdev alongside the bit (for
> example a per-channel owner pointer, or a per-netdev sub-bitmap inside
> airoha_qdma), so that destroy/delete can only touch channels owned by
> the caller?

This issue will be fixed by the change described above. I will fix it in v5.

Regards,
Lorenzo

>=20
> > @@ -2852,9 +2852,9 @@ static int airoha_tc_get_htb_get_leaf_queue(struc=
t net_device *netdev,
> >  {
> >  	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
> >  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> > -	struct airoha_gdm_port *port =3D dev->port;
> > +	struct airoha_qdma *qdma =3D dev->qdma;
> > =20
> > -	if (!test_bit(channel, port->qos_sq_bmap)) {
> > +	if (!test_bit(channel, qdma->qos_sq_bmap)) {
> >  		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
> >  		return -EINVAL;
> >  	}

--Xd5dB8WzQ5hyc0ai
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaf7oPQAKCRA6cBh0uS2t
rN3RAQCwaawlr2yErx3LmHhe0E+rMXHt3D2fiJwpOoWIsi7hiQEAi8DO4s7DF7IM
P/IEb6FGOSDFfHmE1ucbwpvLwHIbngg=
=tFrn
-----END PGP SIGNATURE-----

--Xd5dB8WzQ5hyc0ai--


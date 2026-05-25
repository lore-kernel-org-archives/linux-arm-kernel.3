Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E676CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ldrpg8oGe2gxlwuergjpDOcn7wyRCXPWMyE5KdnSBs=; b=EgnbRBbPeU0YItoOe6vPlFNyNd
	y/4efMB2ardfKvV5sD37rvrJlpYRdy62ZMlWpd5Djw3Ymdl7Jkt64XMw9fWFkcY+k/4PkNPiIZqGa
	fFhEWib3g019m1sUePSnGFFjDV4SCNRzLFsFqtt1EzNB/UMP5eyCskT/S4vhP0e9sqI7ZMlDUm+V4
	r7/4i1CK/7PxuhIsX779Tpi5/ANzFEEhY/ExYabepugI9EOGZ30gtd2yxgsATlds4+WaVCqwStOYB
	ZDFhR8gjrxtfGvKiGJZP6292XfamzdBK5DsIKGFNylEC1E0HOgMYNa+jMv3gYXasuCnkPEFIET7YO
	f7fBCLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRX62-0000000HVNF-1poF;
	Mon, 25 May 2026 15:20:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRX5z-0000000HVMN-3ays;
	Mon, 25 May 2026 15:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1071240640;
	Mon, 25 May 2026 15:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2DC1F000E9;
	Mon, 25 May 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779722398;
	bh=3Ldrpg8oGe2gxlwuergjpDOcn7wyRCXPWMyE5KdnSBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGXk0T1A+H1gESuuyQ5x5VrWTQf8d+JqQR4HgWhUrnxXyZMYilodVayOEJXIKOwa8
	 Tbl2YyRR9d/3kGHnADosTRsALHWge78POVUYyzHL9qvgvEjvGwCf+bTcW5cttZZ6HW
	 d9EF7ivVlXL7U8vcUW0dWDSNGcK6bGosNtY8jul0+1trm1u5jeqxk/lcbmxaUpcW8C
	 fhnjqQ38PwMhk5dzCInddnUiSidLSSC8DZlnGpyxaBsG2Z48aRXnNkpfHQefj13jh/
	 NcVqvyTJK/N3kRJ/0tAWS2cHwAl+8j9h2gF2R+rLGJFpWObG54J++xzZgKMV+Nh6Dd
	 iKApsQzAJwVcA==
Date: Mon, 25 May 2026 17:19:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jihong Min <hurryman2212@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: bind WLAN-bound flows on PPE
 driver L2 cache miss
Message-ID: <ahRonGRDCqdFTBQm@lore-desk>
References: <20260524224330.3995807-1-hurryman2212@gmail.com>
 <ahQDon-nio0STA4E@lore-desk>
 <a08289e7-641c-489e-8d89-6eae9f092f90@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gg8YQr2jQ3M7KWtf"
Content-Disposition: inline
In-Reply-To: <a08289e7-641c-489e-8d89-6eae9f092f90@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_081959_941374_7ADE9449 
X-CRM114-Status: GOOD (  44.31  )
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


--Gg8YQr2jQ3M7KWtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 5/25/26 17:09, Lorenzo Bianconi wrote:
> >> The Linux bridge FDB can resolve a destination station to WDMA even wh=
en
> >> the Airoha PPE driver's L2 offload cache has no entry for that MAC pai=
r.
> >> The normal bind path only checks the PPE driver's L2 offload cache, so=
 an
> >> unbound PPE hit for WLAN egress can stay unbound even though the bridge
> >> already knows the right output path, unless a later offload event fills
> >> that PPE driver cache.
> >>
> >> This matters for bridge-visible WLAN egress, such as wired-to-WLAN
> >> forwarding or WLAN peer forwarding across another BSS, radio or MLO li=
nk.
> >> Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
> >> datapath and is not covered.
> >=20
> > Hi Jihong,
>=20
> Hi, Lorenzo.
>=20
> >=20
> > In order to offload L2 flows, I assume you are using the OpenWrt bridger
> > package, right?
>=20
> Actually, no.
>=20
> I am using Fanboy's OpenWrt `test` build for the Lumen W1700K2,
> together with several of my other patches. It does not include the
> bridger package specifically. It now uses native nft-based offloading
> with `kmod-br-netfilter`.

according to my understanding this is not merged yet, right? I guess the
patches should be based on official/accepted code.

>=20
> > IIUC the issue you want to resolve is we are not adding PPE L2 entries =
for
> > the specified cases (same-link or same-radio intra-BSS forwarding), cor=
rect?
>=20
> No. As written in the patch message, this specifically addresses
> bridge-visible WLAN egress, such as:
>=20
> 1. wired-to-WLAN forwarding
> 2. WLAN peer forwarding across another BSS, radio, or MLO link
>=20
> Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
> datapath and is not covered by this patch, although it did show poor
> performance, whether that is due to shared airtime or not. That case
> appears to belong to the Wi-Fi stack/driver datapath, such as the
> mac80211/mt76/mt7996 path, rather than to this Airoha PPE fallback path.

according to my understanding the l2 nft-based offloading solution should
add the missing info to PPE flow-table. As I pointed out, it should be
in-sync with hw flow-table. It seems a bug in the nft code to me.

>=20
> > Using this approach, we are breaking the assumption PPE flow-table and =
hw
> > flow-table are in sync. If the issue is the one described above, why not
> > fixing the problem directly in the bridger package?
>=20
> Again, this problem exists in an environment without bridger.

In order to offload L2 traffic bridger is mandatory. Do you mean the issue
occurs even on L3 scenario?

>=20
> > Moreover, I see you developed the patch using Codex:gpt-5.5. Have you t=
ested it
> > on a real hw?
>=20
> Yes. This has been tested on my Lumen W1700K2 with the environment
> described above. MLO Wi-Fi P2P communication and some wired-to-WLAN
> cases were indeed left unbound by PPE. CPU usage was high, and the
> unbound throughput was close to 50% of what this patch achieves now.

ack

Regards,
Lorenzo

>=20
> >=20
> > Some comments inline.
> >=20
> > Regards,
> > Lorenzo
> > >>
> >> Before touching the PPE table, resolve the destination MAC through the
> >> bridge device above the ingress netdev. If the PPE driver's L2 offload
> >> cache lookup misses, bind the hardware flow to the resolved CDM4/WDMA
> >> path.
> >>
> >> Assisted-by: Codex:gpt-5.5
> >> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> >> ---
> >>  drivers/net/ethernet/airoha/airoha_ppe.c | 138 +++++++++++++++++++----
> >>  1 file changed, 119 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/et=
hernet/airoha/airoha_ppe.c
> >> index 26da519236bf..ea932e6d87f6 100644
> >> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> >> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> >> @@ -803,65 +803,163 @@ static void airoha_ppe_foe_flow_remove_entry(st=
ruct airoha_ppe *ppe,
> >>  }
> >> =20
> >>  static int
> >> -airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
> >> -				    struct airoha_flow_table_entry *e,
> >> -				    u32 hash, bool rx_wlan)
> >> +airoha_ppe_foe_commit_subflow(struct airoha_ppe *ppe,
> >> +			      const struct airoha_foe_entry *bridge,
> >=20
> > maybe l2_hwe instead of bridge?
> >=20
> >> +			      u32 hash, bool rx_wlan)
> >>  {
> >>  	u32 mask =3D AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_U=
DP;
> >>  	struct airoha_foe_entry *hwe_p, hwe;
> >> -	struct airoha_flow_table_entry *f;
> >>  	int type;
> >> =20
> >>  	hwe_p =3D airoha_ppe_foe_get_entry_locked(ppe, hash);
> >>  	if (!hwe_p)
> >>  		return -EINVAL;
> >> =20
> >> -	f =3D kzalloc_obj(*f, GFP_ATOMIC);
> >> -	if (!f)
> >> -		return -ENOMEM;
> >> -
> >> -	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
> >> -	f->type =3D FLOW_TYPE_L2_SUBFLOW;
> >> -	f->hash =3D hash;
> >> -
> >>  	memcpy(&hwe, hwe_p, sizeof(*hwe_p));
> >> -	hwe.ib1 =3D (hwe.ib1 & mask) | (e->data.ib1 & ~mask);
> >> +	hwe.ib1 =3D (hwe.ib1 & mask) | (bridge->ib1 & ~mask);
> >> =20
> >>  	type =3D FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe.ib1);
> >>  	if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T) {
> >> -		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
> >> -		hwe.ipv6.ib2 =3D e->data.bridge.ib2;
> >> +		memcpy(&hwe.ipv6.l2, &bridge->bridge.l2,
> >> +		       sizeof(hwe.ipv6.l2));
> >> +		hwe.ipv6.ib2 =3D bridge->bridge.ib2;
> >>  		/* setting smac_id to 0xf instruct the hw to keep original
> >>  		 * source mac address
> >>  		 */
> >>  		hwe.ipv6.l2.src_mac_hi =3D FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
> >>  						    0xf);
> >>  	} else {
> >> -		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
> >> +		memcpy(&hwe.bridge.l2, &bridge->bridge.l2,
> >>  		       sizeof(hwe.bridge.l2));
> >> -		hwe.bridge.ib2 =3D e->data.bridge.ib2;
> >> +		hwe.bridge.ib2 =3D bridge->bridge.ib2;
> >>  		if (type =3D=3D PPE_PKT_TYPE_IPV4_HNAPT)
> >>  			memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
> >>  			       sizeof(hwe.ipv4.new_tuple));
> >>  	}
> >> =20
> >> -	hwe.bridge.data =3D e->data.bridge.data;
> >> -	airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
> >> +	hwe.bridge.data =3D bridge->bridge.data;
> >> +
> >> +	return airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
> >> +}
> >> +
> >> +static int
> >> +airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
> >> +				    struct airoha_flow_table_entry *e,
> >> +				    u32 hash, bool rx_wlan)
> >> +{
> >> +	struct airoha_flow_table_entry *f;
> >> +	int err;
> >> +
> >> +	f =3D kzalloc_obj(*f, GFP_ATOMIC);
> >> +	if (!f)
> >> +		return -ENOMEM;
> >> +
> >> +	err =3D airoha_ppe_foe_commit_subflow(ppe, &e->data, hash, rx_wlan);
> >> +	if (err) {
> >> +		kfree(f);
> >> +		return err;
> >> +	}
> >> +
> >> +	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
> >> +	f->type =3D FLOW_TYPE_L2_SUBFLOW;
> >> +	f->hash =3D hash;
> >> =20
> >>  	return 0;
> >>  }
> >> =20
> >> +static bool
> >> +airoha_ppe_foe_prepare_wdma_subflow_dev(struct airoha_ppe *ppe,
> >> +					struct net_device *dev,
> >> +					struct airoha_flow_data *data,
> >> +					struct airoha_foe_entry *hwe)
> >> +{
> >> +	u32 pse_port;
> >> +	int err;
> >> +
> >> +	err =3D airoha_ppe_foe_entry_prepare(ppe->eth, hwe, dev,
> >> +					   PPE_PKT_TYPE_BRIDGE, data, 0);
> >> +	if (err)
> >> +		return false;
> >> +
> >> +	pse_port =3D FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, hwe->bridge.ib2);
> >> +	if (pse_port !=3D FE_PSE_PORT_CDM4)
> >> +		return false;
> >> +
> >> +	return true;
> >=20
> > 	return pse_port =3D=3D FE_PSE_PORT_CDM4;
> >=20
> >> +}
> >> +
> >> +static struct net_device *
> >> +airoha_ppe_foe_get_bridge_master(struct net_device *dev)
> >> +{
> >> +	struct net_device *master =3D NULL;
> >> +
> >> +	rcu_read_lock();
> >> +	master =3D netdev_master_upper_dev_get_rcu(dev);
> >> +	if (master && netif_is_bridge_master(master))
> >> +		dev_hold(master);
> >> +	else
> >> +		master =3D NULL;
> >> +	rcu_read_unlock();
> >> +
> >> +	return master;
> >> +}
> >> +
> >> +static bool
> >> +airoha_ppe_foe_prepare_wdma_subflow(struct airoha_ppe *ppe,
> >> +				    struct sk_buff *skb,
> >> +				    struct airoha_foe_entry *hwe)
> >> +{
> >> +	struct ethhdr *eh =3D eth_hdr(skb);
> >> +	struct airoha_flow_data data =3D {};
> >> +	struct net_device *master;
> >> +
> >> +	if (!is_valid_ether_addr(eh->h_source) ||
> >> +	    !is_valid_ether_addr(eh->h_dest))
> >> +		return false;
> >> +
> >> +	ether_addr_copy(data.eth.h_dest, eh->h_dest);
> >> +	ether_addr_copy(data.eth.h_source, eh->h_source);
> >> +
> >> +	if (!skb->dev)
> >> +		return false;
> >> +
> >> +	/* WLAN egress unbound hits can arrive before flowtable creates the
> >> +	 * L2 master flow normally used for subflow binding. Resolve only
> >> +	 * through the bridge master so dev_fill_forward_path() must use the
> >> +	 * bridge FDB for the destination MAC. Calling the ingress AP netdev
> >> +	 * directly can describe the source station's WDMA path and would
> >> +	 * corrupt Wi-Fi-to-wired flows whose real egress is not WDMA.
> >> +	 */
> >> +	master =3D airoha_ppe_foe_get_bridge_master(skb->dev);
> >> +	if (!master)
> >> +		return false;
> >> +
> >> +	if (airoha_ppe_foe_prepare_wdma_subflow_dev(ppe, master, &data,
> >> +						    hwe)) {
> >> +		dev_put(master);
> >> +		return true;
> >> +	}
> >> +
> >> +	dev_put(master);
> >> +	return false;
> >=20
> > maybe something like:
> >=20
> > 	ret =3D airoha_ppe_foe_prepare_wdma_subflow_dev();
> > 	dev_put(master);
> >=20
> > 	return ret;
> >=20
> >> +}
> >> +
> >>  static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
> >>  					struct sk_buff *skb,
> >>  					u32 hash, bool rx_wlan)
> >>  {
> >> +	struct airoha_foe_entry wdma_hwe =3D {};
> >>  	struct airoha_flow_table_entry *e;
> >>  	struct airoha_foe_bridge br =3D {};
> >>  	struct airoha_foe_entry *hwe;
> >>  	bool commit_done =3D false;
> >> +	bool wdma_ready =3D false;
> >>  	struct hlist_node *n;
> >>  	u32 index, state;
> >> =20
> >> +	wdma_ready =3D airoha_ppe_foe_prepare_wdma_subflow(ppe, skb,
> >> +							 &wdma_hwe);
> >> +
> >>  	spin_lock_bh(&ppe_lock);
> >> =20
> >>  	hwe =3D airoha_ppe_foe_get_entry_locked(ppe, hash);
> >> @@ -899,6 +997,8 @@ static void airoha_ppe_foe_insert_entry(struct air=
oha_ppe *ppe,
> >>  				   airoha_l2_flow_table_params);
> >>  	if (e)
> >>  		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
> >> +	else if (wdma_ready)
> >> +		airoha_ppe_foe_commit_subflow(ppe, &wdma_hwe, hash, rx_wlan);
> >>  unlock:
> >>  	spin_unlock_bh(&ppe_lock);
> >>  }
> >> --=20
> >> 2.53.0
> >>
>=20
> All inline code-style review comments will be addressed in the next
> submission of the patch set, together with the responses to Sashiko's
> review, if any.

--Gg8YQr2jQ3M7KWtf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahRonAAKCRA6cBh0uS2t
rJZGAQDwpUicbHSPKJS6GK7b2MnRJslrwf6DaJXFQK68IpbKPwD8D7bnTKU0rC9V
nZsd+kM9Ljjo6+NVbSOgVeXt+vAwzQY=
=GgNT
-----END PGP SIGNATURE-----

--Gg8YQr2jQ3M7KWtf--


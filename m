Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DFECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzwgwypkHaL96nsdzAkl5yH0GD0dCTKW1kcyCj3G6qA=; b=GnN/OOtgliJKR/I9/1KXd9z0xd
	7pQmXT1TWWlAB+bwX0jaqwR6hFqOaKPFU9ucxQBb9q2GE/Bx0fMWuAHJ7IxtiKvChMFqIRmJfm03K
	2kddX92ZHeyCBFnQffvYrf547xjd3zSXsGMkBNxVB8VLYVC5UuJX+sLYvTZo8g5xTqv7tUI8IWnc6
	GEPZr8BK7pjd9s4anOMux+YZZPZas3YoCqL6OOIr9TXR7fmUBnKgzpXgmf+W8V2uSv0zoTYiEsaoa
	ZnycVlyC56zSx/iKdeU6CdOX5w9WYp9Uz8NbVAAIbzMw8jT1ovAmE8w68c7vxOydT/qMALisBhixu
	KR7KjocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRz0g-00000002xvH-2asX;
	Tue, 26 May 2026 21:08:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRz0d-00000002xuc-0iXy;
	Tue, 26 May 2026 21:08:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48A7340D7F;
	Tue, 26 May 2026 21:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20151F000E9;
	Tue, 26 May 2026 21:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779829697;
	bh=QzwgwypkHaL96nsdzAkl5yH0GD0dCTKW1kcyCj3G6qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hHknQda5xEYsK9IBnCJXCvpT/FS27W7drakg0GHskeVSZn3m8q0ZmlNMkcyN5h5YA
	 xhdm2eb6Kscy68HoKwokIZwV2L0HeGQBunFBGntDQr08jbMfr/gTrhBJfxzOT41nsZ
	 tFLfzr9nBhUwUXNS6QWyfM25blqoolgKL10jc3mJdn3i4Wkw2KThlx8zEwv999YSie
	 wbs5eXxXfCzy7MT7epDG9kC729+BkZYxdMRal8G/kOKFc/hpDZRRFli5njkIPfGi6e
	 OemMvy2bVODCYRN+x7au9+WjbNqWRWuJSg3jcBT3KVxTNjyDhl1I9j0z9zNBMl8wCE
	 xH8AmfaG2r4kg==
Date: Tue, 26 May 2026 23:08:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH RFC net-next v2] net: airoha: Add TCP LRO support
Message-ID: <ahYLvlIYH60cvkWB@lore-desk>
References: <20260526-airoha-eth-lro-v2-1-24e2a9e7a397@kernel.org>
 <7473204e-2ccd-44d8-b703-5a5dbcb29b61@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EScZYE8yc4PJ+rAl"
Content-Disposition: inline
In-Reply-To: <7473204e-2ccd-44d8-b703-5a5dbcb29b61@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_140819_256284_1FE2603F 
X-CRM114-Status: GOOD (  22.91  )
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


--EScZYE8yc4PJ+rAl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Lorenzo Bianconi <lorenzo@kernel.org>
> Date: Tue, 26 May 2026 08:58:05 +0200
>=20
> > Add hardware TCP Large Receive Offload (LRO) support to the airoha_eth
> > driver, leveraging the EN7581/AN7583 SoC's 8 dedicated LRO hardware que=
ues
> > mapped to RX queues 24=E2=80=9331. LRO hw offloading does not support
> > Scatter-Gather (SG) so it is required to increase the page_pool allocat=
ion
> > order to 2 for RX queues 24=E2=80=9331 (LRO queues).
> >=20
> > Performance comparison between GRO and hw LRO has been carried out using
> > a 10Gbps NIC:
> >=20
> > GRO: ~2.7 Gbps
> > LRO: ~8.1 Gbps
> >=20
> > Please note with respect to the previous implementation, page_pool
> > allocation order has been reduced from 5 to 2.
> >=20
> > Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> [...]
>=20
> > @@ -587,6 +630,85 @@ static int airoha_qdma_get_gdm_port(struct airoha_=
eth *eth,
> >  	return port >=3D ARRAY_SIZE(eth->ports) ? -EINVAL : port;
> >  }
> > =20
> > +static int airoha_qdma_lro_rx_process(struct airoha_queue *q,
> > +				      struct airoha_qdma_desc *desc)
> > +{
> > +	u32 desc_ctrl =3D le32_to_cpu(READ_ONCE(desc->ctrl));
> > +	u32 msg1 =3D le32_to_cpu(READ_ONCE(desc->msg1));
> > +	u32 msg2 =3D le32_to_cpu(READ_ONCE(desc->msg2));
> > +	u32 msg3 =3D le32_to_cpu(READ_ONCE(desc->msg3));
>=20
> Why are these READ_ONCE()s needed? Does desc come from the HW (sorry I
> didn't follow the whole code flow) or...?

Correct, ctrl, msg1, msg2 and msg3 are subfields of the DMA descriptor read=
 by
airoha_qdma_rx_process() from the NIC. I guess here we have a similar issue=
 as
the one fixed in [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?=
id=3D4ae0604a0673e11e2075b178387151fcad5111b5

>=20
> > +	struct sk_buff *skb =3D q->skb;
> > +	u32 len, th_off, tcp_ack_seq;
> > +	u16 tcp_win, l2_len;
> > +	struct tcphdr *th;
> > +	bool ipv4, ipv6;
> > +
> > +	if (FIELD_GET(QDMA_ETH_RXMSG_AGG_COUNT_MASK, msg2) <=3D 1)
> > +		return 0;
> > +
> > +	ipv4 =3D FIELD_GET(QDMA_ETH_RXMSG_IP4_MASK, msg1);
> > +	ipv6 =3D FIELD_GET(QDMA_ETH_RXMSG_IP6_MASK, msg1);
> > +	if (!ipv4 && !ipv6)
> > +		return -EOPNOTSUPP;
> > +
> > +	l2_len =3D FIELD_GET(QDMA_ETH_RXMSG_L2_LEN_MASK, msg2);
> > +	len =3D FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
> > +	if (ipv4) {
> > +		struct iphdr *iph;
> > +
> > +		if (!pskb_may_pull(skb, l2_len + sizeof(*iph)))
> > +			return -EINVAL;
> > +
> > +		iph =3D (struct iphdr *)(skb->data + l2_len);
> > +		if (iph->protocol !=3D IPPROTO_TCP)
> > +			return -EOPNOTSUPP;
> > +
> > +		iph->tot_len =3D cpu_to_be16(len - l2_len);
> > +		iph->check =3D 0;
> > +		iph->check =3D ip_fast_csum((void *)iph, iph->ihl);
> > +		th_off =3D l2_len + (iph->ihl << 2);
> > +	} else {
> > +		struct ipv6hdr *ip6h;
> > +
> > +		if (!pskb_may_pull(skb, l2_len + sizeof(*ip6h)))
> > +			return -EINVAL;
> > +
> > +		ip6h =3D (struct ipv6hdr *)(skb->data + l2_len);
> > +		if (ip6h->nexthdr !=3D NEXTHDR_TCP)
> > +			return -EOPNOTSUPP;
> > +
> > +		ip6h->payload_len =3D cpu_to_be16(len - l2_len - sizeof(*ip6h));
> > +		th_off =3D l2_len + sizeof(*ip6h);
> > +	}
> > +
> > +	tcp_win =3D FIELD_GET(QDMA_ETH_RXMSG_TCP_WIN_MASK, msg3);
> > +	tcp_ack_seq =3D le32_to_cpu(READ_ONCE(desc->data));
> > +
> > +	if (!pskb_may_pull(skb, th_off + sizeof(*th)))
> > +		return -EINVAL;
> > +
> > +	th =3D (struct tcphdr *)(skb->data + th_off);
> > +	th->ack_seq =3D cpu_to_be32(tcp_ack_seq);
> > +	th->window =3D cpu_to_be16(tcp_win);
> > +
> > +	/* Check tcp timestamp option */
> > +	if (th->doff =3D=3D (sizeof(*th) + TCPOLEN_TSTAMP_ALIGNED) / 4) {
> > +		__be32 *topt =3D (__be32 *)(th + 1);
>=20
> Make sure you checked the code with sparse (sometimes it's needed to
> mark casts as __force, not this one tho)

$ make C=3D2 CHECK=3Dsparse drivers/net/ethernet/airoha/
  CHECK   scripts/mod/empty.c
  DESCEND objtool
  INSTALL libsubcmd_headers
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
  CHECK   drivers/net/ethernet/airoha/airoha_eth.c
  CHECK   drivers/net/ethernet/airoha/airoha_ppe.c
  CHECK   drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
  CHECK   drivers/net/ethernet/airoha/airoha_npu.c

$ sparse --version
v0.6.5-rc1

>=20
> > +
> > +		if (*topt =3D=3D cpu_to_be32((TCPOPT_NOP << 24) |
>=20
> Shouldn't this be `((u32)TCPOPT_NOP) << 24` to avoid sign issues?

I guess this is same approach used in [1]. Am I missing something?

[1] https://github.com/torvalds/linux/blob/master/net/ipv4/tcp_ipv4.c#L823

Regards,
Lorenzo

>=20
> > +					 (TCPOPT_NOP << 16) |
> > +					 (TCPOPT_TIMESTAMP << 8) |
> > +					 TCPOLEN_TIMESTAMP)) {
> > +			__le32 tcp_ts_reply =3D READ_ONCE(desc->tcp_ts_reply);
> > +
> > +			put_unaligned_be32(le32_to_cpu(tcp_ts_reply),
> > +					   topt + 2);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> Thanks,
> Olek

--EScZYE8yc4PJ+rAl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahYLvgAKCRA6cBh0uS2t
rD5IAQDm649Y+OIXgnX3tqPjEv0sZKv9Zt+HPJ2Car7wGP9blAD/QhomlYinsEb6
cOFaX+lWBwG7XoOzG8IhnE4orgKEuA8=
=Ypxv
-----END PGP SIGNATURE-----

--EScZYE8yc4PJ+rAl--


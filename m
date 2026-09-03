Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E46BC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCMUqh6ANgvQ3Pwx5RlqzkheOtUmmalNv6/kwBMPNcQ=; b=PNN/LXDF81UXcWy2kztASbpMy/
	qG2hK6hYwNEOhnJbwRC6wGWQiKtCTCCBiCzPTIL4bGxA2zPjTa7osM3/uujoC83CDwCCZE1Hc+hvi
	Ls3Zdo+fSp0+5h+uUdl5rmMkrS6Poen7i2TZ5ownvF43X1cGteEpIL6oOtVuycQsVoOZ3k00vAm4k
	6t7wJ3aVSZdw39ycYi7DFG+xuLXRYDWEqxEaJ67Jfyff0EdK21oW2+sShj+Uc+SR2ZsOlIiXZCfF0
	gmW7+l84Z/5ZbLYWck29mxcKf/aubZoewT7X2plM2MwtuuTlt+vMAnLBmAnUxIbCUUaNl3WBOH+07
	XNbdYRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29dS-000000002pr-2R7W;
	Thu, 03 Sep 2026 15:45:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29dR-000000002pU-2qH2;
	Thu, 03 Sep 2026 15:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B70236053D;
	Thu,  3 Sep 2026 15:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B771F000E9;
	Thu,  3 Sep 2026 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450352;
	bh=yCMUqh6ANgvQ3Pwx5RlqzkheOtUmmalNv6/kwBMPNcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RShHivsJHdQYENIAXi57A6y92sj/SKI64hzjlD+CpHniAIzXmEJphBiTvmrNl/Vot
	 3Y0GFG1uKzoPSt5EUSrrJJ3zR28vBI4mDG6hAB6ZgGKWoUwblt8vqNEwRvU4FnJ69Z
	 zemYcX3EYv1CWiICaujZowbPBgt5zgDDWX//759uPwefwK4tR8PECY2+w492cmgEmh
	 7m7EzvBTZMiZBqNS2cclfG7ngmVxjPTEqargjpLRYBULmyL6i9XiO3hwAgc88eXIi/
	 bjWPwueSBU2ZsmTIiVW2e1yah5PWZ4WHtxIY4yerUbHSf9sWMzAiwssJS7S8tNvmWc
	 +JzTasZSy8BPQ==
Date: Thu, 3 Sep 2026 17:45:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
Message-ID: <apmWLtgcUXRrOTFj@lore-desk>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
 <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
 <aplpllPidmCjhSmA@lore-desk>
 <1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDvggmcI2CoJ2jcY"
Content-Disposition: inline
In-Reply-To: <1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
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

--NDvggmcI2CoJ2jcY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 03, Paolo Abeni wrote:
> On 9/3/26 2:35 PM, Lorenzo Bianconi wrote:
> >> On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
> >>> Add hardware GRO offload support to the airoha_eth driver, leveraging
> >>> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> >>> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) =
so
> >>> it is required to increase the page_pool allocation order to 2 for RX
> >>> queues 24-31 (LRO queues).
> >>> Since HW GRO is configured per-QDMA and shared across all devices usi=
ng
> >>> it, HW GRO is mutually exclusive with multiple devices bound to the
> >>> same QDMA block. Call airoha_update_netdev_features() in
> >>> airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evalu=
ated
> >>> whenever the QDMA user count changes (device registration and runtime=
 QDMA
> >>> migration).
> >>> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> >>> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> >>> on the egress device.
> >>> The HW does not report the per-segment MSS (msg3[31:16] only reports
> >>> the max aggregated size), so the gso_size of an aggregated packet is
> >>> just an approximation computed as DIV_ROUND_UP(data_len, agg_count).
> >>
> >> What is the <max aggregated size> exactly? I read it as the maximum si=
ze
> >> of the aggregated segments, am I correct?
> >=20
> > Hi Paolo,
> >=20
> > with "max aggregated size" I refer to the length of the aggregated TCP
> > packet (composed by multiple segments). This value is reported via
> > QDMA_DESC_LEN_MASK field in the DMA descriptor. Moreover, the hw reports
> > the exact number of the aggregated segments via QDMA_ETH_RXMSG_AGG_COUN=
T_MASK
> > field.
> >=20
> >>
> >> Also any more details on how the aggregation engine works? i.e. can it
> >> aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
> >> respect HW_GRO layout? (i.e. all segments except the last one must have
> >> equal size, the can be smaller).
> >=20
> > The hw engine, for each LRO queue, is configured with:
> >=20
> > - CDM_LRO_AGG_NUM_MASK: max number of segments for each aggregated TCP =
packet
> >                         (64 in the current configuration).
> > - CDM_LRO_AGG_SIZE_MASK: max size of the aggregated TCP packet (compose=
d by
> >                          multiple segments). 16KB in the current config=
uration.
> > - CDM_LRO_AGG_TIME_MASK: max timeout to compose the aggregated TCP pack=
et.
> >=20
> > In order to validate the scenario, I run the following test:
> >=20
> > TCP client:
> > ------------
> > - disable TSO/GSO
> > - set MSS to 256 bytes (iperf3 -M option)
> >=20
> > I can see multiple 310 bytes TCP segments on the wire
> >=20
> > TCP server: (where rx-gro-hw is enabled):
> > -------------------------------------------
> > - the engine aggregates ~64 segments in a ~16Kbyes TCP packet
> >=20
> >   so gso_size ~ 16KB / 64 ~ 256B
> >=20
> > I guess this would be the behaviour even if the original packets
> > have different size (not sure if it is a real use-case).
> Lacking more details from the vendor, I think you need to use a
> pktdrill-like sender, explicitly sets the segment lengths to some not
> mergeable (like, i.e. 200-300-400) but otherwise fitting a GRO packet
> (i.e. same hdr except for the sequence number and push flag allowed only
> in the last packet), ensure that the aggregation timeout lasts long
> enough to receive all of them, and check if the engine really aggregates
> them or not.

I think in the example you pointed out (length 200,300,400) the hw engine w=
ill
create a single TCP packet composed by 3 segments (with gso_size =3D 300) w=
hile
sw GRO will just push sigle skbs. I agree this is just a GRO approximation.
If it is not enough I am fine to switch back to LRO implementation.

Regards,
Lorenzo

>=20
> /P
>=20

--NDvggmcI2CoJ2jcY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapmWLgAKCRA6cBh0uS2t
rANwAPsF+NTXOkcRL4V1CRL7a/tEjI+S8Ac2hcZ3NwATud1NygD8DBFi90ndS7yk
KCWzgZIqDHNgBnbbx2iTecwOVYlALg8=
=kEaq
-----END PGP SIGNATURE-----

--NDvggmcI2CoJ2jcY--


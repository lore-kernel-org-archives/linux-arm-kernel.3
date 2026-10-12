Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A7CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLHzIePtUtQg66m5nrwYqo88M3o3A1elf8s8U3DZucw=; b=I9sI5khn5GyzGKtleYLxlzYFk2
	9eNU7ZWlZ8bN90Iycl0/D329mXm6Z1d3Cit1zGnxjyjo+neQCHdWI5qTaaYdrE835pTxsuuOeGAWO
	xN/N+EiwQ/ka936t17vJ7k0rJyfAbSCzNAeW4ABLOrkZE1U9QY7iy0G04wgAJF8ZxmKXIPFDKpLH/
	PDjhvVaBmKqasXfCfMVcXZk6InplxcEyJJxcYJg1WUZmgQsZNaFlCwE9AecmvUAPYVdnSsM90Klf9
	Tde8l0lujNkNoT9/16zVWOeObmAPiofmKl0gmWpe5YplOZaBgcT4ykAX1UvjKh2UAPHzoRuijMRYm
	YOiXlpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOO-0000000Atpx-32Xo;
	Mon, 12 Oct 2026 15:56:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOM-0000000Atpl-2eLq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:56:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCEE3601FB;
	Mon, 12 Oct 2026 15:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1679D1F0089B;
	Mon, 12 Oct 2026 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820605;
	bh=SLHzIePtUtQg66m5nrwYqo88M3o3A1elf8s8U3DZucw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PKF2J721gleu2jMI4dW+07EWVthufc4abF+3N4bdWtQIJg+0R5I1t9vEcM9T1sUaw
	 dpEf8YscK3Aw/wuyy+NKyIHRM5hibmifdGOmlPfphrdvvft1yEdKzpwy6T9OVOpCjZ
	 tuO2YMi7dIajKkmPVtl+DrFXUHrgK17zjNjh1ZC4V6gC0/xo/JLHNnVVb2rAuJ2YBi
	 TcvuK/JffqeO/m8f6mLhpdqreDTvDX0mda5Ked8aK8V8LwQOh07R5P2nVMCgyakwaG
	 Wms75F6g3flf7RKZTjjEAmlWmkO+NMVKLBieRlNRuwvvAkRyBJbZTAjQY/dw0rNxP/
	 nM5irFimaPDVg==
Date: Mon, 12 Oct 2026 17:56:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
Message-ID: <as0DO7n5SCr2j3Z2@lore-desk>
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7loBx0NG4ClbL5mp"
Content-Disposition: inline
In-Reply-To: <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
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

--7loBx0NG4ClbL5mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> PPE routed IPv6 FOE entries do not carry the egress source MAC inline;
> they store an SMAC id and the hardware resolves the address through the
> UPDMEM table, which airoha_ppe_init_upd_mem() only programs with the GDM
> port own dev_addr at probe time.
>=20
> The netdev the flow actually egresses can legally carry a different
> address: on PON setups the authentication MAC belongs to the pon device
> while each service VLAN routes with its own address, so offloaded IPv6
> frames left the port with a stale source MAC and were silently dropped
> upstream. IPv4 was unaffected since HNAPT entries embed the MAC inline,
> which made the failure hard to diagnose: TCP handshake and TLS completed
> over the slow path and the transfer stalled exactly when the flow got
> offloaded.
>=20
> Before writing smac_id for routed IPv6 entries, program the UPDMEM slot
> with the source address of this flow.
>=20
> airoha_set_macaddr() writes the same slot from the ndo_open and
> ndo_set_mac_address paths: take flow_offload_mutex there too so the two
> UPDMEM writers cannot interleave their two-step DATA/CTRL sequence and
> leave a stale address behind.
>=20
> Tested on a Nokia XG-040G-MD (AN7581, GPON WAN, PPPoE over a service
> VLAN carrying its own MAC address): IPv6 HTTPS transfers went from
> stalling at the 15 s curl cap with partial bytes to completing at line
> rate with hardware offloading enabled, matching IPv4 throughput.
>=20
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Yaoming Chen <cc201008@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  |  8 ++++++++
>  drivers/net/ethernet/airoha/airoha_ppe.c | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>=20
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -138,7 +138,15 @@ airoha_set_macaddr(struct airoha_gdm_dev *dev,
>   airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), lmin);
>   airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), lmax);
>=20
> + /*
> + * Serialize with the flowtable offload path: both writers program the
> + * same UPDMEM slot with a two-step DATA/CTRL sequence and concurrent
> + * updates would interleave, leaving a stale source MAC under already
> + * bound IPv6 entries.
> + */
> + mutex_lock(&flow_offload_mutex);
>   airoha_ppe_init_upd_mem(dev, addr);
> + mutex_unlock(&flow_offload_mutex);

This seems a deadlock to me since airoha_set_macaddr() is running holding
flow_offload_mutex mutex in airoha_enable_qos_for_gdm34().

>=20
>   return 0;
>  }
>=20
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -414,6 +414,19 @@ airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
>    dsa_port);
>=20
>   smac_id =3D port->id;
> + /*
> + * Routed IPv6 entries resolve the egress source MAC
> + * through the UPDMEM table indexed by smac_id. The
> + * egress netdev can legally carry a different address
> + * than the GDM port itself: on PON setups the
> + * authentication MAC lives on the pon device while
> + * each service VLAN routes with its own address. Keep
> + * the table entry in sync with the source address this
> + * flow is actually going to use.
> + */
> + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> + airoha_ppe_init_upd_mem(dev,
> + data->eth.h_source);

I do not think you used checkpatch here.

Regards,
Lorenzo

>   }
>   }

--7loBx0NG4ClbL5mp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas0DOwAKCRA6cBh0uS2t
rK9aAP9PNyueczLuKOh6HqOy9UG4JJo/Y70ApaV7gfwe/UqkKQEAg1vnuG8yRZy7
CSfsA8crmPEQSI4RS1bv4G6GvRjz7QE=
=I85x
-----END PGP SIGNATURE-----

--7loBx0NG4ClbL5mp--


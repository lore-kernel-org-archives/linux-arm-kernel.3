Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FDDCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKe/K2SFz3cYwqVg3k3/7PTTaraKAqNtSe8pGFak5HM=; b=LC/RKFUOjJlhaf5nWdduaIrRx2
	yX5/nHn6+ZozuY68SUWiVMGkoeP4uC0BFNPjo9Y24tRhWDqMeNSMr2wXOsBvGGwPW+PzoTFtBYYMF
	m0ffZ2Hvb5z6M7xYpt7dD1MgvnKCwi/rvo7AKtE/93w386XsfTmuxeMXBVZZkrCJktTjSp8uW/cSX
	GqDKXM38w7WdqcWVriHDcIsGoAjwiabjbY7NOTcOKP7qzQpY+nAfg6iYv2IirEw/HmfDjKwHOoNew
	6lFNjmNQ2YRh4+/qO890m5nPfS1s1+pFFX+06F6mfJzT2z7kKbulp/SQ2jkjW55voH7z5rEDpjBCx
	ZRS+SP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX3X-0000000CE9h-0ej0;
	Tue, 13 Oct 2026 07:36:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX3T-0000000CE9H-1wbS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85ADE600D1;
	Tue, 13 Oct 2026 07:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37671F000FF;
	Tue, 13 Oct 2026 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876970;
	bh=UKe/K2SFz3cYwqVg3k3/7PTTaraKAqNtSe8pGFak5HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0Zdq6gFncODMxuvCb00Ksvk98CswTE8ORGdJbNA+AsqstxOu8Gsb7TWeN/0mq42Z
	 uztm3Muh1JZoTZqqO6Vt2TV8E3r1hwjd4tQ4ERxruUdXJfsTqM1KVYElQwI2Uu6z1D
	 eVqJUbot57OLAlaJlQSBscBMLb6f+kirrkRKvgdJclHpxqy3pJqX+odHouKsKjvV3W
	 RTp8ygnLKhxbJxogmAacEp1biB6Gcp1cnIoDMKEnqnkYt4b4dfpGOgyclCSFboxoep
	 IFY4oXBKNYsnAofOZlI6/RtkZqQXTFjAwysrPeb2VOo8k5MyMpwQDWYPtSc8YZITL2
	 EtEWvSuUbjqCQ==
Date: Tue, 13 Oct 2026 09:36:08 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
Message-ID: <as3faB96PFSnC-qP@lore-desk>
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk>
 <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TsY4h+RbU0p15xnQ"
Content-Disposition: inline
In-Reply-To: <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
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

--TsY4h+RbU0p15xnQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Ooo,  the new patch should be a dedicated leaf lock inside
> airoha_ppe_init_upd_mem().
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -416,6 +416,19 @@
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

Is the issue occurring just with PON or are you able to trigger the issue e=
ven
in the upstream codebase? I guess you should not post a fix for some code t=
hat
is not upstream yet. Moreover, in the PON setup, I guess the approach is st=
ill
broken if the user change the device mac address.

> + */
> + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> + airoha_ppe_init_upd_mem(dev,
> + data->eth.h_source);
>   }
>   }
>=20
> @@ -1529,10 +1542,21 @@
>=20
>  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr)
>  {
> + static DEFINE_MUTEX(updmem_lock);
> +
>   struct airoha_gdm_port *port =3D dev->port;
>   struct airoha_eth *eth =3D dev->eth;
>   u32 val;
>=20
> + /*
> + * Routed IPv6 entries resolve the egress source MAC through the
> + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac_address
> + * writers hold flow_offload_mutex (QoS paths re-lock via
> + * airoha_set_macaddr()), so this lock also serializes the leaf
> + * against them.
> + */
> + mutex_lock(&updmem_lock);

This is only required adding the above configuration since in the current
codebase airoha_ppe_init_upd_mem() is always running holding RTNL.

Regards,
Lorenzo

> +
>   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];
>   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
>   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> @@ -1545,6 +1569,8 @@
>       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
>       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
>       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> +
> + mutex_unlock(&updmem_lock);
>  }
>=20
>  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

--TsY4h+RbU0p15xnQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas3faAAKCRA6cBh0uS2t
rBzUAQCL/fb8smdTz5MWaZqzvmSS5tTGd94zzSEJp/E/0DMNXQD/ecISkztvJeO7
lNdqhT63wJKz2zXCWEru2qKfnsV6EQA=
=YGK5
-----END PGP SIGNATURE-----

--TsY4h+RbU0p15xnQ--


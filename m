Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD5CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icMiBGKDzjWCyjcMX0LyKBPzn4jDdScDbFEPljPmY3c=; b=Z3E1O+Ct3shi+UTrZJa7byghfS
	NlXVUR1ezJ2CoBoU10O4zgdmqyr9HUz+s07flK4xukZ78/hgOrZZ9u/M7qHqnZg2gB1ij0yw5sz3a
	7HdkCvcnC4y3drCS79E+fQjTmzuQJi2C3YvdPlxKtHoGT6G4PpM4YnRGTjttu+R2huZ1ASNp1tbVN
	6X0BbQoHz3GSI1jAygfa7n+tTPW+KkF4O4mK52MOeQwZWYCZyWdf4d3NQ9W6UsCKvyI3oQMI93wD/
	cLvO0JcAtTzYX12GK5cggf8aYcFRSeccX9+k7wocs+lYjS6huNbA1jmYdM/b9sDy8xyFIrFF7Oqpw
	hcBX/i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVMS-000000035Yp-23T5;
	Mon, 08 Jun 2026 08:29:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVMR-000000035YW-3vxI;
	Mon, 08 Jun 2026 08:29:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C5ED6001D;
	Mon,  8 Jun 2026 08:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B4E1F00893;
	Mon,  8 Jun 2026 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907370;
	bh=icMiBGKDzjWCyjcMX0LyKBPzn4jDdScDbFEPljPmY3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jN3QtXTZr//HwrqBb09/0XT8XOhkeCfqb2DRYVXHdScx3yf9AsLB9fjgTqebcIwd4
	 BfME+lJ1kYJFULumDINdDGr6ENZ7MUQ7UO2q6SGY7+hfzIYXCV41y5uD0BJUyesfy3
	 2CfnfHV3kxT4ohmBkcxMYwN5glPawxoDTA/x3z86vfPQyhcZBsRPq8zxKyK0K8a0IV
	 LkolPxtL//k1wZfQPyHNBOIsvLOHCaaZO/ividOF2t/7AFbsVNgFmDCXiiSuGS6bcK
	 iKJqYk9l+e1jy3ATN/ixwihpqc6tt3is96YjebS8tsIKaN1glxGribl++n8AXKzkG/
	 ScqL7Uf1HVOgg==
Date: Mon, 8 Jun 2026 10:29:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: simplify WAN device check in
 airoha_dev_init()
Message-ID: <aiZ9aLsfc89dq9v8@lore-desk>
References: <20260606-airoha-eth-simplify-dev-init-v1-1-f08f8e404049@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vQUe/Ioj7I3PszYE"
Content-Disposition: inline
In-Reply-To: <20260606-airoha-eth-simplify-dev-init-v1-1-f08f8e404049@kernel.org>
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


--vQUe/Ioj7I3PszYE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_register_gdm_devices() iterates eth->ports[] in order, so GDM2's
> netdev is always registered before GDM3/GDM4. This means the explicit
> check for eth->ports[1] && eth->ports[1]->devs[0] is a redundant
> special-case of what airoha_get_wan_gdm_dev() already covers, since
> GDM2 is always marked as WAN during its own ndo_init.
> Remove the redundant check and rely solely on airoha_get_wan_gdm_dev()
> which handles both the GDM2-present and GDM2-absent cases.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Please drop this patch since I need to modify it to address Andrew's request
about LAN/WAN configuration.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5a8e84fa9918..b333a7b309c2 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2004,18 +2004,10 @@ static int airoha_dev_init(struct net_device *net=
dev)
> =20
>  	switch (port->id) {
>  	case AIROHA_GDM3_IDX:
> -	case AIROHA_GDM4_IDX: {
> -		struct airoha_eth *eth =3D dev->eth;
> -
> -		/* GDM2 supports a single net_device */
> -		if (eth->ports[1] && eth->ports[1]->devs[0])
> -			break;
> -
> -		if (airoha_get_wan_gdm_dev(eth))
> +	case AIROHA_GDM4_IDX:
> +		if (airoha_get_wan_gdm_dev(dev->eth))
>  			break;
> -
>  		fallthrough;
> -	}
>  	case AIROHA_GDM2_IDX:
>  		/* GDM2 is always used as wan */
>  		dev->flags |=3D AIROHA_PRIV_F_WAN;
>=20
> ---
> base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
> change-id: 20260606-airoha-eth-simplify-dev-init-5d53c7cc004e
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--vQUe/Ioj7I3PszYE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiZ9aAAKCRA6cBh0uS2t
rLcTAQCcIV8FMOBnL1whdLBuVU/v0KCYnQDJSmNx5YwbJvD7HgD9H5QXgRBA6qhL
yVJtngNaDdKxUD5cs6169k2izhlukQs=
=EWZk
-----END PGP SIGNATURE-----

--vQUe/Ioj7I3PszYE--


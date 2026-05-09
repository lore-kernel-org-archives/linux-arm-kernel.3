Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E50CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2mZRsyQkc1J4bpCoqKJqCWl9GuNodGiDTT0tKFCfmM=; b=Hslk7phdR9r0AbIF33+l6t4oLZ
	jKCy9IKjhswzJnMkg02RgOtluz2/sFRYjbmLsdq891It4rLGHcpZpHEaxSppa2sFPTwsv70HFP8U7
	Vhj+145xM1z2W2j7CeK4ydDjOJnqpKNzRArfuV7qLzAWpPjJETDJlxD9BPDd2mAZsQYfbB4JSCQi2
	eufNPdtPz4yF6v8cCDCeerTtoSbs31PgpLgMU6kVR67vFKXqKqdHyQOOjoeA1cm4EsXFwuWxVPSol
	HIVq9l7Scd0unQaYEUDQM8SnhIJi/7ZixpnO+GzJELGS8HhjD9jefiVHdKEe34VH7nEXVIdYHi56L
	q4uyEIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgJs-00000008suN-2WRh;
	Sat, 09 May 2026 11:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgJp-00000008stZ-3o9H;
	Sat, 09 May 2026 11:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A4D143AB7;
	Sat,  9 May 2026 11:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A110FC2BCB2;
	Sat,  9 May 2026 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778327883;
	bh=+kyeoNx5SiAfpEbCxeY8IdHHEPk/F+CGq69tXbZwlEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcEF8t5k6VqDZ6MdDBPQUeQyQaK9hltJGEAmDInpBrF4Yp8ClEhcV3MGGC263ErJ5
	 qsyWi7icnNOC5xoC4PtYBQo5QY0/Lu4l95SUBTMKxF6D1wdZLz5IGoB23s0MQDCNGP
	 7hU9CA/oKvxU4lEhzHEtsQtA/TPwsKAAvvgRlwTFDU+/cCDD5UKAqCyT02MeqYRGHu
	 dK8VaO0IlEOVAcFDFWwL6/MWk410YinV5EMq1hmrT3cNb/q8mCk3niN7docqetXaeM
	 qJgf33RV/hWTiTib1d70RaBPcdqBUk2PEHzxrgBldyk3V1V/wgqYHPO2c/Jiz2utRA
	 MaKVDnNFXA9jA==
Date: Sat, 9 May 2026 13:58:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v4 08/10] net: airoha: Do not stop GDM port if
 it is shared
Message-ID: <af8hSCcd2GyfbeuE@lore-desk>
References: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
 <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f/l86ZsPISNBd6cb"
Content-Disposition: inline
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-8-af613b61ae02@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_045805_996608_E6A64D19 
X-CRM114-Status: GOOD (  28.73  )
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


--f/l86ZsPISNBd6cb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Theoretically, in the current codebase, two independent net_devices can
> be connected to the same GDM port so we need to check the GDM port is not
> used by any other running net_device before setting the forward
> configuration to FE_PSE_PORT_DROP.
>=20
> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 36 +++++++++++++++++++++++++-=
------
>  drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
>  2 files changed, 30 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 0253919714e0..1c4927c1aeb0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1714,8 +1714,8 @@ static int airoha_dev_open(struct net_device *netde=
v)
>  	int err, len =3D ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
>  	struct airoha_gdm_port *port =3D dev->port;
> +	u32 cur_len, pse_port =3D FE_PSE_PORT_PPE1;
>  	struct airoha_qdma *qdma =3D dev->qdma;
> -	u32 pse_port =3D FE_PSE_PORT_PPE1;
> =20
>  	netif_tx_start_all_queues(netdev);
>  	err =3D airoha_set_vip_for_gdm_port(dev, true);
> @@ -1729,10 +1729,14 @@ static int airoha_dev_open(struct net_device *net=
dev)
>  		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
>  				GDM_STAG_EN_MASK);
> =20
> -	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> -		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> -		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> -		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +	cur_len =3D airoha_fe_get(qdma->eth, REG_GDM_LEN_CFG(port->id),
> +				GDM_LONG_LEN_MASK);
> +	if (!atomic_read(&port->users) || len > cur_len)
> +		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
> +			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
> +			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
> +			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> +	atomic_inc(&port->users);
> =20
>  	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
>  			GLOBAL_CFG_TX_DMA_EN_MASK |
> @@ -1762,8 +1766,12 @@ static int airoha_dev_stop(struct net_device *netd=
ev)
>  	for (i =3D 0; i < netdev->num_tx_queues; i++)
>  		netdev_tx_reset_subqueue(netdev, i);
> =20
> -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> -				    FE_PSE_PORT_DROP);
> +	if (atomic_dec_and_test(&port->users)) {
> +		airoha_set_vip_for_gdm_port(dev, false);
> +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> +					    REG_GDM_FWD_CFG(port->id),
> +					    FE_PSE_PORT_DROP);
> +	}
> =20
>  	if (atomic_dec_and_test(&qdma->users)) {
>  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> @@ -1915,10 +1923,22 @@ static void airoha_dev_get_stats64(struct net_dev=
ice *netdev,
>  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	u32 cur_len, len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port =3D dev->port;
> -	u32 len =3D ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_eth *eth =3D dev->eth;
> =20
> +	cur_len =3D airoha_fe_get(eth, REG_GDM_LEN_CFG(port->id),
> +				GDM_LONG_LEN_MASK);
> +	if (len < cur_len) {
> +		u8 port_refcnt =3D atomic_read(&port->users);
> +
> +		/* We can decrease the device MTU just if the GDM port is
> +		 * not shared or if the other device is not running.
> +		 */
> +		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
> +			return -EBUSY;
> +	}
> +
>  	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
>  		      GDM_LONG_LEN_MASK,
>  		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 207c75152fde..3a313ac439e7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -553,6 +553,8 @@ struct airoha_gdm_port {
>  	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
>  	int id;
> =20
> +	atomic_t users;
> +
>  	struct airoha_hw_stats stats;
> =20
>  	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
>=20
> --=20
> 2.54.0
>=20

Commenting on shashiko report:
https://sashiko.dev/#/patchset/20260507-airoha-eth-multi-serdes-v4-0-af613b=
61ae02%40kernel.org

- Is this call to airoha_set_vip_for_gdm_port() redundant?
  Looking at airoha_dev_stop(), airoha_set_vip_for_gdm_port(dev, false) is
  already called unconditionally earlier in the function. Since get_vip_por=
t()
  returns a device-specific bitmask based on dev->nbq, does the uncondition=
al
  call correctly clear the hardware bits for the specific device being stop=
ped
  without affecting other devices on the same shared port?
  - I will fix it in v5.

- Does returning -EBUSY here improperly prevent valid software MTU configur=
ations?=20
  Instead of failing the ndo_change_mtu callback and preventing the software
  netdev->mtu from updating, should this code unconditionally allow the sof=
tware
  update (netdev->mtu =3D mtu) and simply skip the hardware register
  (REG_GDM_LEN_CFG) downgrade to safely preserve the larger hardware limit
  required by active shared siblings?
  - I will fix it in v5.

- Is the use of an atomic_t necessary for tracking users here?
  The port->users reference count appears to only be modified in ndo_open a=
nd
  ndo_stop, and read in ndo_change_mtu. Since all of these callback paths a=
re
  inherently strictly serialized by the kernel's rtnl_lock(), could a simple
  integer be used instead to avoid unnecessary atomic overhead?
  - I will fix it in v5.

--f/l86ZsPISNBd6cb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaf8hSAAKCRA6cBh0uS2t
rIAVAP40XN/xVxenB27WTAZQFLE3D1aOZEx4226QciUyPoghTAEA5Q+pwNyELBEQ
C2PWBhwiUFSdhonKXDUiPaijAreZyw4=
=IPQU
-----END PGP SIGNATURE-----

--f/l86ZsPISNBd6cb--


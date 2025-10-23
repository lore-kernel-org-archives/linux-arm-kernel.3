Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2241CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RqcITz/A0Wb+zQCM0axz78STZMKxI0+DTWDBH2AeM0=; b=S+r13cv6kn4g5iW4h2EQsLFknH
	pfyQQLJ00XDE5odydxL49wqvu+tYIF94up/gmHOqI0kjnzguHftaeHtskmfTxPogE98oLghuom4fe
	Zt9UZSeC2CfaJEDZ70e1KZDr+BctBKvPXYTTiA1gS+acXhsm72I35abC6p016i1gXcxt/4enJ4d/h
	uk+Ms94n3T4q3z28Q1pDtpxF6TONVayj2FcaTs7afv3g1S8xKIui+UlloJ76Muz0Cq3HqBTocylig
	Ajn2/J5QLLQZF2sYpy7UrqWDSBbBLIQIvh6HzNbYRrP00OaZzxHBIVPVlQwVhtgfmhke9TOauyN/Q
	hRmcxKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwyB-00000006i5A-21dB;
	Thu, 23 Oct 2025 15:11:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwy9-00000006i4i-346f;
	Thu, 23 Oct 2025 15:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26FF4640C2;
	Thu, 23 Oct 2025 15:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EE1C4CEE7;
	Thu, 23 Oct 2025 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761232272;
	bh=FqogIAnnyd1/hXRU6ygWHWPx68vkuiHwgBhzvU/xZ+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9dJRR4JBy4HMSnIgMV5KSXc84e82BWN3nrDVgb/ojTjVX6Oxy4BepWx11uvAtddF
	 QdMFqODu0O6qaf9VgGxdvKMklmaQACUwbinfIwpqA76etpGXuT/9tD610jpd2G5kqC
	 LMQFciKnOX2TmI8V1rOC0iCT8El9aBOL93xl5n9LatYIgE37Mia8dGfZLZrikr6+4l
	 imF5XyUXPHxJvTSbRxfeG6rgbzbf9bZnOLrxSmEzRAkhQBWRbvgj+2bSJgdTUPmG+1
	 sRH+u8OVFdC2Myr8aBrLJVPSil00KyAAqI4JdAm4+ZBjk9/wQ5DCrHGY5rganKBqNt
	 IQfoxANng/GvQ==
Date: Thu, 23 Oct 2025 17:11:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v2 2/2] net: airoha: add phylink support for GDM1
Message-ID: <aPpFjvJTv1_CEMy6@lore-desk>
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
 <20251023145850.28459-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0NsogCUtGj5e3sD"
Content-Disposition: inline
In-Reply-To: <20251023145850.28459-3-ansuelsmth@gmail.com>
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


--R0NsogCUtGj5e3sD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
> that is an INTERNAL port for the Embedded Switch.

Hi Christian,

just few nitpicks inline. Fixing them:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Add all the phylink start/stop and fill in the MAC capabilities and the
> internal interface as the supported interface.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/airoha/Kconfig      |  1 +
>  drivers/net/ethernet/airoha/airoha_eth.c | 77 +++++++++++++++++++++++-
>  drivers/net/ethernet/airoha/airoha_eth.h |  3 +
>  3 files changed, 80 insertions(+), 1 deletion(-)
>=20

[...]

> @@ -2813,6 +2817,18 @@ static const struct ethtool_ops airoha_ethtool_ops=
 =3D {
>  	.get_link		=3D ethtool_op_get_link,
>  };
> =20
> +static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_=
config *config,
> +							 phy_interface_t interface)

can you please do not go over 79 columns? (I still like it :))

static struct phylink_pcs *
airoha_phylink_mac_select_pcs(struct phylink_config *config,
			      phy_interface_t interface)
{
	return NULL;
}

> +{
> +	return NULL;
> +}
> +
> +static void airoha_mac_config(struct phylink_config *config,
> +			      unsigned int mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
>  static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
>  {
>  	int i;
> @@ -2857,6 +2873,57 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *e=
th,
>  	return false;
>  }
> =20
> +static void airoha_mac_link_up(struct phylink_config *config,
> +			       struct phy_device *phy, unsigned int mode,
> +			       phy_interface_t interface, int speed,
> +			       int duplex, bool tx_pause, bool rx_pause)
> +{
> +}
> +
> +static void airoha_mac_link_down(struct phylink_config *config,
> +				 unsigned int mode, phy_interface_t interface)
> +{
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops =3D {
> +	.mac_select_pcs =3D airoha_phylink_mac_select_pcs,
> +	.mac_config =3D airoha_mac_config,
> +	.mac_link_up =3D airoha_mac_link_up,
> +	.mac_link_down =3D airoha_mac_link_down,
> +};

can you please align it like airoha_ethtool_ops or airoha_netdev_ops?

> +
> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_port *port =3D netdev_priv(netdev);
> +	struct device *dev =3D &netdev->dev;
> +	struct phylink *phylink;
> +	int phy_mode;
> +
> +	phy_mode =3D device_get_phy_mode(dev);
> +	if (phy_mode < 0) {
> +		dev_err(dev, "incorrect phy-mode\n");
> +		return phy_mode;
> +	}
> +
> +	port->phylink_config.dev =3D dev;
> +	port->phylink_config.type =3D PHYLINK_NETDEV;
> +	port->phylink_config.mac_capabilities =3D MAC_ASYM_PAUSE |
> +						MAC_SYM_PAUSE |
> +						MAC_10000FD;
> +
> +	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +		  port->phylink_config.supported_interfaces);
> +
> +	phylink =3D phylink_create(&port->phylink_config, dev_fwnode(dev),
> +				 phy_mode, &airoha_phylink_ops);
> +	if (IS_ERR(phylink))
> +		return PTR_ERR(phylink);
> +
> +	port->phylink =3D phylink;
> +
> +	return 0;
> +}
> +
>  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  				 struct device_node *np, int index)
>  {
> @@ -2935,12 +3002,18 @@ static int airoha_alloc_gdm_port(struct airoha_et=
h *eth,
>  	if (err)
>  		return err;
> =20
> -	err =3D register_netdev(dev);
> +	err =3D airoha_setup_phylink(port->dev);
>  	if (err)
>  		goto free_metadata_dst;
> =20
> +	err =3D register_netdev(dev);
> +	if (err)
> +		goto free_phylink;
> +
>  	return 0;
> =20
> +free_phylink:
> +	phylink_destroy(port->phylink);
>  free_metadata_dst:
>  	airoha_metadata_dst_free(port);
>  	return err;
> @@ -3049,6 +3122,7 @@ static int airoha_probe(struct platform_device *pde=
v)
> =20
>  		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
>  			unregister_netdev(port->dev);
> +			phylink_destroy(port->phylink);
>  			airoha_metadata_dst_free(port);
>  		}
>  	}
> @@ -3076,6 +3150,7 @@ static void airoha_remove(struct platform_device *p=
dev)
> =20
>  		airoha_dev_stop(port->dev);
>  		unregister_netdev(port->dev);
> +		phylink_destroy(port->phylink);
>  		airoha_metadata_dst_free(port);
>  	}
>  	free_netdev(eth->napi_dev);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index eb27a4ff5198..c144c1ece23b 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -531,6 +531,9 @@ struct airoha_gdm_port {
>  	struct net_device *dev;
>  	int id;
> =20
> +	struct phylink *phylink;
> +	struct phylink_config phylink_config;
> +
>  	struct airoha_hw_stats stats;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> --=20
> 2.51.0
>=20

--R0NsogCUtGj5e3sD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPpFjgAKCRA6cBh0uS2t
rL2yAPwJ+sKCvxS7WnskEFkXW0ArW6kWm9QdRR7nw7/AaF0oswEAicDLHyIRsu6Z
cd6vajttTttrfzyKaU85HnHQ3XtOcQU=
=fV9Y
-----END PGP SIGNATURE-----

--R0NsogCUtGj5e3sD--


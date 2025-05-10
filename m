Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21169C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fO5msqoJQ4dT9NE+i05gRTXPlSQ4bpzzQKux+AtNwec=; b=Ocav1PPI8Z1ELLTm+DWDFi7JfZ
	H/XSqL799o8jlsDCkhMRs6Otlc5ADsHT+AxpI9Afch3GscWjFsj+sU/O8cKKL8nEKZFrc0JiFOlCM
	og1rtoi6hTYAdIgESgZXBLzRhXbGVuavLoERrQo54V2RErvPcUmM56CGIILDJH3YSf/gWU6G+8ipa
	aNK2wmva7A50u18CzGpXZvury8m7Ws5a/ObZqc2a4WM7/f34zq1uiEfy72cXB9cVPkbiEtZP8wjYI
	H1bHUKSjM6m/Mc42moBwfwtjaAllttnPF+GGP/M8hDXZFKsN4Ld46V5Y1CzfPlxKodeoevoojbV0Y
	by2CcCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDjGn-00000005vGX-09IK;
	Sat, 10 May 2025 12:25:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDjEi-00000005v9H-15tN;
	Sat, 10 May 2025 12:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 263B45C487C;
	Sat, 10 May 2025 12:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB11C4CEE2;
	Sat, 10 May 2025 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746879802;
	bh=fJ09idw0k6VOwugZFuVgtxsdsW4+oSLBmul/hcAb+VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES8QMARxdqfQqUFG1Mq9ItRQEi+VSzHDUVAxDsxw/4OTQw9uYBQiJ37h80h1LIypw
	 HeB64+zAOYYPEG7WkET0205NvJwmbw7yJT0QW3mDXGVbdhOj5fqoy2aPOxxGz3w4Zy
	 OCaTFg3Z+OFAKiGZ/GeHwTEHyM7JgMZGzi4yEM9UkwIYD7Rdesbx1+eFH0ey4FwxtK
	 M3jCFy5Yng895eVwpum2ep7sfdXvALcyKXo88Fd8mS5Q9IC7L/K5g/rIlXDeVAgFSJ
	 XGhrXNQAYxRcJGxq4a/Wo4oOO0OdDsyiO/rqYuFu2ddQZSWZzHNBNb5avMljwnE+nC
	 5mpLkBF6SkUdQ==
Date: Sat, 10 May 2025 14:23:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH v3 11/11] net: airoha: add phylink support for
 GDM2/3/4
Message-ID: <aB9FOFYEHueMe5L3@lore-desk>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
 <20250510102348.14134-12-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8oAR6Szfu4s7qgD3"
Content-Disposition: inline
In-Reply-To: <20250510102348.14134-12-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_052324_395884_3D86BE1C 
X-CRM114-Status: GOOD (  29.18  )
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


--8oAR6Szfu4s7qgD3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add phylink support for GDM2/3/4 port that require configuration of the
> PCS to make the external PHY or attached SFP cage work.
>=20
> These needs to be defined in the GDM port node using the pcs-handle
> property.

Hi Christian,

thx for the patch. Some comments inline.

Regards,
Lorenzo

>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  | 138 ++++++++++++++++++++++
>  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
>  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
>  3 files changed, 153 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 16c7896f931f..17521be820b5 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -7,6 +7,7 @@
>  #include <linux/of_net.h>
>  #include <linux/platform_device.h>
>  #include <linux/tcp.h>
> +#include <linux/pcs/pcs.h>
>  #include <linux/u64_stats_sync.h>
>  #include <net/dst_metadata.h>
>  #include <net/page_pool/helpers.h>
> @@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_p=
ort *port)
>  	return port->id =3D=3D 1;
>  }
> =20
> +static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
> +{
> +	return port->id !=3D 1;
> +}
> +
>  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *a=
ddr)
>  {
>  	struct airoha_eth *eth =3D port->qdma->eth;
> @@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
>  	struct airoha_qdma *qdma =3D port->qdma;
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		err =3D phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
> +		if (err) {
> +			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
> +				   err);
> +			return err;
> +		}
> +
> +		phylink_start(port->phylink);
> +	}
> +
>  	netif_tx_start_all_queues(dev);
>  	err =3D airoha_set_vip_for_gdm_port(port, true);
>  	if (err)
> @@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
>  		}
>  	}
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		phylink_stop(port->phylink);
> +		phylink_disconnect_phy(port->phylink);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -2795,6 +2817,110 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *=
eth,
>  	return false;
>  }
> =20
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy=
_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct airoha_gdm_port *port =3D container_of(config, struct airoha_gdm=
_port,
> +						    phylink_config);
> +	struct airoha_qdma *qdma =3D port->qdma;
> +	struct airoha_eth *eth =3D qdma->eth;
> +	u32 frag_size_tx, frag_size_rx;

I guess we can just return here if port->id !=3D 4 and avoid setting
frag_size_tx/frag_size_rx

> +
> +	switch (speed) {
> +	case SPEED_10000:
> +	case SPEED_5000:
> +		frag_size_tx =3D 8;
> +		frag_size_rx =3D 8;
> +		break;
> +	case SPEED_2500:
> +		frag_size_tx =3D 2;
> +		frag_size_rx =3D 1;
> +		break;
> +	default:
> +		frag_size_tx =3D 1;
> +		frag_size_rx =3D 0;
> +	}
> +
> +	/* Configure TX/RX frag based on speed */
> +	if (port->id =3D=3D 4) {
> +		airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, GDMA4_SGMII0_TX_FRAG_SIZE,
> +			      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE, frag_size_tx));
> +
> +		airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, GDMA4_SGMII0_RX_FRAG_SIZE,
> +			      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE, frag_size_rx));
> +	}
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops =3D {
> +	.mac_link_up =3D airoha_mac_link_up,
> +};
> +
> +static int airoha_setup_phylink(struct net_device *dev)
> +{
> +	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	struct device_node *np =3D dev->dev.of_node;
> +	struct phylink_pcs **available_pcs;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +	unsigned int num_pcs;
> +	int err;
> +
> +	err =3D of_get_phy_mode(np, &phy_mode);
> +	if (err) {
> +		dev_err(&dev->dev, "incorrect phy-mode\n");
> +		return err;
> +	}
> +
> +	port->phylink_config.dev =3D &dev->dev;
> +	port->phylink_config.type =3D PHYLINK_NETDEV;
> +	port->phylink_config.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUS=
E |
> +						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
> +						MAC_5000FD | MAC_10000FD;
> +
> +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
> +	if (err)
> +		return err;
> +
> +	available_pcs =3D kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
> +	if (!available_pcs)
> +		return -ENOMEM;

since airoha_setup_phylink() is just run in the following path:

airoha_probe() -> airoha_alloc_gdm_port()

we can use devm_kcalloc() and get rid of the kfree and the end of the routi=
ne.

> +
> +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
> +				       &num_pcs);
> +	if (err)
> +		goto out;
> +
> +	port->phylink_config.available_pcs =3D available_pcs;
> +	port->phylink_config.num_available_pcs =3D num_pcs;
> +
> +	__set_bit(PHY_INTERFACE_MODE_SGMII,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> +		  port->phylink_config.supported_interfaces);
> +
> +	phy_interface_copy(port->phylink_config.pcs_interfaces,
> +			   port->phylink_config.supported_interfaces);
> +
> +	phylink =3D phylink_create(&port->phylink_config,
> +				 of_fwnode_handle(np),
> +				 phy_mode, &airoha_phylink_ops);
> +	if (IS_ERR(phylink)) {
> +		err =3D PTR_ERR(phylink);
> +		goto out;
> +	}
> +
> +	port->phylink =3D phylink;
> +out:
> +	kfree(available_pcs);
> +
> +	return err;
> +}
> +
>  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  				 struct device_node *np, int index)
>  {
> @@ -2873,6 +2999,12 @@ static int airoha_alloc_gdm_port(struct airoha_eth=
 *eth,
>  	if (err)
>  		return err;
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		err =3D airoha_setup_phylink(dev);
> +		if (err)
> +			return err;
> +	}
> +
>  	return register_netdev(dev);

we should run phylink_destroy() if register_netdev() fails. Please take a
look to:

https://lore.kernel.org/netdev/aB8MPkMYXWvoaA03@lore-desk/T/#m0a036b0759384=
a38d2518025db46306858b5707b

>  }
> =20
> @@ -2967,6 +3099,9 @@ static int airoha_probe(struct platform_device *pde=
v)
>  		struct airoha_gdm_port *port =3D eth->ports[i];
> =20
>  		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> +			if (airhoa_is_phy_external(port))
> +				phylink_destroy(port->phylink);
> +
>  			unregister_netdev(port->dev);
>  			airoha_metadata_dst_free(port);
>  		}
> @@ -2994,6 +3129,9 @@ static void airoha_remove(struct platform_device *p=
dev)
>  			continue;
> =20
>  		airoha_dev_stop(port->dev);
> +		if (airhoa_is_phy_external(port))
> +			phylink_destroy(port->phylink);
> +
>  		unregister_netdev(port->dev);
>  		airoha_metadata_dst_free(port);
>  	}
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 53f39083a8b0..73a500474076 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -498,6 +498,9 @@ struct airoha_gdm_port {
>  	struct net_device *dev;
>  	int id;
> =20
> +	struct phylink *phylink;
> +	struct phylink_config phylink_config;
> +
>  	struct airoha_hw_stats stats;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethe=
rnet/airoha/airoha_regs.h
> index d931530fc96f..71c63108f0a8 100644
> --- a/drivers/net/ethernet/airoha/airoha_regs.h
> +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> @@ -357,6 +357,18 @@
>  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
>  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> =20
> +#define REG_GDMA4_TMBI_FRAG		0x2028
> +#define GDMA4_SGMII1_TX_WEIGHT		GENMASK(31, 26)
> +#define GDMA4_SGMII1_TX_FRAG_SIZE	GENMASK(25, 16)
> +#define GDMA4_SGMII0_TX_WEIGHT		GENMASK(15, 10)
> +#define GDMA4_SGMII0_TX_FRAG_SIZE	GENMASK(9, 0)

in order to be consistent with the codebase, can you please add _MASK suffix
here?

> +
> +#define REG_GDMA4_RMBI_FRAG		0x202c
> +#define GDMA4_SGMII1_RX_WEIGHT		GENMASK(31, 26)
> +#define GDMA4_SGMII1_RX_FRAG_SIZE	GENMASK(25, 16)
> +#define GDMA4_SGMII0_RX_WEIGHT		GENMASK(15, 10)
> +#define GDMA4_SGMII0_RX_FRAG_SIZE	GENMASK(9, 0)
> +
>  #define REG_MC_VLAN_EN			0x2100
>  #define MC_VLAN_EN_MASK			BIT(0)
> =20
> --=20
> 2.48.1
>=20

--8oAR6Szfu4s7qgD3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaB9FOAAKCRA6cBh0uS2t
rKPIAPwMEFXVq68i8yQsuu9IvUlxGoQG+53nB09xyQ9gjCAcrAD/R4CUglVPB8nT
85veqNrpKWaemKxHYCZcXiFXq5lPbws=
=fSdo
-----END PGP SIGNATURE-----

--8oAR6Szfu4s7qgD3--


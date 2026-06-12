Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F54BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmgN00liNfzrKUpHKe2uLP5CzE/i+fUpNTEzOPemRiU=; b=nl780QVTmWXhho0gkb0XcJ5ADb
	VAM6pSRF3zJ3hvUvmZMSqrB/fKVvNLh3hSrqoYLotbVX6/qHomQjsXkfK1yR6w0NPBvOlzVI1l0XO
	b4gdfmn7Qr5zhocHJdGkdiBLA7KyhZq2V9DNc/L0UadrTfXR+i+rAPzGe37Px7nEyauRs7st+QzwE
	jpTtapqA/bmFDXNSvter3mktf62j18HBRq+E+tg4QZ6nCLRXNArUCqdgbumBrW+cxATToIuEvijJU
	YhXBXng50lDwfA1uOzzyhOI3GN9mSp/43GU+/zgmTiFIUM9i+eMqWo1GaTEKkbxeGfMwnZ6/OI8F2
	+mDAk/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2kM-0000000B2qL-2Dwn;
	Fri, 12 Jun 2026 14:20:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2kL-0000000B2q9-2tIx;
	Fri, 12 Jun 2026 14:20:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1805443FF8;
	Fri, 12 Jun 2026 14:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DAB1F000E9;
	Fri, 12 Jun 2026 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781274033;
	bh=XmgN00liNfzrKUpHKe2uLP5CzE/i+fUpNTEzOPemRiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hUQhz6ZsUf1rnNlaOOTzZs1s1aUQjqcRvrNFvYustc9i9jZPQfH/rvHlVA7ShOkHN
	 b1OmdAbfpJkownfKw4wc40eM3PZxVK/KvAqd42p+9WXWgYPUodzYBilBAnI4Hjx83N
	 i08kAybxzSapZYxMoMgNl5gbIlJjETqcY9pwmGd5lafunkkSq9tL1Eq1q7Fal3MFz1
	 sdCWVsXJtfzMpmyWzdgNBySOiKZyIbCkdhM5fudl8jcHLuJOD26UiQN4cPR7xcG5Mv
	 z1vCAHH+m9RBLs8disqfxAcvMJXohKuus0+U6FphoTN3Ez96BMxbJuuJDgNKF7038s
	 Om6psuizW7dhQ==
Date: Fri, 12 Jun 2026 16:20:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH net-next] net: airoha: better handle MIBs for GDM ports
 with multiple devs attached
Message-ID: <aiwVrsDPAFReG-S0@lore-desk>
References: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FhukJ4AvDXwOD84H"
Content-Disposition: inline
In-Reply-To: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
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


--FhukJ4AvDXwOD84H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In the context of a GDM port that can have multiple net_devices attached
> (GDM3 and GDM4), the HW counters (MIBs) are global for the GDM port.
> This cause duplicated stats reported to the kernel for the related
> net_device.
> The SoC supports a split MIB feature where each counter is tracked based
> on the relevant HW channel (NBQ) to account for this scenario and
> provide a way to select the related counter on accessing the MIB
> registers.
> Enable this feature for GDM3 and GDM4 and configure the relevant HW
> channel before updating the HW stats to report correct HW counter to the
> kernel for the related interface.
> Move the stats struct from port to dev since HW counter are now specific
> to the network device instead of the GDM port. Refactor
> airoha_update_hw_stats() to take airoha_eth and airoha_gdm_port
> parameters since the function operates on the entire port.
>=20
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 191 +++++++++++++++++--------=
------
>  drivers/net/ethernet/airoha/airoha_eth.h |   7 +-
>  2 files changed, 112 insertions(+), 86 deletions(-)
>=20

[...]

> -	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
> +static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
> +{
> +	struct airoha_gdm_port *port =3D dev->port;
> +	int i;
> +
> +	spin_lock(&port->stats_lock);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(port->devs); i++) {
> +		if (port->devs[i])
> +			airoha_dev_get_hw_stats(port->devs[i]);
> +	}
> +
> +	/* Reset MIB counters */
> +	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
>  		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);

commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260611-airoha-eth-mul=
ti-serdes-stats-v1-1-42442ae42064%40kernel.org

- With split MIB enabled on GDM3/GDM4, airoha_dev_get_hw_stats() programs
  REG_FE_GDM_MIB_CFG with the device's nbq before reading per-channel
  counters, so the FE_TX_MIB_ID/FE_RX_MIB_ID selector clearly gates the
  counter reads.
  After the loop in airoha_update_hw_stats(), MIB_CFG retains the last
  iterated device's nbq, and a single airoha_fe_set() is issued against
  REG_FE_GDM_MIB_CLEAR. REG_FE_GDM_MIB_CLEAR exposes only RX/TX bits with no
  separate per-channel selector.
  If, as is typical of split-MIB designs, the clear honors the same
  FE_TX_MIB_ID/FE_RX_MIB_ID selector used for reads, will only the last
  iterated device's HW counters be cleared each cycle?
  Since airoha_dev_get_hw_stats() accumulates with +=3D on each read, would
  the un-cleared HW counters of the other devs keep being re-added to
  dev->stats on every fetch, yielding inflated stats and eventual HW
  counter overflow?
  Would moving the MIB_CLEAR write inside the per-device loop, while that
  device's nbq is still selected in MIB_CFG, address this if the clear is
  indeed per-channel? Or can the datasheet confirm REG_FE_GDM_MIB_CLEAR is
  strictly global and unaffected by split mode?
  - This is the same report available in [0].
    REG_FE_GDM_MIB_CLEAR is global and it clears all nbq counters for the p=
ort.
=20
Regards,
Lorenzo

[0] https://sashiko.dev/#/patchset/20260611-airoha-eth-multi-serdes-stats-v=
1-1-42442ae42064%40kernel.org
> =20
> -	u64_stats_update_end(&port->stats.syncp);
> -	spin_unlock(&port->stats.lock);
> +	spin_unlock(&port->stats_lock);
>  }
> =20
>  static int airoha_dev_open(struct net_device *netdev)
> @@ -2043,23 +2071,22 @@ static void airoha_dev_get_stats64(struct net_dev=
ice *netdev,
>  				   struct rtnl_link_stats64 *storage)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
>  	unsigned int start;
> =20
>  	airoha_update_hw_stats(dev);
>  	do {
> -		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> -		storage->rx_packets =3D port->stats.rx_ok_pkts;
> -		storage->tx_packets =3D port->stats.tx_ok_pkts;
> -		storage->rx_bytes =3D port->stats.rx_ok_bytes;
> -		storage->tx_bytes =3D port->stats.tx_ok_bytes;
> -		storage->multicast =3D port->stats.rx_multicast;
> -		storage->rx_errors =3D port->stats.rx_errors;
> -		storage->rx_dropped =3D port->stats.rx_drops;
> -		storage->tx_dropped =3D port->stats.tx_drops;
> -		storage->rx_crc_errors =3D port->stats.rx_crc_error;
> -		storage->rx_over_errors =3D port->stats.rx_over_errors;
> -	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
> +		start =3D u64_stats_fetch_begin(&dev->stats.syncp);
> +		storage->rx_packets =3D dev->stats.rx_ok_pkts;
> +		storage->tx_packets =3D dev->stats.tx_ok_pkts;
> +		storage->rx_bytes =3D dev->stats.rx_ok_bytes;
> +		storage->tx_bytes =3D dev->stats.tx_ok_bytes;
> +		storage->multicast =3D dev->stats.rx_multicast;
> +		storage->rx_errors =3D dev->stats.rx_errors;
> +		storage->rx_dropped =3D dev->stats.rx_drops;
> +		storage->tx_dropped =3D dev->stats.tx_drops;
> +		storage->rx_crc_errors =3D dev->stats.rx_crc_error;
> +		storage->rx_over_errors =3D dev->stats.rx_over_errors;
> +	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
>  }
> =20
>  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
> @@ -2310,20 +2337,19 @@ static void airoha_ethtool_get_mac_stats(struct n=
et_device *netdev,
>  					 struct ethtool_eth_mac_stats *stats)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
>  	unsigned int start;
> =20
>  	airoha_update_hw_stats(dev);
>  	do {
> -		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> -		stats->FramesTransmittedOK =3D port->stats.tx_ok_pkts;
> -		stats->OctetsTransmittedOK =3D port->stats.tx_ok_bytes;
> -		stats->MulticastFramesXmittedOK =3D port->stats.tx_multicast;
> -		stats->BroadcastFramesXmittedOK =3D port->stats.tx_broadcast;
> -		stats->FramesReceivedOK =3D port->stats.rx_ok_pkts;
> -		stats->OctetsReceivedOK =3D port->stats.rx_ok_bytes;
> -		stats->BroadcastFramesReceivedOK =3D port->stats.rx_broadcast;
> -	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
> +		start =3D u64_stats_fetch_begin(&dev->stats.syncp);
> +		stats->FramesTransmittedOK =3D dev->stats.tx_ok_pkts;
> +		stats->OctetsTransmittedOK =3D dev->stats.tx_ok_bytes;
> +		stats->MulticastFramesXmittedOK =3D dev->stats.tx_multicast;
> +		stats->BroadcastFramesXmittedOK =3D dev->stats.tx_broadcast;
> +		stats->FramesReceivedOK =3D dev->stats.rx_ok_pkts;
> +		stats->OctetsReceivedOK =3D dev->stats.rx_ok_bytes;
> +		stats->BroadcastFramesReceivedOK =3D dev->stats.rx_broadcast;
> +	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
>  }
> =20
>  static const struct ethtool_rmon_hist_range airoha_ethtool_rmon_ranges[]=
 =3D {
> @@ -2343,8 +2369,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *ne=
tdev,
>  			      const struct ethtool_rmon_hist_range **ranges)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> -	struct airoha_hw_stats *hw_stats =3D &port->stats;
> +	struct airoha_hw_stats *hw_stats =3D &dev->stats;
>  	unsigned int start;
> =20
>  	BUILD_BUG_ON(ARRAY_SIZE(airoha_ethtool_rmon_ranges) !=3D
> @@ -2357,7 +2382,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *ne=
tdev,
>  	do {
>  		int i;
> =20
> -		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> +		start =3D u64_stats_fetch_begin(&dev->stats.syncp);
>  		stats->fragments =3D hw_stats->rx_fragment;
>  		stats->jabbers =3D hw_stats->rx_jabber;
>  		for (i =3D 0; i < ARRAY_SIZE(airoha_ethtool_rmon_ranges) - 1;
> @@ -2365,7 +2390,7 @@ airoha_ethtool_get_rmon_stats(struct net_device *ne=
tdev,
>  			stats->hist[i] =3D hw_stats->rx_len[i];
>  			stats->hist_tx[i] =3D hw_stats->tx_len[i];
>  		}
> -	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
> +	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
>  }
> =20
>  static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
> @@ -3205,6 +3230,7 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
> =20
>  	netdev->dev.of_node =3D of_node_get(np);
>  	dev =3D netdev_priv(netdev);
> +	u64_stats_init(&dev->stats.syncp);
>  	dev->port =3D port;
>  	dev->eth =3D eth;
>  	dev->nbq =3D nbq;
> @@ -3244,9 +3270,8 @@ static int airoha_alloc_gdm_port(struct airoha_eth =
*eth,
>  	if (!port)
>  		return -ENOMEM;
> =20
> -	u64_stats_init(&port->stats.syncp);
> -	spin_lock_init(&port->stats.lock);
>  	port->id =3D id;
> +	spin_lock_init(&port->stats_lock);
>  	eth->ports[p] =3D port;
> =20
>  	err =3D airoha_metadata_dst_alloc(port);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 8f42973f9cf5..46b1c31939de 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -215,8 +215,6 @@ struct airoha_tx_irq_queue {
>  };
> =20
>  struct airoha_hw_stats {
> -	/* protect concurrent hw_stats accesses */
> -	spinlock_t lock;
>  	struct u64_stats_sync syncp;
> =20
>  	/* get_stats64 */
> @@ -554,6 +552,8 @@ struct airoha_gdm_dev {
> =20
>  	u32 flags;
>  	int nbq;
> +
> +	struct airoha_hw_stats stats;
>  };
> =20
>  struct airoha_gdm_port {
> @@ -561,7 +561,8 @@ struct airoha_gdm_port {
>  	int id;
>  	int users;
> =20
> -	struct airoha_hw_stats stats;
> +	/* protect concurrent hw_stats accesses */
> +	spinlock_t stats_lock;
> =20
>  	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
>  };
>=20
> ---
> base-commit: c8459ee2fef502d6ef6c063751c33d9ac7943eab
> change-id: 20260611-airoha-eth-multi-serdes-stats-df2dc16c2dd6
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--FhukJ4AvDXwOD84H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiwVrgAKCRA6cBh0uS2t
rKu6AQDumrhIwrcMDWIY+GuFB+DEDI0uaQvW66P9ODgOIqtTSgEAxasot6+gXKVS
hKz9TE6kMOdhzhV+o9R7MYzDFzg26AA=
=Tgvv
-----END PGP SIGNATURE-----

--FhukJ4AvDXwOD84H--


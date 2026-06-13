Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B9CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/E5Fca0jxyWWWjjsZ9luEgmIKmaLIRLdokARXgYoFI=; b=QTUNelfPooPcveL1z9bujPUR6Q
	syyQ8L0d0s6HGDs8NnqGDDXGbJDyB97DdAzkkkJO80MBuUPIrtxqDd6F/mAQyHlXlHhu81SpUsfh0
	PPlLOyHO4rtmxc7fPpnCtiEBrPYpynxvpeLNlW4mauorJGrvn6E1pI4K5t8kT3oI1gwjkxjNPthZU
	VkAveUax89hQkGaivCVPSg9VpHELct5IE/lj+dyR/LTN5TyH7HS35k/KAgc9/qR2xJfkUncV6EMkz
	MK9FVHmlcyc3SLeEwRM68ZfoifkZrxT6pl7LG/OeAK4CNJqpv6eewJgBQwILZ37X55eiIAfRPUmwa
	dzBvCT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqI-0000000C81o-0RL9;
	Sat, 13 Jun 2026 09:39:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqE-0000000C80c-3yhR;
	Sat, 13 Jun 2026 09:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36D03401DF;
	Sat, 13 Jun 2026 09:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2DF1F000E9;
	Sat, 13 Jun 2026 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781343590;
	bh=c/E5Fca0jxyWWWjjsZ9luEgmIKmaLIRLdokARXgYoFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dCLmM7a9xXuV2+9irYXtJAzq5FYBSGnBPVnzTGaBOLjBoVpjF1gZo46HM5ZJQDYu+
	 kiaOoXIGCi93RdmNGcJwo4dcGma51C82Q/QcZlglwJiQo+Y1h0oUxVJz+hlz604bXR
	 Ly8DAhHZmynDHEHrNL2qN1IkLdANsR0sqzcfh7J6EMNwQeMkPk2EaD1JO+hVn8VqR5
	 jxJ2xvy+I6ore/mBBTuLoPjr0qfXx0ZNA+4LIIDB8MFiFeioFu5TnFCpew99yJ3FFB
	 U/7g7qTqpXRM/sKK9ejx5lkYDyHXA3dRgyl49A/fXkyM3MGWoiAV0bbuSpaQMeYMZL
	 J73wL+ZOxnmWg==
Date: Sat, 13 Jun 2026 11:39:46 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v5 3/3] net: airoha: defer GDM3/GDM4 WAN mode
 and GDM2 loopback to QoS offload
Message-ID: <ai0lYuZeduHZV_Ts@lore-rh-laptop>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
 <20260611-airoha-ethtool-priv_flags-v5-3-c11de08486d1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QJnbX3YQODwBY7ap"
Content-Disposition: inline
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-3-c11de08486d1@kernel.org>
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


--QJnbX3YQODwBY7ap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260611-airoha-ethtool-priv_flags-v5-0-c11d=
e08486d1%40kernel.org


[...]
>  static void airoha_dev_set_qdma(struct airoha_gdm_dev *dev)
>  {
>  	struct net_device *netdev =3D netdev_from_priv(dev);
> +	struct airoha_qdma *cur_qdma, *qdma;
>  	struct airoha_eth *eth =3D dev->eth;
>  	int ppe_id;
> =20
>  	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
> -	dev->qdma =3D &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
> -	netdev->irq =3D dev->qdma->irq_banks[0].irq;
> +	qdma =3D &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
> +	cur_qdma =3D airoha_qdma_deref(dev);
> +	if (netif_running(netdev))
> +		airoha_qdma_start(qdma);
> +
> +	rcu_assign_pointer(dev->qdma, qdma);
> +	netdev->irq =3D qdma->irq_banks[0].irq;
> =20
>  	ppe_id =3D !airoha_is_lan_gdm_dev(dev) && airoha_ppe_is_enabled(eth, 1);
>  	airoha_ppe_set_cpu_port(dev, ppe_id, airoha_get_fe_port(dev));
> +
> +	if (!cur_qdma)
> +		return;
> +
> +	synchronize_rcu();
> +	netif_tx_wake_all_queues(netdev);
> +
> +	if (netif_running(netdev))
> +		airoha_qdma_stop(cur_qdma);
>  }

- When we switch the QDMA of a running device, airoha_qdma_stop() might
  free pending SKBs via dev_kfree_skb_any() in airoha_qdma_cleanup_tx_queue=
().
  Are these SKBs freed without calling netdev_tx_completed_queue() to
  update Byte Queue Limits (BQL)?
  Since the device is running, could the BQL counters leak and cause the
  TX queue to permanently hang once the limit is reached?

  - As pointed out in path 1/3, this is a pre-existing issue since we have =
the
    same problem running airoha_dev_stop() for a QDMA single-user device
    (airoha_qdma_cleanup_tx_queue() can run before the pending TX NAPI).
    I will fix the problem with a dedicated patch.

> =20
>  static int airoha_dev_init(struct net_device *netdev)
> @@ -2180,9 +2244,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  				   struct net_device *netdev)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_qdma *qdma =3D dev->qdma;
>  	u32 nr_frags, tag, msg0, msg1, len;
>  	struct airoha_queue_entry *e;
> +	struct airoha_qdma *qdma;
>  	struct netdev_queue *txq;

- This is a pre-existing issue, but does the TX path modify the TCP header
  directly without ensuring it is in the linear region?

  - This issue (not introduced by this patch) has been already reported in =
the
    past and we already agreed that it can't occur.


>  	struct airoha_queue *q;
>  	LIST_HEAD(tx_list);
> @@ -2191,6 +2255,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	u16 index;
>  	u8 fport;
> =20

[...]

> @@ -2793,11 +2869,12 @@ static int airoha_tc_htb_alloc_leaf_queue(struct =
net_device *netdev,
>  	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
>  	int err, num_tx_queues =3D netdev->real_num_tx_queues;
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_qdma *qdma =3D dev->qdma;
> +	struct airoha_qdma *qdma;
> =20
>  	/* Here we need to check the requested QDMA channel is not already
>  	 * in use by another net_device running on the same QDMA block.
>  	 */
> +	qdma =3D airoha_qdma_deref(dev);

- This is a pre-existing issue, but does modifying real_num_tx_queues
  as a dense counter cause problems when QoS leaf queues are allocated
  with sparse IDs?

  - I have already a fix for this issue I need to post.

>  	if (test_and_set_bit(channel, qdma->qos_channel_map)) {
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "qdma qos channel already in use");
> @@ -2831,7 +2908,7 @@ static int airoha_qdma_set_rx_meter(struct airoha_g=
dm_dev *dev,
>  				    u32 rate, u32 bucket_size,

[...]

> +
> +static int airoha_enable_qos_for_gdm34(struct net_device *netdev,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct airoha_gdm_dev *wan_dev, *dev =3D netdev_priv(netdev);
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_eth *eth =3D dev->eth;
> +	int err =3D -EBUSY;
> +
> +	if (port->id !=3D AIROHA_GDM3_IDX &&
> +	    port->id !=3D AIROHA_GDM4_IDX) {
> +		/* HW QoS is always supported by GDM1 and GDM2 */
> +		return 0;
> +	}
> +
> +	if (!airoha_is_lan_gdm_dev(dev)) /* Already enabled */
> +		return 0;
> +
> +	mutex_lock(&flow_offload_mutex);
> +
> +	wan_dev =3D airoha_get_wan_gdm_dev(eth);
> +	if (wan_dev) {
> +		if ((wan_dev->flags & AIROHA_PRIV_F_QOS) ||
> +		    wan_dev->port->id =3D=3D AIROHA_GDM2_IDX) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "QoS configured for WAN device");
> +			goto error_unlock;
> +		}
> +		airoha_disable_qos_for_gdm34(netdev_from_priv(wan_dev));
> +	}
> +
> +	dev->flags |=3D AIROHA_PRIV_F_WAN;
> +	airoha_dev_set_qdma(dev);
> +	err =3D airoha_enable_gdm2_loopback(dev);
> +	if (err)
> +		goto error_disable_wan;
> +
> +	err =3D airoha_set_macaddr(dev, netdev->dev_addr);
> +	if (err)
> +		goto error_disable_loopback;
> +
> +	if (netif_running(netdev)) {
> +		u32 pse_port;
> +
> +		pse_port =3D airoha_ppe_is_enabled(eth, 1) ? FE_PSE_PORT_PPE2
> +							 : FE_PSE_PORT_PPE1;
> +		airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id),
> +					    pse_port);
> +	}
> +
> +	mutex_unlock(&flow_offload_mutex);
> +
> +	return 0;
> +
> +error_disable_loopback:
> +	airoha_disable_gdm2_loopback(dev);
> +error_disable_wan:
> +	dev->flags &=3D ~AIROHA_PRIV_F_WAN;
> +	airoha_dev_set_qdma(dev);
> +error_unlock:
> +	mutex_unlock(&flow_offload_mutex);
> +
> +	return err;
> +}

- If airoha_set_macaddr() fails and we jump to error_disable_loopback,
  the original wan_dev was preemptively demoted to LAN mode, but the error
  path doesn't restore it.
  Since the requesting device is also rolled back to LAN, does this leave
  the system entirely without a WAN device? Would this permanently break
  routing on the original WAN interface until manually reconfigured?

  - If airoha_enable_qos_for_gdm34() fails, the system will continue routing
    packets and, even if we re-promote the original interface to WAN, the u=
ser
    will need to re-apply the same configuration to offload the intended
    Qdisc on the new interface.
    Moreover, please note this corner case occurs just if the original
    interface has no Qdisc already configured on it. In the common case, the
    user has previously removed the configured Qdisc on the original interf=
ace
    and so, the roll-back process will still be partial.
    In the end, airoha_set_macaddr() can fail just if the device is not
    well-configured.
    For the reasons above, I guess it does not worth to reset the original
    interface to WAN if airoha_set_macaddr() fails.

Regards,
Lorenzo

> +
>  static int airoha_tc_htb_destroy(struct net_device *netdev)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> @@ -3038,6 +3205,8 @@ static int airoha_tc_htb_destroy(struct net_device =
*netdev)
>  	for_each_set_bit(q, dev->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
>  		airoha_tc_remove_htb_queue(netdev, q);
> =20
> +	dev->flags &=3D ~AIROHA_PRIV_F_QOS;
> +
>  	return 0;
>  }
> =20
> @@ -3057,24 +3226,33 @@ static int airoha_tc_get_htb_get_leaf_queue(struc=
t net_device *netdev,
>  	return 0;
>  }
> =20
> -static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
> +static int airoha_tc_setup_qdisc_htb(struct net_device *netdev,
>  				     struct tc_htb_qopt_offload *opt)
>  {
>  	switch (opt->command) {
> -	case TC_HTB_CREATE:
> +	case TC_HTB_CREATE: {
> +		struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +		int err;
> +
> +		err =3D airoha_enable_qos_for_gdm34(netdev, opt->extack);
> +		if (err)
> +			return err;
> +
> +		dev->flags |=3D AIROHA_PRIV_F_QOS;
>  		break;
> +	}
>  	case TC_HTB_DESTROY:
> -		return airoha_tc_htb_destroy(dev);
> +		return airoha_tc_htb_destroy(netdev);
>  	case TC_HTB_NODE_MODIFY:
> -		return airoha_tc_htb_modify_queue(dev, opt);
> +		return airoha_tc_htb_modify_queue(netdev, opt);
>  	case TC_HTB_LEAF_ALLOC_QUEUE:
> -		return airoha_tc_htb_alloc_leaf_queue(dev, opt);
> +		return airoha_tc_htb_alloc_leaf_queue(netdev, opt);
>  	case TC_HTB_LEAF_DEL:
>  	case TC_HTB_LEAF_DEL_LAST:
>  	case TC_HTB_LEAF_DEL_LAST_FORCE:
> -		return airoha_tc_htb_delete_leaf_queue(dev, opt);
> +		return airoha_tc_htb_delete_leaf_queue(netdev, opt);
>  	case TC_HTB_LEAF_QUERY_QUEUE:
> -		return airoha_tc_get_htb_get_leaf_queue(dev, opt);
> +		return airoha_tc_get_htb_get_leaf_queue(netdev, opt);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 24fd8dcf7fca..d1390ffcea7c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -540,11 +540,12 @@ struct airoha_qdma {
> =20
>  enum airoha_priv_flags {
>  	AIROHA_PRIV_F_WAN =3D BIT(0),
> +	AIROHA_PRIV_F_QOS =3D BIT(1),
>  };
> =20
>  struct airoha_gdm_dev {
> +	struct airoha_qdma __rcu *qdma;
>  	struct airoha_gdm_port *port;
> -	struct airoha_qdma *qdma;
>  	struct airoha_eth *eth;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> @@ -676,6 +677,16 @@ int airoha_get_fe_port(struct airoha_gdm_dev *dev);
>  bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
>  			     struct airoha_gdm_dev *dev);
> =20
> +extern struct mutex flow_offload_mutex;
> +
> +static inline struct airoha_qdma *
> +airoha_qdma_deref(struct airoha_gdm_dev *dev)
> +{
> +	return rcu_dereference_protected(dev->qdma,
> +					 lockdep_rtnl_is_held() ||
> +					 lockdep_is_held(&flow_offload_mutex));
> +}
> +
>  void airoha_ppe_set_cpu_port(struct airoha_gdm_dev *dev, u8 ppe_id, u8 f=
port);
>  bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
>  void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *sk=
b,
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 91bcc55a6ac6..1d1b1a57d795 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -15,7 +15,10 @@
>  #include "airoha_regs.h"
>  #include "airoha_eth.h"
> =20
> -static DEFINE_MUTEX(flow_offload_mutex);
> +/* Serialize airoha_gdm_dev flags, QDMA pointer and PPE CPU port
> + * configuration.
> + */
> +DEFINE_MUTEX(flow_offload_mutex);
>  static DEFINE_SPINLOCK(ppe_lock);
> =20
>  static const struct rhashtable_params airoha_flow_table_params =3D {
> @@ -86,8 +89,8 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *=
ppe)
> =20
>  void airoha_ppe_set_cpu_port(struct airoha_gdm_dev *dev, u8 ppe_id, u8 f=
port)
>  {
> -	struct airoha_qdma *qdma =3D dev->qdma;
> -	struct airoha_eth *eth =3D qdma->eth;
> +	struct airoha_qdma *qdma =3D airoha_qdma_deref(dev);
> +	struct airoha_eth *eth =3D dev->eth;
>  	u8 qdma_id =3D qdma - &eth->qdma[0];
>  	u32 fe_cpu_port;
> =20
> diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethe=
rnet/airoha/airoha_regs.h
> index 436f3c8779c1..4e17dfbcf2b8 100644
> --- a/drivers/net/ethernet/airoha/airoha_regs.h
> +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> @@ -376,6 +376,7 @@
> =20
>  #define REG_SRC_PORT_FC_MAP6		0x2298
>  #define FC_ID_OF_SRC_PORT_MASK(_n)	GENMASK(4 + ((_n) << 3), ((_n) << 3))
> +#define FC_MAP6_DEF_VALUE		0x1b1a1918
> =20
>  #define REG_CDM5_RX_OQ1_DROP_CNT	0x29d4
> =20
>=20
> --=20
> 2.54.0
>=20

--QJnbX3YQODwBY7ap
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai0lXgAKCRA6cBh0uS2t
rIqDAP95n/73PDuBIgAeHKOPxVIFXuPzIB8KQfH9F4my2ifE+QD+NcqVpFgcSDjp
tmBsD6K8VzxtjNJLmY3Rn+YaGxoT9gU=
=RAW6
-----END PGP SIGNATURE-----

--QJnbX3YQODwBY7ap--


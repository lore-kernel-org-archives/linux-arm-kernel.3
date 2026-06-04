Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E51ECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXWX2X1IdSYuWmeJ4APMMdKu4ZoZ7LZ+WFh9+wZtPXc=; b=14P4HTxYSfRNO5qxxB7Qcy5uSv
	bpFgjHUnbJ/sT7XbYn+CURKLOgKxj/nI8mIyzI2lO25Sl5Z1uNxDDhFGQxJEJN6g+C6rn3o5dsI4h
	vwraXqXAjO6KjPT2FnR9AGXqleTYxaD3YGvkkbO7u6PqhuMyn8fzNox0yAeyolE2qHNlUfEHR+0YC
	fY2yjNwHcJCEe0BRZe2ZG4DE+LWRoaqCP8X0VYNpDrxbngD4CAsK2AA3lR/B+3PTTD7NVtYrYQtIl
	N40epEn0hnKMbJ9UUei+dk9HpvRhnTEqgzgEkrpU4IdL7zDL586rlQOTxRvh5+YjkYvCKiRYofA/H
	lSZLceMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4FT-0000000GU77-20Rs;
	Thu, 04 Jun 2026 09:20:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4FS-0000000GU6w-0cle;
	Thu, 04 Jun 2026 09:20:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9927942A8C;
	Thu,  4 Jun 2026 09:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A601F00893;
	Thu,  4 Jun 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564820;
	bh=aXWX2X1IdSYuWmeJ4APMMdKu4ZoZ7LZ+WFh9+wZtPXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZYTMnRFIH8WWQgBB2lEzzMzQy+hhuNR+MyMG6+e3Tlzf3roeq3kJR1MK+By5cR+z
	 n0ISfSyzY4DtK4ROq5VUTKP+xNd1wCU0awoLYdid9jlMZ+tYbPZR6c8GbgQVhel2ix
	 EhEo7b4XltVj6L9MX4d8BeU51tAvI7yqAcJ3Hnoq5JINf3iAB0Qs/wffYJMKeXtIUI
	 tGHqMJYcy8PoXDZKK9iJzkT3HiDJkCbC5qwV5qCvU+2IMinWU+439/VipnM912qlW9
	 pILQkFBeSZUG2Mkg9S3pczfhGKDWW8L6d8UB5lZb/EqCZdofYitmBVw6x4e3CDn9Ua
	 PQdWBa8YnyCWQ==
Date: Thu, 4 Jun 2026 11:20:18 +0200
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
	devicetree@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v9 6/6] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
Message-ID: <aiFDUpMC1RHRkzZL@lore-desk>
References: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
 <20260603-airoha-eth-multi-serdes-v9-6-5d476bc2f426@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SFnAkeHUpYpN2nJa"
Content-Disposition: inline
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-6-5d476bc2f426@kernel.org>
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


--SFnAkeHUpYpN2nJa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 03, Lorenzo Bianconi wrote:
> The EN7581 and AN7583 SoCs provide registers to configure hardware LAN/WAN
> MAC addresses. These registers are used during FE hw acceleration to
> determine whether received traffic is destined to this host (L3 traffic)
> or should be switched to another device (L2 traffic).
> The SoC hardware design assumes all interfaces configured as LAN (or WAN)
> share the MAC address MSBs, which are programmed into the
> REG_FE_{LAN,WAN}_MAC_H register. The LSBs of 'local' mac addresses can be
> expressed as a range via the REG_FE_MAC_LMIN and REG_FE_MAC_LMAX
> registers. In order to properly accelerate the traffic, FE module requires
> the user to configure the REG_FE_{LAN,WAN}_MAC_H register respecting this
> limitation. Please note a misconfiguration in REG_FE_{LAN,WAN}_MAC_H
> will still allow the user to log into the device for debugging.
> Previously, only a single interface was considered when programming these
> registers. Extend the logic to derive the correct minimum and maximum
> values for REG_FE_MAC_LMIN/REG_FE_MAC_LMAX when two or more interfaces are
> configured as LAN or WAN. Since this functionality was not available
> before this series, no regression is introduced.

Commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260603-airoha-eth-mul=
ti-serdes-v9-0-5d476bc2f426%40kernel.org

- How does this validation interact with the init path?=20
  In airoha_alloc_gdm_device(), interfaces lacking a DT MAC fall back to
  eth_hw_addr_random(), and airoha_dev_init() calls airoha_set_macaddr()
  but discards the int return, so a netdev whose initial MAC would fail
  the new MSB check still proceeds to register and reaches NETREG_REGISTERE=
D.
  - This is done on purpose to not block the device probe and allow the user
    to log into the system, and based on the syslog, fix the issue manually.

Regards,
Lorenzo

>=20
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 77 ++++++++++++++++++++++++++=
++----
>  drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
>  drivers/net/ethernet/airoha/airoha_ppe.c |  4 +-
>  3 files changed, 71 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 64ee526da241..8f2608293bb7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -71,20 +71,76 @@ static void airoha_qdma_irq_disable(struct airoha_irq=
_bank *irq_bank,
>  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
>  }
> =20
> -static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *add=
r)
> +static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
>  {
> +	u8 ref_addr[ETH_ALEN] __aligned(2);
>  	struct airoha_eth *eth =3D dev->eth;
> -	u32 val, reg;
> +	u32 reg, val, lmin, lmax;
> +	int i;
> +
> +	eth_zero_addr(ref_addr);
> +	lmin =3D (addr[3] << 16) | (addr[4] << 8) | addr[5];
> +	lmax =3D lmin;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		struct airoha_gdm_port *port =3D eth->ports[i];
> +		int j;
> +
> +		if (!port)
> +			continue;
> +
> +		for (j =3D 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *iter_dev;
> +			struct net_device *netdev;
> +
> +			iter_dev =3D port->devs[j];
> +			if (!iter_dev || iter_dev =3D=3D dev)
> +				continue;
> +
> +			if (airoha_is_lan_gdm_dev(iter_dev) !=3D
> +			    airoha_is_lan_gdm_dev(dev))
> +				continue;
> +
> +			netdev =3D netdev_from_priv(iter_dev);
> +			if (netdev->reg_state !=3D NETREG_REGISTERED)
> +				continue;
> +
> +			ether_addr_copy(ref_addr, netdev->dev_addr);
> +			val =3D (netdev->dev_addr[3] << 16) |
> +			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
> +			if (val < lmin)
> +				lmin =3D val;
> +			if (val > lmax)
> +				lmax =3D val;
> +		}
> +	}
> +
> +	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {
> +		/* According to the HW design, hw mac address MSBs must be
> +		 * the same for each net_device with the same LAN/WAN
> +		 * configuration.
> +		 */
> +		struct net_device *netdev =3D netdev_from_priv(dev);
> +
> +		dev_warn(eth->dev,
> +			 "%s: wrong mac addr, MSBs must be %02x:%02x:%02x\n",
> +			 netdev->name, ref_addr[0], ref_addr[1],
> +			 ref_addr[2]);
> +		dev_warn(eth->dev, "FE hw forwarding won't work properly\n");
> +
> +		return -EINVAL;
> +	}
> =20
>  	reg =3D airoha_is_lan_gdm_dev(dev) ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_=
H;
>  	val =3D (addr[0] << 16) | (addr[1] << 8) | addr[2];
>  	airoha_fe_wr(eth, reg, val);
> =20
> -	val =3D (addr[3] << 16) | (addr[4] << 8) | addr[5];
> -	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
> -	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
> +	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), lmin);
> +	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), lmax);
> =20
> -	airoha_ppe_init_upd_mem(dev);
> +	airoha_ppe_init_upd_mem(dev, addr);
> +
> +	return 0;
>  }
> =20
>  static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
> @@ -1826,13 +1882,18 @@ static int airoha_dev_stop(struct net_device *net=
dev)
>  static int airoha_dev_set_macaddr(struct net_device *netdev, void *p)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct sockaddr *addr =3D p;
>  	int err;
> =20
> -	err =3D eth_mac_addr(netdev, p);
> +	err =3D eth_prepare_mac_addr_change(netdev, p);
>  	if (err)
>  		return err;
> =20
> -	airoha_set_macaddr(dev, netdev->dev_addr);
> +	err =3D airoha_set_macaddr(dev, addr->sa_data);
> +	if (err)
> +		return err;
> +
> +	eth_commit_mac_addr_change(netdev, p);
> =20
>  	return 0;
>  }
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 3e8262f583a7..8f42973f9cf5 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -683,7 +683,7 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev,=
 struct sk_buff *skb,
>  int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_=
data);
>  int airoha_ppe_init(struct airoha_eth *eth);
>  void airoha_ppe_deinit(struct airoha_eth *eth);
> -void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev);
> +void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr);
>  u32 airoha_ppe_get_total_num_entries(struct airoha_ppe *ppe);
>  struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
>  						  u32 hash);
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index f54622904733..91bcc55a6ac6 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1487,12 +1487,10 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *=
dev, struct sk_buff *skb,
>  	airoha_ppe_foe_insert_entry(ppe, skb, hash, rx_wlan);
>  }
> =20
> -void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev)
> +void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr)
>  {
> -	struct net_device *netdev =3D netdev_from_priv(dev);
>  	struct airoha_gdm_port *port =3D dev->port;
>  	struct airoha_eth *eth =3D dev->eth;
> -	const u8 *addr =3D netdev->dev_addr;
>  	u32 val;
> =20
>  	val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];
>=20
> --=20
> 2.54.0
>=20

--SFnAkeHUpYpN2nJa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiFDUgAKCRA6cBh0uS2t
rKFZAPsFq8wtcGM5fSMmaXoN8r3ZJahwhyksHFbQVLSGqyPnpgEAonKxBLMX2x26
QDHe2K2ddF+pJgWY5jkwF5mFrWv1uQo=
=7aG6
-----END PGP SIGNATURE-----

--SFnAkeHUpYpN2nJa--


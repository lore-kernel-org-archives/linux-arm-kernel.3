Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6272CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BYHyFh+bn92L40f3IlB5srPvcVEDDHxqJbwSSj9Lzg=; b=V5N3AdSzheQtFGqUEqv0bau4Oa
	VScPbn2Atg1CX9EN6iKiAuT9JvtPnfRkf1Thc2Pj1QkWri7xVlVxNofaw/1j5FSI7JC+/QI3Z4nQf
	w875lgi4i+vzH0PWK56xROz9tLtkMQdOWEFd+nMiBpGG8SEf7qeO5wavPPdtsilGG93mJcoGJygB6
	d+9piMnfRV9N5Z0aYujThtY5XFJ9Rx7o5RkwVTslMEMdFeDuY/zx1/vOQVks8OmLPgp2k7X2YHRCl
	pRcK03uIU5CpCgzPyNidUV/E3wwHwm8ZRYw03l4Qz8+CstVicn9EU2qbrgS7FDt5tNURph/hNRGQP
	OKJnBPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKKJ-0000000C73C-0eO1;
	Sat, 13 Jun 2026 09:06:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKKH-0000000C733-1NFi;
	Sat, 13 Jun 2026 09:06:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6767660018;
	Sat, 13 Jun 2026 09:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C991F000E9;
	Sat, 13 Jun 2026 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781341608;
	bh=2BYHyFh+bn92L40f3IlB5srPvcVEDDHxqJbwSSj9Lzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ntbb2Swl50vb/4sTsaNgb9GSoAARWW9umw8QUdf+um1aWWZ9JsmMMrQay0yBaXQFJ
	 IOGqW6FDpwqxpvWTUPLbrD9uau102X2efXqEnS7ryPS1qlzlR7Rt5WquHCXvHatkjR
	 r+TvPVL6VYJBAfT2qQgkiWfX6MiXr3ddm1Dvs+51ES/rurrZLwKfti1RyeZLCvehGU
	 SQ54bH2kenKyKDGS7A9pWJFpC8jn4qQSKLx9uCzYuYGRwTkGncG8eSPMoOK/Mz7J60
	 VVlSHjmTwzhhlv7WWPYkqJR4HztacrJvgXf+DSDFW+FER8LmTYxE4A+W1jXx9T71kf
	 pNB7692fqPHZQ==
Date: Sat, 13 Jun 2026 11:06:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/3] net: airoha: use int instead of atomic_t
 for qdma users counter
Message-ID: <ai0dpFhn2eFtvHCM@lore-rh-laptop>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
 <20260611-airoha-ethtool-priv_flags-v5-1-c11de08486d1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rA1nt1Ke2M6EpIQI"
Content-Disposition: inline
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-1-c11de08486d1@kernel.org>
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


--rA1nt1Ke2M6EpIQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> QDMA users counter is always accessed holding RTNL lock so we do not
> require atomic_t for it.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 504247c8bae9..9eb9b6a139b3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1812,7 +1812,7 @@ static int airoha_dev_open(struct net_device *netde=
v)
>  	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
>  			GLOBAL_CFG_TX_DMA_EN_MASK |
>  			GLOBAL_CFG_RX_DMA_EN_MASK);
> -	atomic_inc(&qdma->users);
> +	qdma->users++;
> =20
>  	if (!airoha_is_lan_gdm_dev(dev) &&
>  	    airoha_ppe_is_enabled(qdma->eth, 1))
> @@ -1866,7 +1866,7 @@ static int airoha_dev_stop(struct net_device *netde=
v)
>  					    REG_GDM_FWD_CFG(port->id),
>  					    FE_PSE_PORT_DROP);
> =20
> -	if (atomic_dec_and_test(&qdma->users)) {
> +	if (!--qdma->users) {
>  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
>  				  GLOBAL_CFG_TX_DMA_EN_MASK |
>  				  GLOBAL_CFG_RX_DMA_EN_MASK);

commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260611-airoha-ethtool-priv_flags-v5-0-c11d=
e08486d1%40kernel.org

- This is a pre-existing issue, but by not cleaning the TX queues when
  qdma->users > 0, does this leave the stopped device's packets in flight?
  When airoha_dev_stop() is called, it resets the device's BQL counters via
  netdev_tx_reset_subqueue(). By skipping the cleanup when other devices are
  still sharing this QDMA ring, any pending skbs originating from the stopp=
ed
  device are left to linger in the hardware TX ring.
  Because the hardware continues to process the shared ring on behalf of the
  remaining interfaces, the active NAPI poll will process their completions=
 in
  airoha_qdma_tx_napi_poll():
  		if (skb) {
  			struct netdev_queue *txq;
  			txq =3D skb_get_tx_queue(skb->dev, skb);
  			netdev_tx_completed_queue(txq, 1, skb->len);
  			dev_kfree_skb_any(skb);
  		}
  Can this cause an unsigned underflow in dql->num_queued since the BQL
  state was already reset to 0 by ndo_stop?

  - This issue is valid, but as pointed out by sashiko, this problem has not
    been introduced by this patch. In particular, I think we should remove
    netdev_tx_reset_subqueue() in airoha_dev_stop() and run
    netdev_tx_completed_queue() in airoha_qdma_cleanup_tx_queue(). We need =
to
    pay attention to not loop over already unregistered net_devices in
    airoha_qdma_cleanup_tx_queue() run from airoha_remove().
    I will post a dedicated patch for this issue.

- Also, if the device was being unregistered, unregister_netdev() frees the
  netdev memory without waiting for TX skbs (which do not hold a reference =
to
  dev). Could this lead to a use-after-free when dereferencing skb->dev her=
e?
  Should the driver selectively purge skbs belonging to the stopping netdev
  from the shared TX ring before ndo_stop returns?

  - I do not think this is a problem in the current codebase since the
    net_devices are unregistered just during module unload running
    airoha_remove() where we run airoha_qdma_stop_napi() to stop TX/RX NAPI=
s.

Regards,
Lorenzo

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 8f42973f9cf5..24fd8dcf7fca 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -526,7 +526,7 @@ struct airoha_qdma {
>  	struct airoha_eth *eth;
>  	void __iomem *regs;
> =20
> -	atomic_t users;
> +	int users;
> =20
>  	struct airoha_irq_bank irq_banks[AIROHA_MAX_NUM_IRQ_BANKS];
> =20
>=20
> --=20
> 2.54.0
>=20

--rA1nt1Ke2M6EpIQI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai0doQAKCRA6cBh0uS2t
rPw5AP0bXzC7m8pFe/TXyW0mJDSJ7LlmW/F5vmCXEWRsXm0p5AD+NMxXjFQRiFMJ
Swma4hlhBm01IUg5g8UJHcXa4s3jfAI=
=7mo2
-----END PGP SIGNATURE-----

--rA1nt1Ke2M6EpIQI--


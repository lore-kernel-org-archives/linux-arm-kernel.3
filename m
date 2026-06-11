Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED7CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67zy/OO6GQWRBTDkMhIuirY1PwgjkWuKrq96K18/+fE=; b=qODTz32UXihuNSE/DL8YrPvVVD
	yji9OqHXrLTW4Z5VgIAbyyMyw0sTm7YJ0huWPWXjbk/vRXUBxIvehqHV+VKBcbGyXZTwDQPRAvgK7
	ZLR6Qcw4/UpUjP2B8PdRwFh6TGZohtk/+jMwbqqCwvpNAH36FZDknSkeReHGpWjTzGuxvgI1EVhnG
	+GVZRovKAFTzFkncZZj42ZpS+9OOPJUynEpc7rSbPmhliBWRBt22VyaR+qVZysoxjhKrM4lVhma9A
	Kiun8+xx8q/edJ5t1l7BRVKHzFjTIFuuL0UOUguiF1Gca+/VfOcp0E+P/Kjg97R/95lQCXLkGvCUv
	YmKDPXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhEI-00000009flq-262v;
	Thu, 11 Jun 2026 15:22:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhEH-00000009flL-2HqR;
	Thu, 11 Jun 2026 15:22:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF4F0601E1;
	Thu, 11 Jun 2026 15:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8AB1F00893;
	Thu, 11 Jun 2026 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781191320;
	bh=67zy/OO6GQWRBTDkMhIuirY1PwgjkWuKrq96K18/+fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PnTtkqfEnRlAe9XW0BRr+WBX5P3w7ZUqQt3abKlffNJe2YiJL1KVRI04aV24lDwdz
	 C4HuHGlIGRjT/oWunnlUSxa1IJFIBwVrH6C9s3YofRcSGZ3lf8lfCDmMku6Fbsa5oU
	 LdVmDwYP50OAlUjXlvwKUjKMJqYn9wtPxUsviCUyfRtmWB9hTiVSAXC6LcJP9QFU1z
	 tCZNClSubswZhsJfG19qYVnR+7CRmtwZYS+K+MJb7ZYJXRkSR+mIz/riD7+9+bOH3j
	 gGRHAXcciQx+WE2/WUGJh2HCNvQaHaN7uOJ63eGAWuNEUc5NgESszEL2CtsfSoSXzF
	 99VyWTVdMyACw==
Date: Thu, 11 Jun 2026 17:21:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v4 1/2] net: airoha: refactor QDMA start/stop
 into reusable helpers
Message-ID: <airSlpMoBvcuRcK5@lore-desk>
References: <20260610-airoha-ethtool-priv_flags-v4-0-60e89cf28fea@kernel.org>
 <20260610-airoha-ethtool-priv_flags-v4-1-60e89cf28fea@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTiMez6xNLZ7OD9M"
Content-Disposition: inline
In-Reply-To: <20260610-airoha-ethtool-priv_flags-v4-1-60e89cf28fea@kernel.org>
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


--xTiMez6xNLZ7OD9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Factor out airoha_qdma_start() and airoha_qdma_stop() from
> airoha_dev_open() and airoha_dev_stop(). These helpers will be reused
> by the QDMA hot-migration logic introduced in the next patch to
> dynamically switch GDM3/GDM4 ports between LAN and WAN QDMA blocks.
> Add a DMA engine busy poll in airoha_qdma_stop() to wait for in-flight
> DMA transfers to complete before cleaning up TX queues.
>=20
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 53 ++++++++++++++++++++++----=
------
>  1 file changed, 36 insertions(+), 17 deletions(-)

Both of the issues reportd by sashiko here are not introduced by this patch
https://sashiko.dev/#/patchset/20260610-airoha-ethtool-priv_flags-v4-0-60e8=
9cf28fea%40kernel.org

Regards,
Lorenzo

>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5a8e84fa9918..aeac66df5f3b 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1771,6 +1771,40 @@ static void airoha_update_hw_stats(struct airoha_g=
dm_dev *dev)
>  	spin_unlock(&port->stats.lock);
>  }
> =20
> +static void airoha_qdma_start(struct airoha_qdma *qdma)
> +{
> +	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
> +			GLOBAL_CFG_TX_DMA_EN_MASK |
> +			GLOBAL_CFG_RX_DMA_EN_MASK);
> +	atomic_inc(&qdma->users);
> +}
> +
> +static void airoha_qdma_stop(struct airoha_qdma *qdma)
> +{
> +	u32 status;
> +
> +	if (!atomic_dec_and_test(&qdma->users))
> +		return;
> +
> +	airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> +			  GLOBAL_CFG_TX_DMA_EN_MASK |
> +			  GLOBAL_CFG_RX_DMA_EN_MASK);
> +
> +	if (read_poll_timeout(airoha_qdma_rr, status,
> +			      !(status & (GLOBAL_CFG_TX_DMA_BUSY_MASK |
> +					  GLOBAL_CFG_RX_DMA_BUSY_MASK)),
> +			      USEC_PER_MSEC, 50 * USEC_PER_MSEC, true,
> +			      qdma, REG_QDMA_GLOBAL_CFG))
> +		dev_warn(qdma->eth->dev, "QDMA DMA engine busy timeout\n");
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
> +		if (!qdma->q_tx[i].ndesc)
> +			continue;
> +
> +		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
> +	}
> +}
> +
>  static int airoha_dev_open(struct net_device *netdev)
>  {
>  	int err, len =3D ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
> @@ -1806,10 +1840,7 @@ static int airoha_dev_open(struct net_device *netd=
ev)
>  	}
>  	port->users++;
> =20
> -	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
> -			GLOBAL_CFG_TX_DMA_EN_MASK |
> -			GLOBAL_CFG_RX_DMA_EN_MASK);
> -	atomic_inc(&qdma->users);
> +	airoha_qdma_start(qdma);
> =20
>  	if (!airoha_is_lan_gdm_dev(dev) &&
>  	    airoha_ppe_is_enabled(qdma->eth, 1))
> @@ -1862,19 +1893,7 @@ static int airoha_dev_stop(struct net_device *netd=
ev)
>  		airoha_set_gdm_port_fwd_cfg(qdma->eth,
>  					    REG_GDM_FWD_CFG(port->id),
>  					    FE_PSE_PORT_DROP);
> -
> -	if (atomic_dec_and_test(&qdma->users)) {
> -		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> -				  GLOBAL_CFG_TX_DMA_EN_MASK |
> -				  GLOBAL_CFG_RX_DMA_EN_MASK);
> -
> -		for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
> -			if (!qdma->q_tx[i].ndesc)
> -				continue;
> -
> -			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
> -		}
> -	}
> +	airoha_qdma_stop(qdma);
> =20
>  	return 0;
>  }
>=20
> --=20
> 2.54.0
>=20

--xTiMez6xNLZ7OD9M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCairSlgAKCRA6cBh0uS2t
rBpSAPsERGWK1pGGToiFzIeR/RD8joMzAOFuAtARjMUbn3z89AEAv5JGguQL7ZxO
DrBnleDOjUsudpd92AZkknnf0TunDQg=
=4QHw
-----END PGP SIGNATURE-----

--xTiMez6xNLZ7OD9M--


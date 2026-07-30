Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123D0C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E40iejKfu9cGhaEtcYIJWerAgnZnDES8iawHbf3MzfE=; b=Tu9e4MAemo4TES736Cx5nD2ICN
	qSzgAAHvdOZ5bf/QBOOr0dAboKD3V+cZvFSNWOnWvEb5Q+wChcDCS5X8EHatrtmdAC/TFW7HqDgCI
	nnljEzLfPhAChS75+5Nn5gZO5FSyKC7lGPVM2bxroPT7mu/De1uPDpNU+DPvFGB5A82I889lZn/3w
	nIHqRJSnH8zAJO+s1xB3xUNkg6XoNRTSRLB4/G8XUAMG2t+mhrblMBSpk87YZeId8YDL6BHHYJRkf
	62dqLDUGtYodbzkidxXYX6IcefrMDM7GERPW2Gv73HuhGmyuT6dYj1XQf204Ie83NTUun2zP2RrnR
	3p0iIpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRSS-0000000Ai18-3iIn;
	Thu, 30 Jul 2026 14:10:00 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRSQ-0000000Ai0U-03uq;
	Thu, 30 Jul 2026 14:10:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A6C26202C4D;
	Thu, 30 Jul 2026 16:09:51 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wpRSJ-0023mQ-1p;
	Thu, 30 Jul 2026 16:09:51 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 46A05577064;
	Thu, 30 Jul 2026 14:09:51 +0000 (UTC)
Date: Thu, 30 Jul 2026 16:09:50 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
	Heiko Stuebner <heiko@sntech.de>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] can: rockchip_canfd: serialize TX state and
 command writes
Message-ID: <20260730-accelerated-ambitious-sparrow-44e187-mkl@pengutronix.de>
References: <20260730-master-v3-0-91cf030c337d@qq.com>
 <tencent_DF0D7ED74DEC340D32DF095A239B01238808@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djdjifzti4t4ojeh"
Content-Disposition: inline
In-Reply-To: <tencent_DF0D7ED74DEC340D32DF095A239B01238808@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070958_214336_9D979A12 
X-CRM114-Status: GOOD (  38.52  )
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


--djdjifzti4t4ojeh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] can: rockchip_canfd: serialize TX state and
 command writes
MIME-Version: 1.0

On 30.07.2026 21:48:40, Cunhao Lu wrote:
> The TX completion path removes an echo skb before advancing tx_tail. In
> parallel, the transmit path reads tx_head, tx_tail and the tail echo slot
> when applying the erratum 6 queue restriction. There is no synchronization
> between these operations.
>
> On SMP, the transmit path can consequently observe a pending frame with
> an empty echo slot:
>
>   rockchip_canfd fea60000.can can0: rkcanfd_tx_tail_is_eff:
>   echo_skb[0]=3DNULL tx_head=3D0x00060f7d tx_tail=3D0x00060f7c
>
> It can also keep a pointer to an echo skb while the completion path remov=
es
> and queues it for NAPI, where it can be freed on another CPU. The
> inconsistent snapshot can stop the netdev TX queue when there is no later
> completion to wake it.
>
> There is a second race in the command submission sequence.
> rkcanfd_start_xmit() runs in softirq context while rkcanfd_xmit_retry() is
> called from the RX interrupt handler. On controllers affected by erratum
> 12, both execute a MODE/CMD/MODE register sequence. The interrupt handler
> can restore the default MODE between the softirq writes, causing the
> resumed softirq to issue CMD without SPACE_RX_MODE and bypass the erratum
> 12 workaround.
>
> Add a TX state lock and use it to protect tx_head, tx_tail and the echo s=
kb
> ring as one state. The same lock serializes the MODE/CMD/MODE sequence
> between the transmit and interrupt paths. Keep the queue completion and
> wake operation outside the lock to avoid nesting the TX state lock with
> the netdev TX queue lock.
>
> Tested on an RK3588 rev2.2 at 1 Mbit/s with 100,000 extended CAN frames.
> The run triggered 138 erratum 6 retries and completed without drops, queue
> stalls or driver warnings. RK3588 does not enable erratum 12, so this test
> does not exercise that hardware workaround.
>
> Fixes: ae002cc32ec4 ("can: rockchip_canfd: prepare to use full TX-FIFO de=
pth")
> Fixes: 83f9bd6bf39d ("can: rockchip_canfd: implement workaround for errat=
um 12")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
>
> ---
> Changes in v3:
> - Adjust for the can_put_echo_skb() ownership change in patch 1; no
>   functional changes.
>
> Changes in v2:
> - Serialize the erratum 12 MODE/CMD/MODE sequence with the TX lock.
> - Add the erratum 12 commit to the Fixes tags.
> - Add RK3588 extended-frame stress-test results.
> ---
>  drivers/net/can/rockchip/rockchip_canfd-core.c |  1 +
>  drivers/net/can/rockchip/rockchip_canfd-rx.c   | 31 +++++++++++++++++++-=
------
>  drivers/net/can/rockchip/rockchip_canfd-tx.c   | 26 ++++++++++++++++++---
>  drivers/net/can/rockchip/rockchip_canfd.h      |  4 +++-
>  4 files changed, 50 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net=
/can/rockchip/rockchip_canfd-core.c
> index 29de0c01e4ed..c8257858b452 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -904,6 +904,7 @@ static int rkcanfd_probe(struct platform_device *pdev)
>  	priv->can.do_set_mode =3D rkcanfd_set_mode;
>  	priv->can.do_get_berr_counter =3D rkcanfd_get_berr_counter;
>  	priv->ndev =3D ndev;
> +	spin_lock_init(&priv->tx_lock);
>
>  	match =3D device_get_match_data(&pdev->dev);
>  	if (match) {
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/c=
an/rockchip/rockchip_canfd-rx.c
> index 475c0409e215..9f57a35672ed 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c
> @@ -99,15 +99,26 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *=
priv,
>  	struct rkcanfd_stats *rkcanfd_stats =3D &priv->stats;
>  	const struct canfd_frame *cfd_nominal;
>  	const struct sk_buff *skb;
> +	unsigned long flags;
>  	unsigned int tx_tail;

nitpick: please keep reverse xmas tree for variable declaration, move
flags to the end.

>
> +	spin_lock_irqsave(&priv->tx_lock, flags);
> +
> +	if (!rkcanfd_get_tx_pending(priv))
> +		goto out_unlock;
> +
>  	tx_tail =3D rkcanfd_get_tx_tail(priv);
>  	skb =3D priv->can.echo_skb[tx_tail];
>  	if (!skb) {
> +		const unsigned int tx_head =3D priv->tx_head;
> +		const unsigned int tx_tail_full =3D priv->tx_tail;

nitpick: As it's both the unmasked head and tail, please use the same
suffix for both.

> +
> +		spin_unlock_irqrestore(&priv->tx_lock, flags);
> +
>  		netdev_err(priv->ndev,
>  			   "%s: echo_skb[%u]=3DNULL tx_head=3D0x%08x tx_tail=3D0x%08x\n",
>  			   __func__, tx_tail,
> -			   priv->tx_head, priv->tx_tail);
> +			   tx_head, tx_tail_full);
>
>  		return -ENOMSG;
>  	}
> @@ -123,17 +134,18 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv=
 *priv,
>  		rkcanfd_handle_tx_done_one(priv, ts, &frame_len);
>
>  		WRITE_ONCE(priv->tx_tail, priv->tx_tail + 1);
> +		*tx_done =3D true;
> +
> +		spin_unlock_irqrestore(&priv->tx_lock, flags);
>  		netif_subqueue_completed_wake(priv->ndev, 0, 1, frame_len,
>  					      rkcanfd_get_effective_tx_free(priv),
>  					      RKCANFD_TX_START_THRESHOLD);
>
> -		*tx_done =3D true;
> -
>  		return 0;
>  	}
>
>  	if (!(priv->devtype_data.quirks & RKCANFD_QUIRK_RK3568_ERRATUM_6))
> -		return 0;
> +		goto out_unlock;
>
>  	/* Erratum 6: Extended frames may be send as standard frames.
>  	 *
> @@ -143,7 +155,7 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *=
priv,
>  	 */
>  	if (!(cfd_nominal->can_id & CAN_EFF_FLAG) ||
>  	    (cfd_rx->can_id & CAN_EFF_FLAG))
> -		return 0;
> +		goto out_unlock;
>
>  	/* Not affected if:
>  	 * - standard part and RTR flag of the TX'ed frame
> @@ -151,20 +163,20 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv=
 *priv,
>  	 */
>  	if ((cfd_nominal->can_id & (CAN_RTR_FLAG | CAN_SFF_MASK)) !=3D
>  	    (cfd_rx->can_id & (CAN_RTR_FLAG | CAN_SFF_MASK)))
> -		return 0;
> +		goto out_unlock;
>
>  	/* Not affected if:
>  	 * - length is not the same
>  	 */
>  	if (cfd_nominal->len !=3D cfd_rx->len)
> -		return 0;
> +		goto out_unlock;
>
>  	/* Not affected if:
>  	 * - the data of non RTR frames is different
>  	 */
>  	if (!(cfd_nominal->can_id & CAN_RTR_FLAG) &&
>  	    memcmp(cfd_nominal->data, cfd_rx->data, cfd_nominal->len))
> -		return 0;
> +		goto out_unlock;
>
>  	/* Affected by Erratum 6 */
>  	u64_stats_update_begin(&rkcanfd_stats->syncp);
> @@ -185,6 +197,9 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *=
priv,
>
>  	rkcanfd_xmit_retry(priv);
>
> +out_unlock:
> +	spin_unlock_irqrestore(&priv->tx_lock, flags);
> +
>  	return 0;
>  }
>
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/c=
an/rockchip/rockchip_canfd-tx.c
> index 2b5cd6aab31b..ff9d8b77499c 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
> @@ -14,6 +14,8 @@ static bool rkcanfd_tx_tail_is_eff(const struct rkcanfd=
_priv *priv)
>  	const struct sk_buff *skb;
>  	unsigned int tx_tail;
>
> +	lockdep_assert_held(&priv->tx_lock);
> +
>  	if (!rkcanfd_get_tx_pending(priv))
>  		return false;
>
> @@ -33,13 +35,22 @@ static bool rkcanfd_tx_tail_is_eff(const struct rkcan=
fd_priv *priv)
>  	return cfd->can_id & CAN_EFF_FLAG;
>  }
>
> -unsigned int rkcanfd_get_effective_tx_free(const struct rkcanfd_priv *pr=
iv)
> +unsigned int rkcanfd_get_effective_tx_free(struct rkcanfd_priv *priv)
>  {
> +	unsigned long flags;
> +	unsigned int tx_free;

nitpick: please use reverse xmas tree for the variables, move tx_free
first.

Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--djdjifzti4t4ojeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCamtbLAAKCRDMOmT6rpmt
0ksiAQD7vcEPzavi0oGiOx79XuJq7fuxdJDV9+CGtNjF7R1AAQEA3j7WKRRhizg/
j/lebtLFK4Lp3LtU5hqdjPUZFqPylwk=
=I9MM
-----END PGP SIGNATURE-----

--djdjifzti4t4ojeh--


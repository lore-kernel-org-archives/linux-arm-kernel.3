Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26111C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnBkPBk4OLT8MQGFrJ6i0u0CVF6Vr4oAm/iBnQDxR+8=; b=V4UF5Aaq4qx4izp59BL1/L2VjA
	He4UVwH3dKdTklREitD/P0cjd+l3inwJynnH/HrdcSODI52FLeavogm7lQdax/52Ajd371bwSAMIx
	pmHdAiXSuvXWqY83Hv0LVgIq9pQPGXSXW0OTj/zFnEW0yLJyOjZTShnHb6nmi+YJyKlQ5ddonYKq+
	Pk5yCF45NB8lUKnyMcXvfdFwYRyj1lZ5uhiYsjv3U3inoNHbsX5dIDlyMKWeGLQWDHVROzLEwECn5
	J/egTA+C9+ZR08+VkVzTqTg+/nXlJ+sfCh1yM5+KlE5qz5PAnyHiSV+hGmI449ODYToytbEbDxTr4
	2YRn5NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfxsC-00000008MLE-2Kr8;
	Sat, 04 Jul 2026 10:45:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfxsB-00000008ML3-11Gq;
	Sat, 04 Jul 2026 10:45:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 964FB41B56;
	Sat,  4 Jul 2026 10:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9291F00A3A;
	Sat,  4 Jul 2026 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161922;
	bh=NnBkPBk4OLT8MQGFrJ6i0u0CVF6Vr4oAm/iBnQDxR+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XF+QilTyXyoPJgfwrz6Cm5CQibEmlGu3x3/aNvcci9NCxrwt+Z97nK8JHcBWj6xhV
	 a7cHB9tnZRRy0/fAVuJ7yaNgRC1afHIMRaPAlhmRDrBP1yKhMRLuJ3BKk34cw0n7QS
	 0wk/Yc4Vr1chF8Z59v2zhuhZ81zgq4ShjQePxuW0g5uAvJnn71r3nf1avvUPbt6YGw
	 oRF3BCNHmngt/QO/AuTiSSAt9156RYcLNhyIcveewyoSeBDWDxnGtIszshykHo8A6p
	 KEbizcqK78LVa2xPgNevXvxzDJ6XjDnpTneD7oNf2129yYBlGcfYo0zh4AlpscTCeg
	 y+3H0fo+BjamQ==
Date: Sat, 4 Jul 2026 12:45:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
Message-ID: <akjkPSkj-EhZwOqV@lore-rh-laptop>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
 <20260703-airoha-ethtool-priv_flags-v8-2-015ba5ac89ee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yf76Qk7SaCTb5huQ"
Content-Disposition: inline
In-Reply-To: <20260703-airoha-ethtool-priv_flags-v8-2-015ba5ac89ee@kernel.org>
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


--yf76Qk7SaCTb5huQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_qdma_get_tx_ets_stats() has two bugs:
> - The hardware counters read via airoha_qdma_rr() are 32-bit values
>   but are stored in u64 locals and subtracted from u64 baselines. When
>   a 32-bit hardware counter wraps around, the subtraction produces a
>   large underflow value passed to _bstats_update().
> - The baseline counters (cpu_tx_packets, fwd_tx_packets) are stored as
>   single per-device fields, but airoha_qdma_get_tx_ets_stats() is
>   called with different channel values (0-3). Each call reads a
>   different channel's hardware counter but overwrites the same
>   baseline, corrupting the delta computation for other channels.
>=20
> Fix both by:
> - Narrowing the counter locals and baselines to u32 so that 32-bit
>   unsigned subtraction handles wrap-around naturally.
> - Grouping the baselines into a per-channel qos_stats array so each
>   channel tracks its own previous counter value independently.
> - Splitting the delta addition into two statements so the first u32
>   delta is widened to u64 on assignment and the second is added in
>   u64 arithmetic, preventing overflow when both deltas are large.
>=20
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260703-airoha-ethtool-priv_flags-v8-0-015b=
a5ac89ee%40kernel.org

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 18 +++++++++++-------
>  drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++---
>  2 files changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 41c1a0ffbdd8..aaf2a4717d12 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2482,16 +2482,20 @@ static int airoha_qdma_get_tx_ets_stats(struct ne=
t_device *netdev, int channel,
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
>  	struct airoha_qdma *qdma =3D dev->qdma;
> +	u32 cpu_tx_packets, fwd_tx_packets;
> +	u64 tx_packets;
> =20
> -	u64 cpu_tx_packets =3D airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
> -	u64 fwd_tx_packets =3D airoha_qdma_rr(qdma,
> -					    REG_CNTR_VAL((channel << 1) + 1));
> -	u64 tx_packets =3D (cpu_tx_packets - dev->cpu_tx_packets) +
> -			 (fwd_tx_packets - dev->fwd_tx_packets);
> +	cpu_tx_packets =3D airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
> +	fwd_tx_packets =3D airoha_qdma_rr(qdma,
> +					REG_CNTR_VAL((channel << 1) + 1));
> +	tx_packets =3D (u32)(cpu_tx_packets -
> +			   dev->qos_stats[channel].cpu_tx_packets);
> +	tx_packets +=3D (u32)(fwd_tx_packets -
> +			    dev->qos_stats[channel].fwd_tx_packets);
> =20
>  	_bstats_update(opt->stats.bstats, 0, tx_packets);
> -	dev->cpu_tx_packets =3D cpu_tx_packets;
> -	dev->fwd_tx_packets =3D fwd_tx_packets;
> +	dev->qos_stats[channel].cpu_tx_packets =3D cpu_tx_packets;
> +	dev->qos_stats[channel].fwd_tx_packets =3D fwd_tx_packets;
> =20
>  	return 0;

- This is a pre-existing issue, but I noticed the channel parameter passed =
to
  this function appears to be derived incorrectly in airoha_tc_setup_qdisc_=
ets().
  - As pointed out by sashiko, this issue has not been introduced by this p=
atch
    and I will fix it with a dedicated patch.

Regards,
Lorenzo

>  }
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index bf1c249255bd..bf44be9f0954 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -553,9 +553,10 @@ struct airoha_gdm_dev {
>  	struct airoha_eth *eth;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> -	/* qos stats counters */
> -	u64 cpu_tx_packets;
> -	u64 fwd_tx_packets;
> +	struct {
> +		u32 cpu_tx_packets;
> +		u32 fwd_tx_packets;
> +	} qos_stats[AIROHA_NUM_QOS_CHANNELS];
> =20
>  	u32 flags;
>  	int nbq;
>=20
> --=20
> 2.55.0
>=20

--yf76Qk7SaCTb5huQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakjkOQAKCRA6cBh0uS2t
rOwyAP9c051YcDtDM/Gaa544fnIX2nMDekt9RDZtNnmLQEMLyQD/aRfpgqP5VkHH
ahHrRBW6o0Gm4pl7hvpT1KNl9jspjgQ=
=lQnv
-----END PGP SIGNATURE-----

--yf76Qk7SaCTb5huQ--


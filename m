Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E456CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HPk8+YsOQqKlukslOqig0MS3VE3L+5Yg6OWF2ZMGn8=; b=glLzPLdPZ6w6eRMyP8PhxFO3t4
	Zo6qSvVqMwp1g7EKkkbnpo8/I/xeCLORe3ZD95ly1D9MzqhSuJJxrEW1kFZeq7sDPSr5PFJ5W2q4P
	Odhpi3m9JJJWppW9hzC+qCff0xxQG+76LyTVFm1/eu+GxPYQGxQfpL38J4NSBBBJ71GP8VSnF1vpj
	zNcvELg8jVe2iWiI57gcyCAIXIy0J1YsD41whBUPcKf+dkXZeyqYzrLbX+4hSAZvGpG1l06PKhZ/a
	r+VX2uDRsLqaP6dq9fQ2FytB6qx3eQ4YiZK2sPATnbzh9V/UAu0ilYEnSf9CbzjNYVN8+g94P8E33
	opkAUhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHVz-00000004WWI-1vyF;
	Thu, 02 Jul 2026 13:31:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHVx-00000004WW4-2P9i;
	Thu, 02 Jul 2026 13:31:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99DCA60120;
	Thu,  2 Jul 2026 13:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5B61F000E9;
	Thu,  2 Jul 2026 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782999096;
	bh=0HPk8+YsOQqKlukslOqig0MS3VE3L+5Yg6OWF2ZMGn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/RIu+kahcF183i9PsQbNfmJpGsLWoMRFzygjmp9ZBKn397N/v0SpKiLTMhwYFGep
	 d6mhTrCt6K0HZ0tbxVvt010eDIKRrI7PVL3ePaCQiYesURKzJyDsbGNGPjEGjjA41P
	 y68ko3+ChB/+vGEYX68SySMkI2H4XvFZl14m/jCO+quwpMMq0QiL6ovaF+TJAXGBIx
	 VDR4BLf5nfL1hERcGEOybAMxHH+oBzy5ckm9ktEc4AQOlnvujUJPhUBMermgEVwJRP
	 blOux97Y38AqiNh3xOgz4dHKFasyc29qsHmCHCaaoV9UiH4hQV1JVjPbPfgJzr0fyD
	 neNcPQZSD0Erw==
Date: Thu, 2 Jul 2026 15:31:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v7 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
Message-ID: <akZoNu-5JGv0eoyl@lore-desk>
References: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
 <20260701-airoha-ethtool-priv_flags-v7-2-b4153bd44428@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aiGdtKHDVLsOXAYb"
Content-Disposition: inline
In-Reply-To: <20260701-airoha-ethtool-priv_flags-v7-2-b4153bd44428@kernel.org>
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


--aiGdtKHDVLsOXAYb
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
>=20
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260701-airoha-ethtool-priv_flags-v7-0-b415=
3bd44428%40kernel.org

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 18 +++++++++++-------
>  drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++---
>  2 files changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 8bba54ebcf07..2c9ceb9f16f8 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2491,16 +2491,20 @@ static int airoha_qdma_get_tx_ets_stats(struct ne=
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
> +			   dev->qos_stats[channel].cpu_tx_packets) +
> +		     (u32)(fwd_tx_packets -
> +			   dev->qos_stats[channel].fwd_tx_packets);

- Will this addition overflow in 32-bit space before the result is assigned=
 to
  the 64-bit tx_packets?
  - I do not think this is a problem since we are just considering the delta
    betwen cpu_tx_packets/fwd_tx_packets and the previous value. Moreover, =
the
    u32 cast will take care of possible wrap-around.

> =20
>  	_bstats_update(opt->stats.bstats, 0, tx_packets);

- This isn't a bug introduced by this patch, but does calling _bstats_updat=
e()
  here directly from process context race with the software datapath?
  - Sashiko is right here. This is a pre-existing (theoretical) issue not
    introduced by this patch. However, since the Airoha EN7581/EN7583 is
    ARM64-only, u64_stats_update_begin/end are NOPs on this platform and
    there is no actual race. IIUC the seqcount corruption scenario only
    applies to 32-bit architectures. I guess we can=20

Regards,
Lorenzo

> -	dev->cpu_tx_packets =3D cpu_tx_packets;
> -	dev->fwd_tx_packets =3D fwd_tx_packets;
> +	dev->qos_stats[channel].cpu_tx_packets =3D cpu_tx_packets;
> +	dev->qos_stats[channel].fwd_tx_packets =3D fwd_tx_packets;
> =20
>  	return 0;
>  }
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 87ab3ea10664..ac5f571f3e53 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -545,9 +545,10 @@ struct airoha_gdm_dev {
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
> 2.54.0
>=20

--aiGdtKHDVLsOXAYb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakZoNgAKCRA6cBh0uS2t
rNc/AP9d+2YOP1S1SNyBHjNiFhBfuR8jv/9MDmMjZxCpFo7S2gD7BatNzmZ6nP1/
RIQIliLks6/sHt9qcjkyHXxERoiP3Qs=
=uGrz
-----END PGP SIGNATURE-----

--aiGdtKHDVLsOXAYb--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED3C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXRr0vMJv2NEmYtLVWvskxehewcxKuQFa+zT3/TfT3g=; b=YktymO/bzA2S8HAZ1TtnUxbdPc
	7TzDC8bSQzudGO7sSHtjsH/jVh6eU/PfOHy7Eg9CZFj26qvylE/1pVMXUJDHMn43VIqdTIDQTuNnW
	FhSkQgTMdvqpKQlwcZ/XSooeUJsgZ82RmIK2/fAVckZV+AC09j4faRYqRX2ycqZrqLHlbWc9Ks77v
	9MBOdjwjCrjA3juRe304zganga1cLTunmYTY4neZUInQPjVYARJXjuoVypUGdxW2qqAEyeSkiboJz
	2dkc2uImGa8cjGhQJVsylbWoHL9EzEvJ4NwfhcEj6vFm+Whr/5gUzTApKSsZQtgGt7C983Ac6Dopz
	LoPZ/b2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRSd-0000000B4UA-1CYy;
	Wed, 22 Jul 2026 07:33:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRSa-0000000B4Te-320W;
	Wed, 22 Jul 2026 07:33:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D329460A64;
	Wed, 22 Jul 2026 07:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CC01F000E9;
	Wed, 22 Jul 2026 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705623;
	bh=cXRr0vMJv2NEmYtLVWvskxehewcxKuQFa+zT3/TfT3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctqulXM+zEU87cc9+q+bk/CJSsTVSm27SbrgR2ocn6ckhVEIeLviYX4/su7ah3ZJd
	 nr9qOrNRWbTohPRKJkepB1Xovpz/ylJOO+DmxDb4zLqDWU7/cnve6XdTnnINdfEIk4
	 D1A5fjVFJoPTqwZMk14ylxpCtJJMvfhtGyWpu7drcozQBhUoPszIFXWGiJ051BzUVU
	 sl2Zyu47JYuGKLMhgO7Jx7H1vzmES3VWmN6U+fG2LMmX+kSX9sxl8I9S2apg2UqEWn
	 S3YYSTcZVrJ3L4J/2Paf6o2K7M5AIMH3g2KP3h67t4YY4+KATJI7sMt1ajHyaiAPsj
	 RqFfj9DwyEK7A==
Date: Wed, 22 Jul 2026 09:33:41 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v9 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
Message-ID: <amByVU4m8YuCphO2@lore-desk>
References: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
 <20260721-airoha-ethtool-priv_flags-v9-2-9c15d8b71a56@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2rgjgGmCcATn9c72"
Content-Disposition: inline
In-Reply-To: <20260721-airoha-ethtool-priv_flags-v9-2-9c15d8b71a56@kernel.org>
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

--2rgjgGmCcATn9c72
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
> Reviewed-by: Simon Horman <horms@kernel.org>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
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

commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260721-airoha-ethtool-priv_flags-v9-0-9c15=
d8b71a56%40kernel.org
- This is a pre-existing issue, but does calling _bstats_update() here from
  the netlink dump path (process context) without holding qdisc_lock() or
  disabling bottom-halves risk a seqcount deadlock?
  On 32-bit platforms, _bstats_update() uses a seqcount_t write lock via
  u64_stats_update_begin(). If this path is preempted by a softirq on the s=
ame
  CPU that updates the same shared opt->stats.bstats (e.g., during a softwa=
re
  packet dequeue), will the softirq spin forever attempting to acquire the
  same seqcount lock?
  - As pointed out by sashiko, this issue has not been introduced by this
    patch. Moreover, since airoha_eth is available just on 64bit system, I
    guess this is not a real issue.

Regards,
Lorenzo

> =20
>  	return 0;
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

--2rgjgGmCcATn9c72
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamByVQAKCRA6cBh0uS2t
rEeCAP9oauJEsmnW2DxM567A3ateWe95l4O9RA67X8/ppn06vwEAhEQQijbawDmV
M+opV8dtSOGZsMLViinpM3cZiPy5sA0=
=d7yO
-----END PGP SIGNATURE-----

--2rgjgGmCcATn9c72--


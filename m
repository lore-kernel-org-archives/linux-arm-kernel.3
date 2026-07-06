Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKty3BnTs9lhufSDTSMNeVknGjo/e/FTm30CuVSO0SE=; b=Yo/ZEzUzUxkWRABsh4LAdheMad
	12vWn/OGcxu9KSZEoxUOULpG6drbUHbnlzxjNzHgbRWGibxZisHq6ijlRuWnH5STMFFrwoltKniy4
	5SKd3H4exUm7zRIH/UGNvNjWR91Q5X1RTPcbiDzNAjfBZQsNr4QH5q+752iimiz7DUJz3Lcm13uOK
	97XgCmMDgN4LEUwJ0LTAv6HxViX0t1Fjx0flxasKOrl7nfFEdb0dlAwYYthCTJ3jVo5DcufF61dvH
	ZBLB9hSorwHCOhZFJCwxRPHbpGnQqTmDxpgyM6QXlmZ9+ykSGfpR3UqUJ1dxSWmeI/zpz7W1uDqXT
	zoJQus5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeIC-0000000Bm5c-1bwm;
	Mon, 06 Jul 2026 08:03:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeIB-0000000Bm5T-3tXq;
	Mon, 06 Jul 2026 08:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03F0F6138C;
	Mon,  6 Jul 2026 08:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DC91F000E9;
	Mon,  6 Jul 2026 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783324982;
	bh=GKty3BnTs9lhufSDTSMNeVknGjo/e/FTm30CuVSO0SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lu3lTHlD1sEPJOzpw5uK/YLPW1dXxZk+4SELaJIDe8m74CGxzqfdui8jqXQCtbT5m
	 1VpUmeusLoCmn46sNj/T9CCUUVcq9V0fNatnPkUZsbUQO8PSr+ERZg+RExYoi1Ys/n
	 /x0pmXR1gj3PDq9AGrqmPUJYrMHGeHth8tKrc2JRKgFE1DPIqZAfZbOaEXxlGl4piZ
	 jSnKx5oRLpCOC0kKkoQQmdL1zv32n0QrxXoaVbg2fS462y6ZcqVS767hUteUIt460K
	 IylqmFYraoGDgy4+6bgqUT70bNh648oW6YPktJGJtwrpzsXYeEJu1KDgMZn6P3w4Mr
	 Rlh6+/kt0ZYPQ==
Date: Mon, 6 Jul 2026 10:02:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: fix HTB class modification offload
Message-ID: <akthM-O5eea52MN6@lore-desk>
References: <178332096675.2250671.599544331813347302@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OZRxGIyhvtcgNsPb"
Content-Disposition: inline
In-Reply-To: <178332096675.2250671.599544331813347302@gmail.com>
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


--OZRxGIyhvtcgNsPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> HTB core does not populate parent_classid for TC_HTB_NODE_MODIFY.
> Airoha currently checks parent_classid against TC_HTB_CLASSID_ROOT
> in a helper shared by both TC_HTB_LEAF_ALLOC_QUEUE and
> TC_HTB_NODE_MODIFY. Since the modify path leaves parent_classid as
> zero, the check always fails and changing parameters of an already
> offloaded HTB class is rejected with -EINVAL.
>=20
> Move the root-parent check into the allocation path and validate
> modify requests using the per-netdev QoS channel bitmap, consistent
> with the delete and query paths.
>=20
> Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Wayen Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++-------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 59001fd4b6f7..8e4e79c1e4c2 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2766,18 +2766,13 @@ static int airoha_qdma_set_tx_rate_limit(struct n=
et_device *netdev,
>  	return 0;
>  }
> =20
> -static int airoha_tc_htb_modify_queue(struct net_device *dev,
> -				      struct tc_htb_qopt_offload *opt)
> +static int airoha_tc_htb_set_rate(struct net_device *dev,
> +				  struct tc_htb_qopt_offload *opt,
> +				  u32 channel)
>  {
> -	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
>  	u32 rate =3D div_u64(opt->rate, 1000) << 3; /* kbps */
>  	int err;
> =20
> -	if (opt->parent_classid !=3D TC_HTB_CLASSID_ROOT) {
> -		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
> -		return -EINVAL;
> -	}
> -
>  	err =3D airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
>  	if (err)
>  		NL_SET_ERR_MSG_MOD(opt->extack,
> @@ -2786,6 +2781,20 @@ static int airoha_tc_htb_modify_queue(struct net_d=
evice *dev,
>  	return err;
>  }
> =20
> +static int airoha_tc_htb_modify_queue(struct net_device *netdev,
> +				      struct tc_htb_qopt_offload *opt)
> +{
> +	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +
> +	if (!test_bit(channel, dev->qos_sq_bmap)) {
> +		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
> +		return -EINVAL;
> +	}
> +
> +	return airoha_tc_htb_set_rate(netdev, opt, channel);
> +}
> +
>  static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
>  					  struct tc_htb_qopt_offload *opt)
>  {
> @@ -2794,6 +2803,11 @@ static int airoha_tc_htb_alloc_leaf_queue(struct n=
et_device *netdev,
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
>  	struct airoha_qdma *qdma =3D dev->qdma;
> =20
> +	if (opt->parent_classid !=3D TC_HTB_CLASSID_ROOT) {
> +		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
> +		return -EINVAL;
> +	}
> +
>  	/* Here we need to check the requested QDMA channel is not already
>  	 * in use by another net_device running on the same QDMA block.
>  	 */
> @@ -2803,7 +2817,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct ne=
t_device *netdev,
>  		return -EBUSY;
>  	}
> =20
> -	err =3D airoha_tc_htb_modify_queue(netdev, opt);
> +	err =3D airoha_tc_htb_set_rate(netdev, opt, channel);
>  	if (err)
>  		goto error;
> =20
> --=20
> 2.51.0
>=20
>=20

--OZRxGIyhvtcgNsPb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakthMwAKCRA6cBh0uS2t
rCsVAP9ljiYxppsaJlJwomZ/UOwoDuMalWAJaceTn3CY52YtOAEAvEBOKojmVRKo
J73Vkun+MpMLw7kl/M1eNbTqkV5F+wA=
=T5aZ
-----END PGP SIGNATURE-----

--OZRxGIyhvtcgNsPb--


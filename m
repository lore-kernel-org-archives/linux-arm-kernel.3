Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C11DCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5CVllVNQ9Kpe6VIQJvaemTaWq1GKJ+TKsP+tPxBgLk=; b=KS0A8uxRn2fZHdTvi64dDV+nw1
	WcAsVN6fmUYFoIw8sy5CdvmBlclyGExyvncAKPSA45lKdv8EAwb4O7ot/Luf9MzqrjFqaNWDbOg8P
	REgo4A5ys1V1B+IMM3nSjw6qF9rVC88yBYeaG58+1CftPjlYM/lHPSKVz444I8VmROB/eT76Bsz7X
	+ZYLAxQSEVRYkHuynoBEVC/Y4zE5VQCIHue+zF14MaBVX2CPETEZynGbO79PVJ/Sp4jU/Oilxj+hn
	xqUOMa9SwNt7saUXEvv7E2BxVWwdsYM4tL+gMoYAIp62ArIiDY4p6cXtcEeVwnIQkEHC2AkA4iGWN
	EWQT/DGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7OW-00000000nDw-3U5v;
	Thu, 18 Jun 2026 07:42:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7OV-00000000nDm-2MLM;
	Thu, 18 Jun 2026 07:42:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FB8260098;
	Thu, 18 Jun 2026 07:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3081F000E9;
	Thu, 18 Jun 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781768554;
	bh=t5CVllVNQ9Kpe6VIQJvaemTaWq1GKJ+TKsP+tPxBgLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKqsGEQKUK5K7dsHa/8kzs97kdGQK+WjgGGTlr42bFFbNpyT4qTN4AHkvyGZjltUO
	 IXFCVh9NDPcsHDVfn1j8xKj5zU0x3L8s2PeLiIaq95fM/CXPupzcP8OieHp4r2NhRl
	 SprnQpXTabYWW0SZMBpaP9IUKP3qLDglqgCyHz4jbL8E0ORkgr5W5woPPpzAlQjClh
	 hS7YTg6DnW9Y5JI/5mDGCYQUSTXMSMMnLnZJHt3ExSjzZWhanwZtWEv8y9awaw9x+B
	 hSS2TxTFwenOl3BdgI1fU9+RlDJFveJvxUlBMJONrgt5gNSfQgELMlqeWy5arHiOse
	 tC7j5Lw+jxNqw==
Date: Thu, 18 Jun 2026 09:42:31 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Fix TX scheduler queue mask loop upper
 bound
Message-ID: <ajOhZ_P4c_mLcoaS@lore-desk>
References: <178166704952.2212140.11002626760717132754@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1OLx6VVIlAxSBQ6/"
Content-Disposition: inline
In-Reply-To: <178166704952.2212140.11002626760717132754@gmail.com>
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


--1OLx6VVIlAxSBQ6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
> using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).
>=20
> Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
> computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
> - channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
> - channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
> - channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
> - channel 3: clears bit 24..31 (channel 3 only) - correct by accident
>=20
> While BIT(32+) on arm64 produces 64-bit values truncated to 0 in u32
> mask parameter, the loop still incorrectly clears queues within the
> same channel beyond queue 7.
>=20
> Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.

I guess it is ok now if you respin this patch on top of net branch.
If so, please add my Acked-by.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..a1eda13400 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2217,7 +2217,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net=
_device *dev,
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
>  	int i;
> =20
> -	for (i =3D 0; i < AIROHA_NUM_TX_RING; i++)
> +	for (i =3D 0; i < AIROHA_NUM_QOS_QUEUES; i++)
>  		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
>  				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
> =20
> --=20
> 2.51.0
>=20
>=20

--1OLx6VVIlAxSBQ6/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajOhZwAKCRA6cBh0uS2t
rKNXAQDq70GBO1/bcUwI+mKYqgc4/CHuyCeneYknDmgabdAhQwEA5jjxhGCW0z3u
aAHDMX3I1sawxuvQToD49B8x1TgELgE=
=a8ge
-----END PGP SIGNATURE-----

--1OLx6VVIlAxSBQ6/--


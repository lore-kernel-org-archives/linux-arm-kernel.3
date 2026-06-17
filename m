Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439BCCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1oewAmKIOweGpwkRj7/2QKkESSIVukJ2iPbPD417jU=; b=j5HOw7608h0h3PX0nGlCHPeC0l
	/djUMMiOXQRrqMdrutzbVHncFlzoNhX9js08cMH3gnx9b5Dvm6c1orLZeJmd4XbR/8L2Qj++yIv0k
	c8Hbed4NfNe5+lNbWD2sp6cl3IAJaj9dSqP0nIWxjQO58agQ5MI8FVRc+XmedON/EIOZO1KwD7wUV
	E4yktgYmyWSH7fhgMi7Au/e2Rqe0X1lTpNBVSJhUxl1YVoyzX/Th5eLSLHfV31OnGHypFUmcJc+2I
	6tziEXrp/CkC8FRouZlmyBwxDWmWcVWI07ViZM3/dfAFBw8li6fExfWazyddgtXd78VCAbugxcYBZ
	9Fb4XmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkTD-0000000GnN5-1sQw;
	Wed, 17 Jun 2026 07:13:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkTC-0000000GnMp-0cdr;
	Wed, 17 Jun 2026 07:13:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A430403F5;
	Wed, 17 Jun 2026 07:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E511F000E9;
	Wed, 17 Jun 2026 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781680433;
	bh=x1oewAmKIOweGpwkRj7/2QKkESSIVukJ2iPbPD417jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcFrbHfyf+xRVfrLao6nlRPe/js6angNTvuPM5tKyuxdGQFVPAaXmxutbHqtwQlFg
	 5rw0fLb2BchNIffq038EJOvxETHgQ/ob9SVnoy6Wqo4e1+uJoqwpha9D6ukpZf7cg3
	 gtS4emT756CuPscYS3LiHPtw7Vn5XU+uAXCBT0o4bs8NwlBucyaiRPDugAeCTO62Vy
	 TKDWJVHwfC3f3JOc8qv2ZiLTh8CqbF6AkmR8z2M6NVl9MXu28yLFw5HZLJxr5DTrvx
	 K0Rhe+KnbEtEHqclTLMiLKeMqlJmnngZN9SOoFEymCrn74wmsLrxUByhhB0WCd/yG0
	 bQmYtug2OQHSg==
Date: Wed, 17 Jun 2026 09:13:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix off-by-one error in HTB rate-limit
 channel removal
Message-ID: <ajJJL06Wes9vPuvW@lore-desk>
References: <178166483303.2209640.10761097847073356089@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XWx7r5PR0vbIn/gZ"
Content-Disposition: inline
In-Reply-To: <178166483303.2209640.10761097847073356089@gmail.com>
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


--XWx7r5PR0vbIn/gZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_tc_remove_htb_queue(), the rate-limit was being cleared
> using (queue + 1) instead of queue, causing:
> - The original channel rate-limit configuration to remain active
> - The next channel to be incorrectly disabled
> - Potential out-of-bounds access when queue =3D=3D 3 (channel 4)
>=20
> The alloc path (airoha_tc_htb_alloc_leaf_queue) correctly uses
> channel (0..3), but the remove path incorrectly added 1.
>=20
> Fix by using queue directly to match the alloc and rollback paths.
>=20
> Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..02807b3967 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2805,7 +2805,7 @@ static void airoha_tc_remove_htb_queue(struct net_d=
evice *dev, int queue)
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
> =20
>  	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
> -	airoha_qdma_set_tx_rate_limit(dev, queue + 1, 0, 0);
> +	airoha_qdma_set_tx_rate_limit(dev, queue, 0, 0);
>  	clear_bit(queue, port->qos_sq_bmap);
>  }

Please hold on with this patch, I am aware of the bug and the fix is alread=
y in
my queue [0]. I am just waiting the net-next to be merged into net in order=
 to
avoid merge conflicts.

Regards,
Lorenzo

[0] https://github.com/LorenzoBianconi/net-next/commits/airoha-qos-fixes-fo=
r-net/

> =20
> --=20
> 2.51.0
>=20
>=20

--XWx7r5PR0vbIn/gZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajJJLwAKCRA6cBh0uS2t
rD7nAPoCb+zHRBgNK1OXNfE3oJB6ZsB3wGlp0uwMegk8VHZybAEAyc9hJ66vm9du
k+x4PfTwYQuMtWYGQ8SCRGCY7Ml3rAw=
=5sdU
-----END PGP SIGNATURE-----

--XWx7r5PR0vbIn/gZ--


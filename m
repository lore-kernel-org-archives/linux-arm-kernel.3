Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8921B108B8E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFWdB3FwBfyfIWsGA7nCcVqZ3vuwNZ2+K6hix07bwLY=; b=NUzx4ikp557CjGvdZDOlk05ndZ
	SgBBc37lh4rSal8u+voo4E/8+G35lbXkseIsippCmvZqpG4ejWrtNJBBiZwjU3Iczsb5erdxyKgYq
	yPQXZuPQs7hq8NWifaOQC9ElF+MfaWJcLgIJnHJpsz/hkaZBsCwkOeSs/HbCYlTqSwgfI1sKFS1vN
	4mCJtC2GBKWtMxxXCktQE18rPAs6keRixYdKX+T+57JsZcqFE05orhg3f3EmN9EoLPqTG/+vKhBRP
	jqmjXXMwlEGCykSAmx25eeX+h+7SLt2q2KKmGcEWHA9kIJB+cXgWlnhMftNHTI+MBctEcrCLNaMAa
	kzx7ijxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZ2-0000000CWTw-1ysZ;
	Fri, 20 Mar 2026 09:54:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZ0-0000000CWTm-27Lr;
	Fri, 20 Mar 2026 09:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 782B860126;
	Fri, 20 Mar 2026 09:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA73BC4CEF7;
	Fri, 20 Mar 2026 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000481;
	bh=Jl2syGIOY+PRgps6OcsmUhCbzfxV9LFWKi72pDr/B7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StLJ+aDpKTKw/NknAg2kJHhi9QTayNKMtfod/fIYsyuVvk5/tC5QEcdYdVwoIKFqc
	 BU9OOc5I/mHNjPAYG0mafc5o+E1AKW0Of588mtDfoRmP87Xua0UVD5GH5o4Ui3BvJb
	 0JVbJi3/gCwC6VXT30cUCu4a1F8FUMry6vc3kEwN6s7QrJMvQDg/l5EdIIDtCTr+Mq
	 SLVuW29jbjCaOt8WZLTyraAL+9DKNsqdl8Nd4/mI5UtQp4wVZ0UCMjQPEhDw8nSO+R
	 N02yJirk6Y4YT/id1yLJrs452LExaBqzyDocB9ZubvW6sGW1u50ZH6jSR60A4OCjXq
	 mqjdq1WQm/YNA==
Date: Fri, 20 Mar 2026 10:54:38 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2] net: airoha: add RCU lock around
 dev_fill_forward_path
Message-ID: <ab0ZXsDsU4y1MTvM@lore-desk>
References: <20260320094315.525126-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ZwJLIw+IKx6fh0d"
Content-Disposition: inline
In-Reply-To: <20260320094315.525126-1-dqfext@gmail.com>
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


--0ZwJLIw+IKx6fh0d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
> dev_fill_forward_path() should be called with RCU read lock held. This
> fix was applied to net, while the Airoha flowtable commit was applied to
> net-next, so it hadn't been an issue until net was merged into net-next.
>=20
> Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

My acked-by tag is still valid.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> v2: update fixes tag to the flowtable commit
>   - https://lore.kernel.org/netdev/20260319032649.337812-1-dqfext@gmail.c=
om/
>=20
>  drivers/net/ethernet/airoha/airoha_ppe.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index ec5ce41dad80..02deb739a1c7 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -227,7 +227,9 @@ static int airoha_ppe_get_wdma_info(struct net_device=
 *dev, const u8 *addr,
>  	if (!dev)
>  		return -ENODEV;
> =20
> +	rcu_read_lock();
>  	err =3D dev_fill_forward_path(dev, addr, &stack);
> +	rcu_read_unlock();
>  	if (err)
>  		return err;
> =20
> --=20
> 2.43.0
>=20

--0ZwJLIw+IKx6fh0d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCab0ZXgAKCRA6cBh0uS2t
rIHvAQD90h1oFpNB/bcKbl+OiAGcnrq7Sftw2sUNxiaPF+eHCQEA+5pfuDqzlv5O
7FsrkvEOxEwG4zAUe87AZPXpJz1mZQI=
=bKT5
-----END PGP SIGNATURE-----

--0ZwJLIw+IKx6fh0d--


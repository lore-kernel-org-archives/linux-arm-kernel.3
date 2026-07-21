Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FBDC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpgtcjbgH3z+lwL479Ib88f6w8bB6fgC+sF0EpQ5nkE=; b=V9WRwuPD5PwZWdRrVVC+7CXZ41
	kgow/HGUv0m5pymtrS9N/SfmqC9ArN7Dl+uAkk4qtOSgLzXemLekGHS9NWefrZdq3TRqA29Ci12OQ
	c8Vkyty873HMbb3opYYj7ympZSws+d/qGSlwOvTIr2u7FrNMsihqA9R2fw1VYsxt4mPm+Wr+ZrIHU
	jZmCL9gbATTiZeBzbuDUeDxN4Regg295ot4UcnKYB6/atXCf6dMF0JlZI6p015ZDwMuLsrt34pSV/
	roGzCZGTAZiyfK5EEi1VyG7/OdOLSHb0D/S7FLHltAMmqYAXQzWBMIHd03l3KotrItQE18quiLv6G
	w7oVJkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHmz-0000000AQzG-0e9H;
	Tue, 21 Jul 2026 21:14:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHmx-0000000AQyx-3sir;
	Tue, 21 Jul 2026 21:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC675600FC;
	Tue, 21 Jul 2026 21:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256481F00A3A;
	Tue, 21 Jul 2026 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784668446;
	bh=IpgtcjbgH3z+lwL479Ib88f6w8bB6fgC+sF0EpQ5nkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lu7YcpQvlQu3mXUvx5HhFP5yK29NipBWyHUyS/ghVr8yHYWRQCnJ59wRUjK+CUuTq
	 XfCe08zOt55jBrVE9931lXtTTWumF0aGV6ZCnnqNc5ApqrpkTiJ46r1RLzyrFxNil9
	 z2AmDBTG9ThayEJgSLlcdzyb8S/LtzpdEqb7ZWgAovExe/VoVi0uYqoFeOzey2n7LO
	 DCUzR6al47JY/LSli3+K0l2Yh+/6BER2oK4MszdCcci2RHuymabk/nz9CnmtjXanig
	 cmj2uOebjXZzFYYC0d47lhcSIs4NniPjpw9obnPdSYi86Q67LvD0ovKSGww+xYXfPa
	 +8YweE6imx9cg==
Date: Tue, 21 Jul 2026 23:14:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2] net: airoha: fix ETS channel derivation in
 airoha_tc_setup_qdisc_ets()
Message-ID: <al_hHDmQ0jfmckZh@lore-desk>
References: <20260720-airoha-ets-handle-fix-v2-1-6f7129ddc06f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9HKIFmPoaXqkTwAD"
Content-Disposition: inline
In-Reply-To: <20260720-airoha-ets-handle-fix-v2-1-6f7129ddc06f@kernel.org>
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

--9HKIFmPoaXqkTwAD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Derive the hardware QoS channel from opt->parent instead of opt->handle
> in airoha_tc_setup_qdisc_ets(). The ETS qdisc handle is either
> user-specified or auto-allocated by qdisc_alloc_handle() and bears no
> relation to the HTB leaf classid that identifies the hardware channel.
> HTB derives the channel from TC_H_MIN(opt->classid), and ETS is always
> attached as a child of an HTB leaf, so its opt->parent matches that
> classid. Using opt->handle instead can cause two ETS qdiscs on different
> HTB leaves to collide on the same hardware channel, corrupting scheduler
> configuration and stats.
>=20
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Rebase on top of net main branch
> - Link to v1: https://lore.kernel.org/r/20260704-airoha-ets-handle-fix-v1=
-1-42516b3549a1@kernel.org
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 59001fd4b6f7..fac2aaefffff 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2504,8 +2504,7 @@ static int airoha_tc_setup_qdisc_ets(struct net_dev=
ice *dev,
>  	if (opt->parent =3D=3D TC_H_ROOT)
>  		return -EINVAL;
> =20
> -	channel =3D TC_H_MAJ(opt->handle) >> 16;
> -	channel =3D channel % AIROHA_NUM_QOS_CHANNELS;
> +	channel =3D TC_H_MIN(opt->parent) % AIROHA_NUM_QOS_CHANNELS;
> =20
>  	switch (opt->command) {
>  	case TC_ETS_REPLACE:
>=20
> ---
> base-commit: e13caf1c26587434f0b768193100440939c0fb91
> change-id: 20260704-airoha-ets-handle-fix-6c166de3d396
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260720-airoha-ets-handle-fix-v2-1-6f7129dd=
c06f%40kernel.org

- This isn't a bug introduced by this patch, but I noticed a potential
  deadlock issue in airoha_update_hw_stats() in this same file.
  Does the use of a plain spin_lock() here leave the critical section
  vulnerable to softirq re-entrancy?
  - I do not think this is a real issue since airoha_update_hw_stats() can't
    run in softirq context.

Regards,
Lorenzo

--9HKIFmPoaXqkTwAD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCal/hHAAKCRA6cBh0uS2t
rHpVAQDoSaeJJgiMO+dfAiPzLV/tz/bqTE769wq89vWeXOijVAEA2MDZOX3/wC9U
et9XWnaEulJXCrO58U4dNN9LJToQqQA=
=MDOM
-----END PGP SIGNATURE-----

--9HKIFmPoaXqkTwAD--


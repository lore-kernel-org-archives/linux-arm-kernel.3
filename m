Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED0D2D11F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=to+rIAaUsFzHBBTw1pP8Vvw5y87DGsrmyZf6Qtijn4Q=; b=sL6ZONTvV9N0p9bYbzzZFz709r
	xF99r7F0n6FVB9pKhGhfbxGxe/CWWo9AdgRHXQYilz50Y39ktMfYwgHXmEd96ykoMoSyl3GFqSMmb
	FVoANK2ka20z1NwKyDWnLpyui+8jz+HgHs2OTK17bShQZcVDv+BfMLLsAF8d6CVBrzsFkQliECgEX
	FiIVgid4ksGrMEtg7KnWyekR5SfUuycmo6BEtoFEf/4SPUOjpDkaKkvRpRTuQQZ1tA2Mf3pRUP1/4
	QmqI+pOvqGxG9jNpvSn8OJ2vmnJJiDToA8fRVRw1MwSrreLGP0G46X+pPWf8KTDhP+FBa2Kd87j4l
	pnUwVi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffp8-00000007IlL-0KGZ;
	Tue, 13 Jan 2026 14:56:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffp4-00000007IkY-1au2;
	Tue, 13 Jan 2026 14:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7460F6000A;
	Tue, 13 Jan 2026 14:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4680C16AAE;
	Tue, 13 Jan 2026 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316201;
	bh=mddwGk9E211pqqLNC87BrcxRIxMRADenQX665fNT+nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQEy7znOEvUxQVJxKZIutih3qVH2s3AZ7kK6fZPcaUm9v3ikfbWiVeujHa7YYbOwf
	 HLkcSgTKMKZYjqRCgu4MtT2LzkWVtea1D0KE2bD3KXeCkWEP1ov/JAFQIki+qqS4yv
	 KQSJh4jbhl0E3RpHy4q1qlecCr6bqMgC6iVCuoXiCIMN4xX/D+65DxU47Xj7h/JHI2
	 +QpUSLZVdh4YQaS907kjL7ftjsMmPmyp8ZgmnmqMEosxO2u9caB21mCed5JEZfLz/E
	 SZX++KBa9Hj7Cxe1//y39fxHiELp6Bqet2nE7a0uK0igrZYrgiAZJAHYi/vGrua72Y
	 YawIfjvtPDD2g==
Date: Tue, 13 Jan 2026 15:56:38 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: airoha: implement get_link_ksettings
Message-ID: <aWZdJoELeXE4GtGY@lore-desk>
References: <20260110170212.570793-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F0XY5+WqgebaVLDU"
Content-Disposition: inline
In-Reply-To: <20260110170212.570793-1-olek2@wp.pl>
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


--F0XY5+WqgebaVLDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement the .get_link_ksettings to get the rate, duplex, and
> auto-negotiation status.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 315d97036ac1..00cae2833f09 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2803,6 +2803,7 @@ static const struct ethtool_ops airoha_ethtool_ops =
=3D {
>  	.get_drvinfo		=3D airoha_ethtool_get_drvinfo,
>  	.get_eth_mac_stats      =3D airoha_ethtool_get_mac_stats,
>  	.get_rmon_stats		=3D airoha_ethtool_get_rmon_stats,
> +	.get_link_ksettings	=3D phy_ethtool_get_link_ksettings,
>  	.get_link		=3D ethtool_op_get_link,
>  };

Tested-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

> =20
> --=20
> 2.47.3
>=20

--F0XY5+WqgebaVLDU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWZdJgAKCRA6cBh0uS2t
rFqnAP90urg3GOxbCoFAMqLCFB/L1q7Qs9YnOIYJFgJgDjGEOgEApHYGEt+vKXfJ
hqWzAes4qvKgR6IWh7zYpF5BMJQ3pAI=
=6pTG
-----END PGP SIGNATURE-----

--F0XY5+WqgebaVLDU--


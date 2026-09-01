Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCWCwhm5CYxFm5odxTdtkxLiQAyCBWHpnskP5L4+v2M=; b=WMgsRVfkFrhjUmnj3fNlmWDsve
	5iFc8mLHqGTqCvEeyhcoRiWu3WCw2kfccNEe2S63y61VsrcAAAQVMEneaTZrSbRc5brT/6z0XFwpT
	aOk1iGxGPtBy0HEUoBLo0iZm0c4L1D1xMnEEtNDq8DNU3jRSaWLzkCV+lo3znrhHIXknhLJ/KzGh3
	3wVvltrlnz48iVASrRmA38hCcSWPzWtVKYh3tjZkvjnDuJwO753NZlnT2Dgy+A4cmLM7XrGHLg8xq
	2ZsOvIDzZiXgnVgm7MRsyPatSMzoHanchWlCKoje0uE2VkgD+VfGJ/jrb6hnqphQz63qfCZJoFIh7
	JJz7LoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ipw-0000000B6xe-3X9G;
	Tue, 01 Sep 2026 07:23:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ipv-0000000B6x0-2JDT;
	Tue, 01 Sep 2026 07:23:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21400410AB;
	Tue,  1 Sep 2026 07:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA791F000E9;
	Tue,  1 Sep 2026 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247394;
	bh=qCWCwhm5CYxFm5odxTdtkxLiQAyCBWHpnskP5L4+v2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Utv80bzuMK0AJAjsG5eYLCc1gVmsJqVyUsZ3lAcLPta8DxQxhLUh1JQ50ZWyG7Oqd
	 elS3XtUkgbqz9vLtwUdgssbvf35teoGgTuBFPPPLs1LDAicf6rErM64xfs/+0vn+1e
	 0tbUiaaen9FvDZkzN6QcSs6jcVhnQ46S1Zu4icdMzTIFttRkhbtXOGV8IejiVK7pdM
	 6bXTiSD48lWewI9IttU2NlTghcbKJFxy+7Ck1Xdr2VOVDwYPzJqeH1QqedA6VZ/JIr
	 g3Fnb6SV2JFtwBVRl3a+hbfCAQeo7ym7MsFzylVlm8BBn4iSEIwNfzds3QL57mP9EZ
	 fTQiu80XXe56A==
Date: Tue, 1 Sep 2026 09:23:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: netdev@vger.kernel.org, upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] net: airoha: grow the small RX rings
Message-ID: <apZ9XxGHbyDBzSW_@lore-desk>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-4-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iSgGtsf6CDto9yfb"
Content-Disposition: inline
In-Reply-To: <20260831234701.206021-4-sochnev.v.74@gmail.com>
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

--iSgGtsf6CDto9yfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Raise the RX_DSCP_NUM() fallback from 16 to 32, the vendor SDK default,
> and give ring 4 the 128 descriptors already used for rings 2/11/15.
>=20
> Ring 4 is the shared "force to CPU" ring that airoha_fe_vip_setup()
> routes BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ISAKMP,
> DHCPv6, SIP and LLDP onto, so it sees the same bursty non-hashed traffic
> as the rings already on 128 while sitting on the smallest allowance.
>=20
> At 16 descriptors the completion stall handled by the previous patch is
> readily reachable: on a Nokia XG-040G-MF the recovery fires roughly every
> 35 s under repeated PPPoE dial-up, and negotiation never completes. At
> 128 it did not trigger once across 500 forced PPPoE reconnects over 20 h.
>=20
> Ring 4 and the VIP classification feeding it are shared driver-wide, with
> no DT or hardware property distinguishing one variant's ring 4 from
> another's, so this is not scoped to a particular SoC.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index c195dad5ed58..0b7c90940272 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -41,9 +41,10 @@
>  #define TX_DSCP_NUM			1024
>  #define RX_DSCP_NUM(_n)			\
>  	((_n) =3D=3D  2 ? 128 :		\
> +	 (_n) =3D=3D  4 ? 128 :		\
>  	 (_n) =3D=3D 11 ? 128 :		\
>  	 (_n) =3D=3D 15 ? 128 :		\
> -	 (_n) =3D=3D  0 ? 1024 : 16)
> +	 (_n) =3D=3D  0 ? 1024 : 32)
> =20
>  #define PSE_RSV_PAGES			128
>  #define PSE_QUEUE_RSV_PAGES		64
> --=20
> 2.55.0
>=20

--iSgGtsf6CDto9yfb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapZ9XwAKCRA6cBh0uS2t
rBTsAQC54xl85XXvmJfDDGnSxh3t76bdMZM9J3/7nroYJroTBgEAwWGjnbVtxJcr
V2ZoukEPId4WHAPImjFYCIq4MGWgjA0=
=FILA
-----END PGP SIGNATURE-----

--iSgGtsf6CDto9yfb--


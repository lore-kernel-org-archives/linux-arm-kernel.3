Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9/4BnN9TN80wFokR3YbL8LF+lakOjzWW/QdszOefXs=; b=JviYksJ4bb6On8fqpn+g86oqAw
	xPSm5UX+EiRSfXwQfnAIJvKxLYRK4Pa55J6j6zkOqxl4wcp3Xv8T8s/KWJYZ7Hl+0U7hQg0MahvYf
	KlUXjx+KJbDaxG6Imy0LOc5XR31e9CNqPmVgw6a0kP0DJHeAqYx0FQ8fXKiGnuYXfvzYrci2S67IM
	h77lX404yiUK1fgGzKZjICe6vE2iEExd5lrhfxey/ICa93s3tSoJiYTC5oZ3kQbsjBDQsuwTZKJ7H
	hDG4IAEKUnSHtZJlnR+3mO2nuB70t1zOmY1fFnidwbo40dt43H8cYmLkIqUWWkHiOJsXvxK6VDD8N
	aZMM82DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJlY-0000000C5bq-0wKO;
	Sat, 13 Jun 2026 08:30:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJlX-0000000C5bh-0VFO;
	Sat, 13 Jun 2026 08:30:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF5760018;
	Sat, 13 Jun 2026 08:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB84A1F000E9;
	Sat, 13 Jun 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781339453;
	bh=Q9/4BnN9TN80wFokR3YbL8LF+lakOjzWW/QdszOefXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+vHJFpJo9392/GlxlYmiZUtWtf+Zvqk6mTgfrdUtLbpTxvGZSzKUA9GJ5iX9XdaX
	 VDHQk5CDgzr0gKWLv3p+H9VL9oE8+KeJM6blwyRTHIcqa53zxEof7ZterACOOp6Zf6
	 unRreNdCbbIIm7U8QKk00cT+8D4WsuZ1gHL0Mstqsa+3ikT4Zl73HpB/kvhW2IpLfG
	 rqKlsC9GTM3GPAAoe8qNJg7GagYvdVuR8HAaW3wxbVsy3W2aW4TqAFf4e4hmhXyVQo
	 Z7B8zOLBcvrwhG713qJAmaLJOY1S1DbfdGl3ceBLkKOjP4TMnefUlXfCSRrgWhnhH1
	 kL3/6d1FYIzIA==
Date: Sat, 13 Jun 2026 10:30:49 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix typos in comments and Kconfig
Message-ID: <ai0VOeMCZYIfuOzR@lore-rh-laptop>
References: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64HGhJxIkxmRP3EZ"
Content-Disposition: inline
In-Reply-To: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
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


--64HGhJxIkxmRP3EZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fix several typos found during code review:
> - Kconfig: "Aiorha" -> "Airoha" in NET_AIROHA_FLOW_STATS help text
> - Comment: "CMD1" -> "CDM1" (Central DMA, not Command)
> - Comments: "GMD1/2/3/4" -> "GDM1/2/3/4" (Gigabit DMA, not GMD)
>=20
> These are pure comment and documentation fixes with no functional impact.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Wayen.Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/Kconfig      |  2 +-
>  drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/a=
iroha/Kconfig
> index ad3ce50..1f6640a 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -29,6 +29,6 @@ config NET_AIROHA_FLOW_STATS
>  	bool "Airoha flow stats"
>  	depends on NET_AIROHA && NET_AIROHA_NPU
>  	help
> -	  Enable Aiorha flowtable statistic counters.
> +	  Enable Airoha flowtable statistic counters.
> =20
>  endif #NET_VENDOR_AIROHA
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11..9d9d34a 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -294,18 +294,18 @@ static void airoha_fe_pse_ports_init(struct airoha_=
eth *eth)
>  			      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
>  	}
> =20
> -	/* CMD1 */
> +	/* CDM1 */
>  	for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)
>  		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, q,
>  					 PSE_QUEUE_RSV_PAGES);
> -	/* GMD1 */
> +	/* GDM1 */
>  	for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1]; q++)
>  		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, q,
>  					 PSE_QUEUE_RSV_PAGES);
> -	/* GMD2 */
> +	/* GDM2 */
>  	for (q =3D 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2]; q++)
>  		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, q, 0);
> -	/* GMD3 */
> +	/* GDM3 */
>  	for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3]; q++)
>  		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, q,
>  					 PSE_QUEUE_RSV_PAGES);
> @@ -340,7 +340,7 @@ static void airoha_fe_pse_ports_init(struct airoha_et=
h *eth)
>  							 q, 0);
>  		}
>  	}
> -	/* GMD4 */
> +	/* GDM4 */
>  	for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
>  		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM4, q,
>  					 PSE_QUEUE_RSV_PAGES);
> --=20
> 2.51.0
>=20
>=20

--64HGhJxIkxmRP3EZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai0VNgAKCRA6cBh0uS2t
rOoLAP9zD8rCmgmRGAbQK8MKUzVK5T4AKJTzQ6alW/rcKF3UEgEA01SqILqOnJw2
YHcDXCB9lRE0KlGXXENOLuexByhf7AQ=
=vr8q
-----END PGP SIGNATURE-----

--64HGhJxIkxmRP3EZ--


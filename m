Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E821BCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Oy424Sj0LX7AKqPFqDzgHyunoDhCO/BF75OQEB7OE0=; b=DbwADsci5n/zPDuF+fCkLLIaa/
	fm77TNx/nL51g+eorIWbiOpPy97WVz6Kz5sFrNIhMQtu1fhCW3xN9GMj5zkv7vZ4fVqLX7LqCMLVy
	yah6LIG52pIIpQ5n9uBhu0WxrWsWhBgsIVAgZypZBr9yfI7RLekX/wi2LysE75mxt9Bq0u3KQLhC6
	hH6h91arIn4vRBf6a5WYSMTrXqWw8xkysYwt51UPOh5qxJ/Mt3WmRHL9aeX38xyWCft9jscKtbJZN
	H908n7A3TwNeaXOEqRfEzEzYf4/JeTPYoOMK5klo6fdEQ7LmcWdzJrpfODE+6qzafaQr9weEc6IC3
	fnLdxOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT3E-0000000FlqC-41LR;
	Tue, 16 Jun 2026 12:37:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT3D-0000000Flq1-3noS;
	Tue, 16 Jun 2026 12:37:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 952ED42B32;
	Tue, 16 Jun 2026 12:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF36D1F000E9;
	Tue, 16 Jun 2026 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781613475;
	bh=5Oy424Sj0LX7AKqPFqDzgHyunoDhCO/BF75OQEB7OE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QelHVbWCr3gEApPJyMPVPZfr1zOnxFa2AJ38+NGqlCgR2V2XcPtb6cuYKEIa26PCc
	 YPtodlNOGuV0fWlOQrBtV7KZEpWwBX9LNHqsXWxIvpjOqQaU6fkQ/GXfV9yVpB6eYo
	 ozX7XbOHntXIMQC/AEpMU0TTbVt4uRnmyeaZLayUwT4MIlIApH5DoO5lZ8L0WODEyU
	 qEPyHopNUm2cXxCVkDX4m1/SBG6fYLIgSCb4VA+rLWE3S61MBlRXkB9iT5MnYD6VH/
	 6nObY1y9JseWsEMB834jDL6D7Cg4pFGrIRnDVhBRwWGDtN/7FCgBoEjyDSSoQfouF6
	 3WkngWTFRTD/w==
Date: Tue, 16 Jun 2026 14:37:53 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Stop TX queues on error path in
 airoha_dev_open
Message-ID: <ajFDoTBg3dyB2GRI@lore-desk>
References: <178161146875.2165143.7400860261990016053@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KjNXxW/DJwe/iA3u"
Content-Disposition: inline
In-Reply-To: <178161146875.2165143.7400860261990016053@gmail.com>
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


--KjNXxW/DJwe/iA3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
> netif_tx_start_all_queues() has been called, the TX queues remain
> started while the device configuration is incomplete. This leaves
> the device in an inconsistent state where packets could be
> transmitted before the VIP/IFC port configuration is complete.
>=20
> Add netif_tx_stop_all_queues() call on the error path to properly
> roll back the TX queue state.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..cf9c366907 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1715,8 +1715,10 @@ static int airoha_dev_open(struct net_device *dev)
> =20
>  	netif_tx_start_all_queues(dev);
>  	err =3D airoha_set_vip_for_gdm_port(port, true);
> -	if (err)
> +	if (err) {
> +		netif_tx_stop_all_queues(dev);

I do not think this is necessary since if ndo_open() callback fails, the
net_device is not marked as running.

Regards,
Lorenzo

>  		return err;
> +	}
> =20
>  	if (netdev_uses_dsa(dev))
>  		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
> --=20
> 2.51.0
>=20
>=20

--KjNXxW/DJwe/iA3u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajFDoQAKCRA6cBh0uS2t
rEAgAQDqk/81Cv2VNY0oTfDbvAQ5ag+hMIs4uuDX4yrwGwyhYQEApGYMF3uo83aZ
6wQByjRd9vAzTo8XFHg+hfIKjgRjggY=
=c3L7
-----END PGP SIGNATURE-----

--KjNXxW/DJwe/iA3u--


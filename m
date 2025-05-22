Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082FBC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDNZ1/5AJjf5kOMBXfOqbyU6hYSjjno4Ms29axljQwA=; b=KSJLozqKvQQyDiVYS8FVcn+Bu6
	7B9egQcgI5JWRX0s8WG3Qnlr3OG3nJCejadCF7HZhTgHoOxwOk79qKbwGbAM/+OPR5FS8nQ3weCiS
	zLnTS7bz9sFkqVxP4t4pcEaZAEMcNpmaHDpO2oh9k+0BQk9EJkTuN9vbcpdCf7FO/OfVIZN36oZfD
	Dk4j6PDO55jts7MO7VfZcinadl+vva3t9h7QNq+MjTZ4mmig++53MJ8a6GDMiLeXyfArNhund1N5a
	5jaC+BDmBa0iBpDzMFFDBHMy1sGjchK8iX+VcojVZ6qlm10vi6HAjl2DK3/Xd90BjxzkacinvlivQ
	00W2aFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI29p-00000000U8z-2x8O;
	Thu, 22 May 2025 09:24:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI27k-00000000TaW-1ZUu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:22:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI27g-0007W4-HV; Thu, 22 May 2025 11:21:56 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI27g-000iBx-0j;
	Thu, 22 May 2025 11:21:56 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4132941760F;
	Thu, 22 May 2025 09:21:55 +0000 (UTC)
Date: Thu, 22 May 2025 11:21:54 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20250522-arrogant-delicate-jaguar-ca53b6-mkl@pengutronix.de>
References: <20250522074616.3115348-1-zhangqing@rock-chips.com>
 <20250522074616.3115348-3-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ksituhnp66k25iih"
Content-Disposition: inline
In-Reply-To: <20250522074616.3115348-3-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_022200_412342_9ACEF1A8 
X-CRM114-Status: GOOD (  20.32  )
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


--ksituhnp66k25iih
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 22.05.2025 15:46:15, Elaine Zhang wrote:
> Is new controller:
> Support CAN and CANFD protocol.
> Support Dma.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---

Looking at the rkcanfd_probe() only for now.

>  static int rkcanfd_probe(struct platform_device *pdev)
>  {
>  	struct rkcanfd_priv *priv;
>  	struct net_device *ndev;
> +	struct resource *res;
>  	const void *match;
> -	int err;
> +	int err, val;
> =20
>  	ndev =3D alloc_candev(sizeof(struct rkcanfd_priv), RKCANFD_TXFIFO_DEPTH=
);
>  	if (!ndev)
> @@ -883,6 +1396,7 @@ static int rkcanfd_probe(struct platform_device *pde=
v)
>  		goto out_free_candev;
>  	}
> =20
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->regs)) {
>  		err =3D PTR_ERR(priv->regs);
> @@ -912,13 +1426,46 @@ static int rkcanfd_probe(struct platform_device *p=
dev)
>  	priv->can.do_set_mode =3D rkcanfd_set_mode;
>  	priv->can.do_get_berr_counter =3D rkcanfd_get_berr_counter;
>  	priv->ndev =3D ndev;
> +	priv->dev =3D &pdev->dev;
> =20
>  	match =3D device_get_match_data(&pdev->dev);
>  	if (match)
>  		priv->devtype_data =3D *(struct rkcanfd_devtype_data *)match;
> =20
> +	if (device_property_read_u32(&pdev->dev, "rockchip,auto-retx-cnt", &val=
))
> +		priv->auto_retx_cnt =3D 0;
> +	else
> +		priv->auto_retx_cnt =3D val;

What does "rockchip,auto-retx-cnt" do?

> +	if (priv->auto_retx_cnt > RK3576CANFD_RETX_TIME_LIMIT_CNT_MAX)
> +		priv->auto_retx_cnt =3D RK3576CANFD_RETX_TIME_LIMIT_CNT_MAX;
> +
> +	/* rx-max-data only 4 Words or 18 words are supported */
> +	if (device_property_read_u32_array(&pdev->dev, "rockchip,rx-max-data", =
&val, 1))
> +		priv->rx_max_data =3D 18;
> +	else
> +		priv->rx_max_data =3D val;

What does "rockchip,rx-max-data" do?

> +	if (priv->rx_max_data !=3D 4 && priv->rx_max_data !=3D 18) {
> +		priv->rx_max_data =3D 18;
> +		dev_warn(&pdev->dev, "rx_max_data is invalid, set to 18 words!\n");
> +	}
> +	priv->rx_fifo_depth =3D RK3576CANFD_SRAM_MAX_DEPTH / priv->rx_max_data;
> +
> +	priv->rxchan =3D dma_request_chan(&pdev->dev, "rx");
> +	if (IS_ERR(priv->rxchan)) {
> +		dev_warn(&pdev->dev, "Failed to request rxchan\n");
> +		priv->rxchan =3D NULL;
> +		priv->use_dma =3D 0;
> +	} else {
> +		priv->rx_dma_src_addr =3D res->start + RK3576CANFD_REG_RXFRD;
> +		priv->dma_size =3D priv->rx_max_data * 4;
> +		priv->use_dma =3D 1;
> +	}
> +	if (priv->use_dma)
> +		rk3576_canfd_dma_init(priv);
> +
>  	err =3D can_rx_offload_add_manual(ndev, &priv->offload,
> -					RKCANFD_NAPI_WEIGHT);
> +					MAX(RKCANFD_NAPI_WEIGHT, priv->rx_fifo_depth));
>  	if (err)
>  		goto out_free_candev;

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ksituhnp66k25iih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgu7K8ACgkQDHRl3/mQ
kZymsQgAjLdCzEB6HwCQxzQplmo4URWaMO82cOhALJZYjZD8yb1YNxk7EJGDXBnB
xA1aJ1HxA1R9ipDEpv9c0Yo+jgZ3eFwqSPis5raagKrOyXwJvrJjAi6ViVH7jAa6
txrTn/wkwoyhwMka8txzrHZXRLeWOXcKDXClGDG0eZSLIMlulkX5LqPSnvP13kzY
HtdA/QSiZKs96hGjSqfSSYZuRkEIVyNy6GntUsf6JHTmKBjCuTCG1QQKAhwedzs3
zkp762svGYVAhVeGzuc70F0Bx6Dk4Ec9A25VQ3n6Ekrs2Q7dOOHomHMhL05bf+Ri
gl2L7dJrBkqGsKgG/JYo/VUa8DjXNg==
=BNBH
-----END PGP SIGNATURE-----

--ksituhnp66k25iih--


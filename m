Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDA7CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yB2KodaRhciphXuq2O+NOyS/E2Vfs6dFfv6IdrrMO8=; b=Eo+sbeSoj6Emc16tMxl9rF8k17
	WcWcrdve5J80Zun4d7Nzx/KMcXNT2CDh1vR780CLRt9bGMhbmS0qRXj7WkBCKtqwZViHMvwynaMOh
	VqAIzl/IOPLJ1n6CRGCA2b4TZUaE1KSObRMDurOpRpncZfsYAlfqVMS+tOHwig5robHBWt+JDdrJH
	YcwLZeRYKlqCfkmT08PUoZTUwqP1z5Q/fFVzAr6rpljFsPTu5CtZuhn4057zOg+4DTPw5hkd17H5q
	biOdClH2zKrdOvsZ7biB65b7AlMizIkxATxFX86OB7wGjQx2go3PQa11wOpoIKkM3RptbAgm0s2MC
	+Yldsqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCByl-00000008RGV-3gsm;
	Fri, 24 Oct 2025 07:12:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCByi-00000008REo-09uO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:12:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vCByY-0005JQ-SP; Fri, 24 Oct 2025 09:12:38 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vCByY-005BdX-1J;
	Fri, 24 Oct 2025 09:12:38 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1041448E766;
	Fri, 24 Oct 2025 07:12:38 +0000 (UTC)
Date: Fri, 24 Oct 2025 09:12:36 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, broonie@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: imx: add 16/32 bits per word support for target mode
Message-ID: <20251024-berserk-stirring-copperhead-3783be-mkl@pengutronix.de>
References: <20251024054952.408393-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r54bjczvnfs4avxi"
Content-Disposition: inline
In-Reply-To: <20251024054952.408393-1-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_001248_096270_0B5EF187 
X-CRM114-Status: GOOD (  19.25  )
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


--r54bjczvnfs4avxi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] spi: imx: add 16/32 bits per word support for target mode
MIME-Version: 1.0

On 24.10.2025 13:49:52, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
>=20
> Now for ECSPI only support 8 bits per word in target mode.
> Enable 16/32 bits per word support for spi-imx target mode.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
>  drivers/spi/spi-imx.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 155ddeb8fcd4..4ffee6c5d5c4 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -424,8 +424,12 @@ static void spi_imx_buf_tx_swap(struct spi_imx_data =
*spi_imx)
> =20
>  static void mx53_ecspi_rx_target(struct spi_imx_data *spi_imx)
>  {
> -	u32 val =3D ioread32be(spi_imx->base + MXC_CSPIRXDATA);
> +	u32 val =3D readl(spi_imx->base + MXC_CSPIRXDATA);
> =20
> +	if (spi_imx->bits_per_word <=3D 8)
> +		val =3D be32_to_cpu(val);
> +	else if (spi_imx->bits_per_word <=3D 16)
> +		val =3D (val << 16) | (val >> 16);

You can use swahw32() here and below.

>  	if (spi_imx->rx_buf) {
>  		int n_bytes =3D spi_imx->target_burst % sizeof(val);
> =20
> @@ -453,12 +457,16 @@ static void mx53_ecspi_tx_target(struct spi_imx_dat=
a *spi_imx)
>  	if (spi_imx->tx_buf) {
>  		memcpy(((u8 *)&val) + sizeof(val) - n_bytes,
>  		       spi_imx->tx_buf, n_bytes);
> +		if (spi_imx->bits_per_word <=3D 8)
> +			val =3D cpu_to_be32(val);
> +		else if (spi_imx->bits_per_word <=3D 16)
> +			val =3D (val << 16) | (val >> 16);

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--r54bjczvnfs4avxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmj7JuAACgkQDHRl3/mQ
kZywGAf9EpnxKyFm5zj7bBWinIhgEplzFTJ/FDZo4dWMpa7KbrErAahd0sf0RQrF
BsYkuTMSHcJXJM1K3CEjMEE2ncXu88IRBysNvUD4Y0upyBYB4i8Agrlskcj51FKa
XuCFiyQqrAcHMgCBb0BrmL2t0Rkgu12TsUXWrqkANVSGVU5040XYwGVwNdlWOITX
9Rt9t5BP6Z8NPbdBt/1El4A/gspDIwmVzBVHR5TWFEwvSgtr8aU6v4AGkK0NoTtN
3kIYfHPkcA+CuFoeDdFi3lmWBu2XgV8+hEulBub/q5cKq0NBP9MvTzx1JXJ0i3MI
AN/MSFZDKRiNhAI0gzPa6bu/B49fxA==
=hn10
-----END PGP SIGNATURE-----

--r54bjczvnfs4avxi--

